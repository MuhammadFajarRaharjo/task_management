import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management/common/constants/box_size.dart';
import 'package:task_management/common/styles/app_colors.dart';
import 'package:task_management/common/widgets/custom_filled_button.dart';
import 'package:task_management/common/widgets/custom_text_form_field.dart';
import 'package:task_management/common/widgets/height.spacer.dart';
import 'package:task_management/features/todo/controller/date/date_providers.dart';
import 'package:task_management/features/todo/controller/todo/todo_provider.dart';

class AddTodoPage extends ConsumerStatefulWidget {
  const AddTodoPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends ConsumerState<AddTodoPage> {
  late final TextEditingController titleController;
  late final TextEditingController descController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }

  // Function to show date picker and update state provider
  void _showDatePicker() {
    picker.DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2018, 3, 5),
      maxTime: DateTime(2025, 6, 7),
      theme: const picker.DatePickerTheme(
        doneStyle: TextStyle(
          color: AppColors.green,
          fontSize: 16,
        ),
      ),
      onConfirm: (date) {
        ref.read(dateStateProvider.notifier).setDate(date.toString());
      },
      currentTime: DateTime.now(),
      locale: picker.LocaleType.en,
    );
  }

  // Function to show start time picker and update state provider
  void _showStartDateTimePicker() {
    picker.DatePicker.showDateTimePicker(
      context,
      showTitleActions: true,
      onConfirm: (time) =>
          ref.read(startTimeStateProvider.notifier).setTime(time.toString()),
      currentTime: DateTime.now(),
      locale: picker.LocaleType.id,
    );
  }

  // Function to show end time picker and update state provider
  void _showEndDateTimePicker() {
    picker.DatePicker.showDateTimePicker(
      context,
      showTitleActions: true,
      onConfirm: (time) =>
          ref.read(endTimeStateProvider.notifier).setTime(time.toString()),
      currentTime: DateTime.now(),
    );
  }

  void _submit({
    required String date,
    required String startTime,
    required String endTime,
  }) {
    if (titleController.text.isNotEmpty &&
        descController.text.isNotEmpty &&
        date.isNotEmpty &&
        startTime.isNotEmpty &&
        endTime.isNotEmpty) {
      // save to database
      ref.read(todoStateProvider.notifier).addTodo(
            title: titleController.text,
            desc: descController.text,
            date: date,
            startTime: startTime.substring(10, 16),
            endTime: endTime.substring(10, 16),
          );

      // Clear all state
      ref.read(dateStateProvider.notifier).clear();
      ref.read(startTimeStateProvider.notifier).clear();
      ref.read(endTimeStateProvider.notifier).clear();

      // Pop page
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    String date = ref.watch(dateStateProvider);
    String startTime = ref.watch(startTimeStateProvider);
    String endTime = ref.watch(endTimeStateProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: BoxSize.padding20FW),
          child: ListView(
            children: [
              //* Input Text
              CustomTextFormField(
                controller: titleController,
                hintText: 'Add title',
                hintColor: AppColors.greyLight,
              ),
              HeightSpacer.from20(),
              CustomTextFormField(
                controller: descController,
                hintText: 'Add Description',
                hintColor: AppColors.greyLight,
              ),

              //* Button Date
              HeightSpacer.from20(),
              CustomFilledButton(
                backgorundColor: AppColors.blueLight,
                textColor: Colors.white,
                text: date.isEmpty ? 'Date' : date.substring(0, 10),
                onPressed: _showDatePicker,
              ),

              //* Button Time
              HeightSpacer.from20(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomFilledButton(
                    width: BoxSize.proportionalScreenWidth(42),
                    backgorundColor: AppColors.blueLight,
                    textColor: Colors.white,
                    text: startTime.isEmpty
                        ? 'Start Time'
                        : startTime.substring(10, 16),
                    onPressed: _showStartDateTimePicker,
                  ),
                  CustomFilledButton(
                    width: BoxSize.proportionalScreenWidth(42),
                    backgorundColor: AppColors.blueLight,
                    textColor: Colors.white,
                    text: endTime.isEmpty
                        ? 'End Time'
                        : endTime.substring(10, 16),
                    onPressed: _showEndDateTimePicker,
                  ),
                ],
              ),

              //* Button Submit
              HeightSpacer.from20(),
              CustomFilledButton(
                backgorundColor: AppColors.green,
                textColor: Colors.white,
                text: 'Submit',
                onPressed: () => _submit(
                  date: date,
                  startTime: startTime,
                  endTime: endTime,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
