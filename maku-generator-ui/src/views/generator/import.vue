<template>
	<el-dialog v-model="visible" title="导入数据库表" :close-on-click-modal="false" draggable>
		<el-form ref="dataFormRef" :model="dataForm">
			<el-form-item label="数据源" prop="datasourceId">
				<el-select v-model="dataForm.datasourceId" style="width: 100%" placeholder="请选择数据源" @change="getTableList">
					<el-option label="默认数据源" value="0"></el-option>
					<el-option v-for="ds in dataForm.datasourceList" :key="ds.id" :label="ds.connName" :value="ds.id"> </el-option>
				</el-select>
			</el-form-item>
			<el-table :data="dataForm.tableList" border style="width: 100%" :max-height="400" @selection-change="selectionChangeHandle">
				<el-table-column type="selection" header-align="center" align="center" width="60"></el-table-column>
				<el-table-column prop="tableName" label="表名" header-align="center" align="center"></el-table-column>
				<el-table-column prop="tableComment" label="表说明" header-align="center" align="center"></el-table-column>
			</el-table>
		</el-form>
		<template #footer>
			<el-button @click="visible = false">取消</el-button>
			<el-button type="primary" @click="submitHandle()">确定</el-button>
		</template>
	</el-dialog>
</template>

<script setup lang="ts">
import { reactive, ref } from 'vue'
import { ElMessage } from 'element-plus/es'
import { useDataSourceListApi } from '@/api/datasource'
import { useTableImportSubmitApi } from '@/api/table'
import { useDataSourceTableListApi } from '@/api/datasource'

const emit = defineEmits(['refreshDataList'])

const visible = ref(false)
const dataFormRef = ref()

const dataForm = reactive({
	id: '',
	tableNameListSelections: [] as any,
	datasourceId: '',
	datasourceList: [] as any,
	tableList: [] as any,
	table: {
		tableName: ''
	}
})

// 多选
const selectionChangeHandle = (selections: any[]) => {
	dataForm.tableNameListSelections = selections.map((item: any) => item['tableName'])
}

const init = () => {
	visible.value = true
	dataForm.id = ''

	// 重置表单数据
	if (dataFormRef.value) {
		dataFormRef.value.resetFields()
	}

	dataForm.tableList = []

	getDataSourceList()
}

const getDataSourceList = () => {
	useDataSourceListApi().then(res => {
		dataForm.datasourceList = res.data
	})
}

const getTableList = () => {
	dataForm.table.tableName = ''
	useDataSourceTableListApi(dataForm.datasourceId).then(res => {
		dataForm.tableList = res.data
	})
}

// 表单提交
const submitHandle = () => {
	const tableNameList = dataForm.tableNameListSelections ? dataForm.tableNameListSelections : []
	if (tableNameList.length === 0) {
		ElMessage.warning('请选择记录')
		return
	}

	useTableImportSubmitApi(dataForm.datasourceId, tableNameList).then(() => {
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
