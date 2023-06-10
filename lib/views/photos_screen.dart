import 'package:flutter/material.dart';
import 'package:user_apps/controller/album_controller.dart';
import 'package:user_apps/model/album.dart';
import 'package:user_apps/model/photo.dart';

class PhotosScreen extends StatelessWidget {
  final Album album;
  const PhotosScreen({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photos Galery"),
      ),
      body: FutureBuilder(
          future: AlbumController().getPhotos(album.id!),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: snapshot.data!.length,
                ),
                itemBuilder: (_, index) {
                  Photo photo = snapshot.data![index];
                  return Card(
                    child: Column(
                      children: [Image.network(photo.thumbnailUrl!)],
                    ),
                  );
                });
          }),
    );
  }
}
