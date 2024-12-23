import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.antonTextTheme(),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 130, top: 100),
                      ),
                      // SizedBox(width: 45,),
                      Container(
                        height: 400,
                        width: 500,
                        decoration: const BoxDecoration(
                          // color: Colors.blue,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                          image: DecorationImage(
                            image: AssetImage('assets/imagecopy.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50, left: 20),
                        child: Container(
                          width: 500,
                          height: 250,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: const Column(children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                  'Welcome to [Your Platform Name], the ultimate destination for bridging the gap between talented makeup artists and clients seeking exceptional beauty services.Our platform is designed to empower makeup artists by showcasing their skills while providing clients with a seamless way to find the perfect artist for their needs.'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                  'Welcome to [Your Platform Name], the ultimate destination for bridging the gap between talented makeup artists and clients seeking exceptional beauty services.Our platform is designed to empower makeup artists by showcasing their skills while providing clients with a seamless way to find the perfect artist for their needs.'),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                  const Positioned(
                    top: -15,
                    //  right: 330,
                    left: 770,
                    child: Text(
                      'ABOUT US',
                      style: TextStyle(
                        fontSize: 65,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: Colors.black54,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
