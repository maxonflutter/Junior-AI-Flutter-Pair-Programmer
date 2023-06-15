// PROMPT: Create a BLoC to collect the user review for a movie in a Movie Rating 
// application. The BLoC collects the data and finally, connects with a repository 
// to save the movie review for the Movie. 

// Output from: https://junior.atomsbox.com/#/bloc-generator

part of 'movie_review_bloc.dart';

enum MovieReviewStatus { initial, loading, success, failure }

class MovieReviewState extends Equatable {
  final MovieReviewStatus status;
  final String movieTitle;
  final int movieRating;
  final String reviewText;

  const MovieReviewState({
    this.status = MovieReviewStatus.initial,
    required this.movieTitle,
    required this.movieRating,
    required this.reviewText,
  });

  MovieReviewState copyWith({
    MovieReviewStatus? status,
    String? movieTitle,
    int? movieRating,
    String? reviewText,
  }) {
    return MovieReviewState(
      status: status ?? this.status,
      movieTitle: movieTitle ?? this.movieTitle,
      movieRating: movieRating ?? this.movieRating,
      reviewText: reviewText ?? this.reviewText,
    );
  }

  @override
  List<Object?> get props => [status, movieTitle, movieRating, reviewText];
}