part of 'competition_bloc.dart';

abstract class CompetitionState extends Equatable {
  const CompetitionState();

  @override
  List<Object> get props => [];
}

class CompetitionInitial extends CompetitionState {}

class CompetitionLoading extends CompetitionState {}

class CompetitionSuccess extends CompetitionState {
  final OKContentCompetition? okContentCompetition;

  const CompetitionSuccess({required this.okContentCompetition});

  @override
  // TODO: implement props
  List<Object> get props => [okContentCompetition!];
}

class CompetitionFailed extends CompetitionState {
  final String? message;

  const CompetitionFailed({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}
