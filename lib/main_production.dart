import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:online_exam_app/src/data/data_source/offline_data_source/result_offline_data_source/exam_offline_data_source/exam_offline_data_source.dart';
import 'package:online_exam_app/src/data/data_source/offline_data_source/result_offline_data_source/model/exam_cache_model/exam_cached_model.dart';
import 'package:online_exam_app/src/data/data_source/offline_data_source/result_offline_data_source/model/question/cache_model/question_cache_model.dart';

import 'core/utils/functions/bloc_observer/bloc_observer.dart';
import 'dependency_injection/di.dart';
import 'online_exam_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(ExamCachedModelAdapter());
  Hive.registerAdapter(AnswerCachedModelAdapter());
  Hive.registerAdapter(QuestionCacheModelAdapter());
  await Hive.openBox<ExamCachedModel>(CachedOfflineDataSource.examCachedKey);
  await Hive.openBox<QuestionCacheModel>(CachedOfflineDataSource.questionCachedKey);
  runApp(const OnlineExamApp());
}

