<template>
	<el-dialog v-model="visible" :title="!dataForm.id ? '新增' : '修改'" :close-on-click-modal="false">
		<el-form ref="dataFormRef" :model="dataForm" :rules="dataRules" label-width="100px" @keyup.enter="submitHandle()">
			<el-form-item label="项目名" prop="projectName">
				<el-input v-model="dataForm.projectName" placeholder="项目名"></el-input>
			</el-form-item>
			<el-form-item label="项目标识" prop="projectCode">
				<el-input v-model="dataForm.projectCode" placeholder="项目标识"></el-input>
			</el-form-item>
			<el-form-item label="项目包名" prop="projectPackage">
				<el-input v-model="dataForm.projectPackage" placeholder="项目包名"></el-input>
			</el-form-item>
			<el-form-item label="项目路径" prop="projectPath">
				<el-input v-model="dataForm.projectPath" placeholder="项目路径"></el-input>
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
import { useProjectApi, useProjectSubmitApi } from '@/api/project'

const emit = defineEmits(['refreshDataList'])

const visible = ref(false)
const dataFormRef = ref()

const dataForm = reactive({
	id: '',
	projectName: '',
	projectCode: '',
	projectPackage: '',
	projectPath: ''
})

const init = (id?: number) => {
	visible.value = true
	dataForm.id = ''

	// 重置表单数据
	if (dataFormRef.value) {
		dataFormRef.value.resetFields()
	}

	if (id) {
		getProject(id)
	}
}

const getProject = (id: number) => {
	useProjectApi(id).then(res => {
		Object.assign(dataForm, res.data)
	})
}

const dataRules = ref({
	projectName: [{ required: true, message: '必填项不能为空', trigger: 'blur' }],
	projectCode: [{ required: true, message: '必填项不能为空', trigger: 'blur' }],
	projectPackage: [{ required: true, message: '必填项不能为空', trigger: 'blur' }],
	projectPath: [{ required: true, message: '必填项不能为空', trigger: 'blur' }]
})

// 表单提交
const submitHandle = () => {
	dataFormRef.value.validate((valid: boolean) => {
		if (!valid) {
			return false
		}

		useProjectSubmitApi(dataForm).then(() => {
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
