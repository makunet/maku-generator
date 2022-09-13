<template>
	<el-dialog v-model="visible" title="源码下载" :close-on-click-modal="false">
		<el-form ref="dataFormRef" :model="dataForm" :rules="dataRules" label-width="100px" @keyup.enter="submitHandle()">
			<el-row>
				<el-col :span="12">
					<el-form-item label="项目名" prop="projectName">
						<el-input v-model="dataForm.projectName" placeholder="项目名" disabled></el-input>
					</el-form-item>
				</el-col>
				<el-col :span="12">
					<el-form-item label="项目路径" prop="projectPath">
						<el-input v-model="dataForm.projectPath" placeholder="项目路径" disabled></el-input>
					</el-form-item>
				</el-col>
			</el-row>
			<el-row>
				<el-col :span="12">
					<el-form-item label="项目标识" prop="projectCode">
						<el-input v-model="dataForm.projectCode" placeholder="项目标识" disabled></el-input>
					</el-form-item>
				</el-col>
				<el-col :span="12">
					<el-form-item label="项目包名" prop="projectPackage">
						<el-input v-model="dataForm.projectPackage" placeholder="项目包名" disabled></el-input>
					</el-form-item>
				</el-col>
			</el-row>

			<el-divider> 变更后的信息 </el-divider>

			<el-form-item label="项目名" prop="modifyProjectName">
				<el-input v-model="dataForm.modifyProjectName" placeholder="项目名"></el-input>
			</el-form-item>
			<el-row>
				<el-col :span="12">
					<el-form-item label="项目标识" prop="modifyProjectCode">
						<el-input v-model="dataForm.modifyProjectCode" placeholder="项目标识"></el-input>
					</el-form-item>
				</el-col>
				<el-col :span="12">
					<el-form-item label="项目包名" prop="modifyProjectPackage">
						<el-input v-model="dataForm.modifyProjectPackage" placeholder="项目包名"></el-input>
					</el-form-item>
				</el-col>
			</el-row>
			<el-row>
				<el-col :span="12">
					<el-form-item label="排除文件" prop="exclusions">
						<el-input v-model="dataForm.exclusions" placeholder="排除文件"></el-input>
					</el-form-item>
				</el-col>
				<el-col :span="12">
					<el-form-item label="变更文件" prop="modifySuffix">
						<el-input v-model="dataForm.modifySuffix" placeholder="变更文件"></el-input>
					</el-form-item>
				</el-col>
			</el-row>
		</el-form>
		<template #footer>
			<el-button @click="visible = false">取消</el-button>
			<el-button type="primary" @click="submitHandle()">下载</el-button>
		</template>
	</el-dialog>
</template>

<script setup lang="ts">
import { reactive, ref } from 'vue'
import { useProjectApi, useProjectSubmitApi, useSourceDownloadApi } from '@/api/project'

const visible = ref(false)
const dataFormRef = ref()

const dataForm = reactive({
	id: '',
	projectName: '',
	projectCode: '',
	projectPackage: '',
	projectPath: '',
	modifyProjectName: '',
	modifyProjectCode: '',
	modifyProjectPackage: '',
	exclusions: '',
	modifySuffix: ''
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
	modifyProjectName: [{ required: true, message: '必填项不能为空', trigger: 'blur' }],
	modifyProjectCode: [{ required: true, message: '必填项不能为空', trigger: 'blur' }],
	modifyProjectPackage: [{ required: true, message: '必填项不能为空', trigger: 'blur' }],
	exclusions: [{ required: true, message: '必填项不能为空', trigger: 'blur' }],
	modifySuffix: [{ required: true, message: '必填项不能为空', trigger: 'blur' }]
})

// 表单提交
const submitHandle = () => {
	dataFormRef.value.validate(async (valid: boolean) => {
		if (!valid) {
			return false
		}

		// 先保存
		await useProjectSubmitApi(dataForm)

		// 源码下载
		useSourceDownloadApi(dataForm.id)
		visible.value = false
	})
}

defineExpose({
	init
})
</script>
