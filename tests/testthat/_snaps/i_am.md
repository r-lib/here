# i_am() sets the project root

    Code
      writeLines(dr)
    Output
      here() starts at <project root>.
      - This directory contains a file "prepare/penguins.R" with contents "115147ca-fedd-42ca-8650-2cb3dad0aebc" in the first 100 lines
      - Initial working directory: <project root>
      - Current working directory: <project root>

# i_am() fails with useful message

    Code
      here::i_am("prepare/penguins.R", uuid = "115147ca-fedd-42ca-8650-2cb3dad0aebc")
    Error <simpleError>
      Could not find associated project in working directory or any parent directory.
      - Path in project: prepare/penguins.R
      - File must contain: 115147ca-fedd-42ca-8650-2cb3dad0aebc
      - Current working directory: <working directory>
      Please open the project associated with this file and try again.

