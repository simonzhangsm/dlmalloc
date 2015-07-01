//
//  main.c
//  dlmalloc
//
//  Created by zhangshiming on 6/9/15.
//  Copyright (c) 2015 zhangshiming. All rights reserved.
//

#include <stdio.h>
#include "dlmalloc.c"

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("%d,%d,%d\n",MALLOC_ALIGNMENT,get_core_id(),get_cachelinesize());
    return 0;
}

