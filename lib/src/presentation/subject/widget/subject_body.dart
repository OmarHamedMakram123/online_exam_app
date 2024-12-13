import 'package:flutter/material.dart';
import 'package:online_exam_app/core/extension/extension.dart';
import 'package:online_exam_app/src/presentation/subject/widget/custom_search.dart';
import 'package:online_exam_app/src/presentation/subject/widget/subject_state_builder.dart';

import '../../../../core/styles/fonts/app_fonts.dart';
import '../../../../core/utils/functions/spaceing/spaceing.dart';

class SubjectBody extends StatelessWidget {
  const SubjectBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 14.0,horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomSearch(),
          verticalSpace(30),
          Text(
            context.localizations.browseBySubject,
            style: AppFonts.font18kBlack0Weight500FontInter,
          ),
          verticalSpace(24),
          const Expanded(
            child: SubjectStateBuilder(),
          ),
        ],
      ),
    );
  }
}
