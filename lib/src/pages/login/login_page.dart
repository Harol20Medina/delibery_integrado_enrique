import 'package:delibery_integrado_enrique/src/pages/login/login_controller.dart';
import 'package:delibery_integrado_enrique/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  LoginController _con = new LoginController();

  @override
  void initState(){
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
                top: -80,
                left: -100,
                child: _formacircular()
            ),
            Positioned(
                child: _textLogin(),
                top: 60,
                left: 25,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  //_imageBanner(),  //metodo mas abajo
                  _lottieAnimation(),
                  _textFieldEmail(),
                  _textFieldPassword(),
                  _buttonLogin(),
                  _textNoTieneCuenta()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _lottieAnimation(){
    return Container(
      margin: EdgeInsets.only(
          top: 150,
          bottom: MediaQuery.of(context).size.height * 0.17
      ),
      child: Lottie.asset(
          'assets/json/delivery.json',
        width: 280,
        height: 240,
        fit: BoxFit.fill
      ),
    );
  }

  Widget _textLogin(){
    return Text(
      'LOGIN',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 22,
        fontFamily: 'NimbusSans',
      ),
    );
  }

  Widget _textNoTieneCuenta(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('¿No Tienes Cuenta?',
          style: TextStyle( //negrita
              color: MyColors.primaryColor, //color
            fontSize: 17
          ),
        ),
        SizedBox(width: 7),
        GestureDetector(
          onTap: _con.goToRegisterPage,
          child: Text(
            'Registrate',
            style: TextStyle(
                fontWeight: FontWeight.bold,  //negrita
                color: MyColors.primaryColor, //color
                fontSize: 17
            ),
          ),
        ),
      ],
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Correo Electronico',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
              color: MyColors.primaryColorDark
            ),
            prefixIcon: Icon(
                Icons.email,
                color: MyColors.primaryColor,
            )
        ),
      ),
    );
  }
  Widget _buttonLogin(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child:ElevatedButton(
        onPressed: _con.login,
        child: Text('Ingresar'),
        style: ElevatedButton.styleFrom(
          primary: MyColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          padding: EdgeInsets.symmetric(vertical: 15)
        ),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.passwordController,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Contraseña',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: MyColors.primaryColorDark
            ),
            prefixIcon: Icon(
              Icons.lock,
              color: MyColors.primaryColor,
            )
        ),
      ),
    );
  }

  Widget _formacircular(){
    return Container(
      width: 240,
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: MyColors.primaryColor
      ),
    );
  }

  Widget _imageBanner() {
    return Container(
      margin: EdgeInsets.only(
          top: 100,
          bottom: MediaQuery.of(context).size.height * 0.22
      ),
      child: Image.asset(
        'assets/img/delivery.png',
        width: 200,
        height: 200,
      ),
    );
  }

}
