# Izmeritelnaya-systema
## !!Вниманме данная программа предназначенна только для Linux и других Unix подобных систем!!

Для корректной работы программы необходимо установить apache(sudo apt install apache2 -y), php(sudo apt install php)(+ модули для работы с postgresql), sysstat(sudo apt install sysstat -y), lsb_release(sudo apt install lsb-release), 
далее в etc создаете каталог measurements и помещайте туда конфиг ab.conf (/etc/measurements/ab.conf) и впишите туда актуальные данные для бд, 
затем помеcтите остальные файлы по этому пути /var/www/html.

Собственно как получать сами показания?
Сначала запустите программу sysinfo_update.php для корректного отображения в списке
затем запускаете любую из трех программ:

cpu.php - показывает нагрузку процессора (команда mpstat)

mem.php - показывает информцию об общей и свободной памяти на накопителе (команда df)

ram.php - показывает информцию об общей и свободной оперативной памяти (команда free)


<img width="760" height="545" alt="Screenshot 2026-04-05 at 17-57-02 test" src="https://github.com/user-attachments/assets/4a2a8341-fa09-4389-bcce-2acb2fd8fc80" />

<img width="863" height="550" alt="Screenshot 2026-04-05 at 17-56-47 test" src="https://github.com/user-attachments/assets/8b82d221-655b-4801-a399-4166fc3313bd" />

<img width="799" height="518" alt="Screenshot 2026-04-05 at 17-56-34 test" src="https://github.com/user-attachments/assets/35b07e79-9ef4-42cd-b08a-9dfe8d316ab7" />

