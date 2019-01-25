#!/usr/bin/env texlua

-- Build script for "biblatex-nejm" files

-- Identify the bundle and module
module = "biblatex-nejm"

unpackfiles = { }

-- Install biblatex style files and use these as the sources
installfiles = {"*.cbx", "*.bbx"}
sourcefiles  = installfiles
typesetfiles = {"*.tex"}

checkengines = {"pdftex"}
checkruns    = 3

-- Release a TDS-style zip
packtdszip  = true


tagfiles = {"*.bbx", "*.cbx", "*.tex"}

function update_tag(file, content, tagname, tagdate)
  local isodate_scheme = "%d%d%d%d%-%d%d%-%d%d"
  local ltxdate_scheme = string.gsub(isodate_scheme, "%-", "/")
  local version_scheme = "%d+%.%d+%.%d+"
  local tagdate_ltx  = string.gsub(tagdate, "%-", "/")
  local tagyear      = string.match(tagdate, "%d%d%d%d")
  local tagname_safe = string.gsub(tagname, "^v", "")

  -- copyright header
  content = string.gsub(content, "Copyright %(c%) 2011%-%d%d%d%d by",
                                 "Copyright (c) 2011-".. tagyear .. " by")
  -- \ProvidesFile
  if  string.match(file, "%.bbx$")  or string.match(file, "%.cbx$") then
    return string.gsub(content , ltxdate_scheme .. " v" .. version_scheme,
                                 tagdate_ltx .. " v" .. tagname_safe)
  -- \titlepage stuff
  elseif string.match(file, "%.tex$") then
    content = string.gsub(content, "date%s*=%s*{" .. isodate_scheme .. "}",
                                   "date={" .. tagdate .."}")
    return string.gsub(content, "revision%s*=%s*{" .. version_scheme .. "}",
                                "revision={" .. tagname_safe .. "}")
  end
  return content
end

kpse.set_program_name ("kpsewhich")
if not release_date then
  dofile(kpse.lookup("l3build.lua"))
end