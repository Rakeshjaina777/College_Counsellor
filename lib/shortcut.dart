
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final double spacing;
  final double height;
  final Color color;
  final TextAlign align;
  final FontWeight weight;
  final TextDirection? textdirection;
  final TextOverflow? overflow;
  const CustomText({
    required this.text,
    this.fontSize,
    this.spacing = 0,
    this.height = 1,
    this.color = Colors.black,
    this.align = TextAlign.center,
    this.weight = FontWeight.normal,
    this.overflow,
    this.textdirection,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(height: 8,),
        Text(
          text,
          maxLines: 4,
          overflow: overflow ?? TextOverflow.ellipsis,
          textDirection: textdirection ?? TextDirection.ltr,
          textAlign: align,
          style: GoogleFonts.poppins(
            color: color,
            fontSize: fontSize ,
            fontWeight: weight,
            letterSpacing: spacing,
            height: height,

          ),
        ),
        SizedBox(height: 6,),
      ],
    );
  }
}



class CustomBtn extends StatefulWidget {
  final String label;
  final Function() action;
  Color? color;
  Color? textColor;
  double? width;
  CustomBtn({
    required this.label,
    required this.action,
    this.color,
    this.width,
    this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomBtn> createState() => _CustomBtnState();
}

class _CustomBtnState extends State<CustomBtn> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: widget.action,
      splashColor: AppColors.kPrimaryLight,
      color: widget.color ?? Colors.white,
      elevation: 0,
      minWidth: widget.width,
      child: CustomText(
        text: widget.label.toUpperCase(),
        color: widget.textColor ?? AppColors.kPrimaryDark,
        weight: FontWeight.bold,
        fontSize: 15.5.sp,
      ),
    );
  }
}

class AppColors{
  static Color ? red = Colors.red;
  static Color   Common = Colors.tealAccent;
  // static Color Commonshade = Colors.purple;
  static Color Commonshade = Color(0xFF1E3CDEFF);
  static Color ?  white = Colors.white;
  static Color  ?  black = Colors.black;
  static Color whiteshade = Colors.white70;
  static Color blackshade = Colors.black87;

  static Color kPrimaryColor = Color(0xFF4fc1b3);
  static Color kSecondaryColor = Color(0xFFf3f5f5);
  static Color kPrimaryLight = Color.fromARGB(255, 142, 221, 211);
  static Color kPrimaryDark = Color(0xfff7e7ce);
  static Color redA = Color(0xFFf2535b);
}

class Geometry{
  // static height = MediaQuery.of(context).size.height
}


