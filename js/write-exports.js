// Write the React component names exported by the bundled @mui/x-tree-view to
// inst/components.txt. The manifest ships with the R package and is checked by
// tests/testthat/test-js-exports.R, so a JS upgrade that renames or removes a
// component fails the R test suite instead of rendering blank in the browser.
// Runs automatically after `yarn build` (see package.json).
const fs = require('fs');
const path = require('path');

const treeView = require('@mui/x-tree-view');
const components = Object.keys(treeView)
  // Components have a second lowercase letter (RichTreeView); this excludes
  // ALL_CAPS constants (e.g. internal constants).
  .filter((key) => /^[A-Z][a-z]/.test(key))
  .filter((key) => !key.startsWith('Unstable_'))
  .sort();

const outFile = path.join(__dirname, '..', 'inst', 'components.txt');
fs.writeFileSync(outFile, components.join('\n') + '\n');
console.log(`Wrote ${components.length} component names to ${outFile}`);
