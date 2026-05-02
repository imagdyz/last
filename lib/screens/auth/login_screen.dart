import '../../utils/responsive_utils.dart';
import 'widgets/custom_buttom.dart';
import 'widgets/custom_header.dart';
import 'widgets/custom_snackbar.dart';
import 'widgets/custom_textfield.dart';
import 'colors.dart';
import 'custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isTrue = true;
  bool isLoading = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final _formKey = GlobalKey<FormState>();
  Future<void> logIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      // Simulate network request
      await Future.delayed(const Duration(seconds: 1));

      final emailLower = email.text.trim().toLowerCase();
      if ((emailLower == "dr.hany@gmail.com" ||
              emailLower == "salma@gmail.com" ||
              emailLower == "abzoo@gmail.com" ||
              emailLower == "shahd@gmail.com" ||
              emailLower == "mig@gmail.com" ||
              emailLower == "shaimaa@gmail.com") &&
          password.text.trim() == "123456") {
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/step1');
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar('البريد الإلكتروني أو كلمة المرور غير صحيحة'),
          );
        }
      }

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  Future signInWithGoogle() async {
    setState(() {
      isLoading = true;
    });
    // Simulate network request
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      isLoading = false;
    });
    // if (mounted) {
    //   Navigator.pushReplacementNamed(context, '/step1');
    // }
  }

  Future<void> forgetPass() async {
    if (email.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(customSnackBar('please input your email.'));
      return;
    }
    if (!email.text.endsWith("@gmail.com")) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(customSnackBar('Please enter a valid @gmail.com address'));
      return;
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(customSnackBar('Check your email for reset instructions.'));
  }

  @override
  Widget build(BuildContext context) {
    final padding = context.basePadding;
    final topGap = context.authTopSpacing;
    final sectionGap = context.sectionGap;
    final maxWidth = context.maxContentWidth;

    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.all(padding),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: maxWidth),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Gap(topGap),
                          const CustomHeader(),
                          Gap(sectionGap),
                          Form(
                            autovalidateMode: AutovalidateMode.disabled,
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                CustomTextfield(
                                  validatorr: (value) {
                                    if (value == null || !value.contains("@")) {
                                      return 'البريد الإلكتروني غير صالح';
                                    }
                                    return null;
                                  },
                                  type: email,
                                  hintText: 'Enter Your Email',
                                ),
                                Gap(sectionGap * 0.5),
                                CustomTextfield(
                                  validatorr: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'كلمة المرور مطلوبة';
                                    }
                                    return null;
                                  },
                                  type: password,
                                  ispassword: isTrue,
                                  icons: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isTrue = !isTrue;
                                      });
                                    },
                                    child: isTrue
                                        ? const Icon(Icons.visibility_off)
                                        : Icon(
                                            Icons.visibility,
                                            color: AppColors.primary,
                                          ),
                                  ),
                                  hintText: 'Enter Your password',
                                ),
                                Gap(sectionGap * 0.25),
                              ],
                            ),
                          ),
                          Gap(sectionGap),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: logIn,
                                child: CustomButtom(
                                  text: isLoading
                                      ? const CupertinoActivityIndicator(
                                          color: Colors.white,
                                        )
                                      : CustomText(
                                          text: 'Login',
                                          color: Colors.white,
                                          size: 18,
                                          weight: FontWeight.bold,
                                          fontFamily: 'RobotoSlab',
                                        ),
                                ),
                              ),
                              Gap(sectionGap * 0.25),
                              CustomText(
                                onTap: forgetPass,
                                fontFamily: 'RobotoSlab',
                                text: 'Forgot password?',
                                color: Colors.grey,
                                weight: FontWeight.w600,
                                size: 14,
                              ),
                              Gap(sectionGap * 0.4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Divider(endIndent: 10, indent: 20),
                                  ),
                                  CustomText(
                                    text: 'Or',
                                    fontFamily: 'RobotoSlab',
                                  ),
                                  Expanded(
                                    child: Divider(endIndent: 20, indent: 10),
                                  ),
                                ],
                              ),
                              Gap(sectionGap * 0.4),
                              GestureDetector(
                                onTap: signInWithGoogle,
                                child: Center(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: context.responsive<double>(
                                        mobile: 16,
                                        tablet: 18,
                                        desktop: 20,
                                      ),
                                      vertical: context.responsive<double>(
                                        mobile: 8,
                                        tablet: 10,
                                        desktop: 10,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                        color: AppColors.primary,
                                        width: 2,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.google,
                                          size: context.responsive<double>(
                                            mobile: 16,
                                            tablet: 17,
                                            desktop: 18,
                                          ),
                                        ),
                                        Gap(
                                          context.responsive<double>(
                                            mobile: 6,
                                            tablet: 8,
                                            desktop: 8,
                                          ),
                                        ),
                                        Flexible(
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            alignment: Alignment.centerLeft,
                                            child: CustomText(
                                              text: 'sign in withe google',
                                              fontFamily: 'RobotoSlab',
                                              weight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Gap(sectionGap),
                              Wrap(
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  CustomText(
                                    text: 'Dont have an account?',
                                    fontFamily: 'RobotoSlab',
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacementNamed(
                                        context,
                                        '/register',
                                      );
                                    },
                                    child: CustomText(
                                      text: ' Register',
                                      weight: FontWeight.w600,
                                      color: AppColors.primary,
                                      fontFamily: 'RobotoSlab',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
