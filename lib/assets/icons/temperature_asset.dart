import 'package:flutter/material.dart';

class TemperatureAsset extends StatelessWidget {
  const TemperatureAsset({super.key});

  @override
  Widget build(BuildContext context) => CustomPaint(size: Size(24, 24), painter: _RPSCustomPainter());
}

class _RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path0 = Path();
    path0.moveTo(size.width * 0.4869385, size.height * 0.003295906);
    path0.cubicTo(
      size.width * 0.4836426,
      size.height * 0.005249031,
      size.width * 0.4558106,
      size.height * 0.02966309,
      size.width * 0.4254150,
      size.height * 0.05786131,
    );
    path0.cubicTo(
      size.width * 0.3948975,
      size.height * 0.08569338,
      size.width * 0.2990722,
      size.height * 0.1740723,
      size.width * 0.2119141,
      size.height * 0.2539063,
    );
    path0.cubicTo(
      size.width * 0.002563475,
      size.height * 0.4460449,
      size.width * 0.01196287,
      size.height * 0.4372559,
      size.width * 0.008544938,
      size.height * 0.4436035,
    );
    path0.cubicTo(
      size.width * 0.004638687,
      size.height * 0.4514160,
      size.width * 0.005126938,
      size.height * 0.4645996,
      size.width * 0.009765625,
      size.height * 0.4722900,
    );
    path0.cubicTo(
      size.width * 0.01525878,
      size.height * 0.4810791,
      size.width * 0.02868653,
      size.height * 0.4870606,
      size.width * 0.03930662,
      size.height * 0.4853516,
    );
    path0.cubicTo(
      size.width * 0.04809569,
      size.height * 0.4837647,
      size.width * 0.04846191,
      size.height * 0.4833984,
      size.width * 0.08984375,
      size.height * 0.4456787,
    );
    path0.lineTo(size.width * 0.1181641, size.height * 0.4196778);
    path0.lineTo(size.width * 0.1201172, size.height * 0.9814453);
    path0.lineTo(size.width * 0.1243897, size.height * 0.9875488);
    path0.cubicTo(
      size.width * 0.1340332,
      size.height * 1.000977,
      size.width * 0.1037597,
      size.height,
      size.width * 0.5000000,
      size.height,
    );
    path0.lineTo(size.width * 0.8577881, size.height);
    path0.lineTo(size.width * 0.8654785, size.height * 0.9957275);
    path0.cubicTo(
      size.width * 0.8703613,
      size.height * 0.9929199,
      size.width * 0.8743897,
      size.height * 0.9885254,
      size.width * 0.8769531,
      size.height * 0.9833984,
    );
    path0.cubicTo(
      size.width * 0.8808594,
      size.height * 0.9753418,
      size.width * 0.8808594,
      size.height * 0.9713135,
      size.width * 0.8808594,
      size.height * 0.6965332,
    );
    path0.lineTo(size.width * 0.8808594, size.height * 0.4177246);
    path0.lineTo(size.width * 0.9150391, size.height * 0.4492188);
    path0.cubicTo(
      size.width * 0.9339600,
      size.height * 0.4664307,
      size.width * 0.9515381,
      size.height * 0.4814453,
      size.width * 0.9543457,
      size.height * 0.4824219,
    );
    path0.cubicTo(
      size.width * 0.9791260,
      size.height * 0.4919434,
      size.width * 1.002563,
      size.height * 0.4665528,
      size.width * 0.9912109,
      size.height * 0.4427490,
    );
    path0.cubicTo(
      size.width * 0.9895019,
      size.height * 0.4390869,
      size.width * 0.9528809,
      size.height * 0.4040528,
      size.width * 0.9052734,
      size.height * 0.3607178,
    );
    path0.lineTo(size.width * 0.8222656, size.height * 0.2847900);
    path0.lineTo(size.width * 0.8222656, size.height * 0.05859375);
    path0.lineTo(size.width * 0.8300781, size.height * 0.05859375);
    path0.cubicTo(
      size.width * 0.8464356,
      size.height * 0.05859375,
      size.width * 0.8613281,
      size.height * 0.04467775,
      size.width * 0.8613281,
      size.height * 0.02929688,
    );
    path0.cubicTo(
      size.width * 0.8613281,
      size.height * 0.02026369,
      size.width * 0.8542481,
      size.height * 0.009033187,
      size.width * 0.8457031,
      size.height * 0.004150375,
    );
    path0.cubicTo(size.width * 0.8385010, 0, size.width * 0.8366699, 0, size.width * 0.7341309, 0);
    path0.lineTo(size.width * 0.6298828, 0);
    path0.lineTo(size.width * 0.6223144, size.height * 0.004516594);
    path0.cubicTo(
      size.width * 0.5959473,
      size.height * 0.01953125,
      size.width * 0.6077881,
      size.height * 0.05859375,
      size.width * 0.6386719,
      size.height * 0.05859375,
    );
    path0.lineTo(size.width * 0.6464844, size.height * 0.05859375);
    path0.lineTo(size.width * 0.6464844, size.height * 0.1237793);
    path0.lineTo(size.width * 0.6402588, size.height * 0.1179199);
    path0.cubicTo(
      size.width * 0.5881348,
      size.height * 0.06909181,
      size.width * 0.5156250,
      size.height * 0.004882813,
      size.width * 0.5104981,
      size.height * 0.002685547,
    );
    path0.cubicTo(
      size.width * 0.5017090,
      size.height * -0.0009765625,
      size.width * 0.4943847,
      size.height * -0.0007324219,
      size.width * 0.4869385,
      size.height * 0.003295906,
    );
    path0.close();
    path0.moveTo(size.width * 0.7636719, size.height * 0.1448975);
    path0.lineTo(size.width * 0.7636719, size.height * 0.2312012);
    path0.lineTo(size.width * 0.7564697, size.height * 0.2243652);
    path0.cubicTo(
      size.width * 0.7523193,
      size.height * 0.2207031,
      size.width * 0.7390137,
      size.height * 0.2083740,
      size.width * 0.7271728,
      size.height * 0.1972656,
    );
    path0.lineTo(size.width * 0.7050781, size.height * 0.1771240);
    path0.lineTo(size.width * 0.7050781, size.height * 0.05859375);
    path0.lineTo(size.width * 0.7636719, size.height * 0.05859375);
    path0.close();
    path0.moveTo(size.width * 0.6623535, size.height * 0.2177734);
    path0.lineTo(size.width * 0.8222656, size.height * 0.3642578);
    path0.lineTo(size.width * 0.8222656, size.height * 0.9414063);
    path0.lineTo(size.width * 0.1777344, size.height * 0.9414063);
    path0.lineTo(size.width * 0.1779785, size.height * 0.6527100);
    path0.lineTo(size.width * 0.1779785, size.height * 0.3642578);
    path0.lineTo(size.width * 0.3382568, size.height * 0.2171631);
    path0.cubicTo(
      size.width * 0.4263916,
      size.height * 0.1363525,
      size.width * 0.4993897,
      size.height * 0.07055662,
      size.width * 0.5006103,
      size.height * 0.07092284,
    );
    path0.cubicTo(
      size.width * 0.5015869,
      size.height * 0.07104494,
      size.width * 0.5744629,
      size.height * 0.1373291,
      size.width * 0.6623535,
      size.height * 0.2177734,
    );
    path0.close();
    path0.moveTo(size.width * 0.6623535, size.height * 0.2177734);

    final paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.black;
    canvas.drawPath(path0, paint0Fill);

    final path1 = Path();
    path1.moveTo(size.width * 0.4787597, size.height * 0.2414551);
    path1.cubicTo(
      size.width * 0.4449463,
      size.height * 0.2503662,
      size.width * 0.4191894,
      size.height * 0.2795410,
      size.width * 0.4140625,
      size.height * 0.3137207,
    );
    path1.cubicTo(
      size.width * 0.4128418,
      size.height * 0.3218994,
      size.width * 0.4121094,
      size.height * 0.3942871,
      size.width * 0.4121094,
      size.height * 0.4957275,
    );
    path1.lineTo(size.width * 0.4121094, size.height * 0.6644287);
    path1.lineTo(size.width * 0.4033203, size.height * 0.6744385);
    path1.cubicTo(
      size.width * 0.3851318,
      size.height * 0.6950684,
      size.width * 0.3743897,
      size.height * 0.7252197,
      size.width * 0.3743897,
      size.height * 0.7548828,
    );
    path1.cubicTo(
      size.width * 0.3743897,
      size.height * 0.7897949,
      size.width * 0.3861084,
      size.height * 0.8177490,
      size.width * 0.4111328,
      size.height * 0.8430176,
    );
    path1.cubicTo(
      size.width * 0.4293213,
      size.height * 0.8610840,
      size.width * 0.4505615,
      size.height * 0.8730469,
      size.width * 0.4736328,
      size.height * 0.8779297,
    );
    path1.cubicTo(
      size.width * 0.5286865,
      size.height * 0.8894043,
      size.width * 0.5852051,
      size.height * 0.8629150,
      size.width * 0.6109619,
      size.height * 0.8132324,
    );
    path1.cubicTo(
      size.width * 0.6223144,
      size.height * 0.7912598,
      size.width * 0.6256103,
      size.height * 0.7756348,
      size.width * 0.6246338,
      size.height * 0.7490234,
    );
    path1.cubicTo(
      size.width * 0.6232910,
      size.height * 0.7177734,
      size.width * 0.6136475,
      size.height * 0.6933594,
      size.width * 0.5943603,
      size.height * 0.6716309,
    );
    path1.lineTo(size.width * 0.5878906, size.height * 0.6646728);
    path1.lineTo(size.width * 0.5875244, size.height * 0.4840088);
    path1.lineTo(size.width * 0.5869141, size.height * 0.3034668);
    path1.lineTo(size.width * 0.5797119, size.height * 0.2888184);
    path1.cubicTo(
      size.width * 0.5603027,
      size.height * 0.2500000,
      size.width * 0.5189209,
      size.height * 0.2304688,
      size.width * 0.4787597,
      size.height * 0.2414551,
    );
    path1.close();
    path1.moveTo(size.width * 0.5136719, size.height * 0.3004150);
    path1.cubicTo(
      size.width * 0.5173340,
      size.height * 0.3021240,
      size.width * 0.5224609,
      size.height * 0.3066406,
      size.width * 0.5247803,
      size.height * 0.3103028,
    );
    path1.cubicTo(
      size.width * 0.5292969,
      size.height * 0.3170166,
      size.width * 0.5292969,
      size.height * 0.3171387,
      size.width * 0.5292969,
      size.height * 0.3937988,
    );
    path1.lineTo(size.width * 0.5292969, size.height * 0.4707031);
    path1.lineTo(size.width * 0.4707031, size.height * 0.4707031);
    path1.lineTo(size.width * 0.4707031, size.height * 0.3988037);
    path1.cubicTo(
      size.width * 0.4707031,
      size.height * 0.3593750,
      size.width * 0.4714356,
      size.height * 0.3238525,
      size.width * 0.4724121,
      size.height * 0.3197022,
    );
    path1.cubicTo(
      size.width * 0.4768066,
      size.height * 0.3013916,
      size.width * 0.4968262,
      size.height * 0.2919922,
      size.width * 0.5136719,
      size.height * 0.3004150,
    );
    path1.close();
    path1.moveTo(size.width * 0.5292969, size.height * 0.6038818);
    path1.cubicTo(
      size.width * 0.5292969,
      size.height * 0.6513672,
      size.width * 0.5300293,
      size.height * 0.6813965,
      size.width * 0.5314941,
      size.height * 0.6862793,
    );
    path1.cubicTo(
      size.width * 0.5328369,
      size.height * 0.6911621,
      size.width * 0.5373535,
      size.height * 0.6976318,
      size.width * 0.5439453,
      size.height * 0.7043457,
    );
    path1.cubicTo(
      size.width * 0.5498047,
      size.height * 0.7099609,
      size.width * 0.5570068,
      size.height * 0.7193603,
      size.width * 0.5599365,
      size.height * 0.7249756,
    );
    path1.cubicTo(
      size.width * 0.5648193,
      size.height * 0.7343750,
      size.width * 0.5654297,
      size.height * 0.7373047,
      size.width * 0.5654297,
      size.height * 0.7548828,
    );
    path1.cubicTo(
      size.width * 0.5654297,
      size.height * 0.7724609,
      size.width * 0.5648193,
      size.height * 0.7753906,
      size.width * 0.5599365,
      size.height * 0.7847900,
    );
    path1.cubicTo(
      size.width * 0.5267334,
      size.height * 0.8479004,
      size.width * 0.4326172,
      size.height * 0.8251953,
      size.width * 0.4332275,
      size.height * 0.7541504,
    );
    path1.cubicTo(
      size.width * 0.4332275,
      size.height * 0.7343750,
      size.width * 0.4392090,
      size.height * 0.7207031,
      size.width * 0.4541016,
      size.height * 0.7062988,
    );
    path1.cubicTo(
      size.width * 0.4606934,
      size.height * 0.6995850,
      size.width * 0.4671631,
      size.height * 0.6923828,
      size.width * 0.4685059,
      size.height * 0.6900635,
    );
    path1.cubicTo(
      size.width * 0.4700928,
      size.height * 0.6871338,
      size.width * 0.4707031,
      size.height * 0.6627197,
      size.width * 0.4707031,
      size.height * 0.6076660,
    );
    path1.lineTo(size.width * 0.4707031, size.height * 0.5292969);
    path1.lineTo(size.width * 0.5292969, size.height * 0.5292969);
    path1.close();
    path1.moveTo(size.width * 0.5292969, size.height * 0.6038818);

    final paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = Colors.black;
    canvas.drawPath(path1, paint1Fill);

    final path2 = Path();
    path2.moveTo(size.width * 0.3101807, size.height * 0.3576660);
    path2.cubicTo(
      size.width * 0.3017578,
      size.height * 0.3619385,
      size.width * 0.2949219,
      size.height * 0.3734131,
      size.width * 0.2949219,
      size.height * 0.3828125,
    );
    path2.cubicTo(
      size.width * 0.2949219,
      size.height * 0.3925781,
      size.width * 0.3017578,
      size.height * 0.4036865,
      size.width * 0.3105469,
      size.height * 0.4082031,
    );
    path2.cubicTo(
      size.width * 0.3167725,
      size.height * 0.4113769,
      size.width * 0.3220215,
      size.height * 0.4121094,
      size.width * 0.3388672,
      size.height * 0.4121094,
    );
    path2.cubicTo(
      size.width * 0.3557129,
      size.height * 0.4121094,
      size.width * 0.3609619,
      size.height * 0.4113769,
      size.width * 0.3671875,
      size.height * 0.4082031,
    );
    path2.cubicTo(
      size.width * 0.3759766,
      size.height * 0.4036865,
      size.width * 0.3828125,
      size.height * 0.3925781,
      size.width * 0.3828125,
      size.height * 0.3828125,
    );
    path2.cubicTo(
      size.width * 0.3828125,
      size.height * 0.3730469,
      size.width * 0.3759766,
      size.height * 0.3619385,
      size.width * 0.3671875,
      size.height * 0.3574219,
    );
    path2.cubicTo(
      size.width * 0.3562012,
      size.height * 0.3518066,
      size.width * 0.3209228,
      size.height * 0.3519287,
      size.width * 0.3101807,
      size.height * 0.3576660,
    );
    path2.close();
    path2.moveTo(size.width * 0.3101807, size.height * 0.3576660);

    final paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = Colors.black;
    canvas.drawPath(path2, paint2Fill);

    final path3 = Path();
    path3.moveTo(size.width * 0.6324463, size.height * 0.3576660);
    path3.cubicTo(
      size.width * 0.6240234,
      size.height * 0.3619385,
      size.width * 0.6171875,
      size.height * 0.3734131,
      size.width * 0.6171875,
      size.height * 0.3828125,
    );
    path3.cubicTo(
      size.width * 0.6171875,
      size.height * 0.3925781,
      size.width * 0.6240234,
      size.height * 0.4036865,
      size.width * 0.6328125,
      size.height * 0.4082031,
    );
    path3.cubicTo(
      size.width * 0.6390381,
      size.height * 0.4113769,
      size.width * 0.6442871,
      size.height * 0.4121094,
      size.width * 0.6611328,
      size.height * 0.4121094,
    );
    path3.cubicTo(
      size.width * 0.6779785,
      size.height * 0.4121094,
      size.width * 0.6832275,
      size.height * 0.4113769,
      size.width * 0.6894531,
      size.height * 0.4082031,
    );
    path3.cubicTo(
      size.width * 0.6982422,
      size.height * 0.4036865,
      size.width * 0.7050781,
      size.height * 0.3925781,
      size.width * 0.7050781,
      size.height * 0.3828125,
    );
    path3.cubicTo(
      size.width * 0.7050781,
      size.height * 0.3730469,
      size.width * 0.6982422,
      size.height * 0.3619385,
      size.width * 0.6894531,
      size.height * 0.3574219,
    );
    path3.cubicTo(
      size.width * 0.6784668,
      size.height * 0.3518066,
      size.width * 0.6431885,
      size.height * 0.3519287,
      size.width * 0.6324463,
      size.height * 0.3576660,
    );
    path3.close();
    path3.moveTo(size.width * 0.6324463, size.height * 0.3576660);

    final paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = Colors.black;
    canvas.drawPath(path3, paint3Fill);

    final path4 = Path();
    path4.moveTo(size.width * 0.3101807, size.height * 0.4748535);
    path4.cubicTo(
      size.width * 0.3017578,
      size.height * 0.4791260,
      size.width * 0.2949219,
      size.height * 0.4906006,
      size.width * 0.2949219,
      size.height * 0.5000000,
    );
    path4.cubicTo(
      size.width * 0.2949219,
      size.height * 0.5097656,
      size.width * 0.3017578,
      size.height * 0.5208740,
      size.width * 0.3105469,
      size.height * 0.5253906,
    );
    path4.cubicTo(
      size.width * 0.3167725,
      size.height * 0.5285644,
      size.width * 0.3220215,
      size.height * 0.5292969,
      size.width * 0.3388672,
      size.height * 0.5292969,
    );
    path4.cubicTo(
      size.width * 0.3557129,
      size.height * 0.5292969,
      size.width * 0.3609619,
      size.height * 0.5285644,
      size.width * 0.3671875,
      size.height * 0.5253906,
    );
    path4.cubicTo(
      size.width * 0.3759766,
      size.height * 0.5208740,
      size.width * 0.3828125,
      size.height * 0.5097656,
      size.width * 0.3828125,
      size.height * 0.5000000,
    );
    path4.cubicTo(
      size.width * 0.3828125,
      size.height * 0.4902344,
      size.width * 0.3759766,
      size.height * 0.4791260,
      size.width * 0.3671875,
      size.height * 0.4746094,
    );
    path4.cubicTo(
      size.width * 0.3562012,
      size.height * 0.4689941,
      size.width * 0.3209228,
      size.height * 0.4691162,
      size.width * 0.3101807,
      size.height * 0.4748535,
    );
    path4.close();
    path4.moveTo(size.width * 0.3101807, size.height * 0.4748535);

    final paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = Colors.black;
    canvas.drawPath(path4, paint4Fill);

    final path5 = Path();
    path5.moveTo(size.width * 0.6324463, size.height * 0.4748535);
    path5.cubicTo(
      size.width * 0.6240234,
      size.height * 0.4791260,
      size.width * 0.6171875,
      size.height * 0.4906006,
      size.width * 0.6171875,
      size.height * 0.5000000,
    );
    path5.cubicTo(
      size.width * 0.6171875,
      size.height * 0.5097656,
      size.width * 0.6240234,
      size.height * 0.5208740,
      size.width * 0.6328125,
      size.height * 0.5253906,
    );
    path5.cubicTo(
      size.width * 0.6390381,
      size.height * 0.5285644,
      size.width * 0.6442871,
      size.height * 0.5292969,
      size.width * 0.6611328,
      size.height * 0.5292969,
    );
    path5.cubicTo(
      size.width * 0.6779785,
      size.height * 0.5292969,
      size.width * 0.6832275,
      size.height * 0.5285644,
      size.width * 0.6894531,
      size.height * 0.5253906,
    );
    path5.cubicTo(
      size.width * 0.6982422,
      size.height * 0.5208740,
      size.width * 0.7050781,
      size.height * 0.5097656,
      size.width * 0.7050781,
      size.height * 0.5000000,
    );
    path5.cubicTo(
      size.width * 0.7050781,
      size.height * 0.4902344,
      size.width * 0.6982422,
      size.height * 0.4791260,
      size.width * 0.6894531,
      size.height * 0.4746094,
    );
    path5.cubicTo(
      size.width * 0.6784668,
      size.height * 0.4689941,
      size.width * 0.6431885,
      size.height * 0.4691162,
      size.width * 0.6324463,
      size.height * 0.4748535,
    );
    path5.close();
    path5.moveTo(size.width * 0.6324463, size.height * 0.4748535);

    final paint5Fill = Paint()..style = PaintingStyle.fill;
    paint5Fill.color = Colors.black;
    canvas.drawPath(path5, paint5Fill);

    final path6 = Path();
    path6.moveTo(size.width * 0.3101807, size.height * 0.5920410);
    path6.cubicTo(
      size.width * 0.3017578,
      size.height * 0.5963135,
      size.width * 0.2949219,
      size.height * 0.6077881,
      size.width * 0.2949219,
      size.height * 0.6171875,
    );
    path6.cubicTo(
      size.width * 0.2949219,
      size.height * 0.6269531,
      size.width * 0.3017578,
      size.height * 0.6380615,
      size.width * 0.3105469,
      size.height * 0.6425781,
    );
    path6.cubicTo(
      size.width * 0.3167725,
      size.height * 0.6457519,
      size.width * 0.3220215,
      size.height * 0.6464844,
      size.width * 0.3388672,
      size.height * 0.6464844,
    );
    path6.cubicTo(
      size.width * 0.3557129,
      size.height * 0.6464844,
      size.width * 0.3609619,
      size.height * 0.6457519,
      size.width * 0.3671875,
      size.height * 0.6425781,
    );
    path6.cubicTo(
      size.width * 0.3759766,
      size.height * 0.6380615,
      size.width * 0.3828125,
      size.height * 0.6269531,
      size.width * 0.3828125,
      size.height * 0.6171875,
    );
    path6.cubicTo(
      size.width * 0.3828125,
      size.height * 0.6074219,
      size.width * 0.3759766,
      size.height * 0.5963135,
      size.width * 0.3671875,
      size.height * 0.5917969,
    );
    path6.cubicTo(
      size.width * 0.3562012,
      size.height * 0.5861816,
      size.width * 0.3209228,
      size.height * 0.5863037,
      size.width * 0.3101807,
      size.height * 0.5920410,
    );
    path6.close();
    path6.moveTo(size.width * 0.3101807, size.height * 0.5920410);

    final paint6Fill = Paint()..style = PaintingStyle.fill;
    paint6Fill.color = Colors.black;
    canvas.drawPath(path6, paint6Fill);

    final path7 = Path();
    path7.moveTo(size.width * 0.6324463, size.height * 0.5920410);
    path7.cubicTo(
      size.width * 0.6240234,
      size.height * 0.5963135,
      size.width * 0.6171875,
      size.height * 0.6077881,
      size.width * 0.6171875,
      size.height * 0.6171875,
    );
    path7.cubicTo(
      size.width * 0.6171875,
      size.height * 0.6269531,
      size.width * 0.6240234,
      size.height * 0.6380615,
      size.width * 0.6328125,
      size.height * 0.6425781,
    );
    path7.cubicTo(
      size.width * 0.6390381,
      size.height * 0.6457519,
      size.width * 0.6442871,
      size.height * 0.6464844,
      size.width * 0.6611328,
      size.height * 0.6464844,
    );
    path7.cubicTo(
      size.width * 0.6779785,
      size.height * 0.6464844,
      size.width * 0.6832275,
      size.height * 0.6457519,
      size.width * 0.6894531,
      size.height * 0.6425781,
    );
    path7.cubicTo(
      size.width * 0.6982422,
      size.height * 0.6380615,
      size.width * 0.7050781,
      size.height * 0.6269531,
      size.width * 0.7050781,
      size.height * 0.6171875,
    );
    path7.cubicTo(
      size.width * 0.7050781,
      size.height * 0.6074219,
      size.width * 0.6982422,
      size.height * 0.5963135,
      size.width * 0.6894531,
      size.height * 0.5917969,
    );
    path7.cubicTo(
      size.width * 0.6784668,
      size.height * 0.5861816,
      size.width * 0.6431885,
      size.height * 0.5863037,
      size.width * 0.6324463,
      size.height * 0.5920410,
    );
    path7.close();
    path7.moveTo(size.width * 0.6324463, size.height * 0.5920410);

    final paint7Fill = Paint()..style = PaintingStyle.fill;
    paint7Fill.color = Colors.black;
    canvas.drawPath(path7, paint7Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
