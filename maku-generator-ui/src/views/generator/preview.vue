<template>
  <!-- 预览界面 -->
  <el-dialog v-model="preview.open" draggable :close-on-click-modal="false" :title="preview.title" append-to-body>
    <el-tabs v-model="preview.activeName">
      <el-tab-pane
          v-for="(item, key) in preview.data"
          :label="item.fileName"
          :name="key"
          :key="key"
      >
        <code-m v-model="item.content" height="610"></code-m>
      </el-tab-pane>
    </el-tabs>
  </el-dialog>
</template>

<script setup lang="ts">
import {reactive, ref} from 'vue'
import {ElLoading} from 'element-plus'
import {usePreviewApi} from "@/api/generator";
import CodeM from "@/components/codemirror/CodeMirror.vue";

const preview = reactive({
  open: false,
  title: "代码预览",
  data: {},
  activeName: ref(0)
});
const init = async (tableId?: number) => {
  const loadingInstance = ElLoading.service({fullscreen: true});
  try {
    let resData = await usePreviewApi(tableId);
    preview.activeName = 0;
    preview.data = resData.data;
    preview.open = true;
  } finally {
    loadingInstance.close();
  }

}
defineExpose({
  init
})
</script>
