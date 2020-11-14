	.file	"fSortIndices.c"
	.text
	.p2align 4
	.globl	fSortIndices
	.type	fSortIndices, @function
fSortIndices:
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
	movl	%esi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	(%rdi), %r15d
	movl	4(%rdi), %ebx
	movl	%r15d, 12(%rsp)
	call	fDeepCopy@PLT
	movl	%r15d, %esi
	movl	%ebx, %edi
	movq	%rax, %rbp
	call	iMallocHandle@PLT
	movq	%rax, %r14
	testl	%r15d, %r15d
	jle	.L17
	testl	%ebx, %ebx
	jle	.L17
	movl	%r15d, %r8d
	movq	%rax, %rdi
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L4:
	movslq	(%r14), %rcx
	movq	%rdi, %rdx
	xorl	%eax, %eax
	salq	$2, %rcx
	.p2align 4,,10
	.p2align 3
.L5:
	addl	$1, %eax
	movl	$0, 8(%rdx)
	addq	%rcx, %rdx
	cmpl	%eax, %ebx
	jne	.L5
	addl	$1, %esi
	addq	$4, %rdi
	cmpl	%esi, %r8d
	jne	.L4
	cmpl	$1, %r12d
	je	.L22
	movq	%rbp, %r11
	movq	%r14, %r15
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L19:
	movslq	0(%rbp), %rsi
	movslq	(%r14), %r12
	movq	%r15, %rdi
	movq	%r11, %r9
	xorl	%r8d, %r8d
	movq	%rsi, %r13
	salq	$2, %r12
	salq	$2, %rsi
	.p2align 4,,10
	.p2align 3
.L16:
	movss	8(%r9), %xmm1
	movl	%r8d, 8(%rdi)
	movq	%r11, %rdx
	movl	%r8d, %ecx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L15:
	movss	8(%rdx), %xmm0
	comiss	%xmm1, %xmm0
	jbe	.L13
	movl	%eax, 8(%rdi)
	movl	%eax, %ecx
	movaps	%xmm0, %xmm1
.L13:
	addl	$1, %eax
	addq	%rsi, %rdx
	cmpl	%eax, %ebx
	jne	.L15
	imull	%r13d, %ecx
	addl	$1, %r8d
	addq	%rsi, %r9
	addq	%r12, %rdi
	addl	%r10d, %ecx
	movslq	%ecx, %rcx
	movl	$0x00000000, 8(%rbp,%rcx,4)
	cmpl	%r8d, %ebx
	jne	.L16
	addl	$1, %r10d
	addq	$4, %r11
	addq	$4, %r15
	cmpl	%r10d, 12(%rsp)
	jne	.L19
.L17:
	movq	%rbp, %rdi
	call	fFreeHandle@PLT
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r14, %rax
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
.L22:
	.cfi_restore_state
	movl	12(%rsp), %eax
	xorl	%r10d, %r10d
	leal	-1(%rax), %edi
.L18:
	movl	(%r14), %eax
	movl	0(%rbp), %r11d
	xorl	%r9d, %r9d
	imull	%r10d, %eax
	imull	%r10d, %r11d
	cltq
	leaq	(%r14,%rax,4), %r8
	movslq	%r11d, %rax
	leaq	0(%rbp,%rax,4), %rsi
	.p2align 4,,10
	.p2align 3
.L10:
	movss	8(%rsi,%r9,4), %xmm1
	movl	%r9d, %ecx
	movl	%r9d, 8(%r8)
	xorl	%eax, %eax
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L20:
	movq	%rdx, %rax
.L9:
	movss	8(%rsi,%rax,4), %xmm0
	comiss	%xmm1, %xmm0
	jbe	.L7
	movl	%eax, 8(%r8)
	movl	%eax, %ecx
	movaps	%xmm0, %xmm1
.L7:
	leaq	1(%rax), %rdx
	cmpq	%rax, %rdi
	jne	.L20
	addl	%r11d, %ecx
	leaq	1(%r9), %rax
	addq	$4, %r8
	movslq	%ecx, %rcx
	movl	$0x00000000, 8(%rbp,%rcx,4)
	cmpq	%r9, %rdi
	je	.L38
	movq	%rax, %r9
	jmp	.L10
.L38:
	addl	$1, %r10d
	cmpl	%r10d, %ebx
	jne	.L18
	jmp	.L17
	.cfi_endproc
.LFE39:
	.size	fSortIndices, .-fSortIndices
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
