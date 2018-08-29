# create matrix
demo_data <- rbind(DemoWages$Women, DemoWages$Men)

barplot(demo_data, ylim = c(0, 1600), names.arg = NULL, beside = TRUE, col = c("purple", "orange"), 
        main = "Median usual weekly earnings of women and men who are full-time\n wage and salary workers, by race and Hispanic or Latino ethnicity, 2017")
# add column names 
colnames(demo_data) <- c("Total", "White", "Black", "Asian", "Hispanic")
par(font=2)
legend("top", c("Women","Men"), horiz = TRUE, text.width = 0.9, bty = "n", inset = -.02, cex = 0.95, fill = c("purple","orange"))

# add line through x-axis
abline(h= (0), lwd = 2 )
