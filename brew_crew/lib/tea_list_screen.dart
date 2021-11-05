import 'package:flutter/material.dart';
import 'package:brew_crew/data_files/tea_data.dart';

class TeaListScreen extends StatefulWidget {
  TeaListScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _TeaListScreen createState() => _TeaListScreen();
}

class _TeaListScreen extends State<TeaListScreen> {

  List<Tea> tea = <Tea>[];

  _TeaListScreen() {
    Tea earlGrey = Tea("Earl Grey", 'https://www.pngfind.com/pngs/m/243-2437878_circle-grey-solid-grey-colour-circle-png-transparent.png');
    Tea englishBreakfast = Tea("English breakfast", 'https://www.pngfind.com/pngs/m/243-2437878_circle-grey-solid-grey-colour-circle-png-transparent.png');
    Tea puEr = Tea("Pu'er", 'https://www.pngfind.com/pngs/m/243-2437878_circle-grey-solid-grey-colour-circle-png-transparent.png');
    Tea hibiscus = Tea("Hibiscus", 'https://www.pngfind.com/pngs/m/243-2437878_circle-grey-solid-grey-colour-circle-png-transparent.png');Tea icedShakenEspresso = Tea("Green", 'https://www.pngfind.com/pngs/m/243-2437878_circle-grey-solid-grey-colour-circle-png-transparent.png');


    tea = [earlGrey, englishBreakfast, puEr, hibiscus];
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
            itemCount: tea.length,
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
                              '${tea[index].name}',
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
                        backgroundImage: NetworkImage('${tea[index].imageURL}'),
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
