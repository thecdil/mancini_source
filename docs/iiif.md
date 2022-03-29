# IIIF derivative creation workflow for Mancini project

Import photos to [Wax](https://github.com/minicomp/wax) theme:
- create a folder for each letter (titled with letter id) in `_data/raw_images/mancini/` (first delete any old folders in this folder). Add each letter's images to its respective folder
- update the waxmancini.csv in _data with the new letter photo information
- delete the `img/derivatives/` folder

 Run [bundle exec rake wax:derivatives:iiif mancini](https://minicomp.github.io/wiki/wax/running-the-tasks/derivatives/#waxderivativesiiif), then copy over derivatives to this project following these steps:

Copy and paste json files to repository (location: /img/derivatives/iiif/):
- 1 manifest.json per item into /img/derivatives/iiif/[item folder name]/
- multiple json files (one for each image) per item into annotation folder
- multiple json files (one for each image) per item into canvas folder
- In `/collection/mancini.json`, find and replace `absolute_url` with `relative_url`. Then copy and paste manifests from `/collection/mancini.json` into mancini_source `/img/derivatives/iiif/collection/mancini.json` (total--1 for the whole collection)
- multiple folders, each with an image name + info.json for each folder into images folder (**Do not copy over the actual images into the images folder in the repository. The derivatives will be stored on the Library web server instead (see below)**)
- 1 json per item named after item + first image in series into sequence folder

Copy and paste folders with image derivatives to the Library's web server (https://www.lib.uidaho.edu/digital/objects/mancini/iiif/images/):
- multiple folders (one folder for each image) per item into the images folder

Right click on the /img/derivatives/iiif/ folder in the repository.
Select the "Find in folder..." option.
Do a series of find and replaces **in the following order**:

Find:  
```
json",
                  "@id": "{{ '/' | absolute_url }}img/derivatives/iiif/images
```

Replace:  
```
json",
                  "@id": "{{ '/' | relative_url }}img/derivatives/iiif/images
```

Find: `{{ '/' | absolute_url }}img/derivatives/iiif/images`
Replace: `{{ site.digital-objects }}/iiif/images`

Find: `{{ '/' | absolute_url }}img/derivatives/iiif/sequence`
Replace: `{{ '/' | relative_url }}img/derivatives/iiif/sequence`

Find: `{{ '/' | absolute_url }}img/derivatives/iiif/canvas`
Replace: `{{ '/' | relative_url }}img/derivatives/iiif/canvas`

Find: `{{ '/' | absolute_url }}img/derivatives/iiif/annotation`
Replace: `{{ '/' | relative_url }}img/derivatives/iiif/annotation`

Find: `{{ '/' | absolute_url }}img/derivatives/iiif`
Replace: `{{ '/' | relative_url }}img/derivatives/iiif`