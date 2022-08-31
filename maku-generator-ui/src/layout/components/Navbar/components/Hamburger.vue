<template>
	<div @click="handleClick">
		<svg-icon :icon="icon"></svg-icon>
	</div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import store from '@/store'

const handleClick = () => {
	store.appStore.setSidebarOpened()
}

const icon = computed(() => (store.appStore.sidebarOpened ? 'icon-outdent' : 'icon-indent'))
</script>
