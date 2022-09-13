import service from '@/utils/request'

export const useProjectApi = (id: number) => {
	return service.get('/gen/project/' + id)
}

export const useProjectSubmitApi = (dataForm: any) => {
	if (dataForm.id) {
		return service.put('/gen/project', dataForm)
	} else {
		return service.post('/gen/project', dataForm)
	}
}

// 源码下载
export const useSourceDownloadApi = (id: string) => {
	location.href = import.meta.env.VITE_API_URL + '/gen/project/download/' + id
}
