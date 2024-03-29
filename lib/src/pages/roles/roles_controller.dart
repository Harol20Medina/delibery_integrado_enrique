import 'package:delibery_integrado_enrique/src/models/user.dart';
import 'package:delibery_integrado_enrique/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class RolesController {

  BuildContext context;

  User user;
  SharedPref sharedPref = new SharedPref();
  Function refresh;

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;

    // OBTENER EL USUARIO DE SESION
    user = User.fromJson(await sharedPref.read('user')); // PODRIA TARDAR UN TIEMPO EN OBTENERSE
    refresh();

  }

  void goToPage(String route) {
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
  }

}