import 'package:flutter/material.dart';
import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/presentation/add_edit_note/add_edit_note_event.dart';
import 'package:flutter_note_app/presentation/add_edit_note/add_edit_note_view_model.dart';
import 'package:flutter_note_app/ui/colors.dart';
import 'package:provider/provider.dart';

class AddEditNoteScreen extends StatefulWidget {
  final Note? note;

  const AddEditNoteScreen({super.key, this.note});

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  final List<Color> noteColors = [
    roseBud,
    creamRose,
    wisteria,
    skyBlue,
    illusion
  ];

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final viewModel = context.read<AddEditNoteViewModel>();
      viewModel.eventStream.listen ((event) {
        event.when(saveNote: () {
          Navigator.pop(context, true);
        });
      });
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AddEditNoteViewModel>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_titleController.text.isEmpty ||
              _contentController.text.isEmpty) {
            const snackBar = SnackBar(content: Text('제목이나 내용이 비어 있습니다.'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }

          viewModel.onEvent(
            AddEditNoteEvent.saveNote(
                widget.note == null ? null : widget.note!.id,
                _titleController.text,
                _contentController.text),
          );
        },
        child: const Icon(Icons.save),
      ),
      body: SafeArea(
        child: AnimatedContainer(
          padding: const EdgeInsets.all(16),
          color: Color(viewModel.color),
          duration: const Duration(milliseconds: 500),
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: noteColors
                      .map(
                        (color) => InkWell(
                          onTap: () {
                            viewModel.onEvent(
                                AddEditNoteEvent.changeColor(color.value));
                          },
                          child: _buildBackgroundColor(
                              color: color,
                              isSelected: viewModel.color == color.value),
                        ),
                      )
                      .toList()),
              TextField(
                controller: _titleController,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: const InputDecoration(
                  hintText: '제목을 입력하세요',
                  border: InputBorder.none,
                ),
              ),
              TextField(
                controller: _contentController,
                maxLines: null,
                style: Theme.of(context).textTheme.bodySmall,
                decoration: const InputDecoration(
                  hintText: '내용을 입력하세요',
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundColor(
      {required Color color, required bool isSelected}) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: isSelected ? Border.all(color: Colors.black, width: 3) : null,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              spreadRadius: 1),
        ],
      ),
    );
  }
}
