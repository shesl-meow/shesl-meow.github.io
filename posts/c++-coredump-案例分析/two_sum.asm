Dump of assembler code for function two_sum(std::vector<int, std::allocator<int> >, int):
   0x000055555555523e <+0>:	push   rbp
   0x000055555555523f <+1>:	mov    rbp,rsp
   0x0000555555555242 <+4>:	push   r13
   0x0000555555555244 <+6>:	push   r12
   0x0000555555555246 <+8>:	push   rbx
   0x0000555555555247 <+9>:	sub    rsp,0x58
   0x000055555555524b <+13>:	mov    QWORD PTR [rbp-0x68],rdi
   0x000055555555524f <+17>:	mov    DWORD PTR [rbp-0x6c],esi
=> 0x0000555555555252 <+20>:	lea    rax,[rbp-0x23]
   0x0000555555555256 <+24>:	mov    rdi,rax
   0x0000555555555259 <+27>:	call   0x555555555a16 <std::allocator<int>::allocator()>
   0x000055555555525e <+32>:	mov    rax,QWORD PTR [rbp-0x68]
   0x0000555555555262 <+36>:	mov    rdi,rax
   0x0000555555555265 <+39>:	call   0x5555555559ec <std::vector<int, std::allocator<int> >::end()>
   0x000055555555526a <+44>:	mov    rbx,rax
   0x000055555555526d <+47>:	mov    rax,QWORD PTR [rbp-0x68]
   0x0000555555555271 <+51>:	mov    rdi,rax
   0x0000555555555274 <+54>:	call   0x5555555559c6 <std::vector<int, std::allocator<int> >::begin()>
   0x0000555555555279 <+59>:	mov    rdi,rax
   0x000055555555527c <+62>:	lea    rsi,[rbp-0x22]
   0x0000555555555280 <+66>:	lea    rcx,[rbp-0x21]
   0x0000555555555284 <+70>:	lea    rax,[rbp-0x60]
   0x0000555555555288 <+74>:	sub    rsp,0x8
   0x000055555555528c <+78>:	lea    rdx,[rbp-0x23]
   0x0000555555555290 <+82>:	push   rdx
   0x0000555555555291 <+83>:	mov    r9,rsi
   0x0000555555555294 <+86>:	mov    r8,rcx
   0x0000555555555297 <+89>:	mov    ecx,0x0
   0x000055555555529c <+94>:	mov    rdx,rbx
   0x000055555555529f <+97>:	mov    rsi,rdi
   0x00005555555552a2 <+100>:	mov    rdi,rax
   0x00005555555552a5 <+103>:	call   0x555555555a4e <std::unordered_set<int, std::hash<int>, std::equal_to<int>, std::allocator<int> >::unordered_set<__gnu_cxx::__normal_iterator<int*, std::vector<int, std::allocator<int> > > >(__gnu_cxx::__normal_iterator<int*, std::vector<int, std::allocator<int> > >, __gnu_cxx::__normal_iterator<int*, std::vector<int, std::allocator<int> > >, unsigned long, std::hash<int> const&, std::equal_to<int> const&, std::allocator<int> const&)>
   0x00005555555552aa <+108>:	add    rsp,0x10
   0x00005555555552ae <+112>:	lea    rax,[rbp-0x23]
   0x00005555555552b2 <+116>:	mov    rdi,rax
   0x00005555555552b5 <+119>:	call   0x555555555a32 <std::allocator<int>::~allocator()>
   0x00005555555552ba <+124>:	lea    rax,[rbp-0x60]
   0x00005555555552be <+128>:	mov    r12,rax
   0x00005555555552c1 <+131>:	lea    rax,[rbp-0x6c]
   0x00005555555552c5 <+135>:	mov    r13,rax
   0x00005555555552c8 <+138>:	mov    rax,QWORD PTR [rbp-0x68]
   0x00005555555552cc <+142>:	mov    rdi,rax
   0x00005555555552cf <+145>:	call   0x5555555559ec <std::vector<int, std::allocator<int> >::end()>
   0x00005555555552d4 <+150>:	mov    rbx,rax
   0x00005555555552d7 <+153>:	mov    rax,QWORD PTR [rbp-0x68]
   0x00005555555552db <+157>:	mov    rdi,rax
   0x00005555555552de <+160>:	call   0x5555555559c6 <std::vector<int, std::allocator<int> >::begin()>
   0x00005555555552e3 <+165>:	mov    rdx,r12
   0x00005555555552e6 <+168>:	mov    rcx,r13
   0x00005555555552e9 <+171>:	mov    rsi,rbx
   0x00005555555552ec <+174>:	mov    rdi,rax
   0x00005555555552ef <+177>:	call   0x555555555441 <std::any_of<__gnu_cxx::__normal_iterator<int*, std::vector<int> >, two_sum(std::vector<int>, int)::<lambda(int)> >(__gnu_cxx::__normal_iterator<int*, std::vector<int, std::allocator<int> > >, __gnu_cxx::__normal_iterator<int*, std::vector<int, std::allocator<int> > >, <lambda(int)>)>
   0x00005555555552f4 <+182>:	mov    ebx,eax
   0x00005555555552f6 <+184>:	nop
   0x00005555555552f7 <+185>:	lea    rax,[rbp-0x60]
   0x00005555555552fb <+189>:	mov    rdi,rax
   0x00005555555552fe <+192>:	call   0x555555555980 <std::unordered_set<int, std::hash<int>, std::equal_to<int>, std::allocator<int> >::~unordered_set()>
   0x0000555555555303 <+197>:	mov    eax,ebx
   0x0000555555555305 <+199>:	jmp    0x55555555533b <two_sum(std::vector<int, std::allocator<int> >, int)+253>
   0x0000555555555307 <+201>:	mov    rbx,rax
   0x000055555555530a <+204>:	lea    rax,[rbp-0x23]
   0x000055555555530e <+208>:	mov    rdi,rax
   0x0000555555555311 <+211>:	call   0x555555555a32 <std::allocator<int>::~allocator()>
   0x0000555555555316 <+216>:	mov    rax,rbx
   0x0000555555555319 <+219>:	mov    rdi,rax
   0x000055555555531c <+222>:	call   0x5555555550f0 <_Unwind_Resume@plt>
   0x0000555555555321 <+227>:	mov    rbx,rax
   0x0000555555555324 <+230>:	lea    rax,[rbp-0x60]
   0x0000555555555328 <+234>:	mov    rdi,rax
   0x000055555555532b <+237>:	call   0x555555555980 <std::unordered_set<int, std::hash<int>, std::equal_to<int>, std::allocator<int> >::~unordered_set()>
   0x0000555555555330 <+242>:	mov    rax,rbx
   0x0000555555555333 <+245>:	mov    rdi,rax
   0x0000555555555336 <+248>:	call   0x5555555550f0 <_Unwind_Resume@plt>
   0x000055555555533b <+253>:	lea    rsp,[rbp-0x18]
   0x000055555555533f <+257>:	pop    rbx
   0x0000555555555340 <+258>:	pop    r12
   0x0000555555555342 <+260>:	pop    r13
   0x0000555555555344 <+262>:	pop    rbp
   0x0000555555555345 <+263>:	ret    
End of assembler dump.