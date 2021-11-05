import 'package:flutter/material.dart';
import 'package:brew_crew/data_files/menu_item_data.dart';

class MenuItemListPage extends StatefulWidget {
  MenuItemListPage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _MenuItemListPage createState() => _MenuItemListPage();
}

class _MenuItemListPage extends State<MenuItemListPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  List<MenuItem> menuItems = <MenuItem>[];

  _MenuItemListPage() {
    MenuItem hotDrinks = MenuItem("Hot Drinks", 'https://www.pngfind.com/pngs/m/243-2437878_circle-grey-solid-grey-colour-circle-png-transparent.png');
    MenuItem coldDrinks = MenuItem("Cold Drinks", 'https://www.pngfind.com/pngs/m/243-2437878_circle-grey-solid-grey-colour-circle-png-transparent.png');
    MenuItem tea = MenuItem("Tea", 'https://www.pngfind.com/pngs/m/243-2437878_circle-grey-solid-grey-colour-circle-png-transparent.png');
    MenuItem icedDrinks = MenuItem("Iced Drinks", 'https://www.pngfind.com/pngs/m/243-2437878_circle-grey-solid-grey-colour-circle-png-transparent.png');
    MenuItem frappes = MenuItem("Frappes", 'https://www.pngfind.com/pngs/m/243-2437878_circle-grey-solid-grey-colour-circle-png-transparent.png');
    MenuItem food = MenuItem("Food", 'https://www.pngfind.com/pngs/m/243-2437878_circle-grey-solid-grey-colour-circle-png-transparent.png');
    MenuItem bakery = MenuItem("Bakery", 'https://www.pngfind.com/pngs/m/243-2437878_circle-grey-solid-grey-colour-circle-png-transparent.png');

    menuItems = [hotDrinks, coldDrinks, tea, icedDrinks, frappes, food, bakery];
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: ListView.builder(
            itemCount: menuItems.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child:
                  Container(
                    height: 70,
                    margin: EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${menuItems[index].name}',
                                  style: TextStyle(
                                      fontSize: 14
                                  ),
                                ),
                              ]
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage('${menuItems[index].imageURL}'),
                          ),
                        )
                      ],
                  ),

                ),
                onTap: () {

                },
              );
            })

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
