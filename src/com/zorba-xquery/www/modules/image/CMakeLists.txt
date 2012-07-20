# Copyright 2006-2010 The FLWOR Foundation.
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
#

########################################################################
# Graphviz
########################################################################
IF(ZORBA_SUPPRESS_GRAPHVIZ)
  MESSAGE(STATUS "ZORBA_SUPPRESS_Graphviz is true - not searching for Graphviz.")
ELSE (ZORBA_SUPPRESS_GRAPHVIZ)

  MESSAGE (STATUS "Looking for Graphviz")
  FIND_PACKAGE(Graphviz)
  
  IF (GRAPHVIZ_FOUND)
    MESSAGE(STATUS "Found Graphviz library -- "${GRAPHVIZ_LIBRARIES})
     
    INCLUDE_DIRECTORIES(${GRAPHVIZ_INCLUDE_DIRS})
    INCLUDE_DIRECTORIES("graphviz.xq.src")
    DECLARE_ZORBA_MODULE (VERSION 1.0 FILE "graphviz.xq"
      URI "http://www.zorba-xquery.com/modules/image/graphviz"  
      LINK_LIBRARIES "${GRAPHVIZ_LIBRARIES}")    
    
    ADD_TEST_DIRECTORY("${PROJECT_SOURCE_DIR}/test_graphviz")
    
  ELSE (GRAPHVIZ_FOUND)
    MESSAGE(STATUS "Graphviz library not found.")
  ENDIF (GRAPHVIZ_FOUND)
ENDIF (ZORBA_SUPPRESS_GRAPHVIZ)
MESSAGE(STATUS "") 
