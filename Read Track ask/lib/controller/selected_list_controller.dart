import 'package:get/get.dart';

class SelectedListController extends GetxController {
  final List<String> selectedTags = List<String>.empty(growable: true).obs;
  final List<String> selectedAuthorsImages =
      List<String>.empty(growable: true).obs;
  final List<String> selectedAuthorsNames =
      List<String>.empty(growable: true).obs;

  void setSelectedtags(String tag) {
    selectedTags.contains(tag)
        ? selectedTags.remove(tag)
        : selectedTags.add(tag);
  }

  void setSelctedAuthors(String image, String name) {
    if (selectedAuthorsImages.contains(image) &&
        selectedAuthorsNames.contains(name)) {
      selectedAuthorsImages.remove(image);
      selectedAuthorsNames.remove(name);
    } else {
      selectedAuthorsImages.add(image);
      selectedAuthorsNames.add(name);
    }
  }

  bool isContainTag(String tag) {
    return selectedTags.contains(tag);
  }

  bool isContainAuthor(String image, String name) {
    return selectedAuthorsImages.contains(image) &&
        selectedAuthorsNames.contains(name);
  }

  getSelectedTags() => selectedTags;
  getSelectedAuthorsImages() => selectedAuthorsImages;
  getSelectedAuthorsNames() => selectedAuthorsNames;

  // final _selectedList = List<String>.empty(growable: true).obs;

  //setSelectedList(List<String> list) => _selectedList.value = list ;
}
