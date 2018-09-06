package com.tlite.report.controller;

import java.io.File;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

import com.tlite.connection.DBConnection;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperPrintManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;
import net.sf.jasperreports.export.SimpleXlsxReportConfiguration;


public class ExportReport {
	private static Connection conn = null;
	
	public static JasperReport compileReport(File reportFile){
		String reportFilePath=reportFile.getPath();
		JasperReport jasperReport=null;
		try {
			jasperReport = JasperCompileManager.compileReport(reportFilePath);			
		} catch (JRException e) {			
			e.printStackTrace();
		}				
		return jasperReport;
	}
	
	public static String exportReport(File reportFile,Map<String,Object> parameters,String reportType,String location,String fileName) {
		try {
			
			String reportFilePath=reportFile.getPath();
			
			conn = DBConnection.getConnection();	
			
			
			JasperReport jasperReport = JasperCompileManager.compileReport(reportFilePath);	
			
			JasperPrint japerPrint = (JasperPrint) JasperFillManager.fillReport(jasperReport, parameters, conn);

			
	        JasperPrint xlsPrint =(JasperPrint) JasperFillManager.fillReport(jasperReport, parameters,conn);
	        
	      
	     
			if(reportType.equalsIgnoreCase("pdf")){
				
			JasperExportManager.exportReportToPdfFile(japerPrint,location+fileName);
			
			/*JasperPrintManager.printReport(japerPrint, true); */
			
			
			System.out.println("Report Generated");
			
			
			return "pdf Report Generated";
			
			
			
			}else if(reportType.equalsIgnoreCase("html")){
				JasperExportManager.exportReportToHtmlFile(japerPrint,location+fileName);
				return "HTML Report Generated";
			}else if(reportType.equalsIgnoreCase("xls")){
				//Configuration for xls type				
			     /*   ByteArrayOutputStream output = new ByteArrayOutputStream();
			        OutputStream outputfile= new FileOutputStream(new File(location+"fileName.xls"));
			        // coding For Excel:			         
				//JasperExportManager.exportReportToPdfFile(xlsPrint,location+"fileName.xls");
				JRXlsxExporter exporter = new JRXlsxExporter();			
				exporter.setExporterInput(new SimpleExporterInput(xlsPrint));
				exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(outputfile));
				SimpleXlsxReportConfiguration configuration = new SimpleXlsxReportConfiguration();
				configuration.setOnePagePerSheet(false);
				configuration.setRemoveEmptySpaceBetweenRows(true);
				configuration.setDetectCellType(true);// Set configuration as you like it!!
				configuration.setWhitePageBackground(false);
				configuration.setCollapseRowSpan(false);
				configuration.isImageBorderFixEnabled();
							
				exporter.setConfiguration(configuration);      //sets the configuration
				exporter.exportReport();
				outputfile.write(((ByteArrayOutputStream) outputfile).toByteArray()); 
				return "Excel Report Generated";*/
				
				
				
				
				//Configuration for xls type
				SimpleXlsxReportConfiguration configuration = new SimpleXlsxReportConfiguration();
				configuration.setDetectCellType(true);// Set configuration as you like it!!
				configuration.setCollapseRowSpan(false);
				configuration.isImageBorderFixEnabled();
				
				JRXlsxExporter exporter = new JRXlsxExporter();			
				exporter.setExporterInput(new SimpleExporterInput(japerPrint));
				exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(location+fileName));			
				exporter.setConfiguration(configuration);      //sets the configuration
				exporter.exportReport();
				return "Excel Report Generated";
			}		
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {

			try {
				if (conn != null) {
					conn.close();
				} else
					System.out.println("conn object is null on SupplierReport");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "Report Not Generated";

	}
}
