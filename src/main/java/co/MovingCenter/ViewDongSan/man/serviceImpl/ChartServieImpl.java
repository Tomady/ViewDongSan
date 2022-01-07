package co.MovingCenter.ViewDongSan.man.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.MovingCenter.ViewDongSan.comm.service.ChartVO;
import co.MovingCenter.ViewDongSan.man.service.ManChartMapper;
import co.MovingCenter.ViewDongSan.man.service.ManChartService;

@Repository("manChartDao")
public class ChartServieImpl implements ManChartService {
	@Autowired
	ManChartMapper map;
	
	@Override
	public List<ChartVO> selectListChart() {
		// TODO Auto-generated method stub
		return map.selectListChart();
	}
	@Override
	public List<ChartVO> selectChart(ChartVO vo) {
		return map.selectChart(vo);
	}
	@Override
	public List<String> selectHostID() {
		return map.selectHostID();
	}
	@Override
	public List<ChartVO> selectListChartByID(ChartVO vo) {
		return map.selectListChartByID(vo);
	}

}
