import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/blocs/album/events.dart';
import 'package:flutter_starter/blocs/album/states.dart';
import 'package:flutter_starter/model/album.dart';
import 'package:flutter_starter/networking/exceptions.dart';
import 'package:flutter_starter/networking/services.dart';

// https://itnext.io/bloc-pattern-in-flutter-explained-with-real-example-a858e69eb5b8
class AlbumsBloc extends Bloc<AlbumEvents, AlbumsState> {
  final AlbumsRepo albumsRepo;
  List<Album> albums;

  AlbumsBloc({this.albumsRepo}) : super(AlbumsInitState());

  @override
  Stream<AlbumsState> mapEventToState(AlbumEvents event) async* {
    switch (event) {
      case AlbumEvents.fetchAlbums:
        yield AlbumsLoading();
        try {
          albums = await albumsRepo.getAlbumList();
          yield AlbumsLoaded(albums: albums);
        } on SocketException {
          yield AlbumsListError(
            error: NoInternetException('No Internet'),
          );
        } on HttpException {
          yield AlbumsListError(
            error: NoServiceFoundException('No Service Found'),
          );
        } on FormatException {
          yield AlbumsListError(
            error: InvalidFormatException('Invalid Response format'),
          );
        } catch (e) {
          yield AlbumsListError(
            error: UnknownException('Unknown Error'),
          );
        }
        break;
    }
  }
}
