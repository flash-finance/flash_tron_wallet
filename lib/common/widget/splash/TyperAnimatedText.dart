import 'package:flutter/material.dart';

class TyperAnimatedText extends StatefulWidget {
  /// [String] that would be displayed subsequently in the animation.
  final String text;

  /// Gives [TextStyle] to the text strings.
  final TextStyle textStyle;

  /// The [Duration] of the delay between the apparition of each characters
  ///
  /// By default it is set to 40 milliseconds.
  final Duration speed;

  const TyperAnimatedText({
    Key key,
    @required this.text,
    this.textStyle,
    this.speed,
  }) : super(key: key);

  @override
  _TyperState createState() => _TyperState();
}

class _TyperState extends State<TyperAnimatedText>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _typingText;

  @override
  void initState() {
    super.initState();
    if (mounted) setState(() {});

    _controller = AnimationController(
      duration: widget.speed * widget.text.length,
      vsync: this,
    );

    _typingText =
        StepTween(begin: 0, end: widget.text.length).animate(_controller);

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
      builder: (BuildContext context, Widget child) {
        final int offset = widget.text.length < _typingText.value
            ? widget.text.length
            : _typingText.value;

        return Text(
          widget.text.substring(0, offset),
          textAlign: TextAlign.center,
          style: widget.textStyle,
        );
      },
    );
  }
}
