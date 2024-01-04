import 'package:get/get.dart';
import 'package:tes_transisi_app/model/user.dart';
import 'package:tes_transisi_app/network/network_helper.dart';
import 'package:tes_transisi_app/style/style.dart';

class ListEmployeeController extends GetxController {
  final DioClient client = DioClient();
  var isLoading = false.obs;
  var userList = <User>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await getDataList();
  }

  @override
  void onClose() {}

  Future getDataList() async {
    isLoading(true);
    userList.value = await client.fetchDataList();
    if (userList.isEmpty) {
      AppAlert(message: 'Data is empty ..', alertType: AlertType.error);
    }
    isLoading.value = false;
  }
}
