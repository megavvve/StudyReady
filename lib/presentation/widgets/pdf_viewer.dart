import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFViewer extends StatefulWidget {
  final String pdfURL;

  const PDFViewer({Key? key, required this.pdfURL}) : super(key: key);

  @override
  State<PDFViewer> createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  late String? filePath;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPDF();
  }

  Future<void> _loadPDF() async {
    try {
      setState(() {
        isLoading = true;
      });
      final response = await http.get(Uri.parse(widget.pdfURL));
      final bytes = response.bodyBytes;
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/pdf_file.pdf');
      await file.writeAsBytes(bytes);
      setState(() {
        filePath = file.path;
        isLoading = false;
      });
    } catch (e) {
      print('Error loading PDF: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PDF Viewer')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : filePath != null
              ? PDFView(
                  filePath: filePath!,
                )
              : const Center(child: Text('Failed to load PDF')),
    );
  }
}
