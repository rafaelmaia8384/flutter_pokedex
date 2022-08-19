import '../../app_repository.dart';
import '../../models/model_response.dart';

class HomeRepository {
  static Future<ServerResponse> getItemList(int page) async {
    int pageLimit = 20;
    int offset = page * pageLimit;
    ServerResponse serverResponse =
        await AppRepository.getRequest('?limit=$pageLimit&offset=$offset');
    return serverResponse;
  }
}
