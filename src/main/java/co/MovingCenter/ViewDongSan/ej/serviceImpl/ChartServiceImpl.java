package co.MovingCenter.ViewDongSan.ej.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.MovingCenter.ViewDongSan.comm.service.ChartVO;
import co.MovingCenter.ViewDongSan.ej.service.EjChartMapper;
import co.MovingCenter.ViewDongSan.ej.service.EjChartService;

@Repository("ejChartDao")
public class ChartServiceImpl implements EjChartService {
	
	@Autowired
	private EjChartMapper map;
	
	@Override
	public int insertSales(ChartVO vo) {
		return map.insertSales(vo);
	}

}
