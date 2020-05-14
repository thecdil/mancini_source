## Markdown Instructions

## Creating a New Transcription/Translation
If you are creating a new folder with a raw transcription that is *not* already in the Google Drive, be sure to update the [metadata spreadsheet](https://docs.google.com/spreadsheets/d/1ve8mjVhXRjiXzofISLAPInTzww7tZuK9NUtxJyBvMNk/edit?usp=sharing)!
- Insert the letter's ID into the metadata spreadsheet, and fill in the data for the columns
    - Create a letter ID:
        - Naming convention: `yyyy_mm_dd_SenderInitials2ReceiverInitials`
        - Example: `1672_10_29_mm2lc`
        - Find sender and receiver initials in Google Drive Folder **tags** > [**persName** spreadsheet](https://docs.google.com/spreadsheets/d/1LAvt-O72kRdg07OP7rPGmpFmYtjBstf51lrXT5hL3vU/edit?usp=sharing) > **filename-code** column


## Transferring an Existing Transcription/Translation to Markdown
1. Open the **demo_material** folder in [Google Drive](https://drive.google.com/drive/folders/1a-OmhVezrV3SK1xYITv-tBVST8cqOeHv?usp=sharing)
2. Navigate to the folder of the letter you want to transfer. Open the word doc as a google doc (or download it). 
3. Using GitHub Desktop, [Pull](https://lib-static.github.io/howto/howtos/pushpullchanges.html) any recent changes made to the [mancini_source](https://github.com/thecdil/mancini_source) GitHub repository. 
4. [Open the repository](https://lib-static.github.io/howto/howtos/openrepointexteditor.html) in Visual Studio Code.
5. In the repository's **transcriptions** folder, create a new sub-folder, **titled with the ID of the letter you are working on**. You can find the ID in the [Mancini metadata](https://docs.google.com/spreadsheets/d/1ve8mjVhXRjiXzofISLAPInTzww7tZuK9NUtxJyBvMNk/edit?usp=sharing) spreadsheet, or in the title of the document. **The ID follows these conventions**:
    - `yyyy_mm_dd_SenderInitials2ReceiverInitials`
    - Example: `1672_10_29_mm2lc`
6. Inside your new sub-folder, create a new file. This should be a markdown file and should follow these naming conventions:
    - **Filenames** are labeled `id_filetype.md`, where `id` is the ID described above, and `filetype` = `raw`, `edit`, or `translation`
    - Example: `1672_10_29_mm2lc_raw.md`
    - Be sure that the file extension is `.md` (stands for markdown)
7. Carefully copy and paste the material from the google doc into the markdown file in Visual Studio Code. 
    - Diacritics should all transfer with the copy/paste. Double check to be sure.
    
    - Specific changes you may have to make to **raw files** and **edited files**:
		- Add line breaks: `\`
		- Add superscripts: `<sup></sup>`
        - Add strikethrough: `<strike></strike>`

    - Specific changes you may have to make to **translation files**:
        - Add footnotes: 
            - In text: `footnote.[^1]`
            - End of document: `[^1]: example footnote definition.`
8. Save your markdown file in Visual Studio Code, then use GitHub Desktop to [Push your changes](https://lib-static.github.io/howto/howtos/pushpullchanges.html) to the GitHub repository.
9. Add your [editor tag](https://docs.google.com/spreadsheets/d/1eKKw5Y33Yk4MzeiUJoUkh8yhO-J4BHNmGoucA-Y9YK8/edit?usp=sharing) to the [Mancini metadata](https://docs.google.com/spreadsheets/d/1ve8mjVhXRjiXzofISLAPInTzww7tZuK9NUtxJyBvMNk/edit?usp=sharing) spreadsheet to indicate which file you edited/created.


## Markdown rules that you may need to implement: 

(For more complete examples, see these [markdown guidelines](https://evanwill.github.io/write-md/content/2-markdown.html)):

- **Headers** are indicated with a pound (`#`) sign. They range from level one to six (`#` - `######`), according to importance:
    - `# Header One`
    - `## Header Two`

- **Paragraphs** don't require any special markup. Any text with no empty lines between will be joined into a paragraph. Leave an empty line between headings and paragraphs.

- **Line Breaks** If you want to break up text to multiple lines, but don't want a space between the lines, add a backslash (`\`) at the end of the first line of text, then add the next line directly below, with no space in between:
```
Collocazione II-C.P.1. lett. 47\
Lett. di Maria Mancini – 1673\
Nr d’ordine – 29
```

- **Other Elements**:

| Markdown | HTML |
| --- | --- |
| `<sup>`superscript content`</sup>` | <sup>superscript content</sup>|
| `<strike>`strikethrough content`</strike>` | <strike>superscript content</strike>|
| `*Emphasis*` or `_emphasis_` | *Emphasis* or _emphasis_ |
| `**Strong**` or `__strong__` | **Strong** or __strong__ |
| `inline [hyperlink](https://www.google.com)` | inline [hyperlink](https://www.google.com) |
| `footnote.[^1]` | footnote.[^1] |

`[^1]: example footnote definition.`

[^1]: example footnote definition.


