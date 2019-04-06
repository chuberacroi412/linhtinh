.data
	ngay: .word 0
	thang: .word 0
	nam: .word 0
	thangArr: .word 31,29,31,30,31,30,31,31,30,31,30,31 #dung de kiem tra tinh hop le 	

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
	jal kiemTraNamNhuan
	
	move $a0, $t1
	li $v0, 1
	syscall
	
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
	blt 		$s2, 1, FailInKiemTra #nam < 1 => sai

	#kiem tra thang
	blt 		$s1, 1, FailInKiemTra # thang < 1 => sai
	bgt 		$s1, 12, FailInKiemTra # thang > 12 => sai

	#Kiem tra Ngay
	li 		$t0, 2
	beq 		$s1, $t0, thangHai #thang hai xu li rieng

	#Cac thang con lai
	addi		 $t0, $s1, -1
	li 		$t2, 4
	mult		 $t0, $t2
	mflo		 $t0
	lw 		$t2, thangArr($t0) # t2 = thangArr[index] voi index = 4 * (thang  - 1)
	bgt		$s0, $t2, FailInKiemTra
	j		 haiTramOK

thangHai:
	jal	 	kiemTraNamNhuan
	beq 		$t1, 1, thangHaiNhuan #t1 = true la nam nhuan
	#neu ko nhuan
	bgt 		$s0, 28, FailInKiemTra # ngay > 28 => sai
	j 		haiTramOK

thangHaiNhuan:
	bgt 		$s0, 29, FailInKiemTra # ngay > 29 => sai
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
	bne 		$t2, 0, koNhuan #du != 0 => ko nhuan

	#du bang ko thi chia tiep cho 100
	li 		$t0, 100
	div 		$s2, $t0
	mfhi 		$t2
	beq 		$t2, 0, koNhuan #chia het cho 100 thi ko nhuan
	j 		nhuan # nguoc lai thi nhuan
nhuan:
	li 		$t1, 1 #tra ra true
	j 		endInKiemTraNhuan
koNhuan:
	li 		$t1, 0 #tra ra false
endInKiemTraNhuan:
	lw 		$ra, ($sp)
	lw 		$t0, 4($sp)
	lw 		$t2, 8($sp)
	addi 		$sp, $sp, 12
	jr 		$ra
#Het ham kiemTraNamNhuan
