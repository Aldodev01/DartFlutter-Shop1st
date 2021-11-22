import 'package:aldo_shop/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List images = [
    'assets/image_shoes.png',
    'assets/image_shoes2.png',
    'assets/image_shoes3.png',
    'assets/image_shoes4.png',
  ];

  List familiarShoes = [
    'assets/image_shoes.png',
    'assets/image_shoes2.png',
    'assets/image_shoes3.png',
    'assets/image_shoes4.png',
    'assets/image_shoes5.png',
    'assets/image_shoes6.png',
    'assets/image_shoes7.png',
    'assets/image_shoes8.png',
  ];

  int currentIndex = 0;
  bool isWishlist = false;

  @override
  Widget build(BuildContext context) {
    Future<void> showSuccessDialog() async {
      return showDialog(
          context: context,
          builder: (BuildContext context) => Container(
                width: MediaQuery.of(context).size.width - (2 * defaultMargin),
                child: AlertDialog(
                  backgroundColor: backgroundColor3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.close, color: primaryTextColor),
                          ),
                        ),
                        Image.asset(
                          "assets/icon_success.png",
                          width: 100,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Hurray :)",
                          style: priceTextStyle.copyWith(
                              fontSize: 18, fontWeight: semiBold),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Item Added successfully",
                          style: secondaryTextStyle,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 154,
                          height: 44,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "View My Cart",
                              style: primaryTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: medium
                              ),
                            )                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
    }

    Widget indicator(int index) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 2),
        width: currentIndex == index ? 16 : 4,
        height: 4,
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(10),
            color: currentIndex == index ? primaryColor : Color(0xffC4c4c4)),
      );
    }

    Widget header() {
      int index = -1;

      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: 20, left: defaultMargin, right: defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.chevron_left),
                ),
                Icon(
                  Icons.shopping_bag,
                  color: backgroundColor1,
                )
              ],
            ),
          ),
          CarouselSlider(
              items: images
                  .map((image) => Image.asset(
                        image,
                        width: MediaQuery.of(context).size.width,
                        height: 310,
                        fit: BoxFit.cover,
                      ))
                  .toList(),
              options: CarouselOptions(
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  })),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          )
        ],
      );
    }

    Widget familiarShoesCard(String imageUrl) {
      return Container(
        width: 54,
        height: 54,
        margin: EdgeInsets.only(
          right: 16,
        ),
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(imageUrl)),
            borderRadius: BorderRadius.circular(6)),
      );
    }

    Widget content() {
      int index = -1;

      return Container(
        margin: EdgeInsets.only(top: 17),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          color: backgroundColor1,
        ),
        child: Column(
          children: [
            //TODO: NOTE: HEADER
            Container(
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TERREX URBAN LOW',
                          style: primaryTextStyle.copyWith(
                              fontSize: 18, fontWeight: semiBold),
                        ),
                        Text(
                          'Hiking',
                          style: secondaryTextStyle.copyWith(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isWishlist = !isWishlist;
                      });
                      if (isWishlist) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: secondaryColor,
                            content: Text(
                              "Has been Added to the Wishlist",
                              textAlign: TextAlign.center,
                            )));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: alertColor,
                            content: Text(
                              "Has been Removed to the Wishlist",
                              textAlign: TextAlign.center,
                            )));
                      }
                    },
                    child: Image.asset(
                      isWishlist
                          ? "assets/button_wishlist_blue.png"
                          : 'assets/button_wishlist.png',
                      width: 46,
                    ),
                  )
                ],
              ),
            ),

            //TODO NOTE: PRICE
            Container(
              margin: EdgeInsets.only(
                  top: 20, left: defaultMargin, right: defaultMargin),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: backgroundColor2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price Starts From',
                    style: primaryTextStyle,
                  ),
                  Text(
                    '\$143,98',
                    style: priceTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  )
                ],
              ),
            ),

            //  TODO NOTE: DESCRIPTION
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Descrption',
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Unpaved trails and mixed surfaces are easy when you have the traction and support you need. Casual enough for daily commute.',
                    style: subtitleTextStyle.copyWith(
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
            // TODO NOTE: FAMILIAR SHOES
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Text(
                      'Familiar Shoes',
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: familiarShoes.map((image) {
                        index++;
                        return Container(
                            margin: EdgeInsets.only(
                                left: index == 0 ? defaultMargin : 0),
                            child: familiarShoesCard(image));
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
            // TODO NOTE: BUTTONS
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
                bottom: 50.0,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/detail-chat');
                    },
                    child: Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/button_chat.png'))),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      height: 54,
                      child: TextButton(
                          onPressed: () {
                            showSuccessDialog();
                          },
                          style: TextButton.styleFrom(
                              primary: primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              backgroundColor: primaryColor),
                          child: Text(
                            'Add to Cart',
                            style: primaryTextStyle.copyWith(
                                fontSize: 16, fontWeight: semiBold),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: backgroundColor6,
        body: ListView(
          children: [header(), content()],
        ));
  }
}
