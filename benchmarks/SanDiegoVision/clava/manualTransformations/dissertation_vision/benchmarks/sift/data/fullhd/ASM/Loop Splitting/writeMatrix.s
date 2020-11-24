	.file	"writeMatrix.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s/expected_C.txt"
.LC1:
	.string	"w"
.LC2:
	.string	"%d\t"
	.text
	.p2align 4
	.globl	writeMatrix
	.type	writeMatrix, @function
writeMatrix:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %r8
	movl	$100, %edx
	leaq	.LC0(%rip), %rcx
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	$1, %esi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	leaq	.LC2(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	movq	%fs:40, %rax
	movq	%rax, 120(%rsp)
	xorl	%eax, %eax
	leaq	16(%rsp), %rbp
	movq	%rbp, %rdi
	call	__sprintf_chk@PLT
	movq	%rbp, %rdi
	leaq	.LC1(%rip), %rsi
	xorl	%ebp, %ebp
	call	fopen@PLT
	movl	(%rbx), %r12d
	movq	%rax, %r14
	movl	4(%rbx), %eax
	movl	%eax, 12(%rsp)
	testl	%eax, %eax
	jle	.L3
	.p2align 4,,10
	.p2align 3
.L2:
	xorl	%r15d, %r15d
	testl	%r12d, %r12d
	jle	.L5
	.p2align 4,,10
	.p2align 3
.L4:
	movl	(%rbx), %eax
	movq	%r13, %rdx
	movl	$1, %esi
	movq	%r14, %rdi
	imull	%ebp, %eax
	addl	%r15d, %eax
	addl	$1, %r15d
	cltq
	movl	8(%rbx,%rax,4), %ecx
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	cmpl	%r15d, %r12d
	jne	.L4
.L5:
	movq	%r14, %rsi
	movl	$10, %edi
	addl	$1, %ebp
	call	fputc@PLT
	cmpl	%ebp, 12(%rsp)
	jne	.L2
.L3:
	movq	%r14, %rdi
	call	fclose@PLT
	movq	120(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L15
	addq	$136, %rsp
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
.L15:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE39:
	.size	writeMatrix, .-writeMatrix
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
