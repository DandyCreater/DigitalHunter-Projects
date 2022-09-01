part of 'museum_bloc.dart';

abstract class MuseumState extends Equatable {
  const MuseumState();

  @override
  List<Object> get props => [];
}

class MuseumInitial extends MuseumState {}

class MuseumLoading extends MuseumState {}

class MuseumSuccess extends MuseumState {
  final OKContentMuseum? okContentMuseum;

  const MuseumSuccess({required this.okContentMuseum});

  @override
  // TODO: implement props
  List<Object> get props => [okContentMuseum!];
}

class MuseumFailed extends MuseumState {
  final String? message;

  const MuseumFailed({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}
