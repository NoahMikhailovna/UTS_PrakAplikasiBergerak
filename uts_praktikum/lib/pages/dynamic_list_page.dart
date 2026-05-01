import 'package:flutter/material.dart';

class DynamicListPage extends StatefulWidget {
  const DynamicListPage({super.key});

  @override
  State<DynamicListPage> createState() => _DynamicListPageState();
}

class _DynamicListPageState extends State<DynamicListPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _items = ['indonesia', 'malaysia', 'bekasi'];

  void _addItem() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() => _items.add(text));
      _controller.clear();
    }
  }

  void _deleteItem(int index) {
    setState(() => _items.removeAt(index));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic List Example', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.lightBlue[700],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Input area
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Tambah item baru...',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 12),
                    ),
                    onSubmitted: (_) => _addItem(),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addItem,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue[700],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Count info
            Row(
              children: [
                Text(
                  'Total item: ${_items.length}',
                  style: TextStyle(color: Colors.lightBlue[600], fontSize: 13),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // List
            Expanded(
              child: _items.isEmpty
                  ? const Center(
                      child: Text('Belum ada item.',
                          style: TextStyle(color: Colors.grey)))
                  : ListView.separated(
                      itemCount: _items.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.lightBlue[50],
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.lightBlue[100]!),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.lightBlue[200],
                              child: Text('${index + 1}',
                                  style: const TextStyle(color: Colors.white)),
                            ),
                            title: Text(_items[index]),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_outline,
                                  color: Colors.redAccent),
                              onPressed: () => _deleteItem(index),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
