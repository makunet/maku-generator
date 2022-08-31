import { createI18n } from 'vue-i18n'
import cache from '@/utils/cache'

// element-plus 国际化文件
import element_zh_cn from 'element-plus/lib/locale/lang/zh-cn'
import element_en from 'element-plus/lib/locale/lang/en'

// 框架 国际化文件
const zh_cn = import.meta.globEager('./lang/**/zh-CN.ts')
const en_us = import.meta.globEager('./lang/**/en-US.ts')

// 加载 lang 文件夹下的国际化
export const loadLang = (modules: Record<string, any>) => {
	const messages: { [key: string]: string } = {}

	Object.keys(modules).forEach(module => {
		Object.assign(messages, { ...modules[module].default })
	})
	return messages
}

export const messages: { [key: string]: any } = {
	'zh-CN': {
		langName: '简体中文',
		...loadLang(zh_cn),
		el: {
			...element_zh_cn
		}
	},
	'en-US': {
		langName: 'English',
		...loadLang(en_us),
		el: {
			...element_en
		}
	}
}

// 返回当前 Language
function getLanguage() {
	return cache.getLanguage()
}

export const i18n = createI18n({
	locale: getLanguage(),
	messages
})
