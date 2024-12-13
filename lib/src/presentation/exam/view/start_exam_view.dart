import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/styles/colors/app_colors.dart';
import 'package:online_exam_app/core/styles/fonts/app_fonts.dart';
import 'package:online_exam_app/core/styles/images/app_images.dart';
import 'package:online_exam_app/core/utils/functions/handle_widget_state/handle_widget_state.dart';
import 'package:online_exam_app/core/utils/functions/spaceing/spaceing.dart';
import 'package:online_exam_app/core/utils/widget/custom_button_widget.dart';
import '../../../../config/routes/page_route_name.dart';
import '../../../domain/entities/exam_entity.dart';

class StartExamView extends StatelessWidget {
  const StartExamView({super.key});

  @override
  Widget build(BuildContext context) {
    ExamEntity examEntity =
        ModalRoute.of(context)?.settings.arguments as ExamEntity;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => HandleWidgetState.navigateToPopScreen(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: <Widget>[
                Image.asset(
                  AppImages.exams,
                  width: 42.w,
                  height: 47.h,
                ),
                horizontalSpace(8),
                Text(
                  examEntity.title ?? "",
                  style: AppFonts.font2kBlack0Weight500,
                ),
                const Spacer(),
                Text(
                  "${examEntity.duration} Minutes",
                  style: AppFonts.font16kBlueWeight500FontInter,
                )
              ],
            ),
            verticalSpace(8),
            Row(
              children: [
                Text(
                  examEntity.title ?? "",
                  style: AppFonts.font18kBlack0Weight500FontInter,
                ),
                horizontalSpace(8),
                Text(
                  "|",
                  style: AppFonts.font18kBlue0Weight500FontInter,
                ),
                horizontalSpace(8),
                Text(
                  "${examEntity.numberOfQuestions} Question " ?? "",
                  style: AppFonts.font18kGray0Weight400FontInter,
                ),
              ],
            ),
            verticalSpace(16),
            const Divider(
              color: AppColors.kBlue10,
              thickness: 0.5,
            ),
            verticalSpace(24),
            Text(
              "Instructions",
              style: AppFonts.font18kBlack0Weight500FontInter,
            ),
            verticalSpace(16),
            Text(
              '• Lorem ipsum dolor sit amet consecrate.\n'
              '• Lorem ipsum dolor sit amet consectetur.\n'
              '• Lorem ipsum dolor sit amet consectetur.\n'
              '• Lorem ipsum dolor sit amet consectetur.',
              style: AppFonts.font14GrayWeight400FontInter,
            ),
            verticalSpace(48),
            CustomButtonWidget(
                onPressed: () => goNextToQuestionScreen(examEntity, context),
                text: "Start",
                cheekBackGroundColor: true)
          ],
        ),
      ),
    );
  }

  void goNextToQuestionScreen(ExamEntity examEntity, BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(PageRouteName.questionsScreen,
        arguments: examEntity,(route) => false,
    );
  }
}
