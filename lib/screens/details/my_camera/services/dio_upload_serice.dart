import 'package:dio/dio.dart';

class DioUploadService {
  get path => null;

  Future<String> uploadPhotos(List<String> paths) async {
    List<MultipartFile> files = [];
    for (var path in paths) files.add(await MultipartFile.fromFile(path));
    var formData = FormData.fromMap({path: paths});
    var response = await Dio()
        .post("http://bcapi.mayilyan.com/burns/degree", data: formData);
    print('\n\n');
    print('RESPONSE WITH DIO');
    print(response.data);
    print('\n\n');
    return response.data;
  }
}
