.data
	ngay: .word 0
	thang: .word 0
	nam: .word 0
	thangArr: .word 31,28,31,30,31,30,31,31,30,31,30,31 #dung de kiem tra tinh hop le 	
	thuArr: .asciiz "T","h","u"," ","H","a","i"," ", "T","h","u"," ","B","a"," "," ", "T","h","u"," ","T","u"," "," ","T","h","u"," ","N","a","m"," ", "T","h","u"," ","S","a","u"," ", "T","h","u"," ","B","a","y"," ", "C","h","u"," ","N","h","a","t"


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
	
	#Nho doc nguyen mau ham truoc khi goi, vi mot so ham tra ra tham so de tien cho viec tai su dung


.text
	.globl main
main:
	jal		NhapInput				# jump to NhapInput and save position to $ra
	jal		YeuCau1					# jump to YeuCau1 and save position to $ra
	

	lw $s2, nam
	lw $s1, thang
	lw $s0, ngay
	
	jal homNayLaThuMay
	
	
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
	#truyen tham so vao ham kiem tra hop le
	#lw 		$s0, ngay
	#lw 		$s1, thang
	#lw 		$s2, nam
	#jal 		kiemTraHopLe
#Ham kiemTraHopLe
kiemTraHopLe: #bool(t1) kiemTraHopLe(int ngay(s0),int thang(s1), int nam(s2))
	#backup
	addi 		$sp, $sp, -12
	sw 		$ra, ($sp)
	sw 		$t0, 4($sp)
	sw 		$t2, 8($sp)

	#kiem tra nam
	blt 		$s2, 1, FailInKiemTra		 #nam < 1 => sai

	#kiem tra thang
	blt 		$s1, 1, FailInKiemTra	 	# thang < 1 => sai
	bgt 		$s1, 12, FailInKiemTra 		# thang > 12 => sai

	#Kiem tra Ngay
	li 		$t0, 2
	beq 		$s1, $t0, thangHai 		#thang hai xu li rieng

	#Cac thang con lai
	addi		 $t0, $s1, -1
	li 		$t2, 4
	mult		 $t0, $t2
	mflo		 $t0
	lw 		$t2, thangArr($t0) 		# t2 = thangArr[index] voi index = 4 * (thang  - 1)
	bgt		$s0, $t2, FailInKiemTra
	j		 haiTramOK

thangHai:
	jal	 	kiemTraNamNhuan
	beq 		$t1, 1, thangHaiNhuan 		#t1 = true la nam nhuan
	#neu ko nhuan
	bgt 		$s0, 28, FailInKiemTra 		# ngay > 28 => sai
	j 		haiTramOK

thangHaiNhuan:
	bgt 		$s0, 29, FailInKiemTra 		# ngay > 29 => sai
	j 		haiTramOK

haiTramOK:
	li 		$t1, 1
	j 		endInKiemTra

FailInKiemTra:
	li 		$t1, 0

endInKiemTra:
	lw 		$ra, ($sp)
	lw 		$t0, 4($sp)
	lw 		$t2, 8($sp)
	addi 		$sp, $sp, 12
	jr	 	$ra
#Het ham kiemTraHopLe


#------------------------------
	#Cach goi ham
	#lw 		$s2, nam
	#jal 		kiemTraNamNhuan
#Ham kiemTraNamNhuan
kiemTraNamNhuan: #bool(t1) kiemTraNamNhuan(int nam(s2))
	#backup
	addi 		$sp, $sp, -12
	sw 		$ra, ($sp)
	sw 		$t0, 4($sp)
	sw 		$t2, 8($sp)

	#chia cho 400
	li 		$t0, 400
	div 		$s2, $t0
	mfhi 		$t2
	#neu chia het cho 400 la nam nhuan
	beq 		$t2, 0, nhuan
	
	#neu chia het cho 4 va ko chia het cho 100 la nam nhuan
	li 		$t0, 4
	div 		$s2, $t0
	mfhi 		$t2
	bne 		$t2, 0, koNhuan 		#du != 0 => ko nhuan

	#du bang ko thi chia tiep cho 100
	li 		$t0, 100
	div 		$s2, $t0
	mfhi 		$t2
	beq 		$t2, 0, koNhuan 		#chia het cho 100 thi ko nhuan
	j 		nhuan 				# nguoc lai thi nhuan
nhuan:
	li 		$t1, 1 				#tra ra true
	j 		endInKiemTraNhuan
koNhuan:
	li 		$t1, 0 				#tra ra false
endInKiemTraNhuan:
	lw 		$ra, ($sp)
	lw 		$t0, 4($sp)
	lw 		$t2, 8($sp)
	addi 		$sp, $sp, 12
	jr 		$ra
#Het ham kiemTraNamNhuan

#-----------------------------------
	#Cach goi ham
	# lw $s2, nam
	# lw $s1, thang
	# lw $s0, ngay
	# jal khoangCachTuNgayMot
#Ham tinh khoang cach tu ngay 1/1/1
khoangCachTuNgayMot: #int(t1) khoangCachTuNgayMot(int ngay(s0),int thang(s1), int nam(s2))
	#backup
	addi 		$sp, $sp, -32
	sw 		$ra, ($sp)
	sw 		$s3, 4($sp)
	sw 		$s4, 8($sp)
	sw 		$s5, 12($sp)
	sw 		$t0, 16($sp)
	sw 		$t2, 20($sp)
	sw 		$t3, 24($sp)
	sw 		$t4, 28($sp)

	#cong ngay
	addi 		$s3, $s0, -1 		# lay day = ngay - 1 

	#cong thang
	li 		$t0, 1 			#t0 la thang dang xet
	li 		$t4, 0 			#t4 la index
	bgt 		$s1, 1, loopCongThang # neu thang > 1 thi nhay vo loop cong
	j 		congNam 		# neu thang la 1 thi ko can cong, vd 15/1 chua qua thang 1, cai 15 ngay da co cong ngay lo roi => cong thang ko lam gi het
loopCongThang:
	lw 		$t3, thangArr($t4) 	#load gia tri len thanh ghi de xai ham add
	add 		$t2, $t2, $t3 		#cong don vo thanh ghi tam t2
	addi 		$t0, $t0, 1		# tang i len 4 byte
	addi 		$t4, $t4, 4		#tang index len 1 don vi = 4 byte
	blt 		$t0, $s1, loopCongThang # i < thang thi tiep tuc

	#cong don ngay vo s3
	add 		$s3, $s3, $t2 
	
	#sau khi chay loop xong, neu nam nhuan va thang > 2 thi phai cong them 1 ngay la ngay 29 vo
	jal 		kiemTraNamNhuan 
	beq 		$t1, 0, congNam 	#neu t1 = 0 => ko nhuan => nhay  vo cong nam
	ble 		$s1, 2, congNam 	#neu thang <= 2 ---> chua qua thang 2, => ko can cong vo => nhay vo cong nam
	addi 		$s3, $s3, 1
congNam:
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
	move 		$t1, $s3 		#gan vo t1 de tra ra

	#load
	lw 		$ra, ($sp)
	lw 		$s3, 4($sp)
	lw 		$s4, 8($sp)
	lw 		$s5, 12($sp)
	lw 		$t0, 16($sp)
	lw 		$t2, 20($sp)
	lw 		$t3, 24($sp)
	lw 		$t4, 28($sp)
	addi	 	$sp, $sp, 32
	jr 		$ra
#Het Ham tinh khoang cach tu ngay 1/1/1

#-----------------------
#Ham tinh khoang cac giua 2 TIME
khoangCachTime: #int(t1) khoangCachTime(int ngay1(s0), int thang1(s1), int nam1(s2), in ngay2(s3), int thang2(s4), int nam2(s5))
	#backup
	addi 		$sp, $sp, -4
	sw 		$ra, ($sp)
	
	jal 		khoangCachTuNgayMot
	move 		$t0, $t1
	move 		$s0, $s3
	move	 	$s1, $s4
	move 		$s2, $s5
	jal 		khoangCachTuNgayMot
	sub 		$t1, $t1, $t0

	#load
	lw 		$ra, ($sp)
	addi 		$sp, $sp, 4
	jr $ra
#Het ham tinh khoang cac giua 2 TIME

#--------------------------
homNayLaThuMay: #void  homNayLaThuMay(int ngay(s0),int thang(s1), int nam(s2))
	#backup
	addi 		$sp, $sp, -20
	sw 		$ra, ($sp)	
	sw 		$t1, 4($sp)
	sw 		$t2, 8($sp)
	sw 		$t3,	12($sp)
	sw 		$t4,	16($sp)
	#dau tien tim xem tu 1/1/1 --> ngay nhap vao la bao nhieu ngay
	jal 		khoangCachTuNgayMot
	addi 		$t1, $t1, 1 		#do khoang cach thi ko lay ngay 1, nhung tim coi thu may thi can lay ngay 1 nen cong 1
	
	li 		$t0, 7			#ngay 1/1/1 la thu 2
	div 		$t1, $t0		# lay khoang cach tu ngay 1/1/1 den hien tai chia 7 
	mfhi 		$t0			# lay du se ra dc thu trong tuan
	
	addi 		$t0, $t0, -1		# tru 1 o day de no truy xuat cai mang thuArr cho dung thoi
	#khoi tao cac gia tri chuan bi tinh toan
	li 		$t2, 8			# cai mang thuArr la cai mang hai chieu nhung cau tao la 1 mang 1 chieu sieu dai
	li 		$t4, 2			# hoi ki thuat lap trinh ong thay co noi
	la 		$t1 ,thuArr		# voi co 8 dong tuong ung voi 8 thu trong tuan, moi dong co 8 ki tu
						# vi chu nhat co 8 ki tu, nen t chuan hoa may kia thanh 8 het cho de in ra (khi duyet tung dong)
	#tim chi so de bat dau vong lap
	mult 		$t2, $t0		# vi tri cua thu (tuc la index)  * 8 ki tu moi dong = vi tri bat dau
	mflo 		$t3			# load len t3
	mult 		$t3, $t4		# nhung moi ki tu cua no toi 2 byte chu ko phai 1 => * 2 len moi ra dung vi tri bat dau
	mflo 		$t3			# load len t3
	add 		$t1, $t1, $t3		# dong t1 la vi tri dau mang (nhin len 5 dong) + t3 ---> doi con tro len vi tri bat dau
	li 		$t2, 8			# t2 = dieu kien ket thuc vong lap, vi moi dong phai 8 ki tu => mac dinh t2 = 8
	li 		$t0, 0			# t0 la i, dung de dem so lan lap, moi vo gan = 0
	
	#in dau xuong dong cho no dep
	li 		$v0, 11			
	la 		$a0, '\n'
	syscall
loop:
	#in ki tu ra
	li 		$v0, 4			
	move 		$a0, $t1
	syscall
	#tang cac bien dem
	addi		$t0, $t0, 1		# t0 = i = i + 1
	addi 		$t1, $t1, 2		# t1 la vi tri truy xuat vo mang, moi phan tu 2 byte --> t1 = t1 + 2
	blt 		$t0, $t2, loop		# dieu kien dung i < 8

	#load
	lw 		$ra, ($sp)	
	lw 		$t1, 4($sp)
	lw 		$t2, 8($sp)
	lw 		$t3,	12($sp)
	lw 		$t4,	16($sp)
	addi 		$sp, $sp, 20
	jr	 	$ra
