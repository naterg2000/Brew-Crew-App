import 'package:flutter/material.dart';
import 'hot_coffee_data.dart';

class HotCoffeeListScreen extends StatefulWidget {
  HotCoffeeListScreen({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HotCoffeeListScreen createState() => _HotCoffeeListScreen();
}

class _HotCoffeeListScreen extends State<HotCoffeeListScreen> {
  int _counter = 0;

  List<HotCoffee> hotDrinks = <HotCoffee>[];

  HotCoffeeListScreen() {

    HotCoffee dripCoffee = new HotCoffee('Drip coffee', 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500');
    HotCoffee latte = new HotCoffee('latte', 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500');
    HotCoffee cappuccino = new HotCoffee('cappuccino', 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500');
    HotCoffee mocha = new HotCoffee('mocha', 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500');
    HotCoffee macchiato = new HotCoffee('macchiato', 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500');

    hotDrinks = [dripCoffee, latte, cappuccino, mocha, macchiato];
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
            itemCount: hotDrinks.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
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
                              '${hotDrinks[index].name}',
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
                        backgroundImage: NetworkImage('${hotDrinks[index].imageURL}'),
                      ),
                    )
                  ],

                ),
              );
            })
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
