	.file	"selfCheck.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s/expected_C.txt"
.LC1:
	.string	"r"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"Error: Expected file not opened "
	.section	.rodata.str1.1
.LC3:
	.string	"%d"
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"Checking error: dimensions mismatch. Expected = %d, Observed = %d \n"
	.align 8
.LC5:
	.string	"Checking error: Values mismtach at %d element\n"
	.align 8
.LC6:
	.string	"Expected value = %d, observed = %d\n"
	.section	.rodata.str1.1
.LC7:
	.string	"Verification\t\t- Successful"
	.text
	.p2align 4
	.globl	selfCheck
	.type	selfCheck, @function
selfCheck:
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
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
	movl	(%rbx), %ecx
	movslq	4(%rdi), %rdi
	movl	%edx, 12(%rsp)
	leaq	32(%rsp), %r12
	movq	%fs:40, %rax
	movq	%rax, 136(%rsp)
	xorl	%eax, %eax
	movslq	%ecx, %rax
	movl	%edi, 16(%rsp)
	imulq	%rax, %rdi
	movl	%ecx, 20(%rsp)
	salq	$2, %rdi
	call	malloc@PLT
	movl	$1, %esi
	movq	%r12, %rdi
	movq	%rbp, %r8
	movq	%rax, 24(%rsp)
	movq	%rax, %r15
	movl	$100, %edx
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rcx
	call	__sprintf_chk@PLT
	leaq	.LC1(%rip), %rsi
	movq	%r12, %rdi
	call	fopen@PLT
	testq	%rax, %rax
	je	.L2
	movq	%r15, %rbp
	movq	%r15, %r12
	movq	%rax, %r14
	xorl	%r13d, %r13d
	leaq	.LC3(%rip), %r15
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L5:
	movq	%r12, %rdx
	movq	%r15, %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	call	__isoc99_fscanf@PLT
	addl	$1, %r13d
	addq	$4, %r12
.L3:
	movq	%r14, %rdi
	call	feof@PLT
	testl	%eax, %eax
	je	.L5
	movl	16(%rsp), %ecx
	imull	20(%rsp), %ecx
	leal	-1(%r13), %edx
	cmpl	%edx, %ecx
	jg	.L6
	addq	$8, %rbx
	xorl	%r8d, %r8d
	testl	%ecx, %ecx
	jg	.L11
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L9:
	subl	%esi, %eax
	cmpl	12(%rsp), %eax
	jg	.L10
	addl	$1, %r8d
	addq	$4, %rbx
	addq	$4, %rbp
	cmpl	%r8d, %ecx
	je	.L8
.L11:
	movl	(%rbx), %eax
	movl	(%rbx), %esi
	movl	0(%rbp), %edx
	sarl	$31, %eax
	xorl	%eax, %esi
	sarl	$31, %edx
	subl	%eax, %esi
	movl	0(%rbp), %eax
	xorl	%edx, %eax
	subl	%edx, %eax
	movl	%esi, %edx
	subl	%eax, %edx
	cmpl	12(%rsp), %edx
	jle	.L9
.L10:
	movl	%r8d, %edx
	leaq	.LC5(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	(%rbx), %ecx
	movl	0(%rbp), %edx
	movl	$1, %edi
	leaq	.LC6(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$-1, %eax
.L1:
	movq	136(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L17
	addq	$152, %rsp
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
.L8:
	.cfi_restore_state
	movq	%r14, %rdi
	call	fclose@PLT
	movq	24(%rsp), %rdi
	call	free@PLT
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L6:
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$-1, %eax
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L2:
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movl	$-1, %eax
	jmp	.L1
.L17:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE39:
	.size	selfCheck, .-selfCheck
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
