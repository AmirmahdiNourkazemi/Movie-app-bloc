abstract class SearchEvent {}

class SearchInitEvent extends SearchEvent {}

class SearchResult extends SearchEvent {
  String word;
  SearchResult(this.word);
}
