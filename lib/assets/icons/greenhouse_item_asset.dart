import 'package:flutter/material.dart';

class GreenhouseItemAsset extends StatelessWidget {
  const GreenhouseItemAsset({super.key});

  @override
  Widget build(BuildContext context) => CustomPaint(size: Size(24, 24), painter: _RPSCustomPainter());
}

class _RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path0 = Path();
    path0.moveTo(size.width * 0.9840430, size.height * 0.3366816);
    path0.lineTo(size.width * 0.8508730, size.height * 0.3366816);
    path0.lineTo(size.width * 0.5540000, size.height * 0.1163848);
    path0.lineTo(size.width * 0.6871699, size.height * 0.1163848);
    path0.close();

    final paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Color(0xffC8DB86);
    canvas.drawPath(path0, paint0Fill);

    final path1 = Path();
    path1.moveTo(size.width * 0.5965527, size.height * 0.1163848);
    path1.lineTo(size.width * 0.8934258, size.height * 0.3366816);
    path1.lineTo(size.width * 0.6097227, size.height * 0.3366816);
    path1.lineTo(size.width * 0.3128301, size.height * 0.1163848);
    path1.close();

    final paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = Color(0xffD4ED85);
    canvas.drawPath(path1, paint1Fill);

    final paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = Color(0xffFFE6B8);
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.4873828, size.height * 0.3366816, size.width * 0.1223398, size.height * 0.5469355),
      paint2Fill,
    );

    final paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = Color(0xffFFF3DC);
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.01595703, size.height * 0.3366816, size.width * 0.5139785, size.height * 0.5469355),
      paint3Fill,
    );

    final paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = Color(0xffD4ED85);
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.2031270, size.height * 0.3366816, size.width * 0.2194473, size.height * 0.5469570),
      paint4Fill,
    );

    final paint5Fill = Paint()..style = PaintingStyle.fill;
    paint5Fill.color = Color(0xffBCC987);
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.8404258, size.height * 0.3366816, size.width * 0.1436172, size.height * 0.5469355),
      paint5Fill,
    );

    final paint6Fill = Paint()..style = PaintingStyle.fill;
    paint6Fill.color = Color(0xffC8DB86);
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.6097227, size.height * 0.3366816, size.width * 0.2945313, size.height * 0.5469355),
      paint6Fill,
    );

    final path7 = Path();
    path7.moveTo(size.width * 0.6097227, size.height * 0.3366816);
    path7.lineTo(size.width * 0.2675312, size.height * 0.3366816);
    path7.lineTo(size.width * 0.2675312, size.height * 0.1500020);
    path7.lineTo(size.width * 0.3128301, size.height * 0.1163848);
    path7.close();

    final paint7Fill = Paint()..style = PaintingStyle.fill;
    paint7Fill.color = Color(0xffFFF3DC);
    canvas.drawPath(path7, paint7Fill);

    final path8 = Path();
    path8.moveTo(size.width * 0.5191055, size.height * 0.3366816);
    path8.lineTo(size.width * 0.01595703, size.height * 0.3366816);
    path8.lineTo(size.width * 0.2675312, size.height * 0.1500020);
    path8.close();

    final paint8Fill = Paint()..style = PaintingStyle.fill;
    paint8Fill.color = Color(0xffFFFFFF);
    canvas.drawPath(path8, paint8Fill);

    final path9 = Path();
    path9.moveTo(size.width * 0.4065977, size.height * 0.3366738);
    path9.lineTo(size.width * 0.4065977, size.height * 0.5030332);
    path9.lineTo(size.width * 0.2190762, size.height * 0.5030332);
    path9.lineTo(size.width * 0.2190762, size.height * 0.3366738);
    path9.lineTo(size.width * 0.1871621, size.height * 0.3366738);
    path9.lineTo(size.width * 0.1871621, size.height * 0.5030332);
    path9.lineTo(size.width * 0.1818437, size.height * 0.5030332);
    path9.cubicTo(
      size.width * 0.1730312,
      size.height * 0.5030332,
      size.width * 0.1658867,
      size.height * 0.5101758,
      size.width * 0.1658867,
      size.height * 0.5189902,
    );
    path9.cubicTo(
      size.width * 0.1658867,
      size.height * 0.5278047,
      size.width * 0.1730312,
      size.height * 0.5349473,
      size.width * 0.1818437,
      size.height * 0.5349473,
    );
    path9.lineTo(size.width * 0.1871621, size.height * 0.5349473);
    path9.lineTo(size.width * 0.1871621, size.height * 0.6853477);
    path9.lineTo(size.width * 0.1818437, size.height * 0.6853477);
    path9.cubicTo(
      size.width * 0.1730312,
      size.height * 0.6853477,
      size.width * 0.1658867,
      size.height * 0.6924902,
      size.width * 0.1658867,
      size.height * 0.7013047,
    );
    path9.cubicTo(
      size.width * 0.1658867,
      size.height * 0.7101191,
      size.width * 0.1730312,
      size.height * 0.7172617,
      size.width * 0.1818437,
      size.height * 0.7172617,
    );
    path9.lineTo(size.width * 0.1871621, size.height * 0.7172617);
    path9.lineTo(size.width * 0.1871621, size.height * 0.8836211);
    path9.lineTo(size.width * 0.2190762, size.height * 0.8836211);
    path9.lineTo(size.width * 0.2190762, size.height * 0.7172617);
    path9.lineTo(size.width * 0.4065977, size.height * 0.7172617);
    path9.lineTo(size.width * 0.4065977, size.height * 0.8836211);
    path9.lineTo(size.width * 0.4385117, size.height * 0.8836211);
    path9.lineTo(size.width * 0.4385117, size.height * 0.3366738);
    path9.lineTo(size.width * 0.4065977, size.height * 0.3366738);
    path9.close();
    path9.moveTo(size.width * 0.2190762, size.height * 0.6853496);
    path9.lineTo(size.width * 0.2190762, size.height * 0.5349492);
    path9.lineTo(size.width * 0.4065977, size.height * 0.5349492);
    path9.lineTo(size.width * 0.4065977, size.height * 0.6853496);
    path9.lineTo(size.width * 0.2190762, size.height * 0.6853496);
    path9.close();

    final paint9Fill = Paint()..style = PaintingStyle.fill;
    paint9Fill.color = Color(0xff9CAC74);
    canvas.drawPath(path9, paint9Fill);

    final path10 = Path();
    path10.moveTo(size.width * 0.3587246, size.height * 0.6491016);
    path10.cubicTo(
      size.width * 0.3499121,
      size.height * 0.6491016,
      size.width * 0.3427676,
      size.height * 0.6419590,
      size.width * 0.3427676,
      size.height * 0.6331445,
    );
    path10.lineTo(size.width * 0.3427676, size.height * 0.5871582);
    path10.cubicTo(
      size.width * 0.3427676,
      size.height * 0.5783437,
      size.width * 0.3499121,
      size.height * 0.5712012,
      size.width * 0.3587246,
      size.height * 0.5712012,
    );
    path10.cubicTo(
      size.width * 0.3675371,
      size.height * 0.5712012,
      size.width * 0.3746816,
      size.height * 0.5783437,
      size.width * 0.3746816,
      size.height * 0.5871582,
    );
    path10.lineTo(size.width * 0.3746816, size.height * 0.6331445);
    path10.cubicTo(
      size.width * 0.3746836,
      size.height * 0.6419590,
      size.width * 0.3675391,
      size.height * 0.6491016,
      size.width * 0.3587246,
      size.height * 0.6491016,
    );
    path10.close();

    final paint10Fill = Paint()..style = PaintingStyle.fill;
    paint10Fill.color = Color(0xff7D9062);
    canvas.drawPath(path10, paint10Fill);

    final path11 = Path();
    path11.moveTo(size.width * 0.9935508, size.height * 0.3238613);
    path11.lineTo(size.width * 0.6966719, size.height * 0.1035625);
    path11.cubicTo(
      size.width * 0.6939199,
      size.height * 0.1015195,
      size.width * 0.6905859,
      size.height * 0.1004180,
      size.width * 0.6871621,
      size.height * 0.1004180,
    );
    path11.lineTo(size.width * 0.3128379, size.height * 0.1004180);
    path11.cubicTo(
      size.width * 0.3094121,
      size.height * 0.1004180,
      size.width * 0.3060781,
      size.height * 0.1015195,
      size.width * 0.3033301,
      size.height * 0.1035625,
    );
    path11.lineTo(size.width * 0.006449219, size.height * 0.3238613);
    path11.cubicTo(
      size.width * 0.002390625,
      size.height * 0.3268691,
      0,
      size.height * 0.3316230,
      0,
      size.height * 0.3366738,
    );
    path11.lineTo(0, size.height * 0.8836250);
    path11.cubicTo(
      0,
      size.height * 0.8924395,
      size.width * 0.007144531,
      size.height * 0.8995820,
      size.width * 0.01595703,
      size.height * 0.8995820,
    );
    path11.lineTo(size.width * 0.9840430, size.height * 0.8995820);
    path11.cubicTo(
      size.width * 0.9928574,
      size.height * 0.8995820,
      size.width,
      size.height * 0.8924395,
      size.width,
      size.height * 0.8836250,
    );
    path11.lineTo(size.width, size.height * 0.3366738);
    path11.cubicTo(
      size.width,
      size.height * 0.3316230,
      size.width * 0.9976094,
      size.height * 0.3268691,
      size.width * 0.9935508,
      size.height * 0.3238613,
    );
    path11.close();
    path11.moveTo(size.width * 0.4947285, size.height * 0.1323320);
    path11.lineTo(size.width * 0.7485957, size.height * 0.3207148);
    path11.lineTo(size.width * 0.6149922, size.height * 0.3207148);
    path11.lineTo(size.width * 0.3611191, size.height * 0.1323320);
    path11.cubicTo(
      size.width * 0.3611191,
      size.height * 0.1323320,
      size.width * 0.4947285,
      size.height * 0.1323320,
      size.width * 0.4947285,
      size.height * 0.1323320,
    );
    path11.close();
    path11.moveTo(size.width * 0.3128379, size.height * 0.1362461);
    path11.lineTo(size.width * 0.5614355, size.height * 0.3207168);
    path11.lineTo(size.width * 0.06424219, size.height * 0.3207168);
    path11.lineTo(size.width * 0.3128379, size.height * 0.1362461);
    path11.close();
    path11.moveTo(size.width * 0.03191406, size.height * 0.3526309);
    path11.lineTo(size.width * 0.5937578, size.height * 0.3526309);
    path11.lineTo(size.width * 0.5937578, size.height * 0.8676660);
    path11.lineTo(size.width * 0.03191406, size.height * 0.8676660);
    path11.lineTo(size.width * 0.03191406, size.height * 0.3526309);
    path11.close();
    path11.moveTo(size.width * 0.7809219, size.height * 0.8676699);
    path11.lineTo(size.width * 0.6256758, size.height * 0.8676699);
    path11.lineTo(size.width * 0.6256758, size.height * 0.3526309);
    path11.lineTo(size.width * 0.7809219, size.height * 0.3526309);
    path11.lineTo(size.width * 0.7809219, size.height * 0.8676699);
    path11.close();
    path11.moveTo(size.width * 0.5482832, size.height * 0.1323320);
    path11.lineTo(size.width * 0.6818867, size.height * 0.1323320);
    path11.lineTo(size.width * 0.9357578, size.height * 0.3207148);
    path11.lineTo(size.width * 0.8021523, size.height * 0.3207148);
    path11.lineTo(size.width * 0.5482832, size.height * 0.1323320);
    path11.close();
    path11.moveTo(size.width * 0.9680859, size.height * 0.8676699);
    path11.lineTo(size.width * 0.8128379, size.height * 0.8676699);
    path11.lineTo(size.width * 0.8128379, size.height * 0.3526309);
    path11.lineTo(size.width * 0.9680859, size.height * 0.3526309);
    path11.lineTo(size.width * 0.9680859, size.height * 0.8676699);
    path11.close();

    final paint11Fill = Paint()..style = PaintingStyle.fill;
    paint11Fill.color = Color(0xff7D9062);
    canvas.drawPath(path11, paint11Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
