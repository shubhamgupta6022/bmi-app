import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Bmi();
  }
}

class Bmi extends State<Home> {
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double inches = 0.0;
  double result = 0.0;
  String _resultReading = "";

  String _finalResult = "";

  void _calculate() {
    setState(() {

      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      inches = height*12;
      double weight = double.parse(_weightController.text);

      if ((_ageController.text.isNotEmpty || age > 0)
          && ((_heightController.text.isNotEmpty || inches > 0)
              && (_weightController.text.isNotEmpty || weight > 0))) {
        result = weight / (inches * inches) * 703; // our BMI

        //Do the reading
        if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          _resultReading = "Underweight";
          print(_resultReading);

        }else if (double.parse(result.toStringAsFixed(1)) >= 18.5
            && result < 25) {
          _resultReading = "Great Shape!"; // Normal
          print(_resultReading);
        }else if (double.parse(result.toStringAsFixed(1)) >= 25.0
            && result < 30) {
          _resultReading = "Overweight";
        }else if (double.parse(result.toStringAsFixed(1)) >= 30.0) {
          _resultReading = "Obese";
        }
      }else {
        result = 0.0;
      }
    });
    _finalResult = "Your BMI: ${result.toStringAsFixed(1)}";
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "BMI",
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(5.0),
          children: <Widget>[
            Image.asset('images/bmi.png', height: 85, width: 75),
            new Container(
              margin: EdgeInsets.all(2.0),
              height: 255,
              width: 290,
              color: Colors.grey.shade300,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Age',
                      hintText: 'e.g. 34',
                      icon: new Icon(Icons.person_outline),
                    ),
                  ),
                  new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Heights in feet',
                      hintText: 'e.g. 6.5feet',
                      icon: new Icon(Icons.insert_chart),
                    ),
                  ),
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Weight in lbs',
                      hintText: 'e.g. 200lbs',
                      icon: new Icon(Icons.line_weight),
                    ),
                  ),
                  new Padding(padding: EdgeInsets.all(10.6)),
                  new Container(
                    alignment: Alignment.center,
                    child: new RaisedButton(
                      onPressed: _calculate,
                      color: Colors.pinkAccent,
                      child: new Text(
                        'Calculate',
                        //textColor: Colors.white,
                      ),
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "$_finalResult",
                  style: new TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 19.9),),
                new Padding(padding: EdgeInsets.all(5.0)),
                new Text(
                  "$_resultReading",
                  style: new TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 19.9),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
