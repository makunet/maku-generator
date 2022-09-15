<template>
	<el-container class="layout-container">
		<el-header class="layout-header">
			<Navbar />
		</el-header>
		<el-container>
			<Sidebar />
			<el-main class="layout-main">
				<el-scrollbar class="layout-scrollbar">
					<div class="layout-card">
						<router-view v-slot="{ Component, route }">
							<component :is="Component" :key="route.name" />
						</router-view>
					</div>
				</el-scrollbar>
			</el-main>
		</el-container>
	</el-container>
</template>

<script setup lang="ts">
import { RouterView } from 'vue-router'
import Sidebar from '@/layout/components/Sidebar/index.vue'
import Navbar from '@/layout/components/Navbar/index.vue'
</script>
