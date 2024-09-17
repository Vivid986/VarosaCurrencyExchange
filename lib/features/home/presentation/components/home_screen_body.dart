import 'package:flutter/material.dart';
import 'package:varosa_currency_exchange/features/home/data/table_headers.dart';
import 'package:varosa_currency_exchange/features/home/models/currency_item.dart';
import 'package:varosa_currency_exchange/features/home/presentation/widgets/table_header.dart';
import 'package:varosa_currency_exchange/features/home/presentation/widgets/table_row.dart';
import 'package:varosa_currency_exchange/widgets/error_widget.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
    required this.exchangeRatesData,
  });

  final List<CurrencyItem>? exchangeRatesData;

  @override
  Widget build(BuildContext context) {
    if (exchangeRatesData == null || exchangeRatesData!.isEmpty) {
      return const CustomErrorWidget(
        errorMessage:
            "Exchange rate data is not available for the selected date",
      );
    }
    return Column(
      children: [
        Row(
          children: tableHeaders
              .map(
                (e) => TableHeader(
                  flex: tableHeaders.indexOf(e) == 0 ? 2 : 1,
                  tableHeader: e,
                ),
              )
              .toList(),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: exchangeRatesData!.length,
            itemBuilder: (context, index) => CustomTableRow(
              currencyItem: exchangeRatesData![index],
              index: index,
            ),
          ),
        ),
      ],
    );
  }
}
