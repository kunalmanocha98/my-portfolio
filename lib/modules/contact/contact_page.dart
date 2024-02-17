import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/text_styles.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      decoration: BoxDecoration(
          color: AppColors.contactContainerColorDark
      ),
      child: Center(
        child: SizedBox(
          width: 600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Contact", style: TextStyles.expTitleStyle,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: Text("",
                  style: TextStyles.expDescStyle,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.0, bottom: 20),
                child: Row(
                  children: [
                    const Icon(
                      Icons.email_outlined, color: AppColors.appWhiteColor,),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        "kunalmanocha98.com", style: TextStyles.expDescStyle,),
                    )
                  ],
                ),
              ),
              Row(
                children: List.generate(4, (index) => InkWell(onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.only(left: index==0?0:8.0,right: 8),
                      child: const Icon(Icons.add_box_outlined,
                        color: AppColors.appWhiteColor,),
                    ))),
              ),
            ],
          ),
        ),
      ),
    );
  }

}