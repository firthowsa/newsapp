import '../../../utils/constants/nums.dart';
import '../../../utils/constants/strings.dart';

class BreakingNewsRequest {
  final String apiKey;
  final String sources;
  //final String country;
  final int page;
 // final String category;
  final int pageSize;

  BreakingNewsRequest({
    this.apiKey = defaultApiKey,
    this.sources = 'bbc-news, abc-news',
   // this.country='sa',
    this.page = 1,
    //this.category='sports',
    this.pageSize = defaultPageSize,
  });
}
