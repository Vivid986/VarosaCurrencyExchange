List<CurrencyItem> currencyItemsFromJson(List<dynamic> data) =>
    List<CurrencyItem>.from(data.map((e) => CurrencyItem.fromJson(e)));

class CurrencyItem {
  const CurrencyItem({
    required this.currency,
    required this.buy,
    required this.sell,
  });

  final Currency currency;
  final double buy;
  final double sell;

  factory CurrencyItem.fromJson(Map<String, dynamic> json) => CurrencyItem(
        currency: Currency.fromJson(json["currency"]),
        buy: double.tryParse(json["buy"] as String) ?? 0.0,
        sell: double.tryParse(json["sell"] as String) ?? 0.0,
      );
}

class Currency {
  const Currency({
    required this.currencyCode,
    required this.currencyName,
    required this.unit,
  });

  final String currencyCode;
  final String currencyName;
  final int unit;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        currencyCode: json["iso3"],
        currencyName: json["name"],
        unit: json["unit"],
      );
}
