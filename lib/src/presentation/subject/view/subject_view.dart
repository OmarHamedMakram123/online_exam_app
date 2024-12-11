import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/extension/extension.dart';
import 'package:online_exam_app/core/styles/fonts/app_fonts.dart';
import 'package:online_exam_app/dependency_injection/di.dart';
import 'package:online_exam_app/src/presentation/subject/view_modekl/subject_action.dart';
import 'package:online_exam_app/src/presentation/subject/view_modekl/subject_cubit.dart';
import 'package:online_exam_app/src/presentation/subject/widget/subject_body.dart';

class SubjectView extends StatefulWidget {
  const SubjectView({super.key});

  @override
  State<SubjectView> createState() => _SubjectViewState();
}

class _SubjectViewState extends State<SubjectView> {
  var subjectViewModel = getIt.get<SubjectCubit>();
  @override
  void initState() {
    subjectViewModel.doAction(GetAllSubjectAction());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => subjectViewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            context.localizations.survey,
            style: AppFonts.font20kBlue0Weight500FontInter,
          ),
        ),
        body:const SubjectBody(),
      ),
    );
  }
}
