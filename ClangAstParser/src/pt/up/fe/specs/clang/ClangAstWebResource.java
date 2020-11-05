/**
 * Copyright 2016 SPeCS.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on
 * an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations under the License. under the License.
 */

package pt.up.fe.specs.clang;

import pt.up.fe.specs.util.providers.WebResourceProvider;

public interface ClangAstWebResource {

    static WebResourceProvider create(String resourceUrl, String version) {
        return WebResourceProvider.newInstance("http://specs.fe.up.pt/resources/clangast/", resourceUrl, version);
    }

    static WebResourceProvider create(String resourceUrl) {
        return WebResourceProvider.newInstance("http://specs.fe.up.pt/resources/clangast/", resourceUrl);
    }

    WebResourceProvider BUILTIN_INCLUDES = create("clang_builtin_includes_v7.0.1.zip", "v1.0");
    // WebResourceProvider LIBC_CXX = create("libcxx_7.0.1.zip", "v1.0");
    WebResourceProvider LIBC_CXX = create("libc_cxx.zip", "v2.5");

    WebResourceProvider LIBC_CXX_WINDOWS = create("libc_cxx_windows.zip", "v1.0");
    // WebResourceProvider LIBC_CXX_MAC_OS = create("libc_cxx_mac_os.zip", "v1.0");
    // WebResourceProvider LIBC_CXX_LINUX = create("libc_cxx_linux.zip", "v1.0");
    // WebResourceProvider LIBC_CXX_CENTOS6 = create("libc_cxx_centos6.zip", "v1.0");

    WebResourceProvider WIN_EXE = create("windows/clang_ast.exe", "v4.2.10");
    WebResourceProvider WIN_DLL1 = create("windows/libwinpthread-1.dll");
    WebResourceProvider WIN_DLL2 = create("windows/zlib1.dll");

    WebResourceProvider LINUX_EXE = create("linux_ubuntu_18/clang_ast", "v4.2.10");

    WebResourceProvider LINUX_ARMV7_EXE = create("linux_ubuntu_14_armv7/clang_ast", "v4.2.5");

    WebResourceProvider CENTOS_EXE = create("centos7/clang_ast", "v4.2.10");

    WebResourceProvider MAC_OS_EXE = create("macos/clang_ast", "v4.2.10");

    // private static final String BASE_URL = "http://specs.fe.up.pt/resources/clangast/";
    // private static final String BASE_URL = "http://192.168.55.89/resources/clangast/";
    /*
    private final String urlString;
    private final String version;
    
    private ClangAstWebResource(String path) {
        this(path, "v1.0");
    }
    
    private ClangAstWebResource(String path, String version) {
        this.urlString = path;
        this.version = version;
    }
    */
    // @Override
    // public String getUrlString() {
    // return urlString;
    // }
    /*
    @Override
    public String getResourceUrl() {
        return urlString;
    }
    
    @Override
    public String getRootUrl() {
        return BASE_URL;
    }
    
    @Override
    public String getVersion() {
        return version;
    }
    */
    // static List<WebResourceProvider> getWindowsResources() {
    // return Arrays.asList(WIN_DLL1, WIN_DLL2, WIN_DLL3);
    // }

}
