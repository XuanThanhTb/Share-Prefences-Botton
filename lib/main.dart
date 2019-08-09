import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Send Data App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Share Prefences', style: TextStyle(color: Colors.black, fontSize: 24),),
          backgroundColor: Colors.yellow,
        ),
        body: SharePrefences(),
      ),
    );
  }
}
class SharePrefences extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return SharePrefencesState();
  }
}
class SharePrefencesState extends State<SharePrefences>{
  @override

  _saveData() async{
    final pref = await SharedPreferences.getInstance();
    final key = 'my_int_key';
    final value = 42.5;
    pref.setDouble(key, value);
    // print('save: $value');
    Toast.show('save: $value', context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  }

  _readData() async {
    final pref = await SharedPreferences.getInstance();
    final key = 'my_int_key';
    final value = pref.getDouble(key) ?? 0;
    // print('read: $value');
    Toast.show('read: $value', context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  }

  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            color: Colors.blue,
            child: Text('Save Data',textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),
            onPressed: _saveData,
          ),
           RaisedButton(
            color: Colors.orange,
            child: Text('Read Data',textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),
            onPressed: _readData,
          )
        ],
      ),
    );
  }
}