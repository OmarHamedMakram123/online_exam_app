import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/src/presentation/questions/view_model/questions_cubit.dart';
import 'package:online_exam_app/src/presentation/questions/widget/questions_button_widget.dart';

import '../../../../core/styles/colors/app_colors.dart';
import '../../../../core/styles/fonts/app_fonts.dart';
import '../../../../core/utils/functions/spaceing/spaceing.dart';
import 'answer_options_list_widget.dart';

class QuestionBodyWidget extends StatelessWidget {
  const QuestionBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var questionViewModel = context.read<QuestionsCubit>();
    return BlocBuilder<QuestionsCubit, QuestionsState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(16.0.r),
          child: Column(
            children: [
              Text(
                "Questions ${questionViewModel.questionIndex + 1}"
                " of ${questionViewModel.questions.length}",
                style: AppFonts.font14GrayWeight400FontInter,
              ),
              verticalSpace(3),
              LinearProgressIndicator(
                color: AppColors.kBlue50,
                minHeight: 3.h,
                valueColor: const AlwaysStoppedAnimation(AppColors.kBlue),
                value: questionViewModel.questionIndex /
                    (questionViewModel.questions.length - 1),
              ),
              verticalSpace(28),
              Text(
                questionViewModel
                        .questions[questionViewModel.questionIndex].title ??
                    "",
                style: AppFonts.font18kBlack0Weight500FontInter,
              ),
              verticalSpace(24),
              AnswerOptionsListWidget(
                  answers: questionViewModel
                          .questions[questionViewModel.questionIndex].answer ??
                      []),
              const QuestionsButtonWidget(),
            ],
          ),
        );
      },
    );
  }
}
