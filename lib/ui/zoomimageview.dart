import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:share/share.dart';

class ZoomableImage extends StatelessWidget {
  final String imageUrl;

  ZoomableImage({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('View Image')),
      body: PhotoView(
        imageProvider: NetworkImage(imageUrl),
        backgroundDecoration: BoxDecoration(color: Colors.black),
        minScale: PhotoViewComputedScale.contained,
        maxScale: PhotoViewComputedScale.covered * 2.5,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Share.share(imageUrl);
        },
        child: Icon(Icons.share),
      ),
    );
  }
}
