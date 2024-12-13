import 'package:flutter/material.dart';

import '../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../domain/entities/answer_entity.dart';
import 'answer_result_list_item_widget.dart';

class AnswerResultListWidget extends StatelessWidget {
  final List<AnswerEntity>answers;
  const AnswerResultListWidget({super.key, required this.answers});

  @override
  Widget build(BuildContext context) {
    return   ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount:answers.length,
      itemBuilder: (context, index) {
        return AnswerResultItemWidget(
          borderColor:getColor(index) ,
          radioColor: getRadioColor(index),
          isCheckRadioColor:getCheckRadioColor(index) ,
          answerEntity:answers[index],
        );
      },
      separatorBuilder: (context, index) => verticalSpace(10),
    );

  }

  Color ?  getColor(int index){
    if(index==0){
      return const Color(0xFFCAF9CC);
    }
    else if(index==1){
      return const Color(0xFFF8D2D2);
    }
    else{
      return null;
    }
  }


  Color ?  getRadioColor(int index){
    if(index==0){
      return const Color(0xFF11CE19);
    }
    else if(index==1){
      return const Color(0xFFCC1010);
    }
    else{
      return const Color(0xFF02369C);
    }
  }
  bool   getCheckRadioColor(int index){
    if(index==0){
      return false;
    }
    else if(index==1){
      return true;

    }
    else{
      return false;
    }
  }
}
