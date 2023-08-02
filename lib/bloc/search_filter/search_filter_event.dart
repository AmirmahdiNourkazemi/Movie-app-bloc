abstract class SearchFilterEvent {}

class SearchFilterInitEvent extends SearchFilterEvent {}

class SearchFilterString extends SearchFilterEvent {
  String q;
  SearchFilterString(this.q);
}

class SearchFilterOrderBy extends SearchFilterEvent {
  String order;
  SearchFilterOrderBy(this.order);
}

class SearchFilterRating extends SearchFilterEvent {
  String rating;
  SearchFilterRating(this.rating);
}
