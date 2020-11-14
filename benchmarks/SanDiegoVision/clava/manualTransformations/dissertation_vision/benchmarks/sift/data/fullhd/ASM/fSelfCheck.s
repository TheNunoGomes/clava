	.file	"fSelfCheck.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s/expected_C.txt"
.LC1:
	.string	"r"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"Error: Expected file not opened %s\n"
	.section	.rodata.str1.1
.LC3:
	.string	"%f"
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"Checking error: dimensions mismatch. Expected = %d, Observed = %d \n"
	.section	.rodata.str1.1
.LC5:
	.string	"Mismatch %d: (%f, %f)\n"
.LC6:
	.string	"Verification\t\t- Successful"
	.text
	.p2align 4
	.globl	fSelfCheck
	.type	fSelfCheck, @function
fSelfCheck:
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
	movq	%rsi, %rbx
	subq	$296, %rsp
	.cfi_def_cfa_offset 352
	movl	(%r12), %ecx
	movslq	4(%rdi), %rdi
	movss	%xmm0, 4(%rsp)
	leaq	16(%rsp), %r14
	movq	%fs:40, %rax
	movq	%rax, 280(%rsp)
	xorl	%eax, %eax
	movslq	%ecx, %rax
	movl	%edi, 8(%rsp)
	imulq	%rax, %rdi
	movl	%ecx, 12(%rsp)
	salq	$2, %rdi
	call	malloc@PLT
	movl	$1, %esi
	movq	%r14, %rdi
	movq	%rbx, %r8
	movq	%rax, %r13
	leaq	.LC0(%rip), %rcx
	xorl	%eax, %eax
	movl	$256, %edx
	call	__sprintf_chk@PLT
	leaq	.LC1(%rip), %rsi
	movq	%r14, %rdi
	call	fopen@PLT
	testq	%rax, %rax
	je	.L2
	movq	%rax, %r15
	movq	%r13, %rbx
	leaq	.LC3(%rip), %r14
	xorl	%ebp, %ebp
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L5:
	movq	%rbx, %rdx
	movq	%r14, %rsi
	movq	%r15, %rdi
	xorl	%eax, %eax
	call	__isoc99_fscanf@PLT
	addl	$1, %ebp
	addq	$4, %rbx
.L3:
	movq	%r15, %rdi
	call	feof@PLT
	testl	%eax, %eax
	je	.L5
	movl	8(%rsp), %ecx
	imull	12(%rsp), %ecx
	leal	-1(%rbp), %edx
	cmpl	%edx, %ecx
	jne	.L6
	leal	-2(%rbp), %esi
	xorl	%eax, %eax
	testl	%ecx, %ecx
	jg	.L12
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L16:
	movaps	%xmm0, %xmm2
	subss	%xmm1, %xmm2
	comiss	4(%rsp), %xmm2
	ja	.L11
	leaq	1(%rax), %rdx
	cmpq	%rsi, %rax
	je	.L8
	movq	%rdx, %rax
.L12:
	movss	8(%r12,%rax,4), %xmm1
	movss	0(%r13,%rax,4), %xmm0
	movl	%eax, %edx
	movaps	%xmm1, %xmm2
	subss	%xmm0, %xmm2
	comiss	4(%rsp), %xmm2
	jbe	.L16
.L11:
	leaq	.LC5(%rip), %rsi
	movl	$1, %edi
	cvtss2sd	%xmm0, %xmm0
	cvtss2sd	%xmm1, %xmm1
	movl	$2, %eax
	call	__printf_chk@PLT
	movl	$-1, %eax
.L1:
	movq	280(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L19
	addq	$296, %rsp
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
.L6:
	.cfi_restore_state
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$-1, %eax
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L8:
	movq	%r15, %rdi
	call	fclose@PLT
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	movq	%r13, %rdi
	call	free@PLT
	movl	$1, %eax
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L2:
	movq	%r14, %rdx
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$-1, %eax
	jmp	.L1
.L19:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE39:
	.size	fSelfCheck, .-fSelfCheck
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
