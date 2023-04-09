import 'package:chool_check/src/utils/index.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MapProvider _mapProvider = Provider.of<MapProvider>(context);
    final UserProvider _userProvider = Provider.of<UserProvider>(context);

    return HomePage(
      mapProvider: _mapProvider,
      userProvider: _userProvider,
    );
  }
}
