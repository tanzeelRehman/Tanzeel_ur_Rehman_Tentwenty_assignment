class MoviesModel {
  MoviesModel({
    this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
  late final Dates? dates;
  late final int page;
  late final List<Results> results;
  late final int totalPages;
  late final int totalResults;

  Map<String, dynamic> date = {"dates": "Not Specified"};

  MoviesModel.fromJson(Map<String, dynamic> json) {
    dates = Dates?.fromJson(json['dates'] ?? date);
    page = json['page'];
    results =
        List.from(json['results']).map((e) => Results.fromJson(e)).toList();
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dates'] = dates?.toJson();
    _data['page'] = page;
    _data['results'] = results.map((e) => e.toJson()).toList();
    _data['total_pages'] = totalPages;
    _data['total_results'] = totalResults;
    return _data;
  }
}

class Dates {
  Dates({
    this.maximum,
    this.minimum,
  });
  late final String? maximum;
  late final String? minimum;

  Dates.fromJson(Map<String, dynamic> json) {
    maximum = json['maximum'] ?? "Not Specified";
    minimum = json['minimum'] ?? "Not Specified";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['maximum'] = maximum;
    _data['minimum'] = minimum;
    return _data;
  }
}

class Results {
  Results({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
  late final bool adult;
  late final String? backdropPath;
  late final List<int> genreIds;
  late final int id;
  late final String originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final double popularity;
  late final String? posterPath;
  late final String releaseDate;
  late final String title;
  late final bool video;
  late final num? voteAverage;
  late final int voteCount;

  Results.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'] ??
        "https://in.pinterest.com/pin/864550459719526011/";
    genreIds = List.castFrom<dynamic, int>(json['genre_ids']);
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'] ??
        "https://in.pinterest.com/pin/864550459719526011/";
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['adult'] = adult;
    _data['backdrop_path'] = backdropPath;
    _data['genre_ids'] = genreIds;
    _data['id'] = id;
    _data['original_language'] = originalLanguage;
    _data['original_title'] = originalTitle;
    _data['overview'] = overview;
    _data['popularity'] = popularity;
    _data['poster_path'] = posterPath;
    _data['release_date'] = releaseDate;
    _data['title'] = title;
    _data['video'] = video;
    _data['vote_average'] = voteAverage;
    _data['vote_count'] = voteCount;
    return _data;
  }
}
