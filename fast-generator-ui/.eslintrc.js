module.exports = {
	root: true,
	env: {
		node: true
	},
	extends: ['plugin:vue/vue3-recommended', 'plugin:prettier/recommended'],
	parser: 'vue-eslint-parser',
	parserOptions: {
		parser: '@typescript-eslint/parser',
		ecmaVersion: 2022,
		ecmaFeatures: {
			jsx: true
		}
	},
	rules: {
		curly: 'error', // 控制语句需要大括号
		'vue/multi-word-component-names': 'off'
	}
}
