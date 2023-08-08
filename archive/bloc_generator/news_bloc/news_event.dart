part of 'news_bloc.dart';

import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class FetchNewsEvent extends NewsEvent {
  const FetchNewsEvent();
}

class RefreshNewsEvent extends NewsEvent {
  const RefreshNewsEvent();
}

class AddNewsEvent extends NewsEvent {
  final News news;

  const AddNewsEvent(this.news);

  @override
  List<Object> get props => [news];
}

class DeleteNewsEvent extends NewsEvent {
  final News news;

  const DeleteNewsEvent(this.news);

  @override
  List<Object> get props => [news];
}

class UpdateNewsEvent extends NewsEvent {
  final News news;

  const UpdateNewsEvent(this.news);

  @override
  List<Object> get props => [news];
}