#include <systemc.h>
#include <queue>

using namespace std;

// ٍSpecifying the read and write methods.
class SimpleFIFOInterface : public sc_interface {
public:
    virtual unsigned int read() = 0;
    virtual void write(unsigned int val) = 0;
};

// Implementation of the FIFO
class SimpleFIFO : public SimpleFIFOInterface {
private:
    std::queue<unsigned int> fifo; // Queue to hold the FIFO data
    sc_event writtenEvent; // Event to notify of a write operation
    sc_event readEvent; // Event to notify of a read operation
    unsigned int maxSize; // Maximum size of the FIFO

public:
    // Constructor to initialize the FIFO with a maximum size
    SimpleFIFO(unsigned int size = 16) : maxSize(size) {}

    // Blocking read method
    unsigned int read() override {
        while(fifo.empty()) {
            wait(writtenEvent);
        }
        unsigned int val = fifo.front();
        fifo.pop();
        readEvent.notify(SC_ZERO_TIME); // Notify a read operation
        return val;
    }

    // Blocking write method
    void write(unsigned int val) override {
        while(fifo.size() == maxSize) {
            wait(readEvent);
        }
        fifo.push(val);
        writtenEvent.notify(SC_ZERO_TIME); // Notify a write operation
    }
};

// Producer module
SC_MODULE(Producer) {
    sc_port<SimpleFIFOInterface> out;

    SC_CTOR(Producer) {
        SC_THREAD(produce);
    }

    void produce() {
        unsigned int i = 0;
        while(true) {
            wait(1, SC_NS);
            out->write(i++);
            cout << "@" << sc_time_stamp() << " Producer wrote: " << i-1 << endl;
        }
    }
};

// Consumer module
SC_MODULE(Consumer) {
    sc_port<SimpleFIFOInterface> in;

    SC_CTOR(Consumer) {
        SC_THREAD(consume);
    }

    void consume() {
        while(true) {
            wait(4, SC_NS);
            unsigned int data = in->read();
            cout << "@" << sc_time_stamp() << " Consumer read: " << data << endl;
        }
    }
};

// Main function to tie everything together
int sc_main(int argc, char* argv[]) {
    Producer producer("Producer");
    Consumer consumer("Consumer");
    SimpleFIFO fifo(4); // Instantiate FIFO with a depth of 4

    // Bind ports
    producer.out(fifo);
    consumer.in(fifo);

    // Start the simulation
    sc_start(100, SC_NS);
    return 0;
}