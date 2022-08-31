import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:digital_hunter/domain/model/carousel-model/carousel_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'carousel_event.dart';
part 'carousel_state.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  CarouselBloc() : super(CarouselInitial()) {
    on<CarouselEvent>((event, emit) async {
      emit(CarouselLoading());

      final jsonData = await rootBundle.loadString("assets/json/carousel.json");
      final dataDecode = jsonDecode(jsonData);

      final abc = await rootBundle.loadString("assets/json/museum.json");
      print(jsonEncode(jsonDecode(abc)));

      var data = OKContentCarousel.fromJson(dataDecode["OKContent"]);

      if (dataDecode["ResponseStatus"] == "OK") {
        emit(CarouselSuccess(okContentCarousel: data));
      } else {
        emit(const CarouselFailed(message: "Fetch Carousel Failed"));
      }
    });
  }
}
