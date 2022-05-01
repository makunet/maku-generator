import { Storage } from '@/utils/storage'
import CacheKey from '@/utils/cache/key'
// 缓存
class Cache {
	getSidebarOpened = (): boolean => {
		return Storage.getItem(CacheKey.SidebarOpenedKey) || false
	}

	setSidebarOpened = (value: boolean) => {
		Storage.setItem(CacheKey.SidebarOpenedKey, value)
	}
	getLanguage = (): string => {
		return Storage.getItem(CacheKey.LangKey) || 'zh-CN'
	}

	setLanguage = (value: string) => {
		Storage.setItem(CacheKey.LangKey, value)
	}

	getComponentSize = (): string => {
		return Storage.getItem(CacheKey.ComponentSizeKey) || 'default'
	}

	setComponentSize = (value: string) => {
		Storage.setItem(CacheKey.ComponentSizeKey, value)
	}
}

export default new Cache()
