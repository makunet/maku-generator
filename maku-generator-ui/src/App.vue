<template>
	<el-config-provider :locale="zh_cn">
		<router-view />
	</el-config-provider>
</template>

<script setup lang="ts">
import zh_cn from 'element-plus/lib/locale/lang/zh-cn'
import { RouterView } from 'vue-router'
import { useTitle } from '@vueuse/core'

// 设置标题
useTitle('Maku Generator')
</script>
