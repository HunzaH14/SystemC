#pragma once
#include <systemc.h>
#include <queue>

class SimpleFIFOInterface : public sc_interface
{
    public:
    virtual unsigned int read() = 0;
    virtual void write(unsigned int) = 0;
   
};

class SimpleFifo : public SimpleFIFOInterface
{
    private:
    std::queue<unsigned int> fifo;
    sc_event writtenEvent;
    sc_event readEvent;
    unsigned int maxSize;

    public:
    SimpleFifo(unsigned int size) : maxSize(size)
    {
    }

    unsigned int read()
    {
        if(fifo.empty() == true)
        {
            wait(writtenEvent);
        }
        unsigned int val = fifo.front();
        fifo.pop();
        readEvent.notify(SC_ZERO_TIME);
        return val;
    }

    void write(unsigned int d)
    {
        if(fifo.size() == maxSize)
        {
            wait(readEvent);
        }
        fifo.push(d);
        writtenEvent.notify(SC_ZERO_TIME);
    }

};