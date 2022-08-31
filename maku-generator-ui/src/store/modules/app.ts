import { defineStore } from 'pinia'
import cache from '@/utils/cache'

export const appStore = defineStore('appStore', {
	state: () => ({
		// sidebar 是否展开
		sidebarOpened: cache.getSidebarOpened(),
		// 国际化
		language: cache.getLanguage(),
		// 组件大小
		componentSize: cache.getComponentSize()
	}),
	actions: {
		setSidebarOpened() {
			this.sidebarOpened = !this.sidebarOpened
			cache.setSidebarOpened(this.sidebarOpened)
		},
		setLanguage(locale: string) {
			this.language = locale
			cache.setLanguage(locale)
		},
		setComponentSize(size: string) {
			this.componentSize = size
			cache.setComponentSize(size)
		}
	}
})
