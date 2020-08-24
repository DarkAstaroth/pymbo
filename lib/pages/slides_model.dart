import 'package:flutter/material.dart';

class SlidesModel {
  String imagePath;
  String title;
  String desc;

  SlidesModel({this.imagePath, this.title, this.desc});

  void setImageAssetPath(String getImagePath) {
    imagePath = getImagePath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imagePath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SlidesModel> getSlides() {
  List<SlidesModel> slides = new List<SlidesModel>();
  SlidesModel slidesModel = new SlidesModel();

  slidesModel.setImageAssetPath('');
  slidesModel.setTitle('Titulo1');
  slidesModel.setDesc('desc1');

  slides.add(slidesModel);

  slidesModel = new SlidesModel();

  slidesModel.setImageAssetPath('');
  slidesModel.setTitle('Titulo2');
  slidesModel.setDesc('desc1');

  slides.add(slidesModel);

  slidesModel = new SlidesModel();

  slidesModel.setImageAssetPath('');
  slidesModel.setTitle('Titulo3');
  slidesModel.setDesc('desc1');

  slides.add(slidesModel);

  slidesModel = new SlidesModel();

  return slides;
}
