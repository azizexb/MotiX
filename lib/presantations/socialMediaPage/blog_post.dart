import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:motix_app/data/entity/post.dart';
import 'package:motix_app/util/consts/motix_color_consts.dart';

class BlogPostCard extends StatelessWidget {
  final Post post;

  const BlogPostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    DateTime postDate = post.postDate.toDate();
    String formattedDate = '${postDate.day}/${postDate.month}/${postDate.year}';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogPostDetailPage(post: post),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 3,
          shadowColor: MotixColor.mainColorGrey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  child: ClipOval(
                    child: SvgPicture.asset(
                      "assets/animalIcon/${post.postOwnerProfileIcon}.svg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(
                  post.postOwnerName,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: MotixColor.mainColorWhite),
                ),
                subtitle: Text(
                  formattedDate,
                  style: const TextStyle(color: MotixColor.mainColorWhite),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  post.postTitle,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: MotixColor.mainColorWhite),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  post.postDescription.length > 100
                      ? '${post.postDescription.substring(0, 100)}...'
                      : post.postDescription,
                  style: const TextStyle(color: MotixColor.mainColorWhite),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 6.0,
                  children: post.postCategories
                      .map((category) => Chip(
                            label: Text(category),
                            backgroundColor: MotixColor.mainColorDarkGrey,
                            labelStyle: const TextStyle(
                                color: MotixColor.mainColorWhite),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} // end class BlogPostCard

class BlogPostDetailPage extends StatelessWidget {
  final Post post;

  const BlogPostDetailPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.postTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.postTitle,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: MotixColor.mainColorWhite),
            ),
            const SizedBox(height: 10),
            Text(
              post.postDescription,
              style: const TextStyle(
                  fontSize: 16, color: MotixColor.mainColorWhite),
            ),
          ],
        ),
      ),
    );
  }
} // class BlogPostDetailPage
