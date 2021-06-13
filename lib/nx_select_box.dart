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

  @override
  _NxSelectBoxState createState() => _NxSelectBoxState();
}

class _NxSelectBoxState extends State<NxSelectBox> {
  @override
  Widget build(BuildContext context) {
    return SelectionBorderBottom(
      label: widget.label,
      textError: widget.textError,
      icon: widget.icon,
      isLoading: widget.isLoading,
      text: widget.text,
      isSelected: widget.selected != null,
      suffixIcon: widget.suffixIcon,
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