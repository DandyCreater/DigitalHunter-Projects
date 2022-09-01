import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:digital_hunter/domain/model/mission-model/mission_model.dart';
import 'package:digital_hunter/domain/model/museum-model/museum_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'museum_event.dart';
part 'museum_state.dart';

class MuseumBloc extends Bloc<MuseumEvent, MuseumState> {
  MuseumBloc() : super(MuseumInitial()) {
    on<FetchMuseum>((event, emit) async{
      
      final jsonData = await rootBundle.loadString('assets/json/museum.json');
      final decodeData = jsonDecode(jsonData);
      var data = OKContentMuseum.fromJson(decodeData["OKContent"]);

      if(decodeData["ResponseStatus"] == "OK"){
        emit(MuseumSuccess(okContentMuseum: data));
      } else {
        emit(const MuseumFailed(message: "Fetch Museum Failed"));
      }
    });
  }
}
