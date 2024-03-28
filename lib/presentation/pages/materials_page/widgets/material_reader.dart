import 'package:flutter/material.dart';
import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/file_content.dart';

class MaterialReader extends StatefulWidget {
  final StudyMaterial material;

  const MaterialReader({Key? key, required this.material}) : super(key: key);

  @override
  State<MaterialReader> createState() => _MaterialReaderState();
}

class _MaterialReaderState extends State<MaterialReader> {
  @override
  Widget build(BuildContext context) {
    final material = widget.material;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Документ"),
        centerTitle: true,
        //backgroundColor: secondColor,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: FileContent(material: material),
      // floatingActionButton: FutureBuilder<PDFViewController>(
      //   future: _controller.future,
      //   builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
      //     if (snapshot.hasData) {
      //       return FloatingActionButton.extended(
      //         label: Text("Go to ${pages! ~/ 2}"),
      //         onPressed: () async {
      //           await snapshot.data!.setPage(pages! ~/ 2);
      //         },
      //       );
      //     }

      //     return Container();
      //   },
      // ),
    );
  }
}
