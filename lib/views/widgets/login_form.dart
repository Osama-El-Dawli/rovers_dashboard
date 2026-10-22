import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:rovers_dashboard/core/cache/prefs.dart';
import 'package:rovers_dashboard/core/helper/flutter_toast.dart';
import 'package:rovers_dashboard/core/services/failure.dart';
import 'package:rovers_dashboard/core/utils/app_assets.dart';
import 'package:rovers_dashboard/providers/auth_provider.dart';
import 'package:rovers_dashboard/views/home_view.dart';
import 'package:rovers_dashboard/views/widgets/custom_button.dart';
import 'package:rovers_dashboard/views/widgets/custom_text_form_field.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authProvider, (_, next) {
      next.whenOrNull(
        error: (e, _) {
          Navigator.pop(context);
          if (e is Failure) {
            showToast(message: e.message);
          } else {
            showToast(message: e.toString());
          }
        },
        data: (response) {
          if (response != null) {
            Prefs.setIsLoggedIn(true);
            Navigator.pop(context);
            showToast(message: 'تم تسجيل الدخول بنجاح');
            Navigator.pushReplacementNamed(context, HomeView.routeName);
          }
        },
        loading: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) => Center(
              child: LottieBuilder.asset(
                AppAssets.lottiesFireLoading,
                width: 200,
                height: 200,
              ),
            ),
          );
        },
      );
    });

    final isLoading = ref.watch(authProvider).isLoading;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          const Text('البريد الالكتروني'),
          const SizedBox(height: 8),
          CustomTextFormField(
            controller: emailController,
            hintText: 'ادخل البريد الالكتروني',
            keyboardType: .emailAddress,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'الرجاء إدخال البريد الالكتروني';
              }
              if (!value.contains('@')) {
                return 'البريد الالكتروني غير صحيح';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          const Text('كلمة المرور'),
          const SizedBox(height: 8),
          CustomTextFormField(
            controller: passwordController,
            hintText: 'ادخل كلمة المرور',
            isPassword: true,
            showPasswordIcon: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال كلمة المرور';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          CustomButton(
            onPressed: isLoading
                ? null
                : () {
                    if (_formKey.currentState!.validate()) {
                      ref.read(authProvider.notifier).login(
                            email: emailController.text.trim(),
                            password: passwordController.text,
                          );
                    }
                  },
            text: 'تسجيل الدخول',
          ),
        ],
      ),
    );
  }
}
