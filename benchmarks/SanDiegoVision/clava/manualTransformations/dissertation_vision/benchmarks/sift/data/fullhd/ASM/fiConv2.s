	.file	"fiConv2.c"
	.text
	.p2align 4
	.globl	fiConv2
	.type	fiConv2, @function
fiConv2:
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
	movl	4(%rsi), %ebp
	movl	4(%rdi), %ebx
	movsd	.LC0(%rip), %xmm4
	movsd	.LC1(%rip), %xmm7
	movq	%rsi, (%rsp)
	cvtsi2sdl	%ebp, %xmm2
	movq	.LC3(%rip), %xmm1
	movl	(%rdi), %r12d
	movl	%ebx, 16(%rsp)
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
	movl	16(%rsp), %r15d
	leal	-1(%r12,%rbx), %edi
	pxor	%xmm0, %xmm0
	movl	%edi, 12(%rsp)
	movl	%edi, %esi
	movl	%eax, 24(%rsp)
	leal	-1(%r15,%rbp), %eax
	movl	%eax, %edi
	movl	%eax, 20(%rsp)
	call	fSetArray@PLT
	movl	20(%rsp), %edx
	movq	%rax, %r14
	testl	%edx, %edx
	jle	.L4
	movl	12(%rsp), %eax
	testl	%eax, %eax
	jle	.L4
	testl	%r15d, %r15d
	jle	.L5
	negl	%r15d
	xorl	%r10d, %r10d
.L6:
	movl	%r12d, %r9d
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
	testl	%r12d, %r12d
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
	pxor	%xmm0, %xmm0
	imull	%r10d, %edx
	addl	%edi, %edx
	movslq	%edx, %rdx
	leaq	(%r14,%rdx,4), %rcx
	movl	0(%r13), %edx
	imull	%r11d, %edx
	addl	%edx, %r8d
	movslq	%r8d, %r8
	cvtsi2ssl	8(%r13,%r8,4), %xmm0
	movq	(%rsp), %r8
	movl	(%r8), %edx
	imull	%esi, %edx
	addl	%eax, %edx
	subl	$1, %eax
	movslq	%edx, %rdx
	mulss	8(%r8,%rdx,4), %xmm0
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
	addl	$1, %edi
	addl	$1, %r9d
	cmpl	12(%rsp), %edi
	jne	.L15
	addl	$1, %r10d
	leal	1(%rsi), %r15d
	cmpl	20(%rsp), %r10d
	jne	.L6
	movl	16(%rsp), %edi
	movl	%r12d, %esi
	call	fMallocHandle@PLT
	movq	%rax, %r8
.L24:
	testl	%r12d, %r12d
	jle	.L1
	movl	(%r14), %eax
	leal	-1(%r12), %r10d
	movl	%r12d, %edi
	movl	%r12d, %ecx
	cmpl	$3, %r10d
	movl	%eax, (%rsp)
	movl	(%r8), %eax
	seta	%dl
	cmpq	%r8, %r14
	movl	%eax, 20(%rsp)
	setne	%al
	andl	$-4, %edi
	shrl	$2, %ecx
	andl	%eax, %edx
	movslq	24(%rsp), %rax
	salq	$4, %rcx
	leal	1(%rdi), %ebp
	movb	%dl, 35(%rsp)
	xorl	%r11d, %r11d
	leal	1(%rax,%rdi), %esi
	leal	-1(%rax,%rdi), %ebx
	movl	%esi, 24(%rsp)
	movl	28(%rsp), %esi
	leal	(%rax,%rdi), %r15d
	movl	%ebx, 12(%rsp)
	leal	2(%rdi), %ebx
	subl	$1, %esi
	movl	%esi, 28(%rsp)
	leal	-1(%rax), %esi
	addq	$1, %rax
	movl	%esi, 36(%rsp)
	movq	%rax, 40(%rsp)
.L17:
	movl	28(%rsp), %eax
	movl	20(%rsp), %esi
	imull	%r11d, %esi
	leal	(%rax,%r11), %edx
	imull	(%rsp), %edx
	cmpb	$0, 35(%rsp)
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
	cmpl	%r12d, %edi
	je	.L21
	movl	12(%rsp), %eax
	addl	%edx, %eax
	cltq
	movss	8(%r14,%rax,4), %xmm0
	leal	(%rsi,%rdi), %eax
	cltq
	movss	%xmm0, 8(%r8,%rax,4)
	cmpl	%ebp, %r12d
	jle	.L21
	leal	(%rdx,%r15), %eax
	cltq
	movss	8(%r14,%rax,4), %xmm0
	leal	(%rsi,%rbp), %eax
	cltq
	movss	%xmm0, 8(%r8,%rax,4)
	cmpl	%ebx, %r12d
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
	cmpl	%r11d, 16(%rsp)
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
	movss	8(%r9,%rax,4), %xmm0
	movq	%rax, %rdx
	movss	%xmm0, 8(%rsi,%rax,4)
	addq	$1, %rax
	cmpq	%r10, %rdx
	jne	.L20
	jmp	.L21
.L4:
	movl	16(%rsp), %ebx
	movl	%r12d, %esi
	movl	%ebx, %edi
	call	fMallocHandle@PLT
	movq	%rax, %r8
	testl	%ebx, %ebx
	jg	.L24
	jmp	.L1
.L5:
	movl	16(%rsp), %edi
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
	movl	%r12d, %esi
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
	.size	fiConv2, .-fiConv2
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
