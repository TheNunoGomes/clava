	.file	"isPlus.c"
	.text
	.p2align 4
	.globl	isPlus
	.type	isPlus, @function
isPlus:
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
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movl	(%rdi), %r12d
	movl	4(%rdi), %r13d
	movl	%r12d, %esi
	movl	%r13d, %edi
	call	iMallocHandle@PLT
	movl	%r13d, %esi
	imull	%r12d, %esi
	testl	%esi, %esi
	jle	.L1
	leal	-1(%rsi), %edx
	cmpl	$2, %edx
	jbe	.L6
	movl	%esi, %ecx
	movd	%ebp, %xmm2
	movl	$8, %edx
	shrl	$2, %ecx
	pshufd	$0, %xmm2, %xmm1
	salq	$4, %rcx
	addq	$8, %rcx
	.p2align 4,,10
	.p2align 3
.L4:
	movdqu	(%rbx,%rdx), %xmm0
	paddd	%xmm1, %xmm0
	movups	%xmm0, (%rax,%rdx)
	addq	$16, %rdx
	cmpq	%rcx, %rdx
	jne	.L4
	movl	%esi, %edx
	andl	$-4, %edx
	testb	$3, %sil
	je	.L1
.L3:
	movslq	%edx, %rcx
	movl	8(%rbx,%rcx,4), %edi
	addl	%ebp, %edi
	movl	%edi, 8(%rax,%rcx,4)
	leal	1(%rdx), %ecx
	cmpl	%ecx, %esi
	jle	.L1
	movslq	%ecx, %rcx
	addl	$2, %edx
	movl	8(%rbx,%rcx,4), %edi
	addl	%ebp, %edi
	movl	%edi, 8(%rax,%rcx,4)
	cmpl	%edx, %esi
	jle	.L1
	movslq	%edx, %rdx
	addl	8(%rbx,%rdx,4), %ebp
	movl	%ebp, 8(%rax,%rdx,4)
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
.L6:
	.cfi_restore_state
	xorl	%edx, %edx
	jmp	.L3
	.cfi_endproc
.LFE39:
	.size	isPlus, .-isPlus
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