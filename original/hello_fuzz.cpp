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
        add(a , b);
    }

    return 0;  
}


