import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

// Cf
import 'package:cinephile_flutter/resources/strings.dart';
import 'package:cinephile_flutter/resources/colors.dart';
import 'package:cinephile_flutter/widgets/spinner.dart';

class MovieGalleryScreen extends StatefulWidget {
  // Route
  static const String route = '/movie-gallery';

  final Map arguments;

  MovieGalleryScreen({
    this.arguments = const {'images': null},
  });

  @override
  _MovieGalleryScreenState createState() => _MovieGalleryScreenState();
}

class _MovieGalleryScreenState extends State<MovieGalleryScreen> {
  List<dynamic> argumentImages;

  @override
  void initState() {
    super.initState();

    this.argumentImages = widget.arguments['images'];
  }

  Widget _renderContent() {
    return Container(
      color: CfColors.BLACK,
      child: PhotoViewGallery.builder(
        itemCount: this.argumentImages.length,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(
              this.argumentImages[index],
            ),
            minScale: PhotoViewComputedScale.contained * 0.8,
            maxScale: PhotoViewComputedScale.covered * 2,
          );
        },
        scrollPhysics: BouncingScrollPhysics(),
        backgroundDecoration: BoxDecoration(
          color: CfColors.BLACK,
        ),
        loadingBuilder: (context, event) => Center(
          child: SizedBox(
            height: 40,
            width: 40,
            child: CfSpinnerWidget(
              color: CfColors.WHITE,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CfStrings.GALLERY),
      ),
      body: _renderContent(),
    );
  }
}
