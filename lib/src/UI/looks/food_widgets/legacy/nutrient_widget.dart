import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:healthy_food/src/data%20classes/nutriment.dart';

class NutrientTableWidget extends StatefulWidget {
  final List<Nutriment> nutrients;

  const NutrientTableWidget({super.key, required this.nutrients});

  @override
  State<NutrientTableWidget> createState() => _NutrientTableWidgetState();
}

class _NutrientTableWidgetState extends State<NutrientTableWidget> {
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
      columns: [
        DataColumn(label: Text(AppLocalizations.of(context)!.nutrient)),
        DataColumn(label: Text(AppLocalizations.of(context)!.value)),
        DataColumn(label: Text(AppLocalizations.of(context)!.unit)),
      ],
      rows: widget.nutrients.map((nutrient) {
        return DataRow(cells: [
          DataCell(Text((names.isEmpty)
              ? nutrient.name
              : names[nutrient.name] ?? "name not found")),
          DataCell(Text(nutrient.value.toString())),
          DataCell(Text(nutrient.unit)),
        ]);
      }).toList(),
    );
  }
}
