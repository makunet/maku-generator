/**
 * window.localStorage 浏览器永久缓存
 * @method setItem 设置缓存
 * @method getItem 获取缓存
 * @method removeItem 移除缓存
 * @method clear 移除全部缓存
 */
export const Storage = {
	setItem(key: string, value: any) {
		window.localStorage.setItem(key, JSON.stringify(value))
	},
	getItem(key: string) {
		let json: any = window.localStorage.getItem(key)
		return JSON.parse(json)
	},
	removeItem(key: string) {
		window.localStorage.removeItem(key)
	},
	clear() {
		window.localStorage.clear()
	}
}

/**
 * window.sessionStorage 浏览器临时缓存
 * @method setItem 设置缓存
 * @method getItem 获取缓存
 * @method removeItem 移除缓存
 * @method clear 移除全部缓存
 */
export const SessionStorage = {
	setItem(key: string, value: any) {
		window.sessionStorage.setItem(key, JSON.stringify(value))
	},
	getItem(key: string) {
		let json: any = window.sessionStorage.getItem(key)
		return JSON.parse(json)
	},
	removeItem(key: string) {
		window.sessionStorage.removeItem(key)
	},
	clear() {
		window.sessionStorage.clear()
	}
}
