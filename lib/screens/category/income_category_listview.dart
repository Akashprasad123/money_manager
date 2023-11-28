import 'package:flutter/material.dart';

import '../../Models/category/category_model.dart';
import '../../db/category/category_db.dart';

class IncomeCategoryListView extends StatelessWidget {
  const IncomeCategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CategoryDB().incomeCategoryListLisener,
      builder: (BuildContext ctx, List<CategoryModel> newlist, Widget? _) {
        return ListView.separated(
            itemBuilder: (context, index) {
              final category = newlist[index];
              return Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 5,
                  child: ListTile(
                    title: Text(category.name),
                    subtitle: Text('source $index'),
                    trailing: IconButton(
                        onPressed: () {
                          CategoryDB().deleteCategory(category.id);
                        },
                        icon: const Icon(
                          Icons.delete,
                          size: 30,
                        )),
                    onTap: () {},
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: newlist.length);
      },
    );
  }
}
