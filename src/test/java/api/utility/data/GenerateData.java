package api.utility.data;

public class GenerateData {
	
	public static String getEmail() {
		String prefix= "instructor_email";
		String provider = "@tekschool.us";
		
		int random = (int)(Math.random()*1000);
		String email= prefix+random+provider;
		return email;
	}
	
//	Generate Randon bumber 10 digit 
//	Return String randon 
	
	public static String getPhoneNumber() {
		String phoneNumber="2";
		for (int i=0; i<9; i++) {
			phoneNumber+=(int)(Math.random()*10);
		}
		return phoneNumber;
		
		
	}
	public static void main(String[] args) {
		System.out.println(getPhoneNumber());
	}
	
}
