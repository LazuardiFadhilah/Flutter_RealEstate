// ignore_for_file: unused_field, avoid_unnecessary_containers, prefer_const_constructors, unused_import, use_key_in_widget_constructors, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:realestate/pages/details.dart';
import 'package:realestate/theme.dart';
import 'package:realestate/models/data.dart';
import 'package:realestate/providers/data_providers.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int populars = 2;
  int seeMore = 0;
  int selectedItem = 0;
  int currentIndex = 0;

  Widget header() {
    return Container(
      padding: const EdgeInsets.only(
        left: 30,
        top: 40,
        right: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset('assets/Category.png'),
          ),
          Container(
            child: Row(
              children: [
                Image.asset(
                  'assets/Location.png',
                  height: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'California, ',
                  style: titleTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  'US',
                  style: descTextStyle,
                ),
              ],
            ),
          ),
          Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset('assets/Location.png'),
          ),
        ],
      ),
    );
  }

  Widget searchContent() {
    return Container(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            width: 265,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/Search.png',
                  height: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    style: descTextStyle,
                    obscureText: false,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Search Classic Style',
                      hintStyle: descTextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  width: 70,
                ),
                Image.asset(
                  'assets/Voice.png',
                  height: 20,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 40,
            height: 40,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset('assets/Filter.png'),
          ),
        ],
      ),
    );
  }

  Widget display() {
    List<Widget> displayList = [];
    for (var i = 0; i < houseData.length; i++) {
      displayList.add(
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(
                  data: houseData[i],
                ),
              ),
            );
          },
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(
                  right: 15,
                ),
                width: 239,
                height: 278,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(houseData[i].imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: 239,
                height: 278,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: black.withOpacity(0.4),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                houseData[i].name,
                                style: titleTextStyle.copyWith(
                                  color: white,
                                ),
                              ),
                              Text(
                                houseData[i].location,
                                style: descTextStyle.copyWith(
                                  fontSize: 10,
                                  color: white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: white.withOpacity(0.5),
                          ),
                          child: houseData[i].isFavorite == 1
                              ? Image.asset(
                                  'assets/Heart_active.png',
                                )
                              : Image.asset(
                                  'assets/Heart.png',
                                  color: black,
                                ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.only(
        top: 30,
        left: 30,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: displayList,
        ),
      ),
    );
  }

  Widget popular() {
    return Container(
      padding: EdgeInsets.only(
        left: 30,
        right: 30,
        top: 30,
        bottom: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Popular',
            style: titleTextStyle,
          ),
          seeMore == 0
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      populars = houseData.length;
                      seeMore = 1;
                    });
                  },
                  child: Text(
                    'See More',
                    style: descTextStyle,
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      populars = 2;
                      seeMore = 0;
                    });
                  },
                  child: Text(
                    'See Less',
                    style: descTextStyle,
                  ),
                ),
        ],
      ),
    );
  }

  Widget popularItem() {
    List<Widget> popularItems = [];
    for (int i = 0; i < populars; i++) {
      popularItems.add(
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(
              bottom: 15,
            ),
            height: 82,
            width: MediaQuery.of(context).size.width - 60,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 62,
                  height: 62,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(houseData[i].imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: black.withOpacity(0.4),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        houseData[i].name,
                        style: titleTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        houseData[i].location,
                        style: descTextStyle.copyWith(
                          fontSize: 10,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        houseData[i].isFavorite == 0
                            ? houseData[i].isFavorite = 1
                            : houseData[i].isFavorite = 0;
                      });
                    },
                    child: Image.asset(
                      'assets/Heart_active.png',
                      color: houseData[i].isFavorite == 1 ? Colors.red : gray3,
                      height: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
      ),
      child: Column(
        children: popularItems,
      ),
    );
  }

  Widget customBottomNav() {
    return BottomAppBar(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        height: 50,
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: currentIndex,
          onTap: (value) {
            print(value);
            setState(() {
              currentIndex = value;
            });
          },
          backgroundColor: white,
          selectedItemColor: black,
          selectedLabelStyle: titleTextStyle.copyWith(
            fontSize: 12,
          ),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Container(
                child: Image.asset(
                  'assets/Home.png',
                  width: 21,
                  color: currentIndex == 0 ? black : gray3,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Container(
                child: Image.asset(
                  'assets/Chat.png',
                  width: 21,
                  color: currentIndex == 1 ? black : gray3,
                ),
              ),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Container(
                child: Image.asset(
                  'assets/Heart.png',
                  width: 21,
                  color: currentIndex == 2 ? black : gray3,
                ),
              ),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Container(
                child: Image.asset(
                  'assets/Profile.png',
                  width: 21,
                  color: currentIndex == 3 ? black : gray3,
                ),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: SafeArea(
        child: ListView(
          children: [
            header(),
            searchContent(),
            display(),
            popular(),
            popularItem(),
          ],
        ),
      ),
      bottomNavigationBar: customBottomNav(),
    );
  }
}
