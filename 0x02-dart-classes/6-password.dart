class Password {
  String _password;

  String get password => _password;

  set password(String password) => _password = password;

  Password({String? password}) : _password = password ?? '';

  bool isValid() {
    int length = _password.length;
    if (length <= 6 || length >= 18) return false;

    bool hasLowercase = _password.contains(RegExp(r'[a-z]'));
    bool hasUppercase = _password.contains(RegExp(r'[A-Z]'));
    bool hasDigit = _password.contains(RegExp(r'\d'));

    return hasLowercase && hasUppercase && hasDigit;
  }

  @override
  String toString() {
    return "Your Password is: $_password";
  }
}
