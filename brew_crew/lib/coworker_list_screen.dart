import 'package:brew_crew/coworker_data.dart';
import 'package:flutter/material.dart';

class CoworkerListScreen extends StatefulWidget {
  CoworkerListScreen({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _CoworkerListScreen createState() => _CoworkerListScreen();
}

class _CoworkerListScreen extends State<CoworkerListScreen> {

  List<Coworker> coworkers = <Coworker>[];

  _CoworkerListScreen() {
      Coworker nathan = Coworker('Nathan', '111-111-1111', 'https://cdn1.iconfinder.com/data/icons/people-49/512/_nerd_man-512.png');
      Coworker yu = Coworker('Yu', '111-111-1111', 'https://cdn1.iconfinder.com/data/icons/people-49/512/_nerd_man-512.png');
      Coworker nysia = Coworker('Nysia', '111-111-1111', 'https://www.clipartmax.com/png/middle/437-4377908_case-study-sample-avatar-profile-transparent-round.png');
      Coworker kailee = Coworker('Kailee', '111-111-1111', 'https://cdn1.iconfinder.com/data/icons/people-49/512/_nerd_man-512.png');
      Coworker kristen = Coworker('Kristen', '111-111-1111', 'data:image/png;base64,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');
      Coworker german = Coworker('German', '111-111-1111', 'https://cdn1.iconfinder.com/data/icons/people-49/512/_nerd_man-512.png');
      Coworker abdul = Coworker('Abdul', '111-111-1111', 'https://cdn1.iconfinder.com/data/icons/people-49/512/_nerd_man-512.png');

      coworkers = [nathan, yu, nysia, kailee, kristen, german, abdul];
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
          itemCount: coworkers.length,
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
                                  '${coworkers[index].name}',
                                  style: TextStyle(
                                    fontSize: 14
                                  ),
                              ),
                              Text(
                                  '${coworkers[index].phoneNumber}',
                                  style: TextStyle(
                                     fontSize: 12
                                  ),
                              ),
                            ]
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage('${coworkers[index].imageURL}'),
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
