seqdata = read.table("cost_per_genome.txt", head=T)
logged = log10(seqdata$amount)

par(mai=c(0.82,0.82,0.1,0.42))
plot(seqdata$order, logged, main="", xlab="Year", ylab="Cost ($)", xaxt="n", yaxt="n", ylim=c(2.9, 8.1))
axis(1, at=seqdata[seqdata$monthnum==10,"order"], labels=unique(seqdata$year)[-1], tick=T)
axis(2, at=8:3, labels=c("100M", "10M", "1M", "100K", "10K", "1K"))

for (i in 1:length(seqdata$amount)-1) {
	lines(x=c(seqdata$order[i], seqdata$order[i+1]), y=c(logged[i], logged[i+1]))
}

