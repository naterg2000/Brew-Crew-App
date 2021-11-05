import 'package:flutter/material.dart';


class ScheduleScreen extends StatefulWidget {
  ScheduleScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ScheduleScreen createState() => _ScheduleScreen();
}

class _ScheduleScreen extends State<ScheduleScreen> {

  var daysOfTheWeek = ["Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat"];

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;


    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        child: Column( //overall container
          children: [
            Container(  //has the days, this migth change later
              height: 40,
              child: GridView.count(
                  crossAxisCount: 7,
                  children: List.generate(7, (index) {
                    return Center(
                      child: Text(
                        '${daysOfTheWeek[index]}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    );
                  }),
              )
            ),
            Container(  //schedule section
              height: 300,
              color: Colors.red,
              child: GridView.count(
                crossAxisCount: 7,
                children:
                  List.generate(31, (index) {
                    return Center(
                      child: GestureDetector(
                        child: Container(
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                        onTap: () { //will expand the green section to give a detailed view of the day

                        },
                      )
                    );
                  }),
              ),
            ),
            Container(  //detailed schedule section
              height: 200,
              color: Colors.green,
            ),
            Container(
              height: 50,
              child: Column( //bottom nav bar
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(  //row of buttons at the bottom
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: () {}, child: Text("Get coverage", textAlign: TextAlign.center,)),
                      ElevatedButton(onPressed: () {}, child: Text("Request day \noff", textAlign: TextAlign.center,)),
                      ElevatedButton(onPressed: () {}, child: Text("Change \navaliabiltiy", textAlign: TextAlign.center,)),
                    ],
                  ),
                ]
              ),
            ),
          ]
        ),
      )
    );
  }



}
