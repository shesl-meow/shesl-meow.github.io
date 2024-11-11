Dump of assembler code for function main():
   0x0000555555555346 <+0>:	push   rbp
   0x0000555555555347 <+1>:	mov    rbp,rsp
   0x000055555555534a <+4>:	push   r13
   0x000055555555534c <+6>:	push   r12
   0x000055555555534e <+8>:	push   rbx
   0x000055555555534f <+9>:	sub    rsp,0x48
   0x0000555555555353 <+13>:	lea    r12,[rip+0x3ce6]        # 0x555555559040 <._87>
   0x000055555555535a <+20>:	mov    r13d,0xd
   0x0000555555555360 <+26>:	lea    rax,[rbp-0x41]
   0x0000555555555364 <+30>:	mov    rdi,rax
   0x0000555555555367 <+33>:	call   0x555555555a16 <std::allocator<int>::allocator()>
   0x000055555555536c <+38>:	lea    rdx,[rbp-0x41]
   0x0000555555555370 <+42>:	mov    rsi,r12
   0x0000555555555373 <+45>:	mov    rdi,r13
   0x0000555555555376 <+48>:	mov    rcx,r12
   0x0000555555555379 <+51>:	mov    rbx,r13
   0x000055555555537c <+54>:	mov    rdi,rbx
   0x000055555555537f <+57>:	lea    rax,[rbp-0x60]
   0x0000555555555383 <+61>:	mov    rcx,rdx
   0x0000555555555386 <+64>:	mov    rdx,rdi
   0x0000555555555389 <+67>:	mov    rdi,rax
   0x000055555555538c <+70>:	call   0x555555555b34 <std::vector<int, std::allocator<int> >::vector(std::initializer_list<int>, std::allocator<int> const&)>
   0x0000555555555391 <+75>:	lea    rax,[rbp-0x41]
   0x0000555555555395 <+79>:	mov    rdi,rax
   0x0000555555555398 <+82>:	call   0x555555555a32 <std::allocator<int>::~allocator()>
   0x000055555555539d <+87>:	lea    rdx,[rbp-0x60]
   0x00005555555553a1 <+91>:	lea    rax,[rbp-0x40]
   0x00005555555553a5 <+95>:	mov    rsi,rdx
   0x00005555555553a8 <+98>:	mov    rdi,rax
   0x00005555555553ab <+101>:	call   0x555555555c00 <std::vector<int, std::allocator<int> >::vector(std::vector<int, std::allocator<int> > const&)>
   0x00005555555553b0 <+106>:	lea    rax,[rbp-0x40]
   0x00005555555553b4 <+110>:	mov    esi,0x69
   0x00005555555553b9 <+115>:	mov    rdi,rax
   0x00005555555553bc <+118>:	call   0x55555555523e <two_sum(std::vector<int, std::allocator<int> >, int)>
   0x00005555555553c1 <+123>:	movzx  eax,al
   0x00005555555553c4 <+126>:	mov    esi,eax
   0x00005555555553c6 <+128>:	lea    rdi,[rip+0x7cd3]        # 0x55555555d0a0 <_ZSt4cout@@GLIBCXX_3.4>
   0x00005555555553cd <+135>:	call   0x555555555100 <_ZNSolsEb@plt>
   0x00005555555553d2 <+140>:	lea    rax,[rbp-0x40]
   0x00005555555553d6 <+144>:	mov    rdi,rax
   0x00005555555553d9 <+147>:	call   0x555555555bbc <std::vector<int, std::allocator<int> >::~vector()>
   0x00005555555553de <+152>:	lea    rax,[rbp-0x60]
   0x00005555555553e2 <+156>:	mov    rdi,rax
   0x00005555555553e5 <+159>:	call   0x555555555bbc <std::vector<int, std::allocator<int> >::~vector()>
   0x00005555555553ea <+164>:	mov    eax,0x0
   0x00005555555553ef <+169>:	jmp    0x555555555436 <main()+240>
   0x00005555555553f1 <+171>:	mov    rbx,rax
   0x00005555555553f4 <+174>:	lea    rax,[rbp-0x41]
   0x00005555555553f8 <+178>:	mov    rdi,rax
   0x00005555555553fb <+181>:	call   0x555555555a32 <std::allocator<int>::~allocator()>
   0x0000555555555400 <+186>:	mov    rax,rbx
   0x0000555555555403 <+189>:	mov    rdi,rax
   0x0000555555555406 <+192>:	call   0x5555555550f0 <_Unwind_Resume@plt>
   0x000055555555540b <+197>:	mov    rbx,rax
   0x000055555555540e <+200>:	lea    rax,[rbp-0x40]
   0x0000555555555412 <+204>:	mov    rdi,rax
   0x0000555555555415 <+207>:	call   0x555555555bbc <std::vector<int, std::allocator<int> >::~vector()>
   0x000055555555541a <+212>:	jmp    0x55555555541f <main()+217>
   0x000055555555541c <+214>:	mov    rbx,rax
   0x000055555555541f <+217>:	lea    rax,[rbp-0x60]
   0x0000555555555423 <+221>:	mov    rdi,rax
   0x0000555555555426 <+224>:	call   0x555555555bbc <std::vector<int, std::allocator<int> >::~vector()>
   0x000055555555542b <+229>:	mov    rax,rbx
   0x000055555555542e <+232>:	mov    rdi,rax
   0x0000555555555431 <+235>:	call   0x5555555550f0 <_Unwind_Resume@plt>
   0x0000555555555436 <+240>:	add    rsp,0x48
   0x000055555555543a <+244>:	pop    rbx
   0x000055555555543b <+245>:	pop    r12
   0x000055555555543d <+247>:	pop    r13
   0x000055555555543f <+249>:	pop    rbp
   0x0000555555555440 <+250>:	ret    
End of assembler dump.