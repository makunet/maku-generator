<template>
	<el-dialog v-model="visible" :title="!dataForm.id ? '新增' : '修改'" :close-on-click-modal="false">
		<el-form ref="dataFormRef" :model="dataForm" :rules="dataRules" label-width="120px" @keyup.enter="submitHandle()">
			<el-form-item label="连接名" prop="connName">
				<el-input v-model="dataForm.connName" placeholder="连接名"></el-input>
			</el-form-item>
			<el-form-item prop="dbType" label="数据库类型">
				<el-select v-model="dataForm.dbType" clearable placeholder="数据库类型" style="width: 100%">
					<el-option value="MySQL" label="MySQL"></el-option>
					<el-option value="Oracle" label="Oracle"></el-option>
					<el-option value="PostgreSQL" label="PostgreSQL"></el-option>
					<el-option value="SQLServer" label="SQLServer"></el-option>
          <el-option value="DM" label="达梦8"></el-option>
				</el-select>
			</el-form-item>
			<el-form-item label="数据库URL" prop="connUrl">
				<el-input v-model="dataForm.connUrl" placeholder="数据库URL"></el-input>
			</el-form-item>
			<el-form-item label="用户名" prop="username">
				<el-input v-model="dataForm.username" placeholder="用户名"></el-input>
			</el-form-item>
			<el-form-item label="密码" prop="password">
				<el-input v-model="dataForm.password" placeholder="密码"></el-input>
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
import { useDataSourceApi, useDataSourceSubmitApi } from '@/api/datasource'

const emit = defineEmits(['refreshDataList'])

const visible = ref(false)
const dataFormRef = ref()

const dataForm = reactive({
	id: '',
	dbType: '',
	connName: '',
	connUrl: '',
	username: '',
	password: ''
})

const init = (id?: number) => {
	visible.value = true
	dataForm.id = ''

	// 重置表单数据
	if (dataFormRef.value) {
		dataFormRef.value.resetFields()
	}

	// id 存在则为修改
	if (id) {
		getDataSource(id)
	}
}

const getDataSource = (id: number) => {
	useDataSourceApi(id).then(res => {
		Object.assign(dataForm, res.data)
	})
}

const dataRules = ref({
	dbType: [{ required: true, message: '必填项不能为空', trigger: 'blur' }],
	connName: [{ required: true, message: '必填项不能为空', trigger: 'blur' }],
	connUrl: [{ required: true, message: '必填项不能为空', trigger: 'blur' }],
	username: [{ required: true, message: '必填项不能为空', trigger: 'blur' }],
	password: [{ required: true, message: '必填项不能为空', trigger: 'blur' }]
})

// 表单提交
const submitHandle = () => {
	dataFormRef.value.validate((valid: boolean) => {
		if (!valid) {
			return false
		}

		useDataSourceSubmitApi(dataForm).then(() => {
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
