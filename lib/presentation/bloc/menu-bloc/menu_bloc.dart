import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:digital_hunter/domain/model/menu-model/menu_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(MenuInitial()) {
    on<FetchMenu>((event, emit) async {
      final jsonData = await rootBundle.loadString("assets/json/menu.json");
      final decodeData = jsonDecode(jsonData);

      var data = OKContentMenu.fromJson(decodeData["OKContent"]);

      if (decodeData["ResponseStatus"] == "OK") {
        emit(MenuSuccess(okContentMenu: data));
      } else {
        emit(const MenuFailed(message: "Fetch Menu Failed"));
      }
    });
  }
}
