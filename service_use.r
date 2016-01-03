sud = read.csv("service_use_data.csv")
smoothScatter(
    sud$score, sud$contacts_q1 + sud$contacts_q2 + sud$contacts_q3,
    main="Service Usage", xlab="Score (observer C)", ylab="Contacts")
    #pch=17, col=rgb(127,127,127,127,maxColorValue=255))
