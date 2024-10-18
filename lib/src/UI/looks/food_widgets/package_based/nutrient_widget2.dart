import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:healthy_food/src/data%20classes/open_food_pub/nutriment.dart';

//TODO: show green and red values in tables in order to show if the nutrient level is good
class NutrientTableWidget2 extends StatefulWidget {
  final List<NutrimentHandler> nutrients;

  const NutrientTableWidget2({super.key, required this.nutrients});

  @override
  State<NutrientTableWidget2> createState() => _NutrientTableWidgetState();
}

class _NutrientTableWidgetState extends State<NutrientTableWidget2> {
  Map<String, String> names = {};

  @override
  void initState() {
    super.initState();
    // if (Localizations.localeOf(context) == const Locale("ar")) {

    // } else {
    // names = {};
    // }
  }

  @override
  Widget build(BuildContext context) {
    names = {
      // "carbohydrates": AppLocalizations.of(context)!.carbohydrates,
      // "energy": AppLocalizations.of(context)!.energy,
      // "energy-kcal": AppLocalizations.of(context)!.energy_kcal,
      // "energy-kj": AppLocalizations.of(context)!.energy_kj,
      // "fat": AppLocalizations.of(context)!.fat,
      // "fiber": AppLocalizations.of(context)!.fiber,
      // "proteins": AppLocalizations.of(context)!.proteins,
      // "saturated-fat": AppLocalizations.of(context)!.saturated_fat,
      // "sugars": AppLocalizations.of(context)!.sugars,
      // "salt": AppLocalizations.of(context)!.salt,
      // "sodium": AppLocalizations.of(context)!.sodium,
    };
    return DataTable(
      headingRowColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
        return Colors.grey;
      }),
      columns: [
        DataColumn(label: Text(AppLocalizations.of(context)!.nutrient)),
        DataColumn(label: Text(AppLocalizations.of(context)!.value_100)),
        // DataColumn(label: Text(AppLocalizations.of(context)!.unit)),
      ],
      rows: widget.nutrients.map((nutrient) {
        return DataRow(
            color: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
              return (nutrient.isGood == null)
                  ? Colors.grey
                  : (nutrient.isGood!)
                      ? Colors.green
                      : Colors.red;
            }),
            cells: [
              DataCell(Text((names.isEmpty)
                  ? nutrient.label
                  : names[nutrient.label] ?? "name not found")),
              DataCell(Text("${nutrient.value.toString()}${nutrient.unit}")),
              // DataCell(Text(nutrient.unit)),
            ]);
      }).toList(),
    );
  }
}
