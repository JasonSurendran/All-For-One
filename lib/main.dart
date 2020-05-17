import 'package:new_app/constant.dart';
import 'package:new_app/widgets/counter.dart';
import 'package:new_app/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'All-For-One',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: "PlayfairDisplay",
          textTheme: TextTheme(
            bodyText2: TextStyle(color: kBodyTextColor),
          )),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          children: <Widget>[
            MyHeader(
              image: "assets/icons/speaker.svg",
              textTop: "Stay Informed",
              textBottom: "Stay Vigilant",
              offset: offset,
              flip: false
            ),
            
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "By The Numbers\n",
                              style: kTitleTextstyle,
                            ),
                            TextSpan(
                              text: "Ontario 2019 (publichealthontario.ca)",
                              style: TextStyle(
                                color: kTextLightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 30,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Counter(
                          color: Colors.blue,
                          number: 9154,
                          title: "ER Visits",
                        ),
                        Counter(
                          color: Colors.orange,
                          number: 2108,
                          title: "Hospitalizations",
                        ),
                        Counter(
                          color: Colors.red,
                          number: 1473,
                          title: "Deaths",
                        ),
                      ],
                    ),
                  ),


                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Overdose Crisis",
                        style: kTitleTextstyle,
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        AffectedCard(
                          image: "assets/images/opiods.png",
                          
                        ),
                        
                      ],
                    ),
                  ), 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                        "Canada is in the midst of a growing overdose crisis which is devastating families and communities across the country. "
                        "More than twice the number of Canadians died of accidental opioid overdoses in 2018, than died during the height of the HIV/AIDS epidemic.",
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        ),
                      ),
                    ],
                  ),



                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "What Contributes To The Crisis",
                        style: kTitleTextstyle,
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        AffectedCard(
                          image: "assets/images/crisis.png",
                          
                        ),
                        
                      ],
                    ),
                  ), 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                        "Some reasons include: "
                        "\n1. Fentanyl, a dangerously strong opioid that is being mixed into illicit drugs"
                        "\n2. Lack of access to a safe drug supply and adequate and affordable pain treatment options"
                        "\n3. Pharmaceutical industry practices including falsified research and marketing, and the overprescription of opioids",
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        ),
                      ),
                    ],
                  ),



                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Failed War On Drugs",
                        style: kTitleTextstyle,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        AffectedCard(
                          image: "assets/images/warondrugs.png",
                          
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                        "Nothing has contributed more to the overdose crisis and the systemic incarceration of people of colour in the US and Canada than the War on Drugs. "
                        "\nThe war has resulted in corruption, political destabilization, violence, and the creation of powerful drug cartels.",
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        ),
                      ),
                    ],
                  ),


                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Racial Disparities",
                        style: kTitleTextstyle,
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        AffectedCard(
                          image: "assets/images/racial.png",
                          
                        ),
                        
                      ],
                    ),
                  ), 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                        "Indigenous Canadians account for 24.4% of the federal prison population, and just 4.3% of the general population. This is a 500% overrepresentation. "
                        "\n\nBlack Canadians represent the fastest growing group in federal prisons, accounting for 10% of the federal prison population, but only make up 3% of the general population. This is a 300% overrepresentation."
                        ,maxLines: 8,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Language & Social Stigma",
                        style: kTitleTextstyle,
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        AffectedCard(
                          image: "assets/images/stigma.png",
                          
                        ),
                        
                      ],
                    ),
                  ), 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                        "Drug use stigma can be defined as negative attitudes and behaviours towards people who use drugs. "
                        "\nStigma attributes negative stereotypes to certain bodies, life circumstances, and practices, and leads to the devaluation of the lives of people who use substances."
                        "\nPeople who use drugs face social, structural, and internalized stigma.",
                        maxLines: 15,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 40),



                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class AffectedCard extends StatelessWidget {
  final String image;
 
  final bool isActive;
  const AffectedCard({
    Key key,
    this.image,

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
          height: 150,
          width: 350,
          ),
          
          
        ],
      ),
    );
  }
}