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

MESSAGE(STATUS "")
MESSAGE(STATUS "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
MESSAGE(STATUS "Configuring external module <graphviz>")
MESSAGE(STATUS "-------------------------------------------------------------")
MESSAGE(STATUS "")

CMAKE_MINIMUM_REQUIRED (VERSION 2.6)

PROJECT (zorba_graphviz_module)
ENABLE_TESTING ()
INCLUDE (CTest)

FIND_PACKAGE (Zorba REQUIRED HINTS "${ZORBA_BUILD_DIR}")
INCLUDE ("${Zorba_USE_FILE}")

SET_CMAKE_MODULE_PATH ()

IF(ZORBA_SUPPRESS_GRAPHVIZ)
  MESSAGE(STATUS "ZORBA_SUPPRESS_Graphviz is true - not searching for Graphviz.")
  
  MESSAGE(STATUS "")
  MESSAGE(STATUS "-------------------------------------------------------------")  
  MESSAGE(STATUS "Configuration FAILED for external module <graphviz>")
  
ELSE (ZORBA_SUPPRESS_GRAPHVIZ)
  MESSAGE (STATUS "Looking for Graphviz")
  FIND_PACKAGE(Graphviz)
  
  IF (GRAPHVIZ_FOUND)
    MESSAGE(STATUS "Found Graphviz library -- ${GRAPHVIZ_LIBRARIES}")
     
    INCLUDE_DIRECTORIES(${GRAPHVIZ_INCLUDE_DIRS})

    IF (GRAPHVIZ_LEGACY)
      MESSAGE(STATUS "Legacy version detected")
    ELSE (GRAPHVIZ_LEGACY)
      MESSAGE(STATUS "Current version detected")
      ADD_DEFINITIONS(-DGRAPHVIZ_USE_CGRAPH)
    ENDIF (GRAPHVIZ_LEGACY)
    
    ADD_SUBDIRECTORY ("src")    
    ADD_TEST_DIRECTORY("${PROJECT_SOURCE_DIR}/test_graphviz")
    
    MESSAGE(STATUS "")
    MESSAGE(STATUS "-------------------------------------------------------------")
    MESSAGE(STATUS "Configuration SUCCEEDED for external module <graphviz>")
    
  ELSE (GRAPHVIZ_FOUND)
    MESSAGE(STATUS "Graphviz library not found.")
    
    MESSAGE(STATUS "")
    MESSAGE(STATUS "-------------------------------------------------------------")  
    MESSAGE(STATUS "Configuration FAILED for external module <>")
    
  ENDIF (GRAPHVIZ_FOUND)
ENDIF (ZORBA_SUPPRESS_GRAPHVIZ)

DONE_DECLARING_ZORBA_URIS ()

MESSAGE(STATUS "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
