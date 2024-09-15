import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/build_results_search_item.dart';

class NoteSearchDelegate extends SearchDelegate {
  NoteSearchDelegate(this.notes);
  final List<NoteModel> notes;
  String _categorySearch = 'title';
  List<NoteModel> _filteredNotes = [];
  bool get isTitle => _categorySearch == 'title';
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
      ),
      PopupMenuButton(
        onSelected: (value) {
          _categorySearch = value;
          showSuggestions(context);
          query = '';
        },
        itemBuilder: (context) {
          return [
            const PopupMenuItem(
              value: 'title',
              child: Text('Title'),
            ),
            const PopupMenuItem(
              value: 'body',
              child: Text('Body'),
            ),
          ];
        },
      )
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
    if (query.isEmpty) {
      return const Center(
        child: Text(
          'Type something to search',
          style: TextStyle(fontSize: 20),
        ),
      );
    }

    return BuildResultsSearchItem(
      isTitle: isTitle,
      searchQuery: query,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Text('Type something to search'),
      );
    }
    filteredNotes();
    return showResultsSearchItem(notes: _filteredNotes);
  }

  ListView showResultsSearchItem({List<NoteModel>? notes}) {
    return ListView.builder(
      itemCount: notes?.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(notes == null
              ? ''
              : isTitle
                  ? notes[index].title
                  : notes[index].body),
          onTap: () {
            query = notes == null
                ? ''
                : isTitle
                    ? notes[index].title
                    : notes[index].body;
            showResults(context);
          },
        );
      },
    );
  }

  void filteredNotes() {
    _filteredNotes = notes
        .where((note) => isTitle
            ? note.title.toLowerCase().contains(query.toLowerCase())
            : note.body.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
