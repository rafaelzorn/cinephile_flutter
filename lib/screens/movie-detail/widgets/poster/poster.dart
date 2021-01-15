import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

// Cf
import 'package:cinephile_flutter/utils/image.dart';
import 'package:cinephile_flutter/utils/rating.dart';
import 'package:cinephile_flutter/resources/images.dart';
import 'package:cinephile_flutter/resources/colors.dart';
import 'package:cinephile_flutter/services/navigation.dart';
import 'package:cinephile_flutter/screens/movie-trailer/movie-trailer.dart';
import 'package:cinephile_flutter/screens/movie-gallery/movie-gallery.dart';
import 'package:cinephile_flutter/arguments/movie-trailer.dart';
import 'package:cinephile_flutter/arguments/movie-gallery.dart';
import 'package:cinephile_flutter/widgets/touchable-opacity.dart';

class PosterWidget extends StatelessWidget {
  final String backdropBath;
  final String title;
  final double voteAverage;
  final List<dynamic> images;
  final dynamic video;

  PosterWidget({
    @required this.backdropBath,
    @required this.title,
    @required this.voteAverage,
    @required this.images,
    @required this.video,
  });

  Widget _renderRating({BuildContext context}) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Row(
        children: List.generate(
            RatingUtils.getAvarageRating(score: this.voteAverage), (index) {
          return Container(
            margin: EdgeInsets.only(right: 5),
            child: Icon(
              Icons.star,
              size: (MediaQuery.of(context).size.width * 0.07),
              color: CfColors.WHITE,
            ),
          );
        }),
      ),
    );
  }

  Widget _renderInfoMovie({BuildContext context}) {
    return CfTouchableOpacityWidget(
      activeOpacity: 0.5,
      onTap: () {
        if (this.images.length == 0) {
          return false;
        }

        NavigationService().navigateTo(MovieGalleryScreen.route,
            arguments: MovieGalleryArguments(images: this.images));
      },
      child: Container(
        height: (MediaQuery.of(context).size.width * 0.60),
        width: MediaQuery.of(context).size.width,
        color: CfColors.BLACK.withOpacity(0.5),
        child: Stack(
          children: <Widget>[
            Positioned(
              width: MediaQuery.of(context).size.width - 20,
              left: 15,
              bottom: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: CfColors.WHITE,
                    ),
                  ),
                  _renderRating(context: context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderButtonPlay({BuildContext context}) {
    if (this.video == null || this.video['site'] != 'YouTube') {
      return Container();
    }

    return Positioned(
      bottom: 0,
      right: 15,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.16,
        height: MediaQuery.of(context).size.width * 0.16,
        child: FloatingActionButton(
          onPressed: () {
            NavigationService().navigateTo(MovieTrailerScreen.route,
                arguments:
                    MovieTrailerArguments(youtubeKey: this.video['key']));
          },
          child: Icon(
            Icons.play_arrow,
            size: MediaQuery.of(context).size.width * 0.13,
          ),
          backgroundColor: CfColors.PINK,
        ),
      ),
    );
  }

  Widget _renderImage({BuildContext context}) {
    return Container(
      height: (MediaQuery.of(context).size.width * 0.60),
      width: MediaQuery.of(context).size.width,
      child: this.backdropBath != null
          ? FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: ImageUtils.getImageApi(path: this.backdropBath),
              fit: BoxFit.cover,
            )
          : Image.asset(
              CfImages.notFound,
              fit: BoxFit.cover,
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.width * 0.66),
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          _renderImage(context: context),
          _renderInfoMovie(context: context),
          _renderButtonPlay(context: context),
        ],
      ),
    );
  }
}
