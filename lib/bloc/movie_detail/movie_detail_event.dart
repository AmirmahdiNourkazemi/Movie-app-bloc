abstract class MovieDetailEvent {}

class MovieDetailInitEvent extends MovieDetailEvent {
  int mal_id;
  MovieDetailInitEvent(this.mal_id);
}
