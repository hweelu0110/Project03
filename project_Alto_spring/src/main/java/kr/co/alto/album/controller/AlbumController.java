package kr.co.alto.album.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

public interface AlbumController {
	public ModelAndView Albumlist(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addNewAlbum(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	
	public ModelAndView Albumdetail(@RequestParam("album_num") int album_num, HttpServletRequest request,
									HttpServletResponse response) throws Exception;
	
	public ResponseEntity modAlbum(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	
	public ResponseEntity removeAlbum(@RequestParam("album_num") int album_num, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public void removeModImage(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
