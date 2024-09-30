const fs = require('fs').promises;
const path = require('path');

const express = require('express');
const bodyParser = require('body-parser');

const app = express();

const ensureDirectoryExistence = async (filePath) => {
  const dirname = path.dirname(filePath);
  try {
    await fs.access(dirname);
  } catch (error) {
    await fs.mkdir(dirname, { recursive: true });
  }
};

app.use(bodyParser.urlencoded({ extended: false }));

app.use(express.static('public'));
app.use('/feedback', express.static('feedback'));

app.get('/', (req, res) => {
  const filePath = path.join(__dirname, 'pages', 'feedback.html');
  res.sendFile(filePath);
});

app.get('/exists', (req, res) => {
  const filePath = path.join(__dirname, 'pages', 'exists.html');
  res.sendFile(filePath);
});

app.post('/create', async (req, res) => {
  const title = req.body.title;
  const content = req.body.text;

  const adjTitle = title.toLowerCase();

  const tempFilePath = path.join(__dirname, 'temp', adjTitle + '.txt');
  const finalFilePath = path.join(__dirname, 'feedback', adjTitle + '.txt');

  console.log('TEST');

  try {
    await ensureDirectoryExistence(tempFilePath);
    await ensureDirectoryExistence(finalFilePath);
    await fs.writeFile(tempFilePath, content);

    try {
      // Trying to access the file
      await fs.access(finalFilePath); 
      res.redirect('/exists');
    } catch {
      await fs.copyFile(tempFilePath, finalFilePath);
      await fs.unlink(tempFilePath);
      res.redirect('/');
    }
  } catch (error) {
    console.error('Error handling create request:', error);
    res.status(500).send('Server error occurred');
  }
  
});

//app.listen(8080);
app.listen(process.env.PORT);
