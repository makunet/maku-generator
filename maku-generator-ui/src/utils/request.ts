import axios from 'axios'
import qs from 'qs'
import { ElMessage } from 'element-plus'

// axios实例
const service = axios.create({
	baseURL: import.meta.env.VITE_API_URL as any,
	timeout: 60000,
	headers: { 'Content-Type': 'application/json;charset=UTF-8' }
})

// 请求拦截器
service.interceptors.request.use(
	(config: any) => {
		// 追加时间戳，防止GET请求缓存
		if (config.method?.toUpperCase() === 'GET') {
			config.params = { ...config.params, t: new Date().getTime() }
		}

		if (Object.values(config.headers).includes('application/x-www-form-urlencoded')) {
			config.data = qs.stringify(config.data)
		}

		return config
	},
	error => {
		return Promise.reject(error)
	}
)

// 响应拦截器
service.interceptors.response.use(
	response => {
		if (response.status !== 200) {
			return Promise.reject(new Error(response.statusText || 'Error'))
		}

		const res = response.data
		// 响应成功
		if (res.code === 0) {
			return res
		}

		// 错误提示
		ElMessage.error(res.msg)

		return Promise.reject(new Error(res.msg || 'Error'))
	},
	error => {
		ElMessage.error(error.message)
		return Promise.reject(error)
	}
)

// 导出 axios 实例
export default service
