<template>
	<div>
		<el-form :inline="true" :model="state.queryForm" @keyup.enter="getDataList()">
			<el-form-item>
				<el-input v-model="state.queryForm.tableName" placeholder="表名"></el-input>
			</el-form-item>
			<el-form-item>
				<el-button @click="getDataList()">查询</el-button>
			</el-form-item>
			<el-form-item>
				<el-button type="primary" @click="importHandle()">新增</el-button>
			</el-form-item>
			<el-form-item>
				<el-button type="danger" @click="deleteBatchHandle()">删除</el-button>
			</el-form-item>
		</el-form>
		<el-table v-loading="state.dataListLoading" :data="state.dataList" border style="width: 100%" @selection-change="selectionChangeHandle">
			<el-table-column type="selection" header-align="center" align="center" width="50"></el-table-column>
			<el-table-column prop="tableName" label="表名" header-align="center" align="center"></el-table-column>
			<el-table-column prop="tableComment" label="表说明" header-align="center" align="center"></el-table-column>
			<el-table-column prop="className" label="类名" header-align="center" align="center"></el-table-column>
			<el-table-column prop="createTime" label="创建时间" header-align="center" align="center"></el-table-column>
			<el-table-column label="操作" fixed="right" header-align="center" align="center" width="250">
				<template #default="scope">
					<el-button type="text" size="small" @click="editHandle(scope.row.id)">编辑</el-button>
					<el-button type="text" size="small" @click="generatorHandle(scope.row.id)">生成代码</el-button>
					<el-button type="text" size="small" @click="deleteBatchHandle(scope.row.id)">删除</el-button>
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

		<import ref="importRef" @refreshDataList="getDataList"></import>
		<edit ref="editRef" @refreshDataList="getDataList"></edit>
		<generator ref="generatorRef" @refreshDataList="getDataList"></generator>
	</div>
</template>

<script setup lang="ts" name="DataSource">
import { reactive, ref } from 'vue'
import { IHooksOptions } from '@/hooks/interface'
import { useCrud } from '@/hooks'
import Import from './import.vue'
import Edit from './edit.vue'
import Generator from './generator.vue'

const state: IHooksOptions = reactive({
	dataListUrl: '/gen/table/page',
	deleteUrl: '/gen/table',
	queryForm: {
		tableName: ''
	}
})

const importRef = ref()
const editRef = ref()
const generatorRef = ref()

const importHandle = (id?: number) => {
	importRef.value.init(id)
}

const editHandle = (id?: number) => {
	editRef.value.init(id)
}

const generatorHandle = (id?: number) => {
	generatorRef.value.init(id)
}

const { getDataList, selectionChangeHandle, sizeChangeHandle, currentChangeHandle, deleteBatchHandle } = useCrud(state)
</script>
