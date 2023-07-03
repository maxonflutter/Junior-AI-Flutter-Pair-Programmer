// PROMPT: Create a BLoC to manage a list of news articles inside
// a Flutter news app.

// Output from: https://junior.atomsbox.com/#/bloc-generatorimport 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository _newsRepository;
  final StreamSubscription<List<News>> _newsSubscription;

  NewsBloc({
    required NewsRepository newsRepository,
  })  : _newsRepository = newsRepository,
        super(const NewsState()) {
    on<FetchNewsEvent>(_onFetchNewsEvent);
    on<RefreshNewsEvent>(_onRefreshNewsEvent);
    on<AddNewsEvent>(_onAddNewsEvent);
    on<DeleteNewsEvent>(_onDeleteNewsEvent);
    on<UpdateNewsEvent>(_onUpdateNewsEvent);

    _newsSubscription = _newsRepository.newsStream().listen(_newsChanged);
  }

  void _newsChanged(List<News> newsList) => add(FetchNewsEvent(newsList));

  Future<void> _onFetchNewsEvent(
    FetchNewsEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(state.copyWith(status: NewsStatus.loading));

    try {
      final newsList = await _newsRepository.getNewsList();
      emit(
        state.copyWith(
          status: NewsStatus.loaded,
          newsList: newsList,
        ),
      );
    } catch (err) {
      emit(state.copyWith(status: NewsStatus.error));
    }
  }

  Future<void> _onRefreshNewsEvent(
    RefreshNewsEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(state.copyWith(status: NewsStatus.loading));

    try {
      final newsList = await _newsRepository.refreshNewsList();
      emit(
        state.copyWith(
          status: NewsStatus.loaded,
          newsList: newsList,
        ),
      );
    } catch (err) {
      emit(state.copyWith(status: NewsStatus.error));
    }
  }

  Future<void> _onAddNewsEvent(
    AddNewsEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(state.copyWith(status: NewsStatus.loading));

    try {
      await _newsRepository.addNews(event.news);
      final newsList = await _newsRepository.getNewsList();
      emit(
        state.copyWith(
          status: NewsStatus.loaded,
          newsList: newsList,
        ),
      );
    } catch (err) {
      emit(state.copyWith(status: NewsStatus.error));
    }
  }

  Future<void> _onDeleteNewsEvent(
    DeleteNewsEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(state.copyWith(status: NewsStatus.loading));

    try {
      await _newsRepository.deleteNews(event.newsId);
      final newsList = await _newsRepository.getNewsList();
      emit(
        state.copyWith(
          status: NewsStatus.loaded,
          newsList: newsList,
        ),
      );
    } catch (err) {
      emit(state.copyWith(status: NewsStatus.error));
    }
  }

  Future<void> _onUpdateNewsEvent(
    UpdateNewsEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(state.copyWith(status: NewsStatus.loading));

    try {
      await _newsRepository.updateNews(event.news);
      final newsList = await _newsRepository.getNewsList();
      emit(
        state.copyWith(
          status: NewsStatus.loaded,
          newsList: newsList,
        ),
      );
    } catch (err) {
      emit(state.copyWith(status: NewsStatus.error));
    }
  }

  @override
  Future<void> close() {
    _newsSubscription.cancel();
    return super.close();
  }
}
```