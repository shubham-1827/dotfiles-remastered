local ls = require("luasnip")
local f = ls.function_node
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Ensure the prototype is only inserted once
local function ensure_array_declaration()
	local bufnr = vim.api.nvim_get_current_buf()
	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
	-- Skip if already declared
	for _, line in ipairs(lines) do
		if line:match("^void%s+array_in%s*%(") then
			return
		end
	end
	-- Find last #include and insert after it
	local insert_idx = 0
	for idx, line in ipairs(lines) do
		if line:match("^using") then
			insert_idx = idx
		end
	end
	vim.api.nvim_buf_set_lines(bufnr, insert_idx, insert_idx, false, {
		"",
		"void array_in(int arr[], int n);",
		"void array_out(int arr[], int n);",
	})
end

-- Ensure the definition is only appended once
local function ensure_array_definition()
	local bufnr = vim.api.nvim_get_current_buf()
	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
	-- Skip if already defined (by checking for definition comment)
	for _, line in ipairs(lines) do
		if line:match("^void%s+array_in%s*%(%s*int%s+arr%[%]%s*,%s*int%s+n%s*%)%s*%{") then
			return
		end
	end
	-- Append at end of file
	local total = #lines
	vim.api.nvim_buf_set_lines(bufnr, total, total, false, {
		"",
		"void array_in(int arr[], int n) {",
		"    for (int i = 0; i < n; ++i) {",
		"        cin >> arr[i];",
		"    }",
		"}",
		"",
		"void array_out(int arr[], int n) {",
		"    for (int i = 0; i < n; ++i) {",
		'        cout << arr[i] << " ";',
		"    }",
		"    cout << endl;",
		"}",
		"",
	})
end
ls.add_snippets("cpp", {
	s("cpp", {
		t({
			"#include <iostream>",
			" ",
			"using namespace std;",
			" ",
			"int main() {",
			" ",
			"  ",
		}),
		i(1, "le re lund ke ..."),
		t({ " ", " ", "  return 0;", "}" }),
	}),
	s("ain", {
		-- Insert declaration once
		f(ensure_array_declaration, {}),
		-- Place the function call in main
		t({ "array_in(arr, n);", " " }),
		t({ "array_out(arr, n);", " " }),
		-- Append definition once
		f(ensure_array_definition, {}),
	}),
	s("bsol", {
		t({ "/*", "" }),
		t({ "Problem : " }),
		i(1, "Name of problem"),
		t({ "", "Platform : " }),
		i(2, "Leetcode"),
		t({ "", "Link : " }),
		i(3, "Link to the problem"),
		t({ "", "Tags : " }),
		i(4, "Add problem tags"),
		t({ "", "", "" }),
		t({ "", "Think Before Coding the Problem : " }),
		t({ "", "", "Constriants : " }),
		i(5, "Check the Constriants"),
		t({ "", "Edge Cases : " }),
		i(6, "Add edge cases here"),
		t({ "", "Do Brute-Force Work : " }),
		i(7, "Yes or No"),
		t({ "", "*/" }),
	}),
	s("asol", {
		t({ "/*", "" }),
		t({ "Steps of logic formation : ", "" }),
		i(1, "Add steps to your logic formation here"),
		t({ "", "", "Time Complexity : ", "" }),
		t({ "  Worst Case : " }),
		i(2, "Enter Worst case"),
		t({ "", "  Average Case : " }),
		i(3, "Enter Average case"),
		t({ "", "  Best Case : " }),
		i(4, "Enter Best case"),
		t({ "", "Space Complexity : " }),
		i(5, "Add the space complexity"),
		t({ "", "", "Alternate Aproach : ", "" }),
		i(6, "Add your alternate approach, better or worse"),
		t({ "", "What Made the Question Tricky ? ", "" }),
		i(7, "State any complex parts of the problem"),
		t({ "", "*/" }),
	}),
	s("reflect", {
		t({ "/*", "" }),
		t({ "Final Reflections on the problem : " }),
		t({ "", "", "Patterns Used : " }),
		i(1, "eg. sliding window, prefix sum, fast slow pointers"),
		t({ "", "What did I learn from this ?", "" }),
		i(2, "Add you final insights you get from this problem"),
		t({ "", "*/" }),
	}),
})
