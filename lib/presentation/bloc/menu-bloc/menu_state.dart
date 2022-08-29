part of 'menu_bloc.dart';

abstract class MenuState extends Equatable {
  const MenuState();

  @override
  List<Object> get props => [];
}

class MenuInitial extends MenuState {}

class MenuLoading extends MenuState {}

class MenuSuccess extends MenuState {
  final OKContentMenu? okContentMenu;

  const MenuSuccess({required this.okContentMenu});

  @override
  // TODO: implement props
  List<Object> get props => [okContentMenu!];
}

class MenuFailed extends MenuState {
  final String? message;

  const MenuFailed({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}
