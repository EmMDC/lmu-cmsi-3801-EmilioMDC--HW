function change(amount)
  if math.type(amount) ~= "integer" then
    error("Amount must be an integer")
  end
  if amount < 0 then
    error("Amount cannot be negative")
  end
  local counts, remaining = {}, amount
  for _, denomination in ipairs({25, 10, 5, 1}) do
    counts[denomination] = remaining // denomination
    remaining = remaining % denomination
  end
  return counts
end

-- Write your first then lower case function here
function first_then_lower_case(list, predicate)
  for _, x in ipairs(list) do
    if predicate(x) then 
      return string.lower(x)  
    end
  end
  return nil  
end


-- Write your powers generator here
function powers_generator(base, limit)
  return coroutine.create(function ()
    local exponent = 0
    local value = base ^ exponent
    while value <= limit do
      coroutine.yield(value)
      exponent = exponent + 1
      value = base ^ exponent
    end
  end)
end
-- Write your say function here
function say(word)
  if word == nil then
    return ""
  end
  return function(next)
    if next == nil then
      return word
    else
      return say(word .. " " .. next)
    end
  end
end
-- Write your line count function here
function meaningful_line_count(filename)
    local valid_lines = 0
    local file = io.open(filename, "r")

    if not file then
        error("No such file: " .. filename)
    end

    for line in file:lines() do
        local stripped_line = line:gsub("^%s*(.-)%s*$", "%1")
        if stripped_line ~= "" and stripped_line:sub(1, 1) ~= "#" then
            valid_lines = valid_lines + 1
        end
    end

    file:close()
    return valid_lines
end
-- Write your Quaternion table here

Quaternion = {}

quaternionmeta = {
  __index = {
  coefficients = function(self)
    return {self.a, self.b, self.c, self.d}
  end,
  conjugate = function(self)
    return Quaternion.new(self.a, -self.b, -self.c, -self.d)
  end
  },
  __add = function(self, other)
    return Quaternion.new(self.a + other.a,self.b + other.b,self.c + other.c,self.d + other.d)
  end,
  __mul = function(self, other)
    return Quaternion.new(self.a * other.a - self.b * other.b - self.c * other.c - self.d * other.d,
      self.a * other.b + self.b * other.a + self.c * other.d - self.d * other.c,
      self.a * other.c - self.b * other.d + self.c * other.a + self.d * other.b,
      self.a * other.d + self.b * other.c - self.c * other.b + self.d * other.a)
  end,
  __eq = function(self, other)
    return self.a == other.a and self.b == other.b and self.c == other.c and self.d == other.d
  end,
  __tostring = function(self)
    local function format_term(value, unit)
        if value == 0 then
            return ""
        elseif value == 1 then
            return unit
        elseif value == -1 then
            return  '-' .. unit
        else
            return tostring(value) .. unit
        end
    end

    local string_rep = {}
     
    if self.a ~= 0 then
        table.insert(string_rep, tostring(self.a))
    end
    
    

    table.insert(string_rep, format_term(self.b, 'i'))
    table.insert(string_rep, format_term(self.c, 'j'))
    table.insert(string_rep, format_term(self.d, 'k'))
    -- Filter out any empty strings
    local filtered_string_rep = {}
    for _, term in ipairs(string_rep) do
        if term ~= "" then
            table.insert(filtered_string_rep, term)
        end
    end

    string_rep = filtered_string_rep
    if #string_rep == 0 then
        return "0"
    end
    local ans = table.concat(string_rep, "+")
    ans = string.gsub(ans,"%+%-", "-")
    return ans
    --return '<' .. self.a .. ',' .. self.b .. ',' .. self.c .. ',' ..self.d .. '>'
  end
}

Quaternion.new = function (a,b,c,d)
  return setmetatable({a = a,b = b,c = c,d = d}, quaternionmeta)
end