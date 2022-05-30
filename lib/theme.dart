// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primary = Color(0xffFBA651);
Color black = Color(0xff191410);
Color gray1 = Color(0xff7B756F);
Color gray2 = Color(0xffADA8A4);
Color gray3 = Color(0xffDDDBDA);
Color gray4 = Color(0xffF7F8F8);
Color white = Color(0xffFFFFFF);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

TextStyle titleTextStyle = GoogleFonts.montserrat(
  fontSize: 16,
  fontWeight: bold,
  color: black,
);

TextStyle descTextStyle = GoogleFonts.montserrat(
  fontSize: 12,
  fontWeight: regular,
  color: gray2,
);

TextStyle primaryTextStyle = GoogleFonts.montserrat(
  fontSize: 18,
  fontWeight: semiBold,
  color: black,
);
