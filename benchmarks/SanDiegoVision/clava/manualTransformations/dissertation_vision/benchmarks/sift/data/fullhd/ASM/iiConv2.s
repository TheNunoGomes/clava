	.file	"iiConv2.c"
	.text
	.p2align 4
	.globl	iiConv2
	.type	iiConv2, @function
iiConv2:
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
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movl	4(%rsi), %ebp
	movl	4(%rdi), %ebx
	movsd	.LC0(%rip), %xmm4
	movsd	.LC1(%rip), %xmm7
	movq	%rsi, 16(%rsp)
	cvtsi2sdl	%ebp, %xmm2
	movq	.LC3(%rip), %xmm1
	movl	(%rdi), %r13d
	movl	%ebx, 28(%rsp)
	movsd	.LC2(%rip), %xmm6
	movl	(%rsi), %ebx
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
	cvtsi2sdl	%ebx, %xmm0
	movl	%eax, 36(%rsp)
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
	movl	28(%rsp), %r15d
	leal	-1(%r13,%rbx), %edi
	xorl	%edx, %edx
	movl	%edi, 24(%rsp)
	movl	%edi, %esi
	movl	%eax, 40(%rsp)
	leal	-1(%r15,%rbp), %eax
	movl	%eax, %edi
	movl	%eax, 32(%rsp)
	call	iSetArray@PLT
	movl	32(%rsp), %edx
	movq	%rax, %r14
	testl	%edx, %edx
	jle	.L4
	movl	24(%rsp), %eax
	testl	%eax, %eax
	jle	.L4
	testl	%r15d, %r15d
	jle	.L5
	negl	%r15d
	xorl	%r10d, %r10d
.L6:
	movl	%r13d, %r9d
	xorl	%edi, %edi
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
	testl	%r13d, %r13d
	jle	.L7
	testl	%esi, %esi
	js	.L7
	movl	%edi, %eax
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L8:
	subl	$1, %eax
	cmpl	%r9d, %eax
	je	.L7
.L9:
	movl	%edi, %r8d
	movl	%eax, %edx
	subl	%eax, %r8d
	notl	%edx
	cmpl	%ebx, %eax
	setl	%cl
	shrl	$31, %edx
	testb	%dl, %cl
	je	.L8
	cmpl	%ebp, %esi
	jge	.L8
	movl	(%r14), %edx
	movl	(%r12), %ecx
	imull	%r10d, %edx
	imull	%r11d, %ecx
	addl	%edi, %edx
	movslq	%edx, %rdx
	addl	%ecx, %r8d
	movq	%rdx, 8(%rsp)
	movq	16(%rsp), %rdx
	movslq	%r8d, %r8
	movl	8(%r12,%r8,4), %r8d
	movl	(%rdx), %ecx
	imull	%esi, %ecx
	addl	%eax, %ecx
	subl	$1, %eax
	movslq	%ecx, %rcx
	imull	8(%rdx,%rcx,4), %r8d
	movq	8(%rsp), %rdx
	addl	%r8d, 8(%r14,%rdx,4)
	cmpl	%r9d, %eax
	jne	.L9
	.p2align 4,,10
	.p2align 3
.L7:
	subl	$1, %esi
	cmpl	%r15d, %esi
	jne	.L13
	addl	$1, %edi
	addl	$1, %r9d
	cmpl	24(%rsp), %edi
	jne	.L15
	addl	$1, %r10d
	leal	1(%rsi), %r15d
	cmpl	32(%rsp), %r10d
	jne	.L6
	movl	28(%rsp), %edi
	movl	%r13d, %esi
	call	iMallocHandle@PLT
	movq	%rax, %r8
.L24:
	testl	%r13d, %r13d
	jle	.L1
	leal	-1(%r13), %r10d
	movl	%r13d, %edi
	movl	%r13d, %ecx
	cmpl	$3, %r10d
	seta	%dl
	cmpq	%r8, %r14
	setne	%al
	andl	$-4, %edi
	shrl	$2, %ecx
	xorl	%r11d, %r11d
	andl	%eax, %edx
	movslq	40(%rsp), %rax
	salq	$4, %rcx
	leal	1(%rdi), %ebp
	movb	%dl, 24(%rsp)
	leal	1(%rax,%rdi), %esi
	leal	-1(%rax,%rdi), %ebx
	movl	%esi, 16(%rsp)
	movl	36(%rsp), %esi
	leal	(%rax,%rdi), %r15d
	movl	%ebx, 8(%rsp)
	leal	2(%rdi), %ebx
	subl	$1, %esi
	movl	%esi, 32(%rsp)
	leal	-1(%rax), %esi
	addq	$1, %rax
	movl	%esi, 36(%rsp)
	movq	%rax, 40(%rsp)
.L17:
	movl	32(%rsp), %eax
	movl	(%r8), %esi
	imull	%r11d, %esi
	leal	(%rax,%r11), %edx
	imull	(%r14), %edx
	cmpb	$0, 24(%rsp)
	je	.L38
	movslq	%edx, %rax
	addq	40(%rsp), %rax
	leaq	(%r14,%rax,4), %r12
	movslq	%esi, %rax
	leaq	8(%r8,%rax,4), %r9
	xorl	%eax, %eax
.L18:
	movdqu	(%r12,%rax), %xmm6
	movups	%xmm6, (%r9,%rax)
	addq	$16, %rax
	cmpq	%rcx, %rax
	jne	.L18
	cmpl	%r13d, %edi
	je	.L21
	movl	8(%rsp), %eax
	addl	%edx, %eax
	cltq
	movl	8(%r14,%rax,4), %r9d
	leal	(%rsi,%rdi), %eax
	cltq
	movl	%r9d, 8(%r8,%rax,4)
	cmpl	%ebp, %r13d
	jle	.L21
	leal	(%rdx,%r15), %eax
	cltq
	movl	8(%r14,%rax,4), %r9d
	leal	(%rsi,%rbp), %eax
	cltq
	movl	%r9d, 8(%r8,%rax,4)
	cmpl	%ebx, %r13d
	jle	.L21
	movl	16(%rsp), %eax
	addl	%edx, %eax
	cltq
	movl	8(%r14,%rax,4), %edx
	leal	(%rsi,%rbx), %eax
	cltq
	movl	%edx, 8(%r8,%rax,4)
.L21:
	addl	$1, %r11d
	cmpl	%r11d, 28(%rsp)
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
	movl	36(%rsp), %eax
	movslq	%esi, %rsi
	leaq	(%r8,%rsi,4), %rsi
	addl	%edx, %eax
	cltq
	leaq	(%r14,%rax,4), %r9
	xorl	%eax, %eax
.L20:
	movl	8(%r9,%rax,4), %edx
	movl	%edx, 8(%rsi,%rax,4)
	movq	%rax, %rdx
	addq	$1, %rax
	cmpq	%r10, %rdx
	jne	.L20
	jmp	.L21
.L4:
	movl	28(%rsp), %ebx
	movl	%r13d, %esi
	movl	%ebx, %edi
	call	iMallocHandle@PLT
	movq	%rax, %r8
	testl	%ebx, %ebx
	jg	.L24
	jmp	.L1
.L5:
	movl	28(%rsp), %edi
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
	movl	%r13d, %esi
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
	jmp	iMallocHandle@PLT
	.cfi_endproc
.LFE39:
	.size	iiConv2, .-iiConv2
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
