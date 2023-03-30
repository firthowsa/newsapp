

import 'package:news_app/src/data/base/base_api_repository.dart';
import 'package:news_app/src/data/data_Sources/remote/news_api_service.dart';
import 'package:news_app/src/domain/models/requests/breaking_news_request.dart';
import 'package:news_app/src/domain/models/responses/breaking_news_response.dart';
import 'package:news_app/src/domain/repository/api_repository.dart';
import 'package:news_app/src/utils/resources/data_state.dart';

class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository {
  final NewsApiService _newsApiService;

  ApiRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<BreakingNewsResponse>> getBreakingNewsArticles({
    required BreakingNewsRequest request,
  }) {
    return getStateOf<BreakingNewsResponse>(
      request: () => _newsApiService.getBreakingNewsArticles(
        apiKey: request.apiKey,
        sources: request.sources,
        page: request.page,
        pageSize: request.pageSize,
      ),
    );
  }
}