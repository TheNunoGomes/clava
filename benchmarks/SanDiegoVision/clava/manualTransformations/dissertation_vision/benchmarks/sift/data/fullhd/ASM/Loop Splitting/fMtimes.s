	.file	"fMtimes.c"
	.text
	.p2align 4
	.globl	fMtimes
	.type	fMtimes, @function
fMtimes:
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
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	4(%rdi), %r13d
	movl	(%rsi), %r14d
	movl	(%rdi), %r12d
	movl	%r14d, %esi
	movl	%r13d, %edi
	call	fMallocHandle@PLT
	movq	%rax, %r15
	testl	%r13d, %r13d
	jle	.L1
	testl	%r14d, %r14d
	jle	.L1
	movl	(%rax), %eax
	leal	-1(%r14), %r10d
	xorl	%r8d, %r8d
	pxor	%xmm2, %xmm2
	leal	-1(%r12), %r14d
	leaq	4(%rbx), %r11
	movl	%eax, 12(%rsp)
	.p2align 4,,10
	.p2align 3
.L4:
	movl	12(%rsp), %eax
	xorl	%edi, %edi
	imull	%r8d, %eax
	cltq
	leaq	(%r15,%rax,4), %r9
	.p2align 4,,10
	.p2align 3
.L9:
	movaps	%xmm2, %xmm1
	testl	%r12d, %r12d
	jle	.L8
	movl	(%rbx), %esi
	movslq	0(%rbp), %rcx
	leaq	0(%rbp,%rdi,4), %rdx
	movaps	%xmm2, %xmm1
	imull	%r8d, %esi
	salq	$2, %rcx
	movslq	%esi, %rsi
	leaq	(%rbx,%rsi,4), %rax
	addq	%r14, %rsi
	leaq	(%r11,%rsi,4), %rsi
	.p2align 4,,10
	.p2align 3
.L5:
	movss	8(%rdx), %xmm0
	mulss	8(%rax), %xmm0
	addq	$4, %rax
	addq	%rcx, %rdx
	addss	%xmm0, %xmm1
	cmpq	%rax, %rsi
	jne	.L5
.L8:
	movss	%xmm1, 8(%r9,%rdi,4)
	leaq	1(%rdi), %rax
	cmpq	%r10, %rdi
	je	.L6
	movq	%rax, %rdi
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L6:
	addl	$1, %r8d
	cmpl	%r8d, %r13d
	jne	.L4
.L1:
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	movq	%r15, %rax
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
	.cfi_endproc
.LFE39:
	.size	fMtimes, .-fMtimes
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
