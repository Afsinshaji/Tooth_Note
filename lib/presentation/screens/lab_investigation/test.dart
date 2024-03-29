// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:mime_type/mime_type.dart'; // Assuming single package named 'mime_type'
// import 'package:url_launcher/url_launcher.dart';

// class FileDisplayScreen extends StatefulWidget {
//   final String downloadUrl;

//   const FileDisplayScreen({Key? key, required this.downloadUrl}) : super(key: key);

//   @override
//   State<FileDisplayScreen> createState() => _FileDisplayScreenState();
// }

// class _FileDisplayScreenState extends State<FileDisplayScreen> {
//   Future<List<int>?>? _downloadTask;

//   @override
//   void initState() {
//     super.initState();
//     _downloadTask = _downloadFile();
//   }

//   Future<List<int>?> _downloadFile() async {
//     try {
//       final storage = FirebaseStorage.instance;
//       final ref = storage.refFromURL(widget.downloadUrl);
//       final bytes = await ref.getData();
//       return bytes;
//     } on FirebaseException catch (e) {
//       // Handle download error
//       print(e.message);
//       return null;
//     }
//   }

//   Future<void> _displayFile(List<int> bytes) async {
//     final tempDir = await getTemporaryDirectory();
//     final extension = getExtension(widget.downloadUrl);
//     final tempFile = File('${tempDir.path}/downloaded_file.$extension');
//     await tempFile.writeAsBytes(bytes);

//     final mimeType = mimeTypeLookup(tempFile.path); // Assuming 'mimeTypeLookup' function

//     if (mimeType != null) {
//       await launch(tempFile.path, forceSafariApp: false, forceWebView: false);
//     } else {
//       // Handle unknown file type
//       print('Unknown file type');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('File Display'),
//       ),
//       body: Center(
//         child: FutureBuilder<List<int>?>(
//           future: _downloadTask,
//           builder: (context, snapshot) {
//             if (snapshot.hasError) {
//               return Text('Error downloading file: ${snapshot.error}');
//             }

//             if (snapshot.hasData) {
//               final bytes = snapshot.data!;
//               return ElevatedButton(
//                 onPressed: () => _displayFile(bytes),
//                 child: Text('Open File'),
//               );
//             }

//             return const CircularProgressIndicator();
//           },
//         ),
//       ),
//     );
//   }
// }
