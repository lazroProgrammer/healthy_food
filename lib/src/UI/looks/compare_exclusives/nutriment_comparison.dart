import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:healthy_food/src/data%20classes/open_food_pub/nutriment.dart';

class NutrimentComparisonTable extends StatelessWidget {
  NutrimentComparisonTable(
      {super.key, required this.item1, required this.item2});
  final List<NutrimentHandler> item1;
  final List<NutrimentHandler> item2;
  final List<Color> colors = [Colors.red, Colors.green];
  @override
  Widget build(BuildContext context) {
    // Assuming 'nutrients' is a list of nutrients inside NutrimentHandler
    final combinedNutrients = <String, Map<String, dynamic>>{};

    // Retrieve nutrients from item1 (assuming item1 has a list called 'nutrients')
    for (var nutrient in item1) {
      combinedNutrients[nutrient.label] = {
        'item1Value': nutrient.value.toString(),
        'item1Unit': nutrient.unit,
        'item1Good': nutrient.isGood,
        "conversion": nutrient.conversionRate,
        'item2Value': null,
        'item2Unit': null,
        'item2Good': null,
      };
    }

    // Retrieve nutrients from item2 (assuming item2 has a list called 'nutrients')
    for (var nutrient in item2) {
      if (combinedNutrients.containsKey(nutrient.label)) {
        combinedNutrients[nutrient.label]!['item2Value'] = nutrient.value;
        combinedNutrients[nutrient.label]!['item2Unit'] = nutrient.unit;
      } else {
        combinedNutrients[nutrient.label] = {
          'item1Value': null,
          'item1Unit': null,
          'item1Good': null,
          "conversion": nutrient.conversionRate,
          'item2Value': nutrient.value.toString(),
          'item2Unit': nutrient.unit,
          'item2Good': nutrient.isGood,
        };
      }
    }

    return DataTable(
      columns: [
        DataColumn(label: Text(AppLocalizations.of(context)!.nutrient)),
        DataColumn(label: Text("value1")),
        DataColumn(label: Text("value2")),
        DataColumn(label: Text(AppLocalizations.of(context)!.unit)),
      ],
      rows: combinedNutrients.entries.map((entry) {
        return DataRow(cells: [
          DataCell(Text(entry.key)), // Nutrient label
          DataCell(Text(
            entry.value['item1Value'] != null
                ? "${entry.value['item1Value']} ${entry.value['item1Unit']}"
                : 'N/A',
            style: TextStyle(
                color: (entry.value["item1Good"] == null ||
                        (double.parse(entry.value['item1Value']) -
                                    double.parse(entry.value['item2Value']))
                                .abs() <=
                            entry.value["conversion"])
                    ? Colors.grey
                    : (entry.value['item1Good'] == true &&
                                double.parse(entry.value['item1Value']) >=
                                    double.parse(entry.value['item2Value']) ||
                            double.parse(entry.value['item1Value']) <=
                                    double.parse(entry.value['item2Value']) &&
                                !entry.value['item1Good'])
                        ? colors[1]
                        : colors[0]),
          )), // Value from item1 or 'N/A'
          DataCell(Text(
            entry.value['item2Value'] != null
                ? "${entry.value['item2Value']} ${entry.value['item2Unit']}"
                : 'N/A',
            style: TextStyle(
                color: (entry.value["item1Good"] == null ||
                        (double.parse(entry.value['item1Value']) -
                                    double.parse(entry.value['item2Value']))
                                .abs() <=
                            entry.value["conversion"])
                    ? Colors.grey
                    : (entry.value['item1Good'] == true &&
                                double.parse(entry.value['item2Value']) >
                                    double.parse(entry.value['item1Value']) ||
                            double.parse(entry.value['item1Value']) >=
                                    double.parse(entry.value['item2Value']) &&
                                !entry.value['item1Good'])
                        ? colors[1]
                        : colors[0]),
          )), // Value from item2 or 'N/A'
          DataCell(Text(entry.value['item1Unit'] ??
              entry.value['item2Unit'] ??
              '')) // Display unit
        ]);
      }).toList(),
    );
  }
}
