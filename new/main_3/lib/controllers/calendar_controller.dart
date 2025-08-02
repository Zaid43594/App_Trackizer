import 'package:trackizer/core/constants/image_paths.dart';
import 'package:trackizer/model/day_model.dart';

class CalendarController {
  List<DayModel> getDays() {
    return [
      DayModel(day: "01", label: "Mon", isActive: true),
      DayModel(day: "02", label: "Tue", isActive: false),
      DayModel(day: "03", label: "Wed", isActive: false),
      DayModel(day: "04", label: "Thu", isActive: false),
      DayModel(day: "05", label: "Thu", isActive: false),
      DayModel(day: "06", label: "Thu", isActive: false),
      DayModel(day: "07", label: "Thu", isActive: false),
      DayModel(day: "08", label: "Thu", isActive: false),
      DayModel(day: "09", label: "Thu", isActive: false),
      DayModel(day: "10", label: "Thu", isActive: false),
      DayModel(day: "11", label: "Thu", isActive: false),
      DayModel(day: "12", label: "Thu", isActive: false),
    ];
  }

  List<String> getMonths() => [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December",
      ];

  List<Map<String, dynamic>> getSubscriptions() => [
        {
          'name': 'Spotify',
          'price': '55.99 SP',
          'image': ImagePaths.spotify,
        },
        {
          'name': 'YouTube',
          'price': '29.99 SP',
          'image': ImagePaths.youtube,
        },
        {
          'name': 'MicroSoft',
          'price': '99.00 SP',
          'image': ImagePaths.onedrive
        },
      ];
}
