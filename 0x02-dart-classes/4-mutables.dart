class Password {
  // Private property
  String _password = "";



  // Constructor
  Password({required String password}) {
    _password = password;
  }



  // Getter
  String get password => _password;



  // Setter for password with validation
  set password(String newPassword) {
    if (newPassword.length >= 8 && newPassword.length <= 16) {
      _password = newPassword;
    } else {
      print("Error: Password must be between 8 and 16 characters.");
    }
  }


  // Check if the password is valid
  bool isValid() {
    return _password.length >= 8 &&
           _password.length <= 16 &&
           _password.contains(RegExp(r'[A-Z]')) && // At least one uppercase
           _password.contains(RegExp(r'[a-z]')) && // At least one lowercase
           _password.contains(RegExp(r'[0-9]'));   // At least one number
  }

  

  // Override toString method
  @override
  String toString() {
    return "Your Password is: $_password";
  }
}
