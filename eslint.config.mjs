import js from '@eslint/js';
import globals from 'globals';

export default [
  {
    ignores: ['dist/', 'output/', 'node_modules/', 'tmp/'],
  },
  js.configs.recommended,
  {
    languageOptions: {
      ecmaVersion: 'latest',
      sourceType: 'module',
      globals: {
        ...globals.browser,
      },
    },
    rules: {
      semi: ['error', 'always'], // Enforce semicolons
      curly: ['error', 'multi'], // Enforce curly braces only for multi-line blocks
    },
  },
  {
    files: ['webpack.config.js', '.github/**/*.js'],
    languageOptions: {
      sourceType: 'commonjs',
      globals: {
        ...globals.node,
      },
    },
  },
];
