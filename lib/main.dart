import 'core/_core_exports.dart';
import 'feature/_feature_exports.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'core/init/dependency_injection.dart' as dependencyInjection;

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await  Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  await dependencyInjection.initialize();
  serviceLocator.allReady().then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: "Note Mobile",
      home: LoginPage(),
      debugShowCheckedModeBanner: false, // emülatör ün sağ üstundeki yazıyı kaldırır
    );
  }
}
