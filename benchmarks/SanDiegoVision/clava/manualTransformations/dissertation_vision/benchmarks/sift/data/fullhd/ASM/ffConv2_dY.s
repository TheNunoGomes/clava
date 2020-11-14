	.file	"ffConv2_dY.c"
	.text
	.p2align 4
	.globl	ffConv2_dY
	.type	ffConv2_dY, @function
ffConv2_dY:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pxor	%xmm2, %xmm2
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movl	(%rdi), %ebx
	movl	4(%rdi), %r12d
	movsd	.LC0(%rip), %xmm4
	movsd	.LC1(%rip), %xmm7
	movq	%rsi, 8(%rsp)
	movq	.LC3(%rip), %xmm1
	movsd	.LC2(%rip), %xmm6
	movl	%ebx, 20(%rsp)
	movl	4(%rsi), %ebx
	movl	(%rsi), %ebp
	cvtsi2sdl	%ebx, %xmm2
	addsd	%xmm4, %xmm2
	mulsd	%xmm7, %xmm2
	movapd	%xmm2, %xmm3
	movapd	%xmm2, %xmm0
	andpd	%xmm1, %xmm3
	ucomisd	%xmm3, %xmm6
	jbe	.L2
	cvttsd2siq	%xmm2, %rax
	pxor	%xmm3, %xmm3
	movapd	%xmm1, %xmm5
	andnpd	%xmm2, %xmm5
	cvtsi2sdq	%rax, %xmm3
	cmpnlesd	%xmm3, %xmm0
	andpd	%xmm4, %xmm0
	addsd	%xmm3, %xmm0
	orpd	%xmm5, %xmm0
.L2:
	cvttsd2sil	%xmm0, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%ebp, %xmm0
	movl	%eax, 28(%rsp)
	addsd	%xmm4, %xmm0
	mulsd	%xmm7, %xmm0
	movapd	%xmm0, %xmm2
	movapd	%xmm0, %xmm3
	andpd	%xmm1, %xmm2
	ucomisd	%xmm2, %xmm6
	jbe	.L3
	cvttsd2siq	%xmm0, %rax
	pxor	%xmm2, %xmm2
	andnpd	%xmm3, %xmm1
	cvtsi2sdq	%rax, %xmm2
	cmpnlesd	%xmm2, %xmm0
	andpd	%xmm4, %xmm0
	addsd	%xmm2, %xmm0
	orpd	%xmm1, %xmm0
.L3:
	cvttsd2sil	%xmm0, %eax
	movl	20(%rsp), %r15d
	pxor	%xmm0, %xmm0
	leal	-1(%r15,%rbp), %esi
	movl	%esi, 24(%rsp)
	movl	%eax, 32(%rsp)
	leal	-1(%r12,%rbx), %eax
	movl	%eax, %edi
	movl	%eax, 16(%rsp)
	call	fSetArray@PLT
	movl	24(%rsp), %edx
	movq	%rax, %r14
	testl	%edx, %edx
	jle	.L4
	movl	16(%rsp), %eax
	testl	%eax, %eax
	jle	.L4
	testl	%r15d, %r15d
	jle	.L5
	negl	%r15d
	xorl	%r10d, %r10d
.L6:
	movl	%r12d, %r9d
	xorl	%r8d, %r8d
	negl	%r9d
	.p2align 4,,10
	.p2align 3
.L15:
	movl	%r10d, %esi
	.p2align 4,,10
	.p2align 3
.L13:
	movl	%r10d, %r11d
	subl	%esi, %r11d
	testl	%r12d, %r12d
	jle	.L7
	testl	%esi, %esi
	js	.L7
	movl	%r11d, 4(%rsp)
	movl	%r8d, %eax
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L8:
	subl	$1, %eax
	cmpl	%r9d, %eax
	je	.L7
.L9:
	movl	%r8d, %edi
	movl	%eax, %edx
	subl	%eax, %edi
	notl	%edx
	cmpl	%ebx, %eax
	setl	%cl
	shrl	$31, %edx
	testb	%dl, %cl
	je	.L8
	cmpl	%ebp, %esi
	jge	.L8
	movl	(%r14), %edx
	imull	0(%r13), %edi
	imull	%r8d, %edx
	addl	%r10d, %edx
	movslq	%edx, %rdx
	leaq	(%r14,%rdx,4), %rcx
	movl	4(%rsp), %edx
	addl	%edi, %edx
	movq	8(%rsp), %rdi
	movslq	%edx, %rdx
	movl	(%rdi), %r11d
	movss	8(%r13,%rdx,4), %xmm0
	movq	8(%rsp), %rdx
	imull	%eax, %r11d
	subl	$1, %eax
	movl	%r11d, %edi
	addl	%esi, %edi
	movslq	%edi, %rdi
	mulss	8(%rdx,%rdi,4), %xmm0
	addss	8(%rcx), %xmm0
	movss	%xmm0, 8(%rcx)
	cmpl	%r9d, %eax
	jne	.L9
	.p2align 4,,10
	.p2align 3
.L7:
	subl	$1, %esi
	cmpl	%r15d, %esi
	jne	.L13
	addl	$1, %r8d
	addl	$1, %r9d
	cmpl	16(%rsp), %r8d
	jne	.L15
	addl	$1, %r10d
	leal	1(%rsi), %r15d
	cmpl	24(%rsp), %r10d
	jne	.L6
	movl	20(%rsp), %esi
	movl	%r12d, %edi
	call	fMallocHandle@PLT
	movq	%rax, %r8
	testl	%r12d, %r12d
	jle	.L1
.L24:
	movl	20(%rsp), %ebx
	movl	(%r14), %eax
	leal	-1(%rbx), %r10d
	movl	%eax, 4(%rsp)
	movl	(%r8), %eax
	movl	%ebx, %ecx
	cmpl	$3, %r10d
	seta	%dl
	cmpq	%r8, %r14
	movl	%eax, 16(%rsp)
	setne	%al
	shrl	$2, %ecx
	xorl	%r11d, %r11d
	andl	%eax, %edx
	movl	%ebx, %eax
	salq	$4, %rcx
	andl	$-4, %eax
	movb	%dl, 39(%rsp)
	movl	%eax, %edi
	movslq	32(%rsp), %rax
	leal	1(%rdi), %ebp
	leal	1(%rax,%rdi), %esi
	leal	-1(%rax,%rdi), %ebx
	movl	%esi, 24(%rsp)
	movl	28(%rsp), %esi
	leal	(%rax,%rdi), %r15d
	movl	%ebx, 8(%rsp)
	leal	2(%rdi), %ebx
	subl	$1, %esi
	movl	%esi, 28(%rsp)
	leal	-1(%rax), %esi
	addq	$1, %rax
	movl	%esi, 32(%rsp)
	movq	%rax, 40(%rsp)
.L17:
	movl	28(%rsp), %eax
	movl	16(%rsp), %esi
	imull	%r11d, %esi
	leal	(%rax,%r11), %edx
	imull	4(%rsp), %edx
	cmpb	$0, 39(%rsp)
	je	.L38
	movslq	%edx, %rax
	addq	40(%rsp), %rax
	leaq	(%r14,%rax,4), %r13
	movslq	%esi, %rax
	leaq	8(%r8,%rax,4), %r9
	xorl	%eax, %eax
.L18:
	movups	0(%r13,%rax), %xmm6
	movups	%xmm6, (%r9,%rax)
	addq	$16, %rax
	cmpq	%rcx, %rax
	jne	.L18
	movl	20(%rsp), %r9d
	cmpl	%r9d, %edi
	je	.L21
	movl	8(%rsp), %eax
	addl	%edx, %eax
	cltq
	movss	8(%r14,%rax,4), %xmm0
	leal	(%rsi,%rdi), %eax
	cltq
	movss	%xmm0, 8(%r8,%rax,4)
	cmpl	%ebp, %r9d
	jle	.L21
	leal	(%rdx,%r15), %eax
	cltq
	movss	8(%r14,%rax,4), %xmm0
	leal	(%rsi,%rbp), %eax
	cltq
	movss	%xmm0, 8(%r8,%rax,4)
	cmpl	%ebx, %r9d
	jle	.L21
	movl	24(%rsp), %eax
	addl	%edx, %eax
	cltq
	movss	8(%r14,%rax,4), %xmm0
	leal	(%rsi,%rbx), %eax
	cltq
	movss	%xmm0, 8(%r8,%rax,4)
.L21:
	addl	$1, %r11d
	cmpl	%r11d, %r12d
	jne	.L17
.L1:
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r8, %rax
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
.L38:
	.cfi_restore_state
	movl	32(%rsp), %eax
	movslq	%esi, %rsi
	leaq	(%r8,%rsi,4), %rsi
	addl	%edx, %eax
	cltq
	leaq	(%r14,%rax,4), %r9
	xorl	%eax, %eax
.L20:
	movss	8(%r9,%rax,4), %xmm0
	movq	%rax, %rdx
	movss	%xmm0, 8(%rsi,%rax,4)
	addq	$1, %rax
	cmpq	%r10, %rdx
	jne	.L20
	jmp	.L21
.L4:
	movl	20(%rsp), %ebx
	movl	%r12d, %edi
	movl	%ebx, %esi
	call	fMallocHandle@PLT
	movq	%rax, %r8
	testl	%r12d, %r12d
	jle	.L1
	testl	%ebx, %ebx
	jg	.L24
	jmp	.L1
.L5:
	movl	20(%rsp), %esi
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
	movl	%r12d, %edi
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
	jmp	fMallocHandle@PLT
	.cfi_endproc
.LFE39:
	.size	ffConv2_dY, .-ffConv2_dY
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.align 8
.LC1:
	.long	0
	.long	1071644672
	.align 8
.LC2:
	.long	0
	.long	1127219200
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC3:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
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
