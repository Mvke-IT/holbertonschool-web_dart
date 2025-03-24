class Password {
  String? _password;

  String get password => _password ?? '';

  set password(String password) => _password = password;

  Password({String? password}) : _password = password;

  bool isValid() {
    if ((this._password?.length ?? 0) > 6 &&
        (this._password?.length ?? 0) < 18) {
      if (this._password!.contains(RegExp(r"(?=.*[a-z])(?=.*[A-Z])\w+"))) {
        if (this._password!.contains(RegExp(r'\d'))) {
          return true;
        }
      }
    }
    return false;
  }

  @override
  String toString() {
    return "Your Password is: ${this._password}";
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
      "User(id : $id ,name: $name, age: $age, height: $height, Password: ${password.isValid()})";
}
