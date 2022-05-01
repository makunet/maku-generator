<template>
	<el-sub-menu v-if="menu.children?.length > 0" :key="menu.path" :index="menu.path">
		<template #title>
			<svg-icon :icon="menu.meta.icon"></svg-icon>
			<span>{{ menu.meta.title }}</span>
		</template>
		<menu-item v-for="sub in menu.children" :key="sub.path" :menu="sub"></menu-item>
	</el-sub-menu>
	<el-menu-item v-else :key="menu.path" :index="menu.path">
		<svg-icon :icon="menu.meta.icon"></svg-icon>
		<template #title>{{ menu.meta.title }}</template>
	</el-menu-item>
</template>

<script setup lang="ts">
import { PropType } from 'vue'
import { RouteRecordRaw } from 'vue-router'

defineProps({
	menu: {
		type: Object as PropType<RouteRecordRaw>,
		required: true
	}
})
</script>
