library(cowplot)
#scree plot
rd <- getReducedDims(proj, reducedDims = "IterativeLSI",dimsToUse = 1:50)
sd <- colSds(rd)
ggplot(data.frame(dims = 1:50, stdev = sd[1:50]))+geom_point(mapping = aes_string(x = 'dims', y = 'stdev'))+labs(x = "LSI",y="Standard Deviation") + theme_cowplot()
#cluster by sample
df %>% group_by(Clusters,Sample) %>% count() %>%  group_by(Clusters) %>% mutate(percent=100*n/sum(n)) %>% ungroup() %>%   ggplot(aes(x=Clusters,y=percent, fill=Sample)) + geom_col() +   ggtitle("Percentage of subjects  per cluster") + theme_cowplot()
