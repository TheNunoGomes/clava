	.file	"randWrapper.c"
	.text
	.p2align 4
	.globl	randWrapper
	.type	randWrapper, @function
randWrapper:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pxor	%xmm0, %xmm0
	movl	%edi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	%esi, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	fSetArray@PLT
	testl	%ebp, %ebp
	jle	.L1
	testl	%ebx, %ebx
	jle	.L1
	movapd	.LC3(%rip), %xmm7
	movl	(%rax), %edi
	xorl	%r10d, %r10d
	leal	-1(%rbx), %esi
	movsd	.LC7(%rip), %xmm14
	movdqa	.LC2(%rip), %xmm10
	movapd	.LC4(%rip), %xmm6
	movapd	%xmm7, %xmm9
	movsd	.LC6(%rip), %xmm13
	movdqa	.LC5(%rip), %xmm12
	movapd	%xmm14, %xmm15
	movdqa	%xmm10, %xmm11
	movapd	%xmm6, %xmm8
	.p2align 4,,10
	.p2align 3
.L4:
	pxor	%xmm2, %xmm2
	movl	%r10d, %r9d
	movl	%r10d, %r8d
	cvtsi2sdl	%r10d, %xmm2
	imull	%edi, %r9d
	cmpl	%r10d, %esi
	cmovle	%esi, %r8d
	addsd	%xmm13, %xmm2
	leal	1(%r8), %r11d
	cmpl	$2, %r8d
	jle	.L22
	movl	%r11d, %ecx
	movslq	%r9d, %rdx
	movapd	%xmm2, %xmm5
	movdqa	.LC0(%rip), %xmm4
	shrl	$2, %ecx
	leaq	8(%rax,%rdx,4), %rdx
	unpcklpd	%xmm5, %xmm5
	salq	$4, %rcx
	addq	%rdx, %rcx
	.p2align 4,,10
	.p2align 3
.L5:
	movdqa	%xmm4, %xmm3
	addq	$16, %rdx
	paddd	%xmm10, %xmm4
	pshufd	$238, %xmm3, %xmm1
	cvtdq2pd	%xmm3, %xmm0
	addpd	%xmm7, %xmm0
	paddd	%xmm12, %xmm3
	cvtdq2pd	%xmm1, %xmm1
	addpd	%xmm7, %xmm1
	divpd	%xmm5, %xmm0
	divpd	%xmm5, %xmm1
	mulpd	%xmm6, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	mulpd	%xmm6, %xmm1
	cvtpd2ps	%xmm1, %xmm1
	movlhps	%xmm1, %xmm0
	movups	%xmm0, -16(%rdx)
	cmpq	%rdx, %rcx
	jne	.L5
	movl	%r11d, %ecx
	pshufd	$255, %xmm3, %xmm3
	andl	$-4, %ecx
	andl	$3, %r11d
	movd	%xmm3, %edx
	je	.L6
.L13:
	pxor	%xmm0, %xmm0
	leal	(%r9,%rcx), %edx
	cvtsi2sdl	%ecx, %xmm0
	movslq	%edx, %rdx
	addsd	%xmm13, %xmm0
	divsd	%xmm2, %xmm0
	mulsd	%xmm14, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 8(%rax,%rdx,4)
	leal	1(%rcx), %edx
	cmpl	%edx, %r8d
	jl	.L6
	pxor	%xmm0, %xmm0
	leal	(%r9,%rdx), %r11d
	cvtsi2sdl	%edx, %xmm0
	movslq	%r11d, %r11
	leal	2(%rcx), %edx
	addsd	%xmm13, %xmm0
	divsd	%xmm2, %xmm0
	mulsd	%xmm14, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 8(%rax,%r11,4)
	cmpl	%edx, %r8d
	jl	.L6
	pxor	%xmm0, %xmm0
	leal	(%r9,%rdx), %r8d
	cvtsi2sdl	%edx, %xmm0
	movslq	%r8d, %r8
	leal	3(%rcx), %edx
	addsd	%xmm13, %xmm0
	divsd	%xmm2, %xmm0
	mulsd	%xmm14, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 8(%rax,%r8,4)
.L6:
	cmpl	%edx, %ebx
	jle	.L10
	movl	%ebx, %r11d
	subl	%edx, %r11d
	leal	-1(%r11), %ecx
	cmpl	$2, %ecx
	jbe	.L7
	movslq	%edx, %r8
	movslq	%r9d, %rcx
	movd	%edx, %xmm4
	leaq	2(%rcx,%r8), %rcx
	movl	%r11d, %r8d
	pshufd	$0, %xmm4, %xmm3
	shrl	$2, %r8d
	movapd	%xmm2, %xmm4
	leaq	(%rax,%rcx,4), %rcx
	salq	$4, %r8
	paddd	.LC0(%rip), %xmm3
	unpcklpd	%xmm4, %xmm4
	addq	%rcx, %r8
	.p2align 4,,10
	.p2align 3
.L8:
	movdqa	%xmm3, %xmm0
	movapd	%xmm4, %xmm5
	addq	$16, %rcx
	cvtdq2pd	%xmm0, %xmm1
	addpd	%xmm9, %xmm1
	pshufd	$238, %xmm0, %xmm0
	paddd	%xmm11, %xmm3
	cvtdq2pd	%xmm0, %xmm0
	addpd	%xmm9, %xmm0
	divpd	%xmm1, %xmm5
	movapd	%xmm5, %xmm1
	movapd	%xmm4, %xmm5
	divpd	%xmm0, %xmm5
	mulpd	%xmm8, %xmm1
	cvtpd2ps	%xmm1, %xmm1
	movapd	%xmm5, %xmm0
	mulpd	%xmm8, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movlhps	%xmm0, %xmm1
	movups	%xmm1, -16(%rcx)
	cmpq	%r8, %rcx
	jne	.L8
	movl	%r11d, %ecx
	andl	$-4, %ecx
	addl	%ecx, %edx
	cmpl	%ecx, %r11d
	je	.L10
.L7:
	pxor	%xmm0, %xmm0
	movapd	%xmm2, %xmm4
	leal	(%r9,%rdx), %ecx
	cvtsi2sdl	%edx, %xmm0
	movslq	%ecx, %rcx
	addsd	%xmm13, %xmm0
	divsd	%xmm0, %xmm4
	movapd	%xmm4, %xmm0
	mulsd	%xmm15, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 8(%rax,%rcx,4)
	leal	1(%rdx), %ecx
	cmpl	%ecx, %ebx
	jle	.L10
	pxor	%xmm0, %xmm0
	movapd	%xmm2, %xmm4
	leal	(%rcx,%r9), %r8d
	addl	$2, %edx
	cvtsi2sdl	%ecx, %xmm0
	movslq	%r8d, %r8
	addsd	%xmm13, %xmm0
	divsd	%xmm0, %xmm4
	movapd	%xmm4, %xmm0
	mulsd	%xmm15, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 8(%rax,%r8,4)
	cmpl	%ebx, %edx
	jge	.L10
	pxor	%xmm0, %xmm0
	addl	%edx, %r9d
	cvtsi2sdl	%edx, %xmm0
	movslq	%r9d, %r9
	addsd	%xmm13, %xmm0
	divsd	%xmm0, %xmm2
	pxor	%xmm0, %xmm0
	mulsd	%xmm15, %xmm2
	cvtsd2ss	%xmm2, %xmm0
	movss	%xmm0, 8(%rax,%r9,4)
.L10:
	addl	$1, %r10d
	cmpl	%r10d, %ebp
	jne	.L4
.L1:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L22:
	.cfi_restore_state
	xorl	%ecx, %ecx
	jmp	.L13
	.cfi_endproc
.LFE39:
	.size	randWrapper, .-randWrapper
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC2:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC3:
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.align 16
.LC4:
	.long	3221225472
	.long	1072483532
	.long	3221225472
	.long	1072483532
	.align 16
.LC5:
	.long	1
	.long	1
	.long	1
	.long	1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC6:
	.long	0
	.long	1072693248
	.align 8
.LC7:
	.long	3221225472
	.long	1072483532
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
