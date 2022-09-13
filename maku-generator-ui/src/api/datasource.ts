import service from '@/utils/request'

export const useDataSourceTestApi = (id: Number) => {
	return service.get('/gen/datasource/test/' + id)
}

export const useDataSourceApi = (id: Number) => {
	return service.get('/gen/datasource/' + id)
}

export const useDataSourceListApi = () => {
	return service.get('/gen/datasource/list')
}

export const useDataSourceSubmitApi = (dataForm: any) => {
	if (dataForm.id) {
		return service.put('/gen/datasource', dataForm)
	} else {
		return service.post('/gen/datasource', dataForm)
	}
}

export const useDataSourceTableListApi = (id: string) => {
	return service.get('/gen/datasource/table/list/' + id)
}
