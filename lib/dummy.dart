import 'package:chool_check/src/utils/index.dart';

class Dummy {
  static final List<Location> locations = [
    CompanyModel(
      locationName: "Naver",
      latLng: const LatLng(37.3591784, 127.1048319),
      overlayId: "choolCheckCircle1",
      center: const LatLng(37.3591784, 127.1048319),
      radius: 100,
    ),
    CompanyModel(
      locationName: 'Google Korea',
      latLng: const LatLng(37.5659, 126.977),
      overlayId: "choolCheckCircle2",
      center: const LatLng(37.5659, 126.977),
      radius: 1000,
    ),
    CompanyModel(
      locationName: 'Apple Korea',
      latLng: const LatLng(37.5519, 126.989),
      overlayId: "choolCheckCircle3",
      center: const LatLng(37.5519, 126.989),
      radius: 1000,
    ),
    CompanyModel(
      locationName: 'Microsoft Korea',
      latLng: const LatLng(37.5139, 127.102),
      overlayId: "choolCheckCircle4",
      center: const LatLng(37.5139, 127.102),
      radius: 1000,
    ),
  ];
}
