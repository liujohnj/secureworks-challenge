import 'dart:ui' hide TextStyle;
import 'package:flutter/material.dart';
//import 'package:flutter/painting.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';


final style = TextStyle(
    color: BasicPalette.white.color,
    fontSize: 16.0,
    fontFamily: 'Awesome Font',
    //fontWeight: FontWeight.bold,
);

final regular = TextPaint(style: style);

Paint black = Paint()..color = const Color(0xFF000000);
Paint white = Paint()..color = const Color(0xFFFFFFFF);

class DialogBox extends TextBoxComponent with HasGameRef {
  DialogBox({required String text, required Vector2 size, required Vector2 position}) : super (
    text: text,
    position: position,
    textRenderer: regular,
    //position: size,
    //position: Vector2(541, 864),
    boxConfig: TextBoxConfig(dismissDelay: 5.0, maxWidth: size.x * 0.4, timePerChar: 0.025)
  ) {
    //anchor = Anchor.centerRight;
    //anchor = Anchor.Vector2(541,864);
  }

  @override
  void drawBackground(Canvas c) {

    Rect rect = Rect.fromLTWH(0, 0, width, height);
    //c.drawRect(rect, Paint()..color = Color(0xFFf0000));   // was const Color(0x33f0000)
    c.drawRect(rect, black);
  }

  /*
  @override
  void update(double dt) {
    super.update(dt);
    if (finished) {
      gameRef.remove(this);
    }
  }
  */
}