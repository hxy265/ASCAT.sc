printResults_all <- function(res,
                             outdir="./",
                             projectname="project")
{
    GAMMA <- 1
    if(any(names(res)=="gamma")) GAMMA <- res$gamma
    pdf(paste0(outdir,"/profiles_",projectname,".pdf"),width=15,height=4)
    for(i in 1:length(res$allTracks.processed))
    {
        try({cat(".")
            plotSolution(res$allTracks.processed[[i]],
                         purity=res$allSolutions[[i]]$purity,
                         ploidy=res$allSolutions[[i]]$ploidy,
                         gamma=GAMMA,
                         sol=res$allSolutions[[i]])
            title(names(res$allTracks)[i])
        })
        try({
            writeProfile(prof=res$allProfiles[[i]],
                         samplename=paste0(names(res$allTracks)[i],"_",projectname),
                         outdir=outdir)
        })
    }
    dev.off()
    if(any(grepl("refitted",names(res))))
    {
        pdf(paste0(outdir,"/profiles_",projectname,"_refitted.pdf"),width=15,height=4)
        for(i in 1:length(res$allTracks.processed))
        {
            cat(".")
            try({
                plotSolution(res$allTracks.processed[[i]],
                             purity=res$allSolutions.refitted.auto[[i]]$purity,
                             ploidy=res$allSolutions.refitted.auto[[i]]$ploidy,
                             gamma=GAMMA,
                             sol=res$allSolutions[[i]])
                title(paste0(names(res$allTracks)[i],"-refitted"))
            })
            try({
                writeProfile(prof=res$allProfiles.refitted.auto[[i]],
                             samplename=paste0(names(res$allTracks)[i],"_",projectname),
                             outdir=outdir)
            })
        }
        dev.off()
    }
    .mytry <- function(x,retVal=NA,...)
    {
        out <- try(x,silent=T,...)
        if(inherits(out,"try-error")) return(retVal)
        out
    }
    try({res <- append(res,
                       list(summary=list(allSols=data.frame(samplename=names(res$allTracks),
                                                            purity=sapply(res$allSolutions,function(x) .mytry(x$purity)),
                                                            ploidy=sapply(res$allSolutions,function(x) .mytry(x$ploidy))),
                                         allSols.refitted=if(!any(grepl("refitted",names(res)))) NULL
                                                          else
                                                              data.frame(samplename=names(res$allTracks),
                                                                         purity=sapply(res$allSolutions.refitted.auto,function(x) .mytry(x$purity)),
                                                                         ploidy=sapply(res$allSolutions.refitted.auto,function(x) .mytry(x$ploidy))))))})
    res
}
