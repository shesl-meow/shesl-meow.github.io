Dump of assembler code for function EditElement(std::shared_ptr<Element>):
   0x0000000000204d00 <+0>:	push   %rbp
   0x0000000000204d01 <+1>:	mov    %rsp,%rbp
   0x0000000000204d04 <+4>:	sub    $0xa0,%rsp
   0x0000000000204d0b <+11>:	lea    -0x18(%rbp),%rax
   0x0000000000204d0f <+15>:	mov    %rax,-0x20(%rbp)
   0x0000000000204d13 <+19>:	mov    %rdi,-0x48(%rbp)
   0x0000000000204d17 <+23>:	mov    %rax,%rdi
   0x0000000000204d1a <+26>:	mov    %rax,-0x50(%rbp)
   0x0000000000204d1e <+30>:	callq  0x2050f0 <VoidObject::VoidObject()>
   0x0000000000204d23 <+35>:	jmpq   0x204d28 <EditElement(std::shared_ptr<Element>)+40>
   0x0000000000204d28 <+40>:	lea    -0x18(%rbp),%rax
   0x0000000000204d2c <+44>:	mov    %rax,-0x10(%rbp)
   0x0000000000204d30 <+48>:	movq   $0x1,-0x8(%rbp)
   0x0000000000204d38 <+56>:	mov    -0x48(%rbp),%rdi
   0x0000000000204d3c <+60>:	callq  0x205110 <std::__shared_ptr_access<Element, (__gnu_cxx::_Lock_policy)2, false, false>::operator->() const>
   0x0000000000204d41 <+65>:	mov    -0x10(%rbp),%rsi
   0x0000000000204d45 <+69>:	mov    -0x8(%rbp),%rdx
   0x0000000000204d49 <+73>:	mov    %rax,%rdi
   0x0000000000204d4c <+76>:	callq  0x205130 <std::vector<VoidObject, std::allocator<VoidObject> >::operator=(std::initializer_list<VoidObject>)>
   0x0000000000204d51 <+81>:	jmpq   0x204d56 <EditElement(std::shared_ptr<Element>)+86>
   0x0000000000204d56 <+86>:	lea    -0x18(%rbp),%rax
   0x0000000000204d5a <+90>:	mov    %rax,%rcx
   0x0000000000204d5d <+93>:	add    $0x1,%rcx
   0x0000000000204d64 <+100>:	mov    %rax,-0x58(%rbp)
   0x0000000000204d68 <+104>:	mov    %rcx,-0x60(%rbp)
   0x0000000000204d6c <+108>:	mov    -0x60(%rbp),%rax
   0x0000000000204d70 <+112>:	add    $0xffffffffffffffff,%rax
   0x0000000000204d76 <+118>:	mov    %rax,%rdi
   0x0000000000204d79 <+121>:	mov    %rax,-0x68(%rbp)
   0x0000000000204d7d <+125>:	callq  0x205100 <VoidObject::~VoidObject()>
   0x0000000000204d82 <+130>:	mov    -0x68(%rbp),%rax
   0x0000000000204d86 <+134>:	mov    -0x58(%rbp),%rcx
   0x0000000000204d8a <+138>:	cmp    %rcx,%rax
   0x0000000000204d8d <+141>:	mov    %rax,-0x60(%rbp)
   0x0000000000204d91 <+145>:	jne    0x204d6c <EditElement(std::shared_ptr<Element>)+108>
   0x0000000000204d97 <+151>:	lea    -0x30(%rbp),%rdi
   0x0000000000204d9b <+155>:	callq  0x2050f0 <VoidObject::VoidObject()>
   0x0000000000204da0 <+160>:	mov    -0x48(%rbp),%rax
   0x0000000000204da4 <+164>:	mov    %rax,%rdi
   0x0000000000204da7 <+167>:	callq  0x205110 <std::__shared_ptr_access<Element, (__gnu_cxx::_Lock_policy)2, false, false>::operator->() const>
   0x0000000000204dac <+172>:	lea    -0x30(%rbp),%rdi
   0x0000000000204db0 <+176>:	mov    %rax,-0x70(%rbp)
   0x0000000000204db4 <+180>:	callq  0x205100 <VoidObject::~VoidObject()>
   0x0000000000204db9 <+185>:	lea    -0x40(%rbp),%rdi
   0x0000000000204dbd <+189>:	callq  0x205180 <std::make_shared<VoidObject>()>
   0x0000000000204dc2 <+194>:	mov    -0x48(%rbp),%rax
   0x0000000000204dc6 <+198>:	mov    %rax,%rdi
   0x0000000000204dc9 <+201>:	callq  0x205110 <std::__shared_ptr_access<Element, (__gnu_cxx::_Lock_policy)2, false, false>::operator->() const>
   0x0000000000204dce <+206>:	add    $0x20,%rax
   0x0000000000204dd4 <+212>:	mov    %rax,%rdi
   0x0000000000204dd7 <+215>:	lea    -0x40(%rbp),%rsi
   0x0000000000204ddb <+219>:	callq  0x2051f0 <std::shared_ptr<VoidObject>::operator=(std::shared_ptr<VoidObject>&&)>
   0x0000000000204de0 <+224>:	lea    -0x40(%rbp),%rdi
   0x0000000000204de4 <+228>:	mov    %rax,-0x78(%rbp)
   0x0000000000204de8 <+232>:	callq  0x205240 <std::shared_ptr<VoidObject>::~shared_ptr()>
   0x0000000000204ded <+237>:	add    $0xa0,%rsp
   0x0000000000204df4 <+244>:	pop    %rbp
   0x0000000000204df5 <+245>:	retq   
   0x0000000000204df6 <+246>:	mov    %rax,-0x28(%rbp)
   0x0000000000204dfa <+250>:	mov    %edx,-0x2c(%rbp)
   0x0000000000204dfd <+253>:	mov    -0x20(%rbp),%rax
   0x0000000000204e01 <+257>:	mov    -0x50(%rbp),%rcx
   0x0000000000204e05 <+261>:	cmp    %rax,%rcx
   0x0000000000204e08 <+264>:	mov    %rax,-0x80(%rbp)
   0x0000000000204e0c <+268>:	je     0x204e43 <EditElement(std::shared_ptr<Element>)+323>
   0x0000000000204e12 <+274>:	mov    -0x80(%rbp),%rax
   0x0000000000204e16 <+278>:	add    $0xffffffffffffffff,%rax
   0x0000000000204e1c <+284>:	mov    %rax,%rdi
   0x0000000000204e1f <+287>:	mov    %rax,-0x88(%rbp)
   0x0000000000204e26 <+294>:	callq  0x205100 <VoidObject::~VoidObject()>
   0x0000000000204e2b <+299>:	mov    -0x88(%rbp),%rax
   0x0000000000204e32 <+306>:	mov    -0x50(%rbp),%rcx
   0x0000000000204e36 <+310>:	cmp    %rcx,%rax
   0x0000000000204e39 <+313>:	mov    %rax,-0x80(%rbp)
   0x0000000000204e3d <+317>:	jne    0x204e12 <EditElement(std::shared_ptr<Element>)+274>
   0x0000000000204e43 <+323>:	jmpq   0x204ea9 <EditElement(std::shared_ptr<Element>)+425>
   0x0000000000204e48 <+328>:	lea    -0x18(%rbp),%rcx
   0x0000000000204e4c <+332>:	mov    %rax,-0x28(%rbp)
   0x0000000000204e50 <+336>:	mov    %edx,-0x2c(%rbp)
   0x0000000000204e53 <+339>:	mov    %rcx,%rax
   0x0000000000204e56 <+342>:	add    $0x1,%rax
   0x0000000000204e5c <+348>:	mov    %rcx,-0x90(%rbp)
   0x0000000000204e63 <+355>:	mov    %rax,-0x98(%rbp)
   0x0000000000204e6a <+362>:	mov    -0x98(%rbp),%rax
   0x0000000000204e71 <+369>:	add    $0xffffffffffffffff,%rax
   0x0000000000204e77 <+375>:	mov    %rax,%rdi
   0x0000000000204e7a <+378>:	mov    %rax,-0xa0(%rbp)
   0x0000000000204e81 <+385>:	callq  0x205100 <VoidObject::~VoidObject()>
   0x0000000000204e86 <+390>:	mov    -0xa0(%rbp),%rax
   0x0000000000204e8d <+397>:	mov    -0x90(%rbp),%rcx
   0x0000000000204e94 <+404>:	cmp    %rcx,%rax
   0x0000000000204e97 <+407>:	mov    %rax,-0x98(%rbp)
   0x0000000000204e9e <+414>:	jne    0x204e6a <EditElement(std::shared_ptr<Element>)+362>
   0x0000000000204ea4 <+420>:	jmpq   0x204ea9 <EditElement(std::shared_ptr<Element>)+425>
   0x0000000000204ea9 <+425>:	mov    -0x28(%rbp),%rdi
   0x0000000000204ead <+429>:	callq  0x208860 <_Unwind_Resume@plt>
End of assembler dump.