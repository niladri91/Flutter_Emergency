import 'package:emergency/details_screen.dart';
import 'package:emergency/fetch_screen.dart';
import 'package:flutter/material.dart';

import 'package:emergency/data/data.dart';
import 'package:emergency/widget/top_banner.dart';




class Emerpage extends StatefulWidget {
  @override
  _EmerpageState createState() => _EmerpageState();
}

class _EmerpageState extends State<Emerpage> {

_buildEmergencyServices(){
    List<Widget> emergencyServiceList=[];

    emergSer.forEach((Services service ){
      emergencyServiceList.add(
        Padding(
          
            padding:  EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(width:1.0,color: Colors.grey[200]),
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: 
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[


                
                    Container(
                    child: Row(
                      children: <Widget>[
                        Image(
                          height: 50.0,
                          width: 50.0,
                          image: AssetImage(service.imageUrl),
                          fit: BoxFit.cover,
                          ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_)=>FetchScreen(service: service),
                      ),
                          );
                        
                        },
                         child: Container(
                          margin: EdgeInsets.all(18.0),
                          child: Text(service.name,
                          style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.0)
                          ),
                        ),
                      ),
                      ],
                    ),
                  
                ),
                      Container(
                          
                         
                         margin: EdgeInsets.only(right:20.0),
                         height: 40.0,
                         width: 40.0,
                         decoration: BoxDecoration(
                            color: Color(0xFFd96161),
                            borderRadius: BorderRadius.circular(30.0),


                         ),
                          
                         
                         child: IconButton(icon: Icon(Icons.add),
                          onPressed: (){
                            Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_)=>DetailsScreen(service: service),
                      ),
                      );
                          },
                          color: Colors.white,),
                         
                     ),
                       
                   
              ],
              ),
            ),
      ),
        ),
      );
    });
        return Column(
          children: emergencyServiceList,
        );    
    
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf4f4f4),
      
      
    body: SingleChildScrollView(
      child:
      Container(
          height: MediaQuery.of(context).size.height,
          child: 
          Column(
            children: <Widget>[
              TopBanner(),
              Container(
                height:20.0,
                color: Color(0xFFf4f4f4),
                width: double.infinity,

              ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildEmergencyServices(),
              ],
            )


            ],
          ),

      ),
    ),
    );
  }
}



