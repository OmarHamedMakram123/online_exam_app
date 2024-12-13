import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/styles/fonts/app_fonts.dart';
import 'package:online_exam_app/src/domain/entities/answer_entity.dart';

class AnswerResultItemWidget extends StatelessWidget {
  final AnswerEntity answerEntity;
  final Color ? borderColor;
  final Color ? radioColor;
  final bool isCheckRadioColor;
  const AnswerResultItemWidget({super.key, required this.answerEntity,  this.borderColor, this.radioColor,required this.isCheckRadioColor});

  @override
  Widget build(BuildContext context) {
    return    Container(
        height: 55.h,
        width: 327.w,
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          color: borderColor ?? const Color(0xFFEDEFF3),
        ),
        child:
        ListTile(
          leading:Radio<bool>(
            value: isCheckRadioColor,
            groupValue: true,

            onChanged: (bool? value) {  },
              fillColor: WidgetStateProperty.resolveWith ((Set  states) {
                return radioColor;
              }),
          ),
          title: Text(
            answerEntity.answer ?? "",
            style:
             AppFonts.font14kBlack0Weight400FontInter
          ),
        )


    );
  }
}
