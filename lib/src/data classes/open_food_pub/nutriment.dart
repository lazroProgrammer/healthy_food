class NutrimentHandler {
  final String label; // e.g., 'Energy', 'Proteins'
  final String unit; // e.g., 'kJ', 'g'
  final String value; // e.g., '500', '12.5'
  final bool? isGood;
  final double? conversionRate;

  NutrimentHandler(
      {required this.label,
      required this.unit,
      required this.value,
      required this.isGood,
      required this.conversionRate});
}
