import 'package:flutter/material.dart';
import 'package:food_app/utils/dimensions.dart';

//! add font assets
class BigText extends StatelessWidget {
  //*
  Color? color;
  final String text;
  double size; //? default
  TextOverflow overflow; //? default
  BigText({
    Key? key,
    this.color =
        const Color(0xFF332d2b), //! default color must as hex not use AppColors
    required this.text,
    this.size = 0,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontFamily: "Roboto",
        color: color,
        // fontSize: size,
        //! if not pass any font size == 0 => use font20
        fontSize: size == 0 ? Dimensions.font20 : size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
