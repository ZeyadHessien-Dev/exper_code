import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_app_ex/module/webview_screen.dart';
import 'package:shimmer/shimmer.dart';

Widget defaultTextForm({
  required TextEditingController controller,
  required String labelText,
  required IconData prefixIcon,
  required TextInputType keyboardType,
  IconButton? suffixIcon,
  ValueChanged<String>? onFieldSubmitted,
  ValueChanged<String>? onChanged,
  FormFieldValidator<String>? validator,
  GestureTapCallback? onTap,
  bool obscureText = false,
}) =>
    TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(),
      ),
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      validator: validator,
      onTap: onTap,
    );

Widget defaultButton({
  double width = double.infinity,
  double height = 40,
  double radius = 10.0,
  Color color = Colors.blue,
  required VoidCallback? onPressed,
  required String text,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      ),
    );

Widget divideBy() => Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey,
      ),
    );

void navigateTo(context, widget) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}

void navigateAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (route) => false,
  );
}

Future buildToast({
  required String message,
  required Cases state,
}) async =>
    await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: buildColorToast(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

enum Cases { SUCCESS, WARNING, ERROR }

Color? buildColorToast(state) {
  Color? color;
  switch (state) {
    case Cases.SUCCESS:
      return Colors.green;
    case Cases.ERROR:
      return Colors.red;
    case Cases.WARNING:
      return Colors.yellow;
  }
  return color;
}

Widget buildItemList(context, cubit, index) => InkWell(
  onTap: () {
    navigateTo(context, WebViewScreen(cubit[index].url));
  },
  child:   Container(

        width: double.infinity,

        height: 150.0,

        padding: const EdgeInsetsDirectional.all(

          15.0,

        ),

        margin: const EdgeInsetsDirectional.only(

          bottom: 15.0,

        ),

        decoration: BoxDecoration(

          border: Border.all(

            color: Colors.grey,

          ),

          borderRadius: BorderRadius.circular(

            20.0,

          ),

        ),

        child: Row(

          children: [

            CachedNetworkImage(

              imageUrl: cubit[index].urlToImage ??

                  "https://www.google.com/search?q=default+image&sxsrf=ALiCzsYfFth8nsHloK8dGyJSLEfqDi3a6g:1666467402172&source=lnms&tbm=isch&sa=X&ved=2ahUKEwj9v6TsyvT6AhXLwKQKHWtBANMQ_AUoAXoECAIQAw&biw=1396&bih=685&dpr=1.38#imgrc=yFdCMsaf-Ju1YM",

              height: double.infinity,

              width: MediaQuery.of(context).size.width * .3,

              fit: BoxFit.fill,

              placeholder: (context, url) => Shimmer.fromColors(

                baseColor: Colors.grey[850]!,

                highlightColor: Colors.grey[800]!,

                child: Container(

                  height: double.infinity,

                  width: MediaQuery.of(context).size.width * .3,

                  decoration: BoxDecoration(

                    color: Colors.black,

                    borderRadius: BorderRadius.circular(8.0),

                  ),

                ),

              ),

              errorWidget: (context, url, error) => const Icon(Icons.error),

            ),

            const SizedBox(

              width: 15.0,

            ),

            Expanded(

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(

                    cubit[index].content ?? "No Content From API",

                    style: Theme.of(context).textTheme.subtitle1,

                    maxLines: 3,

                    overflow: TextOverflow.ellipsis,

                  ),

                  const Spacer(),

                  Text(

                    (cubit[index].publishedAt) ?? "No Date",

                    style: Theme.of(context).textTheme.headline5,

                  ),

                ],

              ),

            ),

          ],

        ),

      ),
);

Widget buildList(cubit, {bool isSearch = false}) => ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: cubit.length,
      itemBuilder: (BuildContext context, int index) =>
          buildItemList(context, cubit, index),
    );

Widget buildCircleProgress() => const Center(
      child: CircularProgressIndicator(
        value: 0.50,
        backgroundColor: Colors.grey,
        valueColor: AlwaysStoppedAnimation(Colors.pink),
      ),
    );

Scaffold buildScaffoldItems(cubit) => Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: buildList(cubit),
      ),
    );
