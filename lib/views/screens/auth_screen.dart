import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../constants/hooks.dart';
import '../../constants/assets.dart';

/// Auth Screen
class AuthScreen extends HookWidget {
  /// Auth Screen Constructor
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = useScreenSize();
    final emailTFController = useTextEditingController();
    final passwordOneTFController = useTextEditingController();
    final passwordTwoTFController = useTextEditingController();

    final isLogin = useState(true);

    void handleTextButtons() {
      isLogin.value = !isLogin.value;
      print(isLogin.value);
    }

    return Scaffold(
      backgroundColor: Color(0xFFF2EDE8),
      body: SafeArea(
        child: SizedBox(
          width: screenSize.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.appLogo),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailTFController,
                            decoration: InputDecoration(
                                labelText: 'Email',
                                hintText: 'Enter your email here'),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: passwordOneTFController,
                            decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: 'Enter your password here'),
                          ),
                          const SizedBox(height: 10),
                          isLogin.value
                              ? TextFormField(
                                  controller: passwordTwoTFController,
                                  decoration: InputDecoration(
                                      labelText: 'Password',
                                      hintText: 'Confirm your password',
                                      helperText: 'Confirm your password'),
                                )
                              : Container(),
                          const SizedBox(height: 20),
                          isLogin.value
                              ? _BuildAuthButtons(
                                  screenSize: screenSize,
                                  elevatedButtonLabel: 'Login',
                                  textButtonLabel:
                                      "Don't have an account? Sign Up",
                                  elevatedButtonOnPressed: () {},
                                  textButtonOnPressed: handleTextButtons)
                              : _BuildAuthButtons(
                                  screenSize: screenSize,
                                  elevatedButtonLabel: 'Sign Up',
                                  textButtonLabel:
                                      'Already have an account? Login',
                                  elevatedButtonOnPressed: () {},
                                  textButtonOnPressed: handleTextButtons),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// Sign Up Login Buttons
class _BuildAuthButtons extends StatelessWidget {
  const _BuildAuthButtons({
    required this.screenSize,
    required this.elevatedButtonLabel,
    required this.textButtonLabel,
    required this.elevatedButtonOnPressed,
    required this.textButtonOnPressed,
    Key? key,
  }) : super(key: key);

  final Size screenSize;
  final String elevatedButtonLabel;
  final String textButtonLabel;
  final void Function()? elevatedButtonOnPressed;
  final void Function()? textButtonOnPressed;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          SizedBox(
            width: screenSize.width,
            child: ElevatedButton(
              onPressed: elevatedButtonOnPressed,
              child: Text(
                elevatedButtonLabel,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          TextButton(
            onPressed: textButtonOnPressed,
            child: Text(textButtonLabel),
          ),
        ],
      );
}
