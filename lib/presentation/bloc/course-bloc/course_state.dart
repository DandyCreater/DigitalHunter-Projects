part of 'course_bloc.dart';

abstract class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object> get props => [];
}

class CourseInitial extends CourseState {}

class CourseLoading extends CourseState {}

class CourseSuccess extends CourseState {
  final OKContentCourse? okContentCourse;

  const CourseSuccess({required this.okContentCourse});

  @override
  // TODO: implement props
  List<Object> get props => [okContentCourse!];
}

class CourseFailed extends CourseState {
  final String? message;

  const CourseFailed({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}
