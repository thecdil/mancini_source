## Markdown Transcription Instructions

## Creating a New Transcription
If you are creating a new raw transcription, be sure to update the [metadata spreadsheet](https://docs.google.com/spreadsheets/d/1ve8mjVhXRjiXzofISLAPInTzww7tZuK9NUtxJyBvMNk/edit?usp=sharing)!
- Find sender and receiver initials in Google Drive Folder **tags** > [**persName** spreadsheet](https://docs.google.com/spreadsheets/d/1LAvt-O72kRdg07OP7rPGmpFmYtjBstf51lrXT5hL3vU/edit?usp=sharing) > column **filename-code**
- Insert the letter's ID into the metadata spreadsheet, and fill in the data for the columns


## Transfering an Existing Transcription to Markdown
1. Open the **demo_material** folder in [Google Drive](https://drive.google.com/drive/folders/1a-OmhVezrV3SK1xYITv-tBVST8cqOeHv?usp=sharing)
2. Navigate to the folder of the letter you want to transfer. Open the word doc as a google doc (or download it). 
3. Open the **mancini_source** repository in Visual Studio Code.
4. In the **transcriptions** folder, create a new sub-folder, **titled with the ID of the letter you are working on**. You can find the ID in the [Mancini metadata](https://docs.google.com/spreadsheets/d/1ve8mjVhXRjiXzofISLAPInTzww7tZuK9NUtxJyBvMNk/edit?usp=sharing) file, or in the title of the document. The ID follows these conventions:
        - `yyyy_mm_dd_SenderInitials2ReceiverInitials`
        - Ex. `1672_10_29_mm2lc`
5. Inside your new sub-folder, create a new file. This should be a markdown file and should follow these naming conventions:
	- **Filename**: 
		- filenames are labeled `id_filetype.md`, where `id` is the ID described above, and `filetype` = `raw`, `edit`, or `translation`
        - Ex. `1672_10_29_mm2lc_raw.md`
        - Be sure that the file extension is `.md` (stands for markdown)
6. Carefully copy and paste the material from the google doc into the markdown file in Visual Studio Code. 
    - Diacritics should all transfer with the copy/paste. Double check to be sure.
    - Specific changes you'll have to make to **raw files**:
		- Add line breaks: `\`
		- Add superscripts: `<sup>`content`</sup>`


### Markdown rules that you may need to implement 

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

- **Other Elements**

| Markdown | HTML |
| --- | --- |
| `<sup>superscript content</sup>` | <sup>superscript content</sup>|
| `*Emphasis*` or `_emphasis_` | *Emphasis* or _emphasis_ |
| `**Strong**` or `__strong__` | **Strong** or __strong__ |
| `inline [hyperlink](https://www.google.com)` | inline [hyperlink](https://www.google.com) |
| `footnote.[^1]` | footnote.[^1] |

`[^1]: example footnote definition.`

[^1]: example footnote definition.


