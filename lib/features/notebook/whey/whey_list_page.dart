import 'package:flutter/material.dart';
import 'package:fitjourney/features/notebook/whey/whey_data.dart';
import 'package:fitjourney/features/notebook/whey/whey_model.dart';
import 'whey_detail_page.dart';

class WheyListPage extends StatelessWidget {
  final String type;
  const WheyListPage({super.key, required this.type});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Danh sách Whey')),
      body: ListView.builder(
        itemCount: wheySamples.length,
        itemBuilder: (context, index) {
          final w = wheySamples[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 2,
            child: ListTile(
              leading: w.imageUrl != null
                  ? Image.network(
                w.imageUrl!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              )
                  : Icon(Icons.image_not_supported),
              title: Text(w.name, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${w.protein}g protein • ${w.price.toStringAsFixed(0)}đ'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => WheyDetailPage(whey: w)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}