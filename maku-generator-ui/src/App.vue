<template>
	<el-config-provider :locale="locale" :size="size">
		<router-view />
	</el-config-provider>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { RouterView } from 'vue-router'
import { useTitle } from '@vueuse/core'
import store from '@/store'
import { useI18n } from 'vue-i18n'
import { messages } from '@/i18n'

const { t } = useI18n()
const locale = computed(() => messages[store.appStore.language].el)
const size = computed(() => store.appStore.componentSize)

// 设置标题
useTitle(t('app.title'))
</script>
