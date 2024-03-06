<template>
	<!-- 预览界面 -->
	<el-drawer v-model="preview.visible" title="编辑" :size="1200" :with-header="false">
		<el-tabs v-model="preview.activeName" tab-position="left">
			<el-tab-pane v-for="(item, key) in preview.data" :key="key" :label="item.fileName" :name="key">
				<code-mirror v-model="item.content" :height="680"></code-mirror>
			</el-tab-pane>
		</el-tabs>
	</el-drawer>
</template>

<script setup lang="ts">
import { reactive, ref } from 'vue'
import { ElLoading } from 'element-plus'
import { usePreviewApi } from '@/api/generator'
import CodeMirror from '@/components/codemirror/CodeMirror.vue'

const preview = reactive({
	visible: false,
	title: '代码预览',
	data: {},
	activeName: ref(0)
})
const init = async (tableId?: number) => {
	const loadingInstance = ElLoading.service({ fullscreen: true })
	try {
		let resData = await usePreviewApi(tableId)
		preview.activeName = 0
		preview.data = resData.data
		preview.visible = true
	} finally {
		loadingInstance.close()
	}
}
defineExpose({
	init
})
</script>
