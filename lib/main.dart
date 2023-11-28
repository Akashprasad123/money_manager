import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_manager/Models/category/category_model.dart';
import 'package:money_manager/screens/add_transaction/screen_add_transaction.dart';
import 'package:money_manager/screens/home/screen_home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)) {
    Hive.registerAdapter(CategoryTypeAdapter());
  }
  if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
    Hive.registerAdapter(CategoryModelAdapter());
  }
  runApp(MoneyManager());
}

class MoneyManager extends StatelessWidget {
  const MoneyManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Manager',
      theme: ThemeData(
          primaryColor: Colors.deepPurple, primarySwatch: Colors.deepPurple),
      home: ScreenHome(),
      routes: {
        ScreenAddTransaction.routeName: (ctx) => const ScreenAddTransaction(),
      },
    );
  }
}
