import 'package:flutter/material.dart';
import 'package:varosa_currency_exchange/core/theme/app_text_theme.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    this.error,
    this.errorMessage,
  });

  final String? error;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Text(
          errorMessage != null
              ? errorMessage!
              : "Something went wrong, Please try again.",
          style: AppTextTheme.labelText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
