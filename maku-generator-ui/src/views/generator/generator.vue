<template>
	<el-dialog v-model="visible" title="生成代码" :close-on-click-modal="false">
		<el-form ref="dataFormRef" :model="dataForm" :rules="dataRules" label-width="120px" size="small">
			<el-row>
				<el-col :span="12">
					<el-form-item label="表名" prop="tableName">
						<el-input v-model="dataForm.tableName" disabled placeholder="表名"></el-input>
					</el-form-item>
				</el-col>
				<el-col :span="12">
					<el-form-item label="功能名" prop="tableComment">
						<el-input v-model="dataForm.tableComment" placeholder="功能名"></el-input>
					</el-form-item>
				</el-col>
			</el-row>
			<el-row>
				<el-col :span="12">
					<el-form-item label="类名" prop="className">
						<el-input v-model="dataForm.className" placeholder="类名"></el-input>
					</el-form-item>
				</el-col>
				<el-col :span="12">
					<el-form-item prop="baseclassId" label="基类">
						<el-select v-model="dataForm.baseclassId" placeholder="基类" style="width: 100%" clearable>
							<el-option v-for="item in baseClassList" :key="item.id" :label="item.code" :value="item.id"></el-option>
						</el-select>
					</el-form-item>
				</el-col>
			</el-row>
			<el-row>
				<el-col :span="12">
					<el-form-item label="模块名" prop="moduleName">
						<el-input v-model="dataForm.moduleName" placeholder="模块名"></el-input>
					</el-form-item>
				</el-col>
				<el-col :span="12">
					<el-form-item label="子模块名" prop="subModuleName">
						<el-input v-model="dataForm.subModuleName" placeholder="子模块名"></el-input>
					</el-form-item>
				</el-col>
			</el-row>
			<el-row>
				<el-col :span="12">
					<el-form-item label="项目包名" prop="packageName">
						<el-input v-model="dataForm.packageName" placeholder="项目包名"></el-input>
					</el-form-item>
				</el-col>
				<el-col :span="12">
					<el-form-item label="版本号" prop="version">
						<el-input v-model="dataForm.version" placeholder="版本号"></el-input>
					</el-form-item>
				</el-col>
			</el-row>
			<el-row>
				<el-col :span="12">
					<el-form-item label="默认作者" prop="author">
						<el-input v-model="dataForm.author" placeholder="默认作者"></el-input>
					</el-form-item>
				</el-col>
				<el-col :span="12">
					<el-form-item label="作者邮箱" prop="email">
						<el-input v-model="dataForm.email" placeholder="作者邮箱"></el-input>
					</el-form-item>
				</el-col>
			</el-row>
			<el-form-item label="后端生成路径" prop="backendPath">
				<el-input v-model="dataForm.backendPath" placeholder="后端生成路径"></el-input>
			</el-form-item>
			<el-form-item label="前端生成路径" prop="frontendPath">
				<el-input v-model="dataForm.frontendPath" placeholder="前端生成路径"></el-input>
			</el-form-item>
		</el-form>
		<template #footer>
			<el-button @click="visible = false">取消</el-button>
			<el-button type="primary" @click="submitHandle()">保存</el-button>
			<el-button type="danger" @click="generatorHandle()">生成代码</el-button>
		</template>
	</el-dialog>
</template>

<script setup lang="ts">
import { reactive, ref } from 'vue'
import { ElMessage } from 'element-plus/es'
import { useBaseClassListApi } from '@/api/baseClass'
import { useGeneratorApi, useTableInfoApi, useTableSubmitApi } from '@/api/generator'

const emit = defineEmits(['refreshDataList'])

const visible = ref(false)
const dataFormRef = ref()
const baseClassList = ref<any[]>([])
const dataForm = reactive({
	id: '',
	baseclassId: '',
	backendPath: '',
	frontendPath: '',
	packageName: '',
	email: '',
	author: '',
	version: '',
	subModuleName: '',
	moduleName: '',
	className: '',
	tableComment: '',
	tableName: ''
})

const init = (id: number) => {
	visible.value = true
	dataForm.id = ''

	// 重置表单数据
	if (dataFormRef.value) {
		dataFormRef.value.resetFields()
	}

	getBaseClassList()
	getTableInfo(id)
}

const getBaseClassList = () => {
	useBaseClassListApi().then(res => {
		baseClassList.value = res.data
	})
}

const getTableInfo = (id: number) => {
	useTableInfoApi(id).then(res => {
		Object.assign(dataForm, res.data)
	})
}

const dataRules = ref({
	tableName: [{ required: true, message: '必填项不能为空', trigger: 'blur' }],
	tableComment: [{ required: true, message: '必填项不能为空', trigger: 'blur' }],
	className: [{ required: true, message: '必填项不能为空', trigger: 'blur' }],
	packageName: [{ required: true, message: '必填项不能为空', trigger: 'blur' }],
	author: [{ required: true, message: '必填项不能为空', trigger: 'blur' }],
	backendPath: [{ required: true, message: '必填项不能为空', trigger: 'blur' }],
	frontendPath: [{ required: true, message: '必填项不能为空', trigger: 'blur' }]
})

// 保存
const submitHandle = () => {
	dataFormRef.value.validate((valid: boolean) => {
		if (!valid) {
			return false
		}

		useTableSubmitApi(dataForm).then(() => {
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

// 生成代码
const generatorHandle = () => {
	dataFormRef.value.validate((valid: boolean) => {
		if (!valid) {
			return false
		}

		useGeneratorApi(dataForm).then(() => {
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

<style lang="scss" scoped>
.generator-code .el-dialog__body {
	padding: 15px 30px 0 20px;
}
</style>
