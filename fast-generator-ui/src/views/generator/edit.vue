<template>
	<el-dialog v-model="visible" title="编辑" :close-on-click-modal="false" :fullscreen="true">
		<vxe-table
			ref="xTable"
			border
			row-key
			class="sortable-row-gen"
			:data="tableData"
			:checkbox-config="{ checkStrictly: true }"
			:edit-config="{ trigger: 'click', mode: 'cell' }"
		>
			<vxe-column type="seq" width="35"></vxe-column>
			<vxe-column width="34" title="拖动">
				<template #default>
					<span class="drag-btn">
						<i class="vxe-icon--menu"></i>
					</span>
				</template>
				<template #header>
					<el-tooltip class="item" effect="dark" content="按住后可以上下拖动排序" placement="top-start">
						<i class="vxe-icon--question"></i>
					</el-tooltip>
				</template>
			</vxe-column>
			<vxe-colgroup title="字段" align="center">
				<vxe-column field="columnName" width="140" title="字段名"></vxe-column>
				<vxe-column field="attrName" width="140" title="属性名" :edit-render="{ name: 'input' }"></vxe-column>
				<vxe-column field="columnType" width="140" title="字段类型"></vxe-column>
				<vxe-column field="attrType" width="140" title="属性类型">
					<template #default="{ row }">
						<vxe-select v-model="row.attrType">
							<vxe-option v-for="item in typeList" :key="item.value" :value="item.value" :label="item.label"></vxe-option>
						</vxe-select>
					</template>
				</vxe-column>
				<vxe-column field="columnComment" width="140" title="字段说明" :edit-render="{ name: 'input' }"></vxe-column>
			</vxe-colgroup>
			<vxe-colgroup title="列表" align="center">
				<vxe-column field="list" width="75" title="列表">
					<template #default="{ row }">
						<vxe-checkbox v-model="row.list"></vxe-checkbox>
					</template>
				</vxe-column>
				<vxe-column field="query" width="75" title="查询">
					<template #default="{ row }">
						<vxe-checkbox v-model="row.query"></vxe-checkbox>
					</template>
				</vxe-column>
				<vxe-column field="queryType" width="140" title="查询方式">
					<template #default="{ row }">
						<vxe-select v-model="row.queryType">
							<vxe-option v-for="item in queryList" :key="item.value" :value="item.value" :label="item.label"></vxe-option>
						</vxe-select>
					</template>
				</vxe-column>
			</vxe-colgroup>
			<vxe-colgroup title="表单" align="center">
				<vxe-column field="form" width="70" title="表单">
					<template #default="{ row }">
						<vxe-checkbox v-model="row.form"></vxe-checkbox>
					</template>
				</vxe-column>
				<vxe-column field="required" width="70" title="必填">
					<template #default="{ row }">
						<vxe-checkbox v-model="row.required"></vxe-checkbox>
					</template>
				</vxe-column>
				<vxe-column field="formType" width="140" title="表单类型">
					<template #default="{ row }">
						<vxe-select v-model="row.formType">
							<vxe-option v-for="item in formTypeList" :key="item.value" :value="item.value" :label="item.label"></vxe-option>
						</vxe-select>
					</template>
				</vxe-column>
				<vxe-column field="dictName" width="140" title="字典名称" :edit-render="{ name: 'input' }"></vxe-column>
			</vxe-colgroup>
		</vxe-table>
		<template #footer>
			<el-button @click="visible = false">取消</el-button>
			<el-button type="primary" @click="submitHandle()">确定</el-button>
		</template>
	</el-dialog>
</template>

<script setup lang="ts">
import { nextTick, reactive, ref } from 'vue'
import { ElMessage } from 'element-plus/es'
import Sortable from 'sortablejs'
import { useTableFieldSubmitApi, useTableInfoApi } from '@/api/generator'
import { useFieldTypeListApi } from '@/api/fieldType'

const emit = defineEmits(['refreshDataList'])
const visible = ref(false)
const dataFormRef = ref()
const xTable = ref() as any
const sortable = ref() as any

let typeList = [] as any[]
const tableId = ref()
const tableData = ref([])
const queryList = reactive([
	{ label: '=', value: '=' },
	{ label: '!=', value: '!=' },
	{ label: '>', value: '>' },
	{ label: '>=', value: '>=' },
	{ label: '<', value: '<' },
	{ label: '<=', value: '<=' },
	{ label: 'like', value: 'like' },
	{ label: 'left like', value: 'left like' },
	{ label: 'right like', value: 'right like' }
])

const formTypeList = reactive([
	{ label: '单行文本', value: 'text' },
	{ label: '多行文本', value: 'textarea' },
	{ label: '富文本编辑器', value: 'editor' },
	{ label: '下拉框', value: 'select' },
	{ label: '单选按钮', value: 'radio' },
	{ label: '复选框', value: 'checkbox' },
	{ label: '日期', value: 'date' },
	{ label: '日期时间', value: 'datetime' }
])

const init = (id: number) => {
	visible.value = true
	tableId.value = id

	// 重置表单数据
	if (dataFormRef.value) {
		dataFormRef.value.resetFields()
	}

	rowDrop()
	getTable(id)
	getFieldTypeList()
}

const rowDrop = () => {
	nextTick(() => {
		const el: any = window.document.querySelector('.body--wrapper>.vxe-table--body tbody')
		sortable.value = Sortable.create(el, {
			handle: '.drag-btn',
			onEnd: (e: any) => {
				const { newIndex, oldIndex } = e
				const currRow = tableData.value.splice(oldIndex, 1)[0]
				tableData.value.splice(newIndex, 0, currRow)
			}
		})
	})
}

const getTable = (id: number) => {
	useTableInfoApi(id).then(res => {
		tableData.value = res.data.fields
	})
}

const getFieldTypeList = () => {
	useFieldTypeListApi().then(res => {
		typeList = []
		// 设置属性类型值
		res.data.forEach((item: any) => typeList.push({ label: item, value: item }))
		// 增加Object类型
		typeList.push({ label: 'Object', value: 'Object' })
	})
}

// 表单提交
const submitHandle = () => {
	useTableFieldSubmitApi(tableId.value, tableData.value).then(() => {
		ElMessage.success({
			message: '操作成功',
			duration: 500,
			onClose: () => {
				visible.value = false
				emit('refreshDataList')
			}
		})
	})
}

defineExpose({
	init
})
</script>

<style lang="scss">
.sortable-row-gen .drag-btn {
	cursor: move;
	font-size: 12px;
}
.sortable-row-gen .vxe-body--row.sortable-ghost,
.sortable-row-gen .vxe-body--row.sortable-chosen {
	background-color: #dfecfb;
}
</style>
