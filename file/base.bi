#inclib "base"
extern "C"
#include once "./file/kernels.bi"
end extern
extern "C"

	declare sub clears cdecl alias "clears"()
	declare sub scrollb8000 cdecl alias "scrollb8000"()
	declare sub copyb8000 cdecl alias "copyb8000"(address as integer ,s as byte ptr)
	declare sub locates cdecl alias "locate"(x as integer,y as integer)
	declare sub prints cdecl alias "print"(s as byte ptr)
	declare function mallocs cdecl alias "malloc"(length as integer) as byte ptr
	declare sub strcpys cdecl alias "strcpys"(dest as byte ptr, src as byte ptr)
	declare sub strcats cdecl alias "strcats"(s1 as byte ptr,s2 as byte ptr)
	declare sub strnfill cdecl alias "strnfill"(s1 as byte ptr,s2 as byte,n as integer)
	declare function hello cdecl alias "c_hello"() as byte ptr
end extern

type ostring
    pors1 as byte ptr
    declare Operator &= (byval pors1 as byte ptr)
    declare Operator += (byval pors1 as byte ptr)
    declare Operator *= (byval pors1 as integer)
    
end type


operator ostring.&= (byval pors1 as byte ptr)
     strcpys(This.pors1,pors1 )
end operator

operator ostring.+= (byval pors1 as byte ptr)
     strcats(This.pors1,pors1 )
end operator

operator ostring.*= (byval pors1 as integer)
     This.pors1=mallocs(pors1)
end operator


function toString (byval pors1 as ostring)as byte ptr
      return pors1.pors1
end function

