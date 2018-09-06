package com.tlite.utility;

import java.io.File;

public class UtilityClass {
	
	public static String makeDirectory(String driveName,String parentFolderName){
		
		 File file = new File(driveName+":\\"+parentFolderName);		 
	        if (!file.exists()) {
	            if (file.mkdir()) {
	                System.out.println("Directory is created!");
	            } else {
	                System.out.println("Failed to create directory!");
	            }
	        }
	        return driveName+":\\"+parentFolderName+"\\";
	        
	}
	
	public static String makeDirectory(String driveName,String parentFolderName,String childFolderName){
	        File files = new File(driveName+":\\"+parentFolderName+"\\"+childFolderName);
	        if (!files.exists()) {
	            if (files.mkdirs()) {
	                System.out.println("Multiple directories are created!");
	            } else {
	                System.out.println("Failed to create multiple directories!");
	            }
	        }
		
		return driveName+":\\"+parentFolderName+"\\"+childFolderName+"\\";		
	}
	
	public static int[] numbers(int start,int end){
		int[] numbers=new int[end];
		
		for(int i=0;i<end;i++){
			numbers[i]=start+i;			
		}		
		return numbers;		
		
	}
	
	/*public static void main(String[] args){
		System.out.println(UtilityClass.makeDirectory("D", "Report1"));
		System.out.println(UtilityClass.makeDirectory("D", "Report","Customer"));
		int[] numbers=UtilityClass.numbers(1, 50);
		for(int number: numbers){
			System.out.print(number);
		}
		
	}*/
	
}
