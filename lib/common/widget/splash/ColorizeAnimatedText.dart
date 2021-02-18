import 'package:flutter/material.dart';

class ColorizeAnimatedText extends StatefulWidget {
  ///  [String] that would be displayed subsequently in the animation.
  final String text;

  /// Gives [TextStyle] to the text strings.
  final TextStyle textStyle;

  /// The [Duration] of the delay between the apparition of each characters
  ///
  /// By default it is set to 500 milliseconds.
  final Duration speed;

  /// Set the colors for the gradient animation of the text.
  ///
  /// The [List] should contain at least two values of [Color] in it.
  final List<Color> colors;

  const ColorizeAnimatedText({
    Key key,
    @required this.text,
    this.textStyle,
    @required this.colors,
    this.speed,
  }) : super(key: key);

  @override
  _ColorizeTextState createState() => _ColorizeTextState();
}

class _ColorizeTextState extends State<ColorizeAnimatedText>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _colorShifter, _fadeIn, _fadeOut;
  double _tuning;

  @override
  void initState() {
    super.initState();
    if (mounted) setState(() {});
    _controller = AnimationController(
      duration: widget.speed * widget.text.length,
      vsync: this,
    );

    _tuning = (300.0 * widget.colors.length) *
        (widget.textStyle.fontSize / 24.0) *
        0.75 *
        (widget.text.length / 15.0);

    _fadeIn = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.1, curve: Curves.easeOut),
      ),
    );

    _fadeOut = Tween<double>(begin: 1.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.9, 1.0, curve: Curves.easeIn),
      ),
    );

    _colorShifter =
        Tween<double>(begin: 0.0, end: widget.colors.length * _tuning).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.easeIn),
      ),
    );
    _controller?.forward();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child) {
          Shader linearGradient = LinearGradient(colors: widget.colors)
              .createShader(Rect.fromLTWH(0.0, 0.0, _colorShifter.value, 0.0));
          return Opacity(
            opacity: _fadeIn.value != 1.0 ? _fadeIn.value : _fadeOut.value,
            child: Text(
              widget.text,
              style: widget.textStyle != null
                  ? widget.textStyle.merge(
                      TextStyle(foreground: Paint()..shader = linearGradient))
                  : widget.textStyle,
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}
