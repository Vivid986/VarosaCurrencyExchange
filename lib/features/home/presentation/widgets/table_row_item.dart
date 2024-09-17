import 'package:flutter/material.dart';
import 'package:varosa_currency_exchange/core/extension/size_extension.dart';
import 'package:varosa_currency_exchange/core/theme/app_text_theme.dart';

class TableRowItem extends StatelessWidget {
  const TableRowItem({
    super.key,
    required this.rowItem,
    this.flex = 1,
    this.rowWidget,
  }) : assert(rowWidget == null, "Widget should't be provided with row item");

  const TableRowItem.withCountry({
    super.key,
    this.rowItem,
    this.flex = 1,
    required this.rowWidget,
  });

  final String? rowItem;
  final int flex;
  final Widget? rowWidget;

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      rowItem!,
      style: AppTextTheme.contentText,
      maxLines: 2,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
    );

    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        alignment: Alignment.centerLeft,
        child: rowWidget == null
            ? textWidget
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  rowWidget!,
                  10.hGap,
                  Expanded(child: textWidget),
                ],
              ),
      ),
    );
  }
}
