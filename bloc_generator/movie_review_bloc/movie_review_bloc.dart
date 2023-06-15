// PROMPT: Create a BLoC to collect the user review for a movie in a Movie Rating 
// application. The BLoC collects the data and finally, connects with a repository 
// to save the movie review for the Movie. 

// Output from: https://junior.atomsbox.com/#/bloc-generator

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'movie_review_event.dart';
part 'movie_review_state.dart';

class MovieReviewBloc extends Bloc<MovieReviewEvent, MovieReviewState> {
  final MovieReviewRepository _movieReviewRepository;

  MovieReviewBloc({
    required MovieReviewRepository movieReviewRepository,
  })  : _movieReviewRepository = movieReviewRepository,
        super(const MovieReviewState.initial()) {
    on<MovieReviewTextChanged>(_onMovieReviewTextChanged);
    on<MovieReviewSubmitButtonPressed>(_onMovieReviewSubmitButtonPressed);
  }

  Future<void> _onMovieReviewTextChanged(
    MovieReviewTextChanged event,
    Emitter<MovieReviewState> emit,
  ) async {
    emit(state.copyWith(reviewText: event.reviewText));
  }

  Future<void> _onMovieReviewSubmitButtonPressed(
    MovieReviewSubmitButtonPressed event,
    Emitter<MovieReviewState> emit,
  ) async {
    emit(state.copyWith(status: MovieReviewStatus.loading));

    try {
      await _movieReviewRepository.saveMovieReview(
        movieTitle: state.movieTitle,
        movieRating: state.movieRating,
        reviewText: state.reviewText,
      );
      emit(state.copyWith(status: MovieReviewStatus.success));
    } catch (err) {
      emit(state.copyWith(status: MovieReviewStatus.failure));
    }
  }
}
