import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/styles/fonts/app_fonts.dart';
import '../../../../core/styles/colors/app_colors.dart';
import '../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../domain/entities/question_entity.dart';
import 'answer_result_list_widget.dart';

class QuestionResultItemWidget extends StatelessWidget {
  final QuestionEntity question;
  const QuestionResultItemWidget({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.kWhite,
      shadowColor: AppColors.kRed,
      elevation: 0.2,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  question.title ?? "",
                  style: AppFonts.font18kBlack0Weight500FontInter,
                ),
                verticalSpace(24),
                AnswerResultListWidget(
                  answers: question.answer ?? [],
                ),
              ],
            ),
          )),
    );
  }
}
