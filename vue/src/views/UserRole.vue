<template lang="">
    
    <div class=" py-4 px-4 border-gray-700 border rounded">
        <Loading v-if="loading" class=" w-full h-fit"/>
        <div v-else>
            <div v-if="Object.keys(roleData).length !== 0">
                <span>Current role:</span>
                <div class=" grid gap-4 grid-cols-3">
                    <div class=" text-white hover:bg-blue-500 duration-500 cursor-pointer rounded w-full py-2 flex justify-center bg-blue-400" v-for="(item) in roleData" :key="item.id">
                        {{item.roleName}}
                    </div>
                </div>
            </div>
            <div v-else >
                Data Kosong
            </div>
        </div>
    </div>
    <div class="my-4 py-4 grid gap-y-2 justify-items-center">
        <span class=" text-2xl">Tambah Role</span>
        <div class="flex gap-x-2">
            <input v-model="roleName" class="border px-4 h-8 rounded border-gray-600 w-full" type="text" placeholder="Masukkan Role" name="role" id="role"/>
            <button @click.prevent="tambahUserRole" class="rounded bg-gray-900 px-4 text-white" type="button">Tambah</button>
        </div>
    </div>
</template>
<script setup>
import Loading from '../components/LoadingComponent.vue'
import { computed, ref, watch } from "vue";
import { useRoute, useRouter } from "vue-router";
import store from "../store/index.js";

const loading = computed(() => store.state.userRoles.loading);
const roleData = computed(() => store.state.userRoles.data);

const roles = [
    { id: 1, userRole: 'QA' },
    { id: 2, userRole: 'Admin' },
    { id: 3, userRole: 'Developer' },
]

let roleName = ref("")

function tambahUserRole() {
    store.dispatch("tambahUserRole", { roleName: roleName.value }).then(res => {
        if (res.request.status == 200) {
            store.commit("notify", {
                type: "success",
                message: 'Tambah user role berhasil!',
            });
            store.dispatch("getUserRole");
        } else {
            store.commit("notify", {
                type: "error",
                message: 'Tambah user role gagal',
            });
        }
    });
}

store.dispatch("getUserRole");
</script>