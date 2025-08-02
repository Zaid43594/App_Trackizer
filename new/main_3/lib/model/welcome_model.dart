class WelcomeModel {
  // Navigation states
  bool _isNavigatingToRegister = false;
  bool _isNavigatingToLogin = false;

  // Getters
  bool get isNavigatingToRegister => _isNavigatingToRegister;
  bool get isNavigatingToLogin => _isNavigatingToLogin;

  // Business logic methods
  void setNavigatingToRegister(bool value) {
    _isNavigatingToRegister = value;
  }

  void setNavigatingToLogin(bool value) {
    _isNavigatingToLogin = value;
  }

  // Validation and business rules
  bool canNavigateToRegister() {
    return !_isNavigatingToRegister && !_isNavigatingToLogin;
  }

  bool canNavigateToLogin() {
    return !_isNavigatingToRegister && !_isNavigatingToLogin;
  }

  // Reset navigation states
  void resetNavigationStates() {
    _isNavigatingToRegister = false;
    _isNavigatingToLogin = false;
  }
}
