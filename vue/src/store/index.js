import { createStore } from "vuex";
import axiosClient from "../axios.js";

const store = createStore({
  state: {
    userRoles: {
      data: {},
      loading: false,
    },
    users: {
      data: {},
      loading: false,
    },
    notification: {
      show: false,
      type: "success",
      message: "",
    },
  },
  actions: {
    getUserRole({ commit }, { url = null } = {}) {
      commit("setUserRolesLoading", true);
      return axiosClient
        .get("/userRoles")
        .then((res) => {
          commit("setUserRoles", res.data);
          commit("setUserRolesLoading", false);
          return res;
        })
        .catch((err) => {
          commit("setUserRolesLoading", false);
          throw err;
        });
    },

    tambahUserRole({ commit }, siswa) {
      let response;
      commit("setUserRolesLoading", true);
      return axiosClient.post("/userRoles", siswa).then((res) => {
        commit("setUserRolesLoading", false);
        // if (res.request.status == 200)
        return res;
      });
    },

    getUsers({ commit }, id) {
      commit("setUsersLoading", true);
      return axiosClient
        .get(`/users/5/${id}`)
        .then((res) => {
          commit("setUsers", res.data);
          commit("setUsersLoading", false);
          return res;
        })
        .catch((err) => {
          commit("setUsersLoading", false);
          throw err;
        });
    },

    findUser({ commit }, id) {
      return axiosClient.get(`/users/${id}`).then((res) => {
        return res;
      });
    },

    tambahUser({ commit }, user) {
      let response;
      commit("setUsersLoading", true);

      return axiosClient.post("/users", user).then((res) => {
        commit("setUsersLoading", false);
        return res;
      });
    },

    ubahUser({ commit }, user) {
      let response;
      commit("setUsersLoading", true);

      return axiosClient.put("/users", user).then((res) => {
        commit("setUsersLoading", false);
        return res;
      });
    },

    cariUser({ commit }, cari) {
      let response;
      commit("setUsersLoading", true);

      return axiosClient.post("/users/search/5/0", cari).then((res) => {
        commit("setUsersLoading", false);
        if (res.request.status == 200) {
          commit("setUsers", res.data);
        }
        return res;
      });
    },

    deleteUser({}, id) {
      return axiosClient.delete(`/users/${id}`);
    },
  },
  mutations: {
    setUserRolesLoading: (state, loading) => {
      state.userRoles.loading = loading;
    },

    setUserRoles: (state, userRoles) => {
      state.userRoles.data = userRoles;
    },

    setUsersLoading: (state, loading) => {
      state.users.loading = loading;
    },

    setUsers: (state, users) => {
      state.users.data = users;
    },

    notify: (state, { message, type }) => {
      state.notification.show = true;
      state.notification.type = type;
      state.notification.message = message;
      setTimeout(() => {
        state.notification.show = false;
      }, 2500);
    },
  },
  modules: {},
});

export default store;
