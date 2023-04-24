
import 'package:flutter/material.dart';

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
    return Scaffold(
      body: Column(
        children: [
          //? === [Part 1] ===
          //! error == Horizontal viewport was given unbounded height
          //* it due to we use Container dosen't have any size
          //?so give it height to solve it
          Container(
            child: Container(
              margin: const EdgeInsets.only(top: 45, bottom: 15),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(
                          text: "Contry",
                          color: AppColors.mainColor,
                        ),
                        //! we can change default text color also from here
                        Row(
                          children: [
                            SmallText(
                              text: "City",
                              color: Colors.black54,
                            ),
                            const Icon(Icons.arrow_drop_down_rounded),
                          ],
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue),
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
          //? === [Part 2] ===

          const FoodPageBody(),
        ],
      ),
    );
  }
}
