# Function for sum of squares for two input integers
sum_squares <- function(x,y) {
    x^2 + y^2
}

# Function for package installation
function_install_1 <- function(df_name) {
  for (i in 1:nrow(df_name)){
    install.packages(df_name[i,1], type="source", repos=NULL, lib=libPath)
  }
}


# Function for package installation with check for existing
function_install_2 <- function(df_name) {
  for (i in 1:nrow(df_name)){
        if (!require(strsplit(df_name[i,1],"_")[[1]][1])){
          install.packages(df_name[i,1], type="source", repos=NULL, lib=libPath)
          print(df_name[i,1])
    }
  }
}

# Function for package installation with check for existing v3
function_install_3 <- function(df_name) {
  for (i in 1:nrow(df_name)){
    if (strsplit(as.character(df_name[i,1]),"_")[[1]][1] %in% rownames(installed.packages(lib.loc=libPath))){
      install.packages(df_name[i,1], type="source", repos=NULL, lib=libPath)
      print(df_name[i,1])
    }
  }
}    


# Function for package installation with check for existing v3
function_install_4 <- function(df_name) {
  for (i in 1:nrow(df_name)){
    if (df_name[i,2] %in% rownames(installed.packages(lib.loc=libPath))){
      #print(df_name[i,2])
      print(paste0("Package ",df_name[i,2], " already installed."))
      } else {
        install.packages(df_name[i,1], type="source", repos=NULL, lib=libPath)
      }
  }
}    
