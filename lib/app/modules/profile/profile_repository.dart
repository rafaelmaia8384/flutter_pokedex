import '../../app_repository.dart';
import '../../models/model_response.dart';

class HomeRepository {
  static Future<ServerResponse> getItemList(int page) async {
    ServerResponse serverResponse = await AppRepository.getRequest('');
    return serverResponse;
  }
}
