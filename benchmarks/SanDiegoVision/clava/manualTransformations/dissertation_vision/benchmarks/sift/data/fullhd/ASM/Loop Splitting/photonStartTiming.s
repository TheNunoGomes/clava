	.file	"photonStartTiming.c"
	.text
	.p2align 4
	.globl	photonStartTiming
	.type	photonStartTiming, @function
photonStartTiming:
.LFB50:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$8, %edi
	call	malloc@PLT
	movq	%rax, %r8
#APP
# 19 "/home/osboxes/Documents/dissertation_vision/common/c/photonStartTiming.c" 1
	rdtsc
# 0 "" 2
#NO_APP
	movl	%eax, (%r8)
	movq	%r8, %rax
	movl	%edx, 4(%r8)
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE50:
	.size	photonStartTiming, .-photonStartTiming
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
