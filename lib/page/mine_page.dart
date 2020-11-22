import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Mine',
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
