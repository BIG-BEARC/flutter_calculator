import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  GradientButton(this.colors, this.height, this.width, this.child,
      this.borderRadius, this.onPress);

  //渐变色数组
  final List<Color> colors;

  // 按钮宽高
  final double height;
  final double width;

  final Widget child;
  final BorderRadius borderRadius;

  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    //确保colors数组不空
    List<Color> _colors = colors ??
        [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors),
        borderRadius: borderRadius,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: onPress,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    child: child),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TurnBox extends StatefulWidget {
  TurnBox(
      {this.turns = 0.0, //旋转的“圈”数,一圈为360度，如0.25圈即90度
      this.speed = 200, //过渡动画执行的总时长
      this.child});

  final double turns;

  final int speed;
  final Widget child;

  @override
  State<StatefulWidget> createState() => _TurnBoxState();
}

class _TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, lowerBound: -double.infinity, upperBound: double.infinity);
    _animationController.value = widget.turns;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animationController,
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(TurnBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget.turns!=widget.turns){
      _animationController.animateTo(
        widget.turns,
        duration: Duration(microseconds: widget.speed??200),
        curve: Curves.easeOut
      );
    }
  }
}
