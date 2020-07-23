# Ruby Docs

## Transforming

To transform all xml files in the `xml` directory, run the command `rake letters` in the terminal. This will output all letters as html in the `_letters` directory.

To specify a single xml file to be transformed, locate the file in one of the subdirectories of `xml`. Run the command `rake letters[yearfolder/filename]`, Ex. `rake letters[1672/1672_07_14_mm2os]`. Don't include the file extension on the filename, or the directory name `xml`, just use the year + `/` + the filename.

## Troubleshooting

On Mac, f you get an error "Operation not permitted", follow these instructions to change permissions: <https://osxdaily.com/2018/10/09/fix-operation-not-permitted-terminal-error-macos/>




 