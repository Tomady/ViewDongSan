package co.MovingCenter.ViewDongSan.ej.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.MovingCenter.ViewDongSan.comm.service.WishVO;
import co.MovingCenter.ViewDongSan.ej.service.EjWishMapper;
import co.MovingCenter.ViewDongSan.ej.service.EjWishService;

@Repository("ejWishDao")
public class WishServiceImpl implements EjWishService {
	@Autowired
	private EjWishMapper map;
	
	@Override
	public int wishInsert(WishVO vo) {
		return map.wishInsert(vo);
	}

	@Override
	public int wishDelete(WishVO vo) {
		return map.wishDelete(vo);
	}

	@Override
	public List<WishVO> wishSelectList(WishVO vo) {
		return map.wishSelectList(vo);
	}

	@Override
	public int wishCheck(WishVO vo) {
		return map.wishCheck(vo);
	}

	@Override
	public List<WishVO> alreadyWishInputCheck(WishVO vo) {
		return map.alreadyWishInputCheck(vo);
	}

}
