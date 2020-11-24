	.file	"ifDeepCopy.c"
	.text
	.p2align 4
	.globl	ifDeepCopy
	.type	ifDeepCopy, @function
ifDeepCopy:
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
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movl	4(%rdi), %r12d
	movl	(%rdi), %ebp
	movl	%r12d, %edi
	movl	%ebp, %esi
	call	iMallocHandle@PLT
	testl	%r12d, %r12d
	jle	.L1
	testl	%ebp, %ebp
	jle	.L1
	movl	%ebp, %edi
	movl	%ebp, %r9d
	leal	-1(%rbp), %r10d
	xorl	%r8d, %r8d
	shrl	$2, %edi
	andl	$-4, %r9d
	salq	$4, %rdi
	.p2align 4,,10
	.p2align 3
.L3:
	movl	(%rbx), %r13d
	movl	(%rax), %ecx
	imull	%r8d, %r13d
	imull	%r8d, %ecx
	cmpl	$2, %r10d
	jbe	.L13
	movslq	%r13d, %rdx
	leaq	8(%rbx,%rdx,4), %r11
	movslq	%ecx, %rdx
	leaq	8(%rax,%rdx,4), %rsi
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L4:
	movups	(%r11,%rdx), %xmm1
	cvttps2dq	%xmm1, %xmm0
	movups	%xmm0, (%rsi,%rdx)
	addq	$16, %rdx
	cmpq	%rdx, %rdi
	jne	.L4
	movl	%r9d, %edx
	cmpl	%r9d, %ebp
	je	.L5
.L6:
	leal	0(%r13,%rdx), %r11d
	leal	(%rcx,%rdx), %esi
	movslq	%r11d, %r11
	movslq	%esi, %rsi
	cvttss2sil	8(%rbx,%r11,4), %r11d
	movl	%r11d, 8(%rax,%rsi,4)
	leal	1(%rdx), %esi
	cmpl	%esi, %ebp
	jle	.L5
	leal	(%rcx,%rsi), %r11d
	addl	%r13d, %esi
	addl	$2, %edx
	movslq	%esi, %rsi
	movslq	%r11d, %r11
	cvttss2sil	8(%rbx,%rsi,4), %esi
	movl	%esi, 8(%rax,%r11,4)
	cmpl	%edx, %ebp
	jle	.L5
	addl	%edx, %ecx
	addl	%r13d, %edx
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	cvttss2sil	8(%rbx,%rdx,4), %edx
	movl	%edx, 8(%rax,%rcx,4)
.L5:
	addl	$1, %r8d
	cmpl	%r8d, %r12d
	jne	.L3
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
.L13:
	.cfi_restore_state
	xorl	%edx, %edx
	jmp	.L6
	.cfi_endproc
.LFE39:
	.size	ifDeepCopy, .-ifDeepCopy
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
