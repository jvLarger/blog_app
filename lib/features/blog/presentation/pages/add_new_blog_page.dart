import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/features/blog/presentation/widgets/blog_editor.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddNewBlogPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const AddNewBlogPage());
  const AddNewBlogPage({super.key});

  @override
  State<AddNewBlogPage> createState() => _AddNewBlogPageState();
}

class _AddNewBlogPageState extends State<AddNewBlogPage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  List<String> selectedTopics = [];

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.done_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  color: AppPallete.borderColor,
                  radius: Radius.circular(15),
                  strokeCap: StrokeCap.round,
                  dashPattern: [
                    15,
                    4,
                  ],
                ),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.folder_open,
                        size: 40,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Select your image",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    'Technology',
                    'Business',
                    'Programming',
                    'Entertainment',
                  ]
                      .map(
                        (topic) => Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: GestureDetector(
                            onTap: () {
                              if (selectedTopics.contains(topic)) {
                                selectedTopics.remove(topic);
                              } else {
                                selectedTopics.add(topic);
                              }
                              setState(() {});
                            },
                            child: Chip(
                              label: Text(
                                topic,
                              ),
                              color: selectedTopics.contains(topic)
                                  ? WidgetStatePropertyAll(
                                      AppPallete.gradient1,
                                    )
                                  : null,
                              side: selectedTopics.contains(topic)
                                  ? null
                                  : BorderSide(
                                      color: AppPallete.borderColor,
                                    ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              BlogEditor(
                controller: titleController,
                hintText: "Blog Title",
              ),
              SizedBox(
                height: 10,
              ),
              BlogEditor(
                controller: contentController,
                hintText: "Blog Content",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
