import axios from "axios";
import store from "./store/index.js";
import router from "./router/index.js";

const axiosClient = axios.create({ baseURL: "http://127.0.0.1:8080/api" });

export default axiosClient;
