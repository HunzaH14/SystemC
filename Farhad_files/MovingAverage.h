#pragma once

#include <systemc.h>

SC_MODULE(MovingAverage){
    sc_in<unsigned int> xn;
    sc_in<bool> clk;
    sc_in<bool> rst;
    sc_out<unsigned int> yn;

    sc_signal<unsigned int> x0;
    sc_signal<unsigned int> x1;
    sc_signal<unsigned int> x2;

    SC_CTOR(MovingAverage): xn("xn"), clk("clk"), rst("rst"), yn("yn"), x0(0), x1(0), x2(0) {
        SC_METHOD(shift);
        sensitive << clk.pos() << rst;

        SC_METHOD(add);
        sensitive << xn << x0 << x1 << x2;

    }

    void shift(){
        if(rst){
            x0.write(0);
            x1.write(0);
            x2.write(0);
        } else if (clk.posedge()){
            x0.write(xn.read());
            x1.write(x0.read());
            x2.write(x1.read());
        }
    }

    void add () {
        yn.write((xn.read() + x0.read() + x1.read() + x1.read())/4);
    }
};
