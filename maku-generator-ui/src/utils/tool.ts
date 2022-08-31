import type { App, Plugin } from 'vue'

// 把路径转换成驼峰命名
export const pathToCamel = (path: string): string => {
	return path.replace(/\/(\w)/g, (all, letter) => letter.toUpperCase())
}

// 转换文件大小格式
export const convertSizeFormat = (size: number): string => {
	const unit = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB']
	let index = Math.floor(Math.log(size) / Math.log(1024))
	let newSize = size / Math.pow(1024, index)

	// 保留的小数位数
	return newSize.toFixed(2) + ' ' + unit[index]
}

// 获取svg图标(id)列表
export const getIconList = (): string[] => {
	const rs: string[] = []
	const list = document.querySelectorAll('svg symbol')
	for (let i = 0; i < list.length; i++) {
		rs.push(list[i].id)
	}
	return rs
}

// 获取字典Label
export const getDictLabel = (dictList: any[], dictType: string, dictValue: string) => {
	const type = dictList.find((element: any) => element.dictType === dictType)
	if (type) {
		const val = type.dataList.find((element: any) => element.dictValue === dictValue + '')
		if (val) {
			return val.dictLabel
		} else {
			return dictValue
		}
	} else {
		return dictValue
	}
}

// 获取字典数据列表
export function getDictDataList(dictList: any[], dictType: string) {
	const type = dictList.find((element: any) => element.dictType === dictType)
	if (type) {
		return type.dataList
	} else {
		return []
	}
}

// 全局组件安装
export const withInstall = <T>(component: T, alias?: string) => {
	const comp = component as any
	comp.install = (app: App) => {
		app.component(comp.name || comp.displayName, component)
		if (alias) {
			app.config.globalProperties[alias] = component
		}
	}
	return component as T & Plugin
}
