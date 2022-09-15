<template>
	<el-card>
		<el-form :inline="true" :model="state.queryForm" @keyup.enter="getDataList()">
			<el-form-item>
				<el-input v-model="state.queryForm.projectName" placeholder="项目名"></el-input>
			</el-form-item>
			<el-form-item>
				<el-button @click="getDataList()">查询</el-button>
			</el-form-item>
			<el-form-item>
				<el-button type="primary" @click="addOrUpdateHandle()">新增</el-button>
			</el-form-item>
			<el-form-item>
				<el-button type="danger" @click="deleteBatchHandle()">删除</el-button>
			</el-form-item>
		</el-form>
		<el-table v-loading="state.dataListLoading" :data="state.dataList" border style="width: 100%" @selection-change="selectionChangeHandle">
			<el-table-column type="selection" header-align="center" align="center" width="50"></el-table-column>
			<el-table-column prop="projectName" label="项目名" header-align="center" align="center"></el-table-column>
			<el-table-column prop="projectCode" label="项目标识" header-align="center" align="center"></el-table-column>
			<el-table-column prop="projectPackage" label="项目包名" show-overflow-tooltip header-align="center" align="center"></el-table-column>
			<el-table-column prop="projectPath" label="项目路径" show-overflow-tooltip header-align="center" align="center"></el-table-column>
			<el-table-column label="操作" fixed="right" header-align="center" align="center" width="180">
				<template #default="scope">
					<el-button type="primary" link @click="addOrUpdateHandle(scope.row.id)">修改</el-button>
					<el-button type="primary" link @click="downloadHandle(scope.row.id)">源码下载</el-button>
					<el-button type="primary" link @click="deleteBatchHandle(scope.row.id)">删除</el-button>
				</template>
			</el-table-column>
		</el-table>
		<el-pagination
			:current-page="state.page"
			:page-sizes="state.pageSizes"
			:page-size="state.limit"
			:total="state.total"
			layout="total, sizes, prev, pager, next, jumper"
			@size-change="sizeChangeHandle"
			@current-change="currentChangeHandle"
		>
		</el-pagination>

		<!-- 弹窗, 新增 / 修改 -->
		<add-or-update ref="addOrUpdateRef" @refreshDataList="getDataList"></add-or-update>
		<!-- 源码下载 -->
		<download ref="downloadRef"></download>
	</el-card>
</template>

<script setup lang="ts">
import { useCrud } from '@/hooks'
import { reactive, ref } from 'vue'
import AddOrUpdate from './add-or-update.vue'
import Download from './download.vue'
import { IHooksOptions } from '@/hooks/interface'

const state: IHooksOptions = reactive({
	dataListUrl: '/gen/project/page',
	deleteUrl: '/gen/project',
	queryForm: {
		projectName: ''
	}
})

const addOrUpdateRef = ref()
const addOrUpdateHandle = (id?: number) => {
	addOrUpdateRef.value.init(id)
}

const downloadRef = ref()
const downloadHandle = (id?: number) => {
	downloadRef.value.init(id)
}

const { getDataList, selectionChangeHandle, sizeChangeHandle, currentChangeHandle, deleteBatchHandle } = useCrud(state)
</script>
