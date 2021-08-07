import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var len;
  final Ref = Firestore.instance.collection("Que&Ans");
  PageController controller = PageController();
  int _radioValue1;// = -1;
  int correctScore = 0;


  @override
  Widget build(BuildContext context) {
    var answer;
    return Scaffold(
        backgroundColor: Colors.brown[300],
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Quiz"),
          centerTitle: true,
        ),
        body: StreamBuilder(
            stream: Ref.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                print("hello");
                len = snapshot.data.documents.length;
                return Column(children: [
                  SizedBox(
                    height: 30,
                  ),
                  PageView.builder(
                      controller: controller,
                      itemBuilder: (context, index) {
                        var answer =
                            snapshot.data.documents[index].data['answer'];
                       return Container(
                         height: 400,
                          child: Column(
                            children: <Widget>[
                              Text(snapshot
                                  .data.documents[index].data['question'],),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Radio(
                                          value: 0,
                                          groupValue:index,// _radioValue1,
                                          onChanged:(value) {
                                              setState(() {
                                                _radioValue1 = value;
                                                if (answer ==
                                                    snapshot
                                                        .data
                                                        .documents[index]
                                                        .data['option1']) {
                                                  Fluttertoast.showToast(
                                                      msg: 'Correct !',
                                                      toastLength:
                                                      Toast.LENGTH_SHORT);
                                                  correctScore++;
                                                } else {
                                                  Fluttertoast.showToast(
                                                      msg: 'Try again !',
                                                      toastLength:
                                                      Toast.LENGTH_SHORT);
                                                }
                                              });
                                            },
                                      ),
                                      Text(
                                        snapshot.data.documents[index]
                                            .data['option1'],
                                        style: new TextStyle(fontSize: 20.0),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                        value: 1,
                                        groupValue: index,//_radioValue1,
                                        onChanged: (value) {
                                          setState(() {
                                            _radioValue1 = value;
                                            if (answer ==
                                                snapshot
                                                    .data
                                                    .documents[index]
                                                    .data['option2']) {
                                              Fluttertoast.showToast(
                                                  msg: 'Correct !',
                                                  toastLength:
                                                  Toast.LENGTH_SHORT);
                                              correctScore++;
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: 'Try again !',
                                                  toastLength:
                                                  Toast.LENGTH_SHORT);
                                            }
                                          });
                                        },
                                      ),
                                      Text(
                                        snapshot.data.documents[index]
                                            .data['option2'],
                                        style: new TextStyle(
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                        value: 2,
                                        groupValue: index,//_radioValue1,
                                        onChanged: (value) {
                                          setState(() {
                                            _radioValue1 = value;
                                            if (answer ==
                                                snapshot
                                                    .data
                                                    .documents[index]
                                                    .data['option3']) {
                                              Fluttertoast.showToast(
                                                  msg: 'Correct !',
                                                  toastLength:
                                                  Toast.LENGTH_SHORT);
                                              correctScore++;
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: 'Try again !',
                                                  toastLength:
                                                  Toast.LENGTH_SHORT);
                                            }
                                          });
                                        },
                                      ),
                                      Text(
                                        snapshot.data.documents[index]
                                            .data['option3'],
                                        style: new TextStyle(fontSize: 20.0),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      new Radio(
                                        value: 3,
                                        groupValue:index,// _radioValue1,
                                        onChanged: (value) {
                                          setState(() {
                                            _radioValue1 = value;
                                            if (answer ==
                                                snapshot
                                                    .data
                                                    .documents[index]
                                                    .data['option4']) {
                                              Fluttertoast.showToast(
                                                  msg: 'Correct !',
                                                  toastLength:
                                                  Toast.LENGTH_SHORT);
                                              correctScore++;
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: 'Try again !',
                                                  toastLength:
                                                  Toast.LENGTH_SHORT);
                                            }
                                          });
                                        },
                                      ),
                                      Text(
                                        snapshot.data.documents[index]
                                            .data['option4'],
                                        style: new TextStyle(fontSize: 20.0),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                ]);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  } //),
}



/*return buildCheckListItems(
                            index,
                            snapshot.data.documents[index].data['question'],
                            snapshot.data.documents[index].data['answer'],
                            snapshot.data.documents[index].data['option1'],
                            snapshot.data.documents[index].data['option2'],
                            snapshot.data.documents[index].data['option3'],
                            snapshot.data.documents[index].data['option4']);*/