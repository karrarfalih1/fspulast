class ActivityModel {
  int? activityId;
  String? activityTitle;
  String? activityDisc;
  String? activityLocationName;
  String? activityLangtude;
  String? activityLatitude;
  String? activityDateCreate;
  String? activityDateStart;
  String? activityDateEnd;
  int? activityGroubId;
  int? activityUsersId;
  String? activityImage;
  int? activityPoint;
  int? participate;

  ActivityModel(
      {this.activityId,
      this.activityTitle,
      this.activityDisc,
      this.activityLocationName,
      this.activityLangtude,
      this.activityLatitude,
      this.activityDateCreate,
      this.activityDateStart,
      this.activityDateEnd,
      this.activityGroubId,
      this.activityUsersId,
      this.activityImage,
      this.activityPoint,
      this.participate});

  ActivityModel.fromJson(Map<String, dynamic> json) {
    activityId = json['activity_id'];
    activityTitle = json['activity_title'];
    activityDisc = json['activity_disc'];
    activityLocationName = json['activity_location_name'];
    activityLangtude = json['activity_langtude'];
    activityLatitude = json['activity_latitude'];
    activityDateCreate = json['activity_date_create'];
    activityDateStart = json['activity_date_start'];
    activityDateEnd = json['activity_date_end'];
    activityGroubId = json['activity_groub_id'];
    activityUsersId = json['activity_users_id'];
    activityImage = json['activity_image'];
    activityPoint = json['activity_point'];
    participate = json['participate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activity_id'] = this.activityId;
    data['activity_title'] = this.activityTitle;
    data['activity_disc'] = this.activityDisc;
    data['activity_location_name'] = this.activityLocationName;
    data['activity_langtude'] = this.activityLangtude;
    data['activity_latitude'] = this.activityLatitude;
    data['activity_date_create'] = this.activityDateCreate;
    data['activity_date_start'] = this.activityDateStart;
    data['activity_date_end'] = this.activityDateEnd;
    data['activity_groub_id'] = this.activityGroubId;
    data['activity_users_id'] = this.activityUsersId;
    data['activity_image'] = this.activityImage;
    data['activity_point'] = this.activityPoint;
    data['participate'] = this.participate;
    return data;
  }
}