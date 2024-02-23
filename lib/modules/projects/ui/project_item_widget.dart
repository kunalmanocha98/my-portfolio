import 'package:flutter/material.dart';
import 'package:portfolio/modules/projects/enum/link_type_enum.dart';
import 'package:portfolio/modules/projects/models/project_model.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/app_logic.dart';
import 'package:portfolio/utils/text_styles.dart';

class ProjectItemWidget extends StatelessWidget {
  final ProjectItem? project;
  final bool isMobile;

  const ProjectItemWidget({super.key, required this.project,required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile?250:300,
      height: isMobile?130:150,
      margin: EdgeInsets.all(isMobile?14:20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey,
          image: DecorationImage(
              image: NetworkImage(project?.image??""), fit: BoxFit.cover)),
      child: Column(children: [
        const Spacer(),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(color: Colors.black87),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text((project?.name??"").toUpperCase(),
                    style: isMobile?TextStylesMobile.projectTitleStyle:TextStyles.projectTitleStyle),
              ),
              const SizedBox(height: 12,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: (project?.links??[]).map((link) => _iconLinkWidget(
                      (link.type??"").getLinkType,
                      link.link??"",
                    )).toList(),
              )
            ],
          ),
        )
      ]),
    );
  }

  Widget _iconLinkWidget(LinkType type, String link) {
    var icon = type == LinkType.android ? Icons.android: type == LinkType.ios ? Icons.apple : Icons.web;
    return InkWell(
      onTap: (){
        AppLogic.openUrl(link,"new_window${type.type}");
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.appWhiteColor)
        ),
        child: Icon(icon,color: AppColors.appWhiteColor,size: 16,),
      ),
    );
  }
}
