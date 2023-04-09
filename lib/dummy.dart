import 'package:chool_check/src/utils/index.dart';

class Dummy {
  static final List locations = [
    {
      'locationName': "Naver",
      'latLng': const LatLng(37.3591784, 127.1048319),
      'overlayId': "choolCheckCircle1",
      'center': const LatLng(37.3591784, 127.1048319),
      'radius': 100.0,
    },
    {
      'locationName': 'Google',
      'latLng': const LatLng(37.500012, 127.0364185),
      'overlayId': "choolCheckCircle2",
      'center': const LatLng(37.500012, 127.0364185),
      'radius': 1000.0,
    },
    {
      'locationName': 'Apple',
      'latLng': const LatLng(37.5130194, 127.0597816),
      'overlayId': "choolCheckCircle3",
      'center': const LatLng(37.5130194, 127.0597816),
      'radius': 1000.0,
    },
    {
      'locationName': 'Microsoft',
      'latLng': const LatLng(37.5746932, 126.9789672),
      'overlayId': "choolCheckCircle4",
      'center': const LatLng(37.5746932, 126.9789672),
      'radius': 1000,
    },
  ];

  static final Map<String, dynamic> users = {
    'userName': '개구리',
    'companyName': 'Naver',
  };
}
