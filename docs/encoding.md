# Filenaming Conventions
- **Create a letter ID**:
    - Naming convention: `yyyy_mm_dd_SenderInitials2ReceiverInitials`
    - Example: `1672_10_29_mm2lc`
    - Find sender and receiver initials in Google Drive Folder **tags** > [**persName** spreadsheet](https://docs.google.com/spreadsheets/d/1LAvt-O72kRdg07OP7rPGmpFmYtjBstf51lrXT5hL3vU/edit?usp=sharing) > **filename-code** column

# Spreadsheet Documentation:
- **[mancini_metadata](https://docs.google.com/spreadsheets/d/1ve8mjVhXRjiXzofISLAPInTzww7tZuK9NUtxJyBvMNk/edit?usp=sharing)**: metadata describes each letter
- **Tags Spreadsheets**:
    - [persName_main](https://docs.google.com/spreadsheets/d/1LAvt-O72kRdg07OP7rPGmpFmYtjBstf51lrXT5hL3vU/edit?usp=sharing): 
        - `name`: all versions of names mentioned in letters; one value per cell; a single person may have multiple values in this column
        - `key`: unique identifier for a single person; used in xml encoding; only one key may exist per person, but a single key may be attached to multiple values in the `name` column
        - `filename-code`: unique initials for a single person; used in filenaming and letter ID creation; use two initials (first and last) when possible, one when necessary
    - [subject_tags](https://docs.google.com/spreadsheets/d/1_Gr3qSDQay_emRd4izQ5Oa8QDgTmgAc56EI_BrkYzDY/edit?usp=sharing): broad subjects to be globally applied to letters
    - [placeName_main](https://docs.google.com/spreadsheets/d/1lHBBq97QJb7D_vgkehq_Vko7jts4X1LaOQ5_PfzpTGE/edit?usp=sharing): geographical locations mentioned in text
        - `name`: all versions of geographical locations mentioned in text; one value per cell; a single location may have multiple values in this column
        - `key`: unique identifier for a single location; used in xml encoding; only one key may exist per location, but a single key may be attached to multiple values in the `name` column
    - [editor_tags](https://docs.google.com/spreadsheets/d/1eKKw5Y33Yk4MzeiUJoUkh8yhO-J4BHNmGoucA-Y9YK8/edit?usp=sharing): a two- or three-initial code for each person on project (first, middle, last initials), to be recorded in xml encoding and in metadata spreadsheet
    - [annotations](https://docs.google.com/spreadsheets/d/1aOrT2d-n5jl50cxi7on7YjdD0Ca-lfpL1k_SFzl54ho/edit?usp=sharing): Annotation content linked to its unique `id`
        - `id`: `xml:id` attribute given to notation, in following format: `uniqueletter` + `filnameid` (i.e. `a1672_10_29_mm2lc`)
        - `text`: annotation text

# Encoding Workflow

## Google Doc

- **Find the google doc you want to encode:**
    - In the ManciniProject Google Drive folder, go to the folder "demo-material"
    - Navigate to a folder with the year and creator/recipient you would like to encode
        - *Note: Folder names may start with incorrect dates. Always look at the `id` field in the "mancini_metadata" spreadsheet first to identify the letter you'd like to encode.*
    - Once you've selected a letter for encoding, add your initial code (*your initial code can be found in the [editor_tags](https://docs.google.com/spreadsheets/d/1eKKw5Y33Yk4MzeiUJoUkh8yhO-J4BHNmGoucA-Y9YK8/edit?usp=sharing) spreadsheet*) to the `encoder` field in the "mancini_metadata" spreadsheet.

- **Replace smart ("curly") quotes in the google doc:**
    - Find a right-facing smart quote in the google doc. Copy the smart quote. 
    - Open find and replace (`cmd` + `f` on a mac). Click the three dots on the right side of the find box to open the find and replace function.
    - Paste the smart quote into the "Find" box.
    - Switch to VSCode. Type a dumb ("straight") quote and copy it.
    - Paste the dumb quote into the "Replace with" box. Click "Replace all".
    - Find a left-facing smart quote and replace the content of the "Find" box with it, keeping the dumb quote in the "Replace with" box.
    - Click "Replace all".

## XML

- **Create new file**
    - Using GitHub Desktop, fetch and pull any changes to the mancini_source repository
    - Open the mancini_source repository in VS Code
    - In the "xml" folder at the root of the repository, find the respective year folder that matches the letter you are about to encode.
    - Create a new file in this folder.
    - Title this file with the `id` of the letter you are encoding (find this `id` in the "mancini_metadata" spreadsheet), + the file extension `.xml`
    - Copy and paste the content of the file `letter-example.xml` (found in the "xml" folder) into the new file you just created.
    - Piece by piece, go through the pasted content and switch it out for the new letter you are encoding, according to the instructions below.

- **Changes to teiHeader:**
    - `fileDesc`
        - `titleStmt` > `respStmt` > `name`
            - Add your editor id to `xml:id` attribute and replace my name with yours
        - `sourceDesc`
            - `bibl`
                - `author` and `persName`
                    - Update `key` attribute according to persNames spreadsheet, update content
                - `date`
                    - Update `when` attribute and content
            - `msDesc`
                - `msContents` > `p`
                    - Short description of the letter (following format in example)
                - `physDesc` > `objectDesc` > `supportDesc` > `extent` > `measure`
                    - Update value of `quantity` attribute and content if the document is more than one page
                    - `hanDesc`
                        - `hands` value = the amount of people writing the letter (almost always only one)
                        - `handNote`
                            - Update `xml:id` with initial code of author (refer to pernames spreadsheet to find it)
                            - `medium` is usually black, let me know if it's written in something else.
                            - For the content of these tags, insert the name of the author followed by the word "handwritten"
                - `history` > `origin`
                    - `origDate` value = date created
                    - `origPlace` > `placeName` value = location created (include value `key` attribute, refer to "placenames" spreadsheet to find it)
    - `encodingDesc` > `editorialDecl` > `interpretation` > `p`
        - If this is a letter that the archive labeled with an incorrect date, you should note that here. Follow this structure: `The archive incorrectly labeled this letter with date 1673-08-01. The correct date is 1673-08-04.`
    - `revistionDesc` > `change`
        - Include the attributes `when` and `who`. Value of `when` should be the date you begin editing. Value of `who` should be your editor code with a pound (`#`) sign in front of it.
        - If you are just creating the file, the value of this element should be: `Initial creation of XML from non-XML electronic files`. If you finish the file, notice at a future point and come back to fix it, you should add another `change` element according to these rules, explaining what change you made.


    
