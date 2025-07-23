class DayModel {
  final String day;
  final String label;
  final bool isActive;

  DayModel({
    required this.day,
    required this.label,
    this.isActive = false,
  });
}
