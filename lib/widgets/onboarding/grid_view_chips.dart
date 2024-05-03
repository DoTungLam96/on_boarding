import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/selected_item_cubit.dart';
import '../../model/interesting_model.dart';

class GridViewChips extends StatefulWidget {
  const GridViewChips(
      {super.key,
      required this.title,
      required this.interestingList,
      this.rowAmount});
  final String title;
  final List<InterestingModel> interestingList;
  final int? rowAmount;
  @override
  State<GridViewChips> createState() => _GridViewChipsState();
}

class _GridViewChipsState extends State<GridViewChips> {
  @override
  Widget build(BuildContext context) {
    return widget.interestingList.isEmpty
        ? const SizedBox()
        : Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 20),
                ),
                const SizedBox(
                  height: 24,
                ),
                _buildListChip(),
              ],
            ),
          );
  }

  Widget _buildListChip() {
    return Wrap(
      spacing: 8.0, // gap between adjacent chips
      runSpacing: 4.0, // gap between lines
      children: [...generateItem()],
    );
  }

  List<Widget> generateItem() {
    return widget.interestingList.map((item) {
      final index = widget.interestingList.indexOf(item);
      return BlocBuilder<SelectedItemCubit, InterestingModel?>(
          builder: (context, state) {
        final isSelected = item.isSelected;
        return InkWell(
          onTap: () {
            widget.interestingList[index].isSelected =
                !(widget.interestingList[index].isSelected ?? false);
            context.read<SelectedItemCubit>().selectedItem(
                  item: widget.interestingList[index].copyWith(),
                );
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xff848E94),
                ),
                color: isSelected == true ? const Color(0xffFFF1F4) : null),
            child: Text(
              widget.interestingList[index].name ?? "",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                  color: isSelected == true ? const Color(0xffEE0033) : null,
                  fontWeight: isSelected == true ? FontWeight.bold : null),
            ),
          ),
        );
      });
    }).toList();
  }
}
