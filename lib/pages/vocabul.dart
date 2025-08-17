import 'package:capstone_project/pages/Data_services/language_entity.dart';
import 'package:flutter/material.dart';

class Vocabul extends StatefulWidget {
  const Vocabul({super.key});

  @override
  State<Vocabul> createState() => _VocabulState();
}

class _VocabulState extends State<Vocabul> {
  final LanguageEntity _languageEntity = LanguageEntity(); // Initialize LanguageEntity

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCD0D0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: VocabularySearchDelegate(_languageEntity.translationMap),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
       child: PaginatedDataTable(
          columns: const [
            DataColumn(
              label: Text("English", style: TextStyle(color: Colors.black, fontSize: 22)),
            ),
            DataColumn(
              label: Text("Bagobo-Klata", style: TextStyle(color: Colors.black, fontSize: 22)),
            ),
          ],
          source: VocabularyDataSource(_languageEntity), // Pass LanguageEntity data
          header: const Center(
            child: Text(
              "Learning English to Bagobo-klata",
              style: TextStyle(fontSize: 18),
            ),
          ),
          showFirstLastButtons: true,
          columnSpacing: 15,
          horizontalMargin: 30,
        ),

      ),
    );
  }
}

class VocabularyDataSource extends DataTableSource {
  final List<MapEntry<String, String>> _entries;

  VocabularyDataSource(LanguageEntity languageEntity)
      : _entries = languageEntity.translationEntries;

  @override
  DataRow getRow(int index) {
    final entry = _entries[index];
    return DataRow(
      cells: [
        DataCell(Text(entry.key, style: const TextStyle(fontSize: 18),)), // English
        DataCell(Text(entry.value, style: const TextStyle(fontSize: 18))), // Bagobo-Klata
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _entries.length;

  @override
  int get selectedRowCount => 0;
}

// Search Delegate Implementation
class VocabularySearchDelegate extends SearchDelegate {
  final List<MapEntry<String, String>> entries;

  VocabularySearchDelegate(Map<String, String> translations)
      : entries = translations.entries.toList();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = entries
        .where((entry) =>
            entry.key.toLowerCase().contains(query.toLowerCase()) ||
            entry.value.toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (results.isEmpty) {
      return const Center(
        child: Text("No matches found."),
      );
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final entry = results[index];
        return ListTile(
          title: Text(entry.key, style: const TextStyle(fontSize: 18)),
          subtitle: Text(entry.value, style: const TextStyle(fontSize: 18)),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = entries
        .where((entry) =>
            entry.key.toLowerCase().contains(query.toLowerCase()) ||
            entry.value.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final entry = suggestions[index];
        return ListTile(
          title: Text(entry.key, style: const TextStyle(fontSize: 18)),
          subtitle: Text(entry.value, style: const TextStyle(fontSize: 18)),
          onTap: () {
            query = entry.key;
            showResults(context);
          },
        );
      },
    );
  }
}

