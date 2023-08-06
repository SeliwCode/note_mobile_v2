import 'package:note_mobile_v2/feature/credential/controller/credential_controller.dart';

import '../../../../core/_core_exports.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  // Input fields //Giriş alanları
  List<Widget> get _inputs {
    return [
      TextFormField(
        decoration: const InputDecoration(
          hintText: "Ad",
        ),
        controller: serviceLocator<CredentialController>().nameController,
        keyboardType: TextInputType.name,
        validator: (final String? value) {
          if (value != null && GetUtils.isUsername(value)) {
            // Doğru
            return null;
          } else {
            return "Hatalı isim girdiniz.";
          }
        },
      ),
      TextFormField(
        decoration: const InputDecoration(
          hintText: "Soyad",
        ),
        controller: serviceLocator<CredentialController>().surnameController,
        keyboardType: TextInputType.name,
        validator: (final String? value) {
          if (value != null && GetUtils.isUsername(value)) {
            // Doğru
            return null;
          } else {
            return "Hatalı soyad girdiniz.";
          }
        },
      ),
      TextFormField(
        decoration: const InputDecoration(
          hintText: "Email",
        ),
        controller: serviceLocator<CredentialController>().emailAddressController,
        keyboardType: TextInputType.emailAddress,
        validator: (final String? value) {
          if (value != null && GetUtils.isEmail(value)) {
            // Doğru
            return null;
          } else {
            return "Hatalı e-posta girdiniz.";
          }
        },
      ),
      TextFormField(
        decoration: const InputDecoration(
          hintText: "Telefon",
        ),
        controller: serviceLocator<CredentialController>().phoneController,
        keyboardType: TextInputType.phone,
        validator: (final String? value) {
          if (value != null && GetUtils.isPhoneNumber(value)) {
            // Doğru
            return null;
          } else {
            return "Hatalı telefon numarası girdiniz.";
          }
        },
      ),
      TextFormField(
        decoration: const InputDecoration(
          hintText: "Şifre",
        ),
        controller: serviceLocator<CredentialController>().passwordController,
        keyboardType: TextInputType.text,
        validator: (final String? value) {
          RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
          var passNonNullValue = value ?? "";
          if (!regex.hasMatch(passNonNullValue)) {
            return ("Hatalı şifre girdiniz.");
          }
          return null;
        },
      ),
    ];
  }

  // Tapped login button
  VoidCallback get _onPressedRegisterButton {
    return () async {
      await serviceLocator<CredentialController>().register();
    };
  }

  // Buttons
  List<Widget> get _buttons {
    return [
      TextButton(
        onPressed: _onPressedRegisterButton,
        child: const Text(
          "Onayla",
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: serviceLocator<CredentialController>().registerKey,
          child: Column(
            children: [
              ..._inputs,
              const SizedBox(
                height: 24,
              ),
              ..._buttons
            ],
          ),
        ),
      ),
    );
  }
}
