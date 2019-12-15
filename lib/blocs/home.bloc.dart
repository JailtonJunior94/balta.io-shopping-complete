import 'package:flutter/widgets.dart';

import 'package:shopping/models/product-list-item.model.dart';
import 'package:shopping/models/category-list-item.model.dart';
import 'package:shopping/repositories/product.repository.dart';
import 'package:shopping/repositories/category.repository.dart';

class HomeBloc extends ChangeNotifier {
  final productRepository = new ProductRepository();
  final categoryRepository = new CategoryRepository();

  String selectedCategory = 'todos';
  List<ProductListItemModel> products;
  List<CategoryListItemModel> categories;

  HomeBloc() {
    getProducts();
    getCategories();
  }

  getCategories() {
    categoryRepository.getAll().then((data) {
      this.categories = data;
      notifyListeners();
    });
  }

  getProducts() {
    productRepository.getAll().then((data) {
      this.products = data;
      notifyListeners();
    });
  }

  getProductsByCategory() {
    productRepository.getByCategory(selectedCategory).then((data) {
      this.products = data;
      notifyListeners();
    });
  }

  changeCategory(tag) {
    selectedCategory = tag;
    products = null;
    getProductsByCategory();
    notifyListeners();
  }
}
