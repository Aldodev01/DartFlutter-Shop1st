import 'package:aldo_shop/theme.dart';
import 'package:aldo_shop/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class DetailChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: false,
        title: Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Image.asset(
                'assets/image_shop_logo_online.png',
                width: 40,
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shoe Store',
                    style: primaryTextStyle.copyWith(
                        fontWeight: medium, fontSize: 14),
                  ),
                  Text(
                    'Online',
                    style: secondaryTextStyle.copyWith(
                        fontWeight: light, fontSize: 14),
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget productPreview() {
      return Container(
        width: 225,
        height: 74,
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor5,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: primaryColor,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/image_shoes3.png',
                width: 54,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "COURT VISION..",
                    style: primaryTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    '\$57,15',
                    style: priceTextStyle.copyWith(fontWeight: medium),
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/button_close.png',
              width: 22,
            )
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin
        ),
        children: [
          ChatBubble(
            hasProduct: true,
            isSender: true,
            text: "Hi, Aldo. This item is still available",
          ),
          ChatBubble(
            isSender: false,
            text: "Good night, This item is only available in size 41 and 43",
          )
        ],
      );
    }

    Widget chatInput() {
      return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            productPreview(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: backgroundColor4,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration.collapsed(
                            hintText: "Aldo has typing message...",
                            hintStyle: subtitleTextStyle),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 20,
                ),
                Image.asset(
                  'assets/button_send.png',
                  width: 45,
                )
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: header(),
      ),
      body: content(),
      bottomNavigationBar: chatInput(),
    );
  }
}
