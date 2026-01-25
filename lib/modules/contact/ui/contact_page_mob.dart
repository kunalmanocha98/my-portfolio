import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/modules/contact/bloc/contact_bloc.dart';
import 'package:portfolio/modules/contact/model/contact_model.dart';
import 'package:portfolio/modules/contact/state/contact_state.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/app_logic.dart';
import 'package:portfolio/utils/strings.dart';
import 'package:portfolio/utils/text_styles.dart';

class ContactWidgetMob extends StatelessWidget {
  const ContactWidgetMob({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactBloc, ContactState>(
      builder: (BuildContext context, ContactState state) {
        if (state is InitialContactState) {
          return _contactWidget(context, state.contactResponse);
        } else if (state is LoadedContactState) {
          return _contactWidget(context, state.contactResponse);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Widget _contactWidget(BuildContext context, ContactResponse contactResponse) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.contactContainerColorDark
              : Colors.grey.shade200),
      child: Center(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.contact,
                style: TextStylesMobile.expTitleStyle(context),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  contactResponse.summary ?? "",
                  style: TextStylesMobile.expDescStyle(context),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Row(
                  children: [
                    Icon(
                      Icons.email_outlined,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.appWhiteColor
                          : AppColors.appBlackColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: SelectableText(
                        contactResponse.email ?? "",
                        style: TextStylesMobile.expDescStyle(context),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: List.generate(
                  (contactResponse.socialLinks ?? []).length,
                  (index) => InkWell(
                    onTap: () {
                      AppLogic.openUrl(
                          contactResponse.socialLinks?[index].socialLinkUrl ??
                              "",
                          "new_window$index");
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: index == 0 ? 0 : 8.0, right: 8, top: 12),
                      child: Image.network(
                        contactResponse.socialLinks![index].icon!,
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
