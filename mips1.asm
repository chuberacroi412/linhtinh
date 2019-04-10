.data
	weekDayName: .space 3 #dung trong ham weekday
	temp_2: .space 20 # dung trong convert
	ngay: .word 0
	thang: .word 0
	nam: .word 0
	days_in_month: .word 31,28,31,30,31,30,31,31,30,31,30,31 #dung de kiem tra tinh hop le
	length_of_month_string: .byte 7, 8, 5, 5, 3, 4, 4, 6, 9, 7, 8, 8 #do dai chuoi ki tu cua cac thang, dung trong convert.C
	
	week: .byte 'M','o','n',' ',' ','T','u','e','s',' ','W','e','d',' ',' ','T','h','u','e','s','F','r','i',' ',' ','S','a','t',' ',' ','S','u','n',' ',' '
	# thong bao
	tb1: .asciiz "\nNhap ngay: "
	tb2: .asciiz "\nNhap thang: "
	tb3: .asciiz "\nNhap nam: "

	menu: .asciiz "\nBan hay chon 1 trong so cac thong bao duoi day\n"
	chon1: .asciiz "1. Xuat chuoi TIME theo dinh dang DD/MM/YYYY\n"
	chon2: .asciiz "2. Chuyen doi chuoi TIME thanh cac dinh dang sau:\n"
	chon2a: .asciiz "\ta. MM/DD/YYY\b"
	chon2b: .asciiz "\tb. Month DD, YYYY\n"
	chon2c: .asciiz "\tc. DD Month, YYYY\n"
	tbNhuan: .asciiz "\nNam nhuan"
	tbKoNhuan: .asciiz "\nNam khong nhuan"

	ketqua: .asciiz "\nKet qua: "
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
	
	#Nho doc nguyen mau ham truoc khi goi, vi mot so ham tra ra tham so de tien cho viec tai su dung


.text
	.globl main
main:
	

	
	
	j Exit
	



#------------------------- function ----------------------------------
NhapInput:
	# Dau thu tuc
	addi 	$sp, $sp, -16
	sw 		$ra, 12($sp)
	sw 		$a0, 8($sp)
	sw 		$a1, 4($sp)
	sw 		$v0, 0($sp)
	
	# Than thu tuc
	# Nhap ngay 
	li 		$v0, 4
	la 		$a0, tb1
	syscall

	li 		$v0, 5
	syscall
	sw $v0, ngay

	# Nhap thang
	li 		$v0, 4
	la 		$a0, tb2
	syscall

	li 		$v0, 5
	syscall
	sw $v0, thang

	# Nhap nam
	li 		$v0, 4
	la 		$a0, tb3
	syscall

	li 		$v0, 5
	syscall
	sw 		$v0, nam

	# Ket thuc thu tuc
	lw 		$ra, 12($sp)
	lw 		$a0, 8($sp)
	lw 		$a1, 4($sp)
	lw 		$v0, 0($sp)
	addi 		$sp, $sp, 16

	jr 		$ra

#-----------------------------
YeuCau1:
	# Dau thu tuc
	addi	$sp, $sp, -12			# $sp = $sp + -12
	sw		$ra, 8($sp)		# 
	sw		$a0, 4($sp)		# 
	sw		$v0, 0($sp)		# 

	# Than thu tuc
	li		$v0, 4
	la		$a0, ketqua
	syscall
	
	li 		$v0, 1
	lw		$a0, ngay
	syscall
	
	li 		$v0, 11
	li		$a0, '/'
	syscall
	
	li		$v0, 1
	lw		$a0, thang
	syscall

	li 		$v0, 11
	li		$a0, '/'
	syscall

	li 		$v0, 1
	lw		$a0, nam
	syscall

	# Ket thuc thu tuc
	lw		$ra, 8($sp)		# 
	lw		$a0, 4($sp)		# 
	lw		$v0, 0($sp)		# 
	addi		$sp, $sp, 12			# $sp = $sp + 12

	jr		$ra

Exit:
	li 		$v0, 10
	syscall
#---------------------------------------------
#kiemTraKiTu: # bool(v0) kiemTraKiTu(
#waiting report from my friend

#---------------------------------------------
	#truyen tham so vao ham kiem tra hop le
	#lw 		$s0, ngay
	#lw 		$s1, thang
	#lw 		$s2, nam
	#jal 		kiemTraHopLe
#Ham kiemTraHopLe
checkInputData: #bool(v0) kiemTraHopLe(char* time(a0))
	#backup
	addi 		$sp, $sp, -24
	sw 		$ra, ($sp)
	sw 		$t0, 4($sp)
	sw 		$t2, 8($sp)
	sw 		$s0, 12($sp)
	sw		$s1, 16($sp)
	sw		$s2, 20($sp)	
	
	jal Day
	#load vao cac bien tam
	move 		$s0, $v0
	jal Month
	move 		$s1, $v0
	jal Year
	move 		$s2, $v0
	#kiem tra nam
	blt 		$s2, 1, dataError		 # nam < 1 => sai

	#kiem tra thang
	blt 		$s1, 1, dataError	 	# thang < 1 => sai
	bgt 		$s1, 12, dataError 		# thang > 12 => sai

	#Kiem tra Ngay
	li 		$t0, 2
	beq 		$s1, $t0, Feb 		#thang hai xu li rieng

	#Cac thang con lai
	addi		 $t0, $s1, -1
	li 		$t2, 4
	mult		 $t0, $t2
	mflo		 $t0
	lw 		$t2, days_in_month($t0) 		# t2 = thangArr[index] voi index = 4 * (thang  - 1)
	bgt		$s0, $t2, dataError
	j		dataCorrect

Feb:
	jal	 	LeapYear
	beq 		$t1, 1, Feb_Nhuan 		#t1 = true la nam nhuan
	#neu ko nhuan
	bgt 		$s0, 28, dataError 		# ngay > 28 => sai
	j 		dataCorrect

Feb_Nhuan:
	bgt 		$s0, 29, dataError 		# ngay > 29 => sai
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
	addi 		$sp, $sp, 24
	jr	 	$ra
#Het ham kiemTraHopLe
#-------------------------------

LeapYear:
    # $a0 - TIME
    addi    $sp, $sp, -4
    sw      $ra, 0($sp)

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
    lw      $ra, 0($sp)
    addi    $sp, $sp, 4
    jr      $ra

Day:
    # $a0 - TIME
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
    add    $t2, $t2, $t1

    lw      $ra, 12($sp)
    lw      $t0, 8($sp)
    lw      $t1, 4($sp)
    lw      $t2, 0($sp)
    addi    $sp, $sp, 16

    move    $v0, $t2
    jr      $ra

Month:
    # $a0 - TIME
    addi    $sp, $sp, -4
    sw      $ra, 0($sp)

    li      $t0, 10
    lb      $t1, 3($a0)
    addi    $t1, $t1, -48
    mult	$t0, $t1			# $t0 * $t1 = Hi and Lo registers
    mflo	$t2					# copy Lo to $t2
    lb      $t1, 4($a0)
    addi    $t1, $t1, -48
    add    $t2, $t2, $t1

    lw      $ra, 0($sp)
    addi    $sp, $sp, 4

    move    $v0, $t2
    jr      $ra

Year:
    # $a0 - TIME
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
#---------------------------------



#-----------------------------------
	#Cach goi ham
	# lw $s2, nam
	# lw $s1, thang
	# lw $s0, ngay
	# jal khoangCachTuNgayMot
#Ham tinh khoang cach tu ngay 1/1/1
distanceFromFirstDay: #int(v0) khoangCachTuNgayMot(char* time(a0))
	#backup
	addi 		$sp, $sp, -44
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
	
	#chuyen chuoi time sang so
	jal Day
	move $s0, $v0

	jal Month
	move $s1, $v0

	jal Year
	move $s2, $v0
	#cong ngay
	addi 		$s3, $s0, -1 		# lay day = ngay - 1 

	#cong thang
	li 		$t0, 1 			#t0 la thang dang xet
	li 		$t4, 0 			#t4 la index
	bgt 		$s1, 1, monthCaculateLoop # neu thang > 1 thi nhay vo loop cong
	j 		yearCaculate		# neu thang la 1 thi ko can cong, vd 15/1 chua qua thang 1, cai 15 ngay da co cong ngay lo roi => cong thang ko lam gi het
monthCaculateLoop:
	lw 		$t3, days_in_month($t4) #load gia tri len thanh ghi de xai ham add
	add 		$t2, $t2, $t3 		#cong don vo thanh ghi tam t2
	addi 		$t0, $t0, 1		# tang i len 4 byte
	addi 		$t4, $t4, 4		#tang index len 1 don vi = 4 byte
	blt 		$t0, $s1, monthCaculateLoop # i < thang thi tiep tuc

	#cong don ngay vo s3
	add 		$s3, $s3, $t2 
	
	#sau khi chay loop xong, neu nam nhuan va thang > 2 thi phai cong them 1 ngay la ngay 29 vo
	jal 		LeapYear
	beq 		$t1, 0, yearCaculate 	#neu t1 = 0 => ko nhuan => nhay  vo cong nam
	ble 		$s1, 2, yearCaculate 	#neu thang <= 2 ---> chua qua thang 2, => ko can cong vo => nhay vo cong nam
	addi 		$s3, $s3, 1
yearCaculate:
	addi 		$t0, $s2, -1 		#tong so nam da troi qua = nam - 1
	li 		$t2, 100 

	div 		$t0, $t2 		#lay tong nam / 100
	mflo 		$s4 			# phan thuong = so lan 100 nam
	mfhi 		$t3 			# phan du = so nam con sot lai :v eo biet cmt sao 2 cai dong nay

	li 		$t2, 24
	mult 		$s4, $t2 		#cu moi 100 nam thi co 24 lan nam nhuan, lau lau no nhay len nam 400 800 thi 25 lan
	mflo	 	$s4 			# truong hop 25 lan xu li khuc duoi

	li 		$t2, 4 			#phan du la cac nam con sot lai, thi cu moi 4 nam nhuan 1 lan
	div 		$t3, $t2 
	mflo 		$t3 			#thuong la so nam nhuan
	add 		$s4, $s4, $t3

	li 		$t2, 400 		#truong hop sot cac nam 400 800 duoc xu li o day
	div 		$t0, $t2 		#chia 400 la ra dc co bao nhieu lan 400 = bay nhieu nam nhuan
	mflo 		$t2
	add 		$s4, $s4, $t2 		#cong don vo s4 thoi

	sub 		$s5, $t0, $s4 		# <=> so nam ko nhuan = tong so nam - so nam nhuan
	
	li 		$t0, 366 		#nhan * 366 
	mult 		$t0, $s4
	mflo 		$s4

	li 		$t0, 365 		# ko nhuan nhan 365
	mult 		$s5, $t0
	mflo 		$s5
	
	add 		$s3, $s3, $s4 		# cong lai het ra so ngay
	add 		$s3, $s3, $s5
	move 		$v0, $s3 		#gan vo t1 de tra ra

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
	addi	 	$sp, $sp, 44
	jr 		$ra
#Het Ham tinh khoang cach tu ngay 1/1/1

#--------------------------
weekDay: #char* homNayLaThuMay(char* time(a0))
	#backup
	addi 		$sp, $sp, -36
	sw 		$ra, ($sp)	
	sw 		$t1, 4($sp)
	sw 		$t2, 8($sp)
	sw 		$t3, 12($sp)
	sw 		$t4, 16($sp)
	sw		$s0, 20($sp)
	sw		$s1, 24($sp)
	sw		$s2, 28($sp)
	sw 		$t0, 32($sp)
	jal 		Day
	move 		$s0, $v0
	
	jal 		Month
	move 		$s1, $v0

	jal		Year
	move 		$s2, $v0
	#dau tien tim xem tu 1/1/1 --> ngay nhap vao la bao nhieu ngay
	jal 		distanceFromFirstDay
	move 		$t1, $v0
	addi 		$t1, $t1, 1 		#do khoang cach thi ko lay ngay 1, nhung tim coi thu may thi can lay ngay 1 nen cong 1
	
	li 		$t0, 7			#ngay 1/1/1 la thu 2
	div 		$t1, $t0		# lay khoang cach tu ngay 1/1/1 den hien tai chia 7 
	mfhi 		$t0			# lay du se ra dc thu trong tuan
	
	addi 		$t0, $t0, -1		# tru 1 o day de no truy xuat cai mang thuArr cho dung thoi
	#khoi tao cac gia tri chuan bi tinh toan
	li 		$t2, 5			# cai mang thuArr la cai mang hai chieu nhung cau tao la 1 mang 1 chieu sieu dai
	#li 		$t4, 2			# hoi ki thuat lap trinh ong thay co noi
	#la 		$t1 ,week		# voi co 8 dong tuong ung voi 8 thu trong tuan, moi dong co 8 ki tu
						# vi chu nhat co 8 ki tu, nen t chuan hoa may kia thanh 8 het cho de in ra (khi duyet tung dong)
	#tim chi so de bat dau vong lap
	mult 		$t2, $t0		# vi tri cua thu (tuc la index)  * 5 ki tu moi dong = vi tri bat dau
	mflo 		$t3			# load len t3
	li 		$t2, 5			# t2 = dieu kien ket thuc vong lap
	li 		$t0, 0			# t0 la i, dung de dem so lan lap, moi vo gan = 0
	la $t4, weekDayName

loopInWeekDay:
	 #luu ki tu vo chuoi
	lb $t1, week($t3)
	sb $t1, ($t4)
	addi $t0, $t0, 1
	addi $t4, $t4, 1
	addi $t3, $t3, 1
	blt $t0, $t2, loopInWeekDay

	#gan vo a0 de tra ve
	la $v0, weekDayName

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
	addi 		$sp, $sp, 36
	jr	 	$ra
#------------------------
#Ham tim 2 nam nhuan ke tiep
findNextLeap: # int(v0, v1) finNextLeap(char* Time(a0))

	addi 		$sp, $sp, -12
	sw 		$ra, ($sp)
	sw 		$t0, 4($sp)
	sw 		$t1, 8($sp)

	jal 		Year		#lay cai nam ra	
	move 		$t0, $v0	# gan nam vo t0
	
	#tim nam nhuan gan nhat
firstYearLoop:
	move 		$a0, $t0	# gan t0 vo a0 de goi ham kiem tra nam nhuan
	jal 		LeapYear
	move 		$t1, $v0	# lay ket qua tra ve gan vo t1
	addi 		$t0, $t0, 1	# tang nam len 1 don vi (chu y cho nay)
	beq 		$t1, 0, firstYearLoop # neu t1 = 0 => ko nhuan kiem tra tiep, nguoc lai nhuan -->break

	addi 		$t0, $t0, -1	# do o tren auto tang nam len 1, nen khi t1 = 1 phai tru lai mot nam
	move 		$v1, $t0	# gan ket qua vo v1
	addi 		$t0, $t0, 1	# tang nam len 1 de kiem tra tiep, (ngay dong nay do t0 da la nam nhuan
					# nen +4 xac suat ra nam nhuan se cao hon, nhung t ko muon dot pha :) )
	# tim them 2 nam nhuan nua
SecondYearLoop:	
	move 		$a0, $t0 	#y nhu tren
	jal 		LeapYear	
	move 		$t1, $v0
	addi 		$t0, $t0, 1	
	beq 		$t1, 0, SecondYearLoop

	addi $t0, $t0, -1
	move $v0, $t0		#gan ket qua vo v0, het ham 

	lw $ra, ($sp)
	lw $t0, 4($sp)
	lw $t1, 8($sp)
	addi $sp, $sp, 12
#Her ham tim 2 nam nhuan ke tiep
Convert:
    # $a0 - TIME
    # $a1 - type
    # khong co return, thay doi truc tiep tren $a0
    addi    $sp, $sp, -50
	sw 	$t0, 46($sp)
	sw 	$t1, 44($sp)
	sw 	$t2, 40($sp)
	sw 	$t3, 36($sp)
	sw 	$t4, 32($sp)
    sw      $ra, 28($sp)
    sw      $a0, 24($sp)
    sw      $a1, 20($sp)

    beq     $a1, 65, Convert.A      # 'A' = 65
    beq     $a1, 66, Convert.B      # 'B' = 66
    beq     $a1, 67, Convert.C      # 'C' = 67

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
    
	#DD month, YYYY
    Convert.C:
	move 	$t0, $a0	# chep dia chi tu a0 vao t0
	move 	$s1, $a0 	# dung s1 de luu vinh vien dia chi a0, tranh truong hop goi ham lung tung a0 bi ghi de
	la 	$s0, temp_2	# load dia chi temp_2 vao s0

	#chep YYYY vao tenp_2
	lb	$t1, 6($t0)
	sb 	$t1, 0($s0)
	lb 	$t1, 7($t0)
	sb 	$t1, 1($s0)
	lb 	$t1, 8($t0)
	sb 	$t1, 2($s0)
	lb 	$t1, 9($t0)
	sb 	$t1, 3($s0)
	lb 	$t1, 10($t0)
	sb 	$t1, 4($s0)
	
	jal     Month #lay gia tri int cua thang
	move 	$t1, $v0 # gan vao t0
	addi 	$t1, $t1, -1 # tru di 1 de truy xuat vo cai length_of_month_string
	lb 	$t2, length_of_month_string($t1) # gan do dai chuoi thang vao t2

   	move    $a0, $v0
   	jal     month_to_string
	move 	$t1, $v0 # gan dia chia cua cai chuoi thang vo t1

	#bat dau chinh tren a0
	#2 ki tu dau la DD giu nguyen, tiep theo la ki tu khoang trang
	move $t4, $s1
	addi $t4, $t4, 2 # doi len vi tri can them khoang trong
	li $t0, ' '
	sb $t0, ($t4)
	addi $t4, $t4, 1 # tang len 1 don vi nua de vo vong lap


	li $t3, 0 # t3 = i = 0 dung de chay loop
addMonthLoop:
	lb $t0, ($t1)
	sb $t0, ($t4)
	addi $t1, $t1, 1 #tang vi tri chuoi thang
	addi $t4, $t4, 1 #tang vi tri chuoi tra ra
	addi $t3, $t3, 1 #tang bien dem
	blt $t3, $t2, addMonthLoop

	#add xong thang vo chuoi, gio toi dau ',' va cai nam
	li $t0, ','
	sb $t0, ($t4) 
	addi $t4, $t4, 1	

	li $t3, 0 # t3 = i = 0 dung de chay loop
addYearLoop:
	lb $t0, ($s0) # nhac lai  la s0 la con luu dia chi temp_2 chua gia tri cua YYYY
	sb $t0, ($t4)
	addi $t4, $t4, 1
	addi $s0, $s0, 1
	addi $t3, $t3, 1 
	blt $t3, 4, addYearLoop

	#xong gan dia chi s1 vo v0 la tra ra
	move $v0, $s1

    Convert.end:
      
	lw 	$t0, 46($sp)
	lw 	$t1, 44($sp)
	lw 	$t2, 40($sp)
	lw 	$t3, 36($sp)
	lw 	$t4, 32($sp)
    lw      $ra, 28($sp)
    lw      $a0, 24($sp)
    lw      $a1, 20($sp)
	addi    $sp, $sp, 50
    jr      $ra
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

