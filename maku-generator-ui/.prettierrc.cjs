// 参考：https://prettier.io/docs/en/options.html
module.exports = {
	// 超过指定值换行
	printWidth: 150,
	// 制表符宽度
	tabWidth: 2,
	// 使用制表符缩进
	useTabs: true,
	// 句尾不使用分号
	semi: false,
	// 使用单引号
	singleQuote: true,
	// 在 JSX 文件中使用单引号代替双引号
	jsxSingleQuote: true,
	// 在对象或数组最后一个元素后面是否加逗号，可选值"[none：不追加 | es5：追加]
	trailingComma: 'none',
	// 在对象，数组括号与代码之间加空格 "{ foo: bar }"
	bracketSpacing: true,
	// 将多行 JSX 元素的 > 放置于最后一行的末尾，而非换行
	jsxBracketSameLine: true,
	//(x) => {} 箭头函数参数只有一个时是否要有小括号，可选值"[always：(x) => x | avoid：x => x]
	arrowParens: 'avoid',
	// 使用默认的折行标准，可选值"[always|never|preserve]"
	proseWrap: 'preserve',
	// 指定HTML文件的全局空格敏感度，可选值"[css|strict|ignore]"
	htmlWhitespaceSensitivity: 'css',
	// 结尾时换行符，默认值lf，可选值"[auto|lf|crlf|cr]"
	endOfLine: 'auto'
}
