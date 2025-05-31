import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/scaffold_mixin.dart';

class LoadImgPage extends StatefulWidget {
  static String route = 'LoadImgPage';

  const LoadImgPage({super.key});

  @override
  State<LoadImgPage> createState() => _LoadImgPageState();
}

class _LoadImgPageState extends State<LoadImgPage> {
  List<String> images = [
    'https://images.pexels.com/photos/32213422/pexels-photo-32213422.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/32186716/pexels-photo-32186716.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/26201662/pexels-photo-26201662.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/32207839/pexels-photo-32207839.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://cdn.pixabay.com/photo/2021/10/30/17/54/desert-6755127_1280.jpg',
    'https://images.pexels.com/photos/32209604/pexels-photo-32209604.jpeg?auto=compress&cs=tinysrgb&w=1200',
    'https://images.pexels.com/photos/17664238/pexels-photo-17664238.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/17664142/pexels-photo-17664142.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
  ];

  @override
  Widget build(BuildContext context) {
    return buildScaffold(
      "加载图片",
      SingleChildScrollView(
        child: Column(
          children: [
            ...images
                .map<Widget>((toElement) => Column(
                      children: [
                        ImageNetworkWidget(toElement),
                        Divider(height: 1)
                      ],
                    ))
                .toList(),
            ...images
                .map<Widget>((toElement) => Column(
                      children: [
                        CachedNetworkImageWidget(toElement),
                        Divider(height: 1)
                      ],
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }
}

class CachedNetworkImageWidget extends StatelessWidget {
  final String url;
  const CachedNetworkImageWidget(this.url, {super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
      fadeInDuration: Duration(milliseconds: 300),
      fit: BoxFit.cover,
    );
  }
}

class ImageNetworkWidget extends StatelessWidget {
  final String url;
  const ImageNetworkWidget(this.url, {super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    (loadingProgress.expectedTotalBytes ?? 1)
                : null,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
    );
  }
}
