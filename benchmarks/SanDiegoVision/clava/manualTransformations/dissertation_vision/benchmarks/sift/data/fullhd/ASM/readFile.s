	.file	"readFile.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"r"
.LC1:
	.string	"Error in file %s\n"
.LC2:
	.string	"%d"
.LC4:
	.string	"%f"
	.text
	.p2align 4
	.globl	readFile
	.type	readFile, @function
readFile:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	leaq	.LC0(%rip), %rsi
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	call	fopen@PLT
	testq	%rax, %rax
	je	.L14
	movq	%rax, %rdi
	movq	%rax, %r14
	xorl	%eax, %eax
	leaq	4(%rsp), %rdx
	leaq	.LC2(%rip), %rsi
	call	__isoc99_fscanf@PLT
	movq	%rsp, %rdx
	movq	%r14, %rdi
	xorl	%eax, %eax
	leaq	.LC2(%rip), %rsi
	call	__isoc99_fscanf@PLT
	movl	4(%rsp), %esi
	movl	(%rsp), %edi
	pxor	%xmm0, %xmm0
	call	fSetArray@PLT
	movl	(%rsp), %edx
	movq	%rax, %r13
	testl	%edx, %edx
	jle	.L4
	movl	4(%rsp), %eax
	xorl	%ebp, %ebp
	leaq	.LC4(%rip), %r12
	.p2align 4,,10
	.p2align 3
.L5:
	xorl	%ebx, %ebx
	testl	%eax, %eax
	jle	.L7
	.p2align 4,,10
	.p2align 3
.L6:
	movl	0(%r13), %eax
	movq	%r12, %rsi
	movq	%r14, %rdi
	imull	%ebp, %eax
	addl	%ebx, %eax
	addl	$1, %ebx
	cltq
	leaq	8(%r13,%rax,4), %rdx
	xorl	%eax, %eax
	call	__isoc99_fscanf@PLT
	movl	4(%rsp), %eax
	cmpl	%ebx, %eax
	jg	.L6
	movl	(%rsp), %edx
.L7:
	addl	$1, %ebp
	cmpl	%edx, %ebp
	jl	.L5
.L4:
	movq	%r14, %rdi
	call	fclose@PLT
.L1:
	movq	8(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L15
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movq	%r13, %rax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L14:
	.cfi_restore_state
	movq	%r12, %rdx
	leaq	.LC1(%rip), %rsi
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	movl	$1, %edi
	call	__printf_chk@PLT
	jmp	.L1
.L15:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE39:
	.size	readFile, .-readFile
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
