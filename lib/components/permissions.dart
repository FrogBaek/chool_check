import 'package:geolocator/geolocator.dart';

class Permissions {
  Future<String> checkLocationPermission() async {
    // 위치 서비스 활성화 여부 확인
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    
    // 위치 서비스 활성화 안 됨
    if (!isLocationEnabled) {
      return '위치 서비스를 활성화해주세요.';
    }
    
    // 위치 권한 확인
    LocationPermission checkedPermission = await Geolocator.checkPermission();

    // 위치 권한 거절됨
    if (checkedPermission == LocationPermission.denied) {
      return '위치 권한을 허용해주세요.';
    }

    // 위치 권한 영구 거절됨 (설정에서 허용해야 함)
    if (checkedPermission == LocationPermission.deniedForever) {
      return '앱의 위치 권한을 설정에서 허용해주세요.';
    }
  
    // 모든 조건 통과되면 위치 권한 허용 완료
    return '위치 권한이 허용되었습니다.';
  }
}
