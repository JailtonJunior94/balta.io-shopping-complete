import 'package:dio/dio.dart';

import 'package:shopping/settings.dart';
import 'package:shopping/models/category-list-item.model.dart';

class CategoryRepository {
  Future<List<CategoryListItemModel>> getAll() async {
    var url = "${Settings.url}/v1/categories";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((course) => CategoryListItemModel.fromJson(course))
        .toList();
  }
}
