import 'package:flutter/material.dart';
import 'package:honest_sign_flutter_app/custom_provider.dart';
import 'package:honest_sign_flutter_app/ui/screens/first_screen/custom_date_pikcer_model.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({
    super.key,
  });

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  // DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final dateModel = ChangeNotifierProvaider.watch<
        ChangeNotifierProvaider<CustomDatePickerModel>,
        CustomDatePickerModel>(context);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dateModel!.selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.green, // Set your desired color here

            colorScheme: const ColorScheme.light(primary: Colors.green),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != dateModel.selectedDate) {
      // setState(() {
      //   selectedDate = picked;
      //   ChangeNotifierProvaider.read<
      //           ChangeNotifierProvaider<FirstScreenWidgetModel>,
      //           FirstScreenWidgetModel>(context)
      //       ?.setDateOfRelease(
      //     DateFormat('dd.MM.yyyy').format(selectedDate),
      //   );
      // });
      ChangeNotifierProvaider.read<
              ChangeNotifierProvaider<CustomDatePickerModel>,
              CustomDatePickerModel>(context)
          ?.setDateOfRelease(
        picked,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateModel = ChangeNotifierProvaider.watch<
        ChangeNotifierProvaider<CustomDatePickerModel>,
        CustomDatePickerModel>(context);
    return GestureDetector(
      onTap: () {
        _selectDate(context);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateFormat('dd.MM.yyyy')
                  .format(dateModel?.selectedDate ?? DateTime.now()),
              style: const TextStyle(fontSize: 16),
            ),
            const Icon(Icons.calendar_today),
          ],
        ),
      ),
    );
  }
}
