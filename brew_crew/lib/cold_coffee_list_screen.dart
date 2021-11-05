import 'package:flutter/material.dart';
import 'package:brew_crew/data_files/cold_coffee_data.dart';

class ColdCoffeeListScreen extends StatefulWidget {
  ColdCoffeeListScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ColdCoffeeListScreen createState() => _ColdCoffeeListScreen();
}

class _ColdCoffeeListScreen extends State<ColdCoffeeListScreen> {

  List<ColdCoffee> coldDrinks = <ColdCoffee>[];

  _ColdCoffeeListScreen() {
    ColdCoffee icedLatte = ColdCoffee("Iced Latte", 'https://www.pngfind.com/pngs/m/243-2437878_circle-grey-solid-grey-colour-circle-png-transparent.png');
    ColdCoffee icedMocha = ColdCoffee("Iced Mocha", 'https://www.pngfind.com/pngs/m/243-2437878_circle-grey-solid-grey-colour-circle-png-transparent.png');
    ColdCoffee icedMacchiato = ColdCoffee("Iced Macchiato", 'https://www.pngfind.com/pngs/m/243-2437878_circle-grey-solid-grey-colour-circle-png-transparent.png');
    ColdCoffee icedShakenEspresso = ColdCoffee("Iced shaken espresso", 'https://www.pngfind.com/pngs/m/243-2437878_circle-grey-solid-grey-colour-circle-png-transparent.png');

    coldDrinks = [icedLatte, icedMocha, icedMacchiato, icedShakenEspresso];
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: ListView.builder(
            itemCount: coldDrinks.length,
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
                              '${coldDrinks[index].name}',
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
                        backgroundImage: NetworkImage('${coldDrinks[index].imageURL}'),
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
