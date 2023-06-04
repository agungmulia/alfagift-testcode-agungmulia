import { createRouter, createWebHistory } from "vue-router";

import store from "../store/index.js";
import DefaultLayout from "../components/DefaultLayout.vue";
import UserRole from "../views/UserRole.vue";
import User from "../views/User.vue";
const routes = [
  {
    path: "/",
    redirect: "/role",
    component: DefaultLayout,
    children: [
      {
        path: "/role",
        name: "Role",
        component: UserRole,
      },
      {
        path: "/user",
        name: "User",
        component: User,
      },
    ],
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
