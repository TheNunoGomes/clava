	.file	"siftlocalmax.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"/home/osboxes/Documents/dissertation_vision/benchmarks/sift/src/c/siftlocalmax.c"
	.align 8
.LC1:
	.string	"ptoffset < pt->width*pt->height"
	.text
	.p2align 4
	.globl	siftlocalmax
	.type	siftlocalmax, @function
siftlocalmax:
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
	movl	%edx, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	imull	%ecx, %r13d
	movl	%edx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%r12d, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	notl	%ebp
	subl	%r13d, %ebp
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	movq	%rdi, 8(%rsp)
	movl	$1, %edi
	movl	%esi, 4(%rsp)
	movl	%r13d, %esi
	movss	%xmm0, 20(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movl	%ecx, 16(%rsp)
	call	iMallocHandle@PLT
	movl	$26, %esi
	movl	$1, %edi
	movq	$-1, 76(%rsp)
	leaq	8(%rax), %rbx
	movq	%rax, %r14
	movslq	%r13d, %rax
	movl	$-1, 84(%rsp)
	salq	$2, %rax
	movq	%rax, 32(%rsp)
	addq	%rbx, %rax
	movq	%rax, 24(%rsp)
	call	iMallocHandle@PLT
	movl	80(%rsp), %esi
	movl	84(%rsp), %edi
	movl	%r12d, %r11d
	leal	0(,%r12,4), %ecx
	movq	%rax, %r15
	movq	8(%rsp), %r9
	movl	76(%rsp), %eax
	movl	16(%rsp), %r8d
	subl	%ecx, %r11d
	addl	$1, %esi
	xorl	%ecx, %ecx
	addl	$1, %edi
.L2:
	testl	%ebp, %ebp
	je	.L3
	movslq	%ecx, %rdx
	addl	$1, %ecx
	movl	%ebp, 8(%r15,%rdx,4)
.L3:
	addl	$1, %eax
	cmpl	$1, %eax
	jle	.L4
	leal	-2(%rbp,%r12), %ebp
	cmpl	$1, %esi
	jle	.L25
	cmpl	$1, %edi
	jle	.L44
	cmpl	$2, %r8d
	movl	$1, 84(%rsp)
	leal	1(%r13,%r12), %ecx
	movabsq	$4294967297, %rax
	setle	%sil
	cmpl	$3, 4(%rsp)
	movq	%rax, 76(%rsp)
	setle	%al
	orb	%al, %sil
	jne	.L7
	cmpl	$2, %r12d
	jle	.L7
	movslq	%ecx, %rcx
	movl	%r13d, %r11d
	leal	-1(%r12), %edx
	xorl	%ebp, %ebp
.L8:
	movl	(%r9), %eax
	imull	4(%r9), %eax
	movl	%ecx, %r10d
	movl	%ecx, %r12d
	movss	8(%r9,%rcx,4), %xmm0
	cmpl	%ecx, %eax
	jle	.L12
	comiss	20(%rsp), %xmm0
	movl	$1, %eax
	jb	.L45
	.p2align 4,,10
	.p2align 3
.L13:
	movl	4(%r15,%rax,4), %esi
	addl	%r12d, %esi
	movslq	%esi, %rsi
	comiss	8(%r9,%rsi,4), %xmm0
	seta	%sil
	cmpl	$25, %eax
	setle	%dil
	addq	$1, %rax
	testb	%sil, %dil
	jne	.L13
	movzbl	%sil, %r12d
.L15:
	addl	$1, %r10d
	testl	%r12d, %r12d
	je	.L16
	movslq	%ebp, %rax
	leaq	(%rbx,%rax,4), %rax
	cmpq	24(%rsp), %rax
	je	.L17
	addl	$1, %ebp
.L18:
	movl	%r10d, (%rax)
.L16:
	movl	76(%rsp), %eax
	addl	$1, %eax
	cmpl	%edx, %eax
	jl	.L46
	movl	80(%rsp), %eax
	leal	-1(%r8), %esi
	movl	$1, 76(%rsp)
	addl	$1, %eax
	cmpl	%esi, %eax
	jl	.L47
	movl	84(%rsp), %eax
	movl	4(%rsp), %edi
	movl	$1, 80(%rsp)
	addl	$1, %eax
	leal	-2(%rdi), %esi
	movl	%eax, 84(%rsp)
	cmpl	%eax, %esi
	jg	.L11
.L10:
	endbr64
	movl	%ebp, %esi
	movl	$1, %edi
	call	fMallocHandle@PLT
	movq	%rax, %r12
	testl	%ebp, %ebp
	je	.L20
	leal	-1(%rbp), %eax
	cmpl	$2, %eax
	jbe	.L27
	movl	%ebp, %eax
	xorl	%edx, %edx
	shrl	$2, %eax
	salq	$4, %rax
	.p2align 4,,10
	.p2align 3
.L22:
	movdqu	(%rbx,%rdx), %xmm1
	cvtdq2ps	%xmm1, %xmm0
	movups	%xmm0, 8(%r12,%rdx)
	addq	$16, %rdx
	cmpq	%rax, %rdx
	jne	.L22
	movl	%ebp, %eax
	andl	$-4, %eax
	testb	$3, %bpl
	je	.L20
.L21:
	movslq	%eax, %rdx
	pxor	%xmm0, %xmm0
	cvtsi2ssl	(%rbx,%rdx,4), %xmm0
	movss	%xmm0, 8(%r12,%rdx,4)
	leal	1(%rax), %edx
	cmpl	%edx, %ebp
	jle	.L20
	movslq	%edx, %rdx
	pxor	%xmm0, %xmm0
	addl	$2, %eax
	cvtsi2ssl	(%rbx,%rdx,4), %xmm0
	movss	%xmm0, 8(%r12,%rdx,4)
	cmpl	%eax, %ebp
	jle	.L20
	cltq
	pxor	%xmm0, %xmm0
	cvtsi2ssl	(%rbx,%rax,4), %xmm0
	movss	%xmm0, 8(%r12,%rax,4)
.L20:
	movq	%r15, %rdi
	call	free@PLT
	movq	%r14, %rdi
	call	free@PLT
	movq	88(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L48
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r12, %rax
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
.L7:
	.cfi_restore_state
	xorl	%esi, %esi
	movl	$1, %edi
	call	fMallocHandle@PLT
	movq	%rax, %r12
	jmp	.L20
.L47:
	movl	%eax, 80(%rsp)
.L11:
	addq	$1, %rcx
	jmp	.L8
.L27:
	xorl	%eax, %eax
	jmp	.L21
.L4:
	addl	$1, %ebp
	jmp	.L2
.L25:
	movl	$-1, %eax
	addl	$1, %esi
	jmp	.L2
.L44:
	addl	%r11d, %ebp
	movl	$-1, %eax
	xorl	%esi, %esi
	addl	$1, %edi
	addl	%r13d, %ebp
	jmp	.L2
.L45:
	setnb	%r12b
	movzbl	%r12b, %r12d
	jmp	.L15
.L17:
	addl	%r13d, %r11d
	movq	%r14, %rdi
	movl	%edx, 60(%rsp)
	movl	%r12d, %ebp
	movl	%r8d, 56(%rsp)
	movq	%r9, 48(%rsp)
	movq	%rcx, 40(%rsp)
	movl	%r10d, 8(%rsp)
	movl	%r11d, 16(%rsp)
	call	free@PLT
	movl	16(%rsp), %r11d
	movl	$1, %edi
	movl	%r11d, %esi
	call	iMallocHandle@PLT
	movl	60(%rsp), %edx
	movl	56(%rsp), %r8d
	movq	%rax, %r14
	movslq	16(%rsp), %rax
	movq	48(%rsp), %r9
	movq	40(%rsp), %rcx
	movl	8(%rsp), %r10d
	movq	%rax, %r11
	leaq	8(%r14,%rax,4), %rax
	movq	%rax, 24(%rsp)
	subq	32(%rsp), %rax
	movq	%rax, %rbx
	jmp	.L18
.L46:
	movl	%eax, 76(%rsp)
	jmp	.L11
.L12:
	leaq	__PRETTY_FUNCTION__.4500(%rip), %rcx
	movl	$174, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	call	__assert_fail@PLT
.L48:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE39:
	.size	siftlocalmax, .-siftlocalmax
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.4500, @object
	.size	__PRETTY_FUNCTION__.4500, 13
__PRETTY_FUNCTION__.4500:
	.string	"siftlocalmax"
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
