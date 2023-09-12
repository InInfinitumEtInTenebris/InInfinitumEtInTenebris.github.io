<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Offline PDF and Image Viewer</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <div id="viewer"></div>
</body>
</html>

body {
  margin: 0;
  padding: 0;
}

#viewer {
  width: 100%;
  height: 100%;
}

const viewer = new PDFJS.Viewer({
  element: document.getElementById("viewer")
});

const tesseract = require("tesseract.js");

function ocr(image) {
  return tesseract.recognize(image);
}

viewer.on("pagerendered", (page) => {
  const image = page.getImage();
  const text = ocr(image);

  console.log(text);
});

viewer.open("path/to/pdf.pdf");

