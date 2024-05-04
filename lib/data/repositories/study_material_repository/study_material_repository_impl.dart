import 'package:study_ready/data/repositories/study_material_repository/firebase_study_material_repository.dart';
import 'package:study_ready/data/repositories/study_material_repository/local_study_material_repository.dart';
import 'package:study_ready/domain/repositories/study_material_repository.dart';
import 'package:study_ready/domain/entities/study_material.dart';

class StudyMaterialRepositoryImpl implements StudyMaterialRepository {
  final LocalStudyMaterialRepository localRepository;
  final FirebaseStudyMaterialRepository remoteRepository;

  StudyMaterialRepositoryImpl({
    required this.localRepository,
    required this.remoteRepository,
  });

  @override
  Future<List<StudyMaterial>> getMaterials() async {
    try {
      List<StudyMaterial> localMaterials = await localRepository.getMaterials();

      if (localMaterials.isEmpty) {
        List<StudyMaterial> remoteMaterials =
            await remoteRepository.getMaterials();
        await _updateLocalRepository(remoteMaterials);
        return remoteMaterials;
      }

      // List<StudyMaterial> updatedMaterials =
      //     _getUpdatedMaterials(localMaterials, remoteMaterials);
      // if (updatedMaterials.isNotEmpty) {
      //   await _updateLocalRepository(updatedMaterials);
      //   return remoteMaterials;
      // }

      return localMaterials;
    } catch (e) {
      print('Error fetching materials: $e');
      throw e; // Propagate the error up to the caller
    }
  }

  Future<void> _updateLocalRepository(List<StudyMaterial> materials) async {
    for (StudyMaterial material in materials) {
      await localRepository.addMaterial(material);
    }
  }

  List<StudyMaterial> _getUpdatedMaterials(
      List<StudyMaterial> localMaterials, List<StudyMaterial> remoteMaterials) {
    List<StudyMaterial> updatedMaterials = [];

    for (StudyMaterial remoteMaterial in remoteMaterials) {
      bool materialExistsLocally = localMaterials
          .any((localMaterial) => localMaterial.id == remoteMaterial.id);

      if (!materialExistsLocally) {
        updatedMaterials.add(remoteMaterial);
      }
    }

    return updatedMaterials;
  }

  @override
  Future<void> addMaterial(StudyMaterial material) async {
    localRepository.addMaterial(material);
    remoteRepository.addMaterial(material);
  }

  @override
  Future<StudyMaterial?> getMaterialById(String id) async {
    return localRepository.getMaterialById(id);
  }
}
