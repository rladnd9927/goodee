package dao;

import java.util.List;

import logic.Sale;

public interface SaleDao {
	List<Sale> list(String userId);
	Integer getMaxSaleId();
	void createSale(Sale sale);

}
