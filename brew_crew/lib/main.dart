import 'package:brew_crew/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'menu_item_type_list.dart';
import 'profile_screen.dart';
import 'change_avaliability_screen.dart';
import 'coworker_list_screen.dart';
import 'coworker_list_screen.dart';
import 'package:brew_crew/hot_coffee_list_screen.dart';
import 'package:brew_crew/cold_coffee_list_screen.dart';
import 'package:brew_crew/schedule_screen.dart';
import 'package:brew_crew/login_screen.dart';
import 'package:brew_crew/welcome_screen.dart';
import 'package:brew_crew/data_files/conversations_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomeScreen(title: ''),

    );

  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

} //end MyHomePage

//initialize firebase
class _MyHomePageState extends State<MyHomePage> {

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
  } //end _MyHomePageState

  List<Conversation> conversationList = <Conversation>[];

  _MyHomePageState() {
    Conversation convoYu = Conversation("Yu", 'November 5th');
    Conversation convoNysia = Conversation("Nysia", 'November 4th');
    Conversation convoEveryone = Conversation("Everyone", 'Just now');
    Conversation convoBaristaGang = Conversation("barista gang", 'Just now');
    Conversation convoJorge = Conversation("Jorge", 'Just now');
    Conversation convoKailee = Conversation("Kailee", 'Just now');
    Conversation convoRyan = Conversation("Ryan", 'Just now');

    conversationList = [convoYu, convoNysia, convoEveryone, convoBaristaGang, convoJorge,
      convoKailee, convoRyan];
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
            children: [
                Container( //schedule overview section

                  child: Column(
                    children: [
                      Container(
                        height: 250,
                        margin: EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                          boxShadow: [
                            BoxShadow(color: Colors.white30, spreadRadius: 3),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ScheduleScreen(title: "Schedule"))
                                );
                              }, child: Text("Schedule")),
                              ElevatedButton(onPressed: () {}, child: Text("Get coverage")),
                              ElevatedButton(onPressed: () {}, child: Text("Recipes time off")),
                            ],
                          )
                      ),
                    ]
                  )

              ),
              Container( //list view
                  height: 200,
                  child: ListView.builder(
                      itemCount: conversationList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 30,
                          margin: EdgeInsets.only(
                              top: 5, bottom: 5, left: 15, right: 15),
                          color: Colors.white,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${conversationList[index].name}',
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
                                  //this can be a picture of the other person's profile
                                  //backgroundImage: NetworkImage('${hotDrinks[index].imageURL}'),
                                ),
                              )
                            ],

                          ),
                        );
                      })
              ),
              Container(
                  margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MenuItemListPage(title: "Menu"))
                              );
                            }, child: Text("Recipes")),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => CoworkerListScreen(title: "Coworkers"))
                              );
                            }, child: Text("Coworkers")),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ProfileScreen(title: "Profile"))
                              );
                            }, child: Text("Profile")),
                      ]
                  )
              )
            ]
          )
      );
    }



  }



