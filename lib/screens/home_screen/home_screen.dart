import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mshaikh_sudan/core/utils/app_colors.dart';

import '../../core/reusable_widgets/home_cards_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // AppBar Background Color
        elevation: 0, // Remove Shadow
        leading: Padding(

          padding: EdgeInsets.only(left: 20.w, ),child: Container(
            height: 20.w,
            width: 20.w,
            decoration: const BoxDecoration(
              color: Color(0x12006754),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back_rounded, color: AppColors.primaryColor, size: 20.w), // ☰ Menu Icon
              onPressed: () {
                // Open Drawer or Perform Action
              },
            ),
          ),
        ),
        title:  Text(
          "مشايخ السودان",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color:AppColors.primaryColor, // Dark Green/Black Text
          ),
        ),
        centerTitle: false, // Align title to the left
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.search, color: Colors.grey.shade800, size: 26), // 🔍 Search Icon
        //     onPressed: () {
        //       // Search Action
        //     },
        //   ),
        // ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MemorizeCard(
                title: "قران", // Change text dynamically
                imagePath:
                    'assets/images/Group.png', // Change image dynamically
                slopeColor: Colors.green.shade300,
                containerColor: Colors.green.shade50,
              ),
              const MemorizeCard(
                title: "أذكار", // Change text dynamically
                imagePath: 'assets/images/sbha.png', // Change image dynamically
                slopeColor: Color(0x12FF643D),
                containerColor: Color(0xFFFEF6F4),
              ),
            ],
          ),
          SizedBox(height: 20.h,),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MemorizeCard(
                title: "Memorize", // Change text dynamically
                imagePath:
                    'assets/images/Group.png', // Change image dynamically
                slopeColor: Color(0x124865FF),
                containerColor: Color(0xffE2F6F8),
              ),
              MemorizeCard(
                title: "Memorize", // Change text dynamically
                imagePath: 'assets/images/sbha.png', // Change image dynamically
                slopeColor: Color(0x12FFB92C),
                containerColor: Color(0xFFFFFAF0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}