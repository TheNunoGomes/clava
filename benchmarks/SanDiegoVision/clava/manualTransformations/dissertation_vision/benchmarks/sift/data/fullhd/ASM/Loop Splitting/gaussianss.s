	.file	"gaussianss.c"
	.text
	.p2align 4
	.globl	resizeArray
	.type	resizeArray, @function
resizeArray:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	testl	%esi, %esi
	js	.L10
	je	.L6
	leal	1(%rsi), %r13d
	movq	%rdi, %r12
	movl	$1, %ebx
	.p2align 4,,10
	.p2align 3
.L4:
	movq	%r12, %rdi
	movq	%r12, %rbp
	addl	$1, %ebx
	call	halveSize@PLT
	movq	%rbp, %rdi
	movq	%rax, %r12
	call	fFreeHandle@PLT
	cmpl	%ebx, %r13d
	jne	.L4
.L1:
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
.L10:
	.cfi_restore_state
	cmpl	$-1, %esi
	jne	.L6
	call	doubleSize@PLT
	movq	%rbp, %rdi
	movq	%rax, %r12
	call	fFreeHandle@PLT
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
.L6:
	.cfi_restore_state
	movq	%rbp, %r12
	jmp	.L1
	.cfi_endproc
.LFE39:
	.size	resizeArray, .-resizeArray
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	"Could not allocate memory"
	.text
	.p2align 4
	.globl	gaussianss
	.type	gaussianss, @function
gaussianss:
.LFB40:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%r9d, %eax
	movq	%rdi, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	subl	%r8d, %eax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	addl	$1, %eax
	movl	%r8d, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%ecx, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%r9d, %ebx
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	movss	%xmm0, 8(%rsp)
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%edx, %xmm0
	movss	%xmm1, 16(%rsp)
	movss	.LC0(%rip), %xmm1
	movl	%eax, 64(%rsp)
	movq	.LC1(%rip), %rax
	movl	%esi, 52(%rsp)
	movl	%edx, 72(%rsp)
	divss	%xmm0, %xmm1
	movq	%rax, %xmm0
	cvtss2sd	%xmm1, %xmm1
	call	pow@PLT
	pxor	%xmm1, %xmm1
	movss	16(%rsp), %xmm2
	cvtsd2ss	%xmm0, %xmm0
	cvtss2sd	%xmm0, %xmm1
	pxor	%xmm7, %xmm7
	pxor	%xmm5, %xmm5
	movsd	%xmm1, 16(%rsp)
	mulsd	%xmm1, %xmm1
	movsd	.LC2(%rip), %xmm0
	cvtss2sd	%xmm2, %xmm7
	movsd	%xmm7, 32(%rsp)
	movapd	%xmm0, %xmm7
	divsd	%xmm1, %xmm7
	subsd	%xmm7, %xmm0
	ucomisd	%xmm0, %xmm5
	movapd	%xmm0, %xmm1
	sqrtsd	%xmm1, %xmm1
	ja	.L43
.L12:
	mulsd	32(%rsp), %xmm1
	pxor	%xmm7, %xmm7
	cvtsd2ss	%xmm1, %xmm7
	movss	%xmm7, 104(%rsp)
	testl	%ebp, %ebp
	js	.L44
	je	.L35
	movq	%r15, 40(%rsp)
	leal	1(%rbp), %r14d
	movl	$1, %r15d
	.p2align 4,,10
	.p2align 3
.L15:
	movq	40(%rsp), %r12
	addl	$1, %r15d
	movq	%r12, %rdi
	call	halveSize@PLT
	movq	%r12, %rdi
	movq	%rax, 40(%rsp)
	call	fFreeHandle@PLT
	cmpl	%r14d, %r15d
	jne	.L15
	.p2align 4,,10
	.p2align 3
.L14:
	movl	64(%rsp), %edi
	imull	52(%rsp), %edi
	movl	$1, %r14d
	subl	%r13d, %r14d
	movl	%r14d, %r12d
	movslq	%edi, %rdi
	salq	$3, %rdi
	call	malloc@PLT
	movq	%rax, 96(%rsp)
	testq	%rax, %rax
	je	.L45
	pxor	%xmm7, %xmm7
	movsd	16(%rsp), %xmm0
	cvtsi2sdl	%r13d, %xmm7
	movapd	%xmm7, %xmm1
	movsd	%xmm7, 56(%rsp)
	call	pow@PLT
	movsd	32(%rsp), %xmm2
	pxor	%xmm1, %xmm1
	movq	.LC1(%rip), %rax
	cvtsi2sdl	%ebp, %xmm1
	mulsd	%xmm0, %xmm2
	movq	%rax, %xmm0
	movsd	%xmm2, 24(%rsp)
	call	pow@PLT
	pxor	%xmm1, %xmm1
	movsd	24(%rsp), %xmm2
	cvtss2sd	8(%rsp), %xmm1
	divsd	%xmm0, %xmm1
	mulsd	%xmm2, %xmm2
	movapd	%xmm2, %xmm0
	mulsd	%xmm1, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm6
	sqrtsd	%xmm6, %xmm6
	movsd	%xmm6, 8(%rsp)
	pxor	%xmm6, %xmm6
	ucomisd	%xmm0, %xmm6
	ja	.L46
.L18:
	movq	40(%rsp), %r14
	pxor	%xmm0, %xmm0
	movl	4(%r14), %edi
	movl	(%r14), %esi
	call	fSetArray@PLT
	pxor	%xmm0, %xmm0
	movq	%r14, %rdi
	movq	%rax, %rsi
	movq	96(%rsp), %rax
	cvtsd2ss	8(%rsp), %xmm0
	movq	%rsi, (%rax)
	call	imsmooth@PLT
	cmpl	%r13d, %ebx
	jle	.L23
	movq	96(%rsp), %rcx
	movslq	%r12d, %rax
	movslq	%r13d, %rdx
	pxor	%xmm7, %xmm7
	addq	%rdx, %rax
	cvtss2sd	104(%rsp), %xmm7
	movl	%r13d, %r14d
	movsd	%xmm7, 24(%rsp)
	leaq	-8(%rcx,%rax,8), %rbp
	.p2align 4,,10
	.p2align 3
.L22:
	addl	$1, %r14d
	pxor	%xmm1, %xmm1
	movsd	16(%rsp), %xmm0
	addq	$8, %rbp
	cvtsi2sdl	%r14d, %xmm1
	call	pow@PLT
	movq	-8(%rbp), %rax
	movsd	%xmm0, 8(%rsp)
	pxor	%xmm0, %xmm0
	movl	4(%rax), %edi
	movl	(%rax), %esi
	call	fSetArray@PLT
	movsd	8(%rsp), %xmm1
	mulsd	24(%rsp), %xmm1
	pxor	%xmm0, %xmm0
	movq	%rax, 0(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rax, %rsi
	cvtsd2ss	%xmm1, %xmm0
	call	imsmooth@PLT
	cmpl	%ebx, %r14d
	jne	.L22
.L23:
	cmpl	$1, 52(%rsp)
	jle	.L21
	movl	72(%rsp), %esi
	leal	-1(%rbx), %eax
	movq	96(%rsp), %rbp
	movslq	%r12d, %r15
	pxor	%xmm5, %xmm5
	movl	$1, %r14d
	leal	0(%r13,%rsi), %edx
	cmpl	%ebx, %edx
	leal	-1(%rdx), %ecx
	movslq	64(%rsp), %rdx
	cmovl	%ecx, %eax
	leal	1(%rax), %ecx
	cltq
	subl	%esi, %ecx
	leaq	0(,%rdx,8), %rsi
	movq	%rsi, 64(%rsp)
	addq	%rsi, %rbp
	cvtsi2sdl	%ecx, %xmm5
	movslq	%r13d, %rsi
	addq	%r15, %rsi
	subq	%rdx, %r15
	salq	$3, %rsi
	addq	%r15, %rax
	movq	%rsi, 88(%rsp)
	movq	%rax, 72(%rsp)
	movsd	%xmm5, 80(%rsp)
	.p2align 4,,10
	.p2align 3
.L31:
	movq	72(%rsp), %rax
	movq	0(%rbp,%rax,8), %rdi
	call	halveSize@PLT
	movsd	56(%rsp), %xmm1
	movsd	16(%rsp), %xmm0
	movq	%rax, %r12
	call	pow@PLT
	mulsd	32(%rsp), %xmm0
	pxor	%xmm3, %xmm3
	movsd	80(%rsp), %xmm1
	cvtsd2ss	%xmm0, %xmm3
	movsd	16(%rsp), %xmm0
	movss	%xmm3, 8(%rsp)
	call	pow@PLT
	mulsd	32(%rsp), %xmm0
	movss	8(%rsp), %xmm3
	pxor	%xmm2, %xmm2
	pxor	%xmm1, %xmm1
	pxor	%xmm7, %xmm7
	cvtsd2ss	%xmm0, %xmm2
	pxor	%xmm0, %xmm0
	cvtss2sd	%xmm2, %xmm1
	cvtss2sd	%xmm3, %xmm0
	mulsd	%xmm1, %xmm1
	mulsd	%xmm0, %xmm0
	subsd	%xmm1, %xmm0
	ucomisd	%xmm0, %xmm7
	movapd	%xmm0, %xmm1
	ja	.L47
.L24:
	comiss	%xmm2, %xmm3
	movl	(%r12), %esi
	movl	4(%r12), %edi
	pxor	%xmm0, %xmm0
	movsd	%xmm1, 8(%rsp)
	jbe	.L41
	call	fSetArray@PLT
	movsd	8(%rsp), %xmm1
	pxor	%xmm0, %xmm0
	movq	%r12, %rdi
	movq	%rax, 0(%rbp)
	movq	%rax, %rsi
	sqrtsd	%xmm1, %xmm1
	cvtsd2ss	%xmm1, %xmm0
	call	imsmooth@PLT
.L27:
	movq	%r12, %rdi
	call	fFreeHandle@PLT
	cmpl	%r13d, %ebx
	jle	.L33
	movq	88(%rsp), %rax
	pxor	%xmm6, %xmm6
	movl	%r13d, %r15d
	cvtss2sd	104(%rsp), %xmm6
	movsd	%xmm6, 24(%rsp)
	leaq	(%rax,%rbp), %r12
	.p2align 4,,10
	.p2align 3
.L32:
	addl	$1, %r15d
	pxor	%xmm1, %xmm1
	movsd	16(%rsp), %xmm0
	addq	$8, %r12
	cvtsi2sdl	%r15d, %xmm1
	call	pow@PLT
	movq	-16(%r12), %rax
	movsd	%xmm0, 8(%rsp)
	pxor	%xmm0, %xmm0
	movl	4(%rax), %edi
	movl	(%rax), %esi
	call	fSetArray@PLT
	movsd	8(%rsp), %xmm1
	mulsd	24(%rsp), %xmm1
	pxor	%xmm0, %xmm0
	movq	%rax, -8(%r12)
	movq	-16(%r12), %rdi
	movq	%rax, %rsi
	cvtsd2ss	%xmm1, %xmm0
	call	imsmooth@PLT
	cmpl	%ebx, %r15d
	jne	.L32
.L33:
	addl	$1, %r14d
	addq	64(%rsp), %rbp
	cmpl	%r14d, 52(%rsp)
	jne	.L31
.L21:
	movq	40(%rsp), %rdi
	call	fFreeHandle@PLT
.L11:
	movq	96(%rsp), %rax
	addq	$120, %rsp
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
.L41:
	.cfi_restore_state
	call	fSetArray@PLT
	movl	4(%r12), %edx
	imull	(%r12), %edx
	movq	%rax, 0(%rbp)
	testl	%edx, %edx
	jle	.L27
	subl	$1, %edx
	leaq	8(%r12), %rsi
	leaq	8(%rax), %rdi
	leaq	4(,%rdx,4), %rdx
	call	memmove@PLT
	jmp	.L27
.L44:
	cmpl	$-1, %ebp
	jne	.L35
	movq	%r15, %rdi
	call	doubleSize@PLT
	movq	%r15, %rdi
	movq	%rax, 40(%rsp)
	call	fFreeHandle@PLT
	jmp	.L14
.L35:
	movq	%r15, 40(%rsp)
	jmp	.L14
.L47:
	movss	%xmm2, 108(%rsp)
	movss	%xmm3, 24(%rsp)
	movsd	%xmm0, 8(%rsp)
	call	sqrt@PLT
	movss	108(%rsp), %xmm2
	movss	24(%rsp), %xmm3
	movsd	8(%rsp), %xmm1
	jmp	.L24
.L46:
	call	sqrt@PLT
	jmp	.L18
.L43:
	movsd	%xmm1, 24(%rsp)
	call	sqrt@PLT
	movsd	24(%rsp), %xmm1
	jmp	.L12
.L45:
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	jmp	.L11
	.cfi_endproc
.LFE40:
	.size	gaussianss, .-gaussianss
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1065353216
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1073741824
	.align 8
.LC2:
	.long	0
	.long	1072693248
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
