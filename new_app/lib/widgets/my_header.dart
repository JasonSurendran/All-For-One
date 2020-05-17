import 'package:new_app/constant.dart';
import 'package:new_app/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../main.dart';

class MyHeader extends StatefulWidget {
  final String image;
  final String textTop;
  final String textBottom;
  final double offset;
  final bool flip;
  const MyHeader(
      {Key key, this.image, this.textTop, this.textBottom, this.offset, this.flip})
      : super(key: key);

  @override
  _MyHeaderState createState() => _MyHeaderState();
}

class _MyHeaderState extends State<MyHeader> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 40, top: 50, right: 20),
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [
            0.001,
            0.4,
            0.8,
            0.9
          ],
        colors: [
          Colors.yellow,
          Colors.red,
          Colors.indigo,
          Colors.teal
        ],
          ),
          // image: DecorationImage(
          //   image: AssetImage("assets/images/virus.png"),
          // ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      if(widget.flip){
                      return HomeScreen();
                      }
                      else{
                      return InfoScreen();
                      }
                    },
                  ),
                );
              },
              child: SvgPicture.asset(
                "assets/icons/forward.svg",
                height: 20,
                width: 140,
                ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: (widget.offset < 0) ? 0 : widget.offset,
                    right: 160,
                    child: SvgPicture.asset(
                      widget.image,
                      width: 200,
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  Positioned(
                    top: 40 - widget.offset / 2,
                    left: 190,
                    child: Text(
                      "${widget.textTop} \n${widget.textBottom}",
                      style: kHeadingTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(), 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(
      0, size.height);
    path.quadraticBezierTo(
        size.width, 
        size.height, 
        size.width, 
        size.height);
    path.lineTo(
      size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}