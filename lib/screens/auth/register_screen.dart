import '../../utils/responsive_utils.dart';
import 'widgets/custom_buttom.dart';
import 'widgets/custom_header.dart';
import 'widgets/custom_textfield.dart';
import 'colors.dart';
import 'custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  bool isTrue = true;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  Future<void> register() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      // Simulate network request
      await Future.delayed(const Duration(seconds: 1));

      if (mounted) {
        Navigator.pushReplacementNamed(context, '/login');
      }

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
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
                          Gap(sectionGap * 1.25),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Gap(sectionGap * 0.5),
                                CustomTextfield(
                                  validatorr: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'Username مطلوب';
                                    }
                                    return null;
                                  },
                                  type: userName,
                                  hintText: 'Enter Your Username',
                                ),
                                Gap(sectionGap * 0.5),
                                CustomTextfield(
                                  validatorr: (value) {
                                    if (value == null || !value.contains("@")) {
                                      return 'Email غير صحيح';
                                    }
                                    return null;
                                  },
                                  type: email,
                                  hintText: 'Enter Your Email',
                                ),
                                Gap(sectionGap * 0.5),
                                CustomTextfield(
                                  validatorr: (value) {
                                    if (value == null || value.length < 6) {
                                      return 'Password لازم 6 حروف على الأقل';
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
                                        ? Icon(Icons.visibility_off)
                                        : Icon(
                                            Icons.visibility,
                                            color: AppColors.primary,
                                          ),
                                  ),
                                  hintText: 'Enter Your password',
                                ),
                              ],
                            ),
                          ),
                          Gap(sectionGap),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: register,
                                child: CustomButtom(
                                  verticall: context.responsive<double>(
                                    mobile: 15,
                                    tablet: 16,
                                    desktop: 18,
                                  ),
                                  horizontall: context.responsive<double>(
                                    mobile:
                                        MediaQuery.of(context).size.width *
                                        0.35,
                                    tablet: 120,
                                    desktop: 140,
                                  ),
                                  text: isLoading
                                      ? const CupertinoActivityIndicator(
                                          color: Colors.white,
                                        )
                                      : CustomText(
                                          text: 'Register',
                                          color: Colors.white,
                                          fontFamily: 'RobotoSlab',
                                          size: 16,
                                          weight: FontWeight.bold,
                                        ),
                                ),
                              ),
                              Gap(sectionGap),
                              Wrap(
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  CustomText(
                                    text: 'Already have an account?',
                                    fontFamily: 'RobotoSlab',
                                    weight: FontWeight.w600,
                                  ),
                                  Gap(4),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacementNamed(
                                        context,
                                        '/login',
                                      );
                                    },
                                    child: CustomText(
                                      text: ' Login',
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
