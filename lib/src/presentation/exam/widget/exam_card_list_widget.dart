import 'package:flutter/material.dart';
import 'package:online_exam_app/src/domain/entities/exam_entity.dart';
import '../../../../config/routes/page_route_name.dart';
import '../../../data/data_source/offline_data_source/result_offline_data_source/exam_offline_data_source/exam_offline_data_source.dart';
import 'exam_card_item_widget.dart';
class ExamCardListWidget extends StatelessWidget {
  final List<ExamEntity> exams;
  const ExamCardListWidget({super.key, required this.exams});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) =>
          InkWell
            (
              onTap: () async{

              await  CachedOfflineDataSource.cachedExamById(examEntity: exams[index]);
                Navigator.pushNamed(
                    context, PageRouteName.startExamScreen,
                    arguments: exams[index]
                );


              },


              child: ExamCardItemWidget(examEntity: exams[index])),
      itemCount: exams.length,
    );
  }
}
