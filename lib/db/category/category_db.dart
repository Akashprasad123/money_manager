import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_manager/Models/category/category_model.dart';

const CATEGORY_DB_NAME = 'category-database';

abstract class CategorydbFunctions {
  Future<List<CategoryModel>> getCategories();
  Future<void> insertCategory(CategoryModel value);
  Future<void> deleteCategory(String CategoryID);
}

class CategoryDB implements CategorydbFunctions {
  CategoryDB._internal();

  static CategoryDB instance = CategoryDB._internal();

  factory CategoryDB() {
    return instance;
  }

  ValueNotifier<List<CategoryModel>> incomeCategoryListLisener =
      ValueNotifier([]);
  ValueNotifier<List<CategoryModel>> expenseCategoryListLisener =
      ValueNotifier([]);
  @override
  Future<void> insertCategory(CategoryModel value) async {
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    await _categoryDB.put(value.id, value);
    refreshUI();
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    _categoryDB.values;
    return _categoryDB.values.toList();
  }

  Future<void> refreshUI() async {
    final _allCategories = await getCategories();
    incomeCategoryListLisener.value.clear();
    expenseCategoryListLisener.value.clear();
    await Future.forEach(_allCategories, (CategoryModel category) {
      if (category.type == CategoryType.income) {
        incomeCategoryListLisener.value.add(category);
      } else {
        expenseCategoryListLisener.value.add(category);
      }
    });
    incomeCategoryListLisener.notifyListeners();
    expenseCategoryListLisener.notifyListeners();
  }

  @override
  Future<void> deleteCategory(String CategoryID) async {
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    await _categoryDB.delete(CategoryID);
    refreshUI();
  }
}
