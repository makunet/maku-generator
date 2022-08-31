import { i18n } from '@/i18n'

export const isExternalLink = (path: string): boolean => {
	return /^(https?:|mailto:|tel:)/.test(path)
}

export const validateEmail = (rule: any, value: any, callback: (e?: Error) => any) => {
	const reg =
		/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/

	if (reg.test(value)) {
		callback()
	} else {
		callback(new Error(i18n.global.t('error.email')))
	}
}

export const validatePassword = (rule: any, value: any, callback: (e?: Error) => any) => {
	if (value.length < 6) {
		callback(new Error(i18n.global.t('error.password', { len: 6 })))
	} else {
		callback()
	}
}
