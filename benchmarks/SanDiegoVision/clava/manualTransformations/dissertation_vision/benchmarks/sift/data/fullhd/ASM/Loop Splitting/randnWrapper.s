	.file	"randnWrapper.c"
	.text
	.p2align 4
	.globl	randnWrapper
	.type	randnWrapper, @function
randnWrapper:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pxor	%xmm0, %xmm0
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movl	%edi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	%esi, %ebx
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	call	fSetArray@PLT
	movq	%rax, %r14
	testl	%ebp, %ebp
	jle	.L1
	testl	%ebx, %ebx
	jle	.L1
	movsd	.LC7(%rip), %xmm14
	movl	(%rax), %edx
	xorl	%r8d, %r8d
	leal	-1(%rbx), %r9d
	movapd	.LC3(%rip), %xmm7
	movdqa	.LC2(%rip), %xmm10
	movapd	.LC4(%rip), %xmm6
	movapd	%xmm14, %xmm15
	movsd	.LC6(%rip), %xmm13
	movdqa	.LC5(%rip), %xmm12
	movdqa	%xmm10, %xmm11
	movapd	%xmm7, %xmm9
	movapd	%xmm6, %xmm8
	.p2align 4,,10
	.p2align 3
.L12:
	pxor	%xmm2, %xmm2
	movl	%r8d, %edi
	movl	%r8d, %esi
	cvtsi2sdl	%r8d, %xmm2
	imull	%edx, %edi
	cmpl	%r8d, %r9d
	cmovle	%r9d, %esi
	addsd	%xmm13, %xmm2
	leal	1(%rsi), %r10d
	cmpl	$2, %esi
	jle	.L27
	movl	%r10d, %ecx
	movslq	%edi, %rax
	movapd	%xmm2, %xmm5
	movdqa	.LC0(%rip), %xmm4
	shrl	$2, %ecx
	leaq	8(%r14,%rax,4), %rax
	unpcklpd	%xmm5, %xmm5
	salq	$4, %rcx
	addq	%rax, %rcx
	.p2align 4,,10
	.p2align 3
.L4:
	movdqa	%xmm4, %xmm3
	addq	$16, %rax
	paddd	%xmm10, %xmm4
	pshufd	$238, %xmm3, %xmm1
	cvtdq2pd	%xmm3, %xmm0
	addpd	%xmm7, %xmm0
	paddd	%xmm12, %xmm3
	cvtdq2pd	%xmm1, %xmm1
	addpd	%xmm7, %xmm1
	divpd	%xmm5, %xmm0
	divpd	%xmm5, %xmm1
	mulpd	%xmm6, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	mulpd	%xmm6, %xmm1
	cvtpd2ps	%xmm1, %xmm1
	movlhps	%xmm1, %xmm0
	movups	%xmm0, -16(%rax)
	cmpq	%rax, %rcx
	jne	.L4
	movl	%r10d, %eax
	pshufd	$255, %xmm3, %xmm3
	andl	$-4, %eax
	andl	$3, %r10d
	movd	%xmm3, %ecx
	je	.L5
.L15:
	pxor	%xmm0, %xmm0
	leal	(%rdi,%rax), %ecx
	cvtsi2sdl	%eax, %xmm0
	movslq	%ecx, %rcx
	addsd	%xmm13, %xmm0
	divsd	%xmm2, %xmm0
	mulsd	%xmm14, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 8(%r14,%rcx,4)
	leal	1(%rax), %ecx
	cmpl	%ecx, %esi
	jl	.L5
	pxor	%xmm0, %xmm0
	leal	(%rdi,%rcx), %r10d
	cvtsi2sdl	%ecx, %xmm0
	movslq	%r10d, %r10
	leal	2(%rax), %ecx
	addsd	%xmm13, %xmm0
	divsd	%xmm2, %xmm0
	mulsd	%xmm14, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 8(%r14,%r10,4)
	cmpl	%ecx, %esi
	jl	.L5
	pxor	%xmm0, %xmm0
	leal	(%rdi,%rcx), %esi
	cvtsi2sdl	%ecx, %xmm0
	movslq	%esi, %rsi
	leal	3(%rax), %ecx
	addsd	%xmm13, %xmm0
	divsd	%xmm2, %xmm0
	mulsd	%xmm14, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 8(%r14,%rsi,4)
.L5:
	cmpl	%ecx, %ebx
	jle	.L9
	movl	%ebx, %r10d
	subl	%ecx, %r10d
	leal	-1(%r10), %eax
	cmpl	$2, %eax
	jbe	.L6
	movslq	%ecx, %rsi
	movslq	%edi, %rax
	movd	%ecx, %xmm4
	leaq	2(%rax,%rsi), %rax
	movl	%r10d, %esi
	pshufd	$0, %xmm4, %xmm3
	shrl	$2, %esi
	movapd	%xmm2, %xmm4
	leaq	(%r14,%rax,4), %rax
	salq	$4, %rsi
	paddd	.LC0(%rip), %xmm3
	unpcklpd	%xmm4, %xmm4
	addq	%rax, %rsi
	.p2align 4,,10
	.p2align 3
.L7:
	movdqa	%xmm3, %xmm0
	movapd	%xmm4, %xmm5
	addq	$16, %rax
	cvtdq2pd	%xmm0, %xmm1
	addpd	%xmm9, %xmm1
	pshufd	$238, %xmm0, %xmm0
	paddd	%xmm11, %xmm3
	cvtdq2pd	%xmm0, %xmm0
	addpd	%xmm9, %xmm0
	divpd	%xmm1, %xmm5
	movapd	%xmm5, %xmm1
	movapd	%xmm4, %xmm5
	divpd	%xmm0, %xmm5
	mulpd	%xmm8, %xmm1
	cvtpd2ps	%xmm1, %xmm1
	movapd	%xmm5, %xmm0
	mulpd	%xmm8, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movlhps	%xmm0, %xmm1
	movups	%xmm1, -16(%rax)
	cmpq	%rsi, %rax
	jne	.L7
	movl	%r10d, %eax
	andl	$-4, %eax
	addl	%eax, %ecx
	cmpl	%r10d, %eax
	je	.L9
.L6:
	pxor	%xmm0, %xmm0
	movapd	%xmm2, %xmm4
	leal	(%rcx,%rdi), %eax
	cvtsi2sdl	%ecx, %xmm0
	cltq
	addsd	%xmm13, %xmm0
	divsd	%xmm0, %xmm4
	movapd	%xmm4, %xmm0
	mulsd	%xmm15, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 8(%r14,%rax,4)
	leal	1(%rcx), %eax
	cmpl	%eax, %ebx
	jle	.L9
	pxor	%xmm0, %xmm0
	movapd	%xmm2, %xmm4
	leal	(%rax,%rdi), %esi
	addl	$2, %ecx
	cvtsi2sdl	%eax, %xmm0
	movslq	%esi, %rsi
	addsd	%xmm13, %xmm0
	divsd	%xmm0, %xmm4
	movapd	%xmm4, %xmm0
	mulsd	%xmm15, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 8(%r14,%rsi,4)
	cmpl	%ebx, %ecx
	jge	.L9
	pxor	%xmm0, %xmm0
	addl	%ecx, %edi
	cvtsi2sdl	%ecx, %xmm0
	movslq	%edi, %rdi
	addsd	%xmm13, %xmm0
	divsd	%xmm0, %xmm2
	pxor	%xmm0, %xmm0
	mulsd	%xmm15, %xmm2
	cvtsd2ss	%xmm2, %xmm0
	movss	%xmm0, 8(%r14,%rdi,4)
.L9:
	addl	$1, %r8d
	cmpl	%r8d, %ebp
	jne	.L12
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L13:
	xorl	%r13d, %r13d
	.p2align 4,,10
	.p2align 3
.L17:
	imull	%r12d, %edx
	pxor	%xmm1, %xmm1
	addl	%r13d, %edx
	movslq	%edx, %rdx
	cvtss2sd	8(%r14,%rdx,4), %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm1, 8(%rsp)
	call	log@PLT
	mulsd	.LC8(%rip), %xmm0
	movsd	8(%rsp), %xmm1
	movl	(%r14), %edx
	movl	%edx, %ecx
	imull	%r12d, %ecx
	divsd	%xmm1, %xmm0
	addl	%r13d, %ecx
	addl	$1, %r13d
	movslq	%ecx, %rcx
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 8(%r14,%rcx,4)
	cmpl	%r13d, %ebx
	jne	.L17
	addl	$1, %r12d
	cmpl	%r12d, %ebp
	jne	.L13
.L1:
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movq	%r14, %rax
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
.L27:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L15
	.cfi_endproc
.LFE39:
	.size	randnWrapper, .-randnWrapper
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC2:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC3:
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.align 16
.LC4:
	.long	3221225472
	.long	1072483532
	.long	3221225472
	.long	1072483532
	.align 16
.LC5:
	.long	1
	.long	1
	.long	1
	.long	1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC6:
	.long	0
	.long	1072693248
	.align 8
.LC7:
	.long	3221225472
	.long	1072483532
	.align 8
.LC8:
	.long	0
	.long	-1073741824
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
