import 'package:chool_check/utils/index.dart';


class Dummy {
  static final List<Location> locations = [
    CompanyModel(
      locationName: "Naver",
      latLng: const LatLng(37.3591784, 127.1048319),
    ),
    CompanyModel(
      locationName: 'Google Korea',
      latLng: const LatLng(37.5659, 126.977),
    ),
    CompanyModel(
      locationName: 'Apple Korea',
      latLng: const LatLng(37.5519, 126.989),
    ),
    CompanyModel(
      locationName: 'Microsoft Korea',
      latLng: const LatLng(37.5139, 127.102),
    ),
  ];
}
