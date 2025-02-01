import 'dart:ui';

int getColorValue(Color color) {
  return (color.a.toInt() << 24) |
      (color.r.toInt() << 16) |
      (color.g.toInt() << 8) |
      color.b.toInt();
}
