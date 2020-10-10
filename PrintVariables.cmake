# I got the idea for including this file from https://www.youtube.com/watch?v=vyHp2YNUmSQ

function(printvariables)
    message(STATUS "The CMake SOURCE directory is ${CMAKE_SOURCE_DIR}")
    message(STATUS "The CMake BINARY directory is ${CMAKE_BINARY_DIR}")
    message(STATUS "The SOURCE directory of the '${PROJECT_NAME}' PROJECT is ${PROJECT_SOURCE_DIR}")
    message(STATUS "The BINARY directory of the '${PROJECT_NAME}' PROJECT is ${PROJECT_BINARY_DIR}")
    message(STATUS "The version of the current project is ${PROJECT_VERSION}")
    message(STATUS "The current SOURCE directory is ${CMAKE_CURRENT_SOURCE_DIR}")
    message(STATUS "The current BINARY directory is ${CMAKE_CURRENT_BINARY_DIR}")
    message(STATUS "The current script file is ${CMAKE_CURRENT_LIST_FILE}")
    message(STATUS "The current script directory is ${CMAKE_CURRENT_LIST_DIR}")
endfunction()
