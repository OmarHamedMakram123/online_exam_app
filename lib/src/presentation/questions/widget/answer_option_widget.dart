import 'package:flutter/material.dart';
import '../../../../core/styles/colors/app_colors.dart';
import '../../../../core/styles/fonts/app_fonts.dart';
import '../../../domain/entities/answer_entity.dart';

class AnswerOptionWidget extends StatelessWidget {
  final bool isSelected;
  final AnswerEntity answerEntity;
  const AnswerOptionWidget(
      {super.key, required this.isSelected, required this.answerEntity});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: double.infinity,
      color: isSelected ? AppColors.kBlue10 : AppColors.kLightBlue,
      child: ListTile(
        leading: Radio<bool>(
          value: isSelected,
          activeColor: AppColors.kBlue50,
          onChanged: (value) {},
          groupValue: true,
        ),
        title: Text(
          answerEntity.answer ?? "",
          style: AppFonts.font16BlackWeight500FontInter,
        ),
      ),
    );
  }
}
