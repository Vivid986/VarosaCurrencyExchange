import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varosa_currency_exchange/features/home/models/currency_item.dart';
import 'package:varosa_currency_exchange/features/home/service/exchange_rate_service.dart';

final exchangeRateProvider =
    FutureProvider.autoDispose<List<CurrencyItem>?>((ref) async {
  final date = ref.watch(pickedDateProvider);
  return await ExchangeRateService.fetchExchangeRate(date: date);
});

final pickedDateProvider = StateProvider<DateTime>(
  (ref) => DateTime.now(),
);
