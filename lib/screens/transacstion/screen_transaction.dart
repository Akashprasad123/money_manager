import 'package:flutter/material.dart';

class ScreenTransactions extends StatelessWidget {
  const ScreenTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              elevation: 5,
              child: ListTile(
                leading: const CircleAvatar(
                  radius: 30,
                  child: Text(
                    '23\njul',
                    textAlign: TextAlign.center,
                  ),
                ),
                title: Text('Transaction$index'),
                subtitle: Text('no $index'),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 5,
          );
        },
        itemCount: 20);
  }
}
