import 'package:equatable/equatable.dart';

// https://bloclibrary.dev/#/flutterinfinitelisttutorial
abstract class PostEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PostFetched extends PostEvent {}
