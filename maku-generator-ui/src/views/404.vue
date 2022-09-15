<template>
	<div class="layout-error">
		<img src="@/assets/404.png" alt="404" />
		<div>
			<el-button type="primary" @click="onBack">返回</el-button>
			<el-button type="success" @click="onToHome">主页</el-button>
		</div>
	</div>
</template>

<script setup lang="ts">
import { useRouter } from 'vue-router'
const router = useRouter()

const onBack = () => {
	router.back()
}
const onToHome = () => {
	router.replace('/')
}
</script>

<style lang="scss" scoped>
.layout-error {
	img {
		width: 800px;
	}
	display: flex;
	flex-direction: column;
	align-items: center;
}
</style>
