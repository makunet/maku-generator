import service from '@/utils/request'

export const useTableApi = (id: number) => {
	return service.get('/gen/table/' + id)
}

export const useTableSubmitApi = (dataForm: any) => {
	return service.put('/gen/table', dataForm)
}

export const useTableImportSubmitApi = (datasourceId: string, tableNameList: string) => {
	return service.post('/gen/table/import/' + datasourceId, tableNameList)
}

export const useTableFieldSubmitApi = (tableId: number, fieldList: any) => {
	return service.put('/gen/table/field/' + tableId, fieldList)
}

export const useTableSyncApi = (id: number) => {
	return service.post('/gen/table/sync/' + id)
}
