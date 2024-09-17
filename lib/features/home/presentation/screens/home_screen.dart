import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varosa_currency_exchange/core/extension/date_extension.dart';
import 'package:varosa_currency_exchange/features/home/presentation/components/home_screen_body.dart';
import 'package:varosa_currency_exchange/features/home/provider/exchange_rate_provider.dart';
import 'package:varosa_currency_exchange/widgets/center_loading_indicator.dart';
import 'package:varosa_currency_exchange/widgets/error_widget.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade500,
        title: const Text(
          "Forex Trade",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          Text(
            ref.watch(pickedDateProvider).formattedDate,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: ref.watch(pickedDateProvider),
                firstDate: DateTime(today.year - 30),
                lastDate: today,
                currentDate: ref.watch(pickedDateProvider),
              );
              if (pickedDate != null) {
                ref.read(pickedDateProvider.notifier).state = pickedDate;
              }
            },
            icon: const Icon(
              Icons.calendar_month,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: ref.watch(exchangeRateProvider).when(
            data: (data) => HomeScreenBody(
              exchangeRatesData: data,
            ),
            error: (error, stackTrace) => CustomErrorWidget(
              error: error.toString(),
            ),
            loading: () => const CenterLoadingIndicator(),
          ),
    );
  }
}
