import 'package:new_app/constant.dart';
import 'package:new_app/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(
              image: "assets/icons/looking.svg",
              textTop: "Know The Signs",
              textBottom: "Around You",
              offset: offset,
              flip: true
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20, 
                vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Who Can Overdose Affect?",
                    style: kTitleTextstyle,
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        AffectedCard(
                          image: "assets/images/family.png",
                          title: "All Races. All Ages. All Genders.\n"
                          "Everyone",
                        ),
                        
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Symptoms",
                    style: kTitleTextstyle,
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SymptomCard(
                          image: "assets/images/sweating.png",
                          title: "Sweating",
                        ),
                        SymptomCard(
                          image: "assets/images/fainting.png",
                          title: "Fainting",
                        ),
                        SymptomCard(
                          image: "assets/images/coughing.png",
                          title: "Coughing",
                        ),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 20),
                  Text("Overdose Response", style: kTitleTextstyle),
                  SizedBox(height: 10),
                  PreventCard(
                    text:
                        "Naloxone is an opioid antagonist, which can restore breathing within 2 to 5 minutes. Works for fentanyl, heroin, morphine, and codeine.",
                    image: "assets/images/naloxone.png",
                    title: "Naloxone:\nOverdose Reversal",
                  ),
                  PreventCard(
                    text:
                        "To check a pulse place your fingers on their neck (windpipe). If you don't feel a pulse: Give 30 chest compressions and 2 rescue breaths. Repeat until an ambulance arrives.",
                    image: "assets/images/breathing.png",
                    title: "CPR & Rescue Breathing",
                  ),
                  PreventCard(
                    text:
                        "Always call 911 whether you are sure or unsure the status of the person. Always stay by their side until the ambulance comes.",
                    image: "assets/images/hospital.png",
                    title: "Call 911",
                  ),
                  SizedBox(height: 50),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventCard({
    Key key,
    this.image,
    this.title,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kShadowColor,
                  ),
                ],
              ),
            ),
            Image.asset(
            image,
            height: 150,
            width: 140,

            ),
            Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 136,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        text,
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
        
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  const SymptomCard({
    Key key,
    this.image,
    this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive
              ? BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 20,
                  color: kActiveShadowColor,
                )
              : BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 6,
                  color: kShadowColor,
                ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Image.asset(image, 
          height: 90,
          
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}


class AffectedCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  const AffectedCard({
    Key key,
    this.image,
    this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive
              ? BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 20,
                  color: kActiveShadowColor,
                )
              : BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 6,
                  color: kShadowColor,
                ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Image.asset(image, 
          height: 120,
          width: 350,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}


