import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:keep_health_on_track/model/Measurement.dart';

class DayDisplayPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DayDisplayPageState();
}

class DayDisplayPageState extends State<DayDisplayPage> {
  DateTime _day;
  List<Measurement> _measurements;

  DayDisplayPageState([this._day]) {
    this._day ??= DateTime.now();
    this._measurements = List();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(DateFormat("d MMMM yyyy","it_IT").format(this._day).toUpperCase()),
          leading:
              IconButton(icon: Icon(Icons.calendar_today, color: Colors.white), onPressed: null),
          actions: <Widget>[IconButton(icon: Icon(Icons.add, color: Colors.white), color: Colors.white, onPressed: null)],
        ),
        body: Container(
          padding: EdgeInsets.only(top: 8),
          child: ListView.builder(
              itemCount: _measurements.length,
              itemBuilder: (context, index) {
                if(_measurements.isEmpty) return ListTile(title: Text("Empty"),);
                return ListTile(
                  leading: Text(DateFormat("hh:mm")
                      .format(_measurements[index].dateTime)),
                  dense: false,
                  title: Text("-"),
                  trailing: Text(_measurements[index].bloodPressure.toString()),
                );
              }),
        ),
      ),
    );
  }
}
