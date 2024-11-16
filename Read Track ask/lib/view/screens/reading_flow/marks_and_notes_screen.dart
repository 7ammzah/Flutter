import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:read_track_ask/controller/bookmarks_notes_controller.dart';
import 'package:read_track_ask/view/widgets/custom_dialog.dart';
import 'bookmarks_screen.dart';
import 'notes_screen.dart';
import '../../theme.dart';

class MarksNotesScreen extends StatefulWidget {
  const MarksNotesScreen({super.key});

  @override
  State<MarksNotesScreen> createState() => _MarksNotesScreenState();
}

class _MarksNotesScreenState extends State<MarksNotesScreen>
    with SingleTickerProviderStateMixin {
  final marksNotesScreenController =
      Get.put(BookmarksNotesController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final List<Tab> tabs = <Tab>[
      Tab(
        key: const Key('bookmarks'),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.bookmark_border_outlined),
            SizedBox(width: 10),
            Text('Bookmarks'),
          ],
        ),
      ),
      Tab(
        key: const Key('notes'),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.notes_outlined),
            SizedBox(width: 10),
            Text('Notes'),
          ],
        ),
      )
    ];
    return DefaultTabController(
      length: 2,
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Container(
                color: AppColors.selectedColor,
                child: TabBar(
                  labelColor: black,
                  indicatorColor: black,
                  tabs: tabs,
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: tabs.map((Tab tab) {
              int label = tab.key.toString().length;
              // [<'bookmarks'>].length = 15
              return label == 15
                  ? BookmarksScreen(
                      bookmarks: marksNotesScreenController.getAllBookmarks(),
                    )
                  : NotesScreen(
                      notes: marksNotesScreenController.getAllNotes(),
                    );
            }).toList(),
          ),
          floatingActionButton: FloatingActionButton(
            splashColor: AppColors.selectedColor,
            backgroundColor: Colors.orangeAccent,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return FloatingAddDialog(
                      size: size,
                      userEdit: DefaultTabController.of(context)?.index == 0
                          ? UserEdit.bookmark
                          : UserEdit.note,
                    );
                  });
            },
            child: const Icon(Icons.add),
          ),
        );
      }),
    );
  }
}
