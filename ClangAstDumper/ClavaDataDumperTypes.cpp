//
// Created by JoaoBispo on 30/03/2018.
//

#include "ClavaDataDumper.h"
#include "ClangNodes.h"
#include "ClangEnums.h"

#include <bitset>
#include <limits>

const std::map<const std::string, clava::TypeNode > clava::TYPE_DATA_MAP = {
        {"BuiltinType", clava::TypeNode::BUILTIN_TYPE}
};

void clava::ClavaDataDumper::dump(const Type* T) {

    // Get classname
    const std::string classname = clava::getClassName(T);

    // Get corresponding DeclNode
    TypeNode typeNode = TYPE_DATA_MAP.count(classname) == 1 ? TYPE_DATA_MAP.find(classname)->second : TypeNode::TYPE;

    dump(typeNode, T);
}



void clava::ClavaDataDumper::dump(clava::TypeNode typeNode, const Type* T) {
    // Dump header
    llvm::errs() << getDataName(typeNode) << "\n";
    llvm::errs() << clava::getId(T, id) << "\n";
    //DumpHeader(getDataName(typeNode), T);

    switch(typeNode) {
        case clava::TypeNode::TYPE:
            DumpTypeData(T); break;
            //DumpTypeData(T->getCanonicalTypeUnqualified()); break;
//        case clava::TypeNode::QUAL_TYPE:
//            DumpQualTypeData(static_cast<const QualType *>(T)); break;
        case clava::TypeNode::BUILTIN_TYPE:
            DumpBuiltinTypeData(static_cast<const BuiltinType *>(T)); break;
        default: throw std::invalid_argument("ClangDataDumper::dump(TypeNode): Case not implemented, '"+ getName(typeNode) +"'");
    }
}




void clava::ClavaDataDumper::DumpTypeData(const Type *T) {
    Qualifiers noQualifiers;
    DumpTypeData(T, noQualifiers);
}



//void clava::ClavaDataDumper::DumpTypeData(const Type *T, Qualifiers &qualifiers) {
/**
 * Data dumper for Type. To be used by both top-level QualType nodes and unqualified types.
 * @param T
 */
//void clava::ClavaDataDumper::DumpTypeData(const QualType &T) {
//void clava::ClavaDataDumper::DumpTypeData(const QualType &T) {
void clava::ClavaDataDumper::DumpTypeData(const Type *T, Qualifiers &qualifiers) {
    //QualType canonicalType = T->getCanonicalTypeInternal();
    //SplitQualType T_split = canonicalType.split();

    //clava::dump(QualType::getAsString(T, qualifiers));
    //clava::dump(QualType::getAsString(T_split));

    // typeAsString
    //SplitQualType T_split = T.split();
    //clava::dump(QualType::getAsString(T_split));
    clava::dump(QualType::getAsString(T, qualifiers));

    // sugar
    //QualType SingleStepDesugar = T->getLocallyUnqualifiedSingleStepDesugaredType();
    //bool hasSugar = SingleStepDesugar != T->unqu;
    const Type *singleStepDesugar = T->getUnqualifiedDesugaredType();
    bool hasSugar = singleStepDesugar != T;
    clava::dump(hasSugar);


    //clava::dump(QualType::getAsString(T, T.getQualifiers()));
}



// Dumps the same information as DumpTypeData, and after that, information about QualType
void clava::ClavaDataDumper::dump(const QualType& T) {
    // Dump header
    llvm::errs() << "<QualTypeData>" << "\n";
    llvm::errs() << clava::getId(T, id) << "\n";
    //DumpHeader("<QualTypeData>", T.getAsOpaquePtr());

    auto qualifiers = T.getQualifiers();

    // Base type data
    //DumpTypeData(T.getCanonicalType());
    DumpTypeData(T.getTypePtr(), qualifiers);



    // Dump C99 qualifiers
    auto c99Qualifiers = qualifiers.getCVRQualifiers();
    const int numBits = std::numeric_limits<decltype(c99Qualifiers)>::digits;
    size_t numSetBits = std::bitset<numBits>(c99Qualifiers).count();

    // Dumps the number of C99 qualifiers, and then the name of the qualifiers
    clava::dump((int) numSetBits);
    if(qualifiers.hasConst()) {clava::dump("CONST");}
    if(qualifiers.hasRestrict()) {
        if(Context->getPrintingPolicy().LangOpts.C99)
            clava::dump("RESTRICT_C99");
        else
            clava::dump("RESTRICT");
    }
    if(qualifiers.hasVolatile()) {clava::dump("VOLATILE");}

    // Dumps address space
    unsigned addrspace = T.getAddressSpace();
    if(addrspace) {
        switch(addrspace) {
            case LangAS::opencl_global: clava::dump("GLOBAL"); break;
            case LangAS::opencl_local: clava::dump("LOCAL"); break;
            case LangAS::opencl_constant: clava::dump("CONSTANT"); break;
            case LangAS::opencl_generic: clava::dump("GENERIC"); break;
            default: clava::dump("DEFAULT");
        }
    } else {
        clava::dump("NONE");
    }
    clava::dump(addrspace);

/*    DumpTypeData(T.getTypePtr());

    DumpTypeData(const_cast<Type*>(static_cast<Type*>(T.getAsOpaquePtr())));
    llvm::errs() << "Opaque PTR dump:\n";
    static_cast<Type*>(T.getAsOpaquePtr())->dump();
    llvm::errs() << "Type PTR dump:\n";
    T.getTypePtr()->dump();
    // Dump info about constant, volatile
    */
    // Dump qualifiers as string
    //llvm::errs() << T.getQualifiers().getAsString() << "\n";

}

//void clava::ClavaDataDumper::DumpQualTypeData(const QualType *T) {

//}



void clava::ClavaDataDumper::DumpBuiltinTypeData(const BuiltinType *T) {
    DumpTypeData(T);

    clava::dump(T->getKind());
    clava::dump(T->getName(Context->getPrintingPolicy()));
    //clava::dump(T->isSugared());
}