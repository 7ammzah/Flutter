import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:read_track_ask/model/bookmark.dart';
import 'package:read_track_ask/model/note.dart';

import '../../controller/bookmarks_notes_controller.dart';
import '../theme.dart';
import 'button.dart';
import 'input_field.dart';

enum UserEdit { bookmark, note }

class EditDialog extends StatefulWidget {
  const EditDialog({
    super.key,
    required this.size,
    required this.pageNumber,
    required this.text,
    required this.userEdit,
  });

  final Size size;
  final int pageNumber;
  final String? text;
  final UserEdit userEdit;

  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog>
    with SingleTickerProviderStateMixin {
  final editDialogController =
      Get.put(BookmarksNotesController(), permanent: true);

  bool isEdit = false;
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(10),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Page ${widget.pageNumber} ${isBookmark ? 'Bookmark' : 'Note'}',
            style: Themes.gettitleStyle(black),
          ),
          const Divider(
            thickness: 1,
            color: black,
          ),
          const SizedBox(height: 8),
          !isEdit
              ? Text(
                  textEditingController.text.isEmpty
                      ? isBookmark
                          ? widget.text!
                          : '"${widget.text!}"'
                      : textEditingController.text,
                  style: Themes.getsubTitleStyle(black).copyWith(fontSize: 16),
                  softWrap: true,
                )
              : DialogInputField(
                  controller: textEditingController,
                  hint: widget.text!,
                  textInputType: TextInputType.text,
                ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: widget.size.width * 0.35,
                child: DialogButton(
                  borderradius: 8,
                  backgroundColor: white,
                  borderColor: Colors.red,
                  textColor: Colors.red,
                  onTap: () {
                    isEdit
                        ? setState(() {
                            isEdit = false;
                            textEditingController.text = '';
                          })
                        : showDeleteConfirmAlert();
                  },
                  label: isEdit ? 'Cancel' : 'Delete',
                ),
              ),
              SizedBox(
                width: widget.size.width * 0.35,
                child: DialogButton(
                  borderradius: 8,
                  backgroundColor: white,
                  borderColor: isEdit ? Colors.green : grey,
                  textColor: isEdit ? Colors.green : grey,
                  onTap: () {
                    //todo: edit bookmark
                    if (isEdit) Get.back();
                    setState(() {
                      isEdit = !isEdit;
                    });
                    if (textEditingController.text.isEmpty) return;
                    setState(() {
                      isBookmark ? editBookmark() : editNote();
                    });
                  },
                  label: isEdit ? 'Save' : 'Edit',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  showDeleteConfirmAlert() {
    Get.back();
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: widget.size.width * 0.35,
                  child: DialogButton(
                    borderradius: 8,
                    backgroundColor: white,
                    borderColor: grey,
                    textColor: grey,
                    onTap: () {
                      //todo: Close
                      Get.back();
                    },
                    label: 'Cancel',
                  ),
                ),
                SizedBox(
                  width: widget.size.width * 0.35,
                  child: DialogButton(
                    borderradius: 8,
                    backgroundColor: white,
                    borderColor: Colors.red,
                    textColor: Colors.red,
                    onTap: () {
                      //todo: delete
                      isBookmark
                          ? editDialogController
                              .removeBookmark(widget.pageNumber)
                          : editDialogController.removeNote(widget.pageNumber);
                      Get.back();
                    },
                    label: 'Delete',
                  ),
                ),
              ],
            ),
          ],
          icon: const Icon(
            Icons.delete_forever,
            size: 50,
          ),
          iconColor: Colors.red,
        );
      },
    );
  }

  void editBookmark() {
    editDialogController.editBookmark(
        widget.pageNumber, textEditingController.text);
  }

  void editNote() {
    editDialogController.editNote(
        widget.pageNumber, textEditingController.text);
  }

  bool get isBookmark => widget.userEdit == UserEdit.bookmark;
}

class AddDialog extends StatefulWidget {
  const AddDialog({
    super.key,
    required this.size,
    required this.pageNumber,
    required this.userEdit,
  });

  final Size size;
  final int pageNumber;
  final UserEdit userEdit;

  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog>
    with SingleTickerProviderStateMixin {
  final addDialogController =
      Get.put(BookmarksNotesController(), permanent: true);

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetAnimationCurve: Curves.bounceOut,
      insetAnimationDuration: const Duration(seconds: 1),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Page ${widget.pageNumber} ${isBookmark ? 'Bookmark' : 'Note'}',
              style: Themes.gettitleStyle(black),
            ),
            const Divider(
              thickness: 1,
              color: black,
            ),
            InputField(
              controller: textEditingController,
              hint: isBookmark
                  ? 'bookmark ${widget.pageNumber}'
                  : 'add your thoughts',
              textInputType: TextInputType.text,
              isPassword: false,
              expands: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: widget.size.width / 3,
                  child: DialogButton(
                    borderradius: 8,
                    backgroundColor: white,
                    borderColor: Colors.red,
                    textColor: Colors.red,
                    onTap: () {
                      //todo: Close
                      Get.back(closeOverlays: true);
                    },
                    label: 'Cancel',
                  ),
                ),
                SizedBox(
                  width: widget.size.width / 3,
                  child: DialogButton(
                    borderradius: 8,
                    backgroundColor: white,
                    borderColor: Colors.green,
                    textColor: Colors.green,
                    onTap: () {
                      //todo: add
                      isBookmark ? addBookmark() : addNote();
                      Get.back(closeOverlays: true);
                    },
                    label: 'Confirm',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void addBookmark() {
    Bookmark bookmark = Bookmark(
      pageNumber: widget.pageNumber,
      title: textEditingController.text.isEmpty
          ? 'bookmark ${widget.pageNumber}'
          : textEditingController.text,
    );
    addDialogController.addBookmark(bookmark);
  }

  void addNote() {
    Note note = Note(
      pageNumber: widget.pageNumber,
      text: textEditingController.text.isEmpty
          ? 'note ${widget.pageNumber}'
          : textEditingController.text,
    );
    addDialogController.addNote(note);
  }

  bool get isBookmark => widget.userEdit == UserEdit.bookmark;
}

class FloatingAddDialog extends StatefulWidget {
  const FloatingAddDialog({
    super.key,
    required this.size,
    required this.userEdit,
  });

  final Size size;
  final UserEdit userEdit;

  @override
  State<FloatingAddDialog> createState() => _FloatingAddDialogState();
}

class _FloatingAddDialogState extends State<FloatingAddDialog>
    with SingleTickerProviderStateMixin {
  final floatingAddDialogController =
      Get.put(BookmarksNotesController(), permanent: true);

  TextEditingController pageEditingController = TextEditingController();

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(10),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Add ${isBookmark ? 'Bookmark' : 'Note'}',
            style: Themes.gettitleStyle(black),
          ),
          const Divider(
            thickness: 1,
            color: black,
          ),
          const SizedBox(height: 8),
          DialogInputField(
            controller: pageEditingController,
            hint: 'on page',
            textInputType: TextInputType.number,
          ),
          const SizedBox(height: 10),
          DialogInputField(
            controller: textEditingController,
            hint: 'add your ${isBookmark ? 'bookmark title' : 'note'}',
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: widget.size.width * 0.35,
                child: DialogButton(
                  borderradius: 8,
                  backgroundColor: white,
                  borderColor: Colors.red,
                  textColor: Colors.red,
                  onTap: () {
                    Get.back();
                  },
                  label: 'Cancel',
                ),
              ),
              SizedBox(
                width: widget.size.width * 0.35,
                child: DialogButton(
                  borderradius: 8,
                  backgroundColor: white,
                  borderColor: Colors.green,
                  textColor: Colors.green,
                  onTap: () {
                    //todo: edit bookmark
                    isBookmark
                        ? floatingAddDialogController.addBookmark(Bookmark(
                            pageNumber: int.parse(pageEditingController.text),
                            title: textEditingController.text,
                          ))
                        : floatingAddDialogController.addNote(Note(
                            pageNumber: int.parse(pageEditingController.text),
                            text: textEditingController.text,
                          ));
                    Get.back();
                  },
                  label: 'Save',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  bool get isBookmark => widget.userEdit == UserEdit.bookmark;
}
