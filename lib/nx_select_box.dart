import 'package:flutter/material.dart';

import 'nx_flutter_ui_starter_pack.dart';
import 'nx_options.dart';
import 'nx_text_field.dart';

class NxSelectBox extends StatefulWidget {
  const NxSelectBox({
    Key? key,
    this.icon,
    this.useFilter = false,
    this.text,
    this.isLoading = false,
    this.label,
    this.textError,
    this.options,
    this.selected,
    this.suffixIcon,
    this.borderRadius,
    this.borderColor,
    this.boxShadow,
    this.padding,
    this.margin,
    this.borderBottom = true,
    this.color = Colors.transparent,
    this.onSelected
  }) : super(key: key);

  final String? label;
  final String? textError;
  final Widget? icon;
  final bool useFilter;
  final bool isLoading;
  final String? text;
  final List<NxOptions>? options;
  final NxOptions? selected;
  final ValueChanged<NxOptions>? onSelected;
  final IconData? suffixIcon;
  final bool borderBottom;
  final double? padding;
  final double? margin;
  final double? borderRadius;
  final Color? borderColor;
  final Color? color;
  final List<BoxShadow>? boxShadow;

  @override
  _NxSelectBoxState createState() => _NxSelectBoxState();
}

class _NxSelectBoxState extends State<NxSelectBox> {
  @override
  Widget build(BuildContext context) {
    return SelectionBorderBottom(
      label: widget.label,
      textError: widget.textError,
      boxShadow: widget.boxShadow,
      icon: widget.icon,
      isLoading: widget.isLoading,
      text: widget.selected != null ? (widget.selected?.name ?? "") : (widget.text ?? "Select"),
      isSelected: widget.selected != null,
      suffixIcon: widget.suffixIcon,
      borderBottom: widget.borderBottom,
      padding: widget.padding,
      margin: widget.margin,
      borderRadius: widget.borderRadius,
      borderColor: widget.borderColor,
      color: widget.color,
      onTap: () => select(context),
    );
  }

  Future select(BuildContext context) async {
    final Map? results = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NxSelectOptions(
        title: 'Select ${widget.label?.toLowerCase() ?? ''}',
        options: widget.options ?? [],
        selected: widget.selected,
        useFilter: widget.useFilter,
      )),
    );

    if (results != null && results.containsKey('data')) {
      widget.onSelected?.call(results['data'] as NxOptions);
    }
  }
}