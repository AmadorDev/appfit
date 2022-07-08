
import 'package:appsfit/shared/api/apiServices.dart';
import 'package:appsfit/shared/models/search/searchModel.dart';
import 'package:appsfit/shared/utils/theme/appThemeView.dart';
import 'package:flutter/material.dart';

class FitSearchDelegate extends SearchDelegate{

  String get searchFieldLabel => 'Buscar Centro';
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(icon: Icon(Icons.clear),
        onPressed: (){
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(icon: Icon(Icons.clear),
        onPressed: (){
          close(context, null);
        },
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
        return Text("buildResults");

  }

  Widget _empty(){
    return Container(
            child: Center(
              child: Icon (Icons.fitness_center_outlined, color: Colors.black38, size: 100),
            ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
        if  (query.isEmpty){
          return _empty();
        }

      
        /*var formData = FormData.fromMap({
         "DefaultKey": "27690a00-1cb6-4489-83dd-b59b5adbde2b",
         "SubDominio": query,
        });*/

        return FutureBuilder(
          future: ApiServices.seachFits("",query),
          builder: (_, AsyncSnapshot<List<Fits>> snapshot) {

            if( !snapshot.hasData) return _empty();

            final fits = snapshot.data!;

            return ListView.builder(
              itemCount: fits.length,
              itemBuilder: (_, int index) =>_FitsItems( fits[index] )
              );
            
          },
        );
  }

}

class _FitsItems extends StatelessWidget {
 
 final Fits datas;
 const _FitsItems( this.datas);


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FadeInImage(
        placeholder: AssetImage('assets/empty.png'),
        imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/empty.png",
                    height: 50,
                    width: 50,
           );
         },
        image: NetworkImage(datas.logoTipo!),
        width: 50,
        fit: BoxFit.contain,
      ),
      title: Text(datas.nombreComercialEmpresa!, style: FitAppTheme.descriptionWhite,),
    );
  }
}