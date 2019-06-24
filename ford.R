ford=function(name="Biol scis"){
  df=read.table("ais.txt",header=T)
  df=df[df$Ford==toupper(name),]
  rownames(df)=1:nrow(df)
  print(df)
}
