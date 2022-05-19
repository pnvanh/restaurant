import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:restaurant/src/constants/constants.dart';
import 'package:restaurant/src/scenes/authentication/blocs/sign_in_bloc.dart';
import 'package:restaurant/src/scenes/authentication/blocs/sign_in_event.dart';
import 'package:restaurant/src/scenes/authentication/blocs/sign_in_state.dart';
import 'package:restaurant/src/scenes/widgets/widgets.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({Key? key}) : super(key: key);

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  late final String _emailString = "";
  late final String _passwordString = "";
  late bool _isButtonDisabled;

  @override
  void initState() {
    super.initState();
    _isButtonDisabled = true;
  }

  void _checkValidateInput() {
    setState(() {
      if (_emailString.isNotEmpty && _passwordString.isNotEmpty) {
        _isButtonDisabled = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            MotionToast.error(
              title: Text("Error"),
              description: Text("Incorrect email or password"),
              position: MOTION_TOAST_POSITION.top,
              layoutOrientation: ORIENTATION.ltr,
              animationType: ANIMATION.fromLeft
            ).show(context);
          }
          if (state.status.isSubmissionSuccess) {
            print('Log in successfullty');
          }
        },
        child: BlocBuilder<SignInBloc, SignInState>(
          buildWhen: (_, __) => true,
          builder: (context, state) {
            return Column(
              children: <Widget>[
                EmailTextField(
                  invalid: state.emailInvalid,
                  emailChanged: (email) => {
                    BlocProvider.of<SignInBloc>(context).add(
                      SignInEmailChanged(email),
                    ),
                  },
                  errorMessage: state.emailErrorMessage ?? '',
                ),
                PasswordTextField(
                  passwordChanged: (password) => {
                    BlocProvider.of<SignInBloc>(context)
                        .add(SignInPasswordChanged(password))
                  },
                  errorMessage: state.passwordErrorMessage ?? '',
                  invalid: state.passwordInvalid,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot password?',
                        style: AppTextStyles.textSemiBold(
                          14,
                          AppColors.jungleGreen,
                        ),
                      )),
                ),
                Container(
                  height: 49.0,
                  width: 256.0,
                  margin: EdgeInsets.only(top: 16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      primary: AppColors.jungleGreen,
                      onPrimary: AppColors.scandal,
                    ),
                    onPressed: () {
                      (state.emailInvalid && state.passwordInvalid)
                          ? null
                          : {
                              FocusManager.instance.primaryFocus?.unfocus(),
                              BlocProvider.of<SignInBloc>(context)
                                  .add(SignInSubmited()),
                            };
                    },
                    // onPressed: _isButtonDisabled
                    //     ? null
                    //     : () {
                    //         print(_passwordString);
                    //       },
                    child: Text(
                      "Log in",
                      style: AppTextStyles.textBold(14, Colors.white),
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
