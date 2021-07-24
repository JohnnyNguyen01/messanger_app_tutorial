import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../domain/models/states/auth/auth_state.dart';
import '../../../domain/models/values/failure.dart';
import '../../../domain/providers/error.dart';
import '../../../utils/validators.dart';
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
    final errorNotifier = useProvider(errorProvider.notifier);

    return ProviderListener<Failure?>(
      provider: errorProvider,
      onChange: (context, failure) => useSnackBar(
          context: context,
          color: errorColor,
          message: failure?.message ?? 'Something went wrong.'),
      child: Scaffold(
        appBar: AppBar(
          title: Text('About You'),
        ),
        body: Center(
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
                          border: ((auth is SignedUpFirstTime) &&
                                  (auth.imageFile != null))
                              ? Border.all(color: theme.primaryColor, width: 5)
                              : null),
                      child: CircleAvatar(
                        radius: circleAvatarRadius,
                        child: ((auth is SignedUpFirstTime) &&
                                (auth.imageFile != null))
                            ? null
                            : Icon(
                                Icons.person,
                                size: 80,
                              ),
                        foregroundColor: Colors.white,
                        backgroundColor: theme.primaryColor,
                        backgroundImage: ((auth is SignedUpFirstTime) &&
                                (auth.imageFile != null))
                            ? FileImage(auth.imageFile!)
                            : null,
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
                            (auth is Loading)
                                ? CircularProgressIndicator()
                                : ElevatedButton(
                                    onPressed: () {
                                      //todo: add to auth Notifier
                                      if (formKey.currentState != null) {
                                        if (formKey.currentState!.validate() &&
                                            ((auth is SignedUpFirstTime) &&
                                                (auth.imageFile != null))) {
                                          authNotifier.signUpNewUser(
                                              email: auth.email,
                                              password: auth.password,
                                              firstName:
                                                  firstNameController.text,
                                              lastName: lastNameController.text,
                                              file: auth.imageFile!);
                                        } else {
                                          errorNotifier.setNewError(
                                            Failure(
                                              message:
                                                  'Please add a profile photo',
                                            ),
                                          );
                                        }
                                      }
                                    },
                                    child: const Text('Enter the club'),
                                  )
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
