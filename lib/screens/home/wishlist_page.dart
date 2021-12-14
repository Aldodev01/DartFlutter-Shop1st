import 'package:aldo_shop/providers/wishlist_product.dart';
import 'package:aldo_shop/theme.dart';
import 'package:aldo_shop/widgets/wishlist_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text('Favorite Shoes'),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyWishlist() {
      return Expanded(
          child: Container(
        width: double.infinity,
        color: backgroundColor3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image_wishlist.png',
              width: 74,
            ),
            SizedBox(
              height: 23,
            ),
            Text(
              'You Don\'t Have Dream Shoes ?',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Let\'s Find Your Favorite Shoes',
              style: secondaryTextStyle,
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 44,
              child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: Text(
                    'Explore Store',
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  )),
            )
          ],
        ),
      ));
    }

    Widget content() {
      return Expanded(
        child: Container(
          color: backgroundColor3,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin
            ),
            children: wishlistProvider.wishlist.map((e) => WishlistCard(e)).toList(),
          ),
        )
      );
    }

    return Column(
      children: [
        header(), 
        content(),
        wishlistProvider.wishlist.length == 0 ? emptyWishlist() : content()
        // emptyWishlist()
      ],
    );
  }
}
