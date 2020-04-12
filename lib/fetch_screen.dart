//import 'package:emergency/widget/top_banner.dart';
import 'package:flutter/material.dart';
import 'package:emergency/data/data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'data_fetch.dart';



class FetchScreen extends StatefulWidget {
  final Services service;
  FetchScreen({this.service});

  
  @override
  _FetchScreenState createState() => _FetchScreenState();
}

class _FetchScreenState extends State<FetchScreen> {
  final dbReference=Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:  
      new StreamBuilder(
          stream: Firestore.instance.collection(widget.service.name).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)  {
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
        return   new ListView(
          children:  snapshot.data.documents.map((document) {
            return 
            
            new ListTile(
              title: new Text(document['Name']),
              subtitle: new Text(document['Number']),
            );
          }).toList(),
        );
      },
      ),
    );
      
     

   
    
  }       
         
}

