import '0-util.dart';

Future<void> usersCount() async {
  int count = await fetchUsersCount(); // Wait for result
  print(count); // Print the result
}
