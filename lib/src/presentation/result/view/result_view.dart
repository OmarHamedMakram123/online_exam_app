import 'package:flutter/material.dart';
import 'package:online_exam_app/config/routes/page_route_name.dart';
import 'package:online_exam_app/src/data/data_source/offline_data_source/result_offline_data_source/exam_offline_data_source/exam_offline_data_source.dart';
import 'package:online_exam_app/src/domain/entities/exam_entity.dart';

import '../../exam/widget/exam_card_item_widget.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text( "Result")),
      body: FutureBuilder(
        future:CachedOfflineDataSource.getCachedExamList(),
        builder: (context, snapshot) {
          if(snapshot.data == []){
            return const Center(child: CircularProgressIndicator());
          }else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () => Navigator.pushNamed(context,PageRouteName.resultAnswerScreen),
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                 itemBuilder: (context, index) {
                  return  ExamCardItemWidget(
                     examEntity:ExamEntity(
                         title: snapshot.data![index].title,
                         duration: snapshot.data![index].duration,
                         numberOfQuestions: snapshot.data![index].numberOfQuestions,
                         createdAt: snapshot.data![index].createdAt,
                         id: snapshot.data![index].id,
                     ) ,
                   );
                 },
                )
              ),
            );
          }

        },

      ),
    );
  }
}
