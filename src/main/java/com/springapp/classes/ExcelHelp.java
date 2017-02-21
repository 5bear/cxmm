package com.springapp.classes;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 11369 on 2017/1/9.
 */
public class ExcelHelp {
    /**
     * 导入excel
     * @param path
     * @return
     */
    public static List<Map<String, String>> analysisfile(String path){

        List<Map<String, String>> result=new ArrayList<Map<String, String>>();
        Map<String,String> key=new HashMap<String, String>();

        try {
            File f = new File(path);
            InputStream in = new FileInputStream(f);

            HSSFWorkbook wb=new HSSFWorkbook(in);

            HSSFSheet hssfSheet=wb.getSheetAt(0);
            HSSFRow firstRow=hssfSheet.getRow(hssfSheet.getFirstRowNum());

            int iii=firstRow.getLastCellNum();
            for (int cellCount=firstRow.getFirstCellNum();cellCount<firstRow.getLastCellNum();cellCount++){
                HSSFCell cell=firstRow.getCell(cellCount);
                String value=cell.toString();
                key.put("" + cellCount, value);

            }

            for(int j=hssfSheet.getFirstRowNum()+1;j<=hssfSheet.getLastRowNum();j++){
                HSSFRow row=hssfSheet.getRow(j);
                Map<String,String> oneRow=new HashMap<String, String>();
                boolean IsEmpty=true;
                for (int cellCount=row.getFirstCellNum();cellCount<row.getLastCellNum();cellCount++){
                    HSSFCell cell=row.getCell(cellCount);
                    if(cell!=null) {
                        String value = cell.toString();
                        if (value != null && !value.equals("")){
                            oneRow.put(key.get(cellCount + ""), value);
                            IsEmpty=false;
                        }

                    }
                }
                if(!IsEmpty){
                    result.add(oneRow);
                }

            }
        } catch (Exception  e ) {

            e.printStackTrace();
        }


        return result;
    }//导入excel
}
