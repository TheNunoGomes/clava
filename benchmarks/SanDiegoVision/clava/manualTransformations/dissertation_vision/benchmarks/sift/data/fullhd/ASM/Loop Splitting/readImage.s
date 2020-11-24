	.file	"readImage.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"rb"
.LC1:
	.string	"File pointer error"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"ERROR in BMP read: The input file is not in standard BMP format"
	.text
	.p2align 4
	.globl	readImage
	.type	readImage, @function
readImage:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leaq	.LC0(%rip), %rsi
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
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	call	fopen@PLT
	testq	%rax, %rax
	je	.L29
	movq	%rax, %rbp
	leaq	86(%rsp), %rdi
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$2, %esi
	call	fread@PLT
	leaq	40(%rsp), %rdi
	movq	%rbp, %rcx
	movl	$1, %edx
	movl	$4, %esi
	call	fread@PLT
	leaq	32(%rsp), %rdi
	movq	%rbp, %rcx
	movl	$1, %edx
	movl	$2, %esi
	call	fread@PLT
	leaq	34(%rsp), %rdi
	movq	%rbp, %rcx
	movl	$1, %edx
	movl	$2, %esi
	call	fread@PLT
	leaq	44(%rsp), %rdi
	movq	%rbp, %rcx
	movl	$1, %edx
	movl	$4, %esi
	call	fread@PLT
	leaq	48(%rsp), %rdi
	movq	%rbp, %rcx
	movl	$1, %edx
	movl	$4, %esi
	call	fread@PLT
	leaq	52(%rsp), %rdi
	movq	%rbp, %rcx
	movl	$1, %edx
	movl	$4, %esi
	call	fread@PLT
	leaq	56(%rsp), %rdi
	movq	%rbp, %rcx
	movl	$1, %edx
	movl	$4, %esi
	call	fread@PLT
	leaq	36(%rsp), %rdi
	movq	%rbp, %rcx
	movl	$1, %edx
	movl	$2, %esi
	call	fread@PLT
	leaq	38(%rsp), %rdi
	movq	%rbp, %rcx
	movl	$1, %edx
	movl	$2, %esi
	call	fread@PLT
	leaq	60(%rsp), %rdi
	movq	%rbp, %rcx
	movl	$1, %edx
	movl	$4, %esi
	call	fread@PLT
	leaq	64(%rsp), %rdi
	movq	%rbp, %rcx
	movl	$1, %edx
	movl	$4, %esi
	call	fread@PLT
	leaq	68(%rsp), %rdi
	movq	%rbp, %rcx
	movl	$1, %edx
	movl	$4, %esi
	call	fread@PLT
	leaq	72(%rsp), %rdi
	movq	%rbp, %rcx
	movl	$1, %edx
	movl	$4, %esi
	call	fread@PLT
	leaq	76(%rsp), %rdi
	movq	%rbp, %rcx
	movl	$1, %edx
	movl	$4, %esi
	call	fread@PLT
	movl	$1, %edx
	leaq	80(%rsp), %rdi
	movq	%rbp, %rcx
	movl	$4, %esi
	call	fread@PLT
	movl	52(%rsp), %esi
	movl	56(%rsp), %edi
	call	iMallocHandle@PLT
	movl	4(%rax), %edx
	movq	%rax, %r14
	testl	%edx, %edx
	jle	.L4
	movl	(%rax), %eax
	testl	%eax, %eax
	jle	.L4
	cmpb	$66, 86(%rsp)
	jne	.L4
	cmpb	$77, 87(%rsp)
	jne	.L4
	movzwl	38(%rsp), %eax
	andl	$-17, %eax
	cmpw	$8, %ax
	jne	.L4
	movslq	44(%rsp), %rsi
	xorl	%edx, %edx
	movq	%rbp, %rdi
	call	fseek@PLT
	movzwl	38(%rsp), %eax
	cmpw	$8, %ax
	je	.L30
	cmpw	$24, %ax
	jne	.L16
	movl	56(%rsp), %eax
	subl	$1, %eax
	movl	%eax, 12(%rsp)
	js	.L7
	movl	52(%rsp), %eax
	leaq	30(%rsp), %rbx
	.p2align 4,,10
	.p2align 3
.L11:
	xorl	%r15d, %r15d
	leaq	29(%rsp), %r13
	leaq	31(%rsp), %r12
	testl	%eax, %eax
	jle	.L13
	.p2align 4,,10
	.p2align 3
.L12:
	movq	%rbp, %rcx
	movl	$1, %edx
	movl	$1, %esi
	movq	%r13, %rdi
	call	fread@PLT
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%rbx, %rdi
	movl	$1, %esi
	call	fread@PLT
	movl	$1, %edx
	movq	%rbp, %rcx
	movq	%r12, %rdi
	movl	$1, %esi
	call	fread@PLT
	movl	12(%rsp), %eax
	imull	(%r14), %eax
	movzbl	30(%rsp), %edx
	addl	%r15d, %eax
	addl	$1, %r15d
	cltq
	movl	%edx, 8(%r14,%rax,4)
	movl	52(%rsp), %eax
	cmpl	%r15d, %eax
	jg	.L12
.L13:
	subl	$1, 12(%rsp)
	movl	12(%rsp), %ecx
	cmpl	$-1, %ecx
	jne	.L11
.L7:
	movq	%rbp, %rdi
	call	fclose@PLT
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L4:
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	xorl	%r14d, %r14d
	call	__printf_chk@PLT
.L1:
	movq	88(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L31
	addq	$104, %rsp
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
	.p2align 4,,10
	.p2align 3
.L16:
	.cfi_restore_state
	xorl	%r14d, %r14d
	jmp	.L1
.L29:
	leaq	.LC1(%rip), %rdi
	xorl	%r14d, %r14d
	call	perror@PLT
	jmp	.L1
.L30:
	movl	56(%rsp), %ebx
	subl	$1, %ebx
	js	.L7
	movl	52(%rsp), %eax
	leaq	30(%rsp), %r12
	.p2align 4,,10
	.p2align 3
.L8:
	xorl	%r13d, %r13d
	testl	%eax, %eax
	jle	.L10
	.p2align 4,,10
	.p2align 3
.L9:
	movl	$1, %edx
	movq	%rbp, %rcx
	movl	$1, %esi
	movq	%r12, %rdi
	call	fread@PLT
	movl	(%r14), %eax
	movzbl	30(%rsp), %edx
	imull	%ebx, %eax
	addl	%r13d, %eax
	addl	$1, %r13d
	cltq
	movl	%edx, 8(%r14,%rax,4)
	movl	52(%rsp), %eax
	cmpl	%r13d, %eax
	jg	.L9
.L10:
	subl	$1, %ebx
	cmpl	$-1, %ebx
	jne	.L8
	jmp	.L7
.L31:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE39:
	.size	readImage, .-readImage
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
