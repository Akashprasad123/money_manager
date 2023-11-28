import 'package:flutter/material.dart';
import 'package:money_manager/Models/category/category_model.dart';
import 'package:money_manager/db/category/category_db.dart';
import 'package:money_manager/screens/add_transaction/screen_add_transaction.dart';
import 'package:money_manager/screens/category/category_add_popup.dart';
import 'package:money_manager/screens/category/screen_category.dart';
import 'package:money_manager/screens/home/widgets/bottomNavidation.dart';
import 'package:money_manager/screens/transacstion/screen_transaction.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  final _pages = [const ScreenTransactions(), ScreenCategory()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Money Manager')),
      ),
      backgroundColor: Color.fromARGB(255, 224, 211, 245),
      body: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: selectedIndexNotifier,
              builder: (BuildContext context, int updatedIndex, _) {
                return _pages[updatedIndex];
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndexNotifier.value == 0) {
            // showCategoryAddPopup(context);
            Navigator.of(context).pushNamed(ScreenAddTransaction.routeName);
            print("Add Transactions");
          } else {
            showCategoryAddPopup(context);
            print('Add category');
            // final _sample = CategoryModel(
            //   id: DateTime.now().microsecondsSinceEpoch.toString(),
            //   name: "Travel",
            //   type: CategoryType.expense,
            // );
            // CategoryDB().insertCategory(_sample);
          }
        },
        child: const Icon(Icons.add),
        splashColor: const Color.fromARGB(255, 215, 200, 243),
        elevation: 15,
      ),
      bottomNavigationBar: const MoneyMAnagerBottomNavigation(),
    );
  }
}
