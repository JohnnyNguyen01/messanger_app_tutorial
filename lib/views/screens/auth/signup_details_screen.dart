import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_messenger_tutorial/utils/validators.dart';
import '../../../constants/constants.dart';
import '../../../constants/hooks.dart';
import '../../../domain/providers/auth.dart';

/// SignUp Details Screen
///
/// Where the User uploads a selfie and adds their name.
class SignUpDetailsScreen extends HookWidget {
  ///[SignUpDetailsScreen] constructor
  const SignUpDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = useProvider(authProvider);
    final authNotifier = useProvider(authProvider.notifier);
    final theme = useTheme();
    final screenSize = useScreenSize();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Sgn up'),
      ),
      body: auth.when(
        error: (_) => null,
        unAuthenticated: () => null,
        authenticated: (_) => null,
        loading: () => null,
        signedUpFirstTime: (_, __, userAvatar) => Center(
          child: SizedBox(
            width: screenSize.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Circle Avatar
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: userAvatar != null
                            ? Border.all(color: theme.primaryColor, width: 5)
                            : null,
                      ),
                      child: CircleAvatar(
                        radius: circleAvatarRadius,
                        child: userAvatar == null
                            ? Icon(
                                Icons.person,
                                size: 80,
                              )
                            : null,
                        foregroundColor: Colors.white,
                        backgroundColor: theme.primaryColor,
                        backgroundImage:
                            userAvatar != null ? FileImage(userAvatar) : null,
                      ),
                    ),
                    Positioned(
                      child: FloatingActionButton(
                        onPressed: authNotifier.getImageFileFromGallery,
                        child: Icon(Icons.edit),
                      ),
                      right: 1,
                      bottom: 1,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Card(
                  margin: EdgeInsets.all(12),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 15,
                    ),
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: firstNameController,
                              validator: StringValidators.firstNameValidator,
                              decoration: InputDecoration(
                                  hintText: 'Enter your name here',
                                  labelText: 'First Name',
                                  helperText:
                                      'Or whatever you like to call yourself 😉'),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: lastNameController,
                              validator: StringValidators.lastNameValidator,
                              decoration: InputDecoration(
                                hintText: 'Enter your last name here',
                                labelText: 'Last Name',
                              ),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState != null) {
                                  if (formKey.currentState!.validate()) {}
                                }
                              },
                              child: const Text('Enter the club'),
                            ),
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
      ),
    );
  }
}
