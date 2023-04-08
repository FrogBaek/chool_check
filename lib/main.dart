import 'package:chool_check/src/utils/index.dart';

void main() => runApp(const ChoolCheck());

class ChoolCheck extends StatelessWidget {
  const ChoolCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MapProvider>(create: (_) => MapProvider())],
      child: MaterialApp(
        themeMode: CustomTheme.lightThemeMode,
        theme: CustomTheme.themeData,
        home: const App(),
      ),
    );
  }
}
