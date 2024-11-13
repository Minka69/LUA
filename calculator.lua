-- Calculator with history and scientific functions

-- Initialize history table
local history = {}

-- Function to evaluate an expression
function evaluate(expr)
    local result, err = load("return " .. expr)
    if not result then
        return nil, "Invalid expression: " .. (err or "")
    end
    return result()
end

-- Function to add to history
function add_to_history(expr, result)
    table.insert(history, {expression = expr, result = result})
end

-- Function to display history
function display_history()
    print("\nHistory:")
    for i, entry in ipairs(history) do
        print(string.format("[%d] %s = %s", i, entry.expression, entry.result))
    end
end

-- Common scientific functions
math_functions = {
    sin = math.sin,
    cos = math.cos,
    tan = math.tan,
    log = math.log,
    log10 = math.log10,
    sqrt = math.sqrt,
    abs = math.abs,
    pi = math.pi,
    exp = math.exp
}

-- Function to handle user input and evaluate
function calculator()
    print("Welcome to the Lua Calculator!")
    print("Type 'exit' to quit or 'history' to view history.")
    print("You can use basic arithmetic, parentheses, and the following functions:")
    for func in pairs(math_functions) do
        print(" - " .. func)
    end

    while true do
        io.write("\nEnter an expression: ")
        local input = io.read()

        if input == "exit" then
            break
        elseif input == "history" then
            display_history()
        else
            -- Replace math function calls with 'math_functions' lookups
            for func in pairs(math_functions) do
                input = input:gsub(func, "math_functions." .. func)
            end

            local result, err = evaluate(input)
            if err then
                print("Error:", err)
            else
                print("Result:", result)
                add_to_history(input, result)
            end
        end
    end
end

calculator()

