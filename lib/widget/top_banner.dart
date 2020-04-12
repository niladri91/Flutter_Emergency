

import 'package:flutter/material.dart';


class TopBanner extends StatefulWidget {
  @override
  _TopBannerState createState() => _TopBannerState();
}

class _TopBannerState extends State<TopBanner> {
  @override
  Widget build(BuildContext context) {
    return 
      ClipPath(
                clipper: MyClipper(),
                              child: Container(
                  color: Color(0xFFd96161),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height/3.5,
                  child:
                  Padding(
                    padding:  EdgeInsets.only(top: 80.0, left: 50.0,),
                    child: Text('Emergency',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0)),
                  ),
                ),
              );
    
  }
}

class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height-25);
    var controlpoint = Offset(55, size.height);
    var endpoint = Offset(size.width/2, size.height);
    path.quadraticBezierTo(controlpoint.dx, controlpoint.dy, endpoint.dx, endpoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);  
  
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {

    return true;
  }
} 