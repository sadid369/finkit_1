
import 'package:finkit/utils/custom_color.dart';
import 'package:finkit/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GridItemWidget extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color color;

  const GridItemWidget({
    Key? key,
    required this.title,
    required this.image,
    required this.onTap,
    required this.backgroundColor,
    required this.color,
  }) : super(key: key);     

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: backgroundColor,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                verticalSpace(17),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: CircleAvatar(
                    backgroundColor:color,
                    radius: 30.0,
                    child: Image.asset(
                      image,
                      // fit: BoxFit.cover,
                      width: 28.0,
                      height: 28.0,
                    ),
                  ),
                ),
                verticalSpace(
                  20,
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    color: CustomColor.whiteColor,
                    fontSize: 15.h,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
