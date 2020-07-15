import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:keep_health_on_track/view/utils/Parameters.dart';

class AddMeasurementPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AddMeasurementPageState();
}

class AddMeasurementPageState extends State<AddMeasurementPage> {
  DateTime _selectedDate;
  TimeOfDay _selectedTime;

  AddMeasurementPageState()
      : _selectedDate = DateTime.now(),
        _selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Text(Parameters.ADD_NEW_MEASURMENT.toUpperCase()),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save), onPressed: null),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 24.0),
        padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            color: Color(0xFFF9EDE9),
            shape: BoxShape.rectangle),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Data e ora"),
            Row(
              children: <Widget>[
                FlatButton(
                  padding: EdgeInsets.all(0.0),
                  child: Text(DateFormat.yMMMMd().format(_selectedDate)),
                  onPressed: setDate,
                ),
                FlatButton(
                    onPressed: setTime,
                    child: Text(_selectedTime.format(context))),
              ],
            )
          ],
        ),
      ),
    );
  }

  void setDate() async {
    _selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().add(Duration(days: -365)),
        lastDate: DateTime.now().add(Duration(days: 365)));
    setState(() {});
  }

  void setTime() async {
    _selectedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    setState(() {});
  }
}
