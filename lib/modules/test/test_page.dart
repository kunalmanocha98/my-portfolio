import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_routes.dart';


class TestPage extends StatelessWidget{
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var titleStyle = GoogleFonts.robotoMono(
      fontSize: screenWidth>1300?44:30,
      color: Colors.white,
    );
    var descriptionStyle = GoogleFonts.robotoMono(
      fontSize: screenWidth>1300?20:14,
      color: Colors.white,
    );
    var comingSoonText =
    GoogleFonts.robotoMono(fontSize: screenWidth>1300?30:20, color: Colors.white);

    return Scaffold(
        backgroundColor: Colors.black87,
        body: Container(
          margin: const EdgeInsets.only(top: 36, left: 36),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(style: titleStyle,
                    children: const [
                      // TextSpan(text: "<h1>",style: titleStyle.copyWith(
                      //     color: Color(0XFFff0000))),
                      TextSpan(text: "Kunal Manocha"),
                      // TextSpan(text: "</h1>",style: titleStyle.copyWith(
                      //     color: Color(0XFFff0000))),
                    ]
                ),
              ),
              RichText(
                text: TextSpan(style: descriptionStyle, children: [
                  // TextSpan(text: "<p>",style: descriptionStyle.copyWith(
                  //     color: Color(0XFF0078ff))),
                  WidgetSpan(child:GestureDetector( onTap:(){
                    Navigator.pushNamed(context,Routes.homeRoute);
                  },child: Text("Hi,I am a ",style: descriptionStyle,))),
                  TextSpan(
                    text: "frontend developer \n",
                    style: descriptionStyle.copyWith(
                        color: const Color(0XFF01ff1f)),
                  ),
                  const TextSpan(text: "Specialises in "),
                  TextSpan(
                    text: "Mobile App Development \n",
                    style: descriptionStyle.copyWith(
                        color: const Color(0XFF0078ff)),
                  ),
                  const TextSpan(text: "Portfolio is under construction"),
                  // TextSpan(text: "</p>",style: descriptionStyle.copyWith(
                  //     color: Color(0XFF0078ff))),
                ]),
              ),
              const SizedBox(
                height: 100,
              ),
              Center(
                child: AnimatedTextKit(
                  isRepeatingAnimation: true,
                  animatedTexts: [
                    TypewriterAnimatedText('Coming Soon...',
                        speed: const Duration(milliseconds: 200),
                        textStyle: comingSoonText),
                  ],
                  onTap: () {},
                ),
              ),
            ],
          ),
        ));
  }

}
