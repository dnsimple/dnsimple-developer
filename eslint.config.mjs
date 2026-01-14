import js from '@eslint/js';
import pluginVue from 'eslint-plugin-vue';
import globals from 'globals';

export default [
  {
    ignores: ['dist/', 'output/', 'node_modules/', 'tmp/'],
  },
  js.configs.recommended,
  ...pluginVue.configs['flat/recommended'],
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
      'jest/valid-title': 'off', // To be removed
      'jest/no-standalone-expect': 'off', // To be removed
      'jest/no-disabled-tests': 'off', // To be removed
      'jest/no-conditional-expect': 'off', // To be removed
      'jest/valid-expect': 'off', // To be removed
      'jest/no-test-prefixes': 'off', // To be removed
      'jest/no-export': 'off', // To be removed
      'jest/no-alias-methods': 'off', // To be removed
      'jest/expect-expect': 'off', // To be removed
      'jest/valid-describe-callback': 'off', // To be removed
      'vue/require-v-for-key': 'off', // To be removed
      'vue/no-reserved-component-names': 'off', // To be removed
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
