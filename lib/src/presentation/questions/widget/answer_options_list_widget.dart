import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/utils/functions/spaceing/spaceing.dart';
import 'package:online_exam_app/src/presentation/questions/view_model/questions_cubit.dart';
import '../../../domain/entities/answer_entity.dart';
import 'answer_option_widget.dart';

class AnswerOptionsListWidget extends StatelessWidget {
  final List<AnswerEntity>answers;

  const AnswerOptionsListWidget({super.key,
    required this.answers});

  @override Widget build(BuildContext context) {
    var questionViewModel=context.read<QuestionsCubit>();
    return BlocBuilder<QuestionsCubit, QuestionsState>(
      builder: (context, state) {
        return SizedBox(
          height: 0.5.sh,
          width: double.infinity,
          child: ListView.separated(
            itemCount: answers.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  questionViewModel.changeSelectedOptionsAnswer(index);
                  },
                child: AnswerOptionWidget(
               isSelected: questionViewModel.getCurrentSelectedOptions()==index,
                    answerEntity: answers[index]),
              );
            },
            separatorBuilder: (context, index) => verticalSpace(16),
          ),
        );
      },
    );
  }
}
