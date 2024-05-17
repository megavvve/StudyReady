import 'package:flutter/material.dart';
import 'package:study_ready/domain/entities/study_material.dart';

class DeleteMode extends ChangeNotifier {
  bool _isDeleting = false;
  final List<StudyMaterial> _studyMaterials = [];

  bool get isDeleting => _isDeleting;

  List<StudyMaterial> get studyMaterials => _studyMaterials;

  void addMaterial(StudyMaterial studyMaterial) {
    _studyMaterials.add(studyMaterial);
    notifyListeners();
  }

  void toggleDeleteMode() {
    _isDeleting = !_isDeleting;
    notifyListeners();
  }

  set isDeleting(bool value) {
    _isDeleting = value;
    notifyListeners();
  }
}
