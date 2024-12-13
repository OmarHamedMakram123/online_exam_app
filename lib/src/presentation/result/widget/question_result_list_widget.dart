import 'package:flutter/material.dart';
import 'package:online_exam_app/src/presentation/result/widget/question_result_item_widget.dart';

import '../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../domain/entities/question_entity.dart';

class QuestionResultListWidget extends StatelessWidget {
  final List<QuestionEntity> questions;
  const QuestionResultListWidget({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: questions.length,
      itemBuilder: (context, index) {
        return QuestionResultItemWidget(
          question: questions[index],
        );
      },
      separatorBuilder: (context, index) => verticalSpace(24),
    );
  }
}
