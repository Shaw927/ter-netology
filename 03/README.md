# 1 

<img width="1329" height="512" alt="image" src="https://github.com/user-attachments/assets/7d416d91-ce52-432e-8472-c4bce0cae2b1" />

# 2

<img width="763" height="570" alt="image" src="https://github.com/user-attachments/assets/7acd7f71-f8dc-4b32-80e9-5a6fef6d689f" />

# 3 и 4

<img width="1262" height="1172" alt="image" src="https://github.com/user-attachments/assets/bd51fcf6-0bfc-47f2-b5a1-d94b4883c47e" />

# 5

<img width="874" height="1249" alt="image" src="https://github.com/user-attachments/assets/0e9a7d38-3030-4d71-bbb5-6863f4c6fe70" />

# 6
так как вм перестались создаваться с белым адресом из за ошибки то все адреса серые и к ним доступа нет(ансибл не может подключиьтсься и выполнить модуль)

<img width="1275" height="1010" alt="image" src="https://github.com/user-attachments/assets/0753f90f-2de0-4523-8076-4ff7505d51f3" />

<img width="1276" height="443" alt="image" src="https://github.com/user-attachments/assets/e36a1a92-cd14-436f-be52-f9c3a2719edc" />

# 8
лишний пробел и неправильная поставлена скобка }

[webservers]
%{~ for i in webservers ~}
${i["name"]} ansible_host=${i["network_interface"][0]["nat_ip_address"]} platform_id=${i["platform_id"]}
%{~ endfor ~}
