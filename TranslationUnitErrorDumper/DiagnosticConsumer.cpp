//
// Created by JoaoBispo on 07/08/2020.
//

#include "DiagnosticConsumer.h"

void DiagnosticConsumer::printRange(clang::Diagnostic Info, clang::CharSourceRange range, clang::SourceManager & SM) {
    std::string begin = range.getBegin().printToString(SM);
    std::string location = Info.getLocation().printToString(SM);
    std::string end = range.getEnd().printToString(SM);
    std::string filepath = begin.substr(0,begin.find(':'));
    int index1 = begin.find(':') + 1;
    int index2 = begin.find(':', index1) + 1;
    std::string line_number_str = begin.substr(index1, index2-index1-1);
    int pos_begin = 0;
    if ((begin.compare("<invalid loc>")==0) && (location.compare("<invalid loc>")==0)) {
        return;
    }
    else if (begin.compare("<invalid loc>")==0) {
        int index1 = location.find(':') + 1;
        int index2 = location.find(':', index1) + 1;
        line_number_str = location.substr(index1, index2-index1-1);
    }
    else if (location.compare("<invalid loc>")==0) {
        int index1 = begin.find(':') + 1;
        int index2 = begin.find(':', index1) + 1;

    }
    else {
        pos_begin = fmin(std::stoi(begin.substr(index2)), std::stoi(location.substr(index2)));
    }
    int line_number = stoi(line_number_str);
    std::ifstream file;
    file.open(filepath);
    std::string line;
    //std::string sourceCode = "";
    for (int i=0; i <line_number; i++) {
        std::getline(file, line);
        //sourceCode += line;
    }
    //std::string sourceCode = line.substr(pos_begin-1, pos_end - pos_begin);
    //if (sourceCode.empty()){
    if (pos_begin > 0) {
        pos_begin -= 1;
    }
    std::string snippet = line.substr(pos_begin);
    //}
    llvm::errs() << "source\n";
    llvm::errs() << snippet << "\n";

    return;
}



void  DiagnosticConsumer::HandleDiagnostic(clang::DiagnosticsEngine::Level DiagLevel,
                          const clang::Diagnostic& Info) {
    unsigned diagId = Info.getID();
    llvm::errs() << "<Clang Error>" << "\n";
    llvm::errs() << diagId << '\n';

    llvm::errs() << "message\n";
    llvm::SmallVector<char, 128> message;
    Info.FormatDiagnostic(message);
    llvm::errs() << message << '\n';
    if (Info.getNumArgs() > 0) {
        for (unsigned int i = 0; i < Info.getNumArgs(); i++){
            auto argKind = Info.getArgKind(i);
            //llvm::errs() << "arkKind\n";
            //llvm::errs() << Info.getArgKind(i) << "\n";
            switch (argKind) {
                case clang::DiagnosticsEngine::ak_identifierinfo:
                    //  llvm::errs() << "<STORE_KEY_VALUE>\n";
                    llvm::errs() << "identifier_name\n";
                    llvm::errs() << Info.getArgIdentifier(i)->getName();
                    break;
                case clang::DiagnosticsEngine::ak_std_string:
                    llvm::errs() << "string\n";
                    llvm::errs() << Info.getArgStdStr(i);
                    break;
                case clang::DiagnosticsEngine::ak_c_string:
                    llvm::errs() << "c_string\n";
                    llvm::errs() << Info.getArgCStr(i);
                    break;
                case clang::DiagnosticsEngine::ak_sint:
                    llvm::errs() << "sint\n" << Info.getArgSInt(i);
                    break;
                case clang::DiagnosticsEngine::ak_uint:
                    llvm::errs() << "uint\n" << Info.getArgUInt(i);
                    break;
                case clang::DiagnosticsEngine::ArgumentKind::ak_qualtype:
                    llvm::errs() << "qualtype\n";
                    llvm::errs() << ((clang::QualType *) Info.getRawArg(i))->getAsString();
                    break;
                case clang::DiagnosticsEngine::ArgumentKind::ak_declarationname:
                    llvm::errs() << "declaration_name\n";
                    llvm::errs() << ((clang::DeclarationName *) Info.getRawArg(i))->getAsIdentifierInfo();
                    /*   llvm::errs() << "\n";
                       llvm::errs() <<  ((clang::DeclarationName *) Info.getRawArg(i))->getCXXLiteralIdentifier();
                       llvm::errs() << "\n";
                       llvm::errs() <<  ((clang::DeclarationName *) Info.getRawArg(i))->getCXXNameType().getAsString();
                       llvm::errs() << "\n";
                       llvm::errs() <<  ((clang::DeclarationName *) Info.getRawArg(i))->getNameKind();
                       llvm::errs() << "\n";*/
                    /*       llvm::SmallVectorImpl<char> OutStr = llvm::SmallVectorImpl<char>(5);
                           Info.getDiags()->ConvertArgToString(clang::DiagnosticsEngine::ArgumentKind::ak_declcontext,
                                                               Info.getRawArg(i),
                                                               llvm::StringRef("Modifier", 5),
                                                               llvm::StringRef("Argument", 5),
                                                               clang::SmallVector<clang::DiagnosticsEngine::ArgumentValue, 8>(),
                                                                       "",
                                                               clang::SmallVector<intptr_t, 2>());*/
                    //  llvm::errs() <<  ((clang::DeclarationName *) Info.getRawArg(i))->getAsString();
                    break;
                case clang::DiagnosticsEngine::ArgumentKind::ak_declcontext:
                    llvm::errs() << "declcontext\n";
                    llvm::errs() << ((clang::DeclContext *) Info.getRawArg(i))->getDeclKindName();
                    //llvm::errs() <<  ((clang::DeclContext *) Info.getRawArg(i))->get
                    //getIdentifier()->getName();
                    break;
                default:
                    llvm::errs() << "invalid argKind\n";
                    break;
            }
            llvm::errs() << "\n";

        }
        /*llvm::errs() << "num ranges\n";
        llvm::errs() << Info.getNumRanges() << "\n";*/
        for (unsigned int i = 0; i < Info.getNumRanges(); i++){
            clang::SourceManager &SM = Info.getSourceManager();
            //              llvm::errs() << "source_range\n";
            //                llvm::errs() << Info.getRange(i).printToString(Info.getSourceManager()) << "\n";

            printRange(Info, Info.getRange(i), SM);
        }

    }
    llvm::errs() << "location\n";
    llvm::errs() << Info.getLocation().printToString(Info.getSourceManager()) << "\n";

    llvm::errs() << "<Clang Error End>\n";
    llvm::errs() << " \n";


}