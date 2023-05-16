import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../database/SensoGroup.dart';

class SlotsDetails extends StatefulWidget {
  static const String routName = 'details';

  @override
  State<SlotsDetails> createState() => _SlotsDetailsState();
}

class _SlotsDetailsState extends State<SlotsDetails> {
  String state2 = 'Busy';
  String state3 = 'Free';
  String sen1 = '';
  String sen2 = '';
  String sen3 = '';
  String sen4 = '';
  double size1 = 35;
  double size11 = 15;
  SensorGroup? sensors;
  late DatabaseReference dbref;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbref = FirebaseDatabase.instance.ref();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    if (sensors?.sensorOne != null && sensors?.sensorOne == true) {
      sen1 = state3;
    } else {
      sen1 = state2;
    }

    if (sensors?.sensorTwo != null && sensors?.sensorTwo == true) {
      sen2 = state3;
      //print(counter);
    } else {
      sen2 = state2;
    }

    if (sensors?.sensorThree != null && sensors?.sensorThree == true) {
      sen3 = state3;
    } else {
      sen3 = state2;
    }

    if (sensors?.sensorFour != null && sensors?.sensorFour == true) {
      sen4 = state3;
    } else {
      sen4 = state2;
    }

    return Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   centerTitle: true,
        //   backgroundColor: Colors.white,
        //   title: Text(
        //     'Smart Barking Dashboard',
        //     style: TextStyle(
        //         fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
        //   ),
        // ),
        body: Container(
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage('assets/images/dash2.jpeg'),
          //         fit: BoxFit.fill)),
          margin: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                // padding: EdgeInsets.all(10),
                color: Colors.transparent,
                child: Row(
                  children: [
                    Text(
                      "Parking Slots Details",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    // ElevatedButton(
                    //
                    //   style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.amber)),
                    //     onPressed: (){}, child: Text('Add New Parking Slot')),
                  ],
                ),
              ),
              Container(
                color: Color(0x1BFF4081),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Table(
                    defaultColumnWidth: const FixedColumnWidth(120.0),
                    border: TableBorder.all(
                        color: Colors.black12,
                        //style: BorderStyle.solid,
                        width: 1),
                    children: [
                      TableRow(children: [
                        Column(children: [
                          Text(' Slot Name',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold))
                        ]),
                        Column(children: [
                          Text(' Slot Number',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold))
                        ]),
                        Column(children: [
                          Text(' Slot Status',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold))
                        ]),
                        Column(children: [
                          Text('Actions',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold))
                        ]),
                        // Column(children: [
                        //   Text('Num of become busy',
                        //       style: TextStyle(
                        //           fontSize: 25.0, fontWeight: FontWeight.bold))
                        // ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Text('SlotOne',
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500))
                        ]),

                        Column(children: [Text('1')]),
                        Column(children: [
                          Text(
                              (sensors?.sensorOne != null &&
                                      sensors?.sensorOne == true)
                                  ? state3
                                  : state2,
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400))
                        ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.car_repair_rounded,
                                color: Colors.green,
                                size: (sensors?.sensorOne != null &&
                                        sensors?.sensorOne == true)
                                    ? size1
                                    : size11,
                              ),
                              Icon(
                                Icons.car_repair_rounded,
                                color: Colors.red,
                                size: (sensors?.sensorOne != null &&
                                        sensors?.sensorOne == true)
                                    ? size11
                                    : size1,
                              )
                            ]),
                        // Column(children: [
                        //   Text('$c',
                        //       style: TextStyle(
                        //           fontSize: 20, fontWeight: FontWeight.w300))
                        // ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Text('SlotTwo',
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500))
                        ]),
                        Column(children: [Text('2')]),
                        Column(children: [
                          Text(
                              (sensors?.sensorTwo != null &&
                                      sensors?.sensorTwo == true)
                                  ? state3
                                  : state2,
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300))
                        ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.car_repair_rounded,
                                  color: Colors.green,
                                  size: (sensors?.sensorTwo != null &&
                                          sensors?.sensorTwo == true)
                                      ? size1
                                      : size11),
                              Icon(
                                Icons.car_repair_rounded,
                                color: Colors.red,
                                size: (sensors?.sensorTwo != null &&
                                        sensors?.sensorTwo == true)
                                    ? size11
                                    : size1,
                              )
                            ]),
                        // Column(children: [
                        //   Text('$c',
                        //       style: TextStyle(
                        //           fontSize: 20, fontWeight: FontWeight.w300))
                        // ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Text('SlotThree',
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500))
                        ]),
                        Column(children: [Text('3')]),
                        Column(children: [
                          Text(
                              (sensors?.sensorThree != null &&
                                      sensors?.sensorThree == true)
                                  ? state3
                                  : state2,
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300))
                        ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.car_repair_rounded,
                                color: Colors.green,
                                size: (sensors?.sensorThree != null &&
                                        sensors?.sensorThree == true)
                                    ? size1
                                    : size11,
                              ),
                              Icon(Icons.car_repair_rounded,
                                  color: Colors.red,
                                  size: (sensors?.sensorThree != null &&
                                          sensors?.sensorThree == true)
                                      ? size11
                                      : size1)
                            ]),
                        // Column(children: [
                        //   Text('$c',
                        //       style: TextStyle(
                        //           fontSize: 20, fontWeight: FontWeight.w300))
                        // ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Text('SlotFour',
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500))
                        ]),
                        Column(children: [Text('4')]),
                        Column(children: [
                          Text(
                              (sensors?.sensorFour != null &&
                                      sensors?.sensorFour == true)
                                  ? state3
                                  : state2,
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300))
                        ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.car_repair_rounded,
                                color: Colors.green,
                                size: (sensors?.sensorFour != null &&
                                        sensors?.sensorFour == true)
                                    ? size1
                                    : size11,
                              ),
                              Icon(
                                Icons.car_repair_rounded,
                                color: Colors.red,
                                size: (sensors?.sensorFour != null &&
                                        sensors?.sensorFour == true)
                                    ? size11
                                    : size1,
                              )
                            ]),
                        // Column(children: [
                        //   Text('$c',
                        //       style: TextStyle(
                        //           fontSize: 20, fontWeight: FontWeight.w300))
                        // ]),
                      ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void getData() async {
    SensorGroup? sensorGroup;

    var data = await dbref.child('Sensor').onValue.listen((data) {
      sensorGroup = SensorGroup.fromJson(data.snapshot.value);
      setState(() {
        sensors = sensorGroup;
        // print(sensors?.sensorTwo);
        //(sensors != null&&sensors==true)?counter++:c++;
      });
    });
  }
}
