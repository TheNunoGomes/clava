	.file	"filterBoundaryPoints.c"
	.text
	.p2align 4
	.globl	filterBoundaryPoints
	.type	filterBoundaryPoints, @function
filterBoundaryPoints:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movl	%esi, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	%edi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdx, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movl	(%rdx), %edi
	testl	%edi, %edi
	jle	.L19
	leal	-1(%rdi), %ecx
	xorl	%eax, %eax
	leal	-3(%rsi), %esi
	xorl	%r8d, %r8d
	leal	-3(%r12), %r9d
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L20:
	movq	%rdx, %rax
.L8:
	movss	8(%rbx,%rax,4), %xmm0
	comiss	.LC0(%rip), %xmm0
	jbe	.L3
	pxor	%xmm1, %xmm1
	cvtsi2ssl	%esi, %xmm1
	comiss	%xmm0, %xmm1
	jbe	.L3
	leal	(%rdi,%rax), %edx
	movslq	%edx, %rdx
	movss	8(%rbx,%rdx,4), %xmm0
	comiss	.LC0(%rip), %xmm0
	jbe	.L3
	pxor	%xmm1, %xmm1
	xorl	%edx, %edx
	cvtsi2ssl	%r9d, %xmm1
	comiss	%xmm0, %xmm1
	seta	%dl
	addl	%edx, %r8d
	.p2align 4,,10
	.p2align 3
.L3:
	leaq	1(%rax), %rdx
	cmpq	%rcx, %rax
	jne	.L20
.L2:
	movl	%r8d, %edi
	xorl	%edx, %edx
	movl	$1, %esi
	call	iSetArray@PLT
	movl	(%rbx), %r8d
	movq	%rax, %rbp
	testl	%r8d, %r8d
	jle	.L9
	leal	-1(%r8), %ecx
	xorl	%eax, %eax
	xorl	%edi, %edi
	subl	$3, %r12d
	leal	-3(%r13), %esi
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L21:
	movq	%rdx, %rax
.L15:
	movss	8(%rbx,%rax,4), %xmm0
	comiss	.LC0(%rip), %xmm0
	movl	%eax, %edx
	jbe	.L10
	pxor	%xmm1, %xmm1
	cvtsi2ssl	%esi, %xmm1
	comiss	%xmm0, %xmm1
	jbe	.L10
	addl	%r8d, %edx
	movslq	%edx, %rdx
	movss	8(%rbx,%rdx,4), %xmm0
	comiss	.LC0(%rip), %xmm0
	jbe	.L10
	pxor	%xmm1, %xmm1
	cvtsi2ssl	%r12d, %xmm1
	comiss	%xmm0, %xmm1
	jbe	.L10
	movslq	%edi, %rdx
	addl	$1, %edi
	movl	%eax, 8(%rbp,%rdx,4)
	.p2align 4,,10
	.p2align 3
.L10:
	leaq	1(%rax), %rdx
	cmpq	%rcx, %rax
	jne	.L21
.L9:
	movl	4(%rbp), %esi
	testl	%esi, %esi
	jle	.L16
	movl	4(%rbx), %edi
	pxor	%xmm0, %xmm0
	call	fSetArray@PLT
	movq	%rax, %r12
	movl	4(%rbp), %eax
	testl	%eax, %eax
	jle	.L17
	movslq	(%r12), %rdi
	movl	(%rbx), %esi
	leal	-1(%rax), %r9d
	xorl	%ecx, %ecx
	salq	$2, %rdi
	leaq	(%r12,%rdi), %r8
	addq	%r8, %rdi
	.p2align 4,,10
	.p2align 3
.L18:
	movslq	8(%rbp,%rcx,4), %rax
	movq	%rax, %rdx
	movss	8(%rbx,%rax,4), %xmm0
	addl	%esi, %edx
	movslq	%edx, %rax
	movss	%xmm0, 8(%r12,%rcx,4)
	addl	%esi, %edx
	movss	8(%rbx,%rax,4), %xmm0
	movslq	%edx, %rdx
	movq	%rcx, %rax
	movss	%xmm0, 8(%r8,%rcx,4)
	movss	8(%rbx,%rdx,4), %xmm0
	movss	%xmm0, 8(%rdi,%rcx,4)
	addq	$1, %rcx
	cmpq	%rax, %r9
	jne	.L18
.L17:
	movq	%rbp, %rdi
	call	iFreeHandle@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movq	%r12, %rax
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
.L16:
	.cfi_restore_state
	pxor	%xmm0, %xmm0
	movl	$1, %esi
	movl	$1, %edi
	call	fSetArray@PLT
	movq	%rax, %r12
	jmp	.L17
	.p2align 4,,10
	.p2align 3
.L19:
	xorl	%r8d, %r8d
	jmp	.L2
	.cfi_endproc
.LFE39:
	.size	filterBoundaryPoints, .-filterBoundaryPoints
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1077936128
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
