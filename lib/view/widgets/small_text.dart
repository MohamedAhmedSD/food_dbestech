import 'package:flutter/material.dart';

//! add font assets
class SmallText extends StatelessWidget {
  //*
  Color? color;
  final String text;
  double size; //? default
  double height; //* default space between lines
  SmallText({
    Key? key,
    this.color =
        const Color(0xFFccc7c5), //! default color must as hex not use AppColors
    required this.text,
    this.size = 12,
    // this.size = 0,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(
        fontFamily: "Roboto",
        color: color,
        fontSize: size,
        // fontSize: size == 0 ? Dimensions.font12 : size,
        fontWeight: FontWeight.w400,
        height: height, //* default space between lines
      ),
    );
  }
}
