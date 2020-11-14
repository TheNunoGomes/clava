	.file	"script_sift.c"
	.text
	.p2align 4
	.globl	normalizeImage
	.type	normalizeImage, @function
normalizeImage:
.LFB39:
	.cfi_startproc
	endbr64
	movl	4(%rdi), %r9d
	imull	(%rdi), %r9d
	testl	%r9d, %r9d
	jle	.L1
	movl	$10000, %ecx
	pxor	%xmm0, %xmm0
	leal	-1(%r9), %edx
	movq	%rdi, %rsi
	cvtsi2ssl	%ecx, %xmm0
	leaq	8(%rdi), %rax
	movq	%rdx, %r10
	leaq	12(%rdi,%rdx,4), %r8
	movq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L5:
	movss	(%rdx), %xmm1
	comiss	%xmm1, %xmm0
	jbe	.L3
	cvttss2sil	%xmm1, %ecx
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%ecx, %xmm0
.L3:
	addq	$4, %rdx
	cmpq	%r8, %rdx
	jne	.L5
	cmpl	$2, %r10d
	jbe	.L17
	movl	%r9d, %ecx
	movaps	%xmm0, %xmm2
	movq	%rdi, %rdx
	shrl	$2, %ecx
	shufps	$0, %xmm2, %xmm2
	salq	$4, %rcx
	addq	%rdi, %rcx
	.p2align 4,,10
	.p2align 3
.L7:
	movups	8(%rdx), %xmm1
	addq	$16, %rdx
	subps	%xmm2, %xmm1
	movups	%xmm1, -8(%rdx)
	cmpq	%rcx, %rdx
	jne	.L7
	movl	%r9d, %edx
	andl	$-4, %edx
	testb	$3, %r9b
	je	.L8
.L6:
	movslq	%edx, %rcx
	leaq	(%rdi,%rcx,4), %rcx
	movss	8(%rcx), %xmm1
	subss	%xmm0, %xmm1
	movss	%xmm1, 8(%rcx)
	leal	1(%rdx), %ecx
	cmpl	%ecx, %r9d
	jle	.L8
	movslq	%ecx, %rcx
	addl	$2, %edx
	leaq	(%rdi,%rcx,4), %rcx
	movss	8(%rcx), %xmm1
	subss	%xmm0, %xmm1
	movss	%xmm1, 8(%rcx)
	cmpl	%edx, %r9d
	jle	.L8
	movslq	%edx, %rdx
	leaq	(%rdi,%rdx,4), %rdx
	movss	8(%rdx), %xmm1
	subss	%xmm0, %xmm1
	movss	%xmm1, 8(%rdx)
.L8:
	movl	$-1, %edx
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%edx, %xmm0
	.p2align 4,,10
	.p2align 3
.L11:
	movss	(%rax), %xmm1
	comiss	%xmm0, %xmm1
	jbe	.L9
	cvttss2sil	%xmm1, %edx
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%edx, %xmm0
.L9:
	addq	$4, %rax
	cmpq	%r8, %rax
	jne	.L11
	addss	.LC0(%rip), %xmm0
	cmpl	$2, %r10d
	jbe	.L18
	movl	%r9d, %eax
	movaps	%xmm0, %xmm2
	shrl	$2, %eax
	shufps	$0, %xmm2, %xmm2
	salq	$4, %rax
	addq	%rdi, %rax
	.p2align 4,,10
	.p2align 3
.L13:
	movups	8(%rsi), %xmm1
	addq	$16, %rsi
	divps	%xmm2, %xmm1
	movups	%xmm1, -8(%rsi)
	cmpq	%rax, %rsi
	jne	.L13
	movl	%r9d, %eax
	andl	$-4, %eax
	testb	$3, %r9b
	je	.L26
.L12:
	movslq	%eax, %rdx
	leaq	(%rdi,%rdx,4), %rdx
	movss	8(%rdx), %xmm1
	divss	%xmm0, %xmm1
	movss	%xmm1, 8(%rdx)
	leal	1(%rax), %edx
	cmpl	%edx, %r9d
	jle	.L1
	movslq	%edx, %rdx
	addl	$2, %eax
	leaq	(%rdi,%rdx,4), %rdx
	movss	8(%rdx), %xmm1
	divss	%xmm0, %xmm1
	movss	%xmm1, 8(%rdx)
	cmpl	%r9d, %eax
	jge	.L1
	cltq
	leaq	(%rdi,%rax,4), %rax
	movss	8(%rax), %xmm1
	divss	%xmm0, %xmm1
	movss	%xmm1, 8(%rax)
.L1:
	ret
	.p2align 4,,10
	.p2align 3
.L26:
	ret
.L18:
	xorl	%eax, %eax
	jmp	.L12
.L17:
	xorl	%edx, %edx
	jmp	.L6
	.cfi_endproc
.LFE39:
	.size	normalizeImage, .-normalizeImage
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"We need input image path"
.LC2:
	.string	"%s/1.bmp"
.LC4:
	.string	"Error in SIFT"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB40:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$112, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L33
	movq	8(%rsi), %r8
	movq	%rsp, %rbp
	leaq	.LC2(%rip), %rcx
	xorl	%eax, %eax
	movl	$100, %edx
	movq	%rbp, %rdi
	movq	%rsi, %rbx
	movl	$1, %esi
	call	__sprintf_chk@PLT
	movq	%rbp, %rdi
	call	readImage@PLT
	movq	%rax, %rdi
	movq	%rax, %r12
	call	fiDeepCopy@PLT
	movq	%r12, %rdi
	movq	%rax, %rbp
	call	iFreeHandle@PLT
	movq	%rbp, %rdi
	call	normalizeImage
	call	sift@PLT
	movq	8(%rbx), %rsi
	movss	.LC3(%rip), %xmm0
	movq	%rax, %rdi
	movq	%rax, %rbp
	call	fSelfCheck@PLT
	cmpl	$-1, %eax
	je	.L34
.L30:
	movq	%rbp, %rdi
	call	fFreeHandle@PLT
	xorl	%eax, %eax
.L27:
	movq	104(%rsp), %rdx
	xorq	%fs:40, %rdx
	jne	.L35
	addq	$112, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L34:
	.cfi_restore_state
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	jmp	.L30
.L33:
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	orl	$-1, %eax
	jmp	.L27
.L35:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE40:
	.size	main, .-main
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	0
	.align 4
.LC3:
	.long	1045220557
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
