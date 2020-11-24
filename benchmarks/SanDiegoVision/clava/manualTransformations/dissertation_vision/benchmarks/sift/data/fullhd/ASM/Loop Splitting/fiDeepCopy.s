	.file	"fiDeepCopy.c"
	.text
	.p2align 4
	.globl	fiDeepCopy
	.type	fiDeepCopy, @function
fiDeepCopy:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movl	4(%rdi), %r12d
	movl	(%rdi), %ebp
	movl	%r12d, %edi
	movl	%ebp, %esi
	call	fMallocHandle@PLT
	testl	%r12d, %r12d
	jle	.L1
	testl	%ebp, %ebp
	jle	.L1
	movl	%ebp, %ecx
	movl	%ebp, %edi
	movl	(%rbx), %r10d
	movl	(%rax), %r9d
	shrl	$2, %ecx
	leal	-1(%rbp), %r8d
	andl	$-4, %edi
	xorl	%esi, %esi
	salq	$4, %rcx
	pxor	%xmm3, %xmm3
	pxor	%xmm2, %xmm2
	.p2align 4,,10
	.p2align 3
.L3:
	movl	%r10d, %r13d
	movl	%r9d, %r11d
	imull	%esi, %r13d
	imull	%esi, %r11d
	cmpl	$2, %r8d
	jbe	.L13
	movslq	%r13d, %rdx
	leaq	8(%rbx,%rdx,4), %r15
	movslq	%r11d, %rdx
	leaq	8(%rax,%rdx,4), %r14
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L4:
	movdqu	(%r15,%rdx), %xmm4
	cvtdq2pd	(%r15,%rdx), %xmm1
	addpd	%xmm2, %xmm1
	pshufd	$238, %xmm4, %xmm0
	cvtdq2pd	%xmm0, %xmm0
	addpd	%xmm2, %xmm0
	cvtpd2ps	%xmm1, %xmm1
	cvtpd2ps	%xmm0, %xmm0
	movlhps	%xmm0, %xmm1
	movups	%xmm1, (%r14,%rdx)
	addq	$16, %rdx
	cmpq	%rcx, %rdx
	jne	.L4
	movl	%edi, %edx
	cmpl	%ebp, %edi
	je	.L5
.L6:
	leal	0(%r13,%rdx), %r15d
	pxor	%xmm0, %xmm0
	leal	(%r11,%rdx), %r14d
	movslq	%r15d, %r15
	movslq	%r14d, %r14
	cvtsi2sdl	8(%rbx,%r15,4), %xmm0
	addsd	%xmm3, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 8(%rax,%r14,4)
	leal	1(%rdx), %r14d
	cmpl	%r14d, %ebp
	jle	.L5
	leal	(%r11,%r14), %r15d
	addl	%r13d, %r14d
	pxor	%xmm0, %xmm0
	addl	$2, %edx
	movslq	%r14d, %r14
	movslq	%r15d, %r15
	cvtsi2sdl	8(%rbx,%r14,4), %xmm0
	addsd	%xmm3, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 8(%rax,%r15,4)
	cmpl	%edx, %ebp
	jle	.L5
	addl	%edx, %r11d
	addl	%r13d, %edx
	pxor	%xmm0, %xmm0
	movslq	%edx, %rdx
	movslq	%r11d, %r11
	cvtsi2sdl	8(%rbx,%rdx,4), %xmm0
	addsd	%xmm3, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 8(%rax,%r11,4)
.L5:
	addl	$1, %esi
	cmpl	%esi, %r12d
	jne	.L3
.L1:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L13:
	.cfi_restore_state
	xorl	%edx, %edx
	jmp	.L6
	.cfi_endproc
.LFE39:
	.size	fiDeepCopy, .-fiDeepCopy
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
