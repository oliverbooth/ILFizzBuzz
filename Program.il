.assembly ILFizzBuzz {}

.method static void main()
{
    .entrypoint
    .maxstack 1
    
    call void fizzbuzz()
    ret
}

.method static void fizzbuzz()
{
    .maxstack 2
    .locals init([0] int32 i, [1] string buffer, [2] bool flag)
    
    ldc.i4.s 1
    stloc.s i

    LOOPSTART:
        ldstr ""
        stloc.s buffer
        ldc.i4.s 0
        stloc.s flag

        FIZZ:
            ldloc.s i
            ldc.i4.s 3
            rem
            ldc.i4.s 0
            ceq
            brfalse.s BUZZ
            ldc.i4.s 1
            stloc.s flag
            ldloc.s buffer
            ldstr "Fizz"
            call string [System.Runtime]System.String::Concat(string,string)
            stloc.s buffer

        BUZZ:
            ldloc.s 0
            ldc.i4.s 5
            rem
            ldc.i4.s 0
            ceq
            brfalse.s BUFFER
            ldc.i4.s 1
            stloc.s flag
            ldloc.s buffer
            ldstr "Buzz"
            call string [System.Runtime]System.String::Concat(string,string)
            stloc.s buffer

        BUFFER:
            ldloc.s flag
            brfalse.s OUTPUT_NUMBER
            br.s OUTPUT_TEXT

            OUTPUT_NUMBER:
                ldloc.s i
                call void [System.Console]System.Console::WriteLine(int32)
                br.s CONTINUE

            OUTPUT_TEXT:
                ldloc.s buffer
                call void [System.Console]System.Console::WriteLine(string)
                br.s CONTINUE

        CONTINUE:
            ldloc.s i
            ldc.i4.s 1
            add
            stloc.s i
            ldloc.s i
            ldc.i4.s 100
            ble.s LOOPSTART

    ret
}
