import 'package:logger/logger.dart';

class Nutriment {
  final String name;
  final double value;
  final String unit;

  Nutriment({
    required this.name,
    required this.value,
    required this.unit,
  });

  // Factory method to create a Nutriment from JSON
  factory Nutriment.fromJson(String key, Map<String, dynamic> json) {
    // Check if the key is relevant and exists in the json
    if (isRelevantNutrient(key) && json.containsKey(key)) {
      return Nutriment(
        name: _cleanNutrientName(key),
        value: (json[key] is num
            ? json[key].toDouble()
            : double.tryParse(json[key].toString()) ?? 0.0),
        unit: json['${key}_unit'] ?? '',
      );
    } else {
      Logger().e('Ignored or missing nutrient key: $key');
      throw ArgumentError('Irrelevant or missing nutrient key: $key');
    }
  }

  // Filter out irrelevant nutrient keys
  static bool isRelevantNutrient(String key) {
    return !key.contains('_100g') &&
        !key.contains('_unit') &&
        !key.contains('_value') &&
        !key.contains('_serving') &&
        !key.contains('label') &&
        !key.contains('nova-group') &&
        !key.contains('nutri');
  }

  // Clean up nutrient names by removing suffixes
  static String _cleanNutrientName(String key) {
    return key
        .replaceAll('-100g', '')
        .replaceAll('-unit', '')
        .replaceAll('-value', '');
  }

  // Convert Nutriment to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'value': value,
      'unit': unit,
    };
  }

  @override
  String toString() {
    return "name: $name, value: $value $unit";
  }
}
