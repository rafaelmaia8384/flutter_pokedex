import '../../app_repository.dart';
import '../../models/model_response.dart';

class SearchRepository {
  static Future<ServerResponse> getItemList(int page) async {
    int pageLimit = 1154;
    int offset = page * pageLimit;
    ServerResponse serverResponse =
        await AppRepository.getRequest('?limit=$pageLimit&offset=$offset');
    return serverResponse;
  }
}
