# Copyright 2010 The FLWOR Foundation.
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
# http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# - Try to find the Graphviz lib on Windows
#
# This is a proxy module that calls the FindGraphviz.cmake module. Before
# doing that, we try to guess where Graphviz might be on the user's machine.
# The user should provide ZORBA_THIRD_PARTY_REQUIREMENTS which is a path where
# the Graphviz directory can be found. The Graphviz directory must have "graphviz"
# (case insensitive) in its name.
#
# This module helps the Windows user to avoid providing the following two
# variables when building Zorba:
# -D GRAPHVIZ_INCLUDE="path_to_3rd_party_dir\*graphviz*\src"
# -D GRAPHVIZ_LIBRARY="path_to_3rd_party_dir\*graphviz*\bin\[Release]\graphviz.lib"
#
# See the FindGraphviz.cmake module shipped with Zorba for more information.

FIND_PACKAGE_WIN32 (
  NAME "Graphviz"
  FOUND_VAR "GRAPHVIZ_FOUND"
  SEARCH_NAMES "graphviz"
)

IF (GRAPHVIZ_FOUND)

  # find the needed DLL's
  FIND_PACKAGE_DLLS_WIN32 (${FOUND_LOCATION} graph.dll)
  
ENDIF (GRAPHVIZ_FOUND)
