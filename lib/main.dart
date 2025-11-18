import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mshaikh_sudan/mskaikh_app.dart';

import 'core/bloc/category/category_bloc.dart';
import 'core/bloc/sheikh/sheikh_bloc.dart';
import 'core/bloc/audio/audio_bloc.dart';
import 'core/bloc/audio_player/audio_player_bloc.dart';
import 'core/services/audio_player_service.dart';
import 'core/utils/app_colors.dart';
import 'core/bloc/sheikh/sheikh_event.dart';
import 'core/bloc/audio/audio_event.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configLoading();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryBloc(),
        ),
        BlocProvider(
          create: (context) => SheikhBloc()..add(const LoadFeaturedSheikhs()),
        ),
        BlocProvider(
          create: (context) => AudioBloc()..add(const LoadAudios()),
        ),
        BlocProvider(
          create: (context) => AudioPlayerBloc(AudioPlayerService()),
        ),
      ],
      child: const MshaikhApp(),
    ),
  );
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.cubeGrid
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = AppColors.primaryColor
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskColor = Colors.white
    ..userInteractions = false
    ..dismissOnTap = false;
}