library splash_screen_view;

import 'package:flash_tron_wallet/route/app_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colorize_animated_text.dart';
import 'scale_animated_text.dart';
import 'typer_animated_text.dart';

enum TextType {
  ColorizeAnimationText,
  TyperAnimatedText,
  ScaleAnimatedText,
  NormalText,
}

// ignore: must_be_immutable
class SplashScreenView extends StatefulWidget {
  /// The [Widget] Name of target screen which you want to display after completion of splash screen milliseconds.
  Widget _home;

  ///  [String] Asset path of your logo image.
  String _imageSrc = "";

  ///  [String] that would be displayed on below logo.
  String _text;

  /// Select [TextType] of your text.
  ///
  /// By default it is NormalText.
  TextType _textType;

  /// Gives [TextStyle] to the text strings.
  TextStyle _textStyle;

  /// The [Duration] of the delay between the apparition of each characters
  ///
  /// By default it is set to 3000 milliseconds.
  int _duration = 3000;

  ///  [int] Size of your image logo.
  ///
  /// By default it is set to 150.
  int _logoSize = 150;

  ///  [Color] Background Color of your splash screen.
  /// By default it is set to white.
  Color _backgroundColor = Colors.white;

  /// Set the colors for the gradient animation of the text.
  ///
  /// The [List] should contain at least two values of [Color] in it.
  /// By default it is set to red and black.
  List<Color> _colors;

  double _defaultTextFontSize = 20;

  SplashScreenView(
      {@required String imageSrc,
      @required Widget home,
      @required int duration,
      int imageSize,
      textStyle,
      colors,
      textType,
      Color backgroundColor,
      text}) {
    assert(duration != null);
    assert(home != null);
    assert(imageSrc != null);

    _imageSrc = imageSrc;
    _home = home;
    _duration = duration;
    _colors = colors;
    _text = text;
    _textStyle = textStyle;
    _logoSize = imageSize;
    _backgroundColor = backgroundColor;
    _textType = textType;
  }

  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    if (widget._duration < 1000) widget._duration = 3000;
    if (widget._textType == TextType.TyperAnimatedText) {
      _animationController = new AnimationController(
          vsync: this, duration: Duration(milliseconds: 100));
      _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _animationController, curve: Curves.easeInCirc));
      _animationController.forward();
    } else {
      _animationController = new AnimationController(
          vsync: this, duration: Duration(milliseconds: 1000));
      _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _animationController, curve: Curves.easeInCirc));
      _animationController.forward();
    }

    Future.delayed(Duration(milliseconds: widget._duration)).then((value) {
      /*Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (BuildContext context) => widget._home));*/
      Get.offNamed(AppRoute.index);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget._backgroundColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              (widget._imageSrc != null)
                  ? Image.asset(
                      widget._imageSrc,
                      height: (widget._logoSize != null)
                          ? widget._logoSize.toDouble()
                          : 150,
                    )
                  : SizedBox(
                      height: 1,
                    ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, top: 20),
                child: getTextWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getTextWidget() {
    if (widget._text != null) {
      print("Not Blank");
      switch (widget._textType) {
        case TextType.ColorizeAnimationText:
          return ColorizeAnimatedText(
            text: widget._text,
            speed: Duration(milliseconds: 1000),
            textStyle: (widget._textStyle != null)
                ? widget._textStyle
                : TextStyle(fontSize: widget._defaultTextFontSize),
            colors: (widget._colors != null)
                ? widget._colors
                : [
                    Colors.red,
                    Colors.black,
                    Colors.red,
                    Colors.black,
                  ],
          );
        case TextType.NormalText:
          return Text(
            widget._text,
            style: (widget._textStyle != null)
                ? widget._textStyle
                : TextStyle(fontSize: widget._defaultTextFontSize),
          );
        case TextType.TyperAnimatedText:
          return TyperAnimatedText(
            text: widget._text,
            speed: Duration(milliseconds: 100),
            textStyle: (widget._textStyle != null)
                ? widget._textStyle
                : TextStyle(fontSize: widget._defaultTextFontSize),
          );
        case TextType.ScaleAnimatedText:
          return ScaleAnimatedText(
            text: widget._text,
            textStyle: (widget._textStyle != null)
                ? widget._textStyle
                : TextStyle(fontSize: widget._defaultTextFontSize),
          );
        default:
          return Text(
            widget._text,
            style: (widget._textStyle != null)
                ? widget._textStyle
                : TextStyle(fontSize: widget._defaultTextFontSize),
          );
      }
    } else {
      print("Blank");
      return SizedBox(
        width: 1,
      );
    }
  }
}
