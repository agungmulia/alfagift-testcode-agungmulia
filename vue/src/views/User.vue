<template lang="">
    <div v-if="deleteConfirmation" class="fixed inset-0 bg-white bg-opacity-30 flex items-center justify-center z-10">
        <div class="bg-white w-80 md:w-1/2 px-6 py-6 rounded shadow-lg">
            <div class="w-full flex justify-center">
                <h2 class="text-2xl mb-4">Hapus data user?</h2>
            </div>
            <div class="flex justify-end">
            <button type="button" @click.prevent="deleteConfirmation = false" class="mr-2 bg-gray-600 hover:bg-gray-800 duration-300 text-white px-4 py-2 rounded">
                Cancel
            </button>
            <button type="button" @click.prevent="deleteUser(deleteId)" class="bg-red-700 hover:bg-red-900 duration-500 text-white px-4 py-2 rounded">
                Delete
            </button>
            </div>
        </div>
    </div>
    <!-- Dialog -->
    <div v-if="isDialogOpen" class="fixed inset-0 bg-white bg-opacity-30 flex items-center justify-center z-10">
      <div class="bg-white w-80 md:w-1/2 px-6 py-6 rounded shadow-lg">
        <div class="w-full flex justify-center">
            <h2 class="text-2xl mb-4">{{ dialogTitle }}</h2>
        </div>

        <!-- Form -->
        <form class="grid gap-y-2" @submit.prevent="submitForm">
            <div v-if="Object.keys(error).length !== 0" class="rounded grid bg-red-200 py-2 px-4">
                <h1 class="text-red-900 text-2xl">Perhatian!</h1>
                <span v-for="(item, index) in error" :key="item" class="text-red-800">{{item}}</span>
            </div>
          <div class="">
            <label for="name" class="block mb-2">Nama</label>
            <input v-model="formData.nama" id="name" type="text" class="w-full border px-4 py-2 rounded">
          </div>

          <div class="">
            <label for="email" class="block mb-2">Email</label>
            <input v-model="formData.email" id="email" type="email" class="w-full border px-4 py-2 rounded">
          </div>

          <div class="">
            <label for="jenisKelamin" class="block mb-2">Jenis Kelamin</label>
            <select
                id="jenis_kelamin"
                v-model="formData.jenisKelamin"
                name="jenis_kelamin"
                autocomplete="jenis_kelamin"
                class="w-full border px-4 py-2 rounded"
            >
                <option>
                    Laki-laki
                </option>
                <option>
                    Perempuan
                </option>
            </select>
          </div>
          <div class="">
            <label for="alamat" class="block mb-2">Alamat</label>
            <input v-model="formData.alamat" id="alamat" type="text" class="w-full border px-4 py-2 rounded">
          </div>
          <div class="">
            <label for="tglLahir" class="block mb-2">Tanggal Lahir</label>
            <input v-model="formData.tglLahir" id="tglLahir" type="date" class="w-full border px-4 py-2 rounded">
          </div>
          <div class="">
            <label for="userRole" class="block mb-2">Role</label>
            <select
                id="userRole"
                v-model="formData.userRole"
                name="userRole"
                autocomplete="userRole"
                class="w-full border px-4 py-2 rounded"
            >
                <option
                    v-for="item in roleData"
                    :key="item.id"
                    :value="item"
                >
                    {{ item.roleName }}
                </option>
            </select>
          </div>
          <div class="flex justify-end">
            <button type="button" @click.prevent="isDialogOpen = false" class="mr-2 bg-gray-600 hover:bg-gray-800 duration-300 text-white px-4 py-2 rounded">
              Cancel
            </button>
            <button v-if="dialogTitle == 'Tambah Data User'" type="submit" class="bg-blue-700 hover:bg-blue-900 duration-500 text-white px-4 py-2 rounded">
              Tambah
            </button>
            <button v-else type="submit" class="bg-blue-700 hover:bg-blue-900 duration-500 text-white px-4 py-2 rounded">
              Ubah
            </button>
          </div>
        </form>
      </div>
    </div>
    <Loading v-if="loading" />
    <div v-else>
        <div class="-mx-4 md:mx-0 flex justify-end">
            <div>
                <button
                    type="button"
                    @click.prevent="showDialog('add',null)"
                    class="inline-flex items-center justify-center rounded-md border border-transparent bg-gray-600 px-4 py-2 text-sm font-medium text-white shadow-sm hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-offset-2 sm:w-auto"
                >
                    Tambah Data
                </button>
            </div>
        </div>
        <div class="flex flex-col">
            <div class="-my-2 -mx-4 overflow-x-auto sm:-mx-6 lg:-mx-8">
                <div
                    class="inline-block min-w-full py-2 align-middle md:px-6 lg:px-8"
                >
                    <div class=" flex items-center my-4 space-x-2">
                                <input
                                    type="text"
                                    v-model="search"
                                    placeholder="Cari User"
                                    class="focus:ring-gray-500 px-4 focus:border-gray-500 py-2 w-full border border-gray-700 rounded"
                                />
                                <button @click.prevent="cariUser" type="button" class=" px-5 py-2   bg-gray-600 hover:bg-gray-900 duration-200 rounded text-white">Cari</button>
                            </div>
                    <div
                        class="overflow-hidden shadow-sm ring-1 ring-black ring-opacity-5 rounded-lg"
                    >
                        <table
                            class="table-auto w-full divide-y divide-gray-300"
                        >
                            <thead
                                class="bg-gray-50 hidden lg:table-header-group"
                            >
                                <tr>
                                    <th
                                        scope="col"
                                        class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-6"
                                    >
                                        Nama
                                    </th>
                                    <th
                                        scope="col"
                                        class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900"
                                    >
                                        Jenis Kelamin
                                    </th>
                                    <th
                                        scope="col"
                                        class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900"
                                    >
                                        Tanggal Lahir
                                    </th>

                                    <th
                                        scope="col"
                                        class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900"
                                    >
                                        Alamat
                                    </th>

                                    <th
                                        scope="col"
                                        class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900"
                                    >
                                        Email
                                    </th>
                                    <th
                                        scope="col"
                                        class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900"
                                    >
                                        Role
                                    </th>

                                    <th
                                        scope="col"
                                        class="relative py-3.5 pl-3 pr-4 sm:pr-6"
                                    >
                                        <span class="sr-only"
                                            >Ubah Data</span
                                        >
                                    </th>
                                </tr>
                            </thead>
                            <tbody
                                class="divide-y divide-gray-200 bg-white"
                            >
                                <tr
                                    v-for="(person, itemIdx) in userData.data.content"
                                    :key="person.id"
                                    class="animate-fade-in-down"
                                    :style="{
                                        animationDelay: `${itemIdx * 0.1}s`,
                                    }"
                                >
                                    <td
                                        class="py-4 pl-4 pr-3 text-sm sm:pl-6"
                                    >
                                        <div class="text-gray-900 text-lg">
                                            {{ person.nama }}
                                        </div>
                                        <div class="lg:hidden">
                                            <div>
                                                Jenis Kelamin:
                                                <span v-if="person.jenisKelamin == 'Laki-laki'" class="text-blue-700">{{ person.jenisKelamin }}</span>
                                                <span v-else class="text-pink-700">{{ person.jenisKelamin }}</span>
                                            </div>
                                            <div>
                                                Tanggal Lahir:
                                                {{
                                                    new Date(
                                                        person.tglLahir
                                                    ).toLocaleDateString(
                                                        "id-ID",
                                                        {
                                                            day: "numeric",
                                                            month: "long",
                                                            year: "numeric",
                                                        }
                                                    )
                                                }}
                                            </div>
                                            <div>
                                                Alamat:
                                                {{ person.alamat }}
                                            </div>
                                            <div>
                                                Email:
                                                {{ person.email }}
                                            </div>
                                            <div>
                                                Role:
                                                {{ person.userRole.roleName }}
                                            </div>
                                            <div class="space-y-2 mt-2">
                                                <div
                                                    class="space-x-2 w-full justify-center items-center flex"
                                                >
                                                    <button
                                                            @click.prevent="deleteModal(person.id)"
                                                            type="button"
                                                            
                                                        >
                                                            <TrashIcon class="h-6 w-6 text-red-900 hover:text-red-700 duration-300"/>

                                                        </button>
                                                    <button
                                                        type="button"
                                                        @click.prevent="showDialog('edit',person.id)"
                                                        class="bg-gray-600 w-full text-white px-4 py-2 rounded-lg shadow-sm text-xs duration-200 hover:bg-gray-900"
                                                    >
                                                        Ubah Data
                                                    </button>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td
                                        class="px-3 py-4 text-sm text-gray-500 hidden lg:table-cell"
                                    >
                                        <span v-if="person.jenisKelamin == 'Laki-laki'" class="text-blue-700">{{ person.jenisKelamin }}</span>
                                                <span v-else class="text-pink-700">{{ person.jenisKelamin }}</span>
                                    </td>
                                    <td
                                        class="px-3 text-xs py-4 text-gray-500 hidden lg:table-cell"
                                    >
                                        {{
                                            new Date(
                                                person.tglLahir
                                            ).toLocaleDateString(
                                                "id-ID",
                                                {
                                                    day: "numeric",
                                                    month: "long",
                                                    year: "numeric",
                                                }
                                            )
                                        }}
                                    </td>
                                    <td
                                        class="px-3 text-xs py-4 text-gray-500 hidden lg:table-cell"
                                    >
                                        {{ person.alamat }}
                                    </td>
                                    <td
                                        class="px-3 text-xs py-4 text-gray-500 hidden lg:table-cell"
                                    >
                                        {{ person.email }}
                                    </td>
                                    <td
                                        class="px-3 text-xs py-4 text-gray-500 hidden lg:table-cell"
                                    >
                                        {{ person.userRole.roleName }}
                                    </td>

                                    <td
                                        class="relative whitespace-nowrap py-4 pl-3 pr-4 text-right text-sm font-medium sm:pr-6 hidden lg:table-cell"
                                    >
                                        <div
                                            class="space-x-2 items-center flex"
                                        >
                                            <button
                                                    @click.prevent="deleteModal(person.id)"
                                                    type="button"
                                                    
                                                >
                                                    <TrashIcon class="h-6 w-6 text-red-900 hover:text-red-700 duration-300"/>

                                                </button>
                                            <button
                                                type="button"
                                                @click.prevent="showDialog('edit',person.id)"
                                                class="bg-gray-600 text-white px-4 py-2 rounded-lg shadow-sm text-xs duration-200 hover:bg-gray-900"
                                            >
                                                Ubah Data
                                            </button>
                                            
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="flex justify-center mt-5">
                        <nav
                        class="relative z-0 inline-flex justify-center rounded-md shadow-sm -space-x-px"
                        aria-label="Pagination"
                        >
                            <button @click.prevent="getPage(userData.data.number-1)"  :disabled="userData.data.number == 0" :class="[userData.data.pageable.pageNumber != 0 ? 'px-4 py-2 text-white rounded-l bg-gray-700' : 'px-4 py-2 text-white rounded-l bg-gray-500']">
                                Prev
                            </button>
                            <span class="border px-3 py-2 h-full">{{userData.data.number+1}}</span>
                            <button @click.prevent="getPage(userData.data.number+1)" :disabled="userData.data.totalPages == 1 || (userData.data.number+1) == userData.data.totalPages"  :class="[userData.data.totalPages == 1 || (userData.data.number+1) == userData.data.totalPages ? 'px-4 py-2 text-white rounded-r bg-gray-500' : 'px-4 py-2 text-white rounded-r bg-gray-700']">
                                Next
                            </button>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script setup>
import { computed, ref, watch } from "vue";
import Loading from "../components/LoadingComponent.vue";
import store from "../store/index.js";
import { TrashIcon } from '@heroicons/vue/24/outline';
const loading = computed(() => store.state.users.loading);
const userData = computed(() => store.state.users);
const roleData = computed(() => store.state.userRoles.data);
const error = ref({})
const value = 2;
const formData = ref ({
    id: null,
    name: null,
    jenisKelamin: null,
    tgllahir: null,
    alamat: null,
    email: null,
    userRole: {
        id: null, roleName:null
    },
})

const isDialogOpen = ref(false);
const deleteConfirmation = ref(false);
const deleteId = ref('');
const dialogTitle = ref('');
const pageValue = ref();
const search = ref();

function showDialog(type,data){
    isDialogOpen.value = true;
    error.value = {};
    if(type == "add"){
        dialogTitle.value = 'Tambah Data User';
        this.formData = {};
    }else{
        store.dispatch("findUser", data).then((response) => {
            this.formData = response.data;
        });
        dialogTitle.value = 'Edit Data User';
    }
}

function deleteModal(value) {
    deleteConfirmation.value = true
    deleteId.value = value
}

function deleteUser(value) {
    store.dispatch("deleteUser", value).then(
        store.dispatch("getUsers", 0));
    store.commit("notify", {
        type: "success",
        message: "Data berhasil dihapus!"
    });
    deleteConfirmation.value = false
}

function submitForm(){
    if(formData.value.id){
        store.dispatch("ubahUser", formData.value).then(res => {
            console.log("res");
            console.log(res);
            if (res.request.status == 200) {
                isDialogOpen.value = false;
                store.dispatch("getUsers", 0);
                store.commit("notify", {
                    type: "success",
                    message: 'Ubah data user berhasil!',
                });
            } else {
                store.commit("notify", {
                    type: "error",
                    message: 'error',
                });
            }
        })
    }else{
        store.dispatch("tambahUser", formData.value).then(res => {
            if (res.request.status == 200) {
                isDialogOpen.value = false;
                store.dispatch("getUsers", 0);
                store.commit("notify", {
                    type: "success",
                    message: 'Tambah data user berhasil!',
                });
            } else{
                error.value = res.response.data.messages;
                const responData = computed(() => res.response.data.messages);

            }
        })
    }
}

function getPage(link) {
    store.dispatch("getUsers", link);
}

function getValueArray(value) {
    return Array.from({ length: value }, (_, index) => index + 1);
}

function cariUser() {
    store.dispatch("cariUser", { search: search.value })
}

store.dispatch("getUsers",0);
store.dispatch("getUserRole");
</script>
<style lang="">
    
</style>