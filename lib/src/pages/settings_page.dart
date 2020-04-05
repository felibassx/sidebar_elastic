import 'package:flutter/material.dart';
import 'package:sidebar_elastic/src/widget/SidebarElesticWidget.dart';

class SettingsPage extends StatelessWidget {
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
            Color.fromRGBO(8, 169, 0, 1.0),
            Color.fromRGBO(116, 249, 109, 1.0),
          ])),
          width: mediaQuery.width,
          child: Stack(
            children: <Widget>[
              Center(
                child: MaterialButton(
                    color: Colors.white,
                    child: Text(
                      'Configuraciones',
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

