	.file	"SDLMain.c"
	.text
.Ltext0:
	.section	.rodata
	.align 8
.LC0:
	.string	"SDL could not be intitalized! SDL_Error: %s\n"
.LC1:
	.string	"Chip-8 Emulator"
	.text
	.globl	main
	.type	main, @function
main:
.LFB4047:
	.file 1 "/home/hunter/Chip-8_Emulator/src/SDLMain.c"
	.loc 1 19 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$144, %rsp
	movl	%edi, -132(%rbp)
	movq	%rsi, -144(%rbp)
	.loc 1 19 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 20 14
	movq	$0, -104(%rbp)
	.loc 1 21 15
	movq	$0, -96(%rbp)
	.loc 1 22 13
	movq	$0, -88(%rbp)
	.loc 1 24 5
	movl	$32, %edi
	call	SDL_Init@PLT
	.loc 1 24 4
	testl	%eax, %eax
	jns	.L2
	.loc 1 26 3
	call	SDL_GetError@PLT
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 27 10
	movl	$1, %eax
	jmp	.L3
.L2:
.LBB2:
	.loc 1 31 12
	movl	$4, %r9d
	movl	$320, %r8d
	movl	$640, %ecx
	movl	$536805376, %edx
	movl	$536805376, %esi
	leaq	.LC1(%rip), %rdi
	call	SDL_CreateWindow@PLT
	movq	%rax, -104(%rbp)
	.loc 1 32 28
	movq	-104(%rbp), %rax
	movl	$2, %edx
	movl	$-1, %esi
	movq	%rax, %rdi
	call	SDL_CreateRenderer@PLT
	movq	%rax, -80(%rbp)
	.loc 1 33 26
	movq	-80(%rbp), %rax
	movl	$32, %r8d
	movl	$64, %ecx
	movl	$1, %edx
	movl	$373694468, %esi
	movq	%rax, %rdi
	call	SDL_CreateTexture@PLT
	movq	%rax, -72(%rbp)
	.loc 1 35 7
	movl	$100, -124(%rbp)
	.loc 1 36 5
	cmpl	$0, -132(%rbp)
	jne	.L4
	.loc 1 38 12
	movq	$0, -112(%rbp)
	jmp	.L5
.L4:
	.loc 1 40 10
	cmpl	$1, -132(%rbp)
	jne	.L6
	.loc 1 42 12
	movq	-144(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -112(%rbp)
	jmp	.L5
.L6:
	.loc 1 44 10
	cmpl	$2, -132(%rbp)
	jne	.L5
	.loc 1 46 12
	movq	-144(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -112(%rbp)
	.loc 1 47 26
	movq	-144(%rbp), %rax
	addq	$8, %rax
	.loc 1 47 17
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -124(%rbp)
.L5:
	.loc 1 49 33
	movl	-124(%rbp), %eax
	.loc 1 49 14
	movzwl	%ax, %edx
	movq	-112(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	Chip8init@PLT
	movq	%rax, -88(%rbp)
	.loc 1 50 7
	movl	$0, -116(%rbp)
	.loc 1 52 7
	movl	$0, -120(%rbp)
	.loc 1 53 8
	jmp	.L7
.L10:
	.loc 1 57 9
	movl	-64(%rbp), %eax
	.loc 1 57 7
	cmpl	$256, %eax
	jne	.L8
	.loc 1 59 11
	movl	$1, -116(%rbp)
	.loc 1 60 6
	call	Chip8quit@PLT
	.loc 1 61 6
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	SDL_DestroyRenderer@PLT
	.loc 1 62 6
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	SDL_DestroyWindow@PLT
	.loc 1 63 6
	call	SDL_Quit@PLT
	.loc 1 64 13
	movl	$0, %eax
	jmp	.L3
.L8:
	.loc 1 55 10
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	SDL_PollEvent@PLT
	.loc 1 55 9
	testl	%eax, %eax
	jne	.L10
	.loc 1 68 23
	movl	-124(%rbp), %eax
	movl	%eax, %edi
	call	timer_clock_cycles
	.loc 1 68 6
	cmpl	%eax, -120(%rbp)
	jge	.L11
	.loc 1 70 18
	movq	-88(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 70 8
	movzbl	(%rax), %eax
	.loc 1 70 7
	testb	%al, %al
	je	.L12
	.loc 1 70 75 discriminator 1
	movq	-88(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 70 65 discriminator 1
	movzbl	(%rax), %edx
	.loc 1 70 48 discriminator 1
	movq	-88(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 70 90 discriminator 1
	subl	$1, %edx
	.loc 1 70 63 discriminator 1
	movb	%dl, (%rax)
.L12:
	.loc 1 72 18
	movq	-88(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 72 8
	movzbl	(%rax), %eax
	.loc 1 72 7
	testb	%al, %al
	je	.L13
	.loc 1 72 75 discriminator 1
	movq	-88(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 72 65 discriminator 1
	movzbl	(%rax), %edx
	.loc 1 72 48 discriminator 1
	movq	-88(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 72 90 discriminator 1
	subl	$1, %edx
	.loc 1 72 63 discriminator 1
	movb	%dl, (%rax)
.L13:
	.loc 1 74 21
	movl	-124(%rbp), %eax
	movl	%eax, %edi
	call	timer_clock_cycles
	movl	%eax, -120(%rbp)
	jmp	.L14
.L11:
	.loc 1 78 18
	addl	$1, -120(%rbp)
.L14:
	.loc 1 80 7
	call	Fetch_Instruction@PLT
	.loc 1 80 6
	testl	%eax, %eax
	je	.L15
	.loc 1 80 40 discriminator 1
	movl	$1, %eax
	jmp	.L3
.L15:
	.loc 1 82 44
	movq	-88(%rbp), %rax
	movq	(%rax), %rdx
	.loc 1 82 4
	movq	-72(%rbp), %rax
	movl	$256, %ecx
	movl	$0, %esi
	movq	%rax, %rdi
	call	SDL_UpdateTexture@PLT
	.loc 1 83 4
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	SDL_RenderClear@PLT
	.loc 1 84 4
	movq	-72(%rbp), %rsi
	movq	-80(%rbp), %rax
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SDL_RenderCopy@PLT
	.loc 1 85 4
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	SDL_RenderPresent@PLT
	.loc 1 86 4
	movl	-124(%rbp), %eax
	movl	%eax, %edi
	call	delay_ms
.L7:
	.loc 1 53 8
	cmpl	$0, -116(%rbp)
	je	.L8
.LBE2:
	.loc 1 90 9
	movl	$0, %eax
.L3:
	.loc 1 91 1
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4047:
	.size	main, .-main
	.globl	timer_clock_cycles
	.type	timer_clock_cycles, @function
timer_clock_cycles:
.LFB4048:
	.loc 1 95 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	.loc 1 96 20
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$-2004318071, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$5, %edx
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	.loc 1 97 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4048:
	.size	timer_clock_cycles, .-timer_clock_cycles
	.globl	delay_ms
	.type	delay_ms, @function
delay_ms:
.LFB4049:
	.loc 1 100 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	.loc 1 101 16
	movl	$1, %eax
	cltd
	idivl	-20(%rbp)
	.loc 1 101 30
	imull	$1000, %eax, %eax
	.loc 1 101 8
	cvtsi2ssl	%eax, %xmm0
	movss	%xmm0, -4(%rbp)
	.loc 1 102 12
	movss	-4(%rbp), %xmm0
	cvttss2sil	%xmm0, %eax
	.loc 1 102 2
	movl	%eax, %edi
	call	SDL_Delay@PLT
	.loc 1 103 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4049:
	.size	delay_ms, .-delay_ms
.Letext0:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 3 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 7 "/usr/include/stdio.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
	.file 9 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h"
	.file 10 "/usr/include/math.h"
	.file 11 "/usr/include/SDL2/SDL_stdinc.h"
	.file 12 "/usr/include/SDL2/SDL_pixels.h"
	.file 13 "/usr/include/SDL2/SDL_rect.h"
	.file 14 "/usr/include/SDL2/SDL_surface.h"
	.file 15 "/usr/include/SDL2/SDL_video.h"
	.file 16 "/usr/include/SDL2/SDL_scancode.h"
	.file 17 "/usr/include/SDL2/SDL_keycode.h"
	.file 18 "/usr/include/SDL2/SDL_keyboard.h"
	.file 19 "/usr/include/SDL2/SDL_joystick.h"
	.file 20 "/usr/include/SDL2/SDL_touch.h"
	.file 21 "/usr/include/SDL2/SDL_gesture.h"
	.file 22 "/usr/include/SDL2/SDL_events.h"
	.file 23 "/usr/include/SDL2/SDL_render.h"
	.file 24 "/usr/include/time.h"
	.file 25 "/home/hunter/Chip-8_Emulator/src/../include/Chip-8.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x2139
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF597
	.byte	0xc
	.long	.LASF598
	.long	.LASF599
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF1
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.long	.LASF5
	.byte	0x2
	.byte	0x26
	.byte	0x17
	.long	0x2d
	.uleb128 0x3
	.long	.LASF6
	.byte	0x2
	.byte	0x27
	.byte	0x1a
	.long	0x68
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x3
	.long	.LASF8
	.byte	0x2
	.byte	0x28
	.byte	0x1c
	.long	0x34
	.uleb128 0x3
	.long	.LASF9
	.byte	0x2
	.byte	0x29
	.byte	0x14
	.long	0x87
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	.LASF10
	.byte	0x2
	.byte	0x2a
	.byte	0x16
	.long	0x3b
	.uleb128 0x3
	.long	.LASF11
	.byte	0x2
	.byte	0x2c
	.byte	0x19
	.long	0xa6
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF12
	.uleb128 0x3
	.long	.LASF13
	.byte	0x2
	.byte	0x98
	.byte	0x19
	.long	0xa6
	.uleb128 0x3
	.long	.LASF14
	.byte	0x2
	.byte	0x99
	.byte	0x1b
	.long	0xa6
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0xcd
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF15
	.uleb128 0x7
	.long	0xcd
	.uleb128 0x3
	.long	.LASF16
	.byte	0x3
	.byte	0xd1
	.byte	0x17
	.long	0x42
	.uleb128 0x3
	.long	.LASF17
	.byte	0x4
	.byte	0x19
	.byte	0x13
	.long	0x5c
	.uleb128 0x3
	.long	.LASF18
	.byte	0x4
	.byte	0x1a
	.byte	0x13
	.long	0x7b
	.uleb128 0x3
	.long	.LASF19
	.byte	0x4
	.byte	0x1b
	.byte	0x13
	.long	0x9a
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF20
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF21
	.uleb128 0x8
	.long	0xcd
	.long	0x127
	.uleb128 0x9
	.long	0x42
	.byte	0x1f
	.byte	0
	.uleb128 0xa
	.long	.LASF116
	.byte	0xd8
	.byte	0x5
	.byte	0x31
	.byte	0x8
	.long	0x2ae
	.uleb128 0xb
	.long	.LASF22
	.byte	0x5
	.byte	0x33
	.byte	0x7
	.long	0x87
	.byte	0
	.uleb128 0xb
	.long	.LASF23
	.byte	0x5
	.byte	0x36
	.byte	0x9
	.long	0xc7
	.byte	0x8
	.uleb128 0xb
	.long	.LASF24
	.byte	0x5
	.byte	0x37
	.byte	0x9
	.long	0xc7
	.byte	0x10
	.uleb128 0xb
	.long	.LASF25
	.byte	0x5
	.byte	0x38
	.byte	0x9
	.long	0xc7
	.byte	0x18
	.uleb128 0xb
	.long	.LASF26
	.byte	0x5
	.byte	0x39
	.byte	0x9
	.long	0xc7
	.byte	0x20
	.uleb128 0xb
	.long	.LASF27
	.byte	0x5
	.byte	0x3a
	.byte	0x9
	.long	0xc7
	.byte	0x28
	.uleb128 0xb
	.long	.LASF28
	.byte	0x5
	.byte	0x3b
	.byte	0x9
	.long	0xc7
	.byte	0x30
	.uleb128 0xb
	.long	.LASF29
	.byte	0x5
	.byte	0x3c
	.byte	0x9
	.long	0xc7
	.byte	0x38
	.uleb128 0xb
	.long	.LASF30
	.byte	0x5
	.byte	0x3d
	.byte	0x9
	.long	0xc7
	.byte	0x40
	.uleb128 0xb
	.long	.LASF31
	.byte	0x5
	.byte	0x40
	.byte	0x9
	.long	0xc7
	.byte	0x48
	.uleb128 0xb
	.long	.LASF32
	.byte	0x5
	.byte	0x41
	.byte	0x9
	.long	0xc7
	.byte	0x50
	.uleb128 0xb
	.long	.LASF33
	.byte	0x5
	.byte	0x42
	.byte	0x9
	.long	0xc7
	.byte	0x58
	.uleb128 0xb
	.long	.LASF34
	.byte	0x5
	.byte	0x44
	.byte	0x16
	.long	0x2c7
	.byte	0x60
	.uleb128 0xb
	.long	.LASF35
	.byte	0x5
	.byte	0x46
	.byte	0x14
	.long	0x2cd
	.byte	0x68
	.uleb128 0xb
	.long	.LASF36
	.byte	0x5
	.byte	0x48
	.byte	0x7
	.long	0x87
	.byte	0x70
	.uleb128 0xb
	.long	.LASF37
	.byte	0x5
	.byte	0x49
	.byte	0x7
	.long	0x87
	.byte	0x74
	.uleb128 0xb
	.long	.LASF38
	.byte	0x5
	.byte	0x4a
	.byte	0xb
	.long	0xad
	.byte	0x78
	.uleb128 0xb
	.long	.LASF39
	.byte	0x5
	.byte	0x4d
	.byte	0x12
	.long	0x34
	.byte	0x80
	.uleb128 0xb
	.long	.LASF40
	.byte	0x5
	.byte	0x4e
	.byte	0xf
	.long	0x49
	.byte	0x82
	.uleb128 0xb
	.long	.LASF41
	.byte	0x5
	.byte	0x4f
	.byte	0x8
	.long	0x2d3
	.byte	0x83
	.uleb128 0xb
	.long	.LASF42
	.byte	0x5
	.byte	0x51
	.byte	0xf
	.long	0x2e3
	.byte	0x88
	.uleb128 0xb
	.long	.LASF43
	.byte	0x5
	.byte	0x59
	.byte	0xd
	.long	0xb9
	.byte	0x90
	.uleb128 0xb
	.long	.LASF44
	.byte	0x5
	.byte	0x5b
	.byte	0x17
	.long	0x2ee
	.byte	0x98
	.uleb128 0xb
	.long	.LASF45
	.byte	0x5
	.byte	0x5c
	.byte	0x19
	.long	0x2f9
	.byte	0xa0
	.uleb128 0xb
	.long	.LASF46
	.byte	0x5
	.byte	0x5d
	.byte	0x14
	.long	0x2cd
	.byte	0xa8
	.uleb128 0xb
	.long	.LASF47
	.byte	0x5
	.byte	0x5e
	.byte	0x9
	.long	0xc5
	.byte	0xb0
	.uleb128 0xb
	.long	.LASF48
	.byte	0x5
	.byte	0x5f
	.byte	0xa
	.long	0xd9
	.byte	0xb8
	.uleb128 0xb
	.long	.LASF49
	.byte	0x5
	.byte	0x60
	.byte	0x7
	.long	0x87
	.byte	0xc0
	.uleb128 0xb
	.long	.LASF50
	.byte	0x5
	.byte	0x62
	.byte	0x8
	.long	0x2ff
	.byte	0xc4
	.byte	0
	.uleb128 0x3
	.long	.LASF51
	.byte	0x6
	.byte	0x7
	.byte	0x19
	.long	0x127
	.uleb128 0xc
	.long	.LASF600
	.byte	0x5
	.byte	0x2b
	.byte	0xe
	.uleb128 0xd
	.long	.LASF52
	.uleb128 0x6
	.byte	0x8
	.long	0x2c2
	.uleb128 0x6
	.byte	0x8
	.long	0x127
	.uleb128 0x8
	.long	0xcd
	.long	0x2e3
	.uleb128 0x9
	.long	0x42
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x2ba
	.uleb128 0xd
	.long	.LASF53
	.uleb128 0x6
	.byte	0x8
	.long	0x2e9
	.uleb128 0xd
	.long	.LASF54
	.uleb128 0x6
	.byte	0x8
	.long	0x2f4
	.uleb128 0x8
	.long	0xcd
	.long	0x30f
	.uleb128 0x9
	.long	0x42
	.byte	0x13
	.byte	0
	.uleb128 0xe
	.long	.LASF55
	.byte	0x7
	.byte	0x89
	.byte	0xe
	.long	0x31b
	.uleb128 0x6
	.byte	0x8
	.long	0x2ae
	.uleb128 0xe
	.long	.LASF56
	.byte	0x7
	.byte	0x8a
	.byte	0xe
	.long	0x31b
	.uleb128 0xe
	.long	.LASF57
	.byte	0x7
	.byte	0x8b
	.byte	0xe
	.long	0x31b
	.uleb128 0xe
	.long	.LASF58
	.byte	0x8
	.byte	0x1a
	.byte	0xc
	.long	0x87
	.uleb128 0x8
	.long	0x35b
	.long	0x350
	.uleb128 0xf
	.byte	0
	.uleb128 0x7
	.long	0x345
	.uleb128 0x6
	.byte	0x8
	.long	0xd4
	.uleb128 0x7
	.long	0x355
	.uleb128 0xe
	.long	.LASF59
	.byte	0x8
	.byte	0x1b
	.byte	0x1a
	.long	0x350
	.uleb128 0x2
	.byte	0x10
	.byte	0x4
	.long	.LASF60
	.uleb128 0x3
	.long	.LASF61
	.byte	0x9
	.byte	0x18
	.byte	0x13
	.long	0x50
	.uleb128 0x3
	.long	.LASF62
	.byte	0x9
	.byte	0x19
	.byte	0x14
	.long	0x6f
	.uleb128 0x3
	.long	.LASF63
	.byte	0x9
	.byte	0x1a
	.byte	0x14
	.long	0x8e
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF64
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF65
	.uleb128 0x10
	.long	.LASF66
	.byte	0xa
	.value	0x305
	.byte	0xc
	.long	0x87
	.uleb128 0x3
	.long	.LASF67
	.byte	0xb
	.byte	0xb3
	.byte	0x11
	.long	0x373
	.uleb128 0x3
	.long	.LASF68
	.byte	0xb
	.byte	0xb9
	.byte	0x11
	.long	0xe5
	.uleb128 0x3
	.long	.LASF69
	.byte	0xb
	.byte	0xbf
	.byte	0x12
	.long	0x37f
	.uleb128 0x3
	.long	.LASF70
	.byte	0xb
	.byte	0xc5
	.byte	0x11
	.long	0xf1
	.uleb128 0x3
	.long	.LASF71
	.byte	0xb
	.byte	0xcb
	.byte	0x12
	.long	0x38b
	.uleb128 0x3
	.long	.LASF72
	.byte	0xb
	.byte	0xd2
	.byte	0x11
	.long	0xfd
	.uleb128 0x6
	.byte	0x8
	.long	0xc7
	.uleb128 0x11
	.byte	0x7
	.byte	0x4
	.long	0x3b
	.byte	0xc
	.byte	0xac
	.byte	0x1
	.long	0x58f
	.uleb128 0x12
	.long	.LASF73
	.byte	0
	.uleb128 0x13
	.long	.LASF74
	.long	0x11100100
	.uleb128 0x13
	.long	.LASF75
	.long	0x11200100
	.uleb128 0x13
	.long	.LASF76
	.long	0x12100400
	.uleb128 0x13
	.long	.LASF77
	.long	0x12200400
	.uleb128 0x13
	.long	.LASF78
	.long	0x13000801
	.uleb128 0x13
	.long	.LASF79
	.long	0x14110801
	.uleb128 0x13
	.long	.LASF80
	.long	0x15120c02
	.uleb128 0x13
	.long	.LASF81
	.long	0x15130f02
	.uleb128 0x13
	.long	.LASF82
	.long	0x15530f02
	.uleb128 0x13
	.long	.LASF83
	.long	0x15321002
	.uleb128 0x13
	.long	.LASF84
	.long	0x15421002
	.uleb128 0x13
	.long	.LASF85
	.long	0x15721002
	.uleb128 0x13
	.long	.LASF86
	.long	0x15821002
	.uleb128 0x13
	.long	.LASF87
	.long	0x15331002
	.uleb128 0x13
	.long	.LASF88
	.long	0x15441002
	.uleb128 0x13
	.long	.LASF89
	.long	0x15731002
	.uleb128 0x13
	.long	.LASF90
	.long	0x15841002
	.uleb128 0x13
	.long	.LASF91
	.long	0x15151002
	.uleb128 0x13
	.long	.LASF92
	.long	0x15551002
	.uleb128 0x13
	.long	.LASF93
	.long	0x17101803
	.uleb128 0x13
	.long	.LASF94
	.long	0x17401803
	.uleb128 0x13
	.long	.LASF95
	.long	0x16161804
	.uleb128 0x13
	.long	.LASF96
	.long	0x16261804
	.uleb128 0x13
	.long	.LASF97
	.long	0x16561804
	.uleb128 0x13
	.long	.LASF98
	.long	0x16661804
	.uleb128 0x13
	.long	.LASF99
	.long	0x16362004
	.uleb128 0x13
	.long	.LASF100
	.long	0x16462004
	.uleb128 0x13
	.long	.LASF101
	.long	0x16762004
	.uleb128 0x13
	.long	.LASF102
	.long	0x16862004
	.uleb128 0x13
	.long	.LASF103
	.long	0x16372004
	.uleb128 0x13
	.long	.LASF104
	.long	0x16762004
	.uleb128 0x13
	.long	.LASF105
	.long	0x16862004
	.uleb128 0x13
	.long	.LASF106
	.long	0x16362004
	.uleb128 0x13
	.long	.LASF107
	.long	0x16462004
	.uleb128 0x13
	.long	.LASF108
	.long	0x32315659
	.uleb128 0x13
	.long	.LASF109
	.long	0x56555949
	.uleb128 0x13
	.long	.LASF110
	.long	0x32595559
	.uleb128 0x13
	.long	.LASF111
	.long	0x59565955
	.uleb128 0x13
	.long	.LASF112
	.long	0x55595659
	.uleb128 0x13
	.long	.LASF113
	.long	0x3231564e
	.uleb128 0x13
	.long	.LASF114
	.long	0x3132564e
	.uleb128 0x13
	.long	.LASF115
	.long	0x2053454f
	.byte	0
	.uleb128 0x14
	.long	.LASF117
	.byte	0x4
	.byte	0xc
	.value	0x127
	.byte	0x10
	.long	0x5ce
	.uleb128 0x15
	.string	"r"
	.byte	0xc
	.value	0x129
	.byte	0xb
	.long	0x3b2
	.byte	0
	.uleb128 0x15
	.string	"g"
	.byte	0xc
	.value	0x12a
	.byte	0xb
	.long	0x3b2
	.byte	0x1
	.uleb128 0x15
	.string	"b"
	.byte	0xc
	.value	0x12b
	.byte	0xb
	.long	0x3b2
	.byte	0x2
	.uleb128 0x15
	.string	"a"
	.byte	0xc
	.value	0x12c
	.byte	0xb
	.long	0x3b2
	.byte	0x3
	.byte	0
	.uleb128 0x16
	.long	.LASF117
	.byte	0xc
	.value	0x12d
	.byte	0x3
	.long	0x58f
	.uleb128 0x14
	.long	.LASF118
	.byte	0x18
	.byte	0xc
	.value	0x130
	.byte	0x10
	.long	0x622
	.uleb128 0x17
	.long	.LASF119
	.byte	0xc
	.value	0x132
	.byte	0x9
	.long	0x87
	.byte	0
	.uleb128 0x17
	.long	.LASF120
	.byte	0xc
	.value	0x133
	.byte	0x10
	.long	0x622
	.byte	0x8
	.uleb128 0x17
	.long	.LASF121
	.byte	0xc
	.value	0x134
	.byte	0xc
	.long	0x3e2
	.byte	0x10
	.uleb128 0x17
	.long	.LASF122
	.byte	0xc
	.value	0x135
	.byte	0x9
	.long	0x87
	.byte	0x14
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x5ce
	.uleb128 0x16
	.long	.LASF118
	.byte	0xc
	.value	0x136
	.byte	0x3
	.long	0x5db
	.uleb128 0x14
	.long	.LASF123
	.byte	0x38
	.byte	0xc
	.value	0x13b
	.byte	0x10
	.long	0x74e
	.uleb128 0x17
	.long	.LASF124
	.byte	0xc
	.value	0x13d
	.byte	0xc
	.long	0x3e2
	.byte	0
	.uleb128 0x17
	.long	.LASF125
	.byte	0xc
	.value	0x13e
	.byte	0x12
	.long	0x74e
	.byte	0x8
	.uleb128 0x17
	.long	.LASF126
	.byte	0xc
	.value	0x13f
	.byte	0xb
	.long	0x3b2
	.byte	0x10
	.uleb128 0x17
	.long	.LASF127
	.byte	0xc
	.value	0x140
	.byte	0xb
	.long	0x3b2
	.byte	0x11
	.uleb128 0x17
	.long	.LASF128
	.byte	0xc
	.value	0x141
	.byte	0xb
	.long	0x754
	.byte	0x12
	.uleb128 0x17
	.long	.LASF129
	.byte	0xc
	.value	0x142
	.byte	0xc
	.long	0x3e2
	.byte	0x14
	.uleb128 0x17
	.long	.LASF130
	.byte	0xc
	.value	0x143
	.byte	0xc
	.long	0x3e2
	.byte	0x18
	.uleb128 0x17
	.long	.LASF131
	.byte	0xc
	.value	0x144
	.byte	0xc
	.long	0x3e2
	.byte	0x1c
	.uleb128 0x17
	.long	.LASF132
	.byte	0xc
	.value	0x145
	.byte	0xc
	.long	0x3e2
	.byte	0x20
	.uleb128 0x17
	.long	.LASF133
	.byte	0xc
	.value	0x146
	.byte	0xb
	.long	0x3b2
	.byte	0x24
	.uleb128 0x17
	.long	.LASF134
	.byte	0xc
	.value	0x147
	.byte	0xb
	.long	0x3b2
	.byte	0x25
	.uleb128 0x17
	.long	.LASF135
	.byte	0xc
	.value	0x148
	.byte	0xb
	.long	0x3b2
	.byte	0x26
	.uleb128 0x17
	.long	.LASF136
	.byte	0xc
	.value	0x149
	.byte	0xb
	.long	0x3b2
	.byte	0x27
	.uleb128 0x17
	.long	.LASF137
	.byte	0xc
	.value	0x14a
	.byte	0xb
	.long	0x3b2
	.byte	0x28
	.uleb128 0x17
	.long	.LASF138
	.byte	0xc
	.value	0x14b
	.byte	0xb
	.long	0x3b2
	.byte	0x29
	.uleb128 0x17
	.long	.LASF139
	.byte	0xc
	.value	0x14c
	.byte	0xb
	.long	0x3b2
	.byte	0x2a
	.uleb128 0x17
	.long	.LASF140
	.byte	0xc
	.value	0x14d
	.byte	0xb
	.long	0x3b2
	.byte	0x2b
	.uleb128 0x17
	.long	.LASF122
	.byte	0xc
	.value	0x14e
	.byte	0x9
	.long	0x87
	.byte	0x2c
	.uleb128 0x17
	.long	.LASF141
	.byte	0xc
	.value	0x14f
	.byte	0x1d
	.long	0x764
	.byte	0x30
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x628
	.uleb128 0x8
	.long	0x3b2
	.long	0x764
	.uleb128 0x9
	.long	0x42
	.byte	0x1
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x635
	.uleb128 0x16
	.long	.LASF123
	.byte	0xc
	.value	0x150
	.byte	0x3
	.long	0x635
	.uleb128 0xa
	.long	.LASF142
	.byte	0x10
	.byte	0xd
	.byte	0x4d
	.byte	0x10
	.long	0x7b1
	.uleb128 0x18
	.string	"x"
	.byte	0xd
	.byte	0x4f
	.byte	0x9
	.long	0x87
	.byte	0
	.uleb128 0x18
	.string	"y"
	.byte	0xd
	.byte	0x4f
	.byte	0xc
	.long	0x87
	.byte	0x4
	.uleb128 0x18
	.string	"w"
	.byte	0xd
	.byte	0x50
	.byte	0x9
	.long	0x87
	.byte	0x8
	.uleb128 0x18
	.string	"h"
	.byte	0xd
	.byte	0x50
	.byte	0xc
	.long	0x87
	.byte	0xc
	.byte	0
	.uleb128 0x3
	.long	.LASF142
	.byte	0xd
	.byte	0x51
	.byte	0x3
	.long	0x777
	.uleb128 0xa
	.long	.LASF143
	.byte	0x60
	.byte	0xe
	.byte	0x46
	.byte	0x10
	.long	0x863
	.uleb128 0xb
	.long	.LASF144
	.byte	0xe
	.byte	0x48
	.byte	0xc
	.long	0x3e2
	.byte	0
	.uleb128 0xb
	.long	.LASF124
	.byte	0xe
	.byte	0x49
	.byte	0x16
	.long	0x863
	.byte	0x8
	.uleb128 0x18
	.string	"w"
	.byte	0xe
	.byte	0x4a
	.byte	0x9
	.long	0x87
	.byte	0x10
	.uleb128 0x18
	.string	"h"
	.byte	0xe
	.byte	0x4a
	.byte	0xc
	.long	0x87
	.byte	0x14
	.uleb128 0xb
	.long	.LASF145
	.byte	0xe
	.byte	0x4b
	.byte	0x9
	.long	0x87
	.byte	0x18
	.uleb128 0xb
	.long	.LASF146
	.byte	0xe
	.byte	0x4c
	.byte	0xb
	.long	0xc5
	.byte	0x20
	.uleb128 0xb
	.long	.LASF147
	.byte	0xe
	.byte	0x4f
	.byte	0xb
	.long	0xc5
	.byte	0x28
	.uleb128 0xb
	.long	.LASF148
	.byte	0xe
	.byte	0x52
	.byte	0x9
	.long	0x87
	.byte	0x30
	.uleb128 0xb
	.long	.LASF149
	.byte	0xe
	.byte	0x53
	.byte	0xb
	.long	0xc5
	.byte	0x38
	.uleb128 0xb
	.long	.LASF150
	.byte	0xe
	.byte	0x56
	.byte	0xe
	.long	0x7b1
	.byte	0x40
	.uleb128 0x18
	.string	"map"
	.byte	0xe
	.byte	0x59
	.byte	0x19
	.long	0x86e
	.byte	0x50
	.uleb128 0xb
	.long	.LASF122
	.byte	0xe
	.byte	0x5c
	.byte	0x9
	.long	0x87
	.byte	0x58
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x76a
	.uleb128 0xd
	.long	.LASF151
	.uleb128 0x6
	.byte	0x8
	.long	0x869
	.uleb128 0x3
	.long	.LASF143
	.byte	0xe
	.byte	0x5d
	.byte	0x3
	.long	0x7bd
	.uleb128 0x3
	.long	.LASF152
	.byte	0xf
	.byte	0x5a
	.byte	0x1b
	.long	0x88c
	.uleb128 0xd
	.long	.LASF152
	.uleb128 0x11
	.byte	0x7
	.byte	0x4
	.long	0x3b
	.byte	0xf
	.byte	0x62
	.byte	0x1
	.long	0x935
	.uleb128 0x12
	.long	.LASF153
	.byte	0x1
	.uleb128 0x12
	.long	.LASF154
	.byte	0x2
	.uleb128 0x12
	.long	.LASF155
	.byte	0x4
	.uleb128 0x12
	.long	.LASF156
	.byte	0x8
	.uleb128 0x12
	.long	.LASF157
	.byte	0x10
	.uleb128 0x12
	.long	.LASF158
	.byte	0x20
	.uleb128 0x12
	.long	.LASF159
	.byte	0x40
	.uleb128 0x12
	.long	.LASF160
	.byte	0x80
	.uleb128 0x19
	.long	.LASF161
	.value	0x100
	.uleb128 0x19
	.long	.LASF162
	.value	0x200
	.uleb128 0x19
	.long	.LASF163
	.value	0x400
	.uleb128 0x19
	.long	.LASF164
	.value	0x1001
	.uleb128 0x19
	.long	.LASF165
	.value	0x800
	.uleb128 0x19
	.long	.LASF166
	.value	0x2000
	.uleb128 0x19
	.long	.LASF167
	.value	0x4000
	.uleb128 0x19
	.long	.LASF168
	.value	0x8000
	.uleb128 0x13
	.long	.LASF169
	.long	0x10000
	.uleb128 0x13
	.long	.LASF170
	.long	0x20000
	.uleb128 0x13
	.long	.LASF171
	.long	0x40000
	.uleb128 0x13
	.long	.LASF172
	.long	0x80000
	.uleb128 0x13
	.long	.LASF173
	.long	0x10000000
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x880
	.uleb128 0x11
	.byte	0x7
	.byte	0x4
	.long	0x3b
	.byte	0x10
	.byte	0x2c
	.byte	0x1
	.long	0xf21
	.uleb128 0x12
	.long	.LASF174
	.byte	0
	.uleb128 0x12
	.long	.LASF175
	.byte	0x4
	.uleb128 0x12
	.long	.LASF176
	.byte	0x5
	.uleb128 0x12
	.long	.LASF177
	.byte	0x6
	.uleb128 0x12
	.long	.LASF178
	.byte	0x7
	.uleb128 0x12
	.long	.LASF179
	.byte	0x8
	.uleb128 0x12
	.long	.LASF180
	.byte	0x9
	.uleb128 0x12
	.long	.LASF181
	.byte	0xa
	.uleb128 0x12
	.long	.LASF182
	.byte	0xb
	.uleb128 0x12
	.long	.LASF183
	.byte	0xc
	.uleb128 0x12
	.long	.LASF184
	.byte	0xd
	.uleb128 0x12
	.long	.LASF185
	.byte	0xe
	.uleb128 0x12
	.long	.LASF186
	.byte	0xf
	.uleb128 0x12
	.long	.LASF187
	.byte	0x10
	.uleb128 0x12
	.long	.LASF188
	.byte	0x11
	.uleb128 0x12
	.long	.LASF189
	.byte	0x12
	.uleb128 0x12
	.long	.LASF190
	.byte	0x13
	.uleb128 0x12
	.long	.LASF191
	.byte	0x14
	.uleb128 0x12
	.long	.LASF192
	.byte	0x15
	.uleb128 0x12
	.long	.LASF193
	.byte	0x16
	.uleb128 0x12
	.long	.LASF194
	.byte	0x17
	.uleb128 0x12
	.long	.LASF195
	.byte	0x18
	.uleb128 0x12
	.long	.LASF196
	.byte	0x19
	.uleb128 0x12
	.long	.LASF197
	.byte	0x1a
	.uleb128 0x12
	.long	.LASF198
	.byte	0x1b
	.uleb128 0x12
	.long	.LASF199
	.byte	0x1c
	.uleb128 0x12
	.long	.LASF200
	.byte	0x1d
	.uleb128 0x12
	.long	.LASF201
	.byte	0x1e
	.uleb128 0x12
	.long	.LASF202
	.byte	0x1f
	.uleb128 0x12
	.long	.LASF203
	.byte	0x20
	.uleb128 0x12
	.long	.LASF204
	.byte	0x21
	.uleb128 0x12
	.long	.LASF205
	.byte	0x22
	.uleb128 0x12
	.long	.LASF206
	.byte	0x23
	.uleb128 0x12
	.long	.LASF207
	.byte	0x24
	.uleb128 0x12
	.long	.LASF208
	.byte	0x25
	.uleb128 0x12
	.long	.LASF209
	.byte	0x26
	.uleb128 0x12
	.long	.LASF210
	.byte	0x27
	.uleb128 0x12
	.long	.LASF211
	.byte	0x28
	.uleb128 0x12
	.long	.LASF212
	.byte	0x29
	.uleb128 0x12
	.long	.LASF213
	.byte	0x2a
	.uleb128 0x12
	.long	.LASF214
	.byte	0x2b
	.uleb128 0x12
	.long	.LASF215
	.byte	0x2c
	.uleb128 0x12
	.long	.LASF216
	.byte	0x2d
	.uleb128 0x12
	.long	.LASF217
	.byte	0x2e
	.uleb128 0x12
	.long	.LASF218
	.byte	0x2f
	.uleb128 0x12
	.long	.LASF219
	.byte	0x30
	.uleb128 0x12
	.long	.LASF220
	.byte	0x31
	.uleb128 0x12
	.long	.LASF221
	.byte	0x32
	.uleb128 0x12
	.long	.LASF222
	.byte	0x33
	.uleb128 0x12
	.long	.LASF223
	.byte	0x34
	.uleb128 0x12
	.long	.LASF224
	.byte	0x35
	.uleb128 0x12
	.long	.LASF225
	.byte	0x36
	.uleb128 0x12
	.long	.LASF226
	.byte	0x37
	.uleb128 0x12
	.long	.LASF227
	.byte	0x38
	.uleb128 0x12
	.long	.LASF228
	.byte	0x39
	.uleb128 0x12
	.long	.LASF229
	.byte	0x3a
	.uleb128 0x12
	.long	.LASF230
	.byte	0x3b
	.uleb128 0x12
	.long	.LASF231
	.byte	0x3c
	.uleb128 0x12
	.long	.LASF232
	.byte	0x3d
	.uleb128 0x12
	.long	.LASF233
	.byte	0x3e
	.uleb128 0x12
	.long	.LASF234
	.byte	0x3f
	.uleb128 0x12
	.long	.LASF235
	.byte	0x40
	.uleb128 0x12
	.long	.LASF236
	.byte	0x41
	.uleb128 0x12
	.long	.LASF237
	.byte	0x42
	.uleb128 0x12
	.long	.LASF238
	.byte	0x43
	.uleb128 0x12
	.long	.LASF239
	.byte	0x44
	.uleb128 0x12
	.long	.LASF240
	.byte	0x45
	.uleb128 0x12
	.long	.LASF241
	.byte	0x46
	.uleb128 0x12
	.long	.LASF242
	.byte	0x47
	.uleb128 0x12
	.long	.LASF243
	.byte	0x48
	.uleb128 0x12
	.long	.LASF244
	.byte	0x49
	.uleb128 0x12
	.long	.LASF245
	.byte	0x4a
	.uleb128 0x12
	.long	.LASF246
	.byte	0x4b
	.uleb128 0x12
	.long	.LASF247
	.byte	0x4c
	.uleb128 0x12
	.long	.LASF248
	.byte	0x4d
	.uleb128 0x12
	.long	.LASF249
	.byte	0x4e
	.uleb128 0x12
	.long	.LASF250
	.byte	0x4f
	.uleb128 0x12
	.long	.LASF251
	.byte	0x50
	.uleb128 0x12
	.long	.LASF252
	.byte	0x51
	.uleb128 0x12
	.long	.LASF253
	.byte	0x52
	.uleb128 0x12
	.long	.LASF254
	.byte	0x53
	.uleb128 0x12
	.long	.LASF255
	.byte	0x54
	.uleb128 0x12
	.long	.LASF256
	.byte	0x55
	.uleb128 0x12
	.long	.LASF257
	.byte	0x56
	.uleb128 0x12
	.long	.LASF258
	.byte	0x57
	.uleb128 0x12
	.long	.LASF259
	.byte	0x58
	.uleb128 0x12
	.long	.LASF260
	.byte	0x59
	.uleb128 0x12
	.long	.LASF261
	.byte	0x5a
	.uleb128 0x12
	.long	.LASF262
	.byte	0x5b
	.uleb128 0x12
	.long	.LASF263
	.byte	0x5c
	.uleb128 0x12
	.long	.LASF264
	.byte	0x5d
	.uleb128 0x12
	.long	.LASF265
	.byte	0x5e
	.uleb128 0x12
	.long	.LASF266
	.byte	0x5f
	.uleb128 0x12
	.long	.LASF267
	.byte	0x60
	.uleb128 0x12
	.long	.LASF268
	.byte	0x61
	.uleb128 0x12
	.long	.LASF269
	.byte	0x62
	.uleb128 0x12
	.long	.LASF270
	.byte	0x63
	.uleb128 0x12
	.long	.LASF271
	.byte	0x64
	.uleb128 0x12
	.long	.LASF272
	.byte	0x65
	.uleb128 0x12
	.long	.LASF273
	.byte	0x66
	.uleb128 0x12
	.long	.LASF274
	.byte	0x67
	.uleb128 0x12
	.long	.LASF275
	.byte	0x68
	.uleb128 0x12
	.long	.LASF276
	.byte	0x69
	.uleb128 0x12
	.long	.LASF277
	.byte	0x6a
	.uleb128 0x12
	.long	.LASF278
	.byte	0x6b
	.uleb128 0x12
	.long	.LASF279
	.byte	0x6c
	.uleb128 0x12
	.long	.LASF280
	.byte	0x6d
	.uleb128 0x12
	.long	.LASF281
	.byte	0x6e
	.uleb128 0x12
	.long	.LASF282
	.byte	0x6f
	.uleb128 0x12
	.long	.LASF283
	.byte	0x70
	.uleb128 0x12
	.long	.LASF284
	.byte	0x71
	.uleb128 0x12
	.long	.LASF285
	.byte	0x72
	.uleb128 0x12
	.long	.LASF286
	.byte	0x73
	.uleb128 0x12
	.long	.LASF287
	.byte	0x74
	.uleb128 0x12
	.long	.LASF288
	.byte	0x75
	.uleb128 0x12
	.long	.LASF289
	.byte	0x76
	.uleb128 0x12
	.long	.LASF290
	.byte	0x77
	.uleb128 0x12
	.long	.LASF291
	.byte	0x78
	.uleb128 0x12
	.long	.LASF292
	.byte	0x79
	.uleb128 0x12
	.long	.LASF293
	.byte	0x7a
	.uleb128 0x12
	.long	.LASF294
	.byte	0x7b
	.uleb128 0x12
	.long	.LASF295
	.byte	0x7c
	.uleb128 0x12
	.long	.LASF296
	.byte	0x7d
	.uleb128 0x12
	.long	.LASF297
	.byte	0x7e
	.uleb128 0x12
	.long	.LASF298
	.byte	0x7f
	.uleb128 0x12
	.long	.LASF299
	.byte	0x80
	.uleb128 0x12
	.long	.LASF300
	.byte	0x81
	.uleb128 0x12
	.long	.LASF301
	.byte	0x85
	.uleb128 0x12
	.long	.LASF302
	.byte	0x86
	.uleb128 0x12
	.long	.LASF303
	.byte	0x87
	.uleb128 0x12
	.long	.LASF304
	.byte	0x88
	.uleb128 0x12
	.long	.LASF305
	.byte	0x89
	.uleb128 0x12
	.long	.LASF306
	.byte	0x8a
	.uleb128 0x12
	.long	.LASF307
	.byte	0x8b
	.uleb128 0x12
	.long	.LASF308
	.byte	0x8c
	.uleb128 0x12
	.long	.LASF309
	.byte	0x8d
	.uleb128 0x12
	.long	.LASF310
	.byte	0x8e
	.uleb128 0x12
	.long	.LASF311
	.byte	0x8f
	.uleb128 0x12
	.long	.LASF312
	.byte	0x90
	.uleb128 0x12
	.long	.LASF313
	.byte	0x91
	.uleb128 0x12
	.long	.LASF314
	.byte	0x92
	.uleb128 0x12
	.long	.LASF315
	.byte	0x93
	.uleb128 0x12
	.long	.LASF316
	.byte	0x94
	.uleb128 0x12
	.long	.LASF317
	.byte	0x95
	.uleb128 0x12
	.long	.LASF318
	.byte	0x96
	.uleb128 0x12
	.long	.LASF319
	.byte	0x97
	.uleb128 0x12
	.long	.LASF320
	.byte	0x98
	.uleb128 0x12
	.long	.LASF321
	.byte	0x99
	.uleb128 0x12
	.long	.LASF322
	.byte	0x9a
	.uleb128 0x12
	.long	.LASF323
	.byte	0x9b
	.uleb128 0x12
	.long	.LASF324
	.byte	0x9c
	.uleb128 0x12
	.long	.LASF325
	.byte	0x9d
	.uleb128 0x12
	.long	.LASF326
	.byte	0x9e
	.uleb128 0x12
	.long	.LASF327
	.byte	0x9f
	.uleb128 0x12
	.long	.LASF328
	.byte	0xa0
	.uleb128 0x12
	.long	.LASF329
	.byte	0xa1
	.uleb128 0x12
	.long	.LASF330
	.byte	0xa2
	.uleb128 0x12
	.long	.LASF331
	.byte	0xa3
	.uleb128 0x12
	.long	.LASF332
	.byte	0xa4
	.uleb128 0x12
	.long	.LASF333
	.byte	0xb0
	.uleb128 0x12
	.long	.LASF334
	.byte	0xb1
	.uleb128 0x12
	.long	.LASF335
	.byte	0xb2
	.uleb128 0x12
	.long	.LASF336
	.byte	0xb3
	.uleb128 0x12
	.long	.LASF337
	.byte	0xb4
	.uleb128 0x12
	.long	.LASF338
	.byte	0xb5
	.uleb128 0x12
	.long	.LASF339
	.byte	0xb6
	.uleb128 0x12
	.long	.LASF340
	.byte	0xb7
	.uleb128 0x12
	.long	.LASF341
	.byte	0xb8
	.uleb128 0x12
	.long	.LASF342
	.byte	0xb9
	.uleb128 0x12
	.long	.LASF343
	.byte	0xba
	.uleb128 0x12
	.long	.LASF344
	.byte	0xbb
	.uleb128 0x12
	.long	.LASF345
	.byte	0xbc
	.uleb128 0x12
	.long	.LASF346
	.byte	0xbd
	.uleb128 0x12
	.long	.LASF347
	.byte	0xbe
	.uleb128 0x12
	.long	.LASF348
	.byte	0xbf
	.uleb128 0x12
	.long	.LASF349
	.byte	0xc0
	.uleb128 0x12
	.long	.LASF350
	.byte	0xc1
	.uleb128 0x12
	.long	.LASF351
	.byte	0xc2
	.uleb128 0x12
	.long	.LASF352
	.byte	0xc3
	.uleb128 0x12
	.long	.LASF353
	.byte	0xc4
	.uleb128 0x12
	.long	.LASF354
	.byte	0xc5
	.uleb128 0x12
	.long	.LASF355
	.byte	0xc6
	.uleb128 0x12
	.long	.LASF356
	.byte	0xc7
	.uleb128 0x12
	.long	.LASF357
	.byte	0xc8
	.uleb128 0x12
	.long	.LASF358
	.byte	0xc9
	.uleb128 0x12
	.long	.LASF359
	.byte	0xca
	.uleb128 0x12
	.long	.LASF360
	.byte	0xcb
	.uleb128 0x12
	.long	.LASF361
	.byte	0xcc
	.uleb128 0x12
	.long	.LASF362
	.byte	0xcd
	.uleb128 0x12
	.long	.LASF363
	.byte	0xce
	.uleb128 0x12
	.long	.LASF364
	.byte	0xcf
	.uleb128 0x12
	.long	.LASF365
	.byte	0xd0
	.uleb128 0x12
	.long	.LASF366
	.byte	0xd1
	.uleb128 0x12
	.long	.LASF367
	.byte	0xd2
	.uleb128 0x12
	.long	.LASF368
	.byte	0xd3
	.uleb128 0x12
	.long	.LASF369
	.byte	0xd4
	.uleb128 0x12
	.long	.LASF370
	.byte	0xd5
	.uleb128 0x12
	.long	.LASF371
	.byte	0xd6
	.uleb128 0x12
	.long	.LASF372
	.byte	0xd7
	.uleb128 0x12
	.long	.LASF373
	.byte	0xd8
	.uleb128 0x12
	.long	.LASF374
	.byte	0xd9
	.uleb128 0x12
	.long	.LASF375
	.byte	0xda
	.uleb128 0x12
	.long	.LASF376
	.byte	0xdb
	.uleb128 0x12
	.long	.LASF377
	.byte	0xdc
	.uleb128 0x12
	.long	.LASF378
	.byte	0xdd
	.uleb128 0x12
	.long	.LASF379
	.byte	0xe0
	.uleb128 0x12
	.long	.LASF380
	.byte	0xe1
	.uleb128 0x12
	.long	.LASF381
	.byte	0xe2
	.uleb128 0x12
	.long	.LASF382
	.byte	0xe3
	.uleb128 0x12
	.long	.LASF383
	.byte	0xe4
	.uleb128 0x12
	.long	.LASF384
	.byte	0xe5
	.uleb128 0x12
	.long	.LASF385
	.byte	0xe6
	.uleb128 0x12
	.long	.LASF386
	.byte	0xe7
	.uleb128 0x19
	.long	.LASF387
	.value	0x101
	.uleb128 0x19
	.long	.LASF388
	.value	0x102
	.uleb128 0x19
	.long	.LASF389
	.value	0x103
	.uleb128 0x19
	.long	.LASF390
	.value	0x104
	.uleb128 0x19
	.long	.LASF391
	.value	0x105
	.uleb128 0x19
	.long	.LASF392
	.value	0x106
	.uleb128 0x19
	.long	.LASF393
	.value	0x107
	.uleb128 0x19
	.long	.LASF394
	.value	0x108
	.uleb128 0x19
	.long	.LASF395
	.value	0x109
	.uleb128 0x19
	.long	.LASF396
	.value	0x10a
	.uleb128 0x19
	.long	.LASF397
	.value	0x10b
	.uleb128 0x19
	.long	.LASF398
	.value	0x10c
	.uleb128 0x19
	.long	.LASF399
	.value	0x10d
	.uleb128 0x19
	.long	.LASF400
	.value	0x10e
	.uleb128 0x19
	.long	.LASF401
	.value	0x10f
	.uleb128 0x19
	.long	.LASF402
	.value	0x110
	.uleb128 0x19
	.long	.LASF403
	.value	0x111
	.uleb128 0x19
	.long	.LASF404
	.value	0x112
	.uleb128 0x19
	.long	.LASF405
	.value	0x113
	.uleb128 0x19
	.long	.LASF406
	.value	0x114
	.uleb128 0x19
	.long	.LASF407
	.value	0x115
	.uleb128 0x19
	.long	.LASF408
	.value	0x116
	.uleb128 0x19
	.long	.LASF409
	.value	0x117
	.uleb128 0x19
	.long	.LASF410
	.value	0x118
	.uleb128 0x19
	.long	.LASF411
	.value	0x119
	.uleb128 0x19
	.long	.LASF412
	.value	0x11a
	.uleb128 0x19
	.long	.LASF413
	.value	0x11b
	.uleb128 0x19
	.long	.LASF414
	.value	0x11c
	.uleb128 0x19
	.long	.LASF415
	.value	0x11d
	.uleb128 0x19
	.long	.LASF416
	.value	0x11e
	.uleb128 0x19
	.long	.LASF417
	.value	0x200
	.byte	0
	.uleb128 0x16
	.long	.LASF418
	.byte	0x10
	.value	0x199
	.byte	0x3
	.long	0x93b
	.uleb128 0x3
	.long	.LASF419
	.byte	0x11
	.byte	0x2d
	.byte	0x10
	.long	0x3d6
	.uleb128 0xa
	.long	.LASF420
	.byte	0x10
	.byte	0x12
	.byte	0x2f
	.byte	0x10
	.long	0xf7c
	.uleb128 0xb
	.long	.LASF421
	.byte	0x12
	.byte	0x31
	.byte	0x12
	.long	0xf21
	.byte	0
	.uleb128 0x18
	.string	"sym"
	.byte	0x12
	.byte	0x32
	.byte	0x11
	.long	0xf2e
	.byte	0x4
	.uleb128 0x18
	.string	"mod"
	.byte	0x12
	.byte	0x33
	.byte	0xc
	.long	0x3ca
	.byte	0x8
	.uleb128 0xb
	.long	.LASF422
	.byte	0x12
	.byte	0x34
	.byte	0xc
	.long	0x3e2
	.byte	0xc
	.byte	0
	.uleb128 0x3
	.long	.LASF420
	.byte	0x12
	.byte	0x35
	.byte	0x3
	.long	0xf3a
	.uleb128 0x3
	.long	.LASF423
	.byte	0x13
	.byte	0x51
	.byte	0x10
	.long	0x3d6
	.uleb128 0x3
	.long	.LASF424
	.byte	0x14
	.byte	0x29
	.byte	0x10
	.long	0x3ee
	.uleb128 0x3
	.long	.LASF425
	.byte	0x14
	.byte	0x2a
	.byte	0x10
	.long	0x3ee
	.uleb128 0x3
	.long	.LASF426
	.byte	0x15
	.byte	0x2c
	.byte	0x10
	.long	0x3ee
	.uleb128 0x11
	.byte	0x7
	.byte	0x4
	.long	0x3b
	.byte	0x16
	.byte	0x38
	.byte	0x1
	.long	0x112b
	.uleb128 0x12
	.long	.LASF427
	.byte	0
	.uleb128 0x19
	.long	.LASF428
	.value	0x100
	.uleb128 0x19
	.long	.LASF429
	.value	0x101
	.uleb128 0x19
	.long	.LASF430
	.value	0x102
	.uleb128 0x19
	.long	.LASF431
	.value	0x103
	.uleb128 0x19
	.long	.LASF432
	.value	0x104
	.uleb128 0x19
	.long	.LASF433
	.value	0x105
	.uleb128 0x19
	.long	.LASF434
	.value	0x106
	.uleb128 0x19
	.long	.LASF435
	.value	0x150
	.uleb128 0x19
	.long	.LASF436
	.value	0x200
	.uleb128 0x19
	.long	.LASF437
	.value	0x201
	.uleb128 0x19
	.long	.LASF438
	.value	0x300
	.uleb128 0x19
	.long	.LASF439
	.value	0x301
	.uleb128 0x19
	.long	.LASF440
	.value	0x302
	.uleb128 0x19
	.long	.LASF441
	.value	0x303
	.uleb128 0x19
	.long	.LASF442
	.value	0x304
	.uleb128 0x19
	.long	.LASF443
	.value	0x400
	.uleb128 0x19
	.long	.LASF444
	.value	0x401
	.uleb128 0x19
	.long	.LASF445
	.value	0x402
	.uleb128 0x19
	.long	.LASF446
	.value	0x403
	.uleb128 0x19
	.long	.LASF447
	.value	0x600
	.uleb128 0x19
	.long	.LASF448
	.value	0x601
	.uleb128 0x19
	.long	.LASF449
	.value	0x602
	.uleb128 0x19
	.long	.LASF450
	.value	0x603
	.uleb128 0x19
	.long	.LASF451
	.value	0x604
	.uleb128 0x19
	.long	.LASF452
	.value	0x605
	.uleb128 0x19
	.long	.LASF453
	.value	0x606
	.uleb128 0x19
	.long	.LASF454
	.value	0x650
	.uleb128 0x19
	.long	.LASF455
	.value	0x651
	.uleb128 0x19
	.long	.LASF456
	.value	0x652
	.uleb128 0x19
	.long	.LASF457
	.value	0x653
	.uleb128 0x19
	.long	.LASF458
	.value	0x654
	.uleb128 0x19
	.long	.LASF459
	.value	0x655
	.uleb128 0x19
	.long	.LASF460
	.value	0x700
	.uleb128 0x19
	.long	.LASF461
	.value	0x701
	.uleb128 0x19
	.long	.LASF462
	.value	0x702
	.uleb128 0x19
	.long	.LASF463
	.value	0x800
	.uleb128 0x19
	.long	.LASF464
	.value	0x801
	.uleb128 0x19
	.long	.LASF465
	.value	0x802
	.uleb128 0x19
	.long	.LASF466
	.value	0x900
	.uleb128 0x19
	.long	.LASF467
	.value	0x1000
	.uleb128 0x19
	.long	.LASF468
	.value	0x1001
	.uleb128 0x19
	.long	.LASF469
	.value	0x1002
	.uleb128 0x19
	.long	.LASF470
	.value	0x1003
	.uleb128 0x19
	.long	.LASF471
	.value	0x1100
	.uleb128 0x19
	.long	.LASF472
	.value	0x1101
	.uleb128 0x19
	.long	.LASF473
	.value	0x1200
	.uleb128 0x19
	.long	.LASF474
	.value	0x2000
	.uleb128 0x19
	.long	.LASF475
	.value	0x2001
	.uleb128 0x19
	.long	.LASF476
	.value	0x8000
	.uleb128 0x19
	.long	.LASF477
	.value	0xffff
	.byte	0
	.uleb128 0xa
	.long	.LASF478
	.byte	0x8
	.byte	0x16
	.byte	0xab
	.byte	0x10
	.long	0x1153
	.uleb128 0xb
	.long	.LASF479
	.byte	0x16
	.byte	0xad
	.byte	0xc
	.long	0x3e2
	.byte	0
	.uleb128 0xb
	.long	.LASF480
	.byte	0x16
	.byte	0xae
	.byte	0xc
	.long	0x3e2
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.long	.LASF478
	.byte	0x16
	.byte	0xaf
	.byte	0x3
	.long	0x112b
	.uleb128 0xa
	.long	.LASF481
	.byte	0x14
	.byte	0x16
	.byte	0xb4
	.byte	0x10
	.long	0x11d5
	.uleb128 0xb
	.long	.LASF479
	.byte	0x16
	.byte	0xb6
	.byte	0xc
	.long	0x3e2
	.byte	0
	.uleb128 0xb
	.long	.LASF480
	.byte	0x16
	.byte	0xb7
	.byte	0xc
	.long	0x3e2
	.byte	0x4
	.uleb128 0xb
	.long	.LASF482
	.byte	0x16
	.byte	0xb8
	.byte	0xc
	.long	0x3e2
	.byte	0x8
	.uleb128 0xb
	.long	.LASF483
	.byte	0x16
	.byte	0xb9
	.byte	0xb
	.long	0x3b2
	.byte	0xc
	.uleb128 0xb
	.long	.LASF484
	.byte	0x16
	.byte	0xba
	.byte	0xb
	.long	0x3b2
	.byte	0xd
	.uleb128 0xb
	.long	.LASF485
	.byte	0x16
	.byte	0xbb
	.byte	0xb
	.long	0x3b2
	.byte	0xe
	.uleb128 0xb
	.long	.LASF486
	.byte	0x16
	.byte	0xbc
	.byte	0xb
	.long	0x3b2
	.byte	0xf
	.uleb128 0xb
	.long	.LASF487
	.byte	0x16
	.byte	0xbd
	.byte	0xc
	.long	0x3d6
	.byte	0x10
	.byte	0
	.uleb128 0x3
	.long	.LASF481
	.byte	0x16
	.byte	0xbe
	.byte	0x3
	.long	0x115f
	.uleb128 0xa
	.long	.LASF488
	.byte	0x18
	.byte	0x16
	.byte	0xc3
	.byte	0x10
	.long	0x1264
	.uleb128 0xb
	.long	.LASF479
	.byte	0x16
	.byte	0xc5
	.byte	0xc
	.long	0x3e2
	.byte	0
	.uleb128 0xb
	.long	.LASF480
	.byte	0x16
	.byte	0xc6
	.byte	0xc
	.long	0x3e2
	.byte	0x4
	.uleb128 0xb
	.long	.LASF489
	.byte	0x16
	.byte	0xc7
	.byte	0xc
	.long	0x3e2
	.byte	0x8
	.uleb128 0xb
	.long	.LASF483
	.byte	0x16
	.byte	0xc8
	.byte	0xb
	.long	0x3b2
	.byte	0xc
	.uleb128 0xb
	.long	.LASF484
	.byte	0x16
	.byte	0xc9
	.byte	0xb
	.long	0x3b2
	.byte	0xd
	.uleb128 0xb
	.long	.LASF485
	.byte	0x16
	.byte	0xca
	.byte	0xb
	.long	0x3b2
	.byte	0xe
	.uleb128 0xb
	.long	.LASF486
	.byte	0x16
	.byte	0xcb
	.byte	0xb
	.long	0x3b2
	.byte	0xf
	.uleb128 0xb
	.long	.LASF487
	.byte	0x16
	.byte	0xcc
	.byte	0xc
	.long	0x3d6
	.byte	0x10
	.uleb128 0xb
	.long	.LASF490
	.byte	0x16
	.byte	0xcd
	.byte	0xc
	.long	0x3d6
	.byte	0x14
	.byte	0
	.uleb128 0x3
	.long	.LASF488
	.byte	0x16
	.byte	0xce
	.byte	0x3
	.long	0x11e1
	.uleb128 0xa
	.long	.LASF491
	.byte	0x20
	.byte	0x16
	.byte	0xd3
	.byte	0x10
	.long	0x12e6
	.uleb128 0xb
	.long	.LASF479
	.byte	0x16
	.byte	0xd5
	.byte	0xc
	.long	0x3e2
	.byte	0
	.uleb128 0xb
	.long	.LASF480
	.byte	0x16
	.byte	0xd6
	.byte	0xc
	.long	0x3e2
	.byte	0x4
	.uleb128 0xb
	.long	.LASF489
	.byte	0x16
	.byte	0xd7
	.byte	0xc
	.long	0x3e2
	.byte	0x8
	.uleb128 0xb
	.long	.LASF492
	.byte	0x16
	.byte	0xd8
	.byte	0xb
	.long	0x3b2
	.byte	0xc
	.uleb128 0xb
	.long	.LASF493
	.byte	0x16
	.byte	0xd9
	.byte	0xb
	.long	0x3b2
	.byte	0xd
	.uleb128 0xb
	.long	.LASF485
	.byte	0x16
	.byte	0xda
	.byte	0xb
	.long	0x3b2
	.byte	0xe
	.uleb128 0xb
	.long	.LASF486
	.byte	0x16
	.byte	0xdb
	.byte	0xb
	.long	0x3b2
	.byte	0xf
	.uleb128 0xb
	.long	.LASF494
	.byte	0x16
	.byte	0xdc
	.byte	0x10
	.long	0xf7c
	.byte	0x10
	.byte	0
	.uleb128 0x3
	.long	.LASF491
	.byte	0x16
	.byte	0xdd
	.byte	0x3
	.long	0x1270
	.uleb128 0xa
	.long	.LASF495
	.byte	0x34
	.byte	0x16
	.byte	0xe3
	.byte	0x10
	.long	0x134e
	.uleb128 0xb
	.long	.LASF479
	.byte	0x16
	.byte	0xe5
	.byte	0xc
	.long	0x3e2
	.byte	0
	.uleb128 0xb
	.long	.LASF480
	.byte	0x16
	.byte	0xe6
	.byte	0xc
	.long	0x3e2
	.byte	0x4
	.uleb128 0xb
	.long	.LASF489
	.byte	0x16
	.byte	0xe7
	.byte	0xc
	.long	0x3e2
	.byte	0x8
	.uleb128 0xb
	.long	.LASF496
	.byte	0x16
	.byte	0xe8
	.byte	0xa
	.long	0x117
	.byte	0xc
	.uleb128 0xb
	.long	.LASF497
	.byte	0x16
	.byte	0xe9
	.byte	0xc
	.long	0x3d6
	.byte	0x2c
	.uleb128 0xb
	.long	.LASF498
	.byte	0x16
	.byte	0xea
	.byte	0xc
	.long	0x3d6
	.byte	0x30
	.byte	0
	.uleb128 0x3
	.long	.LASF495
	.byte	0x16
	.byte	0xeb
	.byte	0x3
	.long	0x12f2
	.uleb128 0xa
	.long	.LASF499
	.byte	0x2c
	.byte	0x16
	.byte	0xf2
	.byte	0x10
	.long	0x139c
	.uleb128 0xb
	.long	.LASF479
	.byte	0x16
	.byte	0xf4
	.byte	0xc
	.long	0x3e2
	.byte	0
	.uleb128 0xb
	.long	.LASF480
	.byte	0x16
	.byte	0xf5
	.byte	0xc
	.long	0x3e2
	.byte	0x4
	.uleb128 0xb
	.long	.LASF489
	.byte	0x16
	.byte	0xf6
	.byte	0xc
	.long	0x3e2
	.byte	0x8
	.uleb128 0xb
	.long	.LASF496
	.byte	0x16
	.byte	0xf7
	.byte	0xa
	.long	0x117
	.byte	0xc
	.byte	0
	.uleb128 0x3
	.long	.LASF499
	.byte	0x16
	.byte	0xf8
	.byte	0x3
	.long	0x135a
	.uleb128 0xa
	.long	.LASF500
	.byte	0x24
	.byte	0x16
	.byte	0xfd
	.byte	0x10
	.long	0x142f
	.uleb128 0xb
	.long	.LASF479
	.byte	0x16
	.byte	0xff
	.byte	0xc
	.long	0x3e2
	.byte	0
	.uleb128 0x17
	.long	.LASF480
	.byte	0x16
	.value	0x100
	.byte	0xc
	.long	0x3e2
	.byte	0x4
	.uleb128 0x17
	.long	.LASF489
	.byte	0x16
	.value	0x101
	.byte	0xc
	.long	0x3e2
	.byte	0x8
	.uleb128 0x17
	.long	.LASF501
	.byte	0x16
	.value	0x102
	.byte	0xc
	.long	0x3e2
	.byte	0xc
	.uleb128 0x17
	.long	.LASF492
	.byte	0x16
	.value	0x103
	.byte	0xc
	.long	0x3e2
	.byte	0x10
	.uleb128 0x15
	.string	"x"
	.byte	0x16
	.value	0x104
	.byte	0xc
	.long	0x3d6
	.byte	0x14
	.uleb128 0x15
	.string	"y"
	.byte	0x16
	.value	0x105
	.byte	0xc
	.long	0x3d6
	.byte	0x18
	.uleb128 0x17
	.long	.LASF502
	.byte	0x16
	.value	0x106
	.byte	0xc
	.long	0x3d6
	.byte	0x1c
	.uleb128 0x17
	.long	.LASF503
	.byte	0x16
	.value	0x107
	.byte	0xc
	.long	0x3d6
	.byte	0x20
	.byte	0
	.uleb128 0x16
	.long	.LASF500
	.byte	0x16
	.value	0x108
	.byte	0x3
	.long	0x13a8
	.uleb128 0x14
	.long	.LASF504
	.byte	0x1c
	.byte	0x16
	.value	0x10d
	.byte	0x10
	.long	0x14d3
	.uleb128 0x17
	.long	.LASF479
	.byte	0x16
	.value	0x10f
	.byte	0xc
	.long	0x3e2
	.byte	0
	.uleb128 0x17
	.long	.LASF480
	.byte	0x16
	.value	0x110
	.byte	0xc
	.long	0x3e2
	.byte	0x4
	.uleb128 0x17
	.long	.LASF489
	.byte	0x16
	.value	0x111
	.byte	0xc
	.long	0x3e2
	.byte	0x8
	.uleb128 0x17
	.long	.LASF501
	.byte	0x16
	.value	0x112
	.byte	0xc
	.long	0x3e2
	.byte	0xc
	.uleb128 0x17
	.long	.LASF505
	.byte	0x16
	.value	0x113
	.byte	0xb
	.long	0x3b2
	.byte	0x10
	.uleb128 0x17
	.long	.LASF492
	.byte	0x16
	.value	0x114
	.byte	0xb
	.long	0x3b2
	.byte	0x11
	.uleb128 0x17
	.long	.LASF506
	.byte	0x16
	.value	0x115
	.byte	0xb
	.long	0x3b2
	.byte	0x12
	.uleb128 0x17
	.long	.LASF484
	.byte	0x16
	.value	0x116
	.byte	0xb
	.long	0x3b2
	.byte	0x13
	.uleb128 0x15
	.string	"x"
	.byte	0x16
	.value	0x117
	.byte	0xc
	.long	0x3d6
	.byte	0x14
	.uleb128 0x15
	.string	"y"
	.byte	0x16
	.value	0x118
	.byte	0xc
	.long	0x3d6
	.byte	0x18
	.byte	0
	.uleb128 0x16
	.long	.LASF504
	.byte	0x16
	.value	0x119
	.byte	0x3
	.long	0x143c
	.uleb128 0x14
	.long	.LASF507
	.byte	0x1c
	.byte	0x16
	.value	0x11e
	.byte	0x10
	.long	0x154d
	.uleb128 0x17
	.long	.LASF479
	.byte	0x16
	.value	0x120
	.byte	0xc
	.long	0x3e2
	.byte	0
	.uleb128 0x17
	.long	.LASF480
	.byte	0x16
	.value	0x121
	.byte	0xc
	.long	0x3e2
	.byte	0x4
	.uleb128 0x17
	.long	.LASF489
	.byte	0x16
	.value	0x122
	.byte	0xc
	.long	0x3e2
	.byte	0x8
	.uleb128 0x17
	.long	.LASF501
	.byte	0x16
	.value	0x123
	.byte	0xc
	.long	0x3e2
	.byte	0xc
	.uleb128 0x15
	.string	"x"
	.byte	0x16
	.value	0x124
	.byte	0xc
	.long	0x3d6
	.byte	0x10
	.uleb128 0x15
	.string	"y"
	.byte	0x16
	.value	0x125
	.byte	0xc
	.long	0x3d6
	.byte	0x14
	.uleb128 0x17
	.long	.LASF508
	.byte	0x16
	.value	0x126
	.byte	0xc
	.long	0x3e2
	.byte	0x18
	.byte	0
	.uleb128 0x16
	.long	.LASF507
	.byte	0x16
	.value	0x127
	.byte	0x3
	.long	0x14e0
	.uleb128 0x14
	.long	.LASF509
	.byte	0x14
	.byte	0x16
	.value	0x12c
	.byte	0x10
	.long	0x15e7
	.uleb128 0x17
	.long	.LASF479
	.byte	0x16
	.value	0x12e
	.byte	0xc
	.long	0x3e2
	.byte	0
	.uleb128 0x17
	.long	.LASF480
	.byte	0x16
	.value	0x12f
	.byte	0xc
	.long	0x3e2
	.byte	0x4
	.uleb128 0x17
	.long	.LASF501
	.byte	0x16
	.value	0x130
	.byte	0x14
	.long	0xf88
	.byte	0x8
	.uleb128 0x17
	.long	.LASF510
	.byte	0x16
	.value	0x131
	.byte	0xb
	.long	0x3b2
	.byte	0xc
	.uleb128 0x17
	.long	.LASF484
	.byte	0x16
	.value	0x132
	.byte	0xb
	.long	0x3b2
	.byte	0xd
	.uleb128 0x17
	.long	.LASF485
	.byte	0x16
	.value	0x133
	.byte	0xb
	.long	0x3b2
	.byte	0xe
	.uleb128 0x17
	.long	.LASF486
	.byte	0x16
	.value	0x134
	.byte	0xb
	.long	0x3b2
	.byte	0xf
	.uleb128 0x17
	.long	.LASF511
	.byte	0x16
	.value	0x135
	.byte	0xc
	.long	0x3be
	.byte	0x10
	.uleb128 0x17
	.long	.LASF512
	.byte	0x16
	.value	0x136
	.byte	0xc
	.long	0x3ca
	.byte	0x12
	.byte	0
	.uleb128 0x16
	.long	.LASF509
	.byte	0x16
	.value	0x137
	.byte	0x3
	.long	0x155a
	.uleb128 0x14
	.long	.LASF513
	.byte	0x14
	.byte	0x16
	.value	0x13c
	.byte	0x10
	.long	0x1681
	.uleb128 0x17
	.long	.LASF479
	.byte	0x16
	.value	0x13e
	.byte	0xc
	.long	0x3e2
	.byte	0
	.uleb128 0x17
	.long	.LASF480
	.byte	0x16
	.value	0x13f
	.byte	0xc
	.long	0x3e2
	.byte	0x4
	.uleb128 0x17
	.long	.LASF501
	.byte	0x16
	.value	0x140
	.byte	0x14
	.long	0xf88
	.byte	0x8
	.uleb128 0x17
	.long	.LASF514
	.byte	0x16
	.value	0x141
	.byte	0xb
	.long	0x3b2
	.byte	0xc
	.uleb128 0x17
	.long	.LASF484
	.byte	0x16
	.value	0x142
	.byte	0xb
	.long	0x3b2
	.byte	0xd
	.uleb128 0x17
	.long	.LASF485
	.byte	0x16
	.value	0x143
	.byte	0xb
	.long	0x3b2
	.byte	0xe
	.uleb128 0x17
	.long	.LASF486
	.byte	0x16
	.value	0x144
	.byte	0xb
	.long	0x3b2
	.byte	0xf
	.uleb128 0x17
	.long	.LASF502
	.byte	0x16
	.value	0x145
	.byte	0xc
	.long	0x3be
	.byte	0x10
	.uleb128 0x17
	.long	.LASF503
	.byte	0x16
	.value	0x146
	.byte	0xc
	.long	0x3be
	.byte	0x12
	.byte	0
	.uleb128 0x16
	.long	.LASF513
	.byte	0x16
	.value	0x147
	.byte	0x3
	.long	0x15f4
	.uleb128 0x14
	.long	.LASF515
	.byte	0x10
	.byte	0x16
	.value	0x14c
	.byte	0x10
	.long	0x16ff
	.uleb128 0x17
	.long	.LASF479
	.byte	0x16
	.value	0x14e
	.byte	0xc
	.long	0x3e2
	.byte	0
	.uleb128 0x17
	.long	.LASF480
	.byte	0x16
	.value	0x14f
	.byte	0xc
	.long	0x3e2
	.byte	0x4
	.uleb128 0x17
	.long	.LASF501
	.byte	0x16
	.value	0x150
	.byte	0x14
	.long	0xf88
	.byte	0x8
	.uleb128 0x15
	.string	"hat"
	.byte	0x16
	.value	0x151
	.byte	0xb
	.long	0x3b2
	.byte	0xc
	.uleb128 0x17
	.long	.LASF511
	.byte	0x16
	.value	0x152
	.byte	0xb
	.long	0x3b2
	.byte	0xd
	.uleb128 0x17
	.long	.LASF484
	.byte	0x16
	.value	0x159
	.byte	0xb
	.long	0x3b2
	.byte	0xe
	.uleb128 0x17
	.long	.LASF485
	.byte	0x16
	.value	0x15a
	.byte	0xb
	.long	0x3b2
	.byte	0xf
	.byte	0
	.uleb128 0x16
	.long	.LASF515
	.byte	0x16
	.value	0x15b
	.byte	0x3
	.long	0x168e
	.uleb128 0x14
	.long	.LASF516
	.byte	0x10
	.byte	0x16
	.value	0x160
	.byte	0x10
	.long	0x177d
	.uleb128 0x17
	.long	.LASF479
	.byte	0x16
	.value	0x162
	.byte	0xc
	.long	0x3e2
	.byte	0
	.uleb128 0x17
	.long	.LASF480
	.byte	0x16
	.value	0x163
	.byte	0xc
	.long	0x3e2
	.byte	0x4
	.uleb128 0x17
	.long	.LASF501
	.byte	0x16
	.value	0x164
	.byte	0x14
	.long	0xf88
	.byte	0x8
	.uleb128 0x17
	.long	.LASF505
	.byte	0x16
	.value	0x165
	.byte	0xb
	.long	0x3b2
	.byte	0xc
	.uleb128 0x17
	.long	.LASF492
	.byte	0x16
	.value	0x166
	.byte	0xb
	.long	0x3b2
	.byte	0xd
	.uleb128 0x17
	.long	.LASF484
	.byte	0x16
	.value	0x167
	.byte	0xb
	.long	0x3b2
	.byte	0xe
	.uleb128 0x17
	.long	.LASF485
	.byte	0x16
	.value	0x168
	.byte	0xb
	.long	0x3b2
	.byte	0xf
	.byte	0
	.uleb128 0x16
	.long	.LASF516
	.byte	0x16
	.value	0x169
	.byte	0x3
	.long	0x170c
	.uleb128 0x14
	.long	.LASF517
	.byte	0xc
	.byte	0x16
	.value	0x16e
	.byte	0x10
	.long	0x17c3
	.uleb128 0x17
	.long	.LASF479
	.byte	0x16
	.value	0x170
	.byte	0xc
	.long	0x3e2
	.byte	0
	.uleb128 0x17
	.long	.LASF480
	.byte	0x16
	.value	0x171
	.byte	0xc
	.long	0x3e2
	.byte	0x4
	.uleb128 0x17
	.long	.LASF501
	.byte	0x16
	.value	0x172
	.byte	0xc
	.long	0x3d6
	.byte	0x8
	.byte	0
	.uleb128 0x16
	.long	.LASF517
	.byte	0x16
	.value	0x173
	.byte	0x3
	.long	0x178a
	.uleb128 0x14
	.long	.LASF518
	.byte	0x14
	.byte	0x16
	.value	0x179
	.byte	0x10
	.long	0x185d
	.uleb128 0x17
	.long	.LASF479
	.byte	0x16
	.value	0x17b
	.byte	0xc
	.long	0x3e2
	.byte	0
	.uleb128 0x17
	.long	.LASF480
	.byte	0x16
	.value	0x17c
	.byte	0xc
	.long	0x3e2
	.byte	0x4
	.uleb128 0x17
	.long	.LASF501
	.byte	0x16
	.value	0x17d
	.byte	0x14
	.long	0xf88
	.byte	0x8
	.uleb128 0x17
	.long	.LASF510
	.byte	0x16
	.value	0x17e
	.byte	0xb
	.long	0x3b2
	.byte	0xc
	.uleb128 0x17
	.long	.LASF484
	.byte	0x16
	.value	0x17f
	.byte	0xb
	.long	0x3b2
	.byte	0xd
	.uleb128 0x17
	.long	.LASF485
	.byte	0x16
	.value	0x180
	.byte	0xb
	.long	0x3b2
	.byte	0xe
	.uleb128 0x17
	.long	.LASF486
	.byte	0x16
	.value	0x181
	.byte	0xb
	.long	0x3b2
	.byte	0xf
	.uleb128 0x17
	.long	.LASF511
	.byte	0x16
	.value	0x182
	.byte	0xc
	.long	0x3be
	.byte	0x10
	.uleb128 0x17
	.long	.LASF512
	.byte	0x16
	.value	0x183
	.byte	0xc
	.long	0x3ca
	.byte	0x12
	.byte	0
	.uleb128 0x16
	.long	.LASF518
	.byte	0x16
	.value	0x184
	.byte	0x3
	.long	0x17d0
	.uleb128 0x14
	.long	.LASF519
	.byte	0x10
	.byte	0x16
	.value	0x18a
	.byte	0x10
	.long	0x18db
	.uleb128 0x17
	.long	.LASF479
	.byte	0x16
	.value	0x18c
	.byte	0xc
	.long	0x3e2
	.byte	0
	.uleb128 0x17
	.long	.LASF480
	.byte	0x16
	.value	0x18d
	.byte	0xc
	.long	0x3e2
	.byte	0x4
	.uleb128 0x17
	.long	.LASF501
	.byte	0x16
	.value	0x18e
	.byte	0x14
	.long	0xf88
	.byte	0x8
	.uleb128 0x17
	.long	.LASF505
	.byte	0x16
	.value	0x18f
	.byte	0xb
	.long	0x3b2
	.byte	0xc
	.uleb128 0x17
	.long	.LASF492
	.byte	0x16
	.value	0x190
	.byte	0xb
	.long	0x3b2
	.byte	0xd
	.uleb128 0x17
	.long	.LASF484
	.byte	0x16
	.value	0x191
	.byte	0xb
	.long	0x3b2
	.byte	0xe
	.uleb128 0x17
	.long	.LASF485
	.byte	0x16
	.value	0x192
	.byte	0xb
	.long	0x3b2
	.byte	0xf
	.byte	0
	.uleb128 0x16
	.long	.LASF519
	.byte	0x16
	.value	0x193
	.byte	0x3
	.long	0x186a
	.uleb128 0x14
	.long	.LASF520
	.byte	0xc
	.byte	0x16
	.value	0x199
	.byte	0x10
	.long	0x1921
	.uleb128 0x17
	.long	.LASF479
	.byte	0x16
	.value	0x19b
	.byte	0xc
	.long	0x3e2
	.byte	0
	.uleb128 0x17
	.long	.LASF480
	.byte	0x16
	.value	0x19c
	.byte	0xc
	.long	0x3e2
	.byte	0x4
	.uleb128 0x17
	.long	.LASF501
	.byte	0x16
	.value	0x19d
	.byte	0xc
	.long	0x3d6
	.byte	0x8
	.byte	0
	.uleb128 0x16
	.long	.LASF520
	.byte	0x16
	.value	0x19e
	.byte	0x3
	.long	0x18e8
	.uleb128 0x14
	.long	.LASF521
	.byte	0x10
	.byte	0x16
	.value	0x1a3
	.byte	0x10
	.long	0x199f
	.uleb128 0x17
	.long	.LASF479
	.byte	0x16
	.value	0x1a5
	.byte	0xc
	.long	0x3e2
	.byte	0
	.uleb128 0x17
	.long	.LASF480
	.byte	0x16
	.value	0x1a6
	.byte	0xc
	.long	0x3e2
	.byte	0x4
	.uleb128 0x17
	.long	.LASF501
	.byte	0x16
	.value	0x1a7
	.byte	0xc
	.long	0x3e2
	.byte	0x8
	.uleb128 0x17
	.long	.LASF522
	.byte	0x16
	.value	0x1a8
	.byte	0xb
	.long	0x3b2
	.byte	0xc
	.uleb128 0x17
	.long	.LASF484
	.byte	0x16
	.value	0x1a9
	.byte	0xb
	.long	0x3b2
	.byte	0xd
	.uleb128 0x17
	.long	.LASF485
	.byte	0x16
	.value	0x1aa
	.byte	0xb
	.long	0x3b2
	.byte	0xe
	.uleb128 0x17
	.long	.LASF486
	.byte	0x16
	.value	0x1ab
	.byte	0xb
	.long	0x3b2
	.byte	0xf
	.byte	0
	.uleb128 0x16
	.long	.LASF521
	.byte	0x16
	.value	0x1ac
	.byte	0x3
	.long	0x192e
	.uleb128 0x14
	.long	.LASF523
	.byte	0x30
	.byte	0x16
	.value	0x1b2
	.byte	0x10
	.long	0x1a33
	.uleb128 0x17
	.long	.LASF479
	.byte	0x16
	.value	0x1b4
	.byte	0xc
	.long	0x3e2
	.byte	0
	.uleb128 0x17
	.long	.LASF480
	.byte	0x16
	.value	0x1b5
	.byte	0xc
	.long	0x3e2
	.byte	0x4
	.uleb128 0x17
	.long	.LASF524
	.byte	0x16
	.value	0x1b6
	.byte	0x11
	.long	0xf94
	.byte	0x8
	.uleb128 0x17
	.long	.LASF525
	.byte	0x16
	.value	0x1b7
	.byte	0x12
	.long	0xfa0
	.byte	0x10
	.uleb128 0x15
	.string	"x"
	.byte	0x16
	.value	0x1b8
	.byte	0xb
	.long	0x397
	.byte	0x18
	.uleb128 0x15
	.string	"y"
	.byte	0x16
	.value	0x1b9
	.byte	0xb
	.long	0x397
	.byte	0x1c
	.uleb128 0x15
	.string	"dx"
	.byte	0x16
	.value	0x1ba
	.byte	0xb
	.long	0x397
	.byte	0x20
	.uleb128 0x15
	.string	"dy"
	.byte	0x16
	.value	0x1bb
	.byte	0xb
	.long	0x397
	.byte	0x24
	.uleb128 0x17
	.long	.LASF526
	.byte	0x16
	.value	0x1bc
	.byte	0xb
	.long	0x397
	.byte	0x28
	.byte	0
	.uleb128 0x16
	.long	.LASF523
	.byte	0x16
	.value	0x1bd
	.byte	0x3
	.long	0x19ac
	.uleb128 0x14
	.long	.LASF527
	.byte	0x28
	.byte	0x16
	.value	0x1c3
	.byte	0x10
	.long	0x1ac9
	.uleb128 0x17
	.long	.LASF479
	.byte	0x16
	.value	0x1c5
	.byte	0xc
	.long	0x3e2
	.byte	0
	.uleb128 0x17
	.long	.LASF480
	.byte	0x16
	.value	0x1c6
	.byte	0xc
	.long	0x3e2
	.byte	0x4
	.uleb128 0x17
	.long	.LASF524
	.byte	0x16
	.value	0x1c7
	.byte	0x11
	.long	0xf94
	.byte	0x8
	.uleb128 0x17
	.long	.LASF528
	.byte	0x16
	.value	0x1c8
	.byte	0xb
	.long	0x397
	.byte	0x10
	.uleb128 0x17
	.long	.LASF529
	.byte	0x16
	.value	0x1c9
	.byte	0xb
	.long	0x397
	.byte	0x14
	.uleb128 0x15
	.string	"x"
	.byte	0x16
	.value	0x1ca
	.byte	0xb
	.long	0x397
	.byte	0x18
	.uleb128 0x15
	.string	"y"
	.byte	0x16
	.value	0x1cb
	.byte	0xb
	.long	0x397
	.byte	0x1c
	.uleb128 0x17
	.long	.LASF530
	.byte	0x16
	.value	0x1cc
	.byte	0xc
	.long	0x3ca
	.byte	0x20
	.uleb128 0x17
	.long	.LASF128
	.byte	0x16
	.value	0x1cd
	.byte	0xc
	.long	0x3ca
	.byte	0x22
	.byte	0
	.uleb128 0x16
	.long	.LASF527
	.byte	0x16
	.value	0x1ce
	.byte	0x3
	.long	0x1a40
	.uleb128 0x14
	.long	.LASF531
	.byte	0x28
	.byte	0x16
	.value	0x1d4
	.byte	0x10
	.long	0x1b51
	.uleb128 0x17
	.long	.LASF479
	.byte	0x16
	.value	0x1d6
	.byte	0xc
	.long	0x3e2
	.byte	0
	.uleb128 0x17
	.long	.LASF480
	.byte	0x16
	.value	0x1d7
	.byte	0xc
	.long	0x3e2
	.byte	0x4
	.uleb128 0x17
	.long	.LASF524
	.byte	0x16
	.value	0x1d8
	.byte	0x11
	.long	0xf94
	.byte	0x8
	.uleb128 0x17
	.long	.LASF532
	.byte	0x16
	.value	0x1d9
	.byte	0x13
	.long	0xfac
	.byte	0x10
	.uleb128 0x17
	.long	.LASF530
	.byte	0x16
	.value	0x1da
	.byte	0xc
	.long	0x3e2
	.byte	0x18
	.uleb128 0x17
	.long	.LASF533
	.byte	0x16
	.value	0x1db
	.byte	0xb
	.long	0x397
	.byte	0x1c
	.uleb128 0x15
	.string	"x"
	.byte	0x16
	.value	0x1dc
	.byte	0xb
	.long	0x397
	.byte	0x20
	.uleb128 0x15
	.string	"y"
	.byte	0x16
	.value	0x1dd
	.byte	0xb
	.long	0x397
	.byte	0x24
	.byte	0
	.uleb128 0x16
	.long	.LASF531
	.byte	0x16
	.value	0x1de
	.byte	0x3
	.long	0x1ad6
	.uleb128 0x14
	.long	.LASF534
	.byte	0x18
	.byte	0x16
	.value	0x1e6
	.byte	0x10
	.long	0x1ba5
	.uleb128 0x17
	.long	.LASF479
	.byte	0x16
	.value	0x1e8
	.byte	0xc
	.long	0x3e2
	.byte	0
	.uleb128 0x17
	.long	.LASF480
	.byte	0x16
	.value	0x1e9
	.byte	0xc
	.long	0x3e2
	.byte	0x4
	.uleb128 0x17
	.long	.LASF535
	.byte	0x16
	.value	0x1ea
	.byte	0xb
	.long	0xc7
	.byte	0x8
	.uleb128 0x17
	.long	.LASF489
	.byte	0x16
	.value	0x1eb
	.byte	0xc
	.long	0x3e2
	.byte	0x10
	.byte	0
	.uleb128 0x16
	.long	.LASF534
	.byte	0x16
	.value	0x1ec
	.byte	0x3
	.long	0x1b5e
	.uleb128 0x14
	.long	.LASF536
	.byte	0x24
	.byte	0x16
	.value	0x1f2
	.byte	0x10
	.long	0x1bf9
	.uleb128 0x17
	.long	.LASF479
	.byte	0x16
	.value	0x1f4
	.byte	0xc
	.long	0x3e2
	.byte	0
	.uleb128 0x17
	.long	.LASF480
	.byte	0x16
	.value	0x1f5
	.byte	0xc
	.long	0x3e2
	.byte	0x4
	.uleb128 0x17
	.long	.LASF501
	.byte	0x16
	.value	0x1f6
	.byte	0xc
	.long	0x3d6
	.byte	0x8
	.uleb128 0x17
	.long	.LASF537
	.byte	0x16
	.value	0x1f7
	.byte	0xb
	.long	0x1bf9
	.byte	0xc
	.byte	0
	.uleb128 0x8
	.long	0x397
	.long	0x1c09
	.uleb128 0x9
	.long	0x42
	.byte	0x5
	.byte	0
	.uleb128 0x16
	.long	.LASF536
	.byte	0x16
	.value	0x1f8
	.byte	0x3
	.long	0x1bb2
	.uleb128 0x14
	.long	.LASF538
	.byte	0x8
	.byte	0x16
	.value	0x1fd
	.byte	0x10
	.long	0x1c41
	.uleb128 0x17
	.long	.LASF479
	.byte	0x16
	.value	0x1ff
	.byte	0xc
	.long	0x3e2
	.byte	0
	.uleb128 0x17
	.long	.LASF480
	.byte	0x16
	.value	0x200
	.byte	0xc
	.long	0x3e2
	.byte	0x4
	.byte	0
	.uleb128 0x16
	.long	.LASF538
	.byte	0x16
	.value	0x201
	.byte	0x3
	.long	0x1c16
	.uleb128 0x14
	.long	.LASF539
	.byte	0x20
	.byte	0x16
	.value	0x20f
	.byte	0x10
	.long	0x1cb1
	.uleb128 0x17
	.long	.LASF479
	.byte	0x16
	.value	0x211
	.byte	0xc
	.long	0x3e2
	.byte	0
	.uleb128 0x17
	.long	.LASF480
	.byte	0x16
	.value	0x212
	.byte	0xc
	.long	0x3e2
	.byte	0x4
	.uleb128 0x17
	.long	.LASF489
	.byte	0x16
	.value	0x213
	.byte	0xc
	.long	0x3e2
	.byte	0x8
	.uleb128 0x17
	.long	.LASF540
	.byte	0x16
	.value	0x214
	.byte	0xc
	.long	0x3d6
	.byte	0xc
	.uleb128 0x17
	.long	.LASF487
	.byte	0x16
	.value	0x215
	.byte	0xb
	.long	0xc5
	.byte	0x10
	.uleb128 0x17
	.long	.LASF490
	.byte	0x16
	.value	0x216
	.byte	0xb
	.long	0xc5
	.byte	0x18
	.byte	0
	.uleb128 0x16
	.long	.LASF539
	.byte	0x16
	.value	0x217
	.byte	0x3
	.long	0x1c4e
	.uleb128 0x16
	.long	.LASF541
	.byte	0x16
	.value	0x21b
	.byte	0x1d
	.long	0x1ccb
	.uleb128 0xd
	.long	.LASF541
	.uleb128 0x14
	.long	.LASF542
	.byte	0x10
	.byte	0x16
	.value	0x223
	.byte	0x10
	.long	0x1d09
	.uleb128 0x17
	.long	.LASF479
	.byte	0x16
	.value	0x225
	.byte	0xc
	.long	0x3e2
	.byte	0
	.uleb128 0x17
	.long	.LASF480
	.byte	0x16
	.value	0x226
	.byte	0xc
	.long	0x3e2
	.byte	0x4
	.uleb128 0x15
	.string	"msg"
	.byte	0x16
	.value	0x227
	.byte	0x13
	.long	0x1d09
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x1cbe
	.uleb128 0x16
	.long	.LASF542
	.byte	0x16
	.value	0x228
	.byte	0x3
	.long	0x1cd0
	.uleb128 0x1a
	.long	.LASF565
	.byte	0x38
	.byte	0x16
	.value	0x22d
	.byte	0xf
	.long	0x1e97
	.uleb128 0x1b
	.long	.LASF479
	.byte	0x16
	.value	0x22f
	.byte	0xc
	.long	0x3e2
	.uleb128 0x1b
	.long	.LASF543
	.byte	0x16
	.value	0x230
	.byte	0x15
	.long	0x1153
	.uleb128 0x1b
	.long	.LASF482
	.byte	0x16
	.value	0x231
	.byte	0x16
	.long	0x11d5
	.uleb128 0x1b
	.long	.LASF544
	.byte	0x16
	.value	0x232
	.byte	0x15
	.long	0x1264
	.uleb128 0x1c
	.string	"key"
	.byte	0x16
	.value	0x233
	.byte	0x17
	.long	0x12e6
	.uleb128 0x1b
	.long	.LASF545
	.byte	0x16
	.value	0x234
	.byte	0x1a
	.long	0x134e
	.uleb128 0x1b
	.long	.LASF496
	.byte	0x16
	.value	0x235
	.byte	0x18
	.long	0x139c
	.uleb128 0x1b
	.long	.LASF546
	.byte	0x16
	.value	0x236
	.byte	0x1a
	.long	0x142f
	.uleb128 0x1b
	.long	.LASF505
	.byte	0x16
	.value	0x237
	.byte	0x1a
	.long	0x14d3
	.uleb128 0x1b
	.long	.LASF547
	.byte	0x16
	.value	0x238
	.byte	0x19
	.long	0x154d
	.uleb128 0x1b
	.long	.LASF548
	.byte	0x16
	.value	0x239
	.byte	0x16
	.long	0x15e7
	.uleb128 0x1b
	.long	.LASF549
	.byte	0x16
	.value	0x23a
	.byte	0x16
	.long	0x1681
	.uleb128 0x1b
	.long	.LASF550
	.byte	0x16
	.value	0x23b
	.byte	0x15
	.long	0x16ff
	.uleb128 0x1b
	.long	.LASF551
	.byte	0x16
	.value	0x23c
	.byte	0x18
	.long	0x177d
	.uleb128 0x1b
	.long	.LASF552
	.byte	0x16
	.value	0x23d
	.byte	0x18
	.long	0x17c3
	.uleb128 0x1b
	.long	.LASF553
	.byte	0x16
	.value	0x23e
	.byte	0x1d
	.long	0x185d
	.uleb128 0x1b
	.long	.LASF554
	.byte	0x16
	.value	0x23f
	.byte	0x1f
	.long	0x18db
	.uleb128 0x1b
	.long	.LASF555
	.byte	0x16
	.value	0x240
	.byte	0x1f
	.long	0x1921
	.uleb128 0x1b
	.long	.LASF556
	.byte	0x16
	.value	0x241
	.byte	0x1a
	.long	0x199f
	.uleb128 0x1b
	.long	.LASF557
	.byte	0x16
	.value	0x242
	.byte	0x15
	.long	0x1c09
	.uleb128 0x1b
	.long	.LASF558
	.byte	0x16
	.value	0x243
	.byte	0x13
	.long	0x1c41
	.uleb128 0x1b
	.long	.LASF559
	.byte	0x16
	.value	0x244
	.byte	0x13
	.long	0x1cb1
	.uleb128 0x1b
	.long	.LASF560
	.byte	0x16
	.value	0x245
	.byte	0x14
	.long	0x1d0f
	.uleb128 0x1b
	.long	.LASF561
	.byte	0x16
	.value	0x246
	.byte	0x1a
	.long	0x1a33
	.uleb128 0x1b
	.long	.LASF562
	.byte	0x16
	.value	0x247
	.byte	0x1b
	.long	0x1ac9
	.uleb128 0x1b
	.long	.LASF563
	.byte	0x16
	.value	0x248
	.byte	0x1c
	.long	0x1b51
	.uleb128 0x1b
	.long	.LASF564
	.byte	0x16
	.value	0x249
	.byte	0x13
	.long	0x1ba5
	.uleb128 0x1b
	.long	.LASF128
	.byte	0x16
	.value	0x252
	.byte	0xb
	.long	0x1e97
	.byte	0
	.uleb128 0x8
	.long	0x3b2
	.long	0x1ea7
	.uleb128 0x9
	.long	0x42
	.byte	0x37
	.byte	0
	.uleb128 0x16
	.long	.LASF565
	.byte	0x16
	.value	0x253
	.byte	0x3
	.long	0x1d1c
	.uleb128 0x11
	.byte	0x7
	.byte	0x4
	.long	0x3b
	.byte	0x17
	.byte	0x41
	.byte	0x1
	.long	0x1edb
	.uleb128 0x12
	.long	.LASF566
	.byte	0x1
	.uleb128 0x12
	.long	.LASF567
	.byte	0x2
	.uleb128 0x12
	.long	.LASF568
	.byte	0x4
	.uleb128 0x12
	.long	.LASF569
	.byte	0x8
	.byte	0
	.uleb128 0x11
	.byte	0x7
	.byte	0x4
	.long	0x3b
	.byte	0x17
	.byte	0x5c
	.byte	0x1
	.long	0x1efc
	.uleb128 0x12
	.long	.LASF570
	.byte	0
	.uleb128 0x12
	.long	.LASF571
	.byte	0x1
	.uleb128 0x12
	.long	.LASF572
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.long	.LASF573
	.byte	0x17
	.byte	0x7a
	.byte	0x1d
	.long	0x1f08
	.uleb128 0xd
	.long	.LASF573
	.uleb128 0x3
	.long	.LASF574
	.byte	0x17
	.byte	0x80
	.byte	0x1c
	.long	0x1f19
	.uleb128 0xd
	.long	.LASF574
	.uleb128 0x8
	.long	0xc7
	.long	0x1f2e
	.uleb128 0x9
	.long	0x42
	.byte	0x1
	.byte	0
	.uleb128 0xe
	.long	.LASF575
	.byte	0x18
	.byte	0x9f
	.byte	0xe
	.long	0x1f1e
	.uleb128 0xe
	.long	.LASF576
	.byte	0x18
	.byte	0xa0
	.byte	0xc
	.long	0x87
	.uleb128 0xe
	.long	.LASF577
	.byte	0x18
	.byte	0xa1
	.byte	0x11
	.long	0xa6
	.uleb128 0xe
	.long	.LASF578
	.byte	0x18
	.byte	0xa6
	.byte	0xe
	.long	0x1f1e
	.uleb128 0xe
	.long	.LASF579
	.byte	0x18
	.byte	0xae
	.byte	0xc
	.long	0x87
	.uleb128 0xe
	.long	.LASF580
	.byte	0x18
	.byte	0xaf
	.byte	0x11
	.long	0xa6
	.uleb128 0xa
	.long	.LASF581
	.byte	0x18
	.byte	0x19
	.byte	0x35
	.byte	0x10
	.long	0x1fab
	.uleb128 0xb
	.long	.LASF582
	.byte	0x19
	.byte	0x37
	.byte	0xf
	.long	0x1fab
	.byte	0
	.uleb128 0xb
	.long	.LASF583
	.byte	0x19
	.byte	0x38
	.byte	0xe
	.long	0x1fb1
	.byte	0x8
	.uleb128 0xb
	.long	.LASF584
	.byte	0x19
	.byte	0x39
	.byte	0xe
	.long	0x1fb1
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x38b
	.uleb128 0x6
	.byte	0x8
	.long	0x373
	.uleb128 0x3
	.long	.LASF585
	.byte	0x19
	.byte	0x3b
	.byte	0x3
	.long	0x1f76
	.uleb128 0x1d
	.long	.LASF601
	.byte	0x1
	.byte	0x63
	.byte	0x6
	.quad	.LFB4049
	.quad	.LFE4049-.LFB4049
	.uleb128 0x1
	.byte	0x9c
	.long	0x1fff
	.uleb128 0x1e
	.long	.LASF586
	.byte	0x1
	.byte	0x63
	.byte	0x13
	.long	0x87
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1f
	.string	"ms"
	.byte	0x1
	.byte	0x65
	.byte	0x8
	.long	0x397
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x20
	.long	.LASF587
	.byte	0x1
	.byte	0x5e
	.byte	0x5
	.long	0x87
	.quad	.LFB4048
	.quad	.LFE4048-.LFB4048
	.uleb128 0x1
	.byte	0x9c
	.long	0x2031
	.uleb128 0x1e
	.long	.LASF586
	.byte	0x1
	.byte	0x5e
	.byte	0x1c
	.long	0x87
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x21
	.long	.LASF588
	.byte	0x1
	.byte	0x12
	.byte	0x5
	.long	0x87
	.quad	.LFB4047
	.quad	.LFE4047-.LFB4047
	.uleb128 0x1
	.byte	0x9c
	.long	0x2124
	.uleb128 0x1e
	.long	.LASF589
	.byte	0x1
	.byte	0x12
	.byte	0xe
	.long	0x87
	.uleb128 0x3
	.byte	0x91
	.sleb128 -148
	.uleb128 0x1e
	.long	.LASF590
	.byte	0x1
	.byte	0x12
	.byte	0x1b
	.long	0x3fa
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x22
	.long	.LASF544
	.byte	0x1
	.byte	0x14
	.byte	0xe
	.long	0x935
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x22
	.long	.LASF591
	.byte	0x1
	.byte	0x15
	.byte	0xf
	.long	0x2124
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x22
	.long	.LASF592
	.byte	0x1
	.byte	0x16
	.byte	0xd
	.long	0x212a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x23
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x22
	.long	.LASF593
	.byte	0x1
	.byte	0x20
	.byte	0x11
	.long	0x2130
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x22
	.long	.LASF594
	.byte	0x1
	.byte	0x21
	.byte	0x10
	.long	0x2136
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x22
	.long	.LASF595
	.byte	0x1
	.byte	0x22
	.byte	0x9
	.long	0xc7
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x22
	.long	.LASF586
	.byte	0x1
	.byte	0x23
	.byte	0x7
	.long	0x87
	.uleb128 0x3
	.byte	0x91
	.sleb128 -140
	.uleb128 0x22
	.long	.LASF558
	.byte	0x1
	.byte	0x32
	.byte	0x7
	.long	0x87
	.uleb128 0x3
	.byte	0x91
	.sleb128 -132
	.uleb128 0x1f
	.string	"e"
	.byte	0x1
	.byte	0x33
	.byte	0xd
	.long	0x1ea7
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x22
	.long	.LASF596
	.byte	0x1
	.byte	0x34
	.byte	0x7
	.long	0x87
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x874
	.uleb128 0x6
	.byte	0x8
	.long	0x1fb7
	.uleb128 0x6
	.byte	0x8
	.long	0x1efc
	.uleb128 0x6
	.byte	0x8
	.long	0x1f0d
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x17
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF323:
	.string	"SDL_SCANCODE_CANCEL"
.LASF75:
	.string	"SDL_PIXELFORMAT_INDEX1MSB"
.LASF483:
	.string	"event"
.LASF219:
	.string	"SDL_SCANCODE_RIGHTBRACKET"
.LASF50:
	.string	"_unused2"
.LASF553:
	.string	"caxis"
.LASF36:
	.string	"_fileno"
.LASF585:
	.string	"Chip8_out"
.LASF299:
	.string	"SDL_SCANCODE_VOLUMEUP"
.LASF478:
	.string	"SDL_CommonEvent"
.LASF455:
	.string	"SDL_CONTROLLERBUTTONDOWN"
.LASF523:
	.string	"SDL_TouchFingerEvent"
.LASF379:
	.string	"SDL_SCANCODE_LCTRL"
.LASF5:
	.string	"__uint8_t"
.LASF140:
	.string	"Ashift"
.LASF416:
	.string	"SDL_SCANCODE_AUDIOFASTFORWARD"
.LASF362:
	.string	"SDL_SCANCODE_KP_SPACE"
.LASF156:
	.string	"SDL_WINDOW_HIDDEN"
.LASF174:
	.string	"SDL_SCANCODE_UNKNOWN"
.LASF341:
	.string	"SDL_SCANCODE_KP_LEFTBRACE"
.LASF148:
	.string	"locked"
.LASF451:
	.string	"SDL_JOYBUTTONUP"
.LASF543:
	.string	"common"
.LASF41:
	.string	"_shortbuf"
.LASF529:
	.string	"dDist"
.LASF432:
	.string	"SDL_APP_DIDENTERBACKGROUND"
.LASF83:
	.string	"SDL_PIXELFORMAT_ARGB4444"
.LASF550:
	.string	"jhat"
.LASF574:
	.string	"SDL_Texture"
.LASF551:
	.string	"jbutton"
.LASF62:
	.string	"uint16_t"
.LASF386:
	.string	"SDL_SCANCODE_RGUI"
.LASF22:
	.string	"_flags"
.LASF141:
	.string	"next"
.LASF248:
	.string	"SDL_SCANCODE_END"
.LASF211:
	.string	"SDL_SCANCODE_RETURN"
.LASF471:
	.string	"SDL_AUDIODEVICEADDED"
.LASF13:
	.string	"__off_t"
.LASF272:
	.string	"SDL_SCANCODE_APPLICATION"
.LASF355:
	.string	"SDL_SCANCODE_KP_GREATER"
.LASF427:
	.string	"SDL_FIRSTEVENT"
.LASF132:
	.string	"Amask"
.LASF418:
	.string	"SDL_Scancode"
.LASF42:
	.string	"_lock"
.LASF442:
	.string	"SDL_KEYMAPCHANGED"
.LASF594:
	.string	"texture"
.LASF393:
	.string	"SDL_SCANCODE_MEDIASELECT"
.LASF544:
	.string	"window"
.LASF18:
	.string	"int32_t"
.LASF127:
	.string	"BytesPerPixel"
.LASF241:
	.string	"SDL_SCANCODE_PRINTSCREEN"
.LASF105:
	.string	"SDL_PIXELFORMAT_ARGB32"
.LASF474:
	.string	"SDL_RENDER_TARGETS_RESET"
.LASF252:
	.string	"SDL_SCANCODE_DOWN"
.LASF401:
	.string	"SDL_SCANCODE_AC_FORWARD"
.LASF437:
	.string	"SDL_SYSWMEVENT"
.LASF390:
	.string	"SDL_SCANCODE_AUDIOSTOP"
.LASF331:
	.string	"SDL_SCANCODE_CRSEL"
.LASF587:
	.string	"timer_clock_cycles"
.LASF287:
	.string	"SDL_SCANCODE_EXECUTE"
.LASF506:
	.string	"clicks"
.LASF169:
	.string	"SDL_WINDOW_SKIP_TASKBAR"
.LASF273:
	.string	"SDL_SCANCODE_POWER"
.LASF28:
	.string	"_IO_write_end"
.LASF168:
	.string	"SDL_WINDOW_ALWAYS_ON_TOP"
.LASF357:
	.string	"SDL_SCANCODE_KP_DBLAMPERSAND"
.LASF586:
	.string	"clockspeed"
.LASF387:
	.string	"SDL_SCANCODE_MODE"
.LASF552:
	.string	"jdevice"
.LASF98:
	.string	"SDL_PIXELFORMAT_BGRX8888"
.LASF575:
	.string	"__tzname"
.LASF568:
	.string	"SDL_RENDERER_PRESENTVSYNC"
.LASF119:
	.string	"ncolors"
.LASF229:
	.string	"SDL_SCANCODE_F1"
.LASF90:
	.string	"SDL_PIXELFORMAT_BGRA5551"
.LASF231:
	.string	"SDL_SCANCODE_F3"
.LASF232:
	.string	"SDL_SCANCODE_F4"
.LASF233:
	.string	"SDL_SCANCODE_F5"
.LASF234:
	.string	"SDL_SCANCODE_F6"
.LASF235:
	.string	"SDL_SCANCODE_F7"
.LASF236:
	.string	"SDL_SCANCODE_F8"
.LASF237:
	.string	"SDL_SCANCODE_F9"
.LASF353:
	.string	"SDL_SCANCODE_KP_PERCENT"
.LASF473:
	.string	"SDL_SENSORUPDATE"
.LASF153:
	.string	"SDL_WINDOW_FULLSCREEN"
.LASF382:
	.string	"SDL_SCANCODE_LGUI"
.LASF82:
	.string	"SDL_PIXELFORMAT_BGR555"
.LASF522:
	.string	"iscapture"
.LASF410:
	.string	"SDL_SCANCODE_KBDILLUMUP"
.LASF397:
	.string	"SDL_SCANCODE_COMPUTER"
.LASF79:
	.string	"SDL_PIXELFORMAT_RGB332"
.LASF300:
	.string	"SDL_SCANCODE_VOLUMEDOWN"
.LASF573:
	.string	"SDL_Renderer"
.LASF396:
	.string	"SDL_SCANCODE_CALCULATOR"
.LASF92:
	.string	"SDL_PIXELFORMAT_BGR565"
.LASF548:
	.string	"jaxis"
.LASF479:
	.string	"type"
.LASF524:
	.string	"touchId"
.LASF59:
	.string	"sys_errlist"
.LASF146:
	.string	"pixels"
.LASF579:
	.string	"daylight"
.LASF6:
	.string	"__int16_t"
.LASF8:
	.string	"__uint16_t"
.LASF242:
	.string	"SDL_SCANCODE_SCROLLLOCK"
.LASF500:
	.string	"SDL_MouseMotionEvent"
.LASF208:
	.string	"SDL_SCANCODE_8"
.LASF85:
	.string	"SDL_PIXELFORMAT_ABGR4444"
.LASF454:
	.string	"SDL_CONTROLLERAXISMOTION"
.LASF258:
	.string	"SDL_SCANCODE_KP_PLUS"
.LASF509:
	.string	"SDL_JoyAxisEvent"
.LASF470:
	.string	"SDL_DROPCOMPLETE"
.LASF420:
	.string	"SDL_Keysym"
.LASF128:
	.string	"padding"
.LASF225:
	.string	"SDL_SCANCODE_COMMA"
.LASF532:
	.string	"gestureId"
.LASF35:
	.string	"_chain"
.LASF329:
	.string	"SDL_SCANCODE_OPER"
.LASF100:
	.string	"SDL_PIXELFORMAT_RGBA8888"
.LASF199:
	.string	"SDL_SCANCODE_Y"
.LASF343:
	.string	"SDL_SCANCODE_KP_TAB"
.LASF599:
	.string	"/home/hunter/Chip-8_Emulator"
.LASF378:
	.string	"SDL_SCANCODE_KP_HEXADECIMAL"
.LASF565:
	.string	"SDL_Event"
.LASF508:
	.string	"direction"
.LASF228:
	.string	"SDL_SCANCODE_CAPSLOCK"
.LASF453:
	.string	"SDL_JOYDEVICEREMOVED"
.LASF562:
	.string	"mgesture"
.LASF0:
	.string	"unsigned char"
.LASF296:
	.string	"SDL_SCANCODE_PASTE"
.LASF582:
	.string	"vram"
.LASF440:
	.string	"SDL_TEXTEDITING"
.LASF438:
	.string	"SDL_KEYDOWN"
.LASF173:
	.string	"SDL_WINDOW_VULKAN"
.LASF600:
	.string	"_IO_lock_t"
.LASF64:
	.string	"float"
.LASF439:
	.string	"SDL_KEYUP"
.LASF253:
	.string	"SDL_SCANCODE_UP"
.LASF534:
	.string	"SDL_DropEvent"
.LASF558:
	.string	"quit"
.LASF254:
	.string	"SDL_SCANCODE_NUMLOCKCLEAR"
.LASF402:
	.string	"SDL_SCANCODE_AC_STOP"
.LASF361:
	.string	"SDL_SCANCODE_KP_HASH"
.LASF135:
	.string	"Bloss"
.LASF436:
	.string	"SDL_WINDOWEVENT"
.LASF502:
	.string	"xrel"
.LASF117:
	.string	"SDL_Color"
.LASF403:
	.string	"SDL_SCANCODE_AC_REFRESH"
.LASF133:
	.string	"Rloss"
.LASF312:
	.string	"SDL_SCANCODE_LANG1"
.LASF313:
	.string	"SDL_SCANCODE_LANG2"
.LASF314:
	.string	"SDL_SCANCODE_LANG3"
.LASF315:
	.string	"SDL_SCANCODE_LANG4"
.LASF316:
	.string	"SDL_SCANCODE_LANG5"
.LASF317:
	.string	"SDL_SCANCODE_LANG6"
.LASF318:
	.string	"SDL_SCANCODE_LANG7"
.LASF319:
	.string	"SDL_SCANCODE_LANG8"
.LASF320:
	.string	"SDL_SCANCODE_LANG9"
.LASF592:
	.string	"Chip8out"
.LASF525:
	.string	"fingerId"
.LASF110:
	.string	"SDL_PIXELFORMAT_YUY2"
.LASF434:
	.string	"SDL_APP_DIDENTERFOREGROUND"
.LASF80:
	.string	"SDL_PIXELFORMAT_RGB444"
.LASF328:
	.string	"SDL_SCANCODE_OUT"
.LASF359:
	.string	"SDL_SCANCODE_KP_DBLVERTICALBAR"
.LASF27:
	.string	"_IO_write_ptr"
.LASF358:
	.string	"SDL_SCANCODE_KP_VERTICALBAR"
.LASF377:
	.string	"SDL_SCANCODE_KP_DECIMAL"
.LASF214:
	.string	"SDL_SCANCODE_TAB"
.LASF249:
	.string	"SDL_SCANCODE_PAGEDOWN"
.LASF338:
	.string	"SDL_SCANCODE_CURRENCYSUBUNIT"
.LASF431:
	.string	"SDL_APP_WILLENTERBACKGROUND"
.LASF384:
	.string	"SDL_SCANCODE_RSHIFT"
.LASF376:
	.string	"SDL_SCANCODE_KP_OCTAL"
.LASF256:
	.string	"SDL_SCANCODE_KP_MULTIPLY"
.LASF161:
	.string	"SDL_WINDOW_INPUT_GRABBED"
.LASF330:
	.string	"SDL_SCANCODE_CLEARAGAIN"
.LASF406:
	.string	"SDL_SCANCODE_BRIGHTNESSUP"
.LASF555:
	.string	"cdevice"
.LASF123:
	.string	"SDL_PixelFormat"
.LASF493:
	.string	"repeat"
.LASF270:
	.string	"SDL_SCANCODE_KP_PERIOD"
.LASF171:
	.string	"SDL_WINDOW_TOOLTIP"
.LASF158:
	.string	"SDL_WINDOW_RESIZABLE"
.LASF389:
	.string	"SDL_SCANCODE_AUDIOPREV"
.LASF159:
	.string	"SDL_WINDOW_MINIMIZED"
.LASF475:
	.string	"SDL_RENDER_DEVICE_RESET"
.LASF257:
	.string	"SDL_SCANCODE_KP_MINUS"
.LASF213:
	.string	"SDL_SCANCODE_BACKSPACE"
.LASF68:
	.string	"Sint16"
.LASF51:
	.string	"FILE"
.LASF472:
	.string	"SDL_AUDIODEVICEREMOVED"
.LASF163:
	.string	"SDL_WINDOW_MOUSE_FOCUS"
.LASF385:
	.string	"SDL_SCANCODE_RALT"
.LASF516:
	.string	"SDL_JoyButtonEvent"
.LASF476:
	.string	"SDL_USEREVENT"
.LASF16:
	.string	"size_t"
.LASF289:
	.string	"SDL_SCANCODE_MENU"
.LASF76:
	.string	"SDL_PIXELFORMAT_INDEX4LSB"
.LASF61:
	.string	"uint8_t"
.LASF564:
	.string	"drop"
.LASF297:
	.string	"SDL_SCANCODE_FIND"
.LASF422:
	.string	"unused"
.LASF278:
	.string	"SDL_SCANCODE_F16"
.LASF70:
	.string	"Sint32"
.LASF165:
	.string	"SDL_WINDOW_FOREIGN"
.LASF504:
	.string	"SDL_MouseButtonEvent"
.LASF302:
	.string	"SDL_SCANCODE_KP_EQUALSAS400"
.LASF31:
	.string	"_IO_save_base"
.LASF250:
	.string	"SDL_SCANCODE_RIGHT"
.LASF166:
	.string	"SDL_WINDOW_ALLOW_HIGHDPI"
.LASF125:
	.string	"palette"
.LASF457:
	.string	"SDL_CONTROLLERDEVICEADDED"
.LASF375:
	.string	"SDL_SCANCODE_KP_BINARY"
.LASF545:
	.string	"edit"
.LASF399:
	.string	"SDL_SCANCODE_AC_HOME"
.LASF510:
	.string	"axis"
.LASF584:
	.string	"sound_timer"
.LASF131:
	.string	"Bmask"
.LASF325:
	.string	"SDL_SCANCODE_PRIOR"
.LASF215:
	.string	"SDL_SCANCODE_SPACE"
.LASF535:
	.string	"file"
.LASF496:
	.string	"text"
.LASF540:
	.string	"code"
.LASF583:
	.string	"delay_timer"
.LASF45:
	.string	"_wide_data"
.LASF112:
	.string	"SDL_PIXELFORMAT_YVYU"
.LASF290:
	.string	"SDL_SCANCODE_SELECT"
.LASF129:
	.string	"Rmask"
.LASF137:
	.string	"Rshift"
.LASF392:
	.string	"SDL_SCANCODE_AUDIOMUTE"
.LASF388:
	.string	"SDL_SCANCODE_AUDIONEXT"
.LASF469:
	.string	"SDL_DROPBEGIN"
.LASF373:
	.string	"SDL_SCANCODE_KP_CLEAR"
.LASF570:
	.string	"SDL_TEXTUREACCESS_STATIC"
.LASF366:
	.string	"SDL_SCANCODE_KP_MEMRECALL"
.LASF81:
	.string	"SDL_PIXELFORMAT_RGB555"
.LASF72:
	.string	"Sint64"
.LASF66:
	.string	"signgam"
.LASF243:
	.string	"SDL_SCANCODE_PAUSE"
.LASF480:
	.string	"timestamp"
.LASF210:
	.string	"SDL_SCANCODE_0"
.LASF201:
	.string	"SDL_SCANCODE_1"
.LASF202:
	.string	"SDL_SCANCODE_2"
.LASF203:
	.string	"SDL_SCANCODE_3"
.LASF204:
	.string	"SDL_SCANCODE_4"
.LASF205:
	.string	"SDL_SCANCODE_5"
.LASF206:
	.string	"SDL_SCANCODE_6"
.LASF207:
	.string	"SDL_SCANCODE_7"
.LASF11:
	.string	"__int64_t"
.LASF209:
	.string	"SDL_SCANCODE_9"
.LASF122:
	.string	"refcount"
.LASF511:
	.string	"value"
.LASF175:
	.string	"SDL_SCANCODE_A"
.LASF176:
	.string	"SDL_SCANCODE_B"
.LASF177:
	.string	"SDL_SCANCODE_C"
.LASF178:
	.string	"SDL_SCANCODE_D"
.LASF179:
	.string	"SDL_SCANCODE_E"
.LASF180:
	.string	"SDL_SCANCODE_F"
.LASF181:
	.string	"SDL_SCANCODE_G"
.LASF182:
	.string	"SDL_SCANCODE_H"
.LASF183:
	.string	"SDL_SCANCODE_I"
.LASF184:
	.string	"SDL_SCANCODE_J"
.LASF185:
	.string	"SDL_SCANCODE_K"
.LASF186:
	.string	"SDL_SCANCODE_L"
.LASF187:
	.string	"SDL_SCANCODE_M"
.LASF188:
	.string	"SDL_SCANCODE_N"
.LASF189:
	.string	"SDL_SCANCODE_O"
.LASF190:
	.string	"SDL_SCANCODE_P"
.LASF191:
	.string	"SDL_SCANCODE_Q"
.LASF192:
	.string	"SDL_SCANCODE_R"
.LASF193:
	.string	"SDL_SCANCODE_S"
.LASF194:
	.string	"SDL_SCANCODE_T"
.LASF195:
	.string	"SDL_SCANCODE_U"
.LASF196:
	.string	"SDL_SCANCODE_V"
.LASF197:
	.string	"SDL_SCANCODE_W"
.LASF198:
	.string	"SDL_SCANCODE_X"
.LASF91:
	.string	"SDL_PIXELFORMAT_RGB565"
.LASF200:
	.string	"SDL_SCANCODE_Z"
.LASF99:
	.string	"SDL_PIXELFORMAT_ARGB8888"
.LASF96:
	.string	"SDL_PIXELFORMAT_RGBX8888"
.LASF398:
	.string	"SDL_SCANCODE_AC_SEARCH"
.LASF113:
	.string	"SDL_PIXELFORMAT_NV12"
.LASF477:
	.string	"SDL_LASTEVENT"
.LASF322:
	.string	"SDL_SCANCODE_SYSREQ"
.LASF419:
	.string	"SDL_Keycode"
.LASF88:
	.string	"SDL_PIXELFORMAT_RGBA5551"
.LASF126:
	.string	"BitsPerPixel"
.LASF340:
	.string	"SDL_SCANCODE_KP_RIGHTPAREN"
.LASF381:
	.string	"SDL_SCANCODE_LALT"
.LASF77:
	.string	"SDL_PIXELFORMAT_INDEX4MSB"
.LASF145:
	.string	"pitch"
.LASF167:
	.string	"SDL_WINDOW_MOUSE_CAPTURE"
.LASF114:
	.string	"SDL_PIXELFORMAT_NV21"
.LASF139:
	.string	"Bshift"
.LASF464:
	.string	"SDL_DOLLARRECORD"
.LASF344:
	.string	"SDL_SCANCODE_KP_BACKSPACE"
.LASF445:
	.string	"SDL_MOUSEBUTTONUP"
.LASF528:
	.string	"dTheta"
.LASF448:
	.string	"SDL_JOYBALLMOTION"
.LASF577:
	.string	"__timezone"
.LASF334:
	.string	"SDL_SCANCODE_KP_000"
.LASF547:
	.string	"wheel"
.LASF333:
	.string	"SDL_SCANCODE_KP_00"
.LASF539:
	.string	"SDL_UserEvent"
.LASF147:
	.string	"userdata"
.LASF226:
	.string	"SDL_SCANCODE_PERIOD"
.LASF466:
	.string	"SDL_CLIPBOARDUPDATE"
.LASF57:
	.string	"stderr"
.LASF33:
	.string	"_IO_save_end"
.LASF103:
	.string	"SDL_PIXELFORMAT_ARGB2101010"
.LASF549:
	.string	"jball"
.LASF93:
	.string	"SDL_PIXELFORMAT_RGB24"
.LASF404:
	.string	"SDL_SCANCODE_AC_BOOKMARKS"
.LASF335:
	.string	"SDL_SCANCODE_THOUSANDSSEPARATOR"
.LASF411:
	.string	"SDL_SCANCODE_EJECT"
.LASF56:
	.string	"stdout"
.LASF172:
	.string	"SDL_WINDOW_POPUP_MENU"
.LASF601:
	.string	"delay_ms"
.LASF78:
	.string	"SDL_PIXELFORMAT_INDEX8"
.LASF97:
	.string	"SDL_PIXELFORMAT_BGR888"
.LASF292:
	.string	"SDL_SCANCODE_AGAIN"
.LASF428:
	.string	"SDL_QUIT"
.LASF380:
	.string	"SDL_SCANCODE_LSHIFT"
.LASF567:
	.string	"SDL_RENDERER_ACCELERATED"
.LASF223:
	.string	"SDL_SCANCODE_APOSTROPHE"
.LASF295:
	.string	"SDL_SCANCODE_COPY"
.LASF501:
	.string	"which"
.LASF513:
	.string	"SDL_JoyBallEvent"
.LASF17:
	.string	"int16_t"
.LASF1:
	.string	"short unsigned int"
.LASF4:
	.string	"signed char"
.LASF465:
	.string	"SDL_MULTIGESTURE"
.LASF497:
	.string	"start"
.LASF571:
	.string	"SDL_TEXTUREACCESS_STREAMING"
.LASF104:
	.string	"SDL_PIXELFORMAT_RGBA32"
.LASF274:
	.string	"SDL_SCANCODE_KP_EQUALS"
.LASF259:
	.string	"SDL_SCANCODE_KP_ENTER"
.LASF14:
	.string	"__off64_t"
.LASF73:
	.string	"SDL_PIXELFORMAT_UNKNOWN"
.LASF368:
	.string	"SDL_SCANCODE_KP_MEMADD"
.LASF25:
	.string	"_IO_read_base"
.LASF433:
	.string	"SDL_APP_WILLENTERFOREGROUND"
.LASF43:
	.string	"_offset"
.LASF554:
	.string	"cbutton"
.LASF94:
	.string	"SDL_PIXELFORMAT_BGR24"
.LASF421:
	.string	"scancode"
.LASF426:
	.string	"SDL_GestureID"
.LASF86:
	.string	"SDL_PIXELFORMAT_BGRA4444"
.LASF492:
	.string	"state"
.LASF30:
	.string	"_IO_buf_end"
.LASF527:
	.string	"SDL_MultiGestureEvent"
.LASF170:
	.string	"SDL_WINDOW_UTILITY"
.LASF354:
	.string	"SDL_SCANCODE_KP_LESS"
.LASF467:
	.string	"SDL_DROPFILE"
.LASF424:
	.string	"SDL_TouchID"
.LASF531:
	.string	"SDL_DollarGestureEvent"
.LASF49:
	.string	"_mode"
.LASF507:
	.string	"SDL_MouseWheelEvent"
.LASF26:
	.string	"_IO_write_base"
.LASF491:
	.string	"SDL_KeyboardEvent"
.LASF101:
	.string	"SDL_PIXELFORMAT_ABGR8888"
.LASF563:
	.string	"dgesture"
.LASF218:
	.string	"SDL_SCANCODE_LEFTBRACKET"
.LASF526:
	.string	"pressure"
.LASF12:
	.string	"long int"
.LASF407:
	.string	"SDL_SCANCODE_DISPLAYSWITCH"
.LASF124:
	.string	"format"
.LASF52:
	.string	"_IO_marker"
.LASF162:
	.string	"SDL_WINDOW_INPUT_FOCUS"
.LASF441:
	.string	"SDL_TEXTINPUT"
.LASF446:
	.string	"SDL_MOUSEWHEEL"
.LASF370:
	.string	"SDL_SCANCODE_KP_MEMMULTIPLY"
.LASF569:
	.string	"SDL_RENDERER_TARGETTEXTURE"
.LASF494:
	.string	"keysym"
.LASF546:
	.string	"motion"
.LASF63:
	.string	"uint32_t"
.LASF246:
	.string	"SDL_SCANCODE_PAGEUP"
.LASF53:
	.string	"_IO_codecvt"
.LASF164:
	.string	"SDL_WINDOW_FULLSCREEN_DESKTOP"
.LASF332:
	.string	"SDL_SCANCODE_EXSEL"
.LASF60:
	.string	"long double"
.LASF413:
	.string	"SDL_SCANCODE_APP1"
.LASF414:
	.string	"SDL_SCANCODE_APP2"
.LASF107:
	.string	"SDL_PIXELFORMAT_ABGR32"
.LASF3:
	.string	"long unsigned int"
.LASF459:
	.string	"SDL_CONTROLLERDEVICEREMAPPED"
.LASF220:
	.string	"SDL_SCANCODE_BACKSLASH"
.LASF593:
	.string	"renderer"
.LASF463:
	.string	"SDL_DOLLARGESTURE"
.LASF15:
	.string	"char"
.LASF67:
	.string	"Uint8"
.LASF391:
	.string	"SDL_SCANCODE_AUDIOPLAY"
.LASF244:
	.string	"SDL_SCANCODE_INSERT"
.LASF55:
	.string	"stdin"
.LASF337:
	.string	"SDL_SCANCODE_CURRENCYUNIT"
.LASF238:
	.string	"SDL_SCANCODE_F10"
.LASF239:
	.string	"SDL_SCANCODE_F11"
.LASF240:
	.string	"SDL_SCANCODE_F12"
.LASF275:
	.string	"SDL_SCANCODE_F13"
.LASF276:
	.string	"SDL_SCANCODE_F14"
.LASF277:
	.string	"SDL_SCANCODE_F15"
.LASF29:
	.string	"_IO_buf_base"
.LASF279:
	.string	"SDL_SCANCODE_F17"
.LASF280:
	.string	"SDL_SCANCODE_F18"
.LASF281:
	.string	"SDL_SCANCODE_F19"
.LASF443:
	.string	"SDL_MOUSEMOTION"
.LASF514:
	.string	"ball"
.LASF152:
	.string	"SDL_Window"
.LASF216:
	.string	"SDL_SCANCODE_MINUS"
.LASF24:
	.string	"_IO_read_end"
.LASF423:
	.string	"SDL_JoystickID"
.LASF282:
	.string	"SDL_SCANCODE_F20"
.LASF283:
	.string	"SDL_SCANCODE_F21"
.LASF284:
	.string	"SDL_SCANCODE_F22"
.LASF285:
	.string	"SDL_SCANCODE_F23"
.LASF286:
	.string	"SDL_SCANCODE_F24"
.LASF116:
	.string	"_IO_FILE"
.LASF54:
	.string	"_IO_wide_data"
.LASF291:
	.string	"SDL_SCANCODE_STOP"
.LASF247:
	.string	"SDL_SCANCODE_DELETE"
.LASF374:
	.string	"SDL_SCANCODE_KP_CLEARENTRY"
.LASF151:
	.string	"SDL_BlitMap"
.LASF111:
	.string	"SDL_PIXELFORMAT_UYVY"
.LASF87:
	.string	"SDL_PIXELFORMAT_ARGB1555"
.LASF217:
	.string	"SDL_SCANCODE_EQUALS"
.LASF269:
	.string	"SDL_SCANCODE_KP_0"
.LASF260:
	.string	"SDL_SCANCODE_KP_1"
.LASF261:
	.string	"SDL_SCANCODE_KP_2"
.LASF262:
	.string	"SDL_SCANCODE_KP_3"
.LASF263:
	.string	"SDL_SCANCODE_KP_4"
.LASF264:
	.string	"SDL_SCANCODE_KP_5"
.LASF265:
	.string	"SDL_SCANCODE_KP_6"
.LASF266:
	.string	"SDL_SCANCODE_KP_7"
.LASF267:
	.string	"SDL_SCANCODE_KP_8"
.LASF268:
	.string	"SDL_SCANCODE_KP_9"
.LASF518:
	.string	"SDL_ControllerAxisEvent"
.LASF345:
	.string	"SDL_SCANCODE_KP_A"
.LASF346:
	.string	"SDL_SCANCODE_KP_B"
.LASF347:
	.string	"SDL_SCANCODE_KP_C"
.LASF348:
	.string	"SDL_SCANCODE_KP_D"
.LASF349:
	.string	"SDL_SCANCODE_KP_E"
.LASF350:
	.string	"SDL_SCANCODE_KP_F"
.LASF212:
	.string	"SDL_SCANCODE_ESCAPE"
.LASF271:
	.string	"SDL_SCANCODE_NONUSBACKSLASH"
.LASF227:
	.string	"SDL_SCANCODE_SLASH"
.LASF484:
	.string	"padding1"
.LASF485:
	.string	"padding2"
.LASF486:
	.string	"padding3"
.LASF512:
	.string	"padding4"
.LASF435:
	.string	"SDL_DISPLAYEVENT"
.LASF251:
	.string	"SDL_SCANCODE_LEFT"
.LASF150:
	.string	"clip_rect"
.LASF542:
	.string	"SDL_SysWMEvent"
.LASF48:
	.string	"__pad5"
.LASF108:
	.string	"SDL_PIXELFORMAT_YV12"
.LASF69:
	.string	"Uint16"
.LASF115:
	.string	"SDL_PIXELFORMAT_EXTERNAL_OES"
.LASF230:
	.string	"SDL_SCANCODE_F2"
.LASF255:
	.string	"SDL_SCANCODE_KP_DIVIDE"
.LASF581:
	.string	"CHIP8_OUT"
.LASF34:
	.string	"_markers"
.LASF19:
	.string	"int64_t"
.LASF452:
	.string	"SDL_JOYDEVICEADDED"
.LASF503:
	.string	"yrel"
.LASF578:
	.string	"tzname"
.LASF95:
	.string	"SDL_PIXELFORMAT_RGB888"
.LASF44:
	.string	"_codecvt"
.LASF597:
	.string	"GNU C17 9.4.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF572:
	.string	"SDL_TEXTUREACCESS_TARGET"
.LASF363:
	.string	"SDL_SCANCODE_KP_AT"
.LASF118:
	.string	"SDL_Palette"
.LASF65:
	.string	"double"
.LASF447:
	.string	"SDL_JOYAXISMOTION"
.LASF321:
	.string	"SDL_SCANCODE_ALTERASE"
.LASF367:
	.string	"SDL_SCANCODE_KP_MEMCLEAR"
.LASF369:
	.string	"SDL_SCANCODE_KP_MEMSUBTRACT"
.LASF352:
	.string	"SDL_SCANCODE_KP_POWER"
.LASF538:
	.string	"SDL_QuitEvent"
.LASF560:
	.string	"syswm"
.LASF589:
	.string	"argc"
.LASF71:
	.string	"Uint32"
.LASF590:
	.string	"argv"
.LASF336:
	.string	"SDL_SCANCODE_DECIMALSEPARATOR"
.LASF409:
	.string	"SDL_SCANCODE_KBDILLUMDOWN"
.LASF530:
	.string	"numFingers"
.LASF9:
	.string	"__int32_t"
.LASF487:
	.string	"data1"
.LASF490:
	.string	"data2"
.LASF10:
	.string	"__uint32_t"
.LASF537:
	.string	"data"
.LASF157:
	.string	"SDL_WINDOW_BORDERLESS"
.LASF495:
	.string	"SDL_TextEditingEvent"
.LASF576:
	.string	"__daylight"
.LASF417:
	.string	"SDL_NUM_SCANCODES"
.LASF519:
	.string	"SDL_ControllerButtonEvent"
.LASF360:
	.string	"SDL_SCANCODE_KP_COLON"
.LASF120:
	.string	"colors"
.LASF556:
	.string	"adevice"
.LASF517:
	.string	"SDL_JoyDeviceEvent"
.LASF415:
	.string	"SDL_SCANCODE_AUDIOREWIND"
.LASF515:
	.string	"SDL_JoyHatEvent"
.LASF425:
	.string	"SDL_FingerID"
.LASF541:
	.string	"SDL_SysWMmsg"
.LASF444:
	.string	"SDL_MOUSEBUTTONDOWN"
.LASF342:
	.string	"SDL_SCANCODE_KP_RIGHTBRACE"
.LASF324:
	.string	"SDL_SCANCODE_CLEAR"
.LASF138:
	.string	"Gshift"
.LASF462:
	.string	"SDL_FINGERMOTION"
.LASF520:
	.string	"SDL_ControllerDeviceEvent"
.LASF47:
	.string	"_freeres_buf"
.LASF222:
	.string	"SDL_SCANCODE_SEMICOLON"
.LASF134:
	.string	"Gloss"
.LASF20:
	.string	"long long unsigned int"
.LASF498:
	.string	"length"
.LASF39:
	.string	"_cur_column"
.LASF160:
	.string	"SDL_WINDOW_MAXIMIZED"
.LASF84:
	.string	"SDL_PIXELFORMAT_RGBA4444"
.LASF461:
	.string	"SDL_FINGERUP"
.LASF351:
	.string	"SDL_SCANCODE_KP_XOR"
.LASF533:
	.string	"error"
.LASF566:
	.string	"SDL_RENDERER_SOFTWARE"
.LASF301:
	.string	"SDL_SCANCODE_KP_COMMA"
.LASF536:
	.string	"SDL_SensorEvent"
.LASF32:
	.string	"_IO_backup_base"
.LASF23:
	.string	"_IO_read_ptr"
.LASF46:
	.string	"_freeres_list"
.LASF395:
	.string	"SDL_SCANCODE_MAIL"
.LASF595:
	.string	"dirbuff"
.LASF405:
	.string	"SDL_SCANCODE_BRIGHTNESSDOWN"
.LASF580:
	.string	"timezone"
.LASF365:
	.string	"SDL_SCANCODE_KP_MEMSTORE"
.LASF89:
	.string	"SDL_PIXELFORMAT_ABGR1555"
.LASF149:
	.string	"lock_data"
.LASF245:
	.string	"SDL_SCANCODE_HOME"
.LASF449:
	.string	"SDL_JOYHATMOTION"
.LASF458:
	.string	"SDL_CONTROLLERDEVICEREMOVED"
.LASF38:
	.string	"_old_offset"
.LASF456:
	.string	"SDL_CONTROLLERBUTTONUP"
.LASF412:
	.string	"SDL_SCANCODE_SLEEP"
.LASF430:
	.string	"SDL_APP_LOWMEMORY"
.LASF356:
	.string	"SDL_SCANCODE_KP_AMPERSAND"
.LASF383:
	.string	"SDL_SCANCODE_RCTRL"
.LASF591:
	.string	"screenSurface"
.LASF21:
	.string	"long long int"
.LASF339:
	.string	"SDL_SCANCODE_KP_LEFTPAREN"
.LASF37:
	.string	"_flags2"
.LASF74:
	.string	"SDL_PIXELFORMAT_INDEX1LSB"
.LASF288:
	.string	"SDL_SCANCODE_HELP"
.LASF221:
	.string	"SDL_SCANCODE_NONUSHASH"
.LASF481:
	.string	"SDL_DisplayEvent"
.LASF499:
	.string	"SDL_TextInputEvent"
.LASF596:
	.string	"timer_counter"
.LASF109:
	.string	"SDL_PIXELFORMAT_IYUV"
.LASF489:
	.string	"windowID"
.LASF293:
	.string	"SDL_SCANCODE_UNDO"
.LASF224:
	.string	"SDL_SCANCODE_GRAVE"
.LASF154:
	.string	"SDL_WINDOW_OPENGL"
.LASF559:
	.string	"user"
.LASF557:
	.string	"sensor"
.LASF371:
	.string	"SDL_SCANCODE_KP_MEMDIVIDE"
.LASF450:
	.string	"SDL_JOYBUTTONDOWN"
.LASF58:
	.string	"sys_nerr"
.LASF561:
	.string	"tfinger"
.LASF598:
	.string	"/home/hunter/Chip-8_Emulator/src/SDLMain.c"
.LASF155:
	.string	"SDL_WINDOW_SHOWN"
.LASF488:
	.string	"SDL_WindowEvent"
.LASF303:
	.string	"SDL_SCANCODE_INTERNATIONAL1"
.LASF304:
	.string	"SDL_SCANCODE_INTERNATIONAL2"
.LASF305:
	.string	"SDL_SCANCODE_INTERNATIONAL3"
.LASF306:
	.string	"SDL_SCANCODE_INTERNATIONAL4"
.LASF307:
	.string	"SDL_SCANCODE_INTERNATIONAL5"
.LASF308:
	.string	"SDL_SCANCODE_INTERNATIONAL6"
.LASF309:
	.string	"SDL_SCANCODE_INTERNATIONAL7"
.LASF310:
	.string	"SDL_SCANCODE_INTERNATIONAL8"
.LASF311:
	.string	"SDL_SCANCODE_INTERNATIONAL9"
.LASF364:
	.string	"SDL_SCANCODE_KP_EXCLAM"
.LASF372:
	.string	"SDL_SCANCODE_KP_PLUSMINUS"
.LASF102:
	.string	"SDL_PIXELFORMAT_BGRA8888"
.LASF588:
	.string	"main"
.LASF136:
	.string	"Aloss"
.LASF121:
	.string	"version"
.LASF130:
	.string	"Gmask"
.LASF394:
	.string	"SDL_SCANCODE_WWW"
.LASF2:
	.string	"unsigned int"
.LASF460:
	.string	"SDL_FINGERDOWN"
.LASF429:
	.string	"SDL_APP_TERMINATING"
.LASF7:
	.string	"short int"
.LASF400:
	.string	"SDL_SCANCODE_AC_BACK"
.LASF40:
	.string	"_vtable_offset"
.LASF326:
	.string	"SDL_SCANCODE_RETURN2"
.LASF106:
	.string	"SDL_PIXELFORMAT_BGRA32"
.LASF143:
	.string	"SDL_Surface"
.LASF505:
	.string	"button"
.LASF142:
	.string	"SDL_Rect"
.LASF298:
	.string	"SDL_SCANCODE_MUTE"
.LASF468:
	.string	"SDL_DROPTEXT"
.LASF144:
	.string	"flags"
.LASF408:
	.string	"SDL_SCANCODE_KBDILLUMTOGGLE"
.LASF294:
	.string	"SDL_SCANCODE_CUT"
.LASF521:
	.string	"SDL_AudioDeviceEvent"
.LASF482:
	.string	"display"
.LASF327:
	.string	"SDL_SCANCODE_SEPARATOR"
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
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
