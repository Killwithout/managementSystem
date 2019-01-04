package com.cjk.controller;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.HybridBinarizer;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import com.swetake.util.Qrcode;

/**
 * 二维码
 * @author admin
 *
 */

@Controller
@RequestMapping("/QRcode")
public class QRcodeController {
	
	@RequestMapping("/zxing")
	@ResponseBody
	public ModelAndView zxing(){
		
		ModelAndView model = new ModelAndView("QRcode");
		
		int width = 300;
		int height = 300;
		String format = "png";
		String contents = "这是一个二维码，你就扫吧！";
		
		//定义二维码的参数
		HashMap hints = new HashMap();
		hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
		hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.M);
		hints.put(EncodeHintType.MARGIN,2);
		
		//生成
		try {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time = df.format(new Date());
			String imgName = time.replaceAll("[[\\s-:punct:]]","");
			
			BitMatrix bitMatrix = new MultiFormatWriter().encode(contents, BarcodeFormat.QR_CODE, width, height,hints);
			Path file = new File("F:/study/images/"+imgName+".png").toPath();
			MatrixToImageWriter.writeToPath(bitMatrix, format, file);
			model.addObject("imgName",imgName);
			model.addObject("state","1");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	/**
	 * 读取、识别二维码
	 */
	@RequestMapping("/readQRcode")
	@ResponseBody
	public Map readQRcode(@RequestParam(value = "imgName") String imgName){
		Map map = new HashMap<Object, Object>();
		try {
			MultiFormatReader formatReader = new MultiFormatReader();
			File file = new File("F:/study/images/"+imgName);
			BufferedImage image = ImageIO.read(file);
			BinaryBitmap binaryBitmap = new BinaryBitmap(new HybridBinarizer(new BufferedImageLuminanceSource(image)));
			
			//定义二维码的参数
			HashMap hints = new HashMap();
			hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
			
			Result result = formatReader.decode(binaryBitmap, hints);
			map.put("result", result.toString());
			map.put("resultType", result.getBarcodeFormat());
			map.put("resultContent", result.getText());
		} catch (NotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping("/QRcode2")
	@ResponseBody
	public void QRcode2() throws Exception{
		Qrcode x = new Qrcode();
		x.setQrcodeErrorCorrect('M');//纠错等级
		x.setQrcodeEncodeMode('B');//N代表数字，A代表a-Z,B代表其它
		x.setQrcodeVersion(7);//版本
		String qrData = "第二次测试";
		int width = 67 + 12 * (7 - 1);
		int height = 67 + 12 * (7 - 1);
		
		BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics2D gs = bufferedImage.createGraphics();
		gs.setColor(Color.BLACK);
		gs.setBackground(Color.WHITE);
		gs.clearRect(0, 0, width, height);
		
		int pixoff = 7;//偏移量
		
		byte[] d = qrData.getBytes("gb2312");
		if(d.length>0 && d.length<120){
			boolean[][] s = x.calQrcode(d);
			for(int i=0;i<s.length;i++){
				for(int j=0;j<s.length;j++){
					if(s[j][i]){
						gs.fillRect(j*3, i*3, 3, 3);
					}
				}
			}
		}
		gs.dispose();
		bufferedImage.flush();
		ImageIO.write(bufferedImage, "png", new File("F:/study/images/22222.png"));
		
	}
	
	
}
