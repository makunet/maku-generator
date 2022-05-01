<template>
	<el-dropdown class="avatar-container" trigger="hover">
		<div class="avatar-wrapper">
			<el-avatar shape="circle" :size="25" src="/favicon.ico"></el-avatar>
			<span>admin</span>
			<el-icon class="el-icon--right"><ArrowDown /></el-icon>
		</div>
		<template #dropdown>
			<el-dropdown-menu class="user-dropdown">
				<el-dropdown-item> <a href="#">MAKU</a> </el-dropdown-item>
			</el-dropdown-menu>
		</template>
	</el-dropdown>
</template>

<script setup lang="ts">
import { ArrowDown } from '@element-plus/icons-vue'
</script>

<style lang="scss" scoped>
.avatar-container {
	display: flex;
	align-items: center;
	justify-content: flex-end;
	height: var(--theme-header-height);
	.avatar-wrapper {
		display: flex;
		align-items: center;
		white-space: nowrap;
		cursor: pointer;
		padding: 0 8px;
		color: var(--theme-header-text-color);
		span {
			margin-left: 6px;
		}
	}
}
</style>
