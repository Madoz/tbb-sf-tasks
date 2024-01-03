global with sharing  class IpAddress{
    private String sIp; //ip as string
    private Double dIp; //ip as double
    
    private Double ipFromString(){
        String[] elts = sIp.split('\\.');
        return  Double.valueOf(elts[0]) * Math.pow(255, 3) + 
                Double.valueOf(elts[1]) * Math.pow(255, 2) +
                Double.valueOf(elts[2]) * Math.pow(255, 1) + //=*255
                Double.valueOf(elts[3]) * Math.pow(255, 0);  //=*1 
    }
    
    global IpAddress(String ip){
        sIp = ip;
        dIp = this.ipFromString();
    }
    
    global Double asDouble(){
        return dIp;
    }
    
    global Boolean isInRange(IpAddress lowBoundary, IpAddress highBoundary){
        return (this.asDouble() >= lowBoundary.asDouble()) && (this.asDouble() <= highBoundary.asDouble());
    }	
}