import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/blocs/theme/theme_events.dart';
import 'package:flutter_starter/blocs/theme/theme_state.dart';
import 'package:flutter_starter/core/app_themes.dart';

// https://itnext.io/theming-your-app-in-flutter-using-bloc-save-reload-62048a330584
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  //
  ThemeBloc()
      : super(
          ThemeState(
            themeData: AppThemes.appThemeData[AppTheme.lightTheme],
          ),
        );

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ThemeEvent) {
      yield ThemeState(
        themeData: AppThemes.appThemeData[event.appTheme],
      );
    }
  }
}
