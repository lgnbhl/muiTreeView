const webpack = require('webpack');
const path = require('path');

const config = {
  entry: './src/index.js',
  mode: 'production',
  output: {
    path: path.join(__dirname, '..', 'inst', 'www', 'muiTreeView'),
    filename: 'x-tree-view.js',
  },
  resolve: { extensions: ['.js', '.jsx', '.ts', '.tsx'] },
  module: {
    rules: [
      {
        test: /\.(js|jsx|ts|tsx)$/,
        exclude: /node_modules/,
        use: ['babel-loader'],
      },
      {
        // MUI now ships .mjs (strict ESM) files that use extension-less imports
        // (e.g. react-transition-group/TransitionGroupContext). webpack 5 treats
        // .mjs as fully specified and refuses to resolve them; relax that here.
        test: /\.m?js$/,
        resolve: { fullySpecified: false },
      },
      {
        test: /\.css$/,
        use: ['style-loader', 'css-loader'],
      },
    ],
  },
  // The tree view is bundled as a single Shiny dependency and cannot be
  // code-split here; disable the size budget warnings.
  performance: { hints: false },
  externals: {
    'react': 'jsmodule["react"]',
    'react-dom': 'jsmodule["react-dom"]',
    '@mui/material': 'jsmodule["@mui/material"]',
    '@mui/system': 'jsmodule["@mui/system"]',
    '@mui/utils': 'jsmodule["@mui/utils"]',
    // Share muiMaterial's single theming/styling instances so the tree view reads the
    // same ThemeContext and emotion cache (otherwise ThemeProvider/sx theming is
    // silently ignored). @mui/x-tree-view deep-imports @mui/system subpaths (e.g.
    // @mui/system/ThemeProvider, /createStyled, /cssVars) that webpack bundles —
    // and those subpaths `require("@mui/private-theming")` and
    // `require("@mui/styled-engine")` as bare specifiers. Externalizing those two
    // leaf singletons (which muiMaterial exposes) makes the bundled subpaths
    // resolve to muiMaterial's single ThemeContext object, so a ThemeProvider
    // rendered by muiMaterial reaches the tree view even though @mui/system itself
    // is still partly bundled. styled is a default import (must be the function);
    // react/cache are consumed via named imports (must be the namespace). The
    // `.default || self` guard makes styled work whether muiMaterial exposes the
    // function or a {default} namespace.
    '@mui/private-theming': 'jsmodule["@mui/private-theming"]',
    '@mui/styled-engine': 'jsmodule["@mui/styled-engine"]',
    '@emotion/react': 'jsmodule["@emotion/react"]',
    '@emotion/styled': '(jsmodule["@emotion/styled"].default || jsmodule["@emotion/styled"])',
    '@emotion/cache': 'jsmodule["@emotion/cache"]'
  },
  plugins: [new webpack.DefinePlugin({ 'process.env': '{}' })],
};

module.exports = config;
