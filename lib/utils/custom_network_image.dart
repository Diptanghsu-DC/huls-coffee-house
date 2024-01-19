import 'package:cached_network_image/cached_network_image.dart';
import 'package:huls_coffee_house/utils/local_database/local_database.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter/cupertino.dart';

class CustomNetworkImage extends StatefulWidget {
  final String url;
  final double? height;
  final Widget Function(BuildContext, String, Object)? errorWidget;
  const CustomNetworkImage({super.key, required this.url, this.errorWidget, this.height});

  @override
  State<CustomNetworkImage> createState() => _CustomNetworkImageState();
}

class _CustomNetworkImageState extends State<CustomNetworkImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.url,
      height: widget.height,
      cacheManager: CacheManager(
        Config(
          widget.url,
          stalePeriod: LocalDatabase.stalePeriod,

        ),
      ),
      errorWidget: widget.errorWidget,
    );
  }
}
