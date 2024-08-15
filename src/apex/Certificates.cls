public class Certificates {
    
   public static Map<String,Date> certificationMap = new  Map<String,Date>();
    public static void addCertificates(String certificate, Date issuedDate){
        
        certificationMap.put(certificate,issuedDate);
        
    }
    public static Integer certificatesCount(){
        return certificationMap.size();
        
    }
    List<String> certificateList = new List<String>();
    public static void certificatesAndDate(){
       
        for(String certificationName : certificationMap.keySet()){
            Date CertificationDate = certificationMap.get(certificationName);
            System.debug(certificationName+' - '+CertificationDate);
        }
    }
}