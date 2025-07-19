class SettingsController {
  String userName = "John Doe";
  String email = "j.doe@gmail.com";
  bool iCloudSync = false;
  String securityMethod = "FaceID";
  String sortingMethod = "Date";
  String summaryType = "Average";
  String defaultCurrency = "Syrian Pound (SP)";
  String appIcon = "Default";
  String themeMode = "Dark";

  void toggleICloudSync() {
    iCloudSync = !iCloudSync;
  }

  void updateSecurityMethod(String method) {
    securityMethod = method;
  }

  void updateSortingMethod(String method) {
    sortingMethod = method;
  }

  void updateSummaryType(String type) {
    summaryType = type;
  }

  void updateDefaultCurrency(String currency) {
    defaultCurrency = currency;
  }

  void updateAppIcon(String icon) {
    appIcon = icon;
  }

  void updateThemeMode(String theme) {
    themeMode = theme;
  }
}
