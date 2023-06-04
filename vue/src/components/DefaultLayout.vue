<template>
    <!--
    This example requires updating your template:

    ```
    <html class="h-full bg-gray-100">
    <body class="h-full">
    ```
  -->
    <div class="min-h-full">
        <Disclosure as="nav" class="bg-gray-800" v-slot="{ open }">
            <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                <div class="flex h-16 items-center justify-between">
                 
                        
                        <div class="hidden md:block">
                            <div class="flex items-baseline space-x-4">
                                <router-link v-for="item in navigation" :key="item.name" :to="item.to"
                                     active-class="bg-gray-900 text-white" :class="[
                                             this.$route.name === item.to.name
                                                 ? ''
                                                 : 'text-gray-300 hover:bg-gray-700 hover:text-white',
                                             'block px-3 py-2 rounded-md text-base font-medium',
                                         ]">{{ item.name }}</router-link>
                            </div>
                        </div>
               
                    <div class="-mr-2 flex md:hidden">
                        <!-- Mobile menu button -->
                        <DisclosureButton
                            class="inline-flex items-center justify-center rounded-md bg-gray-800 p-2 text-gray-400 hover:bg-gray-700 hover:text-white focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800">
                            <span class="sr-only">Open main menu</span>
                            <Bars3Icon v-if="!open" class="block h-6 w-6" aria-hidden="true" />
                            <XMarkIcon v-else class="block h-6 w-6" aria-hidden="true" />
                        </DisclosureButton>
                    </div>
                </div>
            </div>

            <DisclosurePanel class="md:hidden fixed bg-gray-700 w-full">
                <div class="space-y-1 px-2 pb-3 pt-2 sm:px-3">
                    <router-link v-for="item in navigation" :key="item.name" :to="item.to"
                                         active-class="bg-gray-900 text-white" :class="[
                                                 this.$route.name === item.to.name
                                                     ? ''
                                                     : 'text-gray-300 hover:bg-gray-700 hover:text-white',
                                                 'block px-3 py-2 rounded-md text-base font-medium',
                                             ]">{{ item.name }}</router-link>
                </div>
            </DisclosurePanel>
        </Disclosure>


            <div class="mx-auto max-w-7xl py-6 px-6 lg:px-8">
                <router-view :key="$route.path"></router-view>
            </div>
  
    </div>
    <NotificationComponent />
</template>

<script setup>
import  NotificationComponent  from "../components/NotificationComponent.vue";
import { Disclosure, DisclosureButton, DisclosurePanel, Menu, MenuButton, MenuItem, MenuItems } from '@headlessui/vue'
import { Bars3Icon, BellIcon, XMarkIcon } from '@heroicons/vue/24/outline'

const user = {
    name: 'Tom Cook',
    email: 'tom@example.com',
    imageUrl:
        'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80',
}
const navigation = [
    { name: "Role Master", to: { name: "Role" } },
    { name: "User Master", to: { name: "User" } },
]
const userNavigation = [
    { name: 'Your Profile', href: '#' },
    { name: 'Settings', href: '#' },
    { name: 'Sign out', href: '#' },
]
</script>