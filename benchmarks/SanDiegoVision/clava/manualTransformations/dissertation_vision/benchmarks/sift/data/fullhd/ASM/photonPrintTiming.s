	.file	"photonPrintTiming.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Cycles elapsed\t\t- %u\n\n"
.LC1:
	.string	"Cycles elapsed\t\t- %u%u\n\n"
	.text
	.p2align 4
	.globl	photonPrintTiming
	.type	photonPrintTiming, @function
photonPrintTiming:
.LFB50:
	.cfi_startproc
	endbr64
	movl	4(%rdi), %edx
	movl	(%rdi), %ecx
	testl	%edx, %edx
	jne	.L2
	movl	%ecx, %edx
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	jmp	__printf_chk@PLT
	.p2align 4,,10
	.p2align 3
.L2:
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	jmp	__printf_chk@PLT
	.cfi_endproc
.LFE50:
	.size	photonPrintTiming, .-photonPrintTiming
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
