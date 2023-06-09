import 'package:flutter/material.dart';
import 'package:user_apps/controller/post_controll.dart';
import 'package:user_apps/model/user.dart';

class PostScreen extends StatefulWidget {
  final User user;
  const PostScreen(this.user, {super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _titleCtrl;
  late TextEditingController _descriptionCtrl;

  @override
  void initState() {
    _titleCtrl = TextEditingController();
    _descriptionCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descriptionCtrl.dispose();
    super.dispose();
  }

  clearTextEditing() {
    _titleCtrl.clear();
    _descriptionCtrl.clear();
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Add your Story ",
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _titleCtrl,
                  decoration: const InputDecoration(
                    hintText: "Title",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please add title";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _descriptionCtrl,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    labelText: "Description",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please add description";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    )),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        PostController().sendNewPost(
                          widget.user.id!,
                          title: _titleCtrl.text,
                          description: _descriptionCtrl.text,
                        );
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating,
                          content: Text("Successfully send new post"),
                        ));
                        clearTextEditing();
                        FocusScope.of(context).unfocus();
                      }
                    },
                    child: const Text("Posting"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
