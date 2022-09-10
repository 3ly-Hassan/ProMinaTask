import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:promina_task/utility/constants.dart';

import '../../shared/widgets/menu_button.dart';
import 'widgets/textfield_label.dart';
import 'widgets/category_item.dart';

class CreateTask extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CreateTask({Key? key}) : super(key: key);
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _startController = TextEditingController();
  final TextEditingController _endController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * .1, vertical: height * .03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                )),
                            InkWell(onTap: () {}, child: const MenuButton()),
                          ],
                        ),
                        SizedBox(height: height * .03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Create New Task',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            Icon(
                              Icons.note_add_outlined,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(.3),
                              size: height * .07,
                            )
                          ],
                        ),
                        SizedBox(height: height * .04),
                        TextFieldWithLabel(
                          label: 'Task Name',
                          onTap: () {},
                        ),
                        SizedBox(height: height * .04),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Select Category',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Text(
                              'sea all',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * .04,
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: width * .1),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: width * .04),
                          child: CategoryItem(
                            index: index,
                            label: labels[index],
                          ),
                        );
                      },
                      itemCount: labels.length,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * .1, vertical: height * .05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                                child: TextFieldWithLabel(
                              controller: _dateController,
                              label: 'Date',
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  initialEntryMode:
                                      DatePickerEntryMode.calendarOnly,
                                  firstDate: DateTime.now(),
                                  initialDate: DateTime.now(),
                                  lastDate: DateTime.now()
                                      .add(const Duration(days: 7)),
                                ).then((value) {
                                  _dateController.text =
                                      '${DateFormat.EEEE().format(value!)}, ${DateFormat.d().format(value)} ${DateFormat.MMM().format(value)}';
                                });
                              },
                              node: AlwaysDisabledFocusNode(),
                            )),
                            const SizedBox(width: 70),
                            Material(
                              type: MaterialType.circle,
                              color: Theme.of(context).primaryColor,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.date_range,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: height * .05),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: TextFieldWithLabel(
                              controller: _startController,
                              onTap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                  initialEntryMode: TimePickerEntryMode.input,
                                ).then((value) {
                                  _startController.text =
                                      MaterialLocalizations.of(context)
                                          .formatTimeOfDay(value!);
                                });
                              },
                              node: AlwaysDisabledFocusNode(),
                              label: 'Start time',
                              smallText: true,
                              icon: Icons.arrow_back_ios,
                            )),
                            SizedBox(width: width * .2),
                            Expanded(
                                child: TextFieldWithLabel(
                              controller: _endController,
                              onTap: () {
                                showTimePicker(
                                  initialEntryMode: TimePickerEntryMode.input,
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  _endController.text =
                                      MaterialLocalizations.of(context)
                                          .formatTimeOfDay(value!);
                                });
                              },
                              node: AlwaysDisabledFocusNode(),
                              smallText: true,
                              label: 'End time',
                              icon: Icons.arrow_back_ios,
                            )),
                          ],
                        ),
                        SizedBox(height: height * .04),
                        TextFieldWithLabel(
                          onTap: () {},
                          label: 'Description',
                          smallText: true,
                          description: true,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: width * .13,
                              right: width * .13,
                              top: height * .06,
                              bottom: 20),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).primaryColor,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              minimumSize: const Size(double.infinity, 40),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Theme.of(context).primaryColor),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: Text(
                              'Create Task',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
