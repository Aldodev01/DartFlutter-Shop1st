// !Request ke backend
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:aldo_shop/models/card_model.dart';

class TransactionService {
  String baseUrl = "https://shamo-backend.buildwithangga.id/api";

// Totalprice akan ditambahkan melalui cart provider
// Tipe Future bool
  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    var url = '${baseUrl}/checkout}';
    var header = {'Content-Type': 'application/json', 'Authorization': token};

    var body = jsonEncode({
      'address': 'Marsemoon',
      'items': carts
          .map((cart) => {
                'id': cart.product!.id,
                'quantity': cart.quantity,
              })
          .toList(),
      'status': 'PENDING',
      'totalPrice': totalPrice,
      'shipping_price': 10
    });

    var response = await http.post(Uri.parse(url), body: body, headers: header);

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      print(response.body);
      throw Exception('Failed to checkout');
    }
  }
}

// TODO: .toList karna tipe datanya List