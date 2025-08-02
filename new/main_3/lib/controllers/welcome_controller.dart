import '../features/welcome/model/welcome_model.dart';

class WelcomeController {
  final WelcomeModel _model = WelcomeModel();

  // Getters for the view to access model state
  WelcomeModel get model => _model;

  // Business logic methods
  bool canNavigateToRegister() {
    return _model.canNavigateToRegister();
  }

  bool canNavigateToLogin() {
    return _model.canNavigateToLogin();
  }

  void prepareNavigationToRegister() {
    if (canNavigateToRegister()) {
      _model.setNavigatingToRegister(true);
    }
  }

  void prepareNavigationToLogin() {
    if (canNavigateToLogin()) {
      _model.setNavigatingToLogin(true);
    }
  }

  void completeNavigation() {
    _model.resetNavigationStates();
  }

  // Business validation
  bool isValidForNavigation() {
    return _model.canNavigateToRegister() || _model.canNavigateToLogin();
  }
}
