import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/blocs/album/albums_bloc.dart';
import 'package:flutter_starter/blocs/album/events.dart';
import 'package:flutter_starter/blocs/album/states.dart';
import 'package:flutter_starter/blocs/theme/theme_bloc.dart';
import 'package:flutter_starter/blocs/theme/theme_events.dart';
import 'package:flutter_starter/core/app_themes.dart';
import 'package:flutter_starter/core/preferences.dart';
import 'package:flutter_starter/model/album.dart';
import 'package:flutter_starter/views/widgets/error.dart';
import 'package:flutter_starter/views/widgets/list_row.dart';
import 'package:flutter_starter/views/widgets/loading.dart';
import 'package:flutter_starter/views/widgets/txt.dart';

// https://itnext.io/bloc-pattern-in-flutter-explained-with-real-example-a858e69eb5b8
// https://itnext.io/theming-your-app-in-flutter-using-bloc-save-reload-62048a330584

class AlbumsScreen extends StatefulWidget {
  @override
  _AlbumsScreenState createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  @override
  void initState() {
    super.initState();
    _loadTheme();
    _loadAlbums();
  }

  _loadAlbums() async {
    //context.bloc<AlbumsBloc>().add(AlbumEvents.fetchAlbums);
    BlocProvider.of<AlbumsBloc>(context).add(AlbumEvents.fetchAlbums);
    // context.watch OR context.read is not working ?!
  }

  _loadTheme() async {
    BlocProvider.of<ThemeBloc>(context)
        .add(ThemeEvent(appTheme: Preferences.getTheme()));
  }

  void setTheme(bool darkTheme) {
    AppTheme selectedTheme =
        darkTheme ? AppTheme.lightTheme : AppTheme.darkTheme;
    BlocProvider.of<ThemeBloc>(context)
        .add(ThemeEvent(appTheme: selectedTheme));
    Preferences.saveTheme(selectedTheme);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            color: Theme.of(context).textTheme.bodyText1.color
        ),
        backgroundColor: Theme.of(context).primaryColor,
        title: Txt(text: "Albums"),
        actions: [
          Switch(
            value: Preferences.getTheme() == AppTheme.lightTheme,
            onChanged: (val) {
              setTheme(val);
            },
          )
        ],
      ),
      body: Container(
        child: _body(),
      ),
    );
  }

  _body() {
    return Column(
      children: [
        BlocBuilder<AlbumsBloc, AlbumsState>(
            builder: (BuildContext context, AlbumsState state) {
          if (state is AlbumsListError) {
            final error = state.error;
            String message = '${error.message}\nTap to Retry.';
            return ErrorTxt(
              message: message,
              onTap: _loadAlbums,
            );
          }
          if (state is AlbumsLoaded) {
            List<Album> albums = state.albums;
            return _list(albums);
          }
          return Loading();
        }),
      ],
    );
  }

  Widget _list(List<Album> albums) {
    return Expanded(
      child: ListView.builder(
        itemCount: albums.length,
        itemBuilder: (_, index) {
          Album album = albums[index];
          return ListRow(album: album);
        },
      ),
    );
  }
}
