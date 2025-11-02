import 'package:blog_app/core/utils/calculate_reading_time.dart';
import 'package:blog_app/features/blog/domain/entities/blog.dart';
import 'package:blog_app/features/blog/presentation/pages/blog_viewer_page.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  final Blog blog;
  final Color color;
  const BlogCard({
    super.key,
    required this.blog,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          BlogViewerPage.route(blog),
        );
      },
      child: Container(
        height: 200,
        margin: EdgeInsets.all(16).copyWith(bottom: 4),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: blog.topics
                    .map(
                      (topic) => Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Chip(
                          label: Text(
                            topic,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Text(
              blog.title,
              maxLines: 2,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text(
              "${calculateReadingTime(blog.content)} min",
            )
          ],
        ),
      ),
    );
  }
}
