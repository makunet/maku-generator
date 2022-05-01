<template>
	<el-dropdown trigger="click" @command="componentSizeChange">
		<svg-icon icon="icon-font-size"></svg-icon>
		<template #dropdown>
			<el-dropdown-menu>
				<el-dropdown-item command="large" :disabled="componentSize === 'large'">{{ $t('app.large') }}</el-dropdown-item>
				<el-dropdown-item command="default" :disabled="componentSize === 'default'">{{ $t('app.default') }}</el-dropdown-item>
				<el-dropdown-item command="small" :disabled="componentSize === 'small'">{{ $t('app.small') }}</el-dropdown-item>
			</el-dropdown-menu>
		</template>
	</el-dropdown>
</template>

<script setup lang="ts">
import store from '@/store'
import { computed } from 'vue'

const componentSize = computed(() => store.appStore.componentSize)
const componentSizeChange = (size: string) => {
	store.appStore.setComponentSize(size)
}
</script>
