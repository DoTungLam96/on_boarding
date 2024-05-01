import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RedDot extends StatelessWidget {
  const RedDot({
    super.key,
    this.count,
  });

  final int? count;

  @override
  Widget build(BuildContext context) {
    if (count == null || count == 0) return const SizedBox();
    final title = (count ?? 0) > 99 ? '99+' : '$count';
    if (count == -1) {
      return Padding(
        padding: const EdgeInsets.only(right: 8, top: 2),
        child: Container(
          width: 9,
          height: 9,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      );
    }
    return Container(
      height: 14,
      constraints: const BoxConstraints(
        minWidth: 14,
      ),
      padding: const EdgeInsets.only(left: 2, right: 2, top: 0.8),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        textScaleFactor: 1.0,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(fontSize: 10, color: Colors.white),
      ),
    );
  }
}
