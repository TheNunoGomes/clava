	.file	"fSum.c"
	.text
	.p2align 4
	.globl	fSum
	.type	fSum, @function
fSum:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pxor	%xmm0, %xmm0
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	(%rdi), %r12d
	movl	4(%rdi), %ebx
	cmpl	$1, %r12d
	je	.L26
	cmpl	$1, %ebx
	je	.L26
	movl	%r12d, %esi
	movl	$1, %edi
	call	fSetArray@PLT
	testl	%r12d, %r12d
	jle	.L1
	leal	-1(%r12), %r8d
	xorl	%edi, %edi
	pxor	%xmm1, %xmm1
	.p2align 4,,10
	.p2align 3
.L20:
	movaps	%xmm1, %xmm0
	testl	%ebx, %ebx
	jle	.L19
	movslq	0(%rbp), %rsi
	leaq	0(%rbp,%rdi,4), %rcx
	movaps	%xmm1, %xmm0
	xorl	%edx, %edx
	salq	$2, %rsi
	.p2align 4,,10
	.p2align 3
.L17:
	addl	$1, %edx
	addss	8(%rcx), %xmm0
	addq	%rsi, %rcx
	cmpl	%edx, %ebx
	jne	.L17
.L19:
	movss	%xmm0, 8(%rax,%rdi,4)
	leaq	1(%rdi), %rdx
	cmpq	%r8, %rdi
	je	.L1
	movq	%rdx, %rdi
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L26:
	movl	$1, %esi
	movl	$1, %edi
	call	fSetArray@PLT
	cmpl	$1, %r12d
	je	.L35
	testl	%r12d, %r12d
	jle	.L32
	leal	-1(%r12), %edx
	cmpl	$2, %edx
	jbe	.L25
	movl	%r12d, %ecx
	movq	%rbp, %rdx
	pxor	%xmm1, %xmm1
	shrl	$2, %ecx
	salq	$4, %rcx
	addq	%rbp, %rcx
	.p2align 4,,10
	.p2align 3
.L15:
	movups	8(%rdx), %xmm0
	addq	$16, %rdx
	addss	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	shufps	$85, %xmm0, %xmm2
	addss	%xmm2, %xmm1
	movaps	%xmm0, %xmm2
	unpckhps	%xmm0, %xmm2
	shufps	$255, %xmm0, %xmm0
	addss	%xmm2, %xmm1
	addss	%xmm0, %xmm1
	cmpq	%rcx, %rdx
	jne	.L15
	movl	%r12d, %edx
	andl	$-4, %edx
	testb	$3, %r12b
	je	.L22
.L14:
	movslq	%edx, %rcx
	addss	8(%rbp,%rcx,4), %xmm1
	leal	1(%rdx), %ecx
	cmpl	%ecx, %r12d
	jle	.L22
	movslq	%ecx, %rcx
	addl	$2, %edx
	addss	8(%rbp,%rcx,4), %xmm1
	cmpl	%edx, %r12d
	jle	.L22
.L33:
	movslq	%edx, %rdx
	addss	8(%rbp,%rdx,4), %xmm1
.L22:
	movss	%xmm1, 8(%rax)
.L1:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L35:
	.cfi_restore_state
	testl	%ebx, %ebx
	jle	.L32
	movslq	0(%rbp), %rdx
	cmpl	$1, %edx
	jne	.L36
	leal	-1(%rbx), %edx
	cmpl	$2, %edx
	jbe	.L24
	movl	%ebx, %ecx
	movq	%rbp, %rdx
	pxor	%xmm1, %xmm1
	shrl	$2, %ecx
	salq	$4, %rcx
	addq	%rbp, %rcx
	.p2align 4,,10
	.p2align 3
.L9:
	movups	8(%rdx), %xmm0
	addq	$16, %rdx
	addss	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	shufps	$85, %xmm0, %xmm2
	addss	%xmm2, %xmm1
	movaps	%xmm0, %xmm2
	unpckhps	%xmm0, %xmm2
	shufps	$255, %xmm0, %xmm0
	addss	%xmm2, %xmm1
	addss	%xmm0, %xmm1
	cmpq	%rcx, %rdx
	jne	.L9
	movl	%ebx, %edx
	andl	$-4, %edx
	testb	$3, %bl
	je	.L22
.L8:
	movslq	%edx, %rcx
	addss	8(%rbp,%rcx,4), %xmm1
	leal	1(%rdx), %ecx
	cmpl	%ecx, %ebx
	jle	.L22
	movslq	%ecx, %rcx
	addl	$2, %edx
	addss	8(%rbp,%rcx,4), %xmm1
	cmpl	%edx, %ebx
	jg	.L33
	jmp	.L22
.L32:
	pxor	%xmm1, %xmm1
	jmp	.L22
.L36:
	leaq	0(,%rdx,4), %rcx
	addq	$8, %rbp
	pxor	%xmm1, %xmm1
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L7:
	addl	$1, %edx
	addss	0(%rbp), %xmm1
	addq	%rcx, %rbp
	cmpl	%edx, %ebx
	jne	.L7
	jmp	.L22
.L24:
	pxor	%xmm1, %xmm1
	xorl	%edx, %edx
	jmp	.L8
.L25:
	pxor	%xmm1, %xmm1
	xorl	%edx, %edx
	jmp	.L14
	.cfi_endproc
.LFE39:
	.size	fSum, .-fSum
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
