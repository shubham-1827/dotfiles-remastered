return {
	"CRAG666/code_runner.nvim",
	event = "VeryLazy",

	config = function()
		require("code_runner").setup({
			filetype = {
				cpp = {
					"cd $dir && echo 'Compiling...' &&",
					"g++ $fileName -o $fileNameWithoutExt &&",
					"echo 'Running...' && echo '\n' &&",
					"$dir/$fileNameWithoutExt &&",
					"echo '\n' && echo 'Cleaning up...' &&",
					"if [ -f $dir/$fileNameWithoutExt ]; then rm -f $dir/$fileNameWithoutExt; fi",
				},
			},
		})
	end,
}
