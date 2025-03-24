import '6-password.dart'; // Import Password class

class User extends Password {
  int id;
  String name;
  int age;
  double height;
  String _userPassword; // Private property to manage user_password correctly

  // Constructor
  User({
    required this.id,
    required this.name,
    required this.age,
    required this.height,
    required String user_password,
  })  : _userPassword = user_password,
        super(password: user_password); // Pass password to Password class

  // Getter for `user_password`
  String get user_password => _userPassword;

  // Setter for `user_password` (Ensures both `user_password` and `_password` are updated)
  set user_password(String newPassword) {
    _userPassword = newPassword; // Updates `user_password`
    super.password = newPassword; // Updates `_password` in `Password` class
  }

  // Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'height': height,
    };
  }

  // Create User object from JSON
  static User fromJson(Map<dynamic, dynamic> userJson) {
    return User(
      id: userJson['id'] ?? 0,
      name: userJson['name'] ?? "Unknown",
      age: userJson['age'] ?? 0,
      height: userJson['height'] ?? 0.0,
      user_password: userJson['user_password'] ?? "", // Null check
    );
  }

  // Override toString() to show password validation
  @override
  String toString() {
    return "User(id : $id ,name: $name, age: $age, height: $height, Password: ${isValid()})";
  }
}
