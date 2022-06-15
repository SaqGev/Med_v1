import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../services/dio_upload_serice.dart';
import '../services/http_upload_service.dart';

class CameraWidget extends StatefulWidget {
  @override
  State createState() {
    // TODO: implement createState
    return CameraWidgetState();
  }
}

class CameraWidgetState extends State {
  final HttpUploadService _httpUploadService = HttpUploadService();
  final DioUploadService _dioUploadService = DioUploadService();
  List<String> _images = [];
  PickedFile? imageFile;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Pick Image Camera"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
                child: (imageFile == null)
                    ? Text("Choose Image")
                    : Image.file(File(imageFile!.path)),
              ),
              MaterialButton(
                textColor: Colors.white,
                color: Colors.deepPurple,
                onPressed: () {},
                child: Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          // color: Colors.indigo,
                          gradient: LinearGradient(
                              colors: [Colors.indigo, Colors.indigo.shade800]),
                          borderRadius: BorderRadius.all(Radius.circular(3.0))),
                      child: RawMaterialButton(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        onPressed: () async {
                          // show loader
                          presentLoader(context, text: 'Wait...');

                          // calling with dio
                          var responseDataDio =
                              await _dioUploadService.uploadPhotos(_images);

                          // calling with http
                          var responseDataHttp =
                              await _httpUploadService.uploadPhotos(_images);

                          // hide loader
                          Navigator.of(context).pop();

                          // showing alert dialogs
                          await presentAlert(context,
                              title: 'Success Dio',
                              message: responseDataDio.toString());
                          await presentAlert(context,
                              title: 'Success HTTP', message: responseDataHttp);
                        },
                        child: const Center(
                            child: Text(
                          'SEND',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold),
                        )),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      imageFile = pickedFile!;
    });

    Navigator.pop(context);
  }
}

Future<void> presentAlert(BuildContext context,
    {String title = '', String message = '', Function()? ok}) {
  return showDialog(
      context: context,
      builder: (c) {
        return AlertDialog(
          title: Text('$title'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: Text('$message'),
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'OK',
                // style: greenText,
              ),
              onPressed: ok != null ? ok : Navigator.of(context).pop,
            ),
          ],
        );
      });
}

void presentLoader(BuildContext context,
    {String text = 'Aguarde...',
    bool barrierDismissible = false,
    bool willPop = true}) {
  showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (c) {
        return WillPopScope(
          onWillPop: () async {
            return willPop;
          },
          child: AlertDialog(
            content: Container(
              child: Row(
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    text,
                    style: TextStyle(fontSize: 18.0),
                  )
                ],
              ),
            ),
          ),
        );
      });
}
