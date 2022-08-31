<script lang="ts">
import { defineComponent, h } from 'vue'
import { useRoute, useRouter } from 'vue-router'

export default defineComponent({
	created() {
		const { params, query } = useRoute()
		const { path } = params
		const router = useRouter()
		router.replace({ path: '/' + path, query }).catch(err => {
			console.warn(err)
		})
	},
	render() {
		return h('div')
	}
})
</script>
