import 'package:varosa_currency_exchange/core/api/api_constants.dart';
import 'package:varosa_currency_exchange/core/api/api_helper.dart';
import 'package:varosa_currency_exchange/core/extension/date_extension.dart';
import 'package:varosa_currency_exchange/features/home/models/currency_item.dart';

class ExchangeRateService {
  static Future<List<CurrencyItem>?> fetchExchangeRate({DateTime? date}) async {
    try {
      final response = await ApiHelper().get(
        Api.exchangeRateUrl,
        queryParameters: date != null
            ? {
                "date": date.formattedDate,
              }
            : null,
      );
      return response["data"]["payload"] == null
          ? null
          : currencyItemsFromJson(response["data"]["payload"]["rates"]);
    } catch (e) {
      rethrow;
    }
  }
}
