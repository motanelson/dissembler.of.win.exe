	.file	"let.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
 #APP
	.global _var16k 
_var16k:
 .space 16384
 #NO_APP
	.globl	allocvar
	.section	.sbss,"aw",@nobits
	.align	3
	.type	allocvar, @object
	.size	allocvar, 8
allocvar:
	.zero	8
	.text
	.align	1
	.globl	allocs
	.type	allocs, @function
allocs:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	mv	a5,a0
	sw	a5,-36(s0)
	lui	a5,%hi(allocvar)
	ld	a5,%lo(allocvar)(a5)
	sd	a5,-24(s0)
	lui	a5,%hi(allocvar)
	ld	a4,%lo(allocvar)(a5)
	lw	a5,-36(s0)
	addi	a5,a5,1
	add	a4,a4,a5
	lui	a5,%hi(allocvar)
	sd	a4,%lo(allocvar)(a5)
	ld	a5,-24(s0)
	mv	a0,a5
	ld	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	allocs, .-allocs
	.align	1
	.globl	_start
	.type	_start, @function
_start:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	lui	a5,%hi(_var16k)
	ld	a4,%lo(_var16k)(a5)
	lui	a5,%hi(allocvar)
	sd	a4,%lo(allocvar)(a5)
	li	a0,100
	call	allocs
	sd	a0,-24(s0)
	li	a0,100
	call	allocs
	sd	a0,-32(s0)
	li	a5,0
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	_start, .-_start
	.ident	"GCC: (13.2.0-11ubuntu1+12) 13.2.0"
