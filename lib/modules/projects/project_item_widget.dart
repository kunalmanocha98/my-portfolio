import 'package:flutter/material.dart';
import 'package:portfolio/utils/text_styles.dart';

class ProjectItemWidget extends StatelessWidget {
  const ProjectItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 150,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey,
          image: DecorationImage(
              image: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/2/28/Canara_HSBC_Life_Insurance_Wikipedia_Logo.jpg"),
              fit: BoxFit.cover)),
      child: Column(
          children: [
            Spacer(),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(color: Colors.black87),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("click here to visit".toUpperCase(),style: TextStyles.projectTitleStyle.copyWith(
                      fontSize: 10
                    ),),
                    Text("Canara HSBC Life insurance".toUpperCase(),style: TextStyles.projectTitleStyle),
                  ],
                ),
              ),
              Icon(Icons.link,color: Colors.white,)
            ],
          ),
        )
      ]),
    );
  }
}
