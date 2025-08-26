import axios from "./axiosClient";

export const login = (email, password) => {
  return axios.post("/user/login", { email, password });
};

export const register = (username, password, email, firstName, lastName) => {
  return axios.post("/user/register", {username, password, email, firstName, lastName});
};