<template>
	<el-aside class="layout-sidebar" :class="sidebarClass">
		<Logo />
		<Menu />
	</el-aside>
</template>

<script setup lang="ts">
import store from '@/store'
import Logo from './components/Logo.vue'
import Menu from './components/Menu.vue'
import { computed } from 'vue'

const sidebarClass = computed(() => {
	const sidebarOpened = store.appStore.sidebarOpened ? 'aside-expend' : 'aside-compress'
	return sidebarOpened + ' sidebar-dark'
})
</script>
