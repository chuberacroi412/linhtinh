.data
    TIME_1: .space 20
    TIME_2: .space 20
    temp_1: .space 20
    temp_2: .space 20
    dc_canchi: .space 8
        #can_chi stuffs
    chi1:.asciiz "Ty"
    chi2:.asciiz "Suu"
	chi3:.asciiz "Dan"
	chi4:.asciiz "Meo"
	chi5:.asciiz "Thin"
	chi6:.asciiz "Ty"
	chi7:.asciiz "Ngo"
	chi8:.asciiz "Mui"
	chi9:.asciiz "Than"
	chi10:.asciiz "Dau"
	chi11:.asciiz "Tuat"
	chi12:.asciiz "Hoi"
	chi:.word chi1,chi2,chi3,chi4,chi5,chi6,chi7,chi8,chi9,chi10,chi11,chi12
	can1: .asciiz "Giap"
	can2: .asciiz "At"
	can3: .asciiz "Binh"
	can4: .asciiz "Dinh"
	can5: .asciiz "Mau"
	can6: .asciiz "Ky"
	can7: .asciiz "Canh"
	can8: .asciiz "Tan"
	can9 : .asciiz "Nham"
	can10 : .asciiz"Quy"
	can: .word can1,can2,can3,can4,can5,can6,can7,can8,can9,can10
	test_CC:.asciiz "20/11/2016"
tb_canchi_1:.asciiz "\nNam am lich cua "
tb_canchi_2:.asciiz " "
tb_canchi_3:.asciiz "la: "
tb_canchi_4:.asciiz"\r\n"
	#end canchi
		#nhap stuffs
	tb_nhap_1:.asciiz "Nhap ngay DAY: "
	tb_nhap_2:.asciiz "Nhap thang MONTH:"
	tb_nhap_3: .asciiz "Nhap nam YEAR:"
	tb_nhap_4:.asciiz"Nhap sai roi, Nhap lai:\n"
	#end nhap stuffs
    weekDayName: .space 5 #dung trong ham weekday
    days_in_month: .word 31,28,31,30,31,30,31,31,30,31,30,31 #dung de kiem tra tinh hop le
    length_of_month_string: .byte 7, 8, 5, 5, 3, 4, 4, 6, 9, 7, 8, 8 #do dai chuoi ki tu cua cac thang, dung trong convert.C
    week: .byte 'M','o','n',' ',' ','T','u','e','s',' ','W','e','d',' ',' ','T','h','u','r','s','F','r','i',' ',' ','S','a','t',' ',' ','S','u','n',' ',' '	

    # thong bao
    tb_nhap_ngay: .asciiz "\nNhap ngay DAY: "
    tb_nhap_thang: .asciiz "\nNhap thang MONTH: "
    tb_nhap_nam: .asciiz "\nNhap nam YEAR: "
    tb_tiep_tuc: .asciiz "\nBan co muon tiep tuc (y/n)?"
    tb_nhuan: .asciiz "\nNam nhuan"
    tb_khong_nhuan: .asciiz "\nNam khong nhuan"
    ket_qua: .asciiz "\nKet qua: "

    # month
    jan: .asciiz "January"
    feb: .asciiz "February"
    mar: .asciiz "March"
    apr: .asciiz "April"
    may: .asciiz "May"
    jun: .asciiz "June"
    jul: .asciiz "July"
    aug: .asciiz "August"
    sep: .asciiz "September"
    oct: .asciiz "October"
    nov: .asciiz "November"
    dec: .asciiz "December"

    menu: .asciiz "\n--------------------- Ban hay chon 1 trong so cac thao tac duoi day --------------------\n"
    op1: .asciiz "1. Xuat chuoi TIME theo dinh dang DD/MM/YYYY\n"
    op2: .asciiz "2. Chuyen doi chuoi TIME thanh cac dinh dang sau\n"
    op2a: .asciiz "\tA. MM/DD/YYY\n"
    op2b: .asciiz "\tB. Month DD, YYYY\n"
    op2c: .asciiz "\tC. DD Month, YYYY\n"
    op3: .asciiz "3. Kiem tra nam trong chuoi TIME co phai la nam nhuan khong\n"
    op4: .asciiz "4. Cho biet ngay vua nhap la thu may trong tuan\n"
    op5: .asciiz "5. Cho biet ngay vua nhap la thu may ke tu ngay 1/1/1\n"
    op6: .asciiz "6. Cho biet can chi cua nam vua nhap\n"
    op7: .asciiz "7. Cho biet khoang thoi gian giua chuoi TIME_1 va TIME_2\n"
    op8: .asciiz "8. Cho biet hai nam nhuan gan nhat voi nam trong chuoi TIME\n"
    op9: .asciiz "9. Nhap input tu file input.txt xuat ket qua toan bo cac chuc nang tren ra file output.txt\n"
    hr: .asciiz "--------------------------------------------------------------------------------------------\n"
    luachon: .asciiz "moi ban nhap lua chon: "
    luachon1:.asciiz "moi nhap format: "
    splash: .asciiz "/"
    
    duongdan_in: .asciiz "input.txt"
    duongdan_out: .asciiz "output.txt"
    tb_file1:.asciiz "Chuoi Time_1 khong hop le"
    tb_file2:.asciiz "Chuoi Time_2 khong hop le"
    tb_file3:.asciiz " va "
    tb_file4:.asciiz "\r\n-----------------------------------------------------------\r\n"
    tb_file5:.asciiz  "1. "
    tb_file6:.asciiz  "2A. "
    tb_file7:.asciiz  "2B. "
    tb_file8:.asciiz  "2C. "
    tb_file9a:.asciiz  "3. "
    tb_file9b:.asciiz " La Nam Thuong"
    tb_file9c:.asciiz " La Nam Nhuan"
    tb_file10a:.asciiz "4. "
    tb_file10b:.asciiz " la "
    tb_file11a:.asciiz "5. Khoang cach tu ngay 01/01/0001 den ngay "
    tb_file11b:.asciiz " ngay "
    tb_file12a: .asciiz "6. "
    tb_file12b: .asciiz " la nam "
    tb_file13a: .asciiz "7. Khoang cach tu ngay "
    tb_file13b: .asciiz " den ngay "
    tb_file14a: .asciiz "8. Hai nam nhuan gan voi "
    tb_file14b: .asciiz " nhat la "
    tb_file14c: .asciiz " va "
    tb_file_space :.asciiz " "
	#Nho doc nguyen mau ham truoc khi goi, vi mot so ham tra ra tham so de tien cho viec tai su dung


.text
	.globl main
main:

 #menu
 la $a0 TIME_1
 la $a1 TIME_2
 la $a2 dc_canchi
 la $a3 duongdan_in
 la $s4 duongdan_out
jal menu_1
 #endmenu
	j end_of_program



#------------------------- function ----------------------------------
docghifile:# a0 time1 ,a1 time2 ,a2 dc_canchi ,a3 dcfilein ,s4 dcfileout


addi $sp $sp -68
sw $ra ($sp)
sw $a0 4($sp)
sw $a1 8($sp)
sw $a2 12($sp)
sw $a3 16($sp)
sw $s4 20($sp)
sw $t0 24($sp)
sw $t1 28($sp)
sw $t2 32($sp)
sw $s0 36($sp)
sw $s1 40($sp)
sw $s7 44($sp)
sw $t3 48($sp)
sw $t4 52($sp)
sw $t5 56($sp)
sw $t6 60($sp)
sw $t7 64($sp)

move $t0 $a0
move $a0 $a3
move $t1 $a1
move $t2 $a2
move $t8 $a3
li $a1 0
li $a2 0
li $v0 13
syscall 
move $s0 $v0 #s0 la dia chi in

move $a0 $s4
li $a1 1
li $a2 0
li $v0 13
syscall 
move $s1 $v0

docghifile.loop:
move $a0 $s0
move $a1 $t0
la $a2 12
li $v0 14
syscall
blt $v0 1 docghifile.break
li $s7 '/'
sb $s7 2($a1)
sb $s7 5($a1)
sb $zero 10($a1)

#move $a0 $a1
#li $v0 4
#syscall

move $a0 $s0
move $a1 $t1
la $a2 10
li $v0 14
syscall
sb $s7 2($a1)
sb $s7 5($a1)
sb $zero 10($a1)

#move $a0 $a1
#li $v0 4
#syscall

j xuly
docghifile.loop.continue:
move $a0 $s0
move $a1 $t1
la $a2 2
li $v0 14
syscall
blt $v0 1  docghifile.break
j docghifile.loop

xuly:
move $a0 $t0
jal checkInputData
move $t3 $v0

move $a0 $t1
jal checkInputData
move $t4 $v0

beq $t3 0 xuly.time1loi
beq $t4 0 xuly.time2loi
j xuly.khongloi
xuly.time1loi:
la $a0 tb_file1
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_file1
li $v0 15
syscall
beq $t4 0 xuly.2timeloi
j xuly.end

xuly.time2loi:
la $a0 tb_file2
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_file2
li $v0 15
syscall
j xuly.end

xuly.2timeloi:
la $a0 tb_file3
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_file3
li $v0 15
syscall
j xuly.time2loi

xuly.khongloi:
#xu ly cau 1
la $a0 tb_file5
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_file5
li $v0 15
syscall

move $a0 $t0
jal strlen
move $a2 $v0
move $a0 $s1
move $a1 $t0
li $v0 15
syscall

la $a0 tb_canchi_4
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_canchi_4
li $v0 15
syscall
#xong cau 1
la $a0 tb_file6
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_file6
li $v0 15
syscall

move $a0 $t0
jal Day
move $t5 $v0
jal Month
move $t6 $v0
jal Year
move $t7 $v0

li $a1 'A'
move $a0 $t0
jal Convert

jal strlen
move $a2 $v0
move $a0 $s1
move $a1 $t0
li $v0 15
syscall

la $a0 tb_canchi_4
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_canchi_4
li $v0 15
syscall

move $a0 $t5
move $a1 $t6
move $a2 $t7
move $a3 $t0
jal Date
#xong 2A
la $a0 tb_file7
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_file7
li $v0 15
syscall

move $a0 $t0
jal Day
move $t5 $v0
jal Month
move $t6 $v0
jal Year
move $t7 $v0

li $a1 'B'
move $a0 $t0
jal Convert
move $a0 $t0
li $v0 4
syscall

jal strlen
move $a2 $v0
move $a0 $s1
move $a1 $t0
li $v0 15
syscall

la $a0 tb_canchi_4
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_canchi_4
li $v0 15
syscall

move $a0 $t5
move $a1 $t6
move $a2 $t7
move $a3 $t0
jal Date

#la $a0 tb_canchi_4
#li $v0 4
#syscall





#xong 2B
la $a0 tb_file8
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_file8
li $v0 15
syscall

move $a0 $t0
jal Day
move $t5 $v0
jal Month
move $t6 $v0
jal Year
move $t7 $v0

li $a1 'C'
move $a0 $t0
jal Convert

#move $a0 $t0
#li $v0 4
#syscall




jal strlen
move $a2 $v0
move $a0 $t0
add $a0 $a0 $a2
subi $a0 $a0 1
sb $zero ($a0)
move $a0 $s1
move $a1 $t0
li $v0 15
syscall

la $a0 tb_canchi_4
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_canchi_4
li $v0 15
syscall

move $a0 $t5
move $a1 $t6
move $a2 $t7
move $a3 $t0
jal Date
#xong 2C - xong 2
la $a0 tb_file9a
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_file9a
li $v0 15
syscall

move $a0 $t0
jal LeapYear
beq $v0 1 docghi.xuly.nhuan
move $a0 $t0
addi $a0 $a0 6
li $a2 4
move $a1 $a0
move $a0 $s1
li $v0 15
syscall

la $a0 tb_file9b
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_file9b
li $v0 15
syscall

la $a0 tb_canchi_4
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_canchi_4
li $v0 15
syscall


j xuly.xongcau3

docghi.xuly.nhuan:

move $a0 $t0
addi $a0 $a0 6
li $a2 4
move $a1 $a0
move $a0 $s1
li $v0 15
syscall

la $a0 tb_file9c
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_file9c
li $v0 15
syscall

la $a0 tb_canchi_4
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_canchi_4
li $v0 15
syscall



#xong 3
xuly.xongcau3:
#batdau4
la $a0 tb_file10a
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_file10a
li $v0 15
syscall

move $a1 $t0
li $a2 10
move $a0 $s1
li $v0 15
syscall

la $a0 tb_file10b
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_file10b
li $v0 15
syscall

move $a0 $t0
jal weekDay


move $a1 $v0
move $a0 $v0
li $v0 4
syscall
jal strlen
move $a2 $v0
move $a0 $s1
li $v0 15
syscall

la $a0 tb_canchi_4
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_canchi_4
li $v0 15
syscall
#xong 4
la $a0 tb_file11a
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_file11a
li $v0 15
syscall

move $a1 $t0
move $a0 $s1
li $a2 10
li $v0 15
syscall

 la $a0 tb_file10b
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_file10b
li $v0 15
syscall
move $a0 $t0
jal distanceFromFirstDay

move $a0 $v0
jal inttostring
move $a0 $v0
move $a1 $a0
jal strlen
move $a2 $v0
move $a0 $s1
li $v0 15
syscall





 la $a0 tb_file11b
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_file11b
li $v0 15
syscall

la $a0 tb_canchi_4
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_canchi_4
li $v0 15
syscall
#xong 5

 la $a0 tb_file12a
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_file12a
li $v0 15
syscall

move $a1 $t0
move $a0 $s1
li $a2 10
li $v0 15
 syscall

move $a0 $t0
move $a1 $t2
jal can_chi

 la $a0 tb_file12b
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_file12b
li $v0 15
syscall

lw $a0 ($t2)
jal strlen
move $a2 $v0
move $a1 $a0
move $a0 $s1
li $v0 15
syscall

 la $a0 tb_file_space
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_file_space
li $v0 15
syscall

lw $a0 4($t2)
jal strlen
move $a2 $v0
move $a1 $a0
move $a0 $s1
li $v0 15
syscall

la $a0 tb_canchi_4
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_canchi_4
li $v0 15
syscall
#xong 6
 la $a0 tb_file13a
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_file13a
li $v0 15
syscall

move $a1 $t0
move $a0 $s1
li $a2 10
li $v0 15
syscall


 la $a0 tb_file13b
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_file13b
li $v0 15
syscall

move $a1 $t1
move $a0 $s1
li $a2 10
li $v0 15
syscall

 la $a0 tb_file10b
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_file10b
li $v0 15
syscall

move $a0 $t0
move $a1 $t1
jal GetTime
move $a0 $v0
jal inttostring
move $a0 $v0
move $a1 $a0
jal strlen
move $a2 $v0
move $a0 $s1
li $v0 15
syscall

 la $a0 tb_file11b
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_file11b
li $v0 15
syscall

la $a0 tb_canchi_4
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_canchi_4
li $v0 15
syscall
#xong 7
 la $a0 tb_file14a
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_file14a
li $v0 15
syscall
move $a0 $t0
addi $a1 $a0 6
move $a0 $s1
li $a2 4
li $v0 15
syscall

 la $a0 tb_file14b
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_file14b
li $v0 15
syscall

move $a0 $t0
jal findNextLeap

move $a0 $v0
jal inttostring
move $a0 $v0
move $a1 $a0
jal strlen
move $a2 $v0
move $a0 $s1
li $v0 15
syscall






 la $a0 tb_file14c
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_file14c
li $v0 15
syscall
move $a0 $v1
jal inttostring
move $a0 $v0
move $a1 $a0
jal strlen
move $a2 $v0
move $a0 $s1
li $v0 15
syscall
#xong 8





j xuly.end

xuly.end:
la $a0 tb_file4
jal strlen
move $a2 $v0
move $a0 $s1
la $a1 tb_file4
li $v0 15
syscall


j docghifile.loop.continue

docghifile.break:
move $a0 $s0
li $v0 16
syscall

move $a0 $s1
li $v0 16
syscall

lw $ra ($sp)
lw $a0 4($sp)
lw $a1 8($sp)
lw $a2 12($sp)
lw $a3 16($sp)
lw $s4 20($sp)
lw $t0 24($sp)
lw $t1 28($sp)
lw $t2 32($sp)
lw $s0 36($sp)
lw $s1 40($sp)
lw $s7 44($sp)
lw $t3 48($sp)
lw $t4 52($sp)
lw $t5 56($sp)
lw $t6 60($sp)
lw $t7 64($sp)
addi $sp $sp 68

jr $ra



#end docghi file


menu_1:
#a0 chuoi time1
#a1 chuoi time2
#a2 dc_canchi
#a3 dcfilein ,s4 dcfileout
addi $sp $sp -44
sw $ra ($sp) 
sw $t0 4($sp) 
sw $t1 8($sp)
sw $t2 12($sp)
sw $t3 16($sp)
sw $t4 20($sp)
sw $t5 24($sp)
sw $a0 28($sp)
sw $a1 32($sp)
sw $a2 36($sp)
sw $a3 40($sp)      
jal nhap

move $t1 $v0 #chuoi vua nhap

jal in_menu

move $t0 $a0
la $a0 luachon
li $v0 4
syscall

li $v0 5
syscall #read integer
move $a0 $t1
move $t2 $v0
beq $t2 1 menu.ham1
beq $t2 2 menu.ham2
beq $t2 3 menu.ham3
beq $t2 4 menu.ham4
beq $t2 5 menu.ham5
beq $t2 6 menu.ham6
beq $t2 7 menu.ham7
beq $t2 8 menu.ham8
beq $t2 9 menu.ham9
j menu.end

menu.ham1:

#jal Day
#move $t3 $v0
#jal Month
#move $t4 $v0
#jal Year
#move $t5 $v0
#move $a3 $a0
#move $a0 $t3
#move $a1 $t4
#move $a2 $t5
#jal Date
move $a0 $t1
li $v0 4
syscall
j menu.end
menu.ham2:
la $a0 luachon1
li $v0 4
syscall
li $v0 12
syscall
move $a1 $v0

la $a0 tb_canchi_4
li $v0 4
syscall
move $a0 $t1

jal Convert
li $v0 4
syscall

j menu.end
menu.ham3:
jal LeapYear
move $t2 $v0

beq $t2 1 nhuan.xuly
la $a0 tb_khong_nhuan
li $v0 4
syscall
j menu.end
nhuan.xuly:
la $a0 tb_nhuan
li $v0 4
syscall

j menu.end
menu.ham4:
move $a0 $t1
jal weekDay
move $a0 $v0
li $v0 4
syscall
j menu.end
menu.ham5:
move $a0 $t1
jal distanceFromFirstDay
move $a0 $v0
li $v0 1
syscall
j menu.end
menu.ham6:
move $a0 $t1
move $a1 $a2
jal can_chi
j menu.end
menu.ham7:
move $a0 $a1
jal nhap
move $a1 $a0
move $a0 $t1
jal GetTime
move $t2 $v0
la $a0 tb_canchi_4
li $v0 4
syscall
move $a0 $t2
li $v0 1
syscall


j menu.end
menu.ham8:
move $a0 $t1
jal findNextLeap
move $a0 $v0
li $v0 1
syscall


la $a0 tb_canchi_4
li $v0 4
syscall
move $a0 $v1
li $v0 1
syscall
j menu.end
menu.ham9:
jal docghifile


j menu.end



menu.end:

lw $ra ($sp) 
lw $t0 4($sp) 
lw $t1 8($sp)
lw $t2 12($sp)
lw $t3 16($sp)
lw $t4 20($sp)
lw $t5 24($sp)
lw $a0 28($sp)
lw $a1 32($sp)
lw $a2 36($sp)
lw $a3 40($sp)    
addi $sp $sp 44
jr $ra


can_chi: # $a0 bien time #$a1 dc can chi
addi $sp $sp -40
sw $ra ($sp)
sw $a0 4($sp)
sw $v0 8($sp)
sw $t1 12($sp)
sw $t2 16($sp)
sw $t3 20($sp)
sw $t4 24($sp)
sw $t5 28($sp)
sw $t6 32($sp)
sw $a1 36 ($sp)
#bat dau lam
#la $t0 $a0
jal Year
move $t1 $v0
#load gia tri vao can, $t2 = i
li $t2 0
la $t3 can
la $t4 chi
addi $t5 $t1 6
li $a0 10
 div $t5 $a0
 mfhi $t5
 li $a0 4
 mult $t5 $a0
 mflo $t5
 addi $t6 $t1 8
 li $a0 12
 div $t6 $a0
 mfhi $t6 
  li $a0 4
 mult $t6 $a0
 mflo $t6
 la $a0 tb_canchi_1
 li $v0 4
 syscall
 
move $a0 $t1
 li $v0 1
 syscall
 
 la $a0 tb_canchi_2
 li $v0 4
 syscall
 
 la $a0 tb_canchi_3
 li $v0 4
 syscall
add $t3 $t3 $t5
lw $a0 ($t3)
sw $a0 ($a1)
li $v0 4
syscall

 la $a0 tb_canchi_2
 li $v0 4
 syscall

add $t4 $t4 $t6
lw $a0 ($t4)
sw $a0 4($a1)
li $v0 4
syscall

la $a0 tb_canchi_4
li $v0 4
syscall

move $v0 $a1

lw $ra ($sp)
lw $a0 4($sp)
lw $v0 8($sp)
lw $t1 12($sp)
lw $t2 16($sp)
lw $t3 20($sp)
lw $t4 24($sp)
lw $t5 28($sp)
lw $t6 32($sp)
sw $a1 36 ($sp)
addi $sp $sp 40
jr $ra
in_menu: # Ham in menu
    addi    $sp, $sp, -12
    sw      $ra, 8($sp)
    sw      $a0, 4($sp)
    sw      $v0, 0($sp)
    li      $v0, 4
    la      $a0, menu
    syscall
    la      $a0, op1
    syscall
    la      $a0, op2
    syscall
    la      $a0, op2a
    syscall
    la      $a0, op2b
    syscall
    la      $a0, op2c
    syscall
    la      $a0, op3
    syscall
    la      $a0, op4
    syscall
    la      $a0, op5
    syscall
    la      $a0, op6
    syscall
    la      $a0, op7
    syscall
    la      $a0, op8
    syscall
    la      $a0, op9
    syscall
    la      $a0, hr
    syscall
    

    lw      $ra, 8($sp)
    lw      $a0, 4($sp)
    lw      $v0, 0($sp)
    addi    $sp, $sp, 12
    
    jr      $ra



#---------------------- chua lam ---------------------

#tra ra $v0
#dau vao char*
strlen:
addi $sp $sp -16
sw  $ra ($sp)
sw  $a0 4($sp)
sw  $t1 8($sp)
sw $t2 12($sp)
li $t1 0
strlen.loop:
lb $t2 ($a0)
addi $a0 $a0 1
addi $t1 $t1 1
bne $t2 $zero strlen.loop
move $v0 $t1
subi $v0 $v0 1
lw  $ra ($sp)
lw  $a0 4($sp)
lw  $t1 8($sp)
 lw $t2 12($sp)
addi $sp $sp 16


jr $ra

nhap:
	# $a0 TIME_1
	# $a1 temp
	addi    $sp, $sp, -44
    sw      $ra, 0($sp)
    sw      $a0, 4($sp)
    sw      $a1, 12($sp)
    sw      $t1, 16($sp)
    sw      $t2, 20($sp)
   sw      $t3, 24($sp)
    sw      $t4, 28($sp)
    sw	$a2,32($sp)
    sw $a3,36($sp)
    sw $t0 40($sp)
	# dung $s0 de kiem tra tinh hop le cua chuoi time
	# nhap ngay vao chuoi temp
	#$t1 bool kiem tra dung hay sai
#strcpy a0 chuoi nguon a1 chuoi dich
	#truyen tham so vao ham kiem tra hop le
	#lw 		$s0, ngay
	#lw 		$s1, thang
	#lw 		$s2, nam
	#jal 		kiemTraHopLe
#Ham kiemTraHopLe
#checkInputData: #bool(v0) kiemTraHopLe(char* time(a0))
li $t1 0
move $t0 $a0
nhap.loop:
la $a0 tb_nhap_ngay
li $v0 4
syscall
li $v0 5
syscall
move $t1 $v0

la $a0 tb_nhap_thang
li $v0 4
syscall
li $v0 5
syscall
move $t2 $v0

la $a0 tb_nhap_nam
li $v0 4
syscall

li $v0 5
syscall
move $t3 $v0

bgt $t1 31 nhap.else
blt $t1 0 nhap.else
bgt $t2 12 nhap.else
blt $t2 0 nhap.else
bgt $t3 9999 nhap.else
blt $t3 0 nhap.else
move $a0 $t1
move $a1 $t2
move $a2 $t3
move $a3 $t0
jal Date
move $a0 $t0
#li $v0 4
#syscall

jal checkInputData
move $t1 $v0
beq $t1 1 nhap.break
nhap.else:
la $a0 tb_nhap_4
li $v0 4
syscall
j nhap.loop

nhap.break:
move $v0 $a0
    lw      $ra, 0($sp)
    lw      $a0, 4($sp)
    lw      $a1, 12($sp)
    lw      $t1, 16($sp)
    lw      $t2, 20($sp)
   lw      $t3, 24($sp)
    lw      $t4, 28($sp)
        lw	$a2,32($sp)
    lw $a3,36($sp)
    sw $t0 40($sp)
    addi    $sp, $sp, 44
    jr $ra
#-----------------------------------------------------
inttostring:
#$a0 = int
#v0 = allocated mem
addi $sp $sp -56
sw $t0 ($sp)
sw $a0 4($sp)
sw $t1 8($sp)
sw $t2 12($sp)
sw $t4 16($sp)
sw $t3 20($sp)
sw $t5 24($sp)
sw $t6 28($sp)
sw $s0 32($sp)
sw $s1 36($sp)
sw $s2 40($sp)
sw $s3 44($sp)
sw $ra 48($sp)
sw $t9 52($sp)
move $t0 $a0
li $a0 11
li $v0 9
syscall
move $a0 $v0
li $t1 10
li $t2 0
move $t4 $a0
li $v0 10
inttostring.loop:
div $t0 $v0
mflo $t0
mfhi $t3
addi $t3 $t3 48
sb $t3 ($a0)
addi $a0 $a0 1
addi $t2 $t2 1
bne $t0 0 inttostring.loop
li $t5 0
move $t6 $t2
li $t9 2
div $t6 $t9
mflo $t6
move $s0 $t4
move $s1 $a0
sb $zero ($s1)
subi $s1 $s1 1

inttostring.swap:
lb $s3 ($s0)
lb $s4 ($s1)
sb $s3 ($s1)
sb $s4 ($s0)
subi $s1 $s1 1
addi $s0 $s0 1
addi $t5 $t5 1
blt $t5 $t6 inttostring.swap

move $v0 $t4
lw $t0 ($sp)
lw $a0 4($sp)
lw $t1 8($sp)
lw $t2 12($sp)
lw $t4 16($sp)
lw $t3 20($sp)
lw $t5 24($sp)
lw $t6 28($sp)
lw $s0 32($sp)
lw $s1 36($sp)
lw $s2 40($sp)
lw $s3 44($sp)
lw $ra 48($sp)
lw $t9 52($sp)
addi $sp $sp 56
jr $ra






#end inttostring



Date:
    #   $a0 - ngay
    #   $a1 - thang
    #   $a2 - nam
    #   $a3 - TIME
    #   $v0 - dia chi chuoi TIME
    addi    $sp, $sp, -20
    sw      $ra, 16($sp)
    sw      $t1, 12($sp)
    sw      $t2, 8($sp)
    sw      $t3, 4($sp)
    sw      $t4, 0($sp)

    li      $t1, 10
    # DD
    div		$a0, $t1			# $a0 / $t1
    mflo	$t2					# $t2 = floor($a0 / $t1) 
    mfhi	$t3					# $t3 = $a0 mod $t1 
    addi    $t2, $t2, 48        # chuyen sang ki tu
    addi    $t3, $t3, 48
    sb      $t2, 0($a3)         
    sb      $t3, 1($a3)
    li      $t4, 0x2f       # $t4 =  '/'
    sb      $t4, 2($a3)

    # MM
    div		$a1, $t1			# $a1 / $t1
    mflo	$t2					# $t2 = floor($a1 / $t1) 
    mfhi	$t3					# $t3 = $a1 mod $t1 
    addi    $t2, $t2, 48
    addi    $t3, $t3, 48
    sb      $t2, 3($a3)         
    sb      $t3, 4($a3)
    li      $t4, 0x2f       # $t4 =  '/'
    sb      $t4, 5($a3)

    # YYYY
    # chu so dau tien cua YEAR
    li      $t1, 1000
    div     $a2, $t1
    mflo    $t2
    mfhi    $t3
    addi    $t2, $t2, 48
    sb      $t2, 6($a3)
    # chu so thu 2 cua YEAR
    li      $t1, 100
    div     $t3, $t1
    mflo    $t2
    mfhi    $t3
    addi    $t2, $t2, 48
    sb      $t2, 7($a3)  
    # 2 chu so cuoi cua YEAR
    li      $t1, 10
    div		$t3, $t1			# $t3 / $t1
    mflo	$t2					# $t2 = floor($t3 / $t1) 
    mfhi	$t3					# $t3 = $t3 mod $t1 
    addi    $t2, $t2, 48
    addi    $t3, $t3, 48
    sb      $t2, 8($a3)         
    sb      $t3, 9($a3)

    # ki tu null de ket thuc chuoi
    sb      $0, 10($a3)
    # tra ve dia chi cua TIME
    move    $v0, $a3

    lw      $ra, 16($sp)
    lw      $t1, 12($sp)
    lw      $t2, 8($sp)
    lw      $t3, 4($sp)
    lw      $t4, 0($sp)
    addi    $sp, $sp, 20

    jr      $ra


Convert:
    # $a0 - TIME
    # $a1 - type
    # khong co return, thay doi truc tiep tren $a0
    addi    $sp, $sp, -60
    sw $s0	56($sp)
    sw $s1	52($sp)
	sw 	    $t0, 48($sp)
	sw 	    $t1, 44($sp)
	sw 	    $t2, 40($sp)
	sw 	    $t3, 36($sp)
	sw 	    $t4, 32($sp)
    sw      $ra, 28($sp)
    sw      $a0, 24($sp)
    sw      $a1, 20($sp)

    beq     $a1, 'A', Convert.A      # 'A' = 65
    beq     $a1, 'B', Convert.B      # 'B' = 66
    beq     $a1, 'C', Convert.C      # 'C' = 67

Convert.A: # MM/DD/YYYY
    # doi cho MM va DD
    lb		$t0, 0($a0)		 
    lb		$t1, 1($a0)		 
    lb      $t2, 3($a0)       
    lb      $t3, 4($a0)       

    sb      $t2, 0($a0)		
    sb      $t3, 1($a0)		
    sb      $t0, 3($a0)		
    sb      $t1, 4($a0)
    j       Convert.end

Convert.B: # Month DD, YYYY

    # lay thang va chuyen sang chuoi Month
    jal     Month
    move    $a0, $v0
    jal     month_to_string
    sw      $v0, 16($sp)    # luu Month trong stack

    # copy phan DD, YYYY vao temp_2
    lw      $t0, 24($sp)
    la      $t1, temp_2
    li      $t2, 32 # 32 = ' '
    sb      $t2, 0($t1)
    lb      $t2, 0($t0)
    sb      $t2, 1($t1)
    lb      $t2, 1($t0)
    sb      $t2, 2($t1)
    li      $t2, 44  # 44 = ','
    sb      $t2, 3($t1)
    li      $t2, 32
    sb      $t2, 4($t1)
    lb      $t2, 6($t0)
    sb      $t2, 5($t1)
    lb      $t2, 7($t0)
    sb      $t2, 6($t1)
    
    lb      $t2, 8($t0)
    sb      $t2, 7($t1)
    lb      $t2, 9($t0)
    sb      $t2, 8($t1)
    li      $t2, 0
    sb      $t2, 9($t1)

    lw      $a0, 24($sp)
    lw      $a1, 16($sp)
    jal     strcpy
    la      $a1, temp_2
    jal     strcpy
    j Convert.end
Convert.C:
    move 	$t0, $a0	# chep dia chi tu a0 vao t0
	move 	$s1, $a0 	# dung s1 de luu vinh vien dia chi a0, tranh truong hop goi ham lung tung a0 bi ghi de
	la 	$s0, temp_2	# load dia chi temp_2 vao s0

	#chep YYYY vao tenp_2
	lb	    $t1, 6($t0)
	sb 	    $t1, 0($s0)
	lb 	    $t1, 7($t0)
	sb 	    $t1, 1($s0)
	lb 	    $t1, 8($t0)
	sb 	    $t1, 2($s0)
	lb 	    $t1, 9($t0)
	sb 	    $t1, 3($s0)
	lb 	    $t1, 10($t0)
	sb 	    $t1, 4($s0)
	
	jal     Month #lay gia tri int cua thang
	move 	$t1, $v0 # gan vao t0
	addi 	$t1, $t1, -1 # tru di 1 de truy xuat vo cai length_of_month_string
	lb 	    $t2, length_of_month_string($t1) # gan do dai chuoi thang vao t2

   	move    $a0, $v0
   	jal     month_to_string
	move 	$t1, $v0 # gan dia chia cua cai chuoi thang vo t1

	#bat dau chinh tren a0
	#2 ki tu dau la DD giu nguyen, tiep theo la ki tu khoang trang
	move    $t4, $s1
	addi    $t4, $t4, 2 # doi len vi tri can them khoang trong
	li      $t0, ' '
	sb      $t0, ($t4)
	addi    $t4, $t4, 1 # tang len 1 don vi nua de vo vong lap


	li $t3, 0 # t3 = i = 0 dung de chay loop
addMonthLoop:
	lb      $t0, ($t1)
	sb      $t0, ($t4)
	addi    $t1, $t1, 1 #tang vi tri chuoi thang
	addi    $t4, $t4, 1 #tang vi tri chuoi tra ra
	addi    $t3, $t3, 1 #tang bien dem
	blt     $t3, $t2, addMonthLoop

	#add xong thang vo chuoi, gio toi dau ',' va cai nam
	li      $t0, ','
	sb      $t0, ($t4) 
	addi    $t4, $t4, 1	

	li $t3, 0 # t3 = i = 0 dung de chay loop
addYearLoop:
	lb      $t0, ($s0) # nhac lai  la s0 la con luu dia chi temp_2 chua gia tri cua YYYY
	sb      $t0, ($t4)
	addi    $t4, $t4, 1
	addi    $s0, $s0, 1
	addi    $t3, $t3, 1 
	blt     $t3, 4, addYearLoop

	#xong gan dia chi s1 vo v0 la tra ra
	move    $v0, $s1


    Convert.end:
    lw $s0	56($sp)
    lw $s1	52($sp)
    lw 	    $t0, 48($sp)
	lw 	    $t1, 44($sp)
	lw 	    $t2, 40($sp)
	lw 	    $t3, 36($sp)
	lw 	    $t4, 32($sp)
    lw      $ra, 28($sp)
    lw      $a0, 24($sp)
    lw      $a1, 20($sp)
	addi    $sp, $sp, 60
    jr      $ra


Day:
    # $a0 - TIME
    # return $v0 - day kieu int
    addi    $sp, $sp, -16
    sw      $ra, 12($sp)
    sw      $t0, 8($sp)
    sw      $t1, 4($sp)
    sw      $t2, 0($sp)
    
    li      $t0, 10
    lb      $t1, 0($a0)
    addi    $t1, $t1, -48
    mult	$t0, $t1			# $t0 * $t1 = Hi and Lo registers
    mflo	$t2					# copy Lo to $t2
    lb      $t1, 1($a0)
    addi    $t1, $t1, -48
    add     $t2, $t2, $t1

 move    $v0, $t2
 
    lw      $ra, 12($sp)
    lw      $t0, 8($sp)
    lw      $t1, 4($sp)
    lw      $t2, 0($sp)
    addi    $sp, $sp, 16

   
    jr      $ra

Month:
    # $a0 - TIME
    # return $v0 - month kieu int
    addi    $sp, $sp, -16
    sw      $ra, 12($sp)
    sw      $t0, 8($sp)
    sw      $t1, 4($sp)
    sw      $t2, 0($sp)

    li      $t0, 10
    lb      $t1, 3($a0)
    addi    $t1, $t1, -48
    mult	$t0, $t1			# $t0 * $t1 = Hi and Lo registers
    mflo	$t2					# copy Lo to $t2
    lb      $t1, 4($a0)
    addi    $t1, $t1, -48
    add    $t2, $t2, $t1
    
 move    $v0, $t2
 
    lw      $ra, 12($sp)
    lw      $t0, 8($sp)
    lw      $t1, 4($sp)
    lw      $t2, 0($sp)
    addi    $sp, $sp, 16

   
    jr      $ra

Year:
    # $a0 - TIME
    # return $v0 - year kieu int
    addi    $sp, $sp, -20
    sw      $ra, 16($sp)
    sw      $t0, 12($sp)
    sw      $t1, 8($sp)
    sw      $t2, 4($sp)
    sw      $t3, 0($sp)

    li      $t0, 10
    li      $t2, 0
    la      $t3, 6($a0)

    Year.loop:
    lb      $t1, 0($t3)
    beq     $t1, $0, Year.end
    mult    $t2, $t0
    mflo    $t2
    addi    $t1, $t1, -48
    add     $t2, $t2, $t1
    addi    $t3, $t3, 1
    j Year.loop

    Year.end:  
    move    $v0, $t2

    lw      $ra, 16($sp)
    lw      $t0, 12($sp)
    lw      $t1, 8($sp)
    lw      $t2, 4($sp)
    lw      $t3, 0($sp)
    addi    $sp, $sp, 20

    jr      $ra


LeapYear:
    # $a0 - TIME
    # return $v0 - 1: true, 0: false
    addi    $sp, $sp, -16
    sw      $ra, 12($sp)
    sw      $t0, 8($sp)
    sw      $t1, 4($sp)
    sw      $t3, 0($sp)

    jal     Year
    move    $t0, $v0        # $t0 chua Year trong chuoi TIME - int

    # TH1: chia het cho 400
    # chia cho 400
	li 		$t1, 400
	div     $t0, $t1
	#  neu chia het cho 400 la nam nhuan
    mfhi    $t3
	beq 	$t3, $0, LeapYear.true

    # TH2: chia het cho 4 nhung khong chia het cho 100
    li      $t1, 4
    div     $t0, $t1
    mfhi    $t3
    bne     $t3, $0, LeapYear.false # khong chia het cho 4 -> khong nhuan

    # chia het cho 4 - thuc hien chia 100
    mflo    $t0
    li      $t1, 100
    div     $t0, $t1
    mfhi    $t3
    beq     $t3, $0, LeapYear.false # chia het -> khong nhuan

    LeapYear.true:
    li      $v0, 1
    j       LeapYear.end

    LeapYear.false:
    li      $v0, 0
    
    LeapYear.end:
    lw      $ra, 12($sp)
    lw      $t0, 8($sp)
    lw      $t1, 4($sp)
    lw      $t3, 0($sp)
    addi    $sp, $sp, 16
    jr      $ra
#--------------------
#bat dau ham gettime
GetTime: #int(v0) GetTime( char* time1(a0), char* time2(a1)
	#backup
	addi $sp, $sp, -20
	sw $ra, ($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	sw $t2, 12($sp)
	sw $t3, 16($sp)

	jal distanceFromFirstDay #lay khoang cach cua time1
	move $t0, $v0		# gan vao t0

	move $t1, $a0		#chuyen dia chi cua time1 vao t1, de hoi swap lai

	move $a0, $a1		#dua a1 vao a0 de goi ham
	jal distanceFromFirstDay # lay khoang cach cua time2
	move $t2, $v0		# chuyen vao t2

	move $t3, $a0		# chuyen dia chia time2 vao t3

	move $a0, $t1		# dua dia chi tine1 vao a0 lai
	move $a1, $t3		# dua dia chi time2 vao a1 lai

	blt $t0, $t2, GetTime.firstLess	# neu t1 < t2, nhay xuong
	sub $t0, $t0, $t2	# nguoc lai t1 >= t2 --> t1 = t1 - t2
	move $v0,  $t0		# gan vao v0 de tra ra
	j GetTime.end
GetTime.firstLess:
	sub $t2, $t2, $t0	#tuong tu cho TH t2 > t1
	move $v0, $t2
GetTime.end:
	#load
	lw $ra, ($sp)
	lw $t0, 4($sp)
	lw $t1, 8($sp)
	lw $t2, 12($sp)
	lw $t3, 16($sp)
	addi $sp, $sp, 20
	jr $ra
#Het ham GetTime

 
#-------------------------
#tool cua tung :)
month_to_string:
    # $a0 - month kieu int
    # $v0 - month kieu tring
    beq     $a0,1,month_to_string.jan
    beq     $a0,2,month_to_string.feb
    beq     $a0,3,month_to_string.mar
    beq     $a0,4,month_to_string.apr
    beq     $a0,5,month_to_string.may
    beq     $a0,6,month_to_string.jun
    beq     $a0,7,month_to_string.jul
    beq     $a0,8,month_to_string.aug
    beq     $a0,9,month_to_string.sep
    beq     $a0,10,month_to_string.oct
    beq     $a0,11,month_to_string.nov
    beq     $a0,12,month_to_string.dec
month_to_string.jan:
    la      $v0, jan
    j       month_to_string.end
month_to_string.feb:
    la      $v0, feb
    j       month_to_string.end
month_to_string.mar:
    la      $v0, mar
    j       month_to_string.end
month_to_string.apr:
    la      $v0, apr
    j       month_to_string.end
month_to_string.may:
    la      $v0, may
    j       month_to_string.end
month_to_string.jun:
    la      $v0, jun
    j       month_to_string.end
month_to_string.jul:
    la      $v0, jul
    j       month_to_string.end
month_to_string.aug:
    la      $v0, aug
    j       month_to_string.end
month_to_string.sep:
    la      $v0, sep
    j       month_to_string.end
month_to_string.oct:
    la      $v0, oct
    j       month_to_string.end
month_to_string.nov:
    la      $v0, nov
    j       month_to_string.end
month_to_string.dec:
    la      $v0, dec
month_to_string.end:
    jr      $ra


strcpy:
    # $a0:  chuoi dich
    # $a1: chuoi nguon
    # khong return
    addi    $sp, $sp, -8
    sw      $ra, 4($sp)
    sw      $t1, 0($sp)
strcpy.loop:
    lb      $t1, 0($a1)
    sb      $t1, 0($a0)
    beq     $t1, $zero, strcpy.end
    addi    $a0, $a0, 1
    addi    $a1, $a1, 1
    j       strcpy.loop
strcpy.end:
    lw      $ra, 4($sp)
    lw      $t1, 0($sp)
    addi    $sp, $sp, 8

    jr      $ra


#---------------------------------------------
	#truyen tham so vao ham kiem tra hop le
	#lw 		$s0, ngay
	#lw 		$s1, thang
	#lw 		$s2, nam
	#jal 		kiemTraHopLe
#Ham kiemTraHopLe
checkInputData: #bool(v0) kiemTraHopLe(char* time(a0))
	#backup
	addi 	$sp, $sp, -28
	sw 		$ra, ($sp)
	sw 		$t0, 4($sp)
	sw 		$t2, 8($sp)
	sw 		$s0, 12($sp)
	sw		$s1, 16($sp)
	sw		$s2, 20($sp)	
	sw		$t1 24($sp)
	#goi ham kiem tra ki tu
	jal characterDetected
	move $s0, $v0

	beq $s0, 0, dataError


	jal Day
	#load vao cac bien tam
	move 	$s0, $v0
	jal Month
	move 	$s1, $v0
	jal Year
	move 	$s2, $v0
	#kiem tra nam
	blt 	$s2, 1, dataError		 # nam < 1 => sai

	#kiem tra thang
	blt 	$s1, 1, dataError	 	# thang < 1 => sai
	bgt 	$s1, 12, dataError 		# thang > 12 => sai

	#Kiem tra Ngay
	li 		$t0, 2
	beq 	$s1, $t0, Feb 		#thang hai xu li rieng

	#Cac thang con lai
	addi	$t0, $s1, -1
	li 		$t2, 4
	mult	$t0, $t2
	mflo	$t0
	lw 		$t2, days_in_month($t0) 		# t2 = thangArr[index] voi index = 4 * (thang  - 1)
	bgt		$s0, $t2, dataError
	j		dataCorrect

Feb:
	jal	 	LeapYear
	move $t1 $v0
	beq 	$t1, 1, Feb_Nhuan 		#t1 = true la nam nhuan
	#neu ko nhuan
	bgt 	$s0, 28, dataError 		# ngay > 28 => sai
	j 		dataCorrect

Feb_Nhuan:
	bgt 	$s0, 29, dataError 		# ngay > 29 => sai
	j 		dataCorrect

dataCorrect:
	li 		$v0, 1
	j 		endInCheckData

dataError:
	li 		$v0, 0

endInCheckData:
	lw 		$ra, ($sp)
	lw 		$t0, 4($sp)
	lw 		$t2, 8($sp)
	lw 		$s0, 12($sp)
	lw		$s1, 16($sp)
	lw		$s2, 20($sp)	
	lw		$t1 24($sp)
	addi 	$sp, $sp, 28
	jr	 	$ra
#Het ham kiemTraHopLe

#-----------------------------------
	#Cach goi ham
	# lw $s2, nam
	# lw $s1, thang
	# lw $s0, ngay
	# jal khoangCachTuNgayMot
#Ham tinh khoang cach tu ngay 1/1/1
distanceFromFirstDay: #int(v0) khoangCachTuNgayMot(char* time(a0))
	#backup
	addi 	$sp, $sp, -48
	sw 		$ra, ($sp)
	sw 		$s3, 4($sp)
	sw 		$s4, 8($sp)
	sw 		$s5, 12($sp)
	sw 		$t0, 16($sp)
	sw 		$t2, 20($sp)
	sw 		$t3, 24($sp)
	sw 		$t4, 28($sp)
	sw		$s0, 32($sp)
	sw		$s1, 36($sp)
	sw		$s2, 40($sp)
	sw		$t1,44($sp)
	
	li $t2, 0	

	#chuyen chuoi time sang so
	jal     Day
	move    $s0, $v0

	jal     Month
	move    $s1, $v0

	jal     Year
	move    $s2, $v0
	#cong ngay
	addi 	$s3, $s0, -1 		# lay day = ngay - 1 

	#cong thang
	li 		$t0, 1 			#t0 la thang dang xet
	li 		$t4, 0 			#t4 la index
	bgt 	$s1, 1, monthCaculateLoop # neu thang > 1 thi nhay vo loop cong
	j 		yearCaculate		# neu thang la 1 thi ko can cong, vd 15/1 chua qua thang 1, cai 15 ngay da co cong ngay lo roi => cong thang ko lam gi het
monthCaculateLoop:
	lw 		$t3, days_in_month($t4) #load gia tri len thanh ghi de xai ham add
	add 	$t2, $t2, $t3 		#cong don vo thanh ghi tam t2
	addi 	$t0, $t0, 1		# tang i len 4 byte
	addi 	$t4, $t4, 4		#tang index len 1 don vi = 4 byte
	blt 	$t0, $s1, monthCaculateLoop # i < thang thi tiep tuc

	#cong don ngay vo s3
	add 	$s3, $s3, $t2 
	
	#sau khi chay loop xong, neu nam nhuan va thang > 2 thi phai cong them 1 ngay la ngay 29 vo
	jal 	LeapYear
	move 	$t1, $v0
	beq 	$t1, 0, yearCaculate 	#neu t1 = 0 => ko nhuan => nhay  vo cong nam
	ble 	$s1, 2, yearCaculate 	#neu thang <= 2 ---> chua qua thang 2, => ko can cong vo => nhay vo cong nam
	addi 	$s3, $s3, 1
yearCaculate:
	addi 	$t0, $s2, -1 		#tong so nam da troi qua = nam - 1
	li 		$t2, 100 

	div 	$t0, $t2 		#lay tong nam / 100
	mflo 	$s4 			# phan thuong = so lan 100 nam
	mfhi 	$t3 			# phan du = so nam con sot lai :v eo biet cmt sao 2 cai dong nay

	li 		$t2, 24
	mult 	$s4, $t2 		#cu moi 100 nam thi co 24 lan nam nhuan, lau lau no nhay len nam 400 800 thi 25 lan
	mflo	$s4 			# truong hop 25 lan xu li khuc duoi

	li 		$t2, 4 			#phan du la cac nam con sot lai, thi cu moi 4 nam nhuan 1 lan
	div 	$t3, $t2 
	mflo 	$t3 			#thuong la so nam nhuan
	add 	$s4, $s4, $t3

	li 		$t2, 400 		#truong hop sot cac nam 400 800 duoc xu li o day
	div 	$t0, $t2 		#chia 400 la ra dc co bao nhieu lan 400 = bay nhieu nam nhuan
	mflo 	$t2
	add 	$s4, $s4, $t2 		#cong don vo s4 thoi

	sub 	$s5, $t0, $s4 		# <=> so nam ko nhuan = tong so nam - so nam nhuan
	
	li 		$t0, 366 		#nhan * 366 
	mult 	$t0, $s4
	mflo 	$s4

	li 		$t0, 365 		# ko nhuan nhan 365
	mult 	$s5, $t0
	mflo 	$s5
	
	add 	$s3, $s3, $s4 		# cong lai het ra so ngay
	add 	$s3, $s3, $s5
	move 	$v0, $s3 		#gan vo t1 de tra ra

	#load
	lw 		$ra, ($sp)
	lw 		$s3, 4($sp)
	lw 		$s4, 8($sp)
	lw 		$s5, 12($sp)
	lw 		$t0, 16($sp)
	lw 		$t2, 20($sp)
	lw 		$t3, 24($sp)
	lw 		$t4, 28($sp)
	lw		$s0, 32($sp)
	lw		$s1, 36($sp)
	lw		$s2, 40($sp)
	lw		$t1  44($sp)
	addi	$sp, $sp, 48
	jr 		$ra
#Het Ham tinh khoang cach tu ngay 1/1/1

#--------------------------
weekDay: #char* homNayLaThuMay(char* time(a0))
	#backup
	addi 	$sp, $sp, -36
	sw 		$ra, ($sp)	
	sw 		$t1, 4($sp)
	sw 		$t2, 8($sp)
	sw 		$t3, 12($sp)
	sw 		$t4, 16($sp)
	sw		$s0, 20($sp)
	sw		$s1, 24($sp)
	sw		$s2, 28($sp)
	sw 		$t0, 32($sp)
	jal 	Day
	move 	$s0, $v0
	
	jal 	Month
	move 	$s1, $v0

	jal		Year
	move 	$s2, $v0
	#dau tien tim xem tu 1/1/1 --> ngay nhap vao la bao nhieu ngay
	jal 	distanceFromFirstDay
	move 	$t1, $v0

	addi 	$t1, $t1, 1 		#do khoang cach thi ko lay ngay 1, nhung tim coi thu may thi can lay ngay 1 nen cong 1


	
	li 		$t0, 7			#ngay 1/1/1 la thu 2
	div 	$t1, $t0		# lay khoang cach tu ngay 1/1/1 den hien tai chia 7 
	mfhi 	$t0			# lay du se ra dc thu trong tuan

	bne $t0, 0, continue
	li $t0, 7

continue:
	
	addi 	$t0, $t0, -1		# tru 1 o day de no truy xuat cai mang thuArr cho dung thoi
	#khoi tao cac gia tri chuan bi tinh toan
	li 		$t2, 5			# cai mang thuArr la cai mang hai chieu nhung cau tao la 1 mang 1 chieu sieu dai
	#li 		$t4, 2			# hoi ki thuat lap trinh ong thay co noi
	#la 		$t1 ,week		# voi co 8 dong tuong ung voi 8 thu trong tuan, moi dong co 8 ki tu
						# vi chu nhat co 8 ki tu, nen t chuan hoa may kia thanh 8 het cho de in ra (khi duyet tung dong)
	#tim chi so de bat dau vong lap
	mult 	$t2, $t0		# vi tri cua thu (tuc la index)  * 5 ki tu moi dong = vi tri bat dau
	mflo 	$t3			# load len t3
	li 		$t2, 5			# t2 = dieu kien ket thuc vong lap
	li 		$t0, 0			# t0 la i, dung de dem so lan lap, moi vo gan = 0
	la      $t4, weekDayName

loopInWeekDay:
	 #luu ki tu vo chuoi
	lb      $t1, week($t3)
	sb      $t1, ($t4)
	addi    $t0, $t0, 1
	addi    $t4, $t4, 1
	addi    $t3, $t3, 1
	blt     $t0, $t2, loopInWeekDay

	#gan vo a0 de tra ve
	la      $v0, weekDayName

	#load
	lw 		$ra, ($sp)	
	lw 		$t1, 4($sp)
	lw 		$t2, 8($sp)
	lw 		$t3, 12($sp)
	lw 		$t4, 16($sp)
	lw		$s0, 20($sp)
	lw		$s1, 24($sp)
	lw		$s2, 28($sp)
	lw 		$t0, 32($sp)
	addi 	$sp, $sp, 36
	jr	 	$ra
#------------------------
#------------------------
#Ham tim 2 nam nhuan ke tiep
findNextLeap: # int(v0, v1) finNextLeap(char* Time(a0))

	addi 	$sp, $sp, -28
	sw 		$ra, ($sp)
	sw 		$t0, 4($sp)
	sw 		$t1, 8($sp)	
	sw 		$s0, 12($sp)
	sw		$s1, 16($sp)
	sw		$t2 20($sp)
	sw		$t3, 24($sp)

	move $s1, $a0 # luu cung a0 load len lai
	la $s0, temp_2		# s0 luu cung temp2

	jal strlen
	move $t0, $v0
	addi $t0, $t0, 1 	#t0 la dieu kien dung
	li $t1, 0		# t1 = i, chay vong lap
	la $t3, temp_2		# t3 dung de chay temp2
cop:
	lb $t2, ($a0)
	sb $t2, ($t3)
	addi $t1, $t1, 1
	addi $t3, $t3, 1
	addi $a0, $a0, 1
	blt $t1, $t0, cop

	move $a0, $s0 # gan dia chi temp2 vo a0 de cac ham hoat dong
	#tim nam nhuan gan nhat
firstYearLoop:
	jal 	timeAddOne		
	jal 	LeapYear
	move 	$t1, $v0	# lay ket qua tra ve gan vo t1
	beq 	$t1, 0, firstYearLoop # neu t1 = 0 => ko nhuan kiem tra tiep, nguoc lai nhuan -->break

	#copy time nhuan sang time2
	jal Year 
	move $v1, $v0 
	
	
	# tim them 2 nam nhuan nua
SecondYearLoop:	
	jal 	timeSubOne		
	jal 	LeapYear
	move 	$t1, $v0	# lay ket qua tra ve gan vo t1
	beq 	$t1, 0, SecondYearLoop # neu t1 = 0 => ko nhuan kiem tra tiep, nguoc lai nhuan -->break
	
	jal Year

	move $a0, $s1
	
	lw      $ra, ($sp)
	lw      $t0, 4($sp)
	lw      $t1, 8($sp)
	lw 	$s0, 12($sp)
	lw	$s1, 16($sp)
	lw	$t2 20($sp)
	lw 	$t2, 24($sp)
	addi    $sp, $sp, 28
#Her ham tim 2 nam nhuan ke tiep

#----------------------------------
#Ham void timeSubOne(char* time(a0))
timeSubOne:
	addi $sp, $sp, -16
	sw $ra, ($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	sw $t2, 12($sp)

	li $t1, '1'
	li $t2, '9'

	lb $t0, 9($a0)
	bge $t0, $t1, timeSubOne.four

	sb $t2, 9($a0)
	
	lb $t0, 8($a0)
	bge $t0, $t1, timeSubOne.three

	sb $t2, 8($a0)

	lb $t0, 7($a0)
	bge $t0, $t1, timeSubOne.two

	sb $t2, 7($a0)

	lb $t0, 6($a0)
	bge $t0, $t1, timeSubOne.one

	sb $t2, 6($a0)
	
timeSubOne.four:
	addi $t0, $t0, -1
	sb $t0, 9($a0)
	j timeSubOne.end

timeSubOne.three:
	addi $t0, $t0, -1
	sb $t0, 8($a0)
	j timeSubOne.end

timeSubOne.two:
	addi $t0, $t0, -1
	sb $t0, 7($a0)
	j timeSubOne.end

timeSubOne.one:
	addi $t0, $t0, -1
	sb $t0, 6($a0)
	j timeSubOne.end

timeSubOne.end:
	
	lw $ra, ($sp)
	lw $t0, 4($sp)
	lw $t1, 8($sp)
	lw $t2, 12($sp)

	addi $sp, $sp, 16
	
	jr $ra
#het ham tru 1 nam

#--------------------------------
#Ham void timeAddOne(char* time(a0))
timeAddOne:
	addi $sp, $sp, -16
	sw $ra, ($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	sw $t2, 12($sp)
	
	li $t1, '8'
	li $t2, '0'

	lb $t0, 9($a0)
	ble $t0, $t1, timeAddOne.four

	
	sb $t2, 9($a0)

	lb $t0, 8($a0)
	ble $t0, $t1, timeAddOne.three

	sb $t2, 8($a0)

	lb $t0, 7($a0)
	ble $t0, $t1, timeAddOne.two

	sb $t2, 7($a0)

	lb $t0, 6($a0)
	ble $t0, $t1, timeAddOne.one

	sb $t2, 6($a0)
timeAddOne.four:
	addi $t0, $t0, 1
	sb $t0, 9($a0)
	j timeAddOne.end

timeAddOne.three:
	addi $t0, $t0, 1
	sb $t0, 8($a0)
	j timeAddOne.end

timeAddOne.two:
	addi $t0, $t0, 1
	sb $t0, 7($a0)
	j timeAddOne.end

timeAddOne.one:
	addi $t0, $t0, 1
	sb $t0, 6($a0)
	j timeAddOne.end

timeAddOne.end:

	lw $ra, ($sp)
	lw $t0, 4($sp)
	lw $t1, 8($sp)
	lw $t2, 12($sp)
	
	addi $sp, $sp, 16
	jr $ra

#-------------------------------------------
#Bat dau ham kiem tra chuoi time co ki tu hay ko
characterDetected:	# bool(v0) characterDetected (char* time(a0))
	#backup
	addi $sp, $sp, -28
	sw $ra, ($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	sw $t2, 12($sp)
	sw $t3, 16($sp)
	sw $t4, 20($sp)	
	sw $t5, 24($sp)

	jal strlen		# lay kich thuoc
	move $t4, $v0 		# luu vao t4

	move $t0, $a0		# chep dia chi vo t0 de chay
	li $t1, 0		# t1 = i dung chay loop
	li $t2, 2		# vi tri dau / dau tien
	li $t3, 5		# vi tri dau / thu 2

scanLoop:
	lb $t5, ($t0)		# load ki tu len t5
	beq $t1, $t2, skip	# kiem tra i neu bang vi tri dau / thu nhat thi skip, ko kiem tra
	beq $t1, $t3, skip	# kiem tra i neu bang vi tri dau / thu hai thi skip, ko kiem tra
	blt $t5, '0', wrongInput	# neu ki tu nho hon '0' => sai
	bgt $t5, '9', wrongInput	# neu ki tu lon hon '9' => sai
	addi $t0, $t0, 1	# tang con tro
	addi $t1, $t1, 1	# tang i
	blt $t1, $t4, scanLoop

	# chui ra toi day la dung het
	li $v0, 1		# 200_OK
	j characterDetected.end # end game

skip:
	addi $t0, $t0, 1	# skip thi tang con tro
	addi $t1, $t1, 1	# va tang i
	blt $t1, $t4, scanLoop  # quay lai vong lap, them cai if kiem tra cho chac thoi

wrongInput:
	li $v0, 0		# 404_Bad_Request
	
	#load
characterDetected.end:

	lw $ra, ($sp)
	lw $t0, 4($sp)
	lw $t1, 8($sp)
	lw $t2, 12($sp)
	lw $t3, 16($sp)
	lw $t4, 20($sp)	
	lw $t5, 24($sp)
	addi $sp, $sp, 28

	jr $ra

#----------------------------------------------------------
end_of_program: # ket thuc chuong trinh
	li 		$v0, 10
	syscall
