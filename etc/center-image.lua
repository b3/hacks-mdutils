--- center-image.lua – filter to center image on their line
---
--- ideas from https://pandoc.org/lua-filters.html#center-images-in-latex-and-html-output

if FORMAT:match 'latex' then
  function Image (elem)
    if elem.classes:includes("center", 1) then
      return {
        pandoc.RawInline('latex', '\\centerline{'),
        elem,
        pandoc.RawInline('latex', '}')
      }
    else
      return elem
    end
  end
end
