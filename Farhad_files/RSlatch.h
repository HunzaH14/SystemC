#pragma once
#include <systemc.h>

SC_MODULE(RSLatch)
{
    sc_in<bool> A;
    sc_in<bool> B;
    sc_out<bool> D;


    sc_signal<bool> C;

    SC_CTOR(RSLatch) : A("A"), B("B"), C("C"), D("D")
    {
        SC_METHOD(process);
        sensitive << A << B << C << D;
    }

    void process()
    {
        C.write((A.read()||D.read())); // C <- A | D
        D.write(!B.read() && C.read()); // D <- !B & C
    }
};
