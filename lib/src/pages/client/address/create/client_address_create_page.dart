import 'package:delibery_integrado_enrique/src/pages/client/address/create/client_address_create_controller.dart';
import 'package:delibery_integrado_enrique/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ClientAddressCreatePage extends StatefulWidget {
  const ClientAddressCreatePage({Key key}) : super(key: key);

  @override
  State<ClientAddressCreatePage> createState() => _ClientAddressCreatePageState();
}

class _ClientAddressCreatePageState extends State<ClientAddressCreatePage> {

  ClientAddressCreateController _con = new ClientAddressCreateController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        _con.init(context, refresh);

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva Dirección'),
        backgroundColor: MyColors.primaryColor,
      ),
      bottomNavigationBar: _buttonAccept(),
      body: Column(
        children: [
          _textCompletData(),
          _textFielAddress(),
          _textFieldNeighborhood(),
          _textFieldRefPoint()

        ],
      ),

    );
  }

  Widget _textFieldRefPoint(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical:10),
      child:TextField(
        onTap: _con.openMap,
        autofocus: false,
        focusNode:AlwaysDisableFocusNode(),
        decoration: InputDecoration(
            labelText: 'Punto de referencia',
            suffixIcon: Icon(
              Icons.map,
              color: MyColors.primaryColor,
            )
        ),
      ),
    );
  }

  Widget _textFielAddress(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical:10),
      child:TextField(
        controller: _con.addressController,
        decoration: InputDecoration(
            labelText: 'Direccion',
            suffixIcon: Icon(
              Icons.location_on,
              color: MyColors.primaryColor,
            )
        ),
      ),
    );
  }
  Widget _textFieldNeighborhood(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical:10),
      child:TextField(
        controller: _con.neighborhoodController,
        decoration: InputDecoration(
            labelText: 'Barrio',
            suffixIcon: Icon(
              Icons.location_city,
              color: MyColors.primaryColor,
            )
        ),
      ),
    );
  }

  Widget _textCompletData(){
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 40,vertical: 30),
      child: Text(
        'Completa estos datos',
        style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }


  Widget _buttonAccept(){
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 30, horizontal:50),
      child: ElevatedButton(
        onLongPress: _con.createAddress,
        child: Text(
            'CREAR DIRECCION'
        ),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            primary: MyColors.primaryColor
        ),
      ),
    );
  }

  void refresh() {
    setState(() {
      
    });
  }
}

class AlwaysDisableFocusNode extends FocusNode{
  @override
  bool get hastFocus => false;
}