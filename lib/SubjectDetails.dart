// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:books/Constatnt.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class SubjectDetails extends StatefulWidget {

  @override
  State<SubjectDetails> createState() => _SubjectDetailsState();
}

class _SubjectDetailsState extends State<SubjectDetails> with SingleTickerProviderStateMixin{

  late AnimationController animationController;
  late Animation degOneTranslationAnimation,degTwoTranslationAnimation,degThreeTranslationAnimation;
  late Animation rotationAnimation;


  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 250));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween<double >(begin: 0.0,end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 1.2,end: 1.0), weight: 25.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween<double >(begin: 0.0,end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 1.4,end: 1.0), weight: 45.0),
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween<double >(begin: 0.0,end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 1.75,end: 1.0), weight: 65.0),
    ]).animate(animationController);
    rotationAnimation = Tween<double>(begin: 180.0,end: 0.0).animate(CurvedAnimation(parent: animationController
        , curve: Curves.easeOut));
    super.initState();
    animationController.addListener((){
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff05445E),
        title: Text(
          "Subject name",
          style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffd4f1f4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/test.jpg",
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Subject name",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ConditionalBuilder(
                  condition: true,
                  builder: (context) => InkWell(
                    onTap: () {},
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffd4f1f4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Quize name",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "about",
                                        softWrap: true,
                                        overflow:
                                        TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    ConditionalBuilder(
                                      condition: true,
                                      builder: (context) => MaterialButton(
                                        color: Color(0xff05445E),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18.0)),
                                        onPressed: () {
                                          // Navigator.pushReplacement(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) => ExamScreen(
                                          //       data[index]['question'],
                                          //       data[index]['name'],
                                          //       data[index]['id'],
                                          //       token,
                                          //       data[index]['subject_id'],
                                          //       data[index]['image'],
                                          //       data[index]['title'],
                                          //       data[index]['body'],
                                          //       data[index]['urlBook'],
                                          //       data[index]['assignment_status'],
                                          //       data[index]['active_assignment'],
                                          //     ),
                                          //   ),
                                          // );
                                        },
                                        child: Text('Take Quiz',style: TextStyle(color: Colors.white),),
                                      ),
                                      fallback: (context) => MaterialButton(
                                        onPressed: () {},
                                        child: Text("result"),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) => myDivider(),
                      itemCount: 3,
                    ),
                  ),
                  fallback: (context) => Center(
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 10,
                        ),
                        CircularProgressIndicator(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
          Positioned(
            right: 30,
            bottom: 30,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                IgnorePointer(
                  child: Container(
                    color: Colors.transparent,
                    height: 150.0,
                    width: 150.0,
                  ),
                ),
                Transform.translate(
                  offset: Offset.fromDirection(getRadiansFromDegree(270),degOneTranslationAnimation.value * 100),
                  child: Transform(
                    transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))..scale(degOneTranslationAnimation.value),
                    alignment: Alignment.center,
                    child: CircularButton(
                      color: Color(0xff55cee3),
                      width: 60,
                      height: 60,
                      icon: Icon(
                        Icons.menu_book_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
                      onClick: (){},
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset.fromDirection(getRadiansFromDegree(225),degTwoTranslationAnimation.value * 100),
                  child: Transform(
                    transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))..scale(degTwoTranslationAnimation.value),
                    alignment: Alignment.center,
                    child: CircularButton(
                      color: Color(0xff75e6da),
                      width: 60,
                      height: 60,
                      icon: Icon(
                        Icons.file_copy,
                        color: Colors.white,
                        size: 35,
                      ),
                      onClick: (){
                        print('Second button');
                      },
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset.fromDirection(getRadiansFromDegree(180),degThreeTranslationAnimation.value * 100),
                  child: Transform(
                    transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))..scale(degThreeTranslationAnimation.value),
                    alignment: Alignment.center,
                    child: CircularButton(
                      color: Colors.orangeAccent,
                      width: 60,
                      height: 60,
                      icon: Icon(
                        Icons.cloud_upload,
                        color: Colors.white,
                        size: 35,
                      ),
                      onClick: () async{
                        final result = await FilePicker.platform.pickFiles(
                          allowMultiple: false,
                          type: FileType.custom,
                          allowedExtensions: ['pdf'],
                        );
                      },
                    ),
                  ),
                ),
                Transform(
                  transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value)),
                  alignment: Alignment.center,
                  child: CircularButton(
                    color: Color(0xff05445E),
                    width: 60,
                    height: 60,
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    ),
                    onClick: (){
                      if (animationController.isCompleted) {
                        animationController.reverse();
                      } else {
                        animationController.forward();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Align(
          //     alignment: Alignment.bottomLeft,
          //     child: Padding(
          //       padding: const EdgeInsets.all(10.0),
          //       child: MaterialButton(
          //         height: 45,
          //         color: Color(0xff05445E),
          //         shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(18.0)),
          //         child: Text('View Book',style: TextStyle(color: Colors.white),),
          //         onPressed: (){},
          //       ),
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Align(
          //     alignment: Alignment.bottomRight,
          //     child: ConditionalBuilder(
          //       condition: true,
          //       builder: (context) => Padding(
          //         padding: const EdgeInsets.all(10.0),
          //         child: MaterialButton(
          //           height: 45,
          //           color: Colors.red,
          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(18.0)),
          //           child: Text('    Upload    '),
          //           onPressed: () async {
          //             // final result = await FilePicker.platform.pickFiles(
          //             //   allowMultiple: false,
          //             //   type: FileType.custom,
          //             //   allowedExtensions: ['pdf'],
          //             // );
          //             // if (result == null) return;
          //             //
          //             // final PlatformFile file = result.files.first;
          //             // var formData = FormData.fromMap({
          //             //   "api_password": "k9x9OD7WDSzpwx65",
          //             //   'subject_id': subject_id,
          //             //   'file': await MultipartFile.fromFile(
          //             //       file.path.toString(),
          //             //       filename: file.name.toString())
          //             // });
          //             // AppCubit.get(context)
          //             //     .upload(token: widget.token, formData: formData);
          //           },
          //         ),
          //       ),
          //       fallback: (context) => MaterialButton(
          //         onPressed: () {},
          //         color: Colors.grey[200],
          //         height: 45,
          //         shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(18.0)),
          //         child: Text('   No task   '),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class CircularButton extends StatelessWidget {

  double width;
  double height;
  Color color;
  Icon icon;
  var onClick;

  CircularButton({required this.color, required this.width, required this.height, required this.icon, required this.onClick});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color,shape: BoxShape.circle),
      width: width,
      height: height,
      child: IconButton(icon: icon,enableFeedback: true, onPressed: onClick),
    );
  }
}
