enum AuthProvider { apple, google, facebook, email }

class RegisterModel {
  // Authentication states
  AuthProvider? _currentProvider;
  bool _isAuthenticating = false;
  String? _errorMessage;

  // Getters
  AuthProvider? get currentProvider => _currentProvider;
  bool get isAuthenticating => _isAuthenticating;
  String? get errorMessage => _errorMessage;

  // Business logic methods
  void setAuthenticating(AuthProvider provider, bool value) {
    _isAuthenticating = value;
    _currentProvider = value ? provider : null;
    if (!value) {
      _errorMessage = null;
    }
  }

  void setError(String message) {
    _errorMessage = message;
    _isAuthenticating = false;
    _currentProvider = null;
  }

  void clearError() {
    _errorMessage = null;
  }

  // Validation methods
  bool canAuthenticateWith(AuthProvider provider) {
    return !_isAuthenticating && _errorMessage == null;
  }

  bool isProviderSupported(AuthProvider provider) {
    // Business rule: all providers are supported for now
    return true;
  }

  // Authentication status
  String getAuthenticationStatus() {
    if (_isAuthenticating && _currentProvider != null) {
      switch (_currentProvider!) {
        case AuthProvider.apple:
          return 'Signing up with Apple...';
        case AuthProvider.google:
          return 'Signing up with Google...';
        case AuthProvider.facebook:
          return 'Signing up with Facebook...';
        case AuthProvider.email:
          return 'Preparing email registration...';
      }
    }
    return '';
  }

  // Reset all states
  void reset() {
    _currentProvider = null;
    _isAuthenticating = false;
    _errorMessage = null;
  }
}
