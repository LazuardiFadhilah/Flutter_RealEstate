// ignore_for_file: unused_import, must_be_immutable, prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, duplicate_ignore, sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:realestate/theme.dart';
import 'package:realestate/models/data.dart';
import 'package:realestate/providers/data_providers.dart';

// ignore: use_key_in_widget_constructors

class DetailsPage extends StatelessWidget {
  final House data;
  DetailsPage({required this.data});
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        padding: EdgeInsets.only(
          left: 30,
          right: 30,
          top: 40,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 32,
                height: 32,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: gray4,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset('assets/arrow_left.png'),
              ),
            ),
            Text(
              'Details',
              style: titleTextStyle,
            ),
            Container(
              width: 32,
              height: 32,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: gray4,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset('assets/more_icon.png'),
            ),
          ],
        ),
      );
    }

    Widget picture() {
      return Container(
        height: 328,
        width: 315,
        margin: EdgeInsets.only(
          left: 30,
          right: 30,
          top: 30,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(data.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget info() {
      return Container(
        padding: EdgeInsets.only(
          left: 30,
          right: 30,
          top: 30,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.name,
                      style: primaryTextStyle,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 18,
                          child: Image.asset('assets/Location.png'),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          data.location,
                          style: descTextStyle.copyWith(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 32,
                  height: 32,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: white,
                  ),
                  child: Image.asset(
                    'assets/Heart_active.png',
                    color: data.isFavorite == 1 ? Colors.red : Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              data.desc,
              style: descTextStyle.copyWith(
                fontSize: 12,
                fontWeight: regular,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      );
    }

    Widget Overview() {
      return Container(
        padding: EdgeInsets.only(
          left: 30,
          right: 30,
          top: 15,
          bottom: 15,
        ),
        child: Text(
          'Overview',
          style: titleTextStyle,
        ),
      );
    }

    Widget overviewItem() {
      List<Widget> oItems = [];
      for (int i = 0; i < houseData.length; i++) {
        oItems.add(
          Container(
            width: 60,
            height: 60,
            margin: EdgeInsets.only(
              right: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(houseData[i].imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      }

      return Container(
        padding: EdgeInsets.only(left: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: oItems,
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        padding: EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: descTextStyle.copyWith(fontSize: 12),
                ),
                Text(
                  data.price,
                  style: primaryTextStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              alignment: Alignment.center,
              width: 223,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: black,
              ),
              child: Text(
                'Buy',
                style: titleTextStyle.copyWith(color: white),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: [
            header(),
            picture(),
            info(),
            Overview(),
            overviewItem(),
            footer(),
          ],
        ),
      ),
    );
  }
}
