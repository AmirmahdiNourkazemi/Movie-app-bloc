class Title {
  final String type;
  final String title;

  Title({required this.type, required this.title});

  factory Title.fromJson(Map<String, dynamic> json) {
    return Title(type: json['type'], title: json['title']);
  }

  Map<String, dynamic> toJson() {
    return {'type': type, 'title': title};
  }
}
