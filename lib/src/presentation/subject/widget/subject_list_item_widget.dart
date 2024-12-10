import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/config/routes/page_route_name.dart';

import '../../../../core/styles/colors/app_colors.dart';
import '../../../../core/styles/fonts/app_fonts.dart';
import '../../../../core/utils/widget/cached_network_image _widget.dart';
import '../../../domain/entities/subject_entity.dart';

class SubjectListItemWidget extends StatelessWidget {
  final SubjectEntity subjectEntity;
  const SubjectListItemWidget({super.key, required this.subjectEntity});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          //  Navigator.pushNamed(context, PageRouteName.examsView,arguments:subjectEntity);
        },
        child: Card(
          elevation: 11,
          child: Container(
            height: 80.h,
            decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: BorderRadius.circular(10.0.r)),
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
            child: Row(
              children: [
                CachedNetworkImageWidget(
                    imageUrl: subjectEntity.iconImage ?? "",
                    width: 48.w,
                    height: 48.h),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  subjectEntity.name ?? "",
                  style: AppFonts.font16BlackWeight400FontInter,
                )
              ],
            ),
          ),
        ));
  }
}
