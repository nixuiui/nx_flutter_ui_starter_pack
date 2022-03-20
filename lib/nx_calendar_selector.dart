import 'package:flutter/material.dart';

class NxCalendarSelector extends StatelessWidget {

  final DateTime? initialDate;
  final Function(DateTime)? dateChanged;
  final Widget Function(DateTime?) child;

  const NxCalendarSelector({
    Key? key,
    required this.child,
    this.initialDate,
    this.dateChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    void _showCalendar() async{
      final picker = await showDatePicker(
        context: context,
        initialDate: initialDate ?? DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now(),
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(primary: Theme.of(context).primaryColor)
            ),
            child: child!,
          );
        }
      );

      if (picker != null) {
        dateChanged?.call(picker);
      }
    }
    
    return InkWell(
      onTap: _showCalendar,
      child: child(initialDate),
    );
  }
}