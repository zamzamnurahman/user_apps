import 'package:flutter/material.dart';
import 'package:user_apps/controller/album_controller.dart';
import 'package:user_apps/model/album.dart';
import 'package:user_apps/model/user.dart';
import 'package:user_apps/views/photos_screen.dart';

class AlbumScreen extends StatelessWidget {
  final User user;
  const AlbumScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Album User"),
      ),
      body: FutureBuilder(
          future: AlbumController().getAlbum(user.id!),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.separated(
              itemBuilder: (_, index) {
                return const SizedBox(height: 5);
              },
              separatorBuilder: (_, index) {
                Album album = snapshot.data![index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return PhotosScreen(album: album);
                    }));
                  },
                  child: Card(
                    child: ListTile(
                      leading: const Icon(Icons.image),
                      title: Text(album.title!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      subtitle: const Text("Detail ->"),
                    ),
                  ),
                );
              },
              itemCount: snapshot.data!.length,
            );
          }),
    );
  }
}
