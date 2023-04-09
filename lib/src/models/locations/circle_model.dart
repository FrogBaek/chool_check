import 'package:chool_check/src/utils/index.dart';

class CircleModel extends CircleOverlay {
  // color, outlineColor, outlineWidth까지 지정해줘야 정상 작동
  CircleModel({
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

  static CircleModel build({
    required String overlayId,
    required LatLng center,
    required double radius,
    Color color = CustomColor.halfGrenn,
    Color outlineColor = CustomColor.fullGreen,
    int outlineWidth = 1,
  }) {
    return CircleModel(
      overlayId: overlayId,
      center: center,
      radius: radius,
      color: color,
      outlineColor: outlineColor,
      outlineWidth: outlineWidth,
    );
  }

  // Circle 추출
  static List<CircleModel> myCircles() {
    final List<CircleModel> _list = [];

    for (int i = 0; i < Dummy.locations.length; i++) {
      final CompanyModel lc = CompanyModel.fromJson(Dummy.locations[i]);

      _list.add(CircleModel.build(
        overlayId: lc.overlayId,
        center: lc.latLng,
        radius: lc.radius,
      ));
    }
    return _list;
  }
}
