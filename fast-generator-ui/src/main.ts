import { createApp } from 'vue'
import App from './App.vue'
import { createPinia } from 'pinia'
import { registerStore } from './store'
import { router } from './router'
import { i18n } from './i18n'
import 'virtual:svg-icons-register'
import 'xe-utils'
import VXETable from 'vxe-table'
import 'vxe-table/lib/style.css'

import '@/icons/iconfont/iconfont'
import '@/styles/index.scss'
import 'element-plus/theme-chalk/src/message.scss'
import 'element-plus/theme-chalk/src/message-box.scss'

const app = createApp(App)

app.use(createPinia())
// 注册 Pinia
registerStore()
app.use(router)
app.use(i18n)
app.use(VXETable)
app.mount('#app')
