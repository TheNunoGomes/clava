	.file	"uiSetArray.c"
	.text
	.p2align 4
	.globl	uiSetArray
	.type	uiSetArray, @function
uiSetArray:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%edi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movl	%edx, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%esi, %ebx
	call	uiMallocHandle@PLT
	testl	%r12d, %r12d
	jle	.L1
	testl	%ebx, %ebx
	jle	.L1
	movl	%ebx, %esi
	movl	%ebx, %edx
	movd	%ebp, %xmm1
	xorl	%r9d, %r9d
	shrl	$2, %esi
	leal	-1(%rbx), %edi
	pshufd	$0, %xmm1, %xmm0
	andl	$-4, %edx
	salq	$4, %rsi
	.p2align 4,,10
	.p2align 3
.L4:
	movl	(%rax), %r10d
	imull	%r9d, %r10d
	cmpl	$2, %edi
	jbe	.L15
	movslq	%r10d, %rcx
	leaq	8(%rax,%rcx,4), %rcx
	leaq	(%rcx,%rsi), %r8
	.p2align 4,,10
	.p2align 3
.L5:
	movups	%xmm0, (%rcx)
	addq	$16, %rcx
	cmpq	%r8, %rcx
	jne	.L5
	movl	%edx, %ecx
	cmpl	%edx, %ebx
	je	.L6
.L7:
	leal	(%r10,%rcx), %r8d
	movslq	%r8d, %r8
	movl	%ebp, 8(%rax,%r8,4)
	leal	1(%rcx), %r8d
	cmpl	%r8d, %ebx
	jle	.L6
	addl	%r10d, %r8d
	addl	$2, %ecx
	movslq	%r8d, %r8
	movl	%ebp, 8(%rax,%r8,4)
	cmpl	%ecx, %ebx
	jle	.L6
	addl	%r10d, %ecx
	movslq	%ecx, %rcx
	movl	%ebp, 8(%rax,%rcx,4)
.L6:
	addl	$1, %r9d
	cmpl	%r9d, %r12d
	jne	.L4
.L1:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L15:
	.cfi_restore_state
	xorl	%ecx, %ecx
	jmp	.L7
	.cfi_endproc
.LFE39:
	.size	uiSetArray, .-uiSetArray
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
