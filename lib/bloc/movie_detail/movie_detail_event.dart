abstract class MovieDetailEvent {}

class MovieDetailInitEvent extends MovieDetailEvent {
  int mal_id;
  int episodes;
  MovieDetailInitEvent(this.mal_id, this.episodes);
}
