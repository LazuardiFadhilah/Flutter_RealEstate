// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, missing_required_param

// @dart=2.9
import 'package:flutter/material.dart';
import 'package:realestate/pages/details.dart';

import 'pages/homepage.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        '/details': (context) => DetailsPage(),
      },
    );
  }
}
