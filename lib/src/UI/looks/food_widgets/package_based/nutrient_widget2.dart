import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:healthy_food/src/Notifiers/settings_notifier.dart';
import 'package:healthy_food/src/data%20classes/open_food_pub/nutriment.dart';
import 'package:healthy_food/src/data%20classes/open_food_pub/product.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//TODO: show green and red values in tables in order to show if the nutrient level is good (DONE BETTER)
class NutrientTableWidget2 extends ConsumerStatefulWidget {
  final List<NutrimentHandler> nutrients;

  const NutrientTableWidget2({super.key, required this.nutrients});

  @override
  ConsumerState<NutrientTableWidget2> createState() =>
      _NutrientTableWidgetState();
}

class _NutrientTableWidgetState extends ConsumerState<NutrientTableWidget2> {
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
    final dark = ref.watch(darkmodeNotifier);
    names = {
      "carbohydrates": AppLocalizations.of(context)!.carbohydrates,
      "energy": AppLocalizations.of(context)!.energy,
      "energy KCal": AppLocalizations.of(context)!.energy_kcal,
      "energy KJ": AppLocalizations.of(context)!.energy_kj,
      "fat": AppLocalizations.of(context)!.fat,
      "fiber": AppLocalizations.of(context)!.fiber,
      "proteins": AppLocalizations.of(context)!.proteins,
      "saturated Fat": AppLocalizations.of(context)!.saturated_fat,
      "sugars": AppLocalizations.of(context)!.sugars,
      "salt": AppLocalizations.of(context)!.salt,
      "sodium": AppLocalizations.of(context)!.sodium,
      "calcium": AppLocalizations.of(context)!.calcium,
      "potassium": AppLocalizations.of(context)!.potassium,
      "iron": AppLocalizations.of(context)!.iron,
      "cholesterol": AppLocalizations.of(context)!.cholesterol,
      "vitamin A": AppLocalizations.of(context)!.vitamin_A,
      "vitamin B": AppLocalizations.of(context)!.vitamin_B,
      "vitamin C": AppLocalizations.of(context)!.vitamin_C,
      "vitamin D": AppLocalizations.of(context)!.vitamin_D,
      "vitamin B12": AppLocalizations.of(context)!.vitamin_B12,
    };
    return (widget.nutrients.isEmpty)
        ? Center(
            child: Text("Nutriment data is missing"),
          )
        : DataTable(
            headingRowColor:
                WidgetStateColor.resolveWith((Set<WidgetState> states) {
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
                    return ProductHandler.getNutrientGradientColor(
                        nutrient.label, double.parse(nutrient.value), dark);
                  }),
                  cells: [
                    DataCell(Text((names.isEmpty)
                        ? nutrient.label
                        : names[nutrient.label] ?? nutrient.label)),
                    DataCell(
                        Text("${nutrient.value.toString()}${nutrient.unit}")),
                    // DataCell(Text(nutrient.unit)),
                  ]);
            }).toList(),
          );
  }
}
