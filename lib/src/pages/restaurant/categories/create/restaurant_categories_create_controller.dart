import 'package:delibery_integrado_enrique/src/models/category.dart';
import 'package:delibery_integrado_enrique/src/models/response_api.dart';
import 'package:delibery_integrado_enrique/src/models/user.dart';
import 'package:delibery_integrado_enrique/src/provider/categories_provider.dart';
import 'package:delibery_integrado_enrique/src/utils/my_snackbar.dart';
import 'package:delibery_integrado_enrique/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class RestaurantCategoriesCreateController {

  BuildContext context;
  Function refresh;

  TextEditingController nameController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  CategoriesProvider _categoriesProvider = new CategoriesProvider();
  User user;
  SharedPref sharedPref = new SharedPref();

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    user = User.fromJson(await sharedPref.read('user'));
    _categoriesProvider.init(context, user);
  }

  void createCategory() async {
    String name = nameController.text;
    String description = descriptionController.text;

    if (name.isEmpty || description.isEmpty) {
      MySnackbar.show(context, 'Debe ingresar todos los campos');
      return;
    }

    Category category = new Category(
        name: name,
        description: description
    );

    ResponseApi responseApi = await _categoriesProvider.create(category);

    MySnackbar.show(context, responseApi.message);

    if (responseApi.success) {
      nameController.text = '';
      descriptionController.text = '';
    }

  }

}