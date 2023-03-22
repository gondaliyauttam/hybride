class DataModel {
  int? id;
  String? name;
  String? typeName;
  double? bidPrice;
  double? askPrice;
  double? highPrice;
  double? lowPrice;
  double? close;
  double? open;
  double? volume;
  double? newAskFlag;
  double? newBidFlag;
  String? sourceTime;
  String? sourceTime2;

  DataModel(
      {this.id,
      this.name,
      this.typeName,
      this.bidPrice,
      this.askPrice,
      this.highPrice,
      this.lowPrice,
      this.close,
      this.open,
      this.volume,
      this.newAskFlag,
      this.newBidFlag,
      this.sourceTime,
      this.sourceTime2});
}
