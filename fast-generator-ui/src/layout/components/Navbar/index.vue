<template>
	<div class="navbar-container">
		<div class="navbar-left">
			<Hamburger />
			<Refresh />
		</div>
		<div class="navbar-right">
			<Lang />
			<ComponentSize />
			<a href="https://github.com" target="_blank">
				<svg-icon icon="icon-github-fill"></svg-icon>
			</a>
			<a href="https://baidu.com" target="_blank">
				<svg-icon icon="icon-earth"></svg-icon>
			</a>
			<Fullscreen />
			<User />
		</div>
	</div>
</template>

<script setup lang="ts">
import Hamburger from './components/Hamburger.vue'
import Refresh from './components/Refresh.vue'
import Lang from '@/components/Lang/index.vue'
import ComponentSize from './components/ComponentSize.vue'
import Fullscreen from './components/Fullscreen.vue'
import User from './components/User.vue'
</script>

<style lang="scss" scoped>
.navbar-container {
	height: var(--theme-header-height);
	display: flex;
	align-items: center;
	background: var(--theme-header-bg-color);
	border-bottom: 1px solid var(--theme-border-color-light);
	color: var(--theme-header-text-color);
	::v-deep(.svg-icon) {
		align-items: center;
		cursor: pointer;
		height: var(--theme-header-height);
		line-height: var(--theme-header-height);
		padding: 0 12px;
		svg {
			color: var(--theme-header-text-color) !important;
			font-size: 16px;
		}
		&:hover {
			background: var(--theme-header-hover-color);
		}
	}
}
.navbar-left {
	flex: 1;
	height: inherit;
	display: flex;
	align-items: center;
}
.navbar-right {
	display: flex;
	align-items: center;
	justify-content: flex-end;
	&-link {
		height: 100%;
		display: flex;
		align-items: center;
		white-space: nowrap;
		&-photo {
			width: 25px;
			height: 25px;
			border-radius: 100%;
		}
	}
}
</style>
