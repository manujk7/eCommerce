import 'package:get/get.dart';
import 'package:e_commerce_app/domain/constants/api_routes.dart';

import '../data_service.dart';

class DeleteAccountUseCase {
  final DataService _dataService = Get.find<DataService>();

  Future<bool> execute() async {
    var response = await _dataService.fetchJsonFromNetwork<dynamic>(
        Method.POST, ApiRoute.deleteAccount,
        mapper: (json) => json);

    if (response['message'] != "Ok") {
      return true;
    } else {
      return false;
    }
  }
}
