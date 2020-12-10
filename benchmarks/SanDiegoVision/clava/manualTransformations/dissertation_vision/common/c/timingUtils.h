#ifdef GCC
#define magic_timing_begin(cycleLo, cycleHi) {\
}\

#define magic_timing_end(cycleLo, cycleHi) {\
}\



#define magic_timing_report(cycleLo, cycleHi) {\
    printf("Timing report: %d %d\n", cycleLo, cycleHi); \
}\

 


#endif

#ifdef METRO
 
#define magic_timing_begin(cycleLo, cycleHi) {\
}

#define magic_timing_end(cycleLo, cycleHi) {\
}

#define magic_timing_report(cycleLo, cycleHi) {\
}

//#define metro_magic_timing_report(cycleLo, cycleHi) {\
//    asm volatile( "nop\n\t");\
//}

#endif

#ifdef BTL

#include "/u/kvs/raw/rawlib/archlib/include/raw.h"

#define magic_timing_begin(cycleLo, cycleHi) {\
    raw_magic_timing_report_begin();\
}

#define magic_timing_end(cycleLo, cycleHi) {\
    raw_magic_timing_report_end(); \
}

#define magic_timing_report(cycleLo, cycleHi) {\
    raw_magic_timing_report_print(); \
}

    
//
//void metro_magic_timing_begin(int cycleLo, int cycleHi)
//{
//    raw_magic_timing_report_begin();
//}
//
//void metro_magic_timing_end(int cycleLo, int cycleHi)
//{
//    raw_magic_timing_report_end();
//}
//
//void metro_magic_timing_report(int cycleLo, int cycleHi)
//{
//    raw_magic_timing_report_print();
//    return;
//}

#endif
