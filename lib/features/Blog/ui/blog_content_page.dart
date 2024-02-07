import 'package:flutter/material.dart';

class BlogContentPage extends StatelessWidget {
  final String postTitle;
  final String postContent;
  final String imageUrl;

  const BlogContentPage(
      {super.key, required this.postTitle,
      required this.postContent,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(postTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(image: NetworkImage(imageUrl)),
              const SizedBox(
                height: 20,
              ),
              Text(
                postContent,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
