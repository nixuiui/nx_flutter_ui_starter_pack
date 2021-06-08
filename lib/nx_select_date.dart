import 'package:flutter/material.dart';

import 'nx_text_field.dart';

class NxSelectDate extends StatefulWidget {
  const NxSelectDate({
    Key? key,
    this.icon,
    this.useFilter = false,
    this.text = "",
    this.initialDate,
    this.isLoading = false,
    this.label = "",
    this.textError,
    this.onSelected
  }) : super(key: key);

  final String label;
  final String? textError;
  final Widget? icon;
  final bool useFilter;
  final bool isLoading;
  final String text;
  final DateTime? initialDate;
  final ValueChanged<DateTime>? onSelected;

  @override
  _NxSelectDateState createState() => _NxSelectDateState();
}

class _NxSelectDateState extends State<NxSelectDate> {
  @override
  Widget build(BuildContext context) {
    return SelectionBorderBottom(
      label: widget.label,
      textError: widget.textError,
      icon: widget.icon,
      isLoading: widget.isLoading,
      text: widget.text,
      isSelected: widget.initialDate != null,
      suffixIcon: Icons.calendar_today,
      onTap: () => selectDate(context),
    );
  }

  Future selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.initialDate ?? DateTime.now(),
      firstDate: DateTime(1960),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != widget.initialDate) {
      widget.onSelected?.call(picked);
    }
  }
}
