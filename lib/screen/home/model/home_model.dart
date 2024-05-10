class HomeModel
{
  String?name;
  int?id;
  List<dynamic>? quotesList=[];
  List<dynamic>? authorList=[];
  List<dynamic>? imageList=[];

  HomeModel({this.name, this.id, this.quotesList, this.authorList,this.imageList});
  factory HomeModel.mapToModel(Map m1)
  {
    return HomeModel(name: m1['name'],id: m1['id'],authorList:m1['author'] ,quotesList:m1['quotes'],imageList: m1['image']);
  }
}