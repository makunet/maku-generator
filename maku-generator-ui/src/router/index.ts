import { createRouter, createWebHashHistory, RouteRecordRaw } from 'vue-router'
import { i18n } from '@/i18n'

export const menuRoutes: RouteRecordRaw[] = [
	{
		path: '/gen/generator',
		name: 'Generator',
		component: () => import('../views/generator/index.vue'),
		meta: {
			title: '代码生成',
			icon: 'icon-fire'
		}
	},
	{
		path: '/gen/datasource',
		name: 'DataSource',
		component: () => import('../views/datasource/index.vue'),
		meta: {
			title: '数据源管理',
			icon: 'icon-database-fill'
		}
	},
	{
		path: '/gen/field-type',
		name: 'FieldType',
		component: () => import('../views/field-type/index.vue'),
		meta: {
			title: '字段类型映射',
			icon: 'icon-menu'
		}
	},
	{
		path: '/gen/base-class',
		name: 'BaseClass',
		component: () => import('../views/base-class/index.vue'),
		meta: {
			title: '基类管理',
			icon: 'icon-cluster'
		}
	},
	{
		path: '/gen/project',
		name: 'ProjectIndex',
		component: () => import('../views/project/index.vue'),
		meta: {
			title: '项目名变更',
			icon: 'icon-edit-square'
		}
	}
]

export const constantRoutes: RouteRecordRaw[] = [
	{
		path: '/redirect',
		component: () => import('../layout/index.vue'),
		children: [
			{
				path: '/redirect/:path(.*)',
				component: () => import('../layout/components/Router/Redirect.vue')
			}
		]
	},
	{
		path: '/',
		component: () => import('../layout/index.vue'),
		redirect: '/home',
		children: [
			{
				path: '/home',
				name: 'Home',
				component: () => import('../views/home.vue'),
				meta: {
					title: i18n.global.t('router.home'),
					affix: true
				}
			},
			...menuRoutes
		]
	},
	{
		path: '/404',
		component: () => import('../views/404.vue')
	},
	{
		path: '/:pathMatch(.*)',
		redirect: '/404'
	}
]

export const router = createRouter({
	history: createWebHashHistory(),
	routes: constantRoutes
})
