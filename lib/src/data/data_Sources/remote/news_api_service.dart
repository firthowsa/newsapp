import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:news_app/src/domain/models/responses/breaking_news_response.dart';
import 'package:news_app/src/utils/constants/strings.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: baseUrl,parser:Parser.JsonSerializable)
abstract class NewsApiService{
  factory NewsApiService(Dio dio,{String? baseUrl})=_NewsApiService;
  @GET("/top-headlines")
  Future<HttpResponse<BreakingNewsResponse>>getBreakingnewsArticles({
    @Query("apiKey")String? apiKey,
    @Query("country")String? country,
   @Query("category")String? category,
    @Query("page")int? page,
    @Query("pageSize")int? pageSize,
    });

}
