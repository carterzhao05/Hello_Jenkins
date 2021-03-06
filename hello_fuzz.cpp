#include <stdint.h>
#include <stddef.h>
#include <iostream>

#include "fuzzer/FuzzedDataProvider.h"

#include "hello.h"

extern "C" int LLVMFuzzerTestOneInput(const uint8_t *Data, size_t Size) {

    FuzzedDataProvider dataProvider(Data, Size);
    while ( dataProvider.remaining_bytes() > 0 ) {
        int a = dataProvider.ConsumeIntegral<int>();
        int b = dataProvider.ConsumeIntegral<int>();
        char ab[2];
        ab[3]=1;
        std::cout<<ab[4]<<"\n";
        if(a>5) return 0;
        add(a , b);
    }

    return 0;  
}


