import 'package:e_commerce_app/core/app_export.dart';
import 'package:e_commerce_app/core/utils/extensions/getx_controller_extensions.dart';
import 'package:e_commerce_app/domain/data_service.dart';

class BottomNavBarController extends GetxController {
  final DataService _dataService = Get.find<DataService>();
}
