
library(ggplot2)


data <- read.csv("penguins_size.csv")

numeric_cols <- sapply(data, is.numeric)

for (col in names(data)[numeric_cols]) {
  print(
    ggplot(data, aes_string(x = col)) +
      geom_histogram(fill = "skyblue", color = "black", bins = 15) + This line tells ggplot2 how to draw the histogram.
      labs(title = paste("Histogram of", col), x = col, y = "Frequency") +
      theme_minimal()
  )
}


categorical_cols <- sapply(data, is.character)
for (col in names(data)[categorical_cols]) {
  print(
    ggplot(data, aes_string(x = col)) +
      geom_bar(fill = "salmon", color = "black") +
      labs(title = paste("Bar Chart of", col), x = col, y = "Count") +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
  )
}




num_cols <- names(data)[sapply(data, is.numeric)]

for (x in num_cols) {
  for (y in num_cols) {
    if (x != y) {
      print(
        ggplot(data, aes_string(x = x, y = y, color = "species")) +
          geom_point(position = position_jitter(width = 0.3, height = 0.3), size = 2) +
          labs(title = paste(y, "vs", x), color = "species") +
          theme_minimal()
      )
    }
  }
}





for (col in num_cols) {
  print(
    ggplot(data, aes_string(x = "species", y = col, fill = "species")) +
      geom_violin(trim = FALSE, alpha = 0.6) +
      geom_boxplot(width = 0.1, fill = "white", outlier.shape = NA) +
      labs(title = paste("Violin Plot of", col, "species"),
           x = "species",
           y = col) +
      theme_minimal()
  )
}
