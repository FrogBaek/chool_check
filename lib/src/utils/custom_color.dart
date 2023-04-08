import 'package:chool_check/utils/index.dart';

class CustomColor {
  static const Color fullGreen = Color.fromRGBO(45, 180, 0, 1);
  static const Color halfGrenn = Color.fromRGBO(45, 180, 0, 0.5);
  /*
  * Colors.blue.withOpacity(0.5)가 아닌 Color.fromRGBO(0, 0, 255, 0.5)를 쓴 이유
  * 1. RGB로 색상을 더 다채롭게 지정할 수 있음
  * 2. 전자는 런타입에 결정되므로 컴파일 타입에 상수 값으로 결정되는 후자를 채택하여
        동적이 아닌 정적인 계산을 통해 성능 향상을 할 수 있게 함
  */
}