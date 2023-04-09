import 'package:chool_check/src/utils/index.dart';

class CustomCircle extends CircleOverlay {
  // color, outlineColor, outlineWidth까지 지정해줘야 정상 작동
  CustomCircle({
    required String overlayId,
    required LatLng center,
    required double radius,
    Color color = CustomColor.halfGrenn,
    Color outlineColor = CustomColor.fullGreen,
    int outlineWidth = 1,
  }) : super(
          overlayId: overlayId,
          center: center,
          radius: radius,
          color: color,
        );

  static CustomCircle build({
    required String overlayId,
    required LatLng center,
    required double radius,
    Color color = CustomColor.halfGrenn,
    Color outlineColor = CustomColor.fullGreen,
    int outlineWidth = 1,
  }) {
    return CustomCircle(
      overlayId: overlayId,
      center: center,
      radius: radius,
      color: color,
      outlineColor: outlineColor,
      outlineWidth: outlineWidth,
    );
  }
}
