abstract class SearchFilterEvent {}

class SearchFilterInitEvent extends SearchFilterEvent {}

class SearchFilterString extends SearchFilterEvent {
  String q = '';
  String order = 'title';
  String rating = 'G';
  SearchFilterString({this.q = '', this.order = 'title', this.rating = 'G'});
}
