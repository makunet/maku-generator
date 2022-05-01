<template>
	<div class="svg-icon">
		<svg :class="`${className}`" :style="`color:${color};`" aria-hidden="true">
			<use :xlink:href="iconName" />
		</svg>
	</div>
</template>

<script setup lang="ts">
import { computed } from 'vue'

const props = defineProps({
	icon: {
		type: String,
		required: true
	},
	color: {
		type: String,
		default: ''
	},
	className: {
		type: String,
		default: ''
	}
})

// https://www.iconfont.cn 图标库需使用前缀 icon- 才能匹配
const iconName = computed(() => `#icon-${props.icon.replace('icon-', '')}`)
</script>

<style scoped>
.svg-icon svg {
	width: 1em;
	height: 1em;
	vertical-align: -0.15em;
	fill: currentColor;
	overflow: hidden;
	flex-shrink: 0;
}
</style>
