import 'dart:convert';
import '3-util.dart';

Future<String> greetUser() async {
  try {
    final String userData = await fetchUserData();
    final Map<String, dynamic> userMap = jsonDecode(userData);
    return 'Hello ${userMap['username']}';
  } catch (e) {
    return 'error caught: $e';
  }
}

Future<String> loginUser() async {
  try {
    bool hasUser = await checkCredentials();
    print('There is a user: $hasUser');

    if (hasUser) {
      return await greetUser();
    } else {
      return 'Wrong credentials';
    }
  } catch (e) {
    return 'error caught: $e';
  }
}
