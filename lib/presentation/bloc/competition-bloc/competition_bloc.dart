import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:digital_hunter/domain/model/competition-model/competition_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'competition_event.dart';
part 'competition_state.dart';

class CompetitionBloc extends Bloc<CompetitionEvent, CompetitionState> {
  CompetitionBloc() : super(CompetitionInitial()) {
    on<FetchCompetition>((event, emit) async {
      emit(CompetitionLoading());

      final jsonData =
          await rootBundle.loadString("assets/json/competition.json");
      final decodeData = jsonDecode(jsonData);
      var data = OKContentCompetition.fromJson(decodeData["OKContent"]);

      if (decodeData["ResponseStatus"] == "OK") {
        emit(CompetitionSuccess(okContentCompetition: data));
      } else {
        emit(const CompetitionFailed(message: "Fetch Competition Failed"));
      }
    });
  }
}
