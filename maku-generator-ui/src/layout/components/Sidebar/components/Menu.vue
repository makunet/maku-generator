<template>
	<el-scrollbar>
		<el-menu :default-active="defaultActive" background-color="transparent" :collapse-transition="false" mode="vertical" router>
			<menu-item v-for="menu in menuRoutes" :key="menu.path" :menu="menu"></menu-item>
		</el-menu>
	</el-scrollbar>
</template>

<script setup lang="ts">
import MenuItem from './MenuItem.vue'
import { useRoute } from 'vue-router'
import { computed } from 'vue'
import { menuRoutes } from '@/router'

const route = useRoute()

const defaultActive = computed(() => {
	const { path } = route
	return path
})
</script>
