<template>
	<el-dialog v-model="visible" title="导入数据库表" :close-on-click-modal="false">
		<el-form ref="dataFormRef" :model="dataForm" :rules="dataRules" label-width="120px">
			<el-form-item label="数据源" prop="datasourceId">
				<el-select v-model="dataForm.datasourceId" style="width: 100%" placeholder="请选择数据源" @change="getTableInfoList">
					<el-option label="默认数据源" value="0"></el-option>
					<el-option v-for="ds in dataForm.datasourceList" :key="ds.id" :label="ds.connName" :value="ds.id"> </el-option>
				</el-select>
			</el-form-item>
			<el-form-item label="选择表" prop="tableInfo">
				<el-select
					v-model="dataForm.tableInfo"
					value-key="tableName"
					:disabled="!dataForm.showTableSelect"
					style="width: 100%"
					placeholder="请选择表名"
				>
					<el-option v-for="tableInfo in dataForm.tableInfoList" :key="tableInfo.tableName" :label="tableInfo.tableName" :value="tableInfo">
					</el-option>
				</el-select>
			</el-form-item>
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
import { useImportTableSubmitApi, useTableInfoListApi } from '@/api/generator'

const emit = defineEmits(['refreshDataList'])

const visible = ref(false)
const dataFormRef = ref()

const dataForm = reactive({
	id: '',
	datasourceId: '',
	datasourceList: [] as any,
	tableInfoList: [] as any,
	tableInfo: {
		tableName: ''
	},
	showTableSelect: false
})

const init = () => {
	visible.value = true
	dataForm.id = ''

	// 重置表单数据
	if (dataFormRef.value) {
		dataFormRef.value.resetFields()
	}

	getDataSourceList()
}

const getDataSourceList = () => {
	useDataSourceListApi().then(res => {
		dataForm.datasourceList = res.data
	})
}

const getTableInfoList = () => {
	dataForm.showTableSelect = false
	dataForm.tableInfo.tableName = ''
	useTableInfoListApi(dataForm.datasourceId).then(res => {
		dataForm.tableInfoList = res.data
		dataForm.showTableSelect = true
	})
}

const validateTable = (rule: any, value: any, callback: (e?: Error) => any) => {
	if (!dataForm.tableInfo.tableName) {
		return callback(new Error('必填项不能为空'))
	}
	callback()
}

const dataRules = ref({
	datasourceId: [{ required: true, message: '必填项不能为空', trigger: 'blur' }],
	tableInfo: [{ validator: validateTable, trigger: 'blur' }]
})

// 表单提交
const submitHandle = () => {
	dataFormRef.value.validate((valid: boolean) => {
		if (!valid) {
			return false
		}

		useImportTableSubmitApi(dataForm.tableInfo).then(() => {
			ElMessage.success({
				message: '操作成功',
				duration: 500,
				onClose: () => {
					visible.value = false
					emit('refreshDataList')
				}
			})
		})
	})
}

defineExpose({
	init
})
</script>
