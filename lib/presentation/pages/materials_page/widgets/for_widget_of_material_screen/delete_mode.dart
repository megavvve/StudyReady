// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:study_ready/domain/entities/study_material.dart';

class DeleteMode extends ChangeNotifier {
  bool _isDeleting = false;
  bool _deleteMaterials = false;
  bool _boolForClearAllIsPick = false;
  List<StudyMaterial> _listOfStudyMaterials = [];
  final List<StudyMaterial> _listOfStudyMaterialsForDeleting = [];

  bool get isDeleting => _isDeleting;
  bool get boolForClearAllIsPick => _boolForClearAllIsPick;
  bool get deleteMaterials => _deleteMaterials;

  List<StudyMaterial> get listOfStudyMaterials => _listOfStudyMaterials;
  List<StudyMaterial> get listOfStudyMaterialsForDeleting =>
      _listOfStudyMaterialsForDeleting;

  void addMaterialForDeleting(StudyMaterial studyMaterial) {
    _listOfStudyMaterialsForDeleting.add(studyMaterial);
    notifyListeners();
  }

  void addMaterial(StudyMaterial studyMaterial) {
    _listOfStudyMaterials.add(studyMaterial);
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

  set deleteMaterials(bool value) {
    _deleteMaterials = value;
    notifyListeners();
  }

  set boolForClearAllIsPick(bool value) {
    _boolForClearAllIsPick = value;
    notifyListeners();
  }

  set listOfStudyMaterials(List<StudyMaterial> list) {
    _listOfStudyMaterials = list;
    notifyListeners();
  }
}
