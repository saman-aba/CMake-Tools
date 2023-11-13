function(initial_target_folder target_name folder_name)
    if(NOT "${folder_name}" STREQUAL "")
        set_target_properties(${target_name} PROPERTIES FOLDER ${folder_name})
    endif()
endfunction()

function(initial_target target_name)
    set(arglist ${ARGV})
    list(REMOVE_AT arglist 0)
    foreach(entry ${arglist})
        init_target_folder(${target_name} ${entry})
    endforeach(entry ${arglist})
    target_compile_features(${target_name} PRIVATE ${standard})

    if (WIN32 AND DESKTOP_APP_SPECIAL_TARGET)
        set_property(TARGET ${target_name} APPEND_STRING PROPERTY STATIC_LIBRARY_OPTIONS "$<IF:$<CONFIG:Debug>,,/LTCG>")
    endif()
endfunction()
    