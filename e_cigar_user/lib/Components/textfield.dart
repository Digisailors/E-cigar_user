import 'package:flutter/material.dart';

class EntryFormField extends StatelessWidget {
  final String? label;
  final String title;
  final TextEditingController? controller;
  // ignore: use_key_in_widget_constructors
  const EntryFormField(this.label, this.title, this.controller);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        label != null
            ? Row(
                children: [
                  Text(
                    label!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 12),
                  ),
                ],
              )
            : const SizedBox.shrink(),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
              prefixStyle: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.black),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
              hintText: title,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.black, fontSize: 17)),
        ),
      ],
    );
  }
}

class EntryField extends StatelessWidget {
  final String? label;
  final String? title;
  final TextEditingController? controller;
  const EntryField(this.label, this.title, this.controller, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        label != null
            ? Row(
                children: [
                  Text(
                    label!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 12),
                  ),
                ],
              )
            : const SizedBox.shrink(),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
              prefixStyle: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.black),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
              hintText: title,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.black, fontSize: 17)),
        ),
      ],
    );
  }
}

class SmallTextFormField extends StatelessWidget {
  final String? label;
  final String? title;
  final TextEditingController? controller;
  const SmallTextFormField(this.label, this.title, this.controller, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        label != null
            ? Row(
                children: [
                  Text(
                    label!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 11),
                  ),
                ],
              )
            : const SizedBox.shrink(),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
              isDense: true,
              prefixStyle: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.black),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
              hintText: title,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.black, fontSize: 14)),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}

class SmallImageTextFormField extends StatelessWidget {
  final String img;
  final String label;
  final String title;
  final TextEditingController? controller;
  const SmallImageTextFormField(this.img, this.label, this.title,
      {Key? key, this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              label,
              style:
                  Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 11),
            ),
          ],
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
              isDense: true,
              prefixStyle: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.black),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
              hintText: title,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.black, fontSize: 14)),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}

class UnusableField extends StatelessWidget {
  final String? label;
  final String title;
  final TextEditingController? controller;

  const UnusableField({Key? key, this.label, required this.title, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        label != null
            ? Row(
                children: [
                  Text(
                    label!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 12),
                  ),
                ],
              )
            : const SizedBox.shrink(),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
              prefixStyle: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.black),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
              hintText: title,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.black, fontSize: 17)),
        ),
      ],
    );
  }
}