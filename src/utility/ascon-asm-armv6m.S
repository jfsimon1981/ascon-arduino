#include "ascon-select-backend.h"
#if defined(ASCON_BACKEND_ARMV6M)
/*
 * Copyright (C) 2022 Southern Storm Software, Pty Ltd.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */

	.syntax unified
	.thumb
	.text

	.align	2
	.global	ascon_permute
	.thumb
	.thumb_func
	.type	ascon_permute, %function
ascon_permute:
	push	{r4, r5, r6, r7, lr}
	mov	r2, r8
	mov	r3, r9
	mov	r4, r10
	mov	r5, fp
	push	{r2, r3, r4, r5}
	sub	sp, sp, #8
	str	r0, [sp, #0]
	ldr	r3, [r0, #4]
	ldr	r4, [r0, #12]
	ldr	r5, [r0, #20]
	ldr	r6, [r0, #28]
	ldr	r7, [r0, #36]
	mov	r8, r3
	mov	r9, r4
	mov	r10, r5
	mov	fp, r6
	mov	ip, r7
	ldr	r3, [r0, #0]
	ldr	r4, [r0, #8]
	ldr	r5, [r0, #16]
	ldr	r6, [r0, #24]
	ldr	r7, [r0, #32]
	cmp	r1, #11
	bhi	.L91
	lsls	r1, r1, #2
	adr	r2, .L90
	ldr	r1, [r2, r1]
	add	r1, r2
	mov	pc, r1
	.align	2
.L90:
	.word	.L0-.L90
	.word	.L1-.L90
	.word	.L2-.L90
	.word	.L3-.L90
	.word	.L4-.L90
	.word	.L5-.L90
	.word	.L6-.L90
	.word	.L7-.L90
	.word	.L8-.L90
	.word	.L9-.L90
	.word	.L10-.L90
	.word	.L11-.L90
.L91:
	bl	.L12
.L0:
	movs	r0, #12
	eors	r5, r0
	eors	r3, r7
	eors	r7, r6
	eors	r5, r4
	movs	r1, r3
	mvns	r0, r3
	ands	r0, r4
	mvns	r2, r4
	ands	r2, r5
	eors	r3, r2
	mvns	r2, r5
	ands	r2, r6
	eors	r4, r2
	mvns	r2, r7
	ands	r2, r1
	eors	r6, r2
	mvns	r2, r6
	ands	r2, r7
	eors	r5, r2
	eors	r7, r0
	eors	r4, r3
	eors	r3, r7
	eors	r6, r5
	mvns	r5, r5
	mov	lr, r7
	mov	r7, ip
	mov	ip, r6
	mov	r6, fp
	mov	fp, r5
	mov	r5, r10
	mov	r10, r4
	mov	r4, r9
	mov	r9, r3
	mov	r3, r8
	movs	r0, #12
	eors	r5, r0
	eors	r3, r7
	eors	r7, r6
	eors	r5, r4
	movs	r1, r3
	mvns	r0, r3
	ands	r0, r4
	mvns	r2, r4
	ands	r2, r5
	eors	r3, r2
	mvns	r2, r5
	ands	r2, r6
	eors	r4, r2
	mvns	r2, r7
	ands	r2, r1
	eors	r6, r2
	mvns	r2, r6
	ands	r2, r7
	eors	r5, r2
	eors	r7, r0
	eors	r4, r3
	eors	r3, r7
	eors	r6, r5
	mvns	r5, r5
	str	r7, [sp, #4]
	mov	r2, r9
	movs	r7, #4
	movs	r0, r3
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #5
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r3
	movs	r7, #10
	rors	r0, r0, r7
	eors	r0, r3
	mov	r8, r0
	movs	r7, #9
	movs	r3, r1
	rors	r3, r3, r7
	eors	r3, r2
	mov	r2, r10
	movs	r7, #11
	movs	r0, r2
	rors	r0, r0, r7
	eors	r0, r2
	movs	r1, r4
	rors	r1, r1, r7
	eors	r1, r4
	movs	r7, #20
	rors	r0, r0, r7
	eors	r0, r4
	mov	r9, r0
	movs	r7, #19
	movs	r4, r1
	rors	r4, r4, r7
	eors	r4, r2
	mov	r2, fp
	movs	r7, #2
	movs	r0, r5
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #3
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r5
	movs	r7, #1
	rors	r0, r0, r7
	eors	r0, r5
	mov	r10, r0
	movs	r5, r1
	eors	r5, r2
	mov	r2, ip
	movs	r7, #3
	movs	r0, r6
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #4
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r6
	movs	r7, #5
	rors	r1, r1, r7
	eors	r1, r6
	mov	fp, r1
	movs	r6, r0
	rors	r6, r6, r7
	eors	r6, r2
	ldr	r7, [sp, #4]
	str	r3, [sp, #4]
	mov	r2, lr
	movs	r3, #17
	movs	r0, r2
	rors	r0, r0, r3
	eors	r0, r2
	movs	r1, r7
	rors	r1, r1, r3
	eors	r1, r7
	movs	r3, #4
	rors	r0, r0, r3
	eors	r0, r7
	mov	ip, r0
	movs	r3, #3
	movs	r7, r1
	rors	r7, r7, r3
	eors	r7, r2
	ldr	r3, [sp, #4]
.L1:
	movs	r0, #9
	eors	r5, r0
	eors	r3, r7
	eors	r7, r6
	eors	r5, r4
	movs	r1, r3
	mvns	r0, r3
	ands	r0, r4
	mvns	r2, r4
	ands	r2, r5
	eors	r3, r2
	mvns	r2, r5
	ands	r2, r6
	eors	r4, r2
	mvns	r2, r7
	ands	r2, r1
	eors	r6, r2
	mvns	r2, r6
	ands	r2, r7
	eors	r5, r2
	eors	r7, r0
	eors	r4, r3
	eors	r3, r7
	eors	r6, r5
	mvns	r5, r5
	mov	lr, r7
	mov	r7, ip
	mov	ip, r6
	mov	r6, fp
	mov	fp, r5
	mov	r5, r10
	mov	r10, r4
	mov	r4, r9
	mov	r9, r3
	mov	r3, r8
	movs	r0, #12
	eors	r5, r0
	eors	r3, r7
	eors	r7, r6
	eors	r5, r4
	movs	r1, r3
	mvns	r0, r3
	ands	r0, r4
	mvns	r2, r4
	ands	r2, r5
	eors	r3, r2
	mvns	r2, r5
	ands	r2, r6
	eors	r4, r2
	mvns	r2, r7
	ands	r2, r1
	eors	r6, r2
	mvns	r2, r6
	ands	r2, r7
	eors	r5, r2
	eors	r7, r0
	eors	r4, r3
	eors	r3, r7
	eors	r6, r5
	mvns	r5, r5
	str	r7, [sp, #4]
	mov	r2, r9
	movs	r7, #4
	movs	r0, r3
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #5
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r3
	movs	r7, #10
	rors	r0, r0, r7
	eors	r0, r3
	mov	r8, r0
	movs	r7, #9
	movs	r3, r1
	rors	r3, r3, r7
	eors	r3, r2
	mov	r2, r10
	movs	r7, #11
	movs	r0, r2
	rors	r0, r0, r7
	eors	r0, r2
	movs	r1, r4
	rors	r1, r1, r7
	eors	r1, r4
	movs	r7, #20
	rors	r0, r0, r7
	eors	r0, r4
	mov	r9, r0
	movs	r7, #19
	movs	r4, r1
	rors	r4, r4, r7
	eors	r4, r2
	mov	r2, fp
	movs	r7, #2
	movs	r0, r5
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #3
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r5
	movs	r7, #1
	rors	r0, r0, r7
	eors	r0, r5
	mov	r10, r0
	movs	r5, r1
	eors	r5, r2
	mov	r2, ip
	movs	r7, #3
	movs	r0, r6
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #4
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r6
	movs	r7, #5
	rors	r1, r1, r7
	eors	r1, r6
	mov	fp, r1
	movs	r6, r0
	rors	r6, r6, r7
	eors	r6, r2
	ldr	r7, [sp, #4]
	str	r3, [sp, #4]
	mov	r2, lr
	movs	r3, #17
	movs	r0, r2
	rors	r0, r0, r3
	eors	r0, r2
	movs	r1, r7
	rors	r1, r1, r3
	eors	r1, r7
	movs	r3, #4
	rors	r0, r0, r3
	eors	r0, r7
	mov	ip, r0
	movs	r3, #3
	movs	r7, r1
	rors	r7, r7, r3
	eors	r7, r2
	ldr	r3, [sp, #4]
.L2:
	movs	r0, #12
	eors	r5, r0
	eors	r3, r7
	eors	r7, r6
	eors	r5, r4
	movs	r1, r3
	mvns	r0, r3
	ands	r0, r4
	mvns	r2, r4
	ands	r2, r5
	eors	r3, r2
	mvns	r2, r5
	ands	r2, r6
	eors	r4, r2
	mvns	r2, r7
	ands	r2, r1
	eors	r6, r2
	mvns	r2, r6
	ands	r2, r7
	eors	r5, r2
	eors	r7, r0
	eors	r4, r3
	eors	r3, r7
	eors	r6, r5
	mvns	r5, r5
	mov	lr, r7
	mov	r7, ip
	mov	ip, r6
	mov	r6, fp
	mov	fp, r5
	mov	r5, r10
	mov	r10, r4
	mov	r4, r9
	mov	r9, r3
	mov	r3, r8
	movs	r0, #9
	eors	r5, r0
	eors	r3, r7
	eors	r7, r6
	eors	r5, r4
	movs	r1, r3
	mvns	r0, r3
	ands	r0, r4
	mvns	r2, r4
	ands	r2, r5
	eors	r3, r2
	mvns	r2, r5
	ands	r2, r6
	eors	r4, r2
	mvns	r2, r7
	ands	r2, r1
	eors	r6, r2
	mvns	r2, r6
	ands	r2, r7
	eors	r5, r2
	eors	r7, r0
	eors	r4, r3
	eors	r3, r7
	eors	r6, r5
	mvns	r5, r5
	str	r7, [sp, #4]
	mov	r2, r9
	movs	r7, #4
	movs	r0, r3
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #5
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r3
	movs	r7, #10
	rors	r0, r0, r7
	eors	r0, r3
	mov	r8, r0
	movs	r7, #9
	movs	r3, r1
	rors	r3, r3, r7
	eors	r3, r2
	mov	r2, r10
	movs	r7, #11
	movs	r0, r2
	rors	r0, r0, r7
	eors	r0, r2
	movs	r1, r4
	rors	r1, r1, r7
	eors	r1, r4
	movs	r7, #20
	rors	r0, r0, r7
	eors	r0, r4
	mov	r9, r0
	movs	r7, #19
	movs	r4, r1
	rors	r4, r4, r7
	eors	r4, r2
	mov	r2, fp
	movs	r7, #2
	movs	r0, r5
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #3
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r5
	movs	r7, #1
	rors	r0, r0, r7
	eors	r0, r5
	mov	r10, r0
	movs	r5, r1
	eors	r5, r2
	mov	r2, ip
	movs	r7, #3
	movs	r0, r6
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #4
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r6
	movs	r7, #5
	rors	r1, r1, r7
	eors	r1, r6
	mov	fp, r1
	movs	r6, r0
	rors	r6, r6, r7
	eors	r6, r2
	ldr	r7, [sp, #4]
	str	r3, [sp, #4]
	mov	r2, lr
	movs	r3, #17
	movs	r0, r2
	rors	r0, r0, r3
	eors	r0, r2
	movs	r1, r7
	rors	r1, r1, r3
	eors	r1, r7
	movs	r3, #4
	rors	r0, r0, r3
	eors	r0, r7
	mov	ip, r0
	movs	r3, #3
	movs	r7, r1
	rors	r7, r7, r3
	eors	r7, r2
	ldr	r3, [sp, #4]
.L3:
	movs	r0, #9
	eors	r5, r0
	eors	r3, r7
	eors	r7, r6
	eors	r5, r4
	movs	r1, r3
	mvns	r0, r3
	ands	r0, r4
	mvns	r2, r4
	ands	r2, r5
	eors	r3, r2
	mvns	r2, r5
	ands	r2, r6
	eors	r4, r2
	mvns	r2, r7
	ands	r2, r1
	eors	r6, r2
	mvns	r2, r6
	ands	r2, r7
	eors	r5, r2
	eors	r7, r0
	eors	r4, r3
	eors	r3, r7
	eors	r6, r5
	mvns	r5, r5
	mov	lr, r7
	mov	r7, ip
	mov	ip, r6
	mov	r6, fp
	mov	fp, r5
	mov	r5, r10
	mov	r10, r4
	mov	r4, r9
	mov	r9, r3
	mov	r3, r8
	movs	r0, #9
	eors	r5, r0
	eors	r3, r7
	eors	r7, r6
	eors	r5, r4
	movs	r1, r3
	mvns	r0, r3
	ands	r0, r4
	mvns	r2, r4
	ands	r2, r5
	eors	r3, r2
	mvns	r2, r5
	ands	r2, r6
	eors	r4, r2
	mvns	r2, r7
	ands	r2, r1
	eors	r6, r2
	mvns	r2, r6
	ands	r2, r7
	eors	r5, r2
	eors	r7, r0
	eors	r4, r3
	eors	r3, r7
	eors	r6, r5
	mvns	r5, r5
	str	r7, [sp, #4]
	mov	r2, r9
	movs	r7, #4
	movs	r0, r3
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #5
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r3
	movs	r7, #10
	rors	r0, r0, r7
	eors	r0, r3
	mov	r8, r0
	movs	r7, #9
	movs	r3, r1
	rors	r3, r3, r7
	eors	r3, r2
	mov	r2, r10
	movs	r7, #11
	movs	r0, r2
	rors	r0, r0, r7
	eors	r0, r2
	movs	r1, r4
	rors	r1, r1, r7
	eors	r1, r4
	movs	r7, #20
	rors	r0, r0, r7
	eors	r0, r4
	mov	r9, r0
	movs	r7, #19
	movs	r4, r1
	rors	r4, r4, r7
	eors	r4, r2
	mov	r2, fp
	movs	r7, #2
	movs	r0, r5
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #3
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r5
	movs	r7, #1
	rors	r0, r0, r7
	eors	r0, r5
	mov	r10, r0
	movs	r5, r1
	eors	r5, r2
	mov	r2, ip
	movs	r7, #3
	movs	r0, r6
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #4
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r6
	movs	r7, #5
	rors	r1, r1, r7
	eors	r1, r6
	mov	fp, r1
	movs	r6, r0
	rors	r6, r6, r7
	eors	r6, r2
	ldr	r7, [sp, #4]
	str	r3, [sp, #4]
	mov	r2, lr
	movs	r3, #17
	movs	r0, r2
	rors	r0, r0, r3
	eors	r0, r2
	movs	r1, r7
	rors	r1, r1, r3
	eors	r1, r7
	movs	r3, #4
	rors	r0, r0, r3
	eors	r0, r7
	mov	ip, r0
	movs	r3, #3
	movs	r7, r1
	rors	r7, r7, r3
	eors	r7, r2
	ldr	r3, [sp, #4]
.L4:
	movs	r0, #6
	eors	r5, r0
	eors	r3, r7
	eors	r7, r6
	eors	r5, r4
	movs	r1, r3
	mvns	r0, r3
	ands	r0, r4
	mvns	r2, r4
	ands	r2, r5
	eors	r3, r2
	mvns	r2, r5
	ands	r2, r6
	eors	r4, r2
	mvns	r2, r7
	ands	r2, r1
	eors	r6, r2
	mvns	r2, r6
	ands	r2, r7
	eors	r5, r2
	eors	r7, r0
	eors	r4, r3
	eors	r3, r7
	eors	r6, r5
	mvns	r5, r5
	mov	lr, r7
	mov	r7, ip
	mov	ip, r6
	mov	r6, fp
	mov	fp, r5
	mov	r5, r10
	mov	r10, r4
	mov	r4, r9
	mov	r9, r3
	mov	r3, r8
	movs	r0, #12
	eors	r5, r0
	eors	r3, r7
	eors	r7, r6
	eors	r5, r4
	movs	r1, r3
	mvns	r0, r3
	ands	r0, r4
	mvns	r2, r4
	ands	r2, r5
	eors	r3, r2
	mvns	r2, r5
	ands	r2, r6
	eors	r4, r2
	mvns	r2, r7
	ands	r2, r1
	eors	r6, r2
	mvns	r2, r6
	ands	r2, r7
	eors	r5, r2
	eors	r7, r0
	eors	r4, r3
	eors	r3, r7
	eors	r6, r5
	mvns	r5, r5
	str	r7, [sp, #4]
	mov	r2, r9
	movs	r7, #4
	movs	r0, r3
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #5
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r3
	movs	r7, #10
	rors	r0, r0, r7
	eors	r0, r3
	mov	r8, r0
	movs	r7, #9
	movs	r3, r1
	rors	r3, r3, r7
	eors	r3, r2
	mov	r2, r10
	movs	r7, #11
	movs	r0, r2
	rors	r0, r0, r7
	eors	r0, r2
	movs	r1, r4
	rors	r1, r1, r7
	eors	r1, r4
	movs	r7, #20
	rors	r0, r0, r7
	eors	r0, r4
	mov	r9, r0
	movs	r7, #19
	movs	r4, r1
	rors	r4, r4, r7
	eors	r4, r2
	mov	r2, fp
	movs	r7, #2
	movs	r0, r5
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #3
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r5
	movs	r7, #1
	rors	r0, r0, r7
	eors	r0, r5
	mov	r10, r0
	movs	r5, r1
	eors	r5, r2
	mov	r2, ip
	movs	r7, #3
	movs	r0, r6
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #4
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r6
	movs	r7, #5
	rors	r1, r1, r7
	eors	r1, r6
	mov	fp, r1
	movs	r6, r0
	rors	r6, r6, r7
	eors	r6, r2
	ldr	r7, [sp, #4]
	str	r3, [sp, #4]
	mov	r2, lr
	movs	r3, #17
	movs	r0, r2
	rors	r0, r0, r3
	eors	r0, r2
	movs	r1, r7
	rors	r1, r1, r3
	eors	r1, r7
	movs	r3, #4
	rors	r0, r0, r3
	eors	r0, r7
	mov	ip, r0
	movs	r3, #3
	movs	r7, r1
	rors	r7, r7, r3
	eors	r7, r2
	ldr	r3, [sp, #4]
.L5:
	movs	r0, #3
	eors	r5, r0
	eors	r3, r7
	eors	r7, r6
	eors	r5, r4
	movs	r1, r3
	mvns	r0, r3
	ands	r0, r4
	mvns	r2, r4
	ands	r2, r5
	eors	r3, r2
	mvns	r2, r5
	ands	r2, r6
	eors	r4, r2
	mvns	r2, r7
	ands	r2, r1
	eors	r6, r2
	mvns	r2, r6
	ands	r2, r7
	eors	r5, r2
	eors	r7, r0
	eors	r4, r3
	eors	r3, r7
	eors	r6, r5
	mvns	r5, r5
	mov	lr, r7
	mov	r7, ip
	mov	ip, r6
	mov	r6, fp
	mov	fp, r5
	mov	r5, r10
	mov	r10, r4
	mov	r4, r9
	mov	r9, r3
	mov	r3, r8
	movs	r0, #12
	eors	r5, r0
	eors	r3, r7
	eors	r7, r6
	eors	r5, r4
	movs	r1, r3
	mvns	r0, r3
	ands	r0, r4
	mvns	r2, r4
	ands	r2, r5
	eors	r3, r2
	mvns	r2, r5
	ands	r2, r6
	eors	r4, r2
	mvns	r2, r7
	ands	r2, r1
	eors	r6, r2
	mvns	r2, r6
	ands	r2, r7
	eors	r5, r2
	eors	r7, r0
	eors	r4, r3
	eors	r3, r7
	eors	r6, r5
	mvns	r5, r5
	str	r7, [sp, #4]
	mov	r2, r9
	movs	r7, #4
	movs	r0, r3
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #5
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r3
	movs	r7, #10
	rors	r0, r0, r7
	eors	r0, r3
	mov	r8, r0
	movs	r7, #9
	movs	r3, r1
	rors	r3, r3, r7
	eors	r3, r2
	mov	r2, r10
	movs	r7, #11
	movs	r0, r2
	rors	r0, r0, r7
	eors	r0, r2
	movs	r1, r4
	rors	r1, r1, r7
	eors	r1, r4
	movs	r7, #20
	rors	r0, r0, r7
	eors	r0, r4
	mov	r9, r0
	movs	r7, #19
	movs	r4, r1
	rors	r4, r4, r7
	eors	r4, r2
	mov	r2, fp
	movs	r7, #2
	movs	r0, r5
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #3
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r5
	movs	r7, #1
	rors	r0, r0, r7
	eors	r0, r5
	mov	r10, r0
	movs	r5, r1
	eors	r5, r2
	mov	r2, ip
	movs	r7, #3
	movs	r0, r6
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #4
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r6
	movs	r7, #5
	rors	r1, r1, r7
	eors	r1, r6
	mov	fp, r1
	movs	r6, r0
	rors	r6, r6, r7
	eors	r6, r2
	ldr	r7, [sp, #4]
	str	r3, [sp, #4]
	mov	r2, lr
	movs	r3, #17
	movs	r0, r2
	rors	r0, r0, r3
	eors	r0, r2
	movs	r1, r7
	rors	r1, r1, r3
	eors	r1, r7
	movs	r3, #4
	rors	r0, r0, r3
	eors	r0, r7
	mov	ip, r0
	movs	r3, #3
	movs	r7, r1
	rors	r7, r7, r3
	eors	r7, r2
	ldr	r3, [sp, #4]
.L6:
	movs	r0, #6
	eors	r5, r0
	eors	r3, r7
	eors	r7, r6
	eors	r5, r4
	movs	r1, r3
	mvns	r0, r3
	ands	r0, r4
	mvns	r2, r4
	ands	r2, r5
	eors	r3, r2
	mvns	r2, r5
	ands	r2, r6
	eors	r4, r2
	mvns	r2, r7
	ands	r2, r1
	eors	r6, r2
	mvns	r2, r6
	ands	r2, r7
	eors	r5, r2
	eors	r7, r0
	eors	r4, r3
	eors	r3, r7
	eors	r6, r5
	mvns	r5, r5
	mov	lr, r7
	mov	r7, ip
	mov	ip, r6
	mov	r6, fp
	mov	fp, r5
	mov	r5, r10
	mov	r10, r4
	mov	r4, r9
	mov	r9, r3
	mov	r3, r8
	movs	r0, #9
	eors	r5, r0
	eors	r3, r7
	eors	r7, r6
	eors	r5, r4
	movs	r1, r3
	mvns	r0, r3
	ands	r0, r4
	mvns	r2, r4
	ands	r2, r5
	eors	r3, r2
	mvns	r2, r5
	ands	r2, r6
	eors	r4, r2
	mvns	r2, r7
	ands	r2, r1
	eors	r6, r2
	mvns	r2, r6
	ands	r2, r7
	eors	r5, r2
	eors	r7, r0
	eors	r4, r3
	eors	r3, r7
	eors	r6, r5
	mvns	r5, r5
	str	r7, [sp, #4]
	mov	r2, r9
	movs	r7, #4
	movs	r0, r3
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #5
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r3
	movs	r7, #10
	rors	r0, r0, r7
	eors	r0, r3
	mov	r8, r0
	movs	r7, #9
	movs	r3, r1
	rors	r3, r3, r7
	eors	r3, r2
	mov	r2, r10
	movs	r7, #11
	movs	r0, r2
	rors	r0, r0, r7
	eors	r0, r2
	movs	r1, r4
	rors	r1, r1, r7
	eors	r1, r4
	movs	r7, #20
	rors	r0, r0, r7
	eors	r0, r4
	mov	r9, r0
	movs	r7, #19
	movs	r4, r1
	rors	r4, r4, r7
	eors	r4, r2
	mov	r2, fp
	movs	r7, #2
	movs	r0, r5
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #3
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r5
	movs	r7, #1
	rors	r0, r0, r7
	eors	r0, r5
	mov	r10, r0
	movs	r5, r1
	eors	r5, r2
	mov	r2, ip
	movs	r7, #3
	movs	r0, r6
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #4
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r6
	movs	r7, #5
	rors	r1, r1, r7
	eors	r1, r6
	mov	fp, r1
	movs	r6, r0
	rors	r6, r6, r7
	eors	r6, r2
	ldr	r7, [sp, #4]
	str	r3, [sp, #4]
	mov	r2, lr
	movs	r3, #17
	movs	r0, r2
	rors	r0, r0, r3
	eors	r0, r2
	movs	r1, r7
	rors	r1, r1, r3
	eors	r1, r7
	movs	r3, #4
	rors	r0, r0, r3
	eors	r0, r7
	mov	ip, r0
	movs	r3, #3
	movs	r7, r1
	rors	r7, r7, r3
	eors	r7, r2
	ldr	r3, [sp, #4]
.L7:
	movs	r0, #3
	eors	r5, r0
	eors	r3, r7
	eors	r7, r6
	eors	r5, r4
	movs	r1, r3
	mvns	r0, r3
	ands	r0, r4
	mvns	r2, r4
	ands	r2, r5
	eors	r3, r2
	mvns	r2, r5
	ands	r2, r6
	eors	r4, r2
	mvns	r2, r7
	ands	r2, r1
	eors	r6, r2
	mvns	r2, r6
	ands	r2, r7
	eors	r5, r2
	eors	r7, r0
	eors	r4, r3
	eors	r3, r7
	eors	r6, r5
	mvns	r5, r5
	mov	lr, r7
	mov	r7, ip
	mov	ip, r6
	mov	r6, fp
	mov	fp, r5
	mov	r5, r10
	mov	r10, r4
	mov	r4, r9
	mov	r9, r3
	mov	r3, r8
	movs	r0, #9
	eors	r5, r0
	eors	r3, r7
	eors	r7, r6
	eors	r5, r4
	movs	r1, r3
	mvns	r0, r3
	ands	r0, r4
	mvns	r2, r4
	ands	r2, r5
	eors	r3, r2
	mvns	r2, r5
	ands	r2, r6
	eors	r4, r2
	mvns	r2, r7
	ands	r2, r1
	eors	r6, r2
	mvns	r2, r6
	ands	r2, r7
	eors	r5, r2
	eors	r7, r0
	eors	r4, r3
	eors	r3, r7
	eors	r6, r5
	mvns	r5, r5
	str	r7, [sp, #4]
	mov	r2, r9
	movs	r7, #4
	movs	r0, r3
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #5
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r3
	movs	r7, #10
	rors	r0, r0, r7
	eors	r0, r3
	mov	r8, r0
	movs	r7, #9
	movs	r3, r1
	rors	r3, r3, r7
	eors	r3, r2
	mov	r2, r10
	movs	r7, #11
	movs	r0, r2
	rors	r0, r0, r7
	eors	r0, r2
	movs	r1, r4
	rors	r1, r1, r7
	eors	r1, r4
	movs	r7, #20
	rors	r0, r0, r7
	eors	r0, r4
	mov	r9, r0
	movs	r7, #19
	movs	r4, r1
	rors	r4, r4, r7
	eors	r4, r2
	mov	r2, fp
	movs	r7, #2
	movs	r0, r5
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #3
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r5
	movs	r7, #1
	rors	r0, r0, r7
	eors	r0, r5
	mov	r10, r0
	movs	r5, r1
	eors	r5, r2
	mov	r2, ip
	movs	r7, #3
	movs	r0, r6
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #4
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r6
	movs	r7, #5
	rors	r1, r1, r7
	eors	r1, r6
	mov	fp, r1
	movs	r6, r0
	rors	r6, r6, r7
	eors	r6, r2
	ldr	r7, [sp, #4]
	str	r3, [sp, #4]
	mov	r2, lr
	movs	r3, #17
	movs	r0, r2
	rors	r0, r0, r3
	eors	r0, r2
	movs	r1, r7
	rors	r1, r1, r3
	eors	r1, r7
	movs	r3, #4
	rors	r0, r0, r3
	eors	r0, r7
	mov	ip, r0
	movs	r3, #3
	movs	r7, r1
	rors	r7, r7, r3
	eors	r7, r2
	ldr	r3, [sp, #4]
.L8:
	movs	r0, #12
	eors	r5, r0
	eors	r3, r7
	eors	r7, r6
	eors	r5, r4
	movs	r1, r3
	mvns	r0, r3
	ands	r0, r4
	mvns	r2, r4
	ands	r2, r5
	eors	r3, r2
	mvns	r2, r5
	ands	r2, r6
	eors	r4, r2
	mvns	r2, r7
	ands	r2, r1
	eors	r6, r2
	mvns	r2, r6
	ands	r2, r7
	eors	r5, r2
	eors	r7, r0
	eors	r4, r3
	eors	r3, r7
	eors	r6, r5
	mvns	r5, r5
	mov	lr, r7
	mov	r7, ip
	mov	ip, r6
	mov	r6, fp
	mov	fp, r5
	mov	r5, r10
	mov	r10, r4
	mov	r4, r9
	mov	r9, r3
	mov	r3, r8
	movs	r0, #6
	eors	r5, r0
	eors	r3, r7
	eors	r7, r6
	eors	r5, r4
	movs	r1, r3
	mvns	r0, r3
	ands	r0, r4
	mvns	r2, r4
	ands	r2, r5
	eors	r3, r2
	mvns	r2, r5
	ands	r2, r6
	eors	r4, r2
	mvns	r2, r7
	ands	r2, r1
	eors	r6, r2
	mvns	r2, r6
	ands	r2, r7
	eors	r5, r2
	eors	r7, r0
	eors	r4, r3
	eors	r3, r7
	eors	r6, r5
	mvns	r5, r5
	str	r7, [sp, #4]
	mov	r2, r9
	movs	r7, #4
	movs	r0, r3
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #5
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r3
	movs	r7, #10
	rors	r0, r0, r7
	eors	r0, r3
	mov	r8, r0
	movs	r7, #9
	movs	r3, r1
	rors	r3, r3, r7
	eors	r3, r2
	mov	r2, r10
	movs	r7, #11
	movs	r0, r2
	rors	r0, r0, r7
	eors	r0, r2
	movs	r1, r4
	rors	r1, r1, r7
	eors	r1, r4
	movs	r7, #20
	rors	r0, r0, r7
	eors	r0, r4
	mov	r9, r0
	movs	r7, #19
	movs	r4, r1
	rors	r4, r4, r7
	eors	r4, r2
	mov	r2, fp
	movs	r7, #2
	movs	r0, r5
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #3
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r5
	movs	r7, #1
	rors	r0, r0, r7
	eors	r0, r5
	mov	r10, r0
	movs	r5, r1
	eors	r5, r2
	mov	r2, ip
	movs	r7, #3
	movs	r0, r6
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #4
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r6
	movs	r7, #5
	rors	r1, r1, r7
	eors	r1, r6
	mov	fp, r1
	movs	r6, r0
	rors	r6, r6, r7
	eors	r6, r2
	ldr	r7, [sp, #4]
	str	r3, [sp, #4]
	mov	r2, lr
	movs	r3, #17
	movs	r0, r2
	rors	r0, r0, r3
	eors	r0, r2
	movs	r1, r7
	rors	r1, r1, r3
	eors	r1, r7
	movs	r3, #4
	rors	r0, r0, r3
	eors	r0, r7
	mov	ip, r0
	movs	r3, #3
	movs	r7, r1
	rors	r7, r7, r3
	eors	r7, r2
	ldr	r3, [sp, #4]
.L9:
	movs	r0, #9
	eors	r5, r0
	eors	r3, r7
	eors	r7, r6
	eors	r5, r4
	movs	r1, r3
	mvns	r0, r3
	ands	r0, r4
	mvns	r2, r4
	ands	r2, r5
	eors	r3, r2
	mvns	r2, r5
	ands	r2, r6
	eors	r4, r2
	mvns	r2, r7
	ands	r2, r1
	eors	r6, r2
	mvns	r2, r6
	ands	r2, r7
	eors	r5, r2
	eors	r7, r0
	eors	r4, r3
	eors	r3, r7
	eors	r6, r5
	mvns	r5, r5
	mov	lr, r7
	mov	r7, ip
	mov	ip, r6
	mov	r6, fp
	mov	fp, r5
	mov	r5, r10
	mov	r10, r4
	mov	r4, r9
	mov	r9, r3
	mov	r3, r8
	movs	r0, #6
	eors	r5, r0
	eors	r3, r7
	eors	r7, r6
	eors	r5, r4
	movs	r1, r3
	mvns	r0, r3
	ands	r0, r4
	mvns	r2, r4
	ands	r2, r5
	eors	r3, r2
	mvns	r2, r5
	ands	r2, r6
	eors	r4, r2
	mvns	r2, r7
	ands	r2, r1
	eors	r6, r2
	mvns	r2, r6
	ands	r2, r7
	eors	r5, r2
	eors	r7, r0
	eors	r4, r3
	eors	r3, r7
	eors	r6, r5
	mvns	r5, r5
	str	r7, [sp, #4]
	mov	r2, r9
	movs	r7, #4
	movs	r0, r3
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #5
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r3
	movs	r7, #10
	rors	r0, r0, r7
	eors	r0, r3
	mov	r8, r0
	movs	r7, #9
	movs	r3, r1
	rors	r3, r3, r7
	eors	r3, r2
	mov	r2, r10
	movs	r7, #11
	movs	r0, r2
	rors	r0, r0, r7
	eors	r0, r2
	movs	r1, r4
	rors	r1, r1, r7
	eors	r1, r4
	movs	r7, #20
	rors	r0, r0, r7
	eors	r0, r4
	mov	r9, r0
	movs	r7, #19
	movs	r4, r1
	rors	r4, r4, r7
	eors	r4, r2
	mov	r2, fp
	movs	r7, #2
	movs	r0, r5
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #3
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r5
	movs	r7, #1
	rors	r0, r0, r7
	eors	r0, r5
	mov	r10, r0
	movs	r5, r1
	eors	r5, r2
	mov	r2, ip
	movs	r7, #3
	movs	r0, r6
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #4
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r6
	movs	r7, #5
	rors	r1, r1, r7
	eors	r1, r6
	mov	fp, r1
	movs	r6, r0
	rors	r6, r6, r7
	eors	r6, r2
	ldr	r7, [sp, #4]
	str	r3, [sp, #4]
	mov	r2, lr
	movs	r3, #17
	movs	r0, r2
	rors	r0, r0, r3
	eors	r0, r2
	movs	r1, r7
	rors	r1, r1, r3
	eors	r1, r7
	movs	r3, #4
	rors	r0, r0, r3
	eors	r0, r7
	mov	ip, r0
	movs	r3, #3
	movs	r7, r1
	rors	r7, r7, r3
	eors	r7, r2
	ldr	r3, [sp, #4]
.L10:
	movs	r0, #12
	eors	r5, r0
	eors	r3, r7
	eors	r7, r6
	eors	r5, r4
	movs	r1, r3
	mvns	r0, r3
	ands	r0, r4
	mvns	r2, r4
	ands	r2, r5
	eors	r3, r2
	mvns	r2, r5
	ands	r2, r6
	eors	r4, r2
	mvns	r2, r7
	ands	r2, r1
	eors	r6, r2
	mvns	r2, r6
	ands	r2, r7
	eors	r5, r2
	eors	r7, r0
	eors	r4, r3
	eors	r3, r7
	eors	r6, r5
	mvns	r5, r5
	mov	lr, r7
	mov	r7, ip
	mov	ip, r6
	mov	r6, fp
	mov	fp, r5
	mov	r5, r10
	mov	r10, r4
	mov	r4, r9
	mov	r9, r3
	mov	r3, r8
	movs	r0, #3
	eors	r5, r0
	eors	r3, r7
	eors	r7, r6
	eors	r5, r4
	movs	r1, r3
	mvns	r0, r3
	ands	r0, r4
	mvns	r2, r4
	ands	r2, r5
	eors	r3, r2
	mvns	r2, r5
	ands	r2, r6
	eors	r4, r2
	mvns	r2, r7
	ands	r2, r1
	eors	r6, r2
	mvns	r2, r6
	ands	r2, r7
	eors	r5, r2
	eors	r7, r0
	eors	r4, r3
	eors	r3, r7
	eors	r6, r5
	mvns	r5, r5
	str	r7, [sp, #4]
	mov	r2, r9
	movs	r7, #4
	movs	r0, r3
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #5
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r3
	movs	r7, #10
	rors	r0, r0, r7
	eors	r0, r3
	mov	r8, r0
	movs	r7, #9
	movs	r3, r1
	rors	r3, r3, r7
	eors	r3, r2
	mov	r2, r10
	movs	r7, #11
	movs	r0, r2
	rors	r0, r0, r7
	eors	r0, r2
	movs	r1, r4
	rors	r1, r1, r7
	eors	r1, r4
	movs	r7, #20
	rors	r0, r0, r7
	eors	r0, r4
	mov	r9, r0
	movs	r7, #19
	movs	r4, r1
	rors	r4, r4, r7
	eors	r4, r2
	mov	r2, fp
	movs	r7, #2
	movs	r0, r5
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #3
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r5
	movs	r7, #1
	rors	r0, r0, r7
	eors	r0, r5
	mov	r10, r0
	movs	r5, r1
	eors	r5, r2
	mov	r2, ip
	movs	r7, #3
	movs	r0, r6
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #4
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r6
	movs	r7, #5
	rors	r1, r1, r7
	eors	r1, r6
	mov	fp, r1
	movs	r6, r0
	rors	r6, r6, r7
	eors	r6, r2
	ldr	r7, [sp, #4]
	str	r3, [sp, #4]
	mov	r2, lr
	movs	r3, #17
	movs	r0, r2
	rors	r0, r0, r3
	eors	r0, r2
	movs	r1, r7
	rors	r1, r1, r3
	eors	r1, r7
	movs	r3, #4
	rors	r0, r0, r3
	eors	r0, r7
	mov	ip, r0
	movs	r3, #3
	movs	r7, r1
	rors	r7, r7, r3
	eors	r7, r2
	ldr	r3, [sp, #4]
.L11:
	movs	r0, #9
	eors	r5, r0
	eors	r3, r7
	eors	r7, r6
	eors	r5, r4
	movs	r1, r3
	mvns	r0, r3
	ands	r0, r4
	mvns	r2, r4
	ands	r2, r5
	eors	r3, r2
	mvns	r2, r5
	ands	r2, r6
	eors	r4, r2
	mvns	r2, r7
	ands	r2, r1
	eors	r6, r2
	mvns	r2, r6
	ands	r2, r7
	eors	r5, r2
	eors	r7, r0
	eors	r4, r3
	eors	r3, r7
	eors	r6, r5
	mvns	r5, r5
	mov	lr, r7
	mov	r7, ip
	mov	ip, r6
	mov	r6, fp
	mov	fp, r5
	mov	r5, r10
	mov	r10, r4
	mov	r4, r9
	mov	r9, r3
	mov	r3, r8
	movs	r0, #3
	eors	r5, r0
	eors	r3, r7
	eors	r7, r6
	eors	r5, r4
	movs	r1, r3
	mvns	r0, r3
	ands	r0, r4
	mvns	r2, r4
	ands	r2, r5
	eors	r3, r2
	mvns	r2, r5
	ands	r2, r6
	eors	r4, r2
	mvns	r2, r7
	ands	r2, r1
	eors	r6, r2
	mvns	r2, r6
	ands	r2, r7
	eors	r5, r2
	eors	r7, r0
	eors	r4, r3
	eors	r3, r7
	eors	r6, r5
	mvns	r5, r5
	str	r7, [sp, #4]
	mov	r2, r9
	movs	r7, #4
	movs	r0, r3
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #5
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r3
	movs	r7, #10
	rors	r0, r0, r7
	eors	r0, r3
	mov	r8, r0
	movs	r7, #9
	movs	r3, r1
	rors	r3, r3, r7
	eors	r3, r2
	mov	r2, r10
	movs	r7, #11
	movs	r0, r2
	rors	r0, r0, r7
	eors	r0, r2
	movs	r1, r4
	rors	r1, r1, r7
	eors	r1, r4
	movs	r7, #20
	rors	r0, r0, r7
	eors	r0, r4
	mov	r9, r0
	movs	r7, #19
	movs	r4, r1
	rors	r4, r4, r7
	eors	r4, r2
	mov	r2, fp
	movs	r7, #2
	movs	r0, r5
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #3
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r5
	movs	r7, #1
	rors	r0, r0, r7
	eors	r0, r5
	mov	r10, r0
	movs	r5, r1
	eors	r5, r2
	mov	r2, ip
	movs	r7, #3
	movs	r0, r6
	rors	r0, r0, r7
	eors	r0, r2
	movs	r7, #4
	movs	r1, r2
	rors	r1, r1, r7
	eors	r1, r6
	movs	r7, #5
	rors	r1, r1, r7
	eors	r1, r6
	mov	fp, r1
	movs	r6, r0
	rors	r6, r6, r7
	eors	r6, r2
	ldr	r7, [sp, #4]
	str	r3, [sp, #4]
	mov	r2, lr
	movs	r3, #17
	movs	r0, r2
	rors	r0, r0, r3
	eors	r0, r2
	movs	r1, r7
	rors	r1, r1, r3
	eors	r1, r7
	movs	r3, #4
	rors	r0, r0, r3
	eors	r0, r7
	mov	ip, r0
	movs	r3, #3
	movs	r7, r1
	rors	r7, r7, r3
	eors	r7, r2
	ldr	r3, [sp, #4]
.L12:
	movs	r1, #0
	ldr	r0, [sp, #0]
	str	r1, [sp, #4]
	str	r3, [r0, #0]
	str	r4, [r0, #8]
	str	r5, [r0, #16]
	str	r6, [r0, #24]
	str	r7, [r0, #32]
	mov	r3, r8
	mov	r4, r9
	mov	r5, r10
	mov	r6, fp
	mov	r7, ip
	str	r3, [r0, #4]
	str	r4, [r0, #12]
	str	r5, [r0, #20]
	str	r6, [r0, #28]
	str	r7, [r0, #36]
	movs	r2, #0
	movs	r3, #0
	mov	ip, r2
	add	sp, sp, #8
	pop	{r2, r3, r4, r5}
	mov	r8, r2
	mov	r9, r3
	mov	r10, r4
	mov	fp, r5
	pop	{r4, r5, r6, r7, pc}
	.size	ascon_permute, .-ascon_permute

#endif
