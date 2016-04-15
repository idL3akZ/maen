#!/bin/bash
#============== INFO SCRIPT =============
version="3.0"
changelog="Mayor update, add more task option"
#========================================
clear
echo ".::::::::::::::::::-- bVPS-WPManagement v.$version --:::::::::::::::::."
echo "------------------------------------------------------------------"
echo " Bash VPS Wordpress Management, dengan mesin EasyEngine dan WP-CLI"
echo "======================= T A S K - L I S T ========================"
echo "1. Software Installation (EasyEngine, WP-CLI, phpmyadmin, dll"
echo "------------------------------------------------------------------"
echo "2. Wordpress Installation + Default Configuration"
echo "3. Lihat daftar WP Master domain"
echo "4. Tambah domain layer"
echo "5. Lihat daftar domain layer"
echo "6. Hapus domain layer"
echo "------------------------------------------------------------------"
echo "7. Lihat Account PhpMyAdmin"
echo "8. Ubah Default WP User Account"
echo "9. Ubah ExclusiveBot User Account"
echo "10. Lihat Change Log bVPS-WPManagement"
echo ""
echo -n "Silahkan pilih Tasknya [1-10] : "
read task