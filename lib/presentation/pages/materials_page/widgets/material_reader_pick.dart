import 'package:flutter/material.dart';
import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/different_types_of_reader_files/pdf_reader.dart';

class MaterialReaderPick extends StatelessWidget {
  final StudyMaterial material;

  const MaterialReaderPick({Key? key, required this.material})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (material.fileType == 'application/pdf') {
      return PDFReader(
        studyMaterial: material,
      );
    } else {
      return SizedBox();
    }
  }
}
