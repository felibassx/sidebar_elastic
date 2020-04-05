import 'package:flutter/material.dart';
import 'package:sidebar_elastic/src/widget/SidebarElesticWidget.dart';

class PaymentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // obtener el tamaño de la pantalla
    Size mediaQuery = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(// crear un gradiente lineal
                  colors: [
            Color.fromRGBO(175, 127, 0, 1.0),
            Color.fromRGBO(252, 218, 129, 1.0),
          ])),
          width: mediaQuery.width,
          child: Stack(
            children: <Widget>[
              Center(
                child: MaterialButton(
                    color: Colors.white,
                    child: Text(
                      'Métodos de Pago',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {}),
              ),
              SidebarElasticWidget()
            ],
          ),
        ),
      ),
    );
  }
}

