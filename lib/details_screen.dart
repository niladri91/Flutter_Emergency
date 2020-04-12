import 'package:emergency/widget/top_banner.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergency/data/data.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

class DetailsScreen extends StatefulWidget {

  final Services service;
  DetailsScreen({this.service});
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final dbReference=Firestore.instance;
  //TextEditingController _latitudeController, _longitudeController;
  Geoflutterfire geo;
  
  final conserviceName = new TextEditingController( );
  final conserviceNum = new TextEditingController( );
  String _location='';
  var _name = '';
  var _num = '';
  var lat;
  var lon;


  var geolocator = Geolocator();
 var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
  

 _getCurrentLocation() async{
     final position=await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
      );
      print(position);
             lat=position.latitude;
lon=position.longitude;
   setState(() {
      _location='$position';
      _name=conserviceName.text;
      _num=conserviceNum.text;
  
    },
    
    );
    

createRecord(_location, _num, _name);
}

void createRecord(var _location, var num, var name)async {
  
 await dbReference
        .collection(widget.service.name)
        .add({'Name':_name,'Number':_num, 'Location': _location});
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body:
       Column(
         
         children: <Widget>[
        TopBanner(),
        Padding(
          padding:  EdgeInsets.only(top:15.0),
          child: Text('Please add data of your nearest '+ widget.service.name+' service.',
          textAlign: TextAlign.center,
          style: TextStyle(
                                fontFamily: 'Montserrat',
                                
                                fontWeight: FontWeight.w400,
                                fontSize: 18.0,
          ),
          ),
        ),

      Padding(
        padding:  EdgeInsets.only(top:55.0, left:20.0, right:20.0),
        child: TextField(
          controller: conserviceName,
              decoration: InputDecoration(
                
                  contentPadding:  EdgeInsets.only(left:20.0),
                  hintStyle: TextStyle(fontWeight: FontWeight.w300),
                  fillColor: Colors.white,
                  hintText: 'Name of '+ widget.service.name+' service.',
                  
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(width: 0.08),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      width: 0.08,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
              ),
        ),
      ),
      SizedBox(height:20.0),
      Padding(
        padding: EdgeInsets.only( left:20.0, right:20.0),
        child: TextField(
          controller: conserviceNum,
              keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    contentPadding:  EdgeInsets.only(left:20.0),
                    hintStyle: TextStyle(fontWeight: FontWeight.w300),
                    fillColor: Colors.white,
                    hintText: 'Phone number of '+ widget.service.name+' service.',
                    
                    
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(width: 0.08),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        width: 0.08,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                ),
          ),
      ),
      SizedBox(height:30.0),
      FlatButton(
          onPressed: () {
            _getCurrentLocation();
           
            
          },
          child:  Text(
            'Submit',
            style: TextStyle(fontSize: 20,
            color: Color(0xFFd96161),
            letterSpacing: 0.8
            )
          ),
        ),
        Text(_location),
        Text(widget.service.name+' name: '+'$_name'),
        Text(widget.service.name+' number: '+'$_num'),
      ],
      
      ),
      
      
      
      
    );
  }
}