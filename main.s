	.file	"main.c"
	.text
	.globl	string_length
	.type	string_length, @function
string_length:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L2
	movl	$0, %eax
	jmp	.L3
.L2:
	addq	$1, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	string_length
	addl	$1, %eax
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	string_length, .-string_length
	.globl	set_mode
	.type	set_mode, @function
set_mode:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jne	.L5
	leaq	old.3612(%rip), %rdx
	movl	$0, %esi
	movl	$0, %edi
	call	tcsetattr@PLT
	jmp	.L4
.L5:
	leaq	old.3612(%rip), %rsi
	movl	$0, %edi
	call	tcgetattr@PLT
	movq	old.3612(%rip), %rax
	movq	8+old.3612(%rip), %rdx
	movq	%rax, new.3613(%rip)
	movq	%rdx, 8+new.3613(%rip)
	movq	16+old.3612(%rip), %rax
	movq	24+old.3612(%rip), %rdx
	movq	%rax, 16+new.3613(%rip)
	movq	%rdx, 24+new.3613(%rip)
	movq	32+old.3612(%rip), %rax
	movq	40+old.3612(%rip), %rdx
	movq	%rax, 32+new.3613(%rip)
	movq	%rdx, 40+new.3613(%rip)
	movq	48+old.3612(%rip), %rax
	movq	%rax, 48+new.3613(%rip)
	movl	56+old.3612(%rip), %eax
	movl	%eax, 56+new.3613(%rip)
	movl	12+new.3613(%rip), %eax
	andl	$-11, %eax
	movl	%eax, 12+new.3613(%rip)
	leaq	new.3613(%rip), %rdx
	movl	$0, %esi
	movl	$0, %edi
	call	tcsetattr@PLT
.L4:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	set_mode, .-set_mode
	.globl	get_key
	.type	get_key, @function
get_key:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$176, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -172(%rbp)
	movq	$0, -160(%rbp)
	movq	-160(%rbp), %rax
	movq	%rax, -152(%rbp)
	movl	$0, %eax
	movl	$16, %ecx
	leaq	-144(%rbp), %rdx
	movq	%rdx, %rdi
#APP
# 41 "main.c" 1
	cld; rep; stosq
# 0 "" 2
#NO_APP
	movl	%edi, %eax
	movl	%ecx, %edx
	movl	%edx, -168(%rbp)
	movl	%eax, -164(%rbp)
	movq	-144(%rbp), %rax
	orq	$1, %rax
	movq	%rax, -144(%rbp)
	leaq	-160(%rbp), %rdx
	leaq	-144(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$1, %edi
	call	select@PLT
	movq	-144(%rbp), %rax
	andl	$1, %eax
	testq	%rax, %rax
	je	.L8
	call	getchar@PLT
	movl	%eax, -172(%rbp)
	movl	$0, %edi
	call	set_mode
.L8:
	movl	-172(%rbp), %eax
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	get_key, .-get_key
	.section	.rodata
.LC0:
	.string	"clear"
.LC1:
	.string	"Text to type: %s\n"
	.text
	.globl	printTextToType
	.type	printTextToType, @function
printTextToType:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	leaq	.LC0(%rip), %rdi
	call	system@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	stdout(%rip), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	setbuf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	printTextToType, .-printTextToType
	.section	.rodata
.LC2:
	.string	"[ "
.LC3:
	.string	"%c "
.LC4:
	.string	"]"
	.text
	.globl	printCharArr
	.type	printCharArr, @function
printCharArr:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -4(%rbp)
	jmp	.L13
.L14:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
.L13:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	string_length
	cmpl	%eax, -4(%rbp)
	jl	.L14
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	printCharArr, .-printCharArr
	.section	.rodata
.LC5:
	.string	"Incorrect: %c, %c"
	.text
	.globl	cmpCharArrs
	.type	cmpCharArrs, @function
cmpCharArrs:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	string_length
	movl	%eax, -8(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	string_length
	movl	%eax, -4(%rbp)
	movl	-8(%rbp), %eax
	addl	$1, %eax
	cmpl	%eax, -4(%rbp)
	je	.L16
	movl	$0, %eax
	jmp	.L17
.L16:
	movl	$0, -12(%rbp)
	jmp	.L18
.L20:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %edx
	movl	-12(%rbp), %eax
	movslq	%eax, %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	je	.L19
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	movl	-12(%rbp), %eax
	movslq	%eax, %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	jmp	.L17
.L19:
	addl	$1, -12(%rbp)
.L18:
	movl	-12(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jl	.L20
	movl	$1, %eax
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	cmpCharArrs, .-cmpCharArrs
	.section	.rodata
.LC6:
	.string	"\033[32m%c\033[0m"
.LC7:
	.string	"\033[31m%c\033[0m"
	.text
	.globl	printCharsWithErrors
	.type	printCharsWithErrors, @function
printCharsWithErrors:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L22
.L25:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %edx
	movl	-4(%rbp), %eax
	movslq	%eax, %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	jne	.L23
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L24
.L23:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L24:
	addl	$1, -4(%rbp)
.L22:
	movl	-4(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L25
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	printCharsWithErrors, .-printCharsWithErrors
	.section	.rodata
	.align 8
.LC8:
	.string	"Thank you for playing the game.. See you soon!"
	.text
	.globl	getYesOrNo
	.type	getYesOrNo, @function
getYesOrNo:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	call	getchar@PLT
	movb	%al, -1(%rbp)
	cmpb	$10, -1(%rbp)
	jne	.L27
	movl	$1, %eax
	jmp	.L29
.L27:
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	movl	$0, %edi
	call	exit@PLT
.L29:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	getYesOrNo, .-getYesOrNo
	.section	.rodata
.LC9:
	.string	"\033[31m\nTypos: \033[0m"
.LC10:
	.string	"\033[33m%d\n\033[0m"
	.align 8
.LC11:
	.string	"It took \033[32m%ld\033[0m seconds for you to type the text.\n"
	.align 8
.LC12:
	.string	"You typed the text in \033[32m%d\033[0m CPM (Characters Per Minute)\n"
	.align 8
.LC13:
	.string	"\033[33m[*] Congragulations! You successfully typed the desired text.\n\033[0m"
	.align 8
.LC14:
	.string	"You were not able to type the desired text, would you like to try again? Press ENTER to continue, or type anything else to quit: "
	.text
	.globl	getInp
	.type	getInp, @function
getInp:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$336, %rsp
	movq	%rdi, -328(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -316(%rbp)
	movq	-328(%rbp), %rax
	movq	%rax, %rdi
	call	printTextToType
	movq	stdout(%rip), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	setbuf@PLT
	movl	$0, %edi
	call	time@PLT
	movq	%rax, -296(%rbp)
	movl	$0, -312(%rbp)
	movl	$0, -312(%rbp)
	jmp	.L31
.L40:
	movl	$1, %edi
	call	set_mode
	jmp	.L32
.L33:
	movl	$10000, %edi
	call	usleep@PLT
.L32:
	movl	$0, %eax
	call	get_key
	movl	%eax, -308(%rbp)
	cmpl	$0, -308(%rbp)
	je	.L33
	cmpl	$10, -308(%rbp)
	je	.L45
	cmpl	$127, -308(%rbp)
	jne	.L36
	cmpl	$0, -312(%rbp)
	jle	.L36
	movq	-328(%rbp), %rax
	movq	%rax, %rdi
	call	printTextToType
	movl	-312(%rbp), %eax
	subl	$1, %eax
	cltq
	movb	$0, -272(%rbp,%rax)
	subl	$2, -312(%rbp)
	movl	-312(%rbp), %eax
	leal	1(%rax), %edx
	movq	-328(%rbp), %rcx
	leaq	-272(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	printCharsWithErrors
	jmp	.L37
.L36:
	movl	-308(%rbp), %eax
	movl	%eax, %ecx
	movl	-312(%rbp), %eax
	movslq	%eax, %rdx
	movq	-328(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	%al, %cl
	jne	.L38
	movl	-308(%rbp), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L39
.L38:
	movl	-308(%rbp), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -316(%rbp)
.L39:
	movl	-308(%rbp), %eax
	movl	%eax, %edx
	movl	-312(%rbp), %eax
	cltq
	movb	%dl, -272(%rbp,%rax)
.L37:
	addl	$1, -312(%rbp)
.L31:
	cmpl	$254, -312(%rbp)
	jle	.L40
	jmp	.L35
.L45:
	nop
.L35:
	movl	$0, %edi
	call	time@PLT
	movq	%rax, -288(%rbp)
	movq	-288(%rbp), %rax
	subq	-296(%rbp), %rax
	movq	%rax, -280(%rbp)
	movl	-312(%rbp), %eax
	cltq
	movb	$0, -272(%rbp,%rax)
	cmpl	$0, -312(%rbp)
	jne	.L41
	movq	-328(%rbp), %rax
	movq	%rax, %rdi
	call	getInp
	movl	$0, %edi
	call	exit@PLT
.L41:
	leaq	.LC9(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-316(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC10(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-328(%rbp), %rdx
	leaq	-272(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	cmpCharArrs
	movl	%eax, -304(%rbp)
	cmpl	$1, -304(%rbp)
	jne	.L42
	movq	-280(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC11(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-272(%rbp), %rax
	movq	%rax, %rdi
	call	string_length
	cltq
	cqto
	idivq	-280(%rbp)
	imull	$60, %eax, %eax
	movl	%eax, %esi
	leaq	.LC12(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC13(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L46
.L42:
	leaq	.LC14(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	call	getYesOrNo
	movl	%eax, -300(%rbp)
	movq	-328(%rbp), %rax
	movq	%rax, %rdi
	call	getInp
.L46:
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L44
	call	__stack_chk_fail@PLT
.L44:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	getInp, .-getInp
	.section	.rodata
.LC15:
	.string	"r"
	.align 8
.LC16:
	.string	"Could not open text file %s...\n"
	.align 8
.LC17:
	.string	"File %s was empty, please fill it with text to use the program...\n"
.LC18:
	.string	"Text length: %d\n"
.LC19:
	.string	"Text: %s\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$320, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movabsq	$8679613454991126391, %rax
	movq	%rax, -282(%rbp)
	movw	$116, -274(%rbp)
	leaq	-282(%rbp), %rax
	leaq	.LC15(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -296(%rbp)
	cmpq	$0, -296(%rbp)
	jne	.L48
	leaq	-282(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC16(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %edi
	call	exit@PLT
.L48:
	movl	$0, -304(%rbp)
	movq	-296(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc@PLT
	movb	%al, -305(%rbp)
	jmp	.L49
.L50:
	movl	-304(%rbp), %eax
	cltq
	movzbl	-305(%rbp), %edx
	movb	%dl, -272(%rbp,%rax)
	movq	-296(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc@PLT
	movb	%al, -305(%rbp)
	addl	$1, -304(%rbp)
.L49:
	cmpb	$-1, -305(%rbp)
	jne	.L50
	movl	-304(%rbp), %eax
	cltq
	movb	$0, -272(%rbp,%rax)
	leaq	-272(%rbp), %rax
	movq	%rax, %rdi
	call	string_length
	movl	%eax, -300(%rbp)
	cmpl	$0, -300(%rbp)
	jne	.L51
	leaq	-282(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC17(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %edi
	call	exit@PLT
.L51:
	movl	-300(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC18(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-296(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	leaq	-272(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC19(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %edi
	call	sleep@PLT
	leaq	-272(%rbp), %rax
	movq	%rax, %rdi
	call	getInp
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L53
	call	__stack_chk_fail@PLT
.L53:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	main, .-main
	.local	old.3612
	.comm	old.3612,60,32
	.local	new.3613
	.comm	new.3613,60,32
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
