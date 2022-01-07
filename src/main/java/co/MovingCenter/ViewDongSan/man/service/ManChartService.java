package co.MovingCenter.ViewDongSan.man.service;

import java.util.List;

import co.MovingCenter.ViewDongSan.comm.service.ChartVO;

public interface ManChartService {
	List<ChartVO> selectListChart();
	
	List<ChartVO> selectChart(ChartVO vo);
	List<String> selectHostID();
	List<ChartVO> selectListChartByID(ChartVO vo);

}
