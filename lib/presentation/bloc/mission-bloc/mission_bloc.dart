import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:digital_hunter/domain/model/mission-model/mission_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'mission_event.dart';
part 'mission_state.dart';

class MissionBloc extends Bloc<MissionEvent, MissionState> {
  MissionBloc() : super(MissionInitial()) {
    on<FetchMission>((event, emit) async {
      emit(MissionLoading());

      final jsonData = await rootBundle.loadString('assets/json/mission.json');
      final decodeData = jsonDecode(jsonData);
      var data = OKContentMission.fromJson(decodeData["OKContent"]);

      if (decodeData["ResponseStatus"] == "OK") {
        emit(MissionSuccess(okContentMission: data));
      } else {
        emit(const MissionFailed(message: "Fetch Mission Failed"));
      }
    });
  }
}
