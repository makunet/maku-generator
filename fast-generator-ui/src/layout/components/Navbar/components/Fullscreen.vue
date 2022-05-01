<template>
	<svg-icon :icon="isFullscreen ? 'icon-compress' : 'icon-expend'" @click="toggle" />
</template>

<script setup lang="ts">
import { useFullscreen } from '@vueuse/core'

const { isFullscreen, toggle } = useFullscreen()
</script>
