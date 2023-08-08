// PROMPT: Create a BLoC to collect the user review for a movie in a Movie Rating 
// application. The BLoC collects the data and finally, connects with a repository 
// to save the movie review for the Movie. 

// Output from: https://junior.atomsbox.com/#/bloc-generator

part of 'movie_review_bloc.dart';

abstract class MovieReviewEvent extends Equatable {
  const MovieReviewEvent();

  @override
  List<Object> get props => [];
}

class MovieReviewSubmitButtonPressed extends MovieReviewEvent {
  const MovieReviewSubmitButtonPressed();
}

class MovieReviewTextChanged extends MovieReviewEvent {
  final String reviewText;

  const MovieReviewTextChanged({required this.reviewText});

  @override
  List<Object> get props => [reviewText];
}