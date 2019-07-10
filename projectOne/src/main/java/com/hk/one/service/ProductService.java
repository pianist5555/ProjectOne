package com.hk.one.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hk.one.dao.IProductDao;
import com.hk.one.dto.CategoryDto;
import com.hk.one.dto.ProductDto;

@Service
public class ProductService implements IProductService {
	
	@Autowired
	private IProductDao productDao;

	@Override
	public List<ProductDto> getAllProductList() {
		return productDao.getAllProductList();
	}
	@Override
	public String saveFile(MultipartFile file) {
		return productDao.saveFile(file);
	}

	@Override
	public ProductDto getProduct(int dto) {
		
		return productDao.getProduct(dto);
	}

	@Override
	public boolean insertProduct(ProductDto dto) {
		
		return productDao.insertProduct(dto);
	}

	@Override
	public boolean insertCategory(CategoryDto dto) {
		return productDao.insertCategory(dto);
	}

	@Override
	public boolean updateProductImg(ProductDto dto) {
		
		return productDao.updateProductImg(dto);
	}

	@Override
	public boolean updateProduct(ProductDto dto) {
		return productDao.updateProduct(dto);
	}

	@Override
	public boolean mulDelProduct(String[] seqs) {
		return productDao.mulDelProduct(seqs);
	}

	@Override
	public int countProductPage() {
		return productDao.countProductPage();
	}

	@Override
	public List<ProductDto> getAllProductList(String countProductPage) {
		return productDao.getAllProductList(countProductPage);
	
	}
	
	@Override 
	public boolean sortProduct(String dto) {
		return productDao.sortProduct(dto);
	}

}
