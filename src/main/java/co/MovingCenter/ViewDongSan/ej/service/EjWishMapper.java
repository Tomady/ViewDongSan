package co.MovingCenter.ViewDongSan.ej.service;

import java.util.List;

import co.MovingCenter.ViewDongSan.comm.service.WishVO;

public interface EjWishMapper {
	List<WishVO> wishSelectList(WishVO vo);
	List<WishVO> alreadyWishInputCheck(WishVO vo); // 내 위시리스트에 있는 건 input박스를 미리 체크해두기
	int wishCheck(WishVO vo); // 이미 위시리스트에 추가했는지 확인. 이미 있으면 1, 없으면 0 반환
	int wishInsert(WishVO vo);
	int wishDelete(WishVO vo);
}
