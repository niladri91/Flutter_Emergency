import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

String _loc='';
var _data = '';
final con= new TextEditingController( );

void _getCurrentLocation() async{
     final position=await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
      );
      print(position);

    setState(() {
      _loc='$position';
      _data=con.text;
      
    });

}
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: TextField(
                    controller: con,
                    decoration: InputDecoration(
                      hintText:  'Enter data',
                    ),
                  ),
                ),

                FlatButton(
                  child: Text('Location + data'),
                  
                  onPressed: (){
                      _getCurrentLocation();
                      



                  },

                
                 ),
                 
                 Text(_loc),
                 Text('$_data'),
              ],
            ),

      ) ,
    );
  }
}