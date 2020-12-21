	.file	"iDeepCopy.c"
	.text
	.p2align 4
	.globl	iDeepCopy
	.type	iDeepCopy, @function
iDeepCopy:
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	4(%rdi), %r13d
	movl	(%rdi), %ebp
	movl	%r13d, %edi
	movl	%ebp, %esi
	call	iMallocHandle@PLT
	testl	%r13d, %r13d
	jle	.L1
	testl	%ebp, %ebp
	jle	.L1
	cmpq	%rax, %rbx
	leal	-1(%rbp), %r12d
	movl	%ebp, %r9d
	movl	%ebp, %r11d
	setne	%cl
	cmpl	$3, %r12d
	seta	%dl
	andl	$-4, %r11d
	shrl	$2, %r9d
	xorl	%r10d, %r10d
	andl	%edx, %ecx
	salq	$4, %r9
	leal	1(%r11), %r14d
	leal	2(%r11), %r15d
	movb	%cl, 15(%rsp)
	.p2align 4,,10
	.p2align 3
.L3:
	movl	(%rbx), %ecx
	movl	(%rax), %esi
	imull	%r10d, %ecx
	imull	%r10d, %esi
	cmpb	$0, 15(%rsp)
	je	.L16
	movslq	%ecx, %rdx
	leaq	8(%rbx,%rdx,4), %r8
	movslq	%esi, %rdx
	leaq	8(%rax,%rdx,4), %rdi
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L4:
	movdqu	(%r8,%rdx), %xmm0
	movups	%xmm0, (%rdi,%rdx)
	addq	$16, %rdx
	cmpq	%r9, %rdx
	jne	.L4
	cmpl	%r11d, %ebp
	je	.L7
	leal	(%rcx,%r11), %edx
	movslq	%edx, %rdx
	movl	8(%rbx,%rdx,4), %edi
	leal	(%rsi,%r11), %edx
	movslq	%edx, %rdx
	movl	%edi, 8(%rax,%rdx,4)
	cmpl	%r14d, %ebp
	jle	.L7
	leal	(%rcx,%r14), %edx
	movslq	%edx, %rdx
	movl	8(%rbx,%rdx,4), %edi
	leal	(%rsi,%r14), %edx
	movslq	%edx, %rdx
	movl	%edi, 8(%rax,%rdx,4)
	cmpl	%r15d, %ebp
	jle	.L7
	addl	%r15d, %ecx
	addl	%r15d, %esi
	movslq	%ecx, %rcx
	movslq	%esi, %rsi
	movl	8(%rbx,%rcx,4), %edx
	movl	%edx, 8(%rax,%rsi,4)
.L7:
	addl	$1, %r10d
	cmpl	%r10d, %r13d
	jne	.L3
.L1:
	addq	$24, %rsp
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
	.p2align 4,,10
	.p2align 3
.L16:
	.cfi_restore_state
	movslq	%ecx, %rcx
	movslq	%esi, %rsi
	xorl	%edx, %edx
	leaq	(%rbx,%rcx,4), %rdi
	leaq	(%rax,%rsi,4), %rsi
	.p2align 4,,10
	.p2align 3
.L6:
	movl	8(%rdi,%rdx,4), %ecx
	movl	%ecx, 8(%rsi,%rdx,4)
	movq	%rdx, %rcx
	addq	$1, %rdx
	cmpq	%r12, %rcx
	jne	.L6
	jmp	.L7
	.cfi_endproc
.LFE39:
	.size	iDeepCopy, .-iDeepCopy
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