//
// Created by JoaoBispo on 18/03/2018.
//

#include "InfoDumper.h"

#include <sstream>

InfoDumper::InfoDumper(int id) : id(id)  {};

void InfoDumper::DumpHeader(const std::string tag, const void *pointer) {
    llvm::errs() << tag << "\n";
    llvm::errs() << getId(pointer) << "\n";
}

std::string InfoDumper::getId(const void* addr) {
    std::stringstream ss;
    ss <<  addr << "_" << id;

    return ss.str();
}

