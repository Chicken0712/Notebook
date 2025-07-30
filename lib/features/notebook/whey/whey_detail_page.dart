import 'package:flutter/material.dart';
import 'package:fitjourney/features/notebook/whey/whey_model.dart';

class WheyDetailPage extends StatelessWidget {
  final Whey whey;
  const WheyDetailPage({required this.whey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(whey.name)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (whey.imageUrl != null)
                Center(
                  child: Image.network(
                    whey.imageUrl!,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              SizedBox(height: 16),
              Text("✨ Thông tin sản phẩm", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text("• Trọng lượng: ${whey.weight}g"),
              Text("• Giá: ${whey.price}đ"),
              Text("• Protein: ${whey.protein}g (${whey.proteinRatio ?? '—'})"),
              if (whey.servingSize != null) Text("• Serving size: ${whey.servingSize}"),
              if (whey.nutritionInfo != null) Text("• Dinh dưỡng: ${whey.nutritionInfo}"),
              if (whey.flavors != null) Text("• Các vị: ${whey.flavors}"),
              if (whey.brand != null) Text("• Thương hiệu: ${whey.brand}"),
              if (whey.origin != null) Text("• Xuất xứ: ${whey.origin}"),
              if (whey.proteinType != null) Text("• Loại protein: ${whey.proteinType}"),
              SizedBox(height: 12),
              Text("📝 Ghi chú:", style: TextStyle(fontWeight: FontWeight.bold)),
              Text(whey.note),
            ],
          ),
        ),
      ),
    );
  }
}
