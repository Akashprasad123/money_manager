import 'package:flutter/material.dart';
import 'package:money_manager/screens/home/screen_home.dart';

class MoneyMAnagerBottomNavigation extends StatelessWidget {
  const MoneyMAnagerBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: ScreenHome.selectedIndexNotifier,
        builder: (BuildContext context, int updatedIndex, Widget? _) {
          return BottomNavigationBar(
              currentIndex: updatedIndex,
              onTap: (newIndex) {
                ScreenHome.selectedIndexNotifier.value = newIndex;
              },
              selectedFontSize: 16,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Transaction',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category), label: 'Category')
              ]);
        });
  }
}
