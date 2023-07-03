part of 'news_bloc.dart';

enum NewsStatus { initial, loading, loaded, error }

class NewsState extends Equatable {
  final NewsStatus status;
  final List<News> newsList;

  const NewsState({
    this.status = NewsStatus.initial,
    required this.newsList,
  });

  NewsState copyWith({
    NewsStatus? status,
    List<News>? newsList,
  }) {
    return NewsState(
      status: status ?? this.status,
      newsList: newsList ?? this.newsList,
    );
  }

  @override
  List<Object?> get props => [status, newsList];
}