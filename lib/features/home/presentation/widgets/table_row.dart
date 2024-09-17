import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:varosa_currency_exchange/core/constants/app_colors.dart';
import 'package:varosa_currency_exchange/features/home/data/currency_to_country.dart';
import 'package:varosa_currency_exchange/features/home/models/currency_item.dart';
import 'package:varosa_currency_exchange/features/home/presentation/widgets/table_row_item.dart';

class CustomTableRow extends StatelessWidget {
  const CustomTableRow({
    super.key,
    required this.currencyItem,
    required this.index,
  });

  final CurrencyItem currencyItem;
  final int index;

  @override
  Widget build(BuildContext context) {
    final color = index % 2 == 0
        ? AppColors.tableBody
        : AppColors.tableBody.withOpacity(0.5);
    return Container(
      decoration: BoxDecoration(color: color),
      child: Row(
        children: [
          TableRowItem.withCountry(
            flex: 2,
            rowItem:
                "${currencyItem.currency.currencyCode} (${currencyItem.currency.currencyName})",
            rowWidget:
                currencyToCountry[currencyItem.currency.currencyCode] != null
                    ? CountryFlag.fromCountryCode(
                        currencyToCountry[currencyItem.currency.currencyCode]!,
                        shape: const Rectangle(),
                        height: 15,
                        width: 20,
                      )
                    : const SizedBox(),
          ),
          TableRowItem(
            rowItem: currencyItem.currency.unit.toString(),
          ),
          TableRowItem(
            rowItem: currencyItem.buy.toStringAsFixed(2),
          ),
          TableRowItem(
            rowItem: currencyItem.sell.toStringAsFixed(2),
          ),
        ],
      ),
    );
  }
}
