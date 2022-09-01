import 'package:digital_hunter/presentation/bloc/carousel-bloc/carousel_bloc.dart';
import 'package:digital_hunter/presentation/bloc/competition-bloc/competition_bloc.dart';
import 'package:digital_hunter/presentation/bloc/course-bloc/course_bloc.dart';
import 'package:digital_hunter/presentation/bloc/menu-bloc/menu_bloc.dart';
import 'package:digital_hunter/presentation/bloc/mission-bloc/mission_bloc.dart';
import 'package:digital_hunter/presentation/bloc/museum-bloc/museum_bloc.dart';
import 'package:digital_hunter/presentation/resource/routes/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CarouselBloc()..add(FetchCarousel())),
        BlocProvider(create: (_) => MenuBloc()..add(FetchMenu())),
        BlocProvider(create: (_) => CourseBloc()..add(FetchCourse())),
        BlocProvider(create: (_) => CompetitionBloc()..add(FetchCompetition())),
        BlocProvider(create: (_) => MissionBloc()..add(FetchMission())),
        BlocProvider(create: (_) => MuseumBloc()..add(FetchMuseum()))
      ],
      child: const AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.mainPageRoute,
        ),
      ),
    );
  }
}
