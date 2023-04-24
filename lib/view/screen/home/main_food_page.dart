import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/utils/dimensions.dart';

import '../../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/food_page_body.dart';
import '../../widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  //* why we use container inside another
  Widget build(BuildContext context) {
    //? ========================================================
    //! how we use Mq to know our current device size
    //? by using print under stf widget build
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    if (kDebugMode) {
      print(
          "My current device height ${h.toString()} and width is ${w.toString()}");
    }
    //? ========================================================
    return Scaffold(
      body: Column(
        children: [
          //? === [Part 1] ===
          //! error == Horizontal viewport was given unbounded height
          //* it due to we use Container dosen't have any size
          //?so give it height to solve it
          Container(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.width45, bottom: Dimensions.width45),
              padding: EdgeInsets.only(
                  left: Dimensions.height20, right: Dimensions.height20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //? ======= header ===========
                        BigText(
                          text: "Sudan",
                          color: AppColors.mainColor,
                        ),
                        //! we can change default text color also from here
                        Row(
                          children: [
                            SmallText(
                              text: "Omdurman",
                              color: Colors.black54,
                            ),
                            const Icon(Icons.arrow_drop_down_rounded),
                          ],
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        width: Dimensions.width45,
                        height: Dimensions.height45,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                            color: AppColors.mainColor),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          //! default icon size 24
                          size: Dimensions.iconSize24,
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
          //? //? ======= body ===========
          const FoodPageBody(),
        ],
      ),
    );
  }
}
