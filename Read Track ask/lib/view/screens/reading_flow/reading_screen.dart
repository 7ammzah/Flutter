// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import '../../theme.dart';
import '../../widgets/button.dart';
import '../../widgets/custom_dialog.dart';
import 'marks_and_notes_screen.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
import 'dart:async';

class ReadingScreen extends StatefulWidget {
  final File? file;

  const ReadingScreen({
    this.file,
    super.key,
  });

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  String pathPDF = '';

  @override
  void initState() {
    fromAsset('assets/pdfs/plane.pdf', 'plane.pdf').then((f) {
      setState(() {
        pathPDF = f.path;
        print(pathPDF);
      });
    });
    super.initState();
  }

  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      color: white,

      ),
      child: TextButton(
        child: Text('open' , style: TextStyle(
          fontSize: 40
        ),),
        onPressed: () {
          Get.to(() => PDFScreen(
                path: pathPDF,
              ));
        },
      ),
    );
  }
}

goMarkAndNotesScreen() {
  Get.to(() => const MarksNotesScreen());
}

// class PDFApi {
//   static Future<File?> pickFile() async {
//     final result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf'],
//     );
//     return result == null ? null : File(result.paths.first!);
//   }
// }

class PDFScreen extends StatefulWidget {
  final String? path;

  const PDFScreen({Key? key, this.path}) : super(key: key);

  @override
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();

  int? pages = 1;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
  bool nightMode = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          p.basenameWithoutExtension(widget.path!),
          overflow: TextOverflow.fade,
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                nightMode = !nightMode;
              });
            },
            icon: nightMode
                ? const Icon(Icons.light_mode, color: white)
                : const Icon(Icons.dark_mode, color: black),
          ),
          PopupMenuButton<int>(
            offset: const Offset(-10, 30),
            //surfaceTintColor: AppColors.selectedColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            onSelected: (value) => goMarkAndNotesScreen(),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 0,
                textStyle: Themes.getsubTitleStyle(black),
                child: const Center(
                  child: Text(
                    'Bookmarks & Notes',
                  ),
                ),
              ),
            ],
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            padding: const EdgeInsets.only(right: 20),
            color: AppColors.selectedColor,
            child: Row(
              children: [
                FutureBuilder<PDFViewController>(
                  future: _controller.future,
                  builder:
                      (context, AsyncSnapshot<PDFViewController> snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: Slider(
                          inactiveColor: grey.withOpacity(0.4),
                          activeColor: Colors.amber,
                          value: currentPage!.toDouble(),
                          onChanged: (val) async {
                            setState(() {
                              currentPage = val.toInt();
                            });
                            await snapshot.data!.setPage(val.toInt());
                          },
                          divisions: pages!,
                          max: pages!.toDouble(),
                          min: 0.0,
                        ),
                      );
                    }
                    return Container();
                  },
                ),
                Text(
                  '${currentPage! + 1}/$pages',
                  style: Themes.getsubTitleStyle(black),
                )
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GestureDetector(
            onLongPressStart: (details) {
              final offset = details.globalPosition;
              showPopupMenu(context, offset, size);
            },
            child: PDFView(
              nightMode: nightMode,
              filePath: widget.path,
              enableSwipe: true,
              swipeHorizontal: true,
              autoSpacing: false,
              defaultPage: currentPage!,
              fitPolicy: FitPolicy.BOTH,
              preventLinkNavigation:
                  true, // if set to true the link is handled in flutter
              onRender: (_pages) {
                setState(() {
                  pages = _pages;
                  isReady = true;
                });
              },
              onError: (error) {
                setState(() {
                  errorMessage = error.toString();
                });
                print(error.toString());
              },
              onPageError: (page, error) {
                setState(() {
                  errorMessage = '$page: ${error.toString()}';
                });
                print('$page: ${error.toString()}');
              },
              onViewCreated: (PDFViewController pdfViewController) {
                _controller.complete(pdfViewController);
              },
              onLinkHandler: (String? uri) {
                print('goto uri: $uri');
              },
              onPageChanged: (int? page, int? total) {
                print('page change: $page/$total');
                setState(() {
                  currentPage = page;
                });
              },
            ),
          ),
          errorMessage.isEmpty
              ? !isReady
                  ? const CircularProgressIndicator()
                  : Container()
              : Text(errorMessage),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: FutureBuilder<PDFViewController>(
          future: _controller.future,
          builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
            if (snapshot.hasData) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton.extended(
                    heroTag: 1,
                    backgroundColor: AppColors.selectedColor,
                    label: Row(
                      children: const [
                        Icon(
                          Icons.arrow_back_outlined,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text('previous'),
                      ],
                    ),
                    onPressed: () async {
                      await snapshot.data!.setPage(currentPage! - 1);
                    },
                  ),
                  FloatingActionButton.extended(
                    heroTag: 2,
                    backgroundColor: AppColors.selectedColor,
                    label: Row(
                      children: const [
                        Text('next'),
                        SizedBox(width: 10),
                        Icon(
                          Icons.arrow_forward_outlined,
                          size: 20,
                        ),
                      ],
                    ),
                    onPressed: () async {
                      await snapshot.data!.setPage(currentPage! + 1);
                    },
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Future<dynamic> showPopupMenu(
      BuildContext context, Offset offset, Size size) {
    return showMenu(
      color: white,
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy,
        MediaQuery.of(context).size.width - offset.dx,
        MediaQuery.of(context).size.height - offset.dy,
      ),
      items: [
        PopupMenuItem(
          onTap: () {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AddDialog(
                      size: size,
                      pageNumber: currentPage! + 1,
                      userEdit: UserEdit.bookmark,
                    );
                  });
            });
          },
          child: const ListTile(
            leading: Icon(Icons.bookmark_add_outlined),
            title: Text('add bookmark'),
          ),
        ),
        PopupMenuItem(
          onTap: () {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AddDialog(
                      size: size,
                      pageNumber: currentPage! + 1,
                      userEdit: UserEdit.note,
                    );
                  });
            });
          },
          child: const ListTile(
            leading: Icon(Icons.notes_sharp),
            title: Text('add note'),
          ),
        ),
      ],
    );
  }
}
