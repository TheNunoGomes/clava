	.file	"photonReportTiming.c"
	.text
	.p2align 4
	.globl	photonReportTiming
	.type	photonReportTiming, @function
photonReportTiming:
.LFB50:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	movl	$8, %edi
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	malloc@PLT
	movl	0(%rbp), %edx
	movl	4(%rbp), %ecx
	movl	4(%rbx), %esi
	salq	$32, %rdx
	orq	%rcx, %rdx
	movl	(%rbx), %ecx
	salq	$32, %rcx
	orq	%rsi, %rcx
	subq	%rcx, %rdx
	movq	%rdx, %rcx
	movl	%edx, 4(%rax)
	shrq	$32, %rcx
	movl	%ecx, (%rax)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE50:
	.size	photonReportTiming, .-photonReportTiming
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
