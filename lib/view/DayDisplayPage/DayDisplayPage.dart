import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:keep_health_on_track/model/Measurement.dart';
import 'package:keep_health_on_track/view/AddMeasurementPage/AddMeasurementPage.dart';
import 'package:keep_health_on_track/view/DayDisplayPage/MeasurementListTile.dart';
import 'package:keep_health_on_track/view/utils/Parameters.dart';

class DayDisplayPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DayDisplayPageState();
}

class DayDisplayPageState extends State<DayDisplayPage> {
  DateTime _day;
  List<Measurement> _measurements;
  String _appBarTitle;

  DayDisplayPageState([this._day]) {
    this._day ??= DateTime.now();
    this._measurements = List();
    _appBarTitle = computeAppTitle(this._day);
  }

  @override
  Widget build(BuildContext context) {
    int _itemCount = _measurements.length == 0 ? 1 : _measurements.length;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            this._appBarTitle.toUpperCase(),
            style: TextStyle(color: Colors.black),
          ),
          leading:
              IconButton(icon: Icon(Icons.calendar_view_day), onPressed: null),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.add), onPressed: addMeasurement)
          ],
        ),
        body: Container(
          margin: EdgeInsets.only(top: 24.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              color: Color(0xFFF9EDE9),
              shape: BoxShape.rectangle),
          child: ListView.builder(
              padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
              itemCount: _itemCount,
              itemBuilder: listItemBuilder),
        ),
      ),
    );
  }

  void addMeasurement() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddMeasurementPage()));
  }

  Widget listItemBuilder(context, index) {
    if (_measurements.isEmpty)
      return ListTile(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            Parameters.EMPTY_LIST,
            textAlign: TextAlign.center,
          ),
        ),
      );
    return MeasurementListTile(_measurements[index]);
  }

  String computeAppTitle(DateTime day) {
    DateTime now = DateTime.now();
    if (day.year == now.year && day.month == now.month && day.day == now.day) {
      return Parameters.TODAY;
    } else {
      return DateFormat("dd MMMM yyyy").format(day);
    }
  }
}
