package kr.co.alto.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import kr.co.alto.order.dto.GoodsDTO;
import kr.co.alto.order.dto.OrderDTO;

@Repository("orderDAO")
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public GoodsDTO getOrderClassInfo(String goods_code) throws DataAccessException {
		return sqlSession.selectOne("mapper.order.OrderClassInfo", goods_code);
	}

	@Override
	public GoodsDTO getOrderItemInfo(String goods_code) throws DataAccessException {
		return sqlSession.selectOne("mapper.order.OrderItemInfo", goods_code);
	}

	@Override
	public int addNewOrder(OrderDTO od) throws DataAccessException {
		return sqlSession.insert("mapper.order.InsertNewOrder", od);
	}

	@Override
	public int addNewOrderItem(List<GoodsDTO> orders) throws DataAccessException {
		return sqlSession.insert("mapper.order.InsertNewOrderItem", orders);
	}

	@Override
	public OrderDTO orderInfo(String mem_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.order.OrderInfo", mem_id);
	}

	@Override
	public int quanCheck(List result) throws DataAccessException {
		return sqlSession.update("mapper.order.quanCheck", result);
	}

}
