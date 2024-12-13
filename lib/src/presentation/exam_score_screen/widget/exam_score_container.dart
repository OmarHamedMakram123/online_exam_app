import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/utils/functions/spaceing/spaceing.dart';
import 'package:online_exam_app/core/utils/widget/custom_button_widget.dart';
import 'package:online_exam_app/src/presentation/exam_score_screen/view_model/exam_source_action.dart';
import 'package:online_exam_app/src/presentation/exam_score_screen/view_model/exam_source_cubit.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../../../../../../core/styles/colors/app_colors.dart';
import '../../../../../../../../core/styles/fonts/app_fonts.dart';
import '../../../domain/entities/check_question_entity.dart';

class ExamScoreContainer extends StatelessWidget {
  final CheckQuestionEntity checkQuestions;
  const ExamScoreContainer({super.key, required this.checkQuestions});
  @override
  Widget build(BuildContext context) {
    var examSourceViewModel = context.read<ExamSourceCubit>()
      ..doAction(FormatPercentageTargetAction(
          percentageWithSymbol: checkQuestions.total ?? "%"));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 5.h,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Text(
                "Your Score",
                style: AppFonts.font18kBlack0Weight500FontInter,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              CircularPercentIndicator(
                radius: 70.00,
                animation: true,
                lineWidth: 7.0,
                percent: examSourceViewModel.roundedPercentage / 100,
                progressColor: AppColors.kBlue,
                backgroundColor: AppColors.kRed,
                center: Text(
                  examSourceViewModel.totalText,
                  style: AppFonts.font2kBlack0Weight500,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Correct",
                            style: AppFonts.font16kBlueWeight500FontInter,
                          ),
                          Text(
                            " ${checkQuestions.correct}",
                            style: AppFonts.font16kBlueWeight500FontInter,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Incorrect",
                              style: AppFonts.font16kRedWeight500FontInter),
                          Text("${checkQuestions.wrong}",
                              style: AppFonts.font16kRedWeight500FontInter),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        verticalSpace(
          50,
        ),
        CustomButtonWidget(
          onPressed: () {},
          text: "Show results",
          color: AppColors.kBlue,
          textColor: AppColors.kWhite,
        ),
        verticalSpace(
          25,
        ),
        CustomButtonWidget(
          onPressed: () {},
          text: "Start again",
          color: AppColors.kWhite,
          textColor: AppColors.kBlue,
        )
      ],
    );
  }
}
