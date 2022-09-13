<template>
	<el-container class="layout-container">
		<Sidebar />
		<el-container>
			<el-header class="layout-header">
				<Navbar />
				<Tabs />
			</el-header>
			<el-scrollbar>
				<el-main class="layout-main">
					<el-scrollbar class="layout-scrollbar">
						<el-card class="layout-card">
							<router-view v-slot="{ Component, route }">
								<keep-alive :include="[...store.tabsStore.cachedViews]">
									<component :is="Component" :key="route.name" />
								</keep-alive>
							</router-view>
						</el-card>
					</el-scrollbar>
				</el-main>
			</el-scrollbar>
		</el-container>
	</el-container>
</template>

<script setup lang="ts">
import { RouterView } from 'vue-router'
import store from '@/store'
import Sidebar from '@/layout/components/Sidebar/index.vue'
import Navbar from '@/layout/components/Navbar/index.vue'
import Tabs from '@/layout/components/Tabs/index.vue'
</script>
