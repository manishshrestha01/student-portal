class NotesModel {
    NotesModel({
        required this.sucess,
        required this.notes,
    });

    final bool? sucess;
    final List<Note> notes;

    factory NotesModel.fromJson(Map<String, dynamic> json){ 
        return NotesModel(
            sucess: json["sucess"],
            notes: json["Notes"] == null ? [] : List<Note>.from(json["Notes"]!.map((x) => Note.fromJson(x))),
        );
    }

}

class Note {
    Note({
        required this.noteId,
        required this.notePdf,
        required this.notesUrl,
        required this.noteTitle,
        required this.postedOn,
        required this.noteDescription,
    });

    final int? noteId;
    final String? notePdf;
    final dynamic notesUrl;
    final String? noteTitle;
    final String? postedOn;
    final dynamic noteDescription;

    factory Note.fromJson(Map<String, dynamic> json){ 
        return Note(
            noteId: json["note_id"],
            notePdf: json["note_pdf"],
            notesUrl: json["notes_url"],
            noteTitle: json["note_title"],
            postedOn: json["posted_on"],
            noteDescription: json["note_description"],
        );
    }

}
