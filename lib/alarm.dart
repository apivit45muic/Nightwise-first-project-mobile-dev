import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//https://api.flutter.dev/flutter/cupertino/CupertinoDatePicker-class.html

class AlarmScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AlarmTabState();
}
class _AlarmTabState extends State<AlarmScreen> {
  DateTime _selectedDate;

  @override
  void initState(){
    super.initState();
    _selectedDate = DateTime.now();
  }

  Future<void> Update() async{
    int timestamp = _selectedDate.millisecondsSinceEpoch;
    int timeNow = DateTime.now().millisecondsSinceEpoch;
    if (timestamp<timeNow){
      //make timestamp tommorow
    }
    //await

  }

  final

  @override
  Widget build(BuildContext context) {
    //TODO: widget goes here

  }


}