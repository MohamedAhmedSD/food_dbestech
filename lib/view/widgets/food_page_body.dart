import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';
import 'small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  //? add controller
  //* The fraction of the viewport that each page should occupy.
  //! make space on left & right so you can see another pages
  //? its default value = 1.0

  PageController pageController = PageController(viewportFraction: 0.85);

  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8; //? use 80% from its original size
  final double _height = 220;

  @override
  void initState() {
    super.initState();
    //* listen to our Page
    pageController.addListener(() {
      //* use page value == page proberty
      // pageController.page;
      //* update our page value, and apply changes on UI
      setState(() {
        _currentPageValue = pageController.page!;
        //* value between [ 0 && 1]
        if (kDebugMode) {
          print("Current page value : ${_currentPageValue.toString()}");
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //! error == Horizontal viewport was given unbounded height
    //* it due to we use Container dosen't have any size
    //?so give it height to solve it
    return SizedBox(
      //! we use this color to see our edges between widgets after end, disable it
      // color: Colors.redAccent,
      height: 320,
      //? === [ PageView ] ===
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          //* we pass position as index for our PageView
          itemBuilder: (context, position) {
            return _buildPageItem(position);
          }),
    );
  }
  //! becarful with Scope of class

  //! make inner use Widget
  Widget _buildPageItem(int index) {
    //? ========= [ dart == Matrix4 to add animation == smpth sliding] === 1:45:00===
    //* xyz planes

    Matrix4 matrix = Matrix4.identity();
    //* current page => 100% == 1
    //? === [a] ===
    //! index = 0
    if (index == _currentPageValue.floor()) {
      // 1 - (0 - 0) * 1 - 0.8 => 1 - 0 = 1 = 100%
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      //? pass it
      // matrix = Matrix4.diagonal3Values(1, currScale, 1); //* we play around y

      //* also we need to move next page down, without change on current page position
      var currTrans = _height * (1 - currScale) / 2; // 0

      //! pass currTrans after apply currScale
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }

    //? === [b] ===
    //* other page => 80% == 0.80
    //! index = 1
    else if (index == _currentPageValue.floor() + 1) {
      // 0.8 + (0 - 1 + 1) * (1 - 0.8) = 0.8 + (0 * 0.2) = 0.8 + 0 = 0.8 = 80%
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      // //? pass it
      // matrix = Matrix4.diagonal3Values(1, currScale, 1); //* we play around y
      var currTrans = _height *
          (1 - currScale) /
          2; // 220 * (0.2 / 2) = 220 * 0.1 = 22 pixcel

      //! pass currTrans after apply currScale
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }
    //? === [c] ===
    else if (index == _currentPageValue.floor() - 1) {
      // 0.8 + (0 - 1 + 1) * (1 - 0.8) = 0.8 + (0 * 0.2) = 0.8 + 0 = 0.8 = 80%
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height *
          (1 - currScale) /
          2; // 220 * (0.2 / 2) = 220 * 0.1 = 22 pixcel
      // //? pass it
      matrix = Matrix4.diagonal3Values(1, currScale, 1); //* we play around y

      //! pass currTrans after apply currScale
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }

    //? === [d] ===
    else {
      //* we can write value of y, inside it
      //* also we use _scaleFactor here rather than currTrans
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    //? Stack under Transform ==========================================
    //! wrap all stack under Transform
    //* we wrap container under Stack to make it able use its height
    return Transform(
      transform: matrix,
      child: Stack(children: [
        //? === [1] ===
        Container(
          //* when put Container inside another
          //? child Container take full size of its parent
          height:
              220, //! so no need use height, put with stack its height will apply on UI rather than its parent Container
          //? margin here make anti space between our pages
          margin: const EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            //* make condition stmt => to choose different colors
            //* according to value of page index
            color: index.isEven
                ? const Color(0xFF69cfdf)
                : const Color(0xFF9294cc),
            //? deal with image
            image: const DecorationImage(
              fit: BoxFit.cover,
              // image: AssetImage(""),
              //! downloads images from
              //? https://www.pexels.com/search/pizza/
              image: AssetImage("assets/images/food0.jpg"),
            ),
          ),
        ),
        //? === [2] === [small container which contain details]
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            //* when put Container inside another
            //? child Container take full size of its parent
            height:
                120, //! so no need use height, put with stack its height will apply on UI rather than its parent Container
            margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                //! we need add shadow on bottom with bulur
                //* after add it we need delete blur that we not need it
                //* by using another => boxShado
                //* x, y level + or -
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset:
                        Offset(0, 5), //? x = 0 == no r or l, y = 5 == buttom
                  ),
                  //! delete our blur
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0), //? x = -5 == delete l blur
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0), //? x = 5 == delete r blur
                  ),
                ]),
            //? === [3] ===

            child: Container(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Chiness Dide"),
                  const SizedBox(
                    height: 10,
                  ),
                  //? ========== first row ===============
                  Row(
                    children: [
                      //? draw 5 stars H =============
                      Wrap(
                        direction: Axis.horizontal, //! it default value
                        //? List.generate(length, (index) => null),
                        //* it => return function, so put your Icons inside {  return block }

                        //! when I put List.generate inside [] == error
                        //? you cant do it becarfull !!!!!!!!!!!!!!!!!
                        children: List.generate(5, (index) {
                          return const Icon(
                            Icons.star,
                            color: AppColors.mainColor,
                            size: 15,
                          );
                        }),
                      ),
                      //? ========== second row ===============
                      //? add texts ================
                      const SizedBox(
                        width: 10,
                      ),
                      SmallText(
                        text: "4.5",
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SmallText(
                        text: "1287",
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SmallText(
                        text: "comments",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //? ========== third row ===============
                  //? Icons && Texts ===============
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      IconAndTextWidget(
                        icon: Icons.circle_sharp,
                        text: "Normal",
                        iconColor: AppColors.iconColor1,
                      ),
                      IconAndTextWidget(
                        icon: Icons.location_on,
                        text: "1.7km",
                        iconColor: AppColors.mainColor,
                      ),
                      IconAndTextWidget(
                        icon: Icons.access_time_rounded,
                        text: "32min",
                        iconColor: AppColors.iconColor2,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
