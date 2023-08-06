import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_mobile_v2/feature/credential/view/_view_exports.dart';

import '../../../core/_core_exports.dart';

class CredentialController extends GetxController {
  // Controllers
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // Keys
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  final GlobalKey<FormState> createNoteKey = GlobalKey<FormState>();

  // Login
  Future<void> login() async {
    if (loginKey.currentState!.validate()) {
      Get.to(const HomePage());
    }
    //debugPrint("=== Correct.");
  }

  // Register
  Future<void> register() async {
    if (!registerKey.currentState!.validate()) {
      return;
    }

    debugPrint("=== Correct.");
  }
}


