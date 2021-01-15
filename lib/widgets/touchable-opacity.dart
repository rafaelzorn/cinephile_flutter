import 'package:flutter/material.dart';

class CfTouchableOpacityWidget extends StatefulWidget {
  final Widget child;
  final Function onTap;
  final double activeOpacity;

  CfTouchableOpacityWidget({
    @required this.child,
    @required this.onTap,
    this.activeOpacity = 0.2,
  });

  @override
  _CfTouchableOpacityWidgetState createState() =>
      _CfTouchableOpacityWidgetState();
}

class _CfTouchableOpacityWidgetState extends State<CfTouchableOpacityWidget> {
  double currentOpacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => setState(() {
        currentOpacity = widget.activeOpacity;
      }),
      onPointerUp: (_) => setState(() {
        currentOpacity = 1.0;
      }),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Opacity(opacity: currentOpacity, child: widget.child),
      ),
    );
  }
}
