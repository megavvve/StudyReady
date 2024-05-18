import 'package:flutter/material.dart';
import 'package:study_ready/domain/entities/trainer.dart';

class DeleteModeForTrainers extends ChangeNotifier {
  bool _isDeleting = false;
  bool _deleteMaterials = false;
  List<Trainer> _trainerForDelete = [];

  bool get isDeleting => _isDeleting;
  bool get deleteMaterials => _deleteMaterials;
  List<Trainer> get trainersForDelete => _trainerForDelete;
  set isDeleting(bool value) {
    _isDeleting = value;
    notifyListeners();
  }

  set trainersForDelete(List<Trainer> trainer) {
    _trainerForDelete = trainer;
    notifyListeners();
  }

  set deleteMaterials(bool value) {
    _deleteMaterials = value;
    notifyListeners();
  }
}
