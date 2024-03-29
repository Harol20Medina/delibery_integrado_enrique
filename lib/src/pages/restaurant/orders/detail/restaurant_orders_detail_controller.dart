import 'package:delibery_integrado_enrique/src/models/order.dart';
import 'package:delibery_integrado_enrique/src/models/product.dart';
import 'package:delibery_integrado_enrique/src/models/user.dart';
import 'package:delibery_integrado_enrique/src/provider/orders_provider.dart';
import 'package:delibery_integrado_enrique/src/provider/users_provider.dart';
import 'package:delibery_integrado_enrique/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RestaurantOrdersDetailController {

  BuildContext context;
  Function refresh;
  Product product;
  int counter = 1;
  double productPrice;
  SharedPref _sharedPref = new SharedPref();
  double total = 0;
  Order order;
  User user;
  List<User> users = [];
  UsersProvider _usersProvider = new UsersProvider();
  String idDelivery;

  Future init(BuildContext context, Function refresh, Order order) async {
    this.context = context;
    this.refresh = refresh;
    this.order = order;
    user = User.fromJson(await _sharedPref.read('user'));
    _usersProvider.init(context, sessionUser: user);

    getTotal();
    getUsers();
    refresh();
  }

  void getUsers() async {
    users = await _usersProvider.getDeliveryMen();
    refresh();
  }

  void getTotal() {
    total = 0;
    order.products.forEach((product) {
      total = total + (product.price * product.quantity);
    });
    refresh();
  }

}