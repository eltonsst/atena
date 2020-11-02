import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(MyApp());
}

class Choice {
  final String title;
  final String imglink;

  const Choice({this.title, this.imglink});
}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard(
      {Key key,
      this.choice,
      this.onTap,
      @required this.item,
      this.selected: false})
      : super(key: key);

  final Choice choice;

  final VoidCallback onTap;

  final Choice item;

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Container(
          height: 150.0,
          width: 150.0,

          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(choice.imglink,), fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black38,
              BlendMode.darken,
            ),
              ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(alignment: Alignment.topLeft, child: Icon(Icons.favorite, color: Colors.white,))
                  ,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(choice.title, style: TextStyle(color: Colors.white,), textAlign: TextAlign.center,),
                    SizedBox(height: 5.0),
                    LinearPercentIndicator(
                      percent: Random().nextDouble(),
                      backgroundColor: Colors.grey[500],
                      lineHeight: 10.0,
                      progressColor: Colors.deepPurple[300],
                    )
                  ],
                ),
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.stretch,
          ),
        ));
  }
}

class MyApp extends StatelessWidget {
  final List choices = const [
    const Choice(
        title: 'Museum of Great Rivers',
        imglink:
            'https://image.jimcdn.com/app/cms/image/transf/none/path/sd60c8232c57ee394/image/i3b80ba2eaca5f842/version/1534198238/image.png'),
    const Choice(
        title: 'Scrovegni Chapel',
       imglink:
            'https://daydreamtourist.files.wordpress.com/2015/05/arena-chapel.jpg'),
    const Choice(
        title: 'Uffizi Gallery',
        imglink:
            'https://images.prismic.io/mystique/21e4a4257c4e9dcd893ad622c0063c7c000a9495_5-2-e1521719865176.jpg?auto=compress,format&fm=pjgp&w=750&q=75&ar=1:1.07&fit=crop&crop=faces&'),
  ];

  Container accountItems(
          String item, String charge, String dateString, String type,
          {Color oddColour = Colors.white}) =>
      Container(
        decoration: BoxDecoration(color: oddColour),
        padding:
            EdgeInsets.only(top: 20.0, bottom: 20.0, left: 5.0, right: 5.0),
        child: Row(
          children: <Widget>[
              Container(width: 50.0,child: IconButton(icon: Icon(Icons.shopping_cart),)),
              Expanded(
                child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(item, style: TextStyle(fontSize: 16.0)),
                      Text(charge, style: TextStyle(fontSize: 16.0)),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(dateString,
                          style: TextStyle(color: Colors.grey[500], fontSize: 14.0)),
                      Text(type,
                          style: TextStyle(color: Colors.grey[500], fontSize: 14.0))
                    ],
                  ),
                ],
            ),
              ),
          ],
        ),
      );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          iconTheme: new IconThemeData(color: Colors.black87),
          title: Text(
            'ATENA',
            style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold , ),
          ),
          actions: <Widget>[
            Center(
              child: IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.black87,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        drawer: Drawer(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.credit_card),
              title: Text('Cards'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.score),
              title: Text('Stats'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle),
              title: Text('Profile'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              title: Text('Gifts'),
            ),
          ],
          currentIndex: 2,
          selectedItemColor: Colors.deepPurple[400],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[500].withOpacity(0.2),
                      spreadRadius: 15,
                      blurRadius: 10,
                      offset: Offset(0, 7), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 18.0, bottom: 25.0),
                  child: CreditCard(
                        cardNumber: '123 456 789',
                        cardExpiry: '12-34-5678',
                        cardHolderName: 'Elton Stafa',
                        cvv: '666',
                        bankName: "Axis Bank",
                        showBackSide: false,
                        frontBackground: CardBackgrounds.black,
                        backBackground: CardBackgrounds.white,
                        showShadow: false,
                        width: 370.0,
                        height: 200.0,
                      ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0) ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[500].withOpacity(0.2),
                          spreadRadius: 15,
                          blurRadius: 10,
                          offset: Offset(0, 7), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Flexible(
                                  child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  'Send money to',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                              Text(
                                'See all',
                                style: TextStyle(
                                    color: Colors.grey[500], fontSize: 12.0),
                              )
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 10.0),
                            height: 190.0,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[500].withOpacity(0.2),
                                  spreadRadius: 10,
                                  blurRadius: 35,
                                  offset:
                                      Offset(0, 7), // changes position of shadow
                                ),
                              ],
                            ),
                            child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.all(10.0),
                                children: List.generate(choices.length, (index) {
                                  return Center(
                                    child: ChoiceCard(
                                        choice: choices[index],
                                        item: choices[index]),
                                  );
                                }))),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Flexible(
                                  child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  'Recent payments',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                              Text(
                                'See all',
                                style: TextStyle(
                                    color: Colors.grey[500], fontSize: 12.0),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(15.0),
                          child: Column(
                            children: <Widget>[
                              accountItems("Airplane ticket", r"+ $ 4,946.00",
                                  "28-04-16", r" + $ 0,50 to Museum of Great Rivers",
                                  oddColour: Colors.white),
                              Center(child: Padding(
                                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                                child: Divider(height: 1.0, color: Colors.deepPurple[400],),
                              ),),
                              accountItems("Airplane ticket", r"+ $ 4,946.00",
                                  "28-04-16",  r" + $ 0,50 to Scrovegni Chapel",
                                  oddColour: Colors.white),
                              Center(child: Padding(
                                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                                child: Divider(height: 1.0, color: Colors.deepPurple[400],),
                              ),),
                              accountItems("Airplane ticket", r"+ $ 4,946.00",
                                  "28-04-16",  r" + $ 0,50 to Scrovegni Chapel",
                                  oddColour: Colors.white),
                              Center(child: Padding(
                                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                                child: Divider(height: 1.0, color: Colors.deepPurple[400],),
                              ),),
                              accountItems("Airplane ticket", r"+ $ 4,946.00",
                                  "28-04-16", r" + $ 0,50 to Scrovegni Chapel",
                                  oddColour: Colors.white),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
