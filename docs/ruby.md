# Ruby Docs

## Transforming

**All Letters**:

To transform all xml files in the `xml` directory, run the command `rake letters` in the terminal. 
This will output all letters as html in the `_letters` directory.

**Single Letter**:

To specify a single xml file be transformed, locate the file in one of the subdirectories of `xml` (`1672`, `1673`, `1674`, or `1675`). 
Run the command `rake letters[yearfolder/filename]`, Ex. `rake letters[1672/1672_07_14_mm2os]`. 
Don't include the file extension (`.xml`) on the filename, or the directory name `xml`, just use `year` + `/` + `filename`. 
Only the file you specify will undergo the transformation and be output in the `_letters` directory.

## Troubleshooting

On Mac, if you get an error "Operation not permitted" when you run the rake command, follow these instructions to change permissions: <https://osxdaily.com/2018/10/09/fix-operation-not-permitted-terminal-error-macos/>




 