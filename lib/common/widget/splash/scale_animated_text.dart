import 'package:flutter/material.dart';

class ScaleAnimatedText extends StatefulWidget {
  /// [String] that would be displayed subsequently in the animation.
  final String text;

  /// Gives [TextStyle] to the text strings.
  final TextStyle textStyle;

  /// Override the [Duration] of the animation by setting the duration parameter.
  ///
  /// This will set the total duration for the animated widget.
  /// For example, if text = ["a", "b", "c"] and if you want that each animation
  /// should take 3 seconds then you have to set [duration] to 3 seconds.
  final Duration duration;

  /// Set the scaling factor of the text for the animation.
  ///
  /// By default it is set to [double] value 0.5
  final double scalingFactor;

  const ScaleAnimatedText({
    Key key,
    @required this.text,
    this.textStyle,
    this.scalingFactor = 0.2,
    this.duration,
  }) : super(key: key);

  @override
  _ScaleTextState createState() => _ScaleTextState();
}

class _ScaleTextState extends State<ScaleAnimatedText>
    with TickerProviderStateMixin {
  AnimationController _controller;

  Animation _fadeIn, _fadeOut, _scaleIn, _scaleOut;
  Duration _duration;

  @override
  void initState() {
    super.initState();
    _duration = widget.duration ?? const Duration(milliseconds: 2300);
    setState(() {});
    _controller = AnimationController(
      duration: _duration,
      vsync: this,
    );

    _fadeIn = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOut),
      ),
    );

    _fadeOut = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.8, 1.0, curve: Curves.easeOut),
      ),
    );

    _scaleIn = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0,
          1.0,
          curve: Curves.easeOut,
        ),
      ),
    );
    _scaleOut = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          1.0,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller?.stop();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: Text(
        widget.text,
        textAlign: TextAlign.center,
        style: widget.textStyle,
      ),
      builder: (BuildContext context, Widget child) {
        return ScaleTransition(
          scale: _scaleIn.value != 1.0 ? _scaleIn : _scaleOut,
          child: Opacity(
            opacity: _fadeIn.value != 1.0 ? _fadeIn.value : _fadeOut.value,
            child: child,
          ),
        );
      },
    );
  }
}
