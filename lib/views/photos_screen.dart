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
                itemCount: snapshot.data!.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (_, index) {
                  Photo photo = snapshot.data![index];
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: double.infinity,
                            child: Image.network(
                              photo.url!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, object, stack) {
                                return const Text("Photo not Found");
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(photo.title!),
                        ),
                      ],
                    ),
                  );
                });
          }),
    );
  }
}
