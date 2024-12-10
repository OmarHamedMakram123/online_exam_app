import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/src/domain/entities/subject_entity.dart';
import 'package:online_exam_app/src/presentation/subject/widget/subject_list_item_widget.dart';

class SubjectListWidget extends StatelessWidget {
  final List<SubjectEntity> subjects;
  const SubjectListWidget({super.key, required this.subjects});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return SubjectListItemWidget(
            subjectEntity: subjects[index],
          );
        },
        separatorBuilder: (context, index) => SizedBox(
              height: 16.h,
            ),
        itemCount: subjects.length);
  }
}
