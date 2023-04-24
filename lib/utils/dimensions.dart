import 'package:get/get.dart';

class Dimensions {
  //* to make responsive UI we need use MQ rather hard code
  //* but there are problem with widget context so by
  //? by using Get.context we can solve it

  //! steps
  //? [1] what is my current device Dimensions by MQ
  //? ========================================================
  //! how we use Mq to know our current device size
  //? by using print under stf widget build
  // var h = MediaQuery.of(context).size.height;
  // var w = MediaQuery.of(context).size.width;
  // if (kDebugMode) {
  //   print(
  //       "My current device height ${h.toString()} and width is ${w.toString()}");
  // }
  //? ========================================================
  //? [2] I convert hard code (numbers) by compering with result from MQ
  //* to determain => x factor
  //* our device H => 844
  //* x = 844/220 = 3.84
  //* x = 844/120 = 7.03

  //? [3] now use Get
  //! access to context == total screen size
  static double screenHeight = Get.context!.height;
  static double screenwidth = Get.context!.width;

  //! ===== pageView ==== [if not use to all we get overflow errors]
  //* x = 844/320 = 2.64
  //* x = 844/220 = 3.84
  //* x = 844/120 = 7.03
  static double pageView = screenHeight / 2.64;
  static double pageViewContainer = screenHeight / 3.48;
  static double pageViewTextContainer = screenHeight / 7.03;

  //! ===== dynamic height padding and margin ====
  //* x = 844/10 = 84.4
  //* x = 844/15 = 56.27
  //* x = 844/20 = 42.2
  //* x = 844/30 = 28.13
  static double height5 = screenHeight / 186.8;
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.76;

  //! ===== dynamic width padding and margin ====
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;
  static double width45 = screenHeight / 18.76;

  //! ===== fonts ====
  static double font12 = screenHeight / 70.33;
  static double font20 = screenHeight / 42.2;

  //* I adjust them size
  // static double font12 = screenHeight / 52.75; // 16
  // static double font20 = screenHeight / 35.16; //24

  //! ===== radius ====
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  //! ===== icon size ====
  static double iconSize15 = screenHeight / 56.27;
  static double iconSize24 = screenHeight / 35.17;
}
