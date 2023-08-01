package cgg.ecommerce.helpers;

public class DescriptionHelper {

	public static String getDescription(String desc) {
		String[] words = desc.split(" ");
		if(words.length>10) {
			String des="";
			for(int i=0;i<10;i++) {
				des=des+words[i]+" ";
			}
			return des+"....";
		}else {
			return desc+"...";
		}
	}
}
