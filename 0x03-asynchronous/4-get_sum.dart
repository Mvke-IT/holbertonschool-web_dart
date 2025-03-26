import 'dart:convert';
import '4-util.dart';

Future<double> calculateTotal() async {
  try {
    // Step 1: Get user data and decode
    final String userData = await fetchUserData();
    final Map<String, dynamic> userMap = jsonDecode(userData);
    final String userId = userMap['id'];

    // Step 2: Get user orders and decode
    final String ordersJson = await fetchUserOrders(userId);
    final List<dynamic> orders = jsonDecode(ordersJson);

    // Step 3: Fetch each product price and accumulate total
    double total = 0;
    for (final product in orders) {
      final String priceJson = await fetchProductPrice(product);
      final double price = jsonDecode(priceJson).toDouble(); // will throw if null or invalid
      total += price;
    }

    return total;
  } catch (e) {
    return -1;
  }
}
