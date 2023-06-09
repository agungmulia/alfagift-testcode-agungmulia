<template>
    <TransitionRoot as="template" :show="notification.show">
        <Dialog
            as="div"
            class="relative z-10"
            @close="notification.show = false"
        >
            <TransitionChild
                as="template"
                enter="ease-out duration-300"
                enter-from="opacity-0"
                enter-to="opacity-100"
                leave="ease-in duration-200"
                leave-from="opacity-100"
                leave-to="opacity-0"
            >
                <div
                    class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity"
                />
            </TransitionChild>

            <div class="fixed inset-0 z-10 overflow-y-auto">
                <div
                    class="flex min-h-full items-end justify-center p-4 text-center sm:items-center sm:p-0"
                >
                    <TransitionChild
                        as="template"
                        enter="ease-out duration-300"
                        enter-from="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
                        enter-to="opacity-100 translate-y-0 sm:scale-100"
                        leave="ease-in duration-200"
                        leave-from="opacity-100 translate-y-0 sm:scale-100"
                        leave-to="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
                    >
                        <DialogPanel
                            class="relative transform overflow-hidden rounded-lg bg-white text-left shadow-xl transition-all sm:my-8 sm:w-full sm:max-w-lg"
                        >
                            <div class="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
                                <div class="sm:flex sm:items-start">
                                    <div
                                        :class="[
                                            notification.type !== 'success'
                                                ? 'mx-auto flex h-12 w-12 flex-shrink-0 items-center justify-center rounded-full bg-red-100 sm:mx-0 sm:h-10 sm:w-10'
                                                : 'mx-auto flex h-12 w-12 flex-shrink-0 items-center justify-center rounded-full bg-green-100 sm:mx-0 sm:h-10 sm:w-10',
                                        ]"
                                    >
                                        <CheckCircleIcon
                                            v-if="
                                                notification.type === 'success'
                                            "
                                            class="h-6 w-6 text-green-600"
                                            aria-hidden="true"
                                        />
                                        <ExclamationTriangleIcon
                                            v-else
                                            class="h-6 w-6 text-red-600"
                                            aria-hidden="true"
                                        />
                                    </div>
                                    <div
                                        class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left"
                                    >
                                        <DialogTitle
                                            as="h3"
                                            class="text-lg font-medium leading-6 text-gray-900"
                                            >Notification</DialogTitle
                                        >
                                        <div class="mt-2">
                                            <p class="text-sm text-gray-500">
                                                {{ notification.message }}
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </DialogPanel>
                    </TransitionChild>
                </div>
            </div>
        </Dialog>
    </TransitionRoot>
</template>

<script setup>
import { ref, computed } from "vue";
import { useStore } from "vuex";

const store = useStore();
import {
    Dialog,
    DialogPanel,
    DialogTitle,
    TransitionChild,
    TransitionRoot,
} from "@headlessui/vue";
import {
    ExclamationTriangleIcon,
    CheckCircleIcon,
} from "@heroicons/vue/24/outline";

const notification = computed(() => store.state.notification);
</script>
