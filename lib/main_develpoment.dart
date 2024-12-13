import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:online_exam_app/src/data/data_source/offline_data_source/result_offline_data_source/exam_offline_data_source/exam_offline_data_source.dart';
import 'package:online_exam_app/src/data/data_source/offline_data_source/result_offline_data_source/model/answer_cache_model/answer_cache_model.dart';
import 'package:online_exam_app/src/data/data_source/offline_data_source/result_offline_data_source/model/question/cache_model/question_cache_model.dart';

import 'core/utils/functions/bloc_observer/bloc_observer.dart';
import 'dependency_injection/di.dart';
import 'online_exam_app.dart';
import 'src/data/data_source/offline_data_source/result_offline_data_source/model/exam_cache_model/exam_cached_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Hive.initFlutter();
  Bloc.observer = MyBlocObserver();
  Hive.registerAdapter(ExamCachedModelAdapter());
  Hive.registerAdapter(AnswerCachedModelAdapter());
  Hive.registerAdapter(QuestionCacheModelAdapter());
  Hive.registerAdapter(CheckAnswerCachedModelAdapter());
  await Hive.openBox<ExamCachedModel>(CachedOfflineDataSource.examCachedKey);
  await Hive.openBox<QuestionCacheModel>(CachedOfflineDataSource.questionCachedKey);
  await Hive.openBox<CheckAnswerCachedModel>(CachedOfflineDataSource.answerCachedKey);
  runApp(const OnlineExamApp());
}

