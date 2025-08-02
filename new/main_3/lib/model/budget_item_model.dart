class BudgetItemModel {
  final String label;
  final double spent;
  final double total;

  BudgetItemModel({
    required this.label,
    required this.spent,
    required this.total,
  });

  factory BudgetItemModel.fromJson(Map<String, dynamic> json) {
    return BudgetItemModel(
      label: json['name'],
      spent: double.parse(json['spent'].toString()),
      total: double.parse(json['limit_amount'].toString()),
    );
  }
}
