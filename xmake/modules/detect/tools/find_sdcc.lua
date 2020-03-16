--!A cross-platform build utility based on Lua
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- 
-- Copyright (C) 2015-2020, TBOOX Open Source Group.
--
-- @author      ruki
-- @file        find_sdcc.lua
--

-- imports
import("lib.detect.find_program")
import("lib.detect.find_programver")

-- find dmd 
--
-- @param opt   the argument options, e.g. {version = true}
--
-- @return      program, version
--
-- @code 
--
-- local dmd = find_sdcc()
-- 
-- @endcode
--
function main(opt)

    -- init options
    opt         = opt or {}
    opt.command = opt.command or "--version"
        
    -- add search pathes (sdk/bin)
    local bindir = get_config("bin")
    if bindir and os.isdir(bindir) then
        opt.pathes  = bindir
    end
    
    -- find program
    local program = find_program(opt.program or "sdcc", opt)

    -- find program version
    local version = nil
    if program and opt and opt.version then
        version = find_programver(program, opt)
    end

    -- ok?
    return program, version
end
