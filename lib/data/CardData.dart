class CardData {
  String id;
  String imagelink;
  String titull;
  String subtitle;
  String qrCode;

  CardData({this.id, this.imagelink, this.titull, this.subtitle, this.qrCode});

  CardData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imagelink = json['imagelink'];
    titull = json['titull'];
    subtitle = json['subtitle'];
    qrCode = json['qr-code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imagelink'] = this.imagelink;
    data['titull'] = this.titull;
    data['subtitle'] = this.subtitle;
    data['qr-code'] = this.qrCode;
    return data;
  }
}