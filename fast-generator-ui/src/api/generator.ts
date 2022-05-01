import service from '@/utils/request'

export const useTableInfoApi = (id: number) => {
	return service.get('/gen/table/' + id)
}

export const useTableInfoListApi = (id: string) => {
	return service.get('/gen/datasource/table/list/' + id)
}

export const useImportTableSubmitApi = (dataForm: any) => {
	return service.post('/gen/datasource/table', dataForm)
}

export const useTableSubmitApi = (dataForm: any) => {
	return service.post('/gen/table', dataForm)
}

export const useGeneratorApi = (dataForm: any) => {
	return service.post('/gen/generator', dataForm)
}

export const useTableFieldSubmitApi = (tableId: number, tableData: any) => {
	return service.put('/gen/table/field/' + tableId, tableData)
}
