.data
	ngay: .space 3
	thang: .space 3
	nam: .space 5

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

	ketqua: .asciiz "\nKet qua: "


.text
	.globl main
main:
	jal		NhapInput				# jump to NhapInput and save position to $ra
	jal		YeuCau1				# jump to YeuCau1 and save position to $ra


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
	li 		$v0, 8
	la 		$a0, ngay
	li 		$a1, 3
	syscall

	# Nhap thang
	li 		$v0, 4
	la 		$a0, tb2
	syscall
	li 		$v0, 8
	la 		$a0, thang
	li 		$a1, 3
	syscall

	# Nhap nam
	li 		$v0, 4
	la 		$a0, tb3
	syscall
	li 		$v0, 8
	la 		$a0, nam
	li 		$a1, 5
	syscall

	# Ket thuc thu tuc
	lw 		$ra, 12($sp)
	lw 		$a0, 8($sp)
	lw 		$a1, 4($sp)
	lw 		$v0, 0($sp)
	addi 	$sp, $sp, 16

	jr 		$ra

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
	la		$a0, ngay
	syscall
	li 		$v0, 11
	li		$a0, '/'
	syscall
	li		$v0, 4
	la		$a0, thang
	syscall
	li 		$v0, 11
	li		$a0, '/'
	syscall
	li 		$v0, 4
	la		$a0, nam
	syscall

	# Ket thuc thu tuc
	lw		$ra, 8($sp)		# 
	lw		$a0, 4($sp)		# 
	lw		$v0, 0($sp)		# 
	addi	$sp, $sp, 12			# $sp = $sp + 12

	jr		$ra

Exit:
	li 		$v0, 10
	syscall