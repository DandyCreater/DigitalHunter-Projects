part of 'mission_bloc.dart';

abstract class MissionState extends Equatable {
  const MissionState();

  @override
  List<Object> get props => [];
}

class MissionInitial extends MissionState {}

class MissionLoading extends MissionState {}

class MissionSuccess extends MissionState {
  final OKContentMission? okContentMission;

  const MissionSuccess({required this.okContentMission});

  @override
  // TODO: implement props
  List<Object> get props => [okContentMission!];
}

class MissionFailed extends MissionState {
  final String? message;
  const MissionFailed({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}
