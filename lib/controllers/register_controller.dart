
import 'package:trackizer/features/welcome/model/register_model.dart';

class RegisterController {
  final RegisterModel _model = RegisterModel();

  // Getters for the view to access model state
  RegisterModel get model => _model;

  // Business logic methods
  bool canAuthenticateWith(AuthProvider provider) {
    return _model.canAuthenticateWith(provider) &&
        _model.isProviderSupported(provider);
  }

  void startAuthentication(AuthProvider provider) {
    if (canAuthenticateWith(provider)) {
      _model.setAuthenticating(provider, true);
    }
  }

  void completeAuthentication() {
    _model.setAuthenticating(_model.currentProvider!, false);
  }

  void handleAuthenticationError(String errorMessage) {
    _model.setError(errorMessage);
  }

  void clearError() {
    _model.clearError();
  }

  // Business validation
  bool isAuthenticating() {
    return _model.isAuthenticating;
  }

  String getCurrentStatus() {
    return _model.getAuthenticationStatus();
  }

  // Reset state
  void reset() {
    _model.reset();
  }
}
