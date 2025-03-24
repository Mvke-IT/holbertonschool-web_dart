class Password {
  String? _password;

  String get password => _password ?? '';

  set password(String password) => _password = password;

  Password({String? password}) : _password = password;

  bool isValid() {
    if (_password == null) return false;
    int length = _password!.length;
    if (length <= 6 || length >= 18) return false;

    bool hasLowercase = _password!.contains(RegExp(r'[a-z]'));
    bool hasUppercase = _password!.contains(RegExp(r'[A-Z]'));
    bool hasDigit = _password!.contains(RegExp(r'\d'));

    return hasLowercase && hasUppercase && hasDigit;
  }

  @override
  String toString() {
    return "Your Password is: $_password";
  }
}

class User {
  final int id;
  final String name;
  final int age;
  final double height;
  final Password password;

  User({
    required this.id,
    required this.name,
    required this.age,
    required this.height,
    required String user_password,
  }) : password = Password(password: user_password);

  String get user_password => password.password;

  set user_password(String newPassword) => password.password = newPassword;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'height': height,
      };

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as String,
        age = json['age'] as int,
        height = json['height'] as double,
        password = Password(password: json['user_password'] as String?);

  @override
  String toString() =>
      "User(id: $id, name: $name, age: $age, height: $height, Password: ${password.isValid()})";
}
