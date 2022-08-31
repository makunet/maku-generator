import { appStore } from './modules/app'
import { tabsStore } from './modules/tabs'

const store: any = {}

export const registerStore = () => {
	store.appStore = appStore()
	store.tabsStore = tabsStore()
}

export default store
