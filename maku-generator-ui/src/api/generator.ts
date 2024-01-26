import service from '@/utils/request'

// 生成代码（zip压缩包）
export const useDownloadApi = (tableIds: any[]) => {
	location.href = import.meta.env.VITE_API_URL + '/gen/generator/download?tableIds=' + tableIds.join(',')
}

// 生成代码（自定义目录）
export const useGeneratorApi = (tableIds: any[]) => {
	return service.post('/gen/generator/code', tableIds)
}

//代码预览
export const usePreviewApi = (tableId: any) => {
	return service.get('/gen/generator/preview?tableId=' + tableId)
}
