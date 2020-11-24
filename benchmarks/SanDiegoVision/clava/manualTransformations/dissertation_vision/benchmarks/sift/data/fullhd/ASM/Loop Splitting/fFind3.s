	.file	"fFind3.c"
	.text
	.p2align 4
	.globl	fFind3
	.type	fFind3, @function
fFind3:
.LFB39:
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
	movl	4(%rdi), %ebx
	movl	(%rdi), %ebp
	testl	%ebx, %ebx
	jle	.L2
	movl	%ebp, %r8d
	movl	%ebp, %esi
	movq	%rdi, %r12
	xorl	%edx, %edx
	shrl	$2, %r8d
	leal	-1(%rbp), %r9d
	andl	$-4, %esi
	xorl	%ecx, %ecx
	salq	$4, %r8
	pxor	%xmm3, %xmm3
	pxor	%xmm2, %xmm2
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L3:
	testl	%ebp, %ebp
	jle	.L17
	cmpl	$3, %r9d
	jbe	.L23
	movslq	%edx, %rax
	pxor	%xmm1, %xmm1
	leaq	8(%r12,%rax,4), %rax
	leaq	(%rax,%r8), %r10
	.p2align 4,,10
	.p2align 3
.L5:
	movups	(%rax), %xmm0
	addq	$16, %rax
	cmpneqps	%xmm2, %xmm0
	psubd	%xmm0, %xmm1
	cmpq	%r10, %rax
	jne	.L5
	movdqa	%xmm1, %xmm0
	psrldq	$8, %xmm0
	paddd	%xmm0, %xmm1
	movdqa	%xmm1, %xmm0
	psrldq	$4, %xmm0
	paddd	%xmm0, %xmm1
	movd	%xmm1, %eax
	addl	%eax, %edi
	movl	%esi, %eax
	cmpl	%ebp, %esi
	je	.L17
.L4:
	leal	(%rdx,%rax), %r10d
	movslq	%r10d, %r10
	ucomiss	8(%r12,%r10,4), %xmm3
	jp	.L24
	je	.L7
.L24:
	addl	$1, %edi
.L7:
	leal	1(%rax), %r10d
	cmpl	%ebp, %r10d
	jge	.L17
	addl	%edx, %r10d
	movslq	%r10d, %r10
	ucomiss	8(%r12,%r10,4), %xmm3
	jp	.L25
	je	.L9
.L25:
	addl	$1, %edi
.L9:
	leal	2(%rax), %r10d
	cmpl	%ebp, %r10d
	jge	.L17
	addl	%edx, %r10d
	movslq	%r10d, %r10
	ucomiss	8(%r12,%r10,4), %xmm3
	jp	.L26
	je	.L11
.L26:
	addl	$1, %edi
.L11:
	addl	$3, %eax
	cmpl	%eax, %ebp
	jle	.L17
	addl	%edx, %eax
	cltq
	ucomiss	8(%r12,%rax,4), %xmm3
	jp	.L13
	je	.L17
.L13:
	addl	$1, %edi
.L17:
	addl	$1, %ecx
	addl	%ebp, %edx
	cmpl	%ecx, %ebx
	jne	.L3
	pxor	%xmm0, %xmm0
	movl	$3, %esi
	call	fSetArray@PLT
	testl	%ebp, %ebp
	jle	.L1
	movslq	(%r12), %r8
	xorl	%r9d, %r9d
	xorl	%edi, %edi
	pxor	%xmm0, %xmm0
	salq	$2, %r8
	.p2align 4,,10
	.p2align 3
.L19:
	movq	%r12, %rcx
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L22:
	ucomiss	8(%rcx), %xmm0
	jp	.L27
	je	.L20
.L27:
	movl	(%rax), %esi
	pxor	%xmm1, %xmm1
	cvtsi2ssl	%r9d, %xmm1
	imull	%edi, %esi
	addl	$1, %edi
	movslq	%esi, %rsi
	leaq	(%rax,%rsi,4), %rsi
	movss	%xmm1, 8(%rsi)
	pxor	%xmm1, %xmm1
	cvtsi2ssl	%edx, %xmm1
	movss	%xmm1, 12(%rsi)
	movss	8(%rcx), %xmm1
	movss	%xmm1, 16(%rsi)
.L20:
	addl	$1, %edx
	addq	%r8, %rcx
	cmpl	%edx, %ebx
	jne	.L22
	addl	$1, %r9d
	addq	$4, %r12
	cmpl	%r9d, %ebp
	jne	.L19
.L1:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L23:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L4
.L2:
	popq	%rbx
	.cfi_def_cfa_offset 24
	pxor	%xmm0, %xmm0
	popq	%rbp
	.cfi_def_cfa_offset 16
	movl	$3, %esi
	xorl	%edi, %edi
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	fSetArray@PLT
	.cfi_endproc
.LFE39:
	.size	fFind3, .-fFind3
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
