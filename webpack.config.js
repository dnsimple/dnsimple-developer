const path = require('path');
const CopyPlugin = require('copy-webpack-plugin');
const { VueLoaderPlugin } = require('vue-loader')

module.exports = {
  mode: 'production',
  entry: './src/index.js',
  output: {
    path: path.resolve(__dirname, 'dist')
  },
  module: {
    rules: [
      {
        test: /\.vue$/,
        loader: 'vue-loader'
      },
    ],
  },
  plugins: [
    new CopyPlugin({
      patterns: [
        { from: 'node_modules/highlightjs/styles/github.css', to: 'highlightjs/styles/github.css' },
        { from: 'node_modules/tachyons/css/tachyons.min.css', to: 'tachyons/css/tachyons.min.css' },
        { from: 'node_modules/@fortawesome/fontawesome-free/css/all.min.css', to: 'fontawesome/css/all.min.css' },
        { from: 'node_modules/@fortawesome/fontawesome-free/webfonts', to: 'fontawesome/webfonts', globOptions: { ignore: ['*.svg'] } },
      ]
    }),
    new VueLoaderPlugin(),
  ],
};
