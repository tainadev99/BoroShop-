/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

/**
 *
 * @author sonnt
 */
public class HtmlHelper {
    public static String hyperlink(String label, String href)
    {
        return "<li class=\"page-item\"><a class=\"page-link\" href="+href+"\">" + label + "</a></li>"; 
    }
    
    public static String pager(int pageindex,int pagecount, int gap, String brand, String cate, String subcate, String sale, String desc, String asc)
    {
        if(brand==null)brand="";
        if(cate==null)cate="";
        if(subcate==null)subcate="";
        if(sale==null)sale="";
        if(desc==null)desc="";
        if(asc==null)asc="";
        
        String result = "";
        if(pageindex > gap+1)
            result += hyperlink("First","shop?page="+1+"&&brand="+brand+"&&cate="+cate+"&&subcate="+subcate+"&&sale="+sale+"&&desc="+desc+"&&asc="+asc);
        
        if(pageindex-gap<=0){
            for(int i=pageindex-1;i>0;i--)
            result += hyperlink(""+(pageindex -i),"shop?page="+(pageindex -i)+"&&brand="+brand+"&&cate="+cate+"&&subcate="+subcate+"&&sale="+sale+"&&desc="+desc+"&&asc="+asc);
        }
        for (int i = gap; i > 0; i--) {
            if(pageindex - gap > 0)
                result += hyperlink(""+(pageindex - i),"shop?page="+(pageindex - i)+"&&brand="+brand+"&&cate="+cate+"&&subcate="+subcate+"&&sale="+sale+"&&desc="+desc+"&&asc="+asc);
        }
        
        result += "<li class=\"page-item\"><a class=\"page-link abc\" href=\"#\">"+pageindex+"</a></li>";
        
        for (int i = 1; i <= gap; i++) {
            if(pageindex + gap < pagecount-1)
                result += hyperlink(""+(pageindex + i),"shop?page="+(pageindex + i)+"&&brand="+brand+"&&cate="+cate+"&&subcate="+subcate+"&&sale="+sale+"&&desc="+desc+"&&asc="+asc);
        }
        
        
        if(pageindex + gap < pagecount-1)
            result += hyperlink("Last","search1?page="+pagecount);
         if(pagecount-pageindex<=gap+1){
            for(int i=1;i<=pagecount-pageindex;i++){
                result += hyperlink(""+(pageindex + i),"shop?page="+(pageindex + i)+"&&brand="+brand+"&&cate="+cate+"&&subcate="+subcate+"&&sale="+sale+"&&desc="+desc+"&&asc="+asc);
            }
        }
        return result;
    }
    public static String pagerSearch(int pageindex,int pagecount, int gap, String name)
    {
        String result = "";
        if(pageindex > gap+1)
            result += hyperlink("First","search?page="+1+"&name="+name);
        
        for (int i = gap; i > 0; i--) {
            if(pageindex - gap > 0)
                result += hyperlink(""+(pageindex - i),"search?page="+(pageindex - i+"&name="+name));
        }
        
        result += "<span class=\"page_pageindex\">"+pageindex+"</span>";
        
        for (int i = 1; i <= gap; i++) {
            if(pageindex + gap < pagecount)
                result += hyperlink(""+(pageindex + i),"search?page="+(pageindex + i)+"&name="+name);
        }
        
        if(pageindex + gap < pagecount-1)
            result += hyperlink("Last","search?page="+pagecount+"&name="+name);
        return result;
    }
}
