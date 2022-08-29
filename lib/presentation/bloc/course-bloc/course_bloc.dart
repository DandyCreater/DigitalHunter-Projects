import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:digital_hunter/domain/model/course-model/course_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(CourseInitial()) {
    on<FetchCourse>((event, emit) async {
      emit(CourseLoading());

      final jsonData = await rootBundle.loadString("assets/json/course.json");
      final decodeData = jsonDecode(jsonData);

      var data = OKContentCourse.fromJson(decodeData["OKContent"]);

      if (decodeData["ResponseStatus"] == "OK") {
        emit(CourseSuccess(okContentCourse: data));
      } else {
        emit(const CourseFailed(message: "Fetch Course Failed"));
      }
    });
  }
}
