import 'package:flutter/material.dart';
import 'package:fitjourney/features/notebook/whey/whey_model.dart';

class WheyDetailPage extends StatelessWidget {
  final Whey whey;
  const WheyDetailPage({required this.whey, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(whey.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hình ảnh bo góc
            if (whey.imageUrl != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: whey.imageUrl!.startsWith('assets/')
                    ? Image.asset(
                  whey.imageUrl!,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
                    : Image.network(
                  whey.imageUrl!,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              )
            else
              const Center(child: Icon(Icons.image_not_supported, size: 100)),

            const SizedBox(height: 16),

            // Thông tin sản phẩm
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "✨ Thông tin sản phẩm",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    _buildInfoRow(Icons.scale, "Trọng lượng", "${whey.weight}g", Colors.teal),
                    _buildInfoRow(Icons.price_check, "Giá", "${whey.price}đ", Colors.green),
                    _buildInfoRow(Icons.fitness_center, "Protein", "${whey.protein}g (${whey.proteinRatio ?? '—'})", Colors.blue),
                    if (whey.servingSize != null)
                      _buildInfoRow(Icons.local_drink, "Serving size", whey.servingSize!, Colors.orange),
                    if (whey.nutritionInfo != null)
                      _buildInfoRow(Icons.analytics, "Dinh dưỡng", whey.nutritionInfo!, Colors.deepPurple),
                    if (whey.flavors != null)
                      _buildInfoRow(Icons.icecream, "Hương vị", whey.flavors!, Colors.pink),
                    if (whey.brand != null)
                      _buildInfoRow(Icons.factory, "Thương hiệu", whey.brand!, Colors.brown),
                    if (whey.origin != null)
                      _buildInfoRow(Icons.flag, "Xuất xứ", whey.origin!, Colors.red),
                    if (whey.proteinType != null)
                      _buildInfoRow(Icons.category, "Loại protein", whey.proteinType!, Colors.purple),
                  ],
                ),
              ),
            ),

            // Ghi chú
            if (whey.note.isNotEmpty)
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.notes, color: Colors.deepPurple),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "📝 Ghi chú",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              whey.note,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Hàm tiện ích tạo dòng thông tin
  Widget _buildInfoRow(IconData icon, String label, String value, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 22, color: iconColor),
          const SizedBox(width: 10),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 16, color: Colors.black),
                children: [
                  TextSpan(
                    text: "$label: ",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(text: value),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
