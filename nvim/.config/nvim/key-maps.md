## Incremental Selection (treesitter)

| Key  | Action               |
|:----|:---------------------|
| `gnn` | `init_selection`     |
| `grn` | `node_incremental`   |
| `grc` | `scope_incremental`  |
| `grm` | `node_decremental`   |

---

## Text‑objects (select)

| Key  | Description                                           |
|:----|:-------------------------------------------------------|
| `a=` | Select outer part of an assignment                    |
| `i=` | Select inner part of an assignment                    |
| `l=` | Select left hand side of an assignment                |
| `r=` | Select right hand side of an assignment               |
| `a:` | Select outer part of an object property               |
| `i:` | Select inner part of an object property               |
| `l:` | Select left part of an object property                |
| `r:` | Select right part of an object property               |
| `aa` | Select outer part of a parameter/argument             |
| `ia` | Select inner part of a parameter/argument             |
| `ai` | Select outer part of a conditional                    |
| `ii` | Select inner part of a conditional                    |
| `al` | Select outer part of a loop                           |
| `il` | Select inner part of a loop                           |
| `af` | Select outer part of a function call                  |
| `if` | Select inner part of a function call                  |
| `as` | Select around current scope                           |
| `is` | Select inner part of current scope                    |
| `am` | Select outer part of a method/function definition     |
| `im` | Select inner part of a method/function definition     |
| `ac` | Select outer part of a class                          |
| `ic` | Select inner part of a class                          |

---

## Text‑objects (swap)

| Key                   | Description                                  |
|:----------------------|:---------------------------------------------|
| `<leader>na`          | Swap parameter/argument with next            |
| `<leader>n:`          | Swap object property with next               |
| `<leader>nm`          | Swap function with next                      |
| `<leader>pa`          | Swap parameter/argument with previous        |
| `<leader>p:`          | Swap object property with previous           |
| `<leader>pm`          | Swap function with previous                  |

---

## Text‑objects (move)

### Next start

| Key   | Description                         |
|:------|:------------------------------------|
| `]f`  | Next function call start            |
| `]m`  | Next method/function def start      |
| `]c`  | Next class start                    |
| `]i`  | Next conditional start              |
| `]l`  | Next loop start                     |
| `]s`  | Next scope (locals query group)     |
| `]z`  | Next fold (folds query group)       |

### Next end

| Key   | Description                         |
|:------|:------------------------------------|
| `]F`  | Next function call end              |
| `]M`  | Next method/function def end        |
| `]C`  | Next class end                      |
| `]I`  | Next conditional end                |
| `]L`  | Next loop end                       |

### Previous start

| Key   | Description                         |
|:------|:------------------------------------|
| `[f`  | Prev function call start            |
| `[m`  | Prev method/function def start      |
| `[c`  | Prev class start                    |
| `[i`  | Prev conditional start              |
| `[l`  | Prev loop start                     |

### Previous end

| Key   | Description                         |
|:------|:------------------------------------|
| `[F`  | Prev function call end              |
| `[M`  | Prev method/function def end        |
| `[C`  | Prev class end                      |
| `[I`  | Prev conditional end                |
| `[L`  | Prev loop end                       |

---
