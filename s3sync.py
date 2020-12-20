import boto3
from pathlib import Path


def defineContentType(suffix):
  contentType = ''
  if suffix == ".js":
    contentType = "application/javascript"
  elif suffix == ".css":
    contentType = "text/css"
  elif suffix == ".html":
    contentType = "text/html"
  return contentType


s3 = boto3.client('s3')
staticFolder = Path("staticsite")
pathList = [['staticsite/index.html', 'index.html', 'text/html']]
requiredFolders = ["static/css", "static/images", "static/js"]

for x in staticFolder.iterdir():
  if x.is_dir():
    if x.name == "static":
      for folder in requiredFolders:
        subFolder = staticFolder / folder
        for y in subFolder.iterdir():
          contentType = defineContentType(y.suffix)
          pathList.append([y.as_posix(), "{}/{}".format(folder, y.name), contentType])
    else:
      for y in x.iterdir():
          contentType = defineContentType(y.suffix)
          pathList.append([y.as_posix(), "{}/{}".format(x.name, y.name), contentType])

for path in pathList:
  s3.upload_file(path[0], "chrxr-static-website-bucket", path[1], ExtraArgs={'ContentType': path[2]})
