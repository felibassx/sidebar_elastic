import 'package:flutter/material.dart';
import 'package:sidebar_elastic/src/widget/ButtonSidebarWidget.dart';
import 'package:sidebar_elastic/src/widget/DrawerPainter.dart';

class SidebarElasticWidget extends StatefulWidget {
  SidebarElasticWidget({Key key}) : super(key: key);

  @override
  _SidebarElasticWidgetState createState() => _SidebarElasticWidgetState();
}

class _SidebarElasticWidgetState extends State<SidebarElasticWidget> {
  Offset _offset = Offset(0, 0);
  GlobalKey globalKey = GlobalKey();
  List<double> limits = [];
  bool isMenuOpen = false;

  @override
  void initState() {
    limits = [0, 0, 0, 0, 0, 0];
    WidgetsBinding.instance.addPostFrameCallback(getPosition);
    super.initState();
  }

  getPosition(duration) {
    RenderBox renderBox = globalKey.currentContext.findRenderObject();
    final position = renderBox.localToGlobal(Offset.zero);

    double start = position.dy - 20;
    double contLimit = position.dy + renderBox.size.height - 20;
    double step = (contLimit - start) / 5;

    limits = [];
    for (double x = start; x <= contLimit; x = x + step) {
      limits.add(x);
    }

    setState(() {
      limits = limits;
    });
  }

  double getSize(int x) {
    double size =
        (_offset.dy > limits[x] && _offset.dy < limits[x + 1]) ? 25 : 20;
    return size;
  }

  @override
  Widget build(BuildContext context) {
    // obtener el tamaño de la pantalla
    Size mediaQuery = MediaQuery.of(context).size;

    // obtenemos el ancho para el sizebar
    double sideBarSize = mediaQuery.width * 0.65;

    // obtenemos el alto para el sizebar
    double menuContainerHeight = mediaQuery.height / 2;

    return AnimatedPositioned(
      duration: Duration(milliseconds: 1500),
      left: isMenuOpen ? 0 : -sideBarSize + 20,
      top: 0,
      curve: Curves.elasticOut,
      child: SizedBox(
        width: sideBarSize,
        child: GestureDetector(
          onPanUpdate: (details) {
            if (details.localPosition.dx <= sideBarSize) {
              setState(() {
                _offset = details.localPosition;
              });
            }

            if (details.localPosition.dx > sideBarSize - 20 &&
                details.delta.distanceSquared > 2) {
              setState(() {
                isMenuOpen = true;
              });
            }
          },
          onPanEnd: (details) {
            setState(() {
              _offset = Offset(0, 0);
            });
          },
          child: Stack(
            children: <Widget>[
              CustomPaint(
                size: Size(sideBarSize, mediaQuery.height),
                painter: DrawerPainter(offset: _offset),
              ),
              Container(
                height: mediaQuery.height,
                width: sideBarSize,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      height: mediaQuery.height * 0.25,
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              'assets/dp_default.png',
                              width: sideBarSize / 2,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Menu Elastico",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Container(
                      key: globalKey,
                      width: double.infinity,
                      height: menuContainerHeight,
                      child: Column(
                        children: <Widget>[
                          ButtonSidebar(
                            text: "Home",
                            iconData: Icons.home,
                            textSize: getSize(0),
                            height: (menuContainerHeight) / 5,
                            linkPage: 'home',
                          ),
                          ButtonSidebar(
                            text: "Métodos de Pago",
                            iconData: Icons.payment,
                            textSize: getSize(0),
                            height: (menuContainerHeight) / 5,
                            linkPage: 'payments',
                          ),
                          ButtonSidebar(
                            text: "Notificaciones",
                            iconData: Icons.notifications,
                            textSize: getSize(1),
                            height: (menuContainerHeight) / 5,
                            linkPage: 'notifications',
                          ),
                          ButtonSidebar(
                            text: "Configuraciones",
                            iconData: Icons.settings,
                            textSize: getSize(2),
                            height: (menuContainerHeight) / 5,
                            linkPage: 'settings',
                          ),
                          ButtonSidebar(
                            text: "Archivos",
                            iconData: Icons.attach_file,
                            textSize: getSize(3),
                            height: (menuContainerHeight) / 5,
                            linkPage: 'files',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 400),
                right: (isMenuOpen) ? 10 : sideBarSize,
                bottom: 30,
                child: IconButton(
                  enableFeedback: true,
                  icon: Icon(
                    Icons.keyboard_backspace,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {
                    this.setState(() {
                      isMenuOpen = false;
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
