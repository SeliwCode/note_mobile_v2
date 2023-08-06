import '../../feature/_feature_exports.dart';
import '../_core_exports.dart';

final serviceLocator = GetIt.instance;

Future<void> initialize() async {
  // Controllers
  CredentialController credentialController = Get.put(CredentialController());
  serviceLocator.registerLazySingleton<CredentialController>(() => credentialController);

  NoteController noteController = Get.put(NoteController());
  serviceLocator.registerLazySingleton<NoteController>(() => noteController);

}
