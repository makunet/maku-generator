import { createApp } from 'vue'
import ElementPlus from 'element-plus'
import App from './App.vue'
import { createPinia } from 'pinia'
import { registerStore } from './store'
import { router } from './router'
import { i18n } from './i18n'
import 'virtual:svg-icons-register'
import 'xe-utils'
import VXETable from 'vxe-table'
import SvgIcon from '@/components/svg-icon'
import 'vxe-table/lib/style.css'

import '@/icons/iconfont/iconfont'
import 'element-plus/dist/index.css'
import '@/styles/index.scss'

const app = createApp(App)

app.use(createPinia())
// 注册 Pinia
registerStore()
app.use(router)
app.use(i18n)
app.use(SvgIcon)
app.use(ElementPlus)
app.use(VXETable)
app.mount('#app')
