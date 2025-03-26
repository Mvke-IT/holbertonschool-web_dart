import 'dart:convert';
import '1-util.dart';

Future<String> getUserId() async {
  final String userData = await fetchUserData();
  final Map<String, dynamic> userMap = jsonDecode(userData);
  return userMap['id'];
}