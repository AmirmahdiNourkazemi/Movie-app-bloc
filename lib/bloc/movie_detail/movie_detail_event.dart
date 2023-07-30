abstract class MovieDetailEvent {}

class MovieDetailInitEvent extends MovieDetailEvent {
  String mal_id;
  MovieDetailInitEvent(this.mal_id);
}
