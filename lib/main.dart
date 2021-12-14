import 'package:aldo_shop/providers/auth_provider.dart';
import 'package:aldo_shop/providers/cart_provider.dart';
import 'package:aldo_shop/providers/product_provider.dart';
import 'package:aldo_shop/providers/transaction_provider.dart';
import 'package:aldo_shop/providers/wishlist_product.dart';
import 'package:aldo_shop/screens/cart_page.dart';
import 'package:aldo_shop/screens/checkout_page.dart';
import 'package:aldo_shop/screens/checkout_success_page.dart';
import 'package:aldo_shop/screens/detail_chat_page.dart';
import 'package:aldo_shop/screens/edit_profile_page.dart';
import 'package:aldo_shop/screens/home/main_page.dart';
import 'package:aldo_shop/screens/product_page.dart';
import 'package:aldo_shop/screens/sign_in_page.dart';
import 'package:aldo_shop/screens/sign_up_page.dart';
import 'package:aldo_shop/screens/splash_page.dart';
import 'package:aldo_shop/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider(),),
        ChangeNotifierProvider(create: (context) => productProvider()),
        ChangeNotifierProvider(create: (context) => WishlistProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => TransactionProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/detail-chat': (context) => DetailChatPage(),
          '/edit-profile': (context) => EditProfilePage(),
          // '/product': (context) => ProductPage(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout-success': (context) => CheckoutSuccessPage()
        },
      ),
    );
  }
}
