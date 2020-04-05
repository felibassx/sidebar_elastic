import 'package:flutter/material.dart';
import 'package:sidebar_elastic/src/widget/SidebarElesticWidget.dart';

class FilesPage extends StatelessWidget {
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
            Color.fromRGBO(109, 5, 151, 1.0),
            Color.fromRGBO(210, 132, 241 , 1.0),
          ])),
          width: mediaQuery.width,
          child: Stack(
            children: <Widget>[
              Center(
                child: MaterialButton(
                    color: Colors.white,
                    child: Text(
                      'Archivos',
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

