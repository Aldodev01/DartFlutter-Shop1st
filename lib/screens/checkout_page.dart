import 'package:aldo_shop/providers/auth_provider.dart';
import 'package:aldo_shop/providers/cart_provider.dart';
import 'package:aldo_shop/providers/transaction_provider.dart';
import 'package:aldo_shop/widgets/checkout_card.dart';
import 'package:flutter/material.dart';
import 'package:aldo_shop/theme.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatelessWidget {
  Widget content(context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleCheckout() async {
      if (await transactionProvider.checkout(authProvider.user.token.toString(),
          cartProvider.carts, cartProvider.totalPrice())) {
        cartProvider.carts = [];
        Navigator.pushNamedAndRemoveUntil(
            context, '/checkout-success', (route) => false);
      }
    }

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      children: [
        // TODO: LIST ITEMS
        SizedBox(
          height: 12,
        ),
        Container(
          margin: EdgeInsets.only(top: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "List Items",
                style:
                    primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              Column(
                  children: cartProvider.carts
                      .map((cart) => CheckoutCard(cart: cart))
                      .toList())
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: defaultMargin),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: backgroundColor4,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Address Details',
                style:
                    primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/icon_store_location.png",
                        width: 40,
                      ),
                      Image.asset(
                        "assets/icon_line.png",
                        height: 30,
                      ),
                      Image.asset(
                        "assets/icon_your_address.png",
                        width: 40,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Store Location",
                        style: secondaryTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: light,
                        ),
                      ),
                      Text(
                        "Adidas Core",
                        style: primaryTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                      SizedBox(
                        height: defaultMargin,
                      ),
                      Text(
                        "Your Address",
                        style: secondaryTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: light,
                        ),
                      ),
                      Text(
                        "Marsemoon",
                        style: primaryTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),

        //TODO: PAYMENT SUMMARY
        Container(
          margin: EdgeInsets.only(top: defaultMargin),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: backgroundColor4,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Payment Summary",
                style:
                    primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Product Quantity",
                    style: secondaryTextStyle.copyWith(fontSize: 12),
                  ),
                  Text(
                    '${cartProvider.totalItems()} Items',
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Product Price",
                    style: secondaryTextStyle.copyWith(fontSize: 12),
                  ),
                  Text(
                    '\$${cartProvider.totalPrice()}',
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shipping",
                    style: secondaryTextStyle.copyWith(fontSize: 12),
                  ),
                  Text(
                    '\$${10}',
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Divider(
                thickness: 1,
                color: Color(0xff2E3141),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: priceTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    '\$${cartProvider.totalPrice() + 10}',
                    style: priceTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        // TODO: CHECKOUT BUTTON
        SizedBox(
          height: defaultMargin,
        ),
        Divider(
          thickness: 1,
          color: Color(0xff2E3141),
        ),
        Container(
          height: 50,
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: defaultMargin),
          child: TextButton(
            onPressed: handleCheckout,
            style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            child: Text("Checkout Now",
                style: primaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: semiBold)),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Checkout Details",
        ),
      ),
      body: content(context),
    );
  }
}
