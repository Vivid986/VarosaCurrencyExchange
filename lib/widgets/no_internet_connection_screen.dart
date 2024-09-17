import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:varosa_currency_exchange/core/constants/app_assets.dart';
import 'package:varosa_currency_exchange/core/constants/app_colors.dart';
import 'package:varosa_currency_exchange/core/extension/context_extension.dart';
import 'package:varosa_currency_exchange/core/extension/size_extension.dart';
import 'package:varosa_currency_exchange/core/theme/app_text_theme.dart';

@RoutePage()
class NoInternetConnectionScreen extends StatefulWidget {
  const NoInternetConnectionScreen({super.key});

  @override
  State<NoInternetConnectionScreen> createState() =>
      _NoInternetConnectionScreenState();
}

class _NoInternetConnectionScreenState
    extends State<NoInternetConnectionScreen> {
  final _connectivity = Connectivity();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: context.width * 0.5,
                width: context.width * 0.5,
                child: Lottie.asset(AppAssets.noInternetConnectionAnimation),
              ),
              10.vGap,
              Text(
                "No Internet Connection",
                style: AppTextTheme.labelText,
              ),
              20.vGap,
              ElevatedButton(
                onPressed: () async {
                  final result = await _connectivity.checkConnectivity();
                  if (!context.mounted) return;
                  if (!result.contains(ConnectivityResult.none)) {
                    Navigator.of(context).pop();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.tableHeader,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                ),
                child: const Text("Try Again"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
