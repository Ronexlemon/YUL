object "StoreYul"{
    code{
        //Contract Deployment
        datacopy(0,dataoffset("runtime"),datasize("runtime"))
        return(0,datasize("runtime"))

    }
    object "runtime"{

    }
}