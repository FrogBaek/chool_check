import 'package:chool_check/utils/index.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MapProvider _mapProvider = Provider.of<MapProvider>(context);

    return HomePage(mapProvider: _mapProvider);
  }
}
