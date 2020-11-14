	.file	"iSortIndices.c"
	.text
	.p2align 4
	.globl	iSortIndices
	.type	iSortIndices, @function
iSortIndices:
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
	movq	%rdi, %r12
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
	call	iDeepCopy@PLT
	movl	%r15d, %esi
	movl	%ebx, %edi
	call	iMallocHandle@PLT
	movq	%rax, (%rsp)
	testl	%r15d, %r15d
	jle	.L1
	testl	%ebx, %ebx
	jle	.L1
	movl	12(%rsp), %r8d
	movq	%rax, %r9
	movq	%rax, %rdi
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L5:
	movslq	(%r9), %rcx
	movq	%rdi, %rdx
	xorl	%eax, %eax
	salq	$2, %rcx
	.p2align 4,,10
	.p2align 3
.L4:
	addl	$1, %eax
	movl	$0, 8(%rdx)
	addq	%rcx, %rdx
	cmpl	%eax, %ebx
	jne	.L4
	addl	$1, %esi
	addq	$4, %rdi
	cmpl	%esi, %r8d
	jne	.L5
	movq	(%rsp), %r15
	movq	%r12, %rbp
	xorl	%r11d, %r11d
	.p2align 4,,10
	.p2align 3
.L10:
	movq	(%rsp), %rax
	movslq	(%r12), %rdi
	movq	%r15, %r8
	movq	%rbp, %r10
	xorl	%r9d, %r9d
	movslq	(%rax), %r13
	movq	%rdi, %r14
	salq	$2, %rdi
	salq	$2, %r13
	.p2align 4,,10
	.p2align 3
.L9:
	movl	8(%r10), %ecx
	movl	%r9d, 8(%r8)
	movq	%rbp, %rdx
	movl	%r9d, %esi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L8:
	cmpl	%ecx, 8(%rdx)
	jle	.L7
	movl	%eax, 8(%r8)
	movl	8(%rdx), %ecx
	movl	%eax, %esi
.L7:
	addl	$1, %eax
	addq	%rdi, %rdx
	cmpl	%eax, %ebx
	jne	.L8
	imull	%r14d, %esi
	addl	$1, %r9d
	addq	%rdi, %r10
	addq	%r13, %r8
	addl	%r11d, %esi
	movslq	%esi, %rsi
	movl	$0, 8(%r12,%rsi,4)
	cmpl	%r9d, %ebx
	jne	.L9
	addl	$1, %r11d
	addq	$4, %rbp
	addq	$4, %r15
	cmpl	%r11d, 12(%rsp)
	jne	.L10
.L1:
	movq	(%rsp), %rax
	addq	$24, %rsp
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
	.cfi_endproc
.LFE39:
	.size	iSortIndices, .-iSortIndices
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
