

import 'package:flutter/foundation.dart';
import 'package:news_app/src/data/base/base_api_repository.dart';
import 'package:news_app/src/data/data_Sources/remote/news_api_service.dart';
import 'package:news_app/src/domain/models/requests/breaking_news_request.dart';
import 'package:news_app/src/domain/models/responses/breaking_news_response.dart';
import 'package:news_app/src/utils/resources/data_state.dart';

class ApiRepositoryImpl extends BaseApiRepository{
  final NewsApiService newsApiService;

  ApiRepositoryImpl(this.newsApiService);

  Future<DataState<BreakingNewsResponse>> getBreakingNewsArticles( {
    required BreakingNewsRequest request,
  }){
    return getStateOf<BreakingNewsResponse>(
      request: () => newsApiService.getBreakingnewsArticles(
        apiKey: request.apiKey,
        country: request.country,
        category: request.category,
        page: request.page,
        pageSize: request.pageSize,
      ),
    );
  }

}