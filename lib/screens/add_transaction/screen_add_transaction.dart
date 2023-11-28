import 'package:flutter/material.dart';
import 'package:money_manager/Models/category/category_model.dart';
import 'package:money_manager/db/category/category_db.dart';

class ScreenAddTransaction extends StatelessWidget {
  static const routeName = "add-transaction";
  const ScreenAddTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Purpose',
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Amount',
              ),
            ),
            TextButton.icon(
              onPressed: () async {
                final _selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(const Duration(days: 30)),
                  lastDate: DateTime.now(),
                );

                if (_selectedDate == null) {
                  return;
                }
                {
                  print(_selectedDate.toString());
                }
              },
              icon: Icon(Icons.calendar_today),
              label: Text("Select Date"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Radio(
                      value: false,
                      groupValue: CategoryType.income,
                      onChanged: (newValue) {},
                    ),
                    Text("Income"),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: false,
                      groupValue: CategoryType.expense,
                      onChanged: (newValue) {},
                    ),
                    Text("Expense"),
                  ],
                ),
              ],
            ),
            DropdownButton(
              hint: Text("Select Category"),
              items: CategoryDB().expenseCategoryListLisener.value.map((e) {
                return DropdownMenuItem(
                  value: e.id,
                  child: Text(e.name),
                );
              }).toList(),
              onChanged: (selectedValue) {},
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Submit"),
            )
          ],
        ),
      )),
    );
  }
}
