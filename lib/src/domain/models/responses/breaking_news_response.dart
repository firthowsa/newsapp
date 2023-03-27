import 'package:equatable/equatable.dart';
import 'package:news_app/src/domain/models/article.dart';

class BreakingNewsResponse extends Equatable {
  final String? status;
  final int? totalResults;
  final List<Article>? articles;

  const BreakingNewsResponse({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory BreakingNewsResponse.fromMap(Map<String, dynamic> map) {
    return BreakingNewsResponse(
      status: map['status'] != null ? map['status'] as String : null,
      totalResults:
          map['totalResults'] != null ? map['totalResults'] as int : null,
      articles: map['articles'] != null
          ? List<Article>.from(
              map['articles']?.map((x) => Article.fromMap(x as Map<String, dynamic>)))
          : null,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, totalResults, articles];
}