import 'package:flutter/material.dart';
import 'package:varosa_currency_exchange/core/constants/app_colors.dart';
import 'package:varosa_currency_exchange/core/theme/app_text_theme.dart';

class TableHeader extends StatelessWidget {
  const TableHeader({
    super.key,
    required this.tableHeader,
    this.flex = 1,
  });

  final String tableHeader;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        decoration: const BoxDecoration(
          color: AppColors.tableHeader,
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          tableHeader,
          style: AppTextTheme.labelText,
          softWrap: true,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
