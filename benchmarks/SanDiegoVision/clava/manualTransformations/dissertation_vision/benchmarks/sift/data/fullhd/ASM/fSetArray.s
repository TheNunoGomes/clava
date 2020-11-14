	.file	"fSetArray.c"
	.text
	.p2align 4
	.globl	fSetArray
	.type	fSetArray, @function
fSetArray:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%edi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	%esi, %ebx
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	movss	%xmm0, 12(%rsp)
	call	fMallocHandle@PLT
	testl	%ebp, %ebp
	jle	.L1
	testl	%ebx, %ebx
	jle	.L1
	movss	12(%rsp), %xmm0
	movl	%ebx, %edi
	movl	%ebx, %esi
	movl	(%rax), %r10d
	shrl	$2, %edi
	leal	-1(%rbx), %r9d
	andl	$-4, %esi
	xorl	%r8d, %r8d
	movaps	%xmm0, %xmm1
	salq	$4, %rdi
	shufps	$0, %xmm1, %xmm1
	.p2align 4,,10
	.p2align 3
.L3:
	movl	%r10d, %r11d
	imull	%r8d, %r11d
	cmpl	$2, %r9d
	jbe	.L13
	movslq	%r11d, %rdx
	leaq	8(%rax,%rdx,4), %rdx
	leaq	(%rdx,%rdi), %rcx
	.p2align 4,,10
	.p2align 3
.L4:
	movups	%xmm1, (%rdx)
	addq	$16, %rdx
	cmpq	%rcx, %rdx
	jne	.L4
	movl	%esi, %edx
	cmpl	%esi, %ebx
	je	.L5
.L6:
	leal	(%r11,%rdx), %ecx
	movslq	%ecx, %rcx
	movss	%xmm0, 8(%rax,%rcx,4)
	leal	1(%rdx), %ecx
	cmpl	%ecx, %ebx
	jle	.L5
	addl	%r11d, %ecx
	addl	$2, %edx
	movslq	%ecx, %rcx
	movss	%xmm0, 8(%rax,%rcx,4)
	cmpl	%edx, %ebx
	jle	.L5
	addl	%r11d, %edx
	movslq	%edx, %rdx
	movss	%xmm0, 8(%rax,%rdx,4)
.L5:
	addl	$1, %r8d
	cmpl	%r8d, %ebp
	jne	.L3
.L1:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L13:
	.cfi_restore_state
	xorl	%edx, %edx
	jmp	.L6
	.cfi_endproc
.LFE39:
	.size	fSetArray, .-fSetArray
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
