import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SwapPage extends StatefulWidget {
  @override
  _SwapPageState createState() => _SwapPageState();
}

class _SwapPageState extends State<SwapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'DeFi',
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: ScreenUtil().setSp(35),
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
