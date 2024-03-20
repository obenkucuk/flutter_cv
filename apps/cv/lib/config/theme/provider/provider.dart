import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../my_colors.dart';
import '../my_theme_data.dart';
import '../theme_state.dart';

part 'provider.g.dart';

@riverpod
class MyTheme extends _$MyTheme {
  @override
  ThemeState build() => ThemeState.initial();

  Future<void> changeTheme() async {
    try {
      // final isar = await ref.read(isarDBProvider.future);
      // final preferences = isar.userPreferences.where().findAll().first;
      // final themeMode =
      //     state.themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;

      // talker.info('Prefs');
      // talker.info(preferences.themeMode);

      // await isar.writeAsync(
      //   (isar) => isar.userPreferences
      //       .put(preferences.copyWith(themeMode: themeMode)),
      // );

      state = state.copyWith(
        themeMode: state.themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark,
      );

      // talker.info('State');
      // talker.info(state.themeMode);
    } catch (_) {}
  }

  void changeThemeWith({ThemeMode themeMode = ThemeMode.system}) {
    if (state.themeMode == themeMode) return;

    state = state.copyWith(themeMode: themeMode);
  }

  void changePrimaryColor(Color primaryColor) {
    if (state.myThemeData.myColors.primaryColor == primaryColor) return;

    state = state.copyWith(
      myThemeData: MyThemeData(
        myColors: MyColors(primaryColor: primaryColor),
      ),
    );
  }
}







// class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
//   ThemeBloc() : super(const ThemeState.initial()) {
//     on<ChangeThemeModeEvent>(_onChangeThemeModeEvent);
//     on<ChangePrimaryColorEvent>(_onChangePrimaryColorEvent);
//   }

//   _onChangeThemeModeEvent(
//     ChangeThemeModeEvent event,
//     Emitter<ThemeState> emit,
//   ) {
//     emit(state.copyWith(themeMode: event.themeMode));
//   }

//   _onChangePrimaryColorEvent(
//     ChangePrimaryColorEvent event,
//     Emitter<ThemeState> emit,
//   ) {
//     emit(
//       state.copyWith(
//         myThemeData: MyThemeData(
//           myColors: MyColors(primaryColor: event.primaryColor),
//         ),
//       ),
//     );
//   }
// }
