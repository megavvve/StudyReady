import 'package:flutter/material.dart';
import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/different_types_of_reader_files/pdf_reader.dart';

class MaterialReaderPick extends StatelessWidget {
  final StudyMaterial material;

  const MaterialReaderPick({Key? key, required this.material})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (material.fileType) {
      case 'pdf':
        return PDFReader(
          studyMaterial: material,
        );
      case 'image/jpeg':
      case 'image/png':
      //   return ImageReader(
      //     studyMaterial: material,
      //   );
      // case 'video/mp4':
      //   return VideoPlayer(
      //     studyMaterial: material,
      //   );
      default:
        return SizedBox(); // Возвращаем пустой контейнер для остальных типов файлов
    }
  }
}
