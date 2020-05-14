# mancini_source

Repository for *The Correspondence of Marie Mancini* Project, a digital edition of the 17th-century letters of Marie Mancini. This project is a collaboration between Sarah Nelson, Associate Professor of French and the [Center for Digital Inquiry and Learning (CDIL)](https://cdil.lib.uidaho.edu/) at the University of Idaho.

## Contributors:
- **Sarah Nelson**, Associate Professor of French, University of Idaho
- **Olivia Wikle**, Digital Initiatives Librarian, University of Idaho
- **Alessandro Martina**, Teaching Assistant and Ph.D. Student, UW-Madison Department of French & Italian

## Project Workflow & Documentation:
- [Meeting Notes](/docs/meetings.md)
- [Markdown Instructions](/docs/transcription.md)

## Spreadsheet Documentation:
- [mancini_metadata](https://docs.google.com/spreadsheets/d/1ve8mjVhXRjiXzofISLAPInTzww7tZuK9NUtxJyBvMNk/edit?usp=sharing): documents information about each letter
- Tags Spreadsheets:
    - [persName_tags](https://docs.google.com/spreadsheets/d/1LAvt-O72kRdg07OP7rPGmpFmYtjBstf51lrXT5hL3vU/edit?usp=sharing): 
        - `name`: all versions of names mentioned in letters; one value per cell; a single person may have multiple names in this column
        - `key`: unique identifier for a single person; used in xml encoding; only one key may exist per person, but a single key may be attached to multiple values in the `name` column
        - `filename-code`: unique initials for a single person; used in filenaming and letter ID creation; use two initials (first and last) when possible, one when necessary
    - [subject_tags](https://docs.google.com/spreadsheets/d/1_Gr3qSDQay_emRd4izQ5Oa8QDgTmgAc56EI_BrkYzDY/edit?usp=sharing): broad subjects to be globally applied to letters
    - [placeName_tags](https://docs.google.com/spreadsheets/d/1lHBBq97QJb7D_vgkehq_Vko7jts4X1LaOQ5_PfzpTGE/edit?usp=sharing): geographical locations mentioned in text
        - `name`: all versions of geographical locations mentioned in text; one value per cell; a single location may have multiple names in this column
        - `key`: unique identifier for a single location; used in xml encoding; only one key may exist per location, but a single key may be attached to multiple values in the `name` column
    - [editor_tags](https://docs.google.com/spreadsheets/d/1eKKw5Y33Yk4MzeiUJoUkh8yhO-J4BHNmGoucA-Y9YK8/edit?usp=sharing): two-three initial code for each person on project, to be recorded in xml encoding and in metadata spreadsheet
    - [annotation_tags](https://docs.google.com/spreadsheets/d/1aOrT2d-n5jl50cxi7on7YjdD0Ca-lfpL1k_SFzl54ho/edit?usp=sharing)
