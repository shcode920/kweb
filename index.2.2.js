const fs = require('fs');
const path = require('path');
const util = require('util');

const readdir = util.promisify(fs.readdir);
const stat = util.promisify(fs.stat);

const findJs = async (dir) => {
  try {
    const files = await readdir(dir);

    for (const file of files) {
      const fullPath = path.join(dir, file);
      try {
        const fileStat = await stat(fullPath);

        if (fileStat.isDirectory()) {
          await findJsFiles(fullPath);
        } else if (path.extname(fullPath) === '.js') {
          console.log(fullPath);
        }
      } catch (err) {
        console.error(`Error reading file/folder info: ${fullPath}`, err);
      }
    }
  } catch (err) {
    console.error(`Error reading directory: ${dir}`, err);
  }
};

findJs('./test');
