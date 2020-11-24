	.file	"fMdivide.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"fMDivide Mismatch = \nrows: %d\t%d\ncols: %d\t%d\n"
	.text
	.p2align 4
	.globl	fMdivide
	.type	fMdivide, @function
fMdivide:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movl	4(%rdi), %edx
	movl	4(%rsi), %r12d
	movl	(%rdi), %r13d
	movl	(%rsi), %r9d
	cmpl	%edx, %r12d
	jne	.L2
	cmpl	%r9d, %r13d
	jne	.L2
	movq	%rdi, %rbp
	movl	%r12d, %edi
	movq	%rsi, %rbx
	movl	%r13d, %esi
	call	fMallocHandle@PLT
	imull	%r13d, %r12d
	testl	%r12d, %r12d
	jle	.L1
	leal	-1(%r12), %edx
	cmpl	$2, %edx
	jbe	.L9
	movl	%r12d, %ecx
	movl	$8, %edx
	shrl	$2, %ecx
	salq	$4, %rcx
	addq	$8, %rcx
	.p2align 4,,10
	.p2align 3
.L6:
	movups	0(%rbp,%rdx), %xmm0
	movups	(%rbx,%rdx), %xmm1
	divps	%xmm1, %xmm0
	movups	%xmm0, (%rax,%rdx)
	addq	$16, %rdx
	cmpq	%rcx, %rdx
	jne	.L6
	movl	%r12d, %edx
	andl	$-4, %edx
	testb	$3, %r12b
	je	.L1
.L5:
	movslq	%edx, %rcx
	movss	8(%rbp,%rcx,4), %xmm0
	divss	8(%rbx,%rcx,4), %xmm0
	movss	%xmm0, 8(%rax,%rcx,4)
	leal	1(%rdx), %ecx
	cmpl	%r12d, %ecx
	jge	.L1
	movslq	%ecx, %rcx
	addl	$2, %edx
	movss	8(%rbp,%rcx,4), %xmm0
	divss	8(%rbx,%rcx,4), %xmm0
	movss	%xmm0, 8(%rax,%rcx,4)
	cmpl	%edx, %r12d
	jle	.L1
	movslq	%edx, %rdx
	movss	8(%rbp,%rdx,4), %xmm0
	divss	8(%rbx,%rdx,4), %xmm0
	movss	%xmm0, 8(%rax,%rdx,4)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2:
	.cfi_restore_state
	movl	%r13d, %r8d
	movl	%r12d, %ecx
	leaq	.LC0(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	xorl	%eax, %eax
.L1:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L9:
	.cfi_restore_state
	xorl	%edx, %edx
	jmp	.L5
	.cfi_endproc
.LFE39:
	.size	fMdivide, .-fMdivide
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
