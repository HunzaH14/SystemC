#pragma once

#include <systemc.h>
#include <tlm.h>

// Convenience Sockets:
#include <tlm_utils/simple_initiator_socket.h>
#include <tlm_utils/simple_target_socket.h>
#include <tlm_utils/multi_passthrough_initiator_socket.h>
#include <tlm_utils/multi_passthrough_target_socket.h>

class Interconnect : sc_module
{
    public:
    tlm_utils::multi_passthrough_target_socket<Interconnect> tSocket;
    tlm_utils::multi_passthrough_initiator_socket<Interconnect> iSocket;

    sc_core::sc_time rDelay;
    uint64_t memSize;

    SC_HAS_PROCESS(Interconnect);
    
    Interconnect(
        sc_core::sc_module_name name, 
        uint64_t size, 
        sc_core::sc_time routingDelay)
    :tSocket("tSocket"), iSocket("iSocket")
    { 
        tSocket.register_b_transport(this, &Interconnect::b_transport);
        rDelay = routingDelay;
        memSize = size;
    }

    void b_transport(int num, tlm::tlm_generic_payload &trans, sc_time &delay)
    {
        // Annotate Bus Delay
        delay = delay + rDelay;

        int add = trans.get_address()% memSize;
        int portNum = trans.get_address()/ memSize;

        // Correct Address:
        trans.set_address(add);
        iSocket[portNum]->b_transport(trans, delay);
        
    }

    // Dummy method
    virtual tlm::tlm_sync_enum nb_transport_fw(
            tlm::tlm_generic_payload& trans,
            tlm::tlm_phase& phase,
            sc_time& delay )
    {
        SC_REPORT_FATAL(this->name(),"nb_transport_fw is not implemented");
        return tlm::TLM_ACCEPTED;
    }

    // Dummy method
    bool get_direct_mem_ptr(tlm::tlm_generic_payload& trans,
                            tlm::tlm_dmi& dmi_data)
    {
        SC_REPORT_FATAL(this->name(),"get_direct_mem_ptr is not implemented");
        return false;
    }

    // Dummy method
    unsigned int transport_dbg(tlm::tlm_generic_payload& trans)
    {
        SC_REPORT_FATAL(this->name(),"transport_dbg is not implemented");
        return 0;
    }

    // Dummy method:
    void invalidate_direct_mem_ptr(sc_dt::uint64 start_range,
                                   sc_dt::uint64 end_range)
    {
        SC_REPORT_FATAL(this->name(),"invalidate_direct_mem_ptr not implement");
    }

    // Dummy method:
    tlm::tlm_sync_enum nb_transport_bw(
            tlm::tlm_generic_payload& trans,
            tlm::tlm_phase& phase,
            sc_time& delay)
    {
        SC_REPORT_FATAL(this->name(),"nb_transport_bw is not implemented");
        return tlm::TLM_ACCEPTED;
    }

};