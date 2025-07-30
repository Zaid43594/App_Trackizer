import 'package:get/get.dart';
import '../Services/ProfileAPI.dart';
import '../model/profile_model.dart';

class SettingsController extends GetxController {
  var userName = ''.obs;
  var email = ''.obs;
  var imageUrl = ''.obs;
  var isLoading = true.obs;

  var iCloudSync = false.obs;
  var securityMethod = "FaceID".obs;
  var sortingMethod = "Date".obs;
  var summaryType = "Average".obs;
  var defaultCurrency = "Syrian Pound (SP)".obs;
  var appIcon = "Default".obs;
  var themeMode = "Dark".obs;

  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }

  Future<void> loadProfile() async {
    try {
      final List<ProfileModel> profileData = await ProfileService.fetchProfile();

      if (profileData.isNotEmpty) {
        final firstProfile = profileData[0];
        userName.value = firstProfile.name;
        email.value = firstProfile.number;
        imageUrl.value = firstProfile.imageUrl;
      }
    } catch (e) {
      print("Error loading profile: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void toggleICloudSync() {
    iCloudSync.value = !iCloudSync.value;
  }

  void updateSecurityMethod(String method) {
    securityMethod.value = method;
  }

  void updateSortingMethod(String method) {
    sortingMethod.value = method;
  }

  void updateSummaryType(String type) {
    summaryType.value = type;
  }

  void updateDefaultCurrency(String currency) {
    defaultCurrency.value = currency;
  }

  void updateAppIcon(String icon) {
    appIcon.value = icon;
  }

  void updateThemeMode(String theme) {
    themeMode.value = theme;
  }
}
