import '../../../../core/_core_exports.dart';
import '../../../_feature_exports.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  // Input fields //Giriş alanları
  List<Widget> get _inputs {
    return [
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
          hintText: "Şifre",
        ),
        controller: serviceLocator<CredentialController>().passwordController,
        validator: (final String? value) {
          if (value != null && value.length >= 8) {
            return null;
          } else {
            return "En az 8 karakter girmelisiniz.";
          }
        },
      ),
    ];
  }

  // AppBar
  PreferredSizeWidget get _appBar {
    return AppBar(
      title: const Text(
        "Login Page",
      ),
      /* actions: [
        TextButton(
          onPressed: _onPressedLoginButton,
          child: const Text(
            "Giriş yap",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ], */
    );
  }

  // Tapped login button
  VoidCallback get _onPressedLoginButton {
    return () async {
      await serviceLocator<CredentialController>().login();
    };
  }

  // Buttons
  List<Widget> get _buttons {
    return [
      TextButton(
        onPressed: _onPressedLoginButton,
        child: const Text(
          "Giriş yap",
        ),
      ),
      TextButton(
        onPressed: () {
          Get.to(const RegisterPage());
        },
        child: const Text(
          "Kayıt Ol",
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: serviceLocator<CredentialController>().loginKey,
          child: Column(
            children: [
              ..._inputs,
              const SizedBox(
                height: 24,
              ),
              ..._buttons,
            ],
          ),
        ),
      ),
    );
  }
}
