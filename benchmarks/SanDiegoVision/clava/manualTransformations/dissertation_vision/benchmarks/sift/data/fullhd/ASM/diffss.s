	.file	"diffss.c"
	.text
	.p2align 4
	.globl	diffss
	.type	diffss, @function
diffss:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%esi, %eax
	movq	%rdi, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	imull	%edx, %eax
	movl	%esi, %r14d
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
	movl	%edx, %ebx
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	movq	%rdi, 80(%rsp)
	movslq	%eax, %rdi
	salq	$3, %rdi
	movl	%esi, 92(%rsp)
	call	malloc@PLT
	movq	%rax, 64(%rsp)
	testl	%r14d, %r14d
	jle	.L1
	cmpl	$1, %ebx
	jle	.L1
	movslq	%ebx, %rax
	movl	$0, 88(%rsp)
	movq	$0, 56(%rsp)
	salq	$3, %rax
	movq	%rax, 72(%rsp)
	leal	-2(%rbx), %eax
	leaq	8(%r15,%rax,8), %rax
	movq	%rax, 48(%rsp)
.L3:
	movq	56(%rsp), %rbx
	movq	80(%rsp), %rax
	addq	%rbx, %rax
	movq	%rax, 24(%rsp)
	movq	64(%rsp), %rax
	addq	%rbx, %rax
	movq	%rax, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L12:
	movq	24(%rsp), %rbx
	movq	(%rbx), %rax
	movl	4(%rax), %r15d
	movl	(%rax), %r13d
	movl	%r15d, %edi
	movl	%r13d, %esi
	movl	%r15d, (%rsp)
	call	fMallocHandle@PLT
	movq	40(%rsp), %rcx
	movq	8(%rbx), %rbp
	movq	(%rbx), %r12
	movq	%rax, (%rcx)
	testl	%r15d, %r15d
	jle	.L4
	testl	%r13d, %r13d
	jle	.L4
	movl	0(%rbp), %ecx
	cmpq	%r12, %rax
	leal	-1(%r13), %edx
	movl	%r13d, %r14d
	movl	%r13d, %ebx
	movl	%ecx, 4(%rsp)
	movl	(%r12), %ecx
	movl	%ecx, 8(%rsp)
	movl	(%rax), %ecx
	movl	%ecx, 12(%rsp)
	setne	%cl
	cmpq	%rbp, %rax
	setne	%sil
	andl	%esi, %ecx
	cmpl	$2, %edx
	seta	%sil
	andl	$-4, %r14d
	shrl	$2, %ebx
	andl	%esi, %ecx
	movl	%edx, %esi
	salq	$4, %rbx
	leal	1(%r14), %r15d
	movq	%rsi, 32(%rsp)
	movb	%cl, 19(%rsp)
	leal	2(%r14), %ecx
	movl	%ecx, 20(%rsp)
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L5:
	movl	4(%rsp), %esi
	movl	8(%rsp), %edi
	movl	12(%rsp), %r8d
	imull	%ecx, %esi
	imull	%ecx, %edi
	imull	%ecx, %r8d
	cmpb	$0, 19(%rsp)
	je	.L19
	movslq	%esi, %rdx
	leaq	8(%rbp,%rdx,4), %r11
	movslq	%edi, %rdx
	leaq	8(%r12,%rdx,4), %r10
	movslq	%r8d, %rdx
	leaq	8(%rax,%rdx,4), %r9
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L6:
	movups	(%r11,%rdx), %xmm0
	movups	(%r10,%rdx), %xmm1
	subps	%xmm1, %xmm0
	movups	%xmm0, (%r9,%rdx)
	addq	$16, %rdx
	cmpq	%rbx, %rdx
	jne	.L6
	cmpl	%r13d, %r14d
	je	.L9
	leal	(%rsi,%r14), %r10d
	leal	(%rdi,%r14), %r9d
	movslq	%r10d, %r10
	movslq	%r9d, %r9
	leal	(%r8,%r14), %edx
	movss	8(%rbp,%r10,4), %xmm0
	subss	8(%r12,%r9,4), %xmm0
	movslq	%edx, %rdx
	movss	%xmm0, 8(%rax,%rdx,4)
	cmpl	%r15d, %r13d
	jle	.L9
	leal	(%rsi,%r15), %r10d
	leal	(%rdi,%r15), %r9d
	movslq	%r10d, %r10
	movslq	%r9d, %r9
	leal	(%r8,%r15), %edx
	movss	8(%rbp,%r10,4), %xmm0
	subss	8(%r12,%r9,4), %xmm0
	movslq	%edx, %rdx
	movss	%xmm0, 8(%rax,%rdx,4)
	movl	20(%rsp), %edx
	cmpl	%edx, %r13d
	jle	.L9
	addl	%edx, %esi
	addl	%edx, %edi
	addl	%edx, %r8d
	movslq	%esi, %rsi
	movslq	%edi, %rdi
	movslq	%r8d, %r8
	movss	8(%rbp,%rsi,4), %xmm0
	subss	8(%r12,%rdi,4), %xmm0
	movss	%xmm0, 8(%rax,%r8,4)
.L9:
	addl	$1, %ecx
	cmpl	%ecx, (%rsp)
	jne	.L5
.L4:
	addq	$8, 24(%rsp)
	movq	24(%rsp), %rax
	addq	$8, 40(%rsp)
	cmpq	48(%rsp), %rax
	jne	.L12
	movq	72(%rsp), %rcx
	addl	$1, 88(%rsp)
	addq	%rcx, 48(%rsp)
	movl	88(%rsp), %eax
	addq	%rcx, 56(%rsp)
	cmpl	%eax, 92(%rsp)
	jne	.L3
.L1:
	movq	64(%rsp), %rax
	addq	$104, %rsp
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
.L19:
	.cfi_restore_state
	movslq	%esi, %rsi
	movslq	%edi, %rdi
	movslq	%r8d, %r8
	movq	32(%rsp), %r10
	leaq	0(%rbp,%rsi,4), %r9
	leaq	(%r12,%rdi,4), %rdi
	xorl	%edx, %edx
	leaq	(%rax,%r8,4), %r8
	.p2align 4,,10
	.p2align 3
.L8:
	movss	8(%r9,%rdx,4), %xmm0
	subss	8(%rdi,%rdx,4), %xmm0
	movq	%rdx, %rsi
	movss	%xmm0, 8(%r8,%rdx,4)
	addq	$1, %rdx
	cmpq	%r10, %rsi
	jne	.L8
	jmp	.L9
	.cfi_endproc
.LFE39:
	.size	diffss, .-diffss
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
