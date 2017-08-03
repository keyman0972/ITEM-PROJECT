package com.ddsc.km.lab.service.impl;

import java.util.List;
import java.util.Map;

import com.ddsc.core.entity.UserInfo;
import com.ddsc.core.exception.DdscApplicationException;
import com.ddsc.core.util.BeanUtilsHelper;
import com.ddsc.core.util.Pager;
import com.ddsc.km.lab.dao.ILabItemMstDao;
import com.ddsc.km.lab.entity.LabItemMst;
import com.ddsc.km.lab.service.ILabItemMstService;

/**
 * <table>
 * <tr>
 * <th>版本</th>
 * <th>日期</th>
 * <th>詳細說明</th>
 * <th>modifier</th>
 * </tr>
 * <tr>
 * <td>1.0</td>
 * <td>2017/7/5</td>
 * <td>新建檔案</td>
 * <td>"keyman"</td>
 * </tr>
 * </table>
 * @author "keyman"
 *
 * 類別說明 :
 *
 *
 * 版權所有 Copyright 2008 © 中菲電腦股份有限公司 本網站內容享有著作權，禁止侵害，違者必究。 <br>
 * (C) Copyright Dimerco Data System Corporation Inc., Ltd. 2009 All Rights
 */

public class LabItemMstServiceImpl implements ILabItemMstService {
	
	private ILabItemMstDao labItemMstDao;
	
	@Override
	public LabItemMst get(String id, UserInfo info) throws DdscApplicationException {
		try{			
			return labItemMstDao.get(id, info);
		}catch (DdscApplicationException e) {
			throw e;
		} catch (Exception e) {
			throw new DdscApplicationException(e, info);
		}
	}

	@Override
	public LabItemMst create(LabItemMst entity, UserInfo info) throws DdscApplicationException {
		try{
			labItemMstDao.save(entity, info);
			return entity;
		}catch (DdscApplicationException e) {
			throw e;
		} catch (Exception e) {
			throw new DdscApplicationException(e, info);
		}
	}

	@Override
	public LabItemMst update(LabItemMst entity, UserInfo info) throws DdscApplicationException {
		try{
			LabItemMst labItemMstPo = this.getLabItemMstDao().get(entity.getItemId(), info);
			
			if(entity.getVer().getTime() == labItemMstPo.getVer().getTime()){
				BeanUtilsHelper.copyProperties(labItemMstPo, entity, entity.obtainLocaleFieldNames());
				return this.getLabItemMstDao().update(labItemMstPo, info);
			}else {
				// 資料已被異動無法更新, 丟出 Exception
				throw new DdscApplicationException(DdscApplicationException.DDSCEXCEPTION_TYPE_ERROR, "eP.0013");
			}
		}catch (DdscApplicationException e) {
			throw e;
		} catch (Exception e) {
			throw new DdscApplicationException(e, info);
		}
	}
	
	@Override
	public LabItemMst delete(LabItemMst entity, UserInfo info) throws DdscApplicationException {
		try{
			labItemMstDao.delete(entity, info);
			return entity;
		}catch (DdscApplicationException e) {
			throw e;
		} catch (Exception e) {
			throw new DdscApplicationException(e, info);
		}
	}

	@Override
	public List<LabItemMst> searchAll(UserInfo info) throws DdscApplicationException {
		return null;
	}

	@Override
	public Pager searchByConditions(Map<String, Object> conditions, Pager pager, UserInfo userInfo) throws DdscApplicationException {
		try{
			return labItemMstDao.searchByConditions(conditions, pager, userInfo);			
		}catch (DdscApplicationException e) {
			throw e;
		} catch (Exception e) {
			throw new DdscApplicationException(e, userInfo);
		}
	}

	@Override
	public List<LabItemMst> searchByConditions(Map<String, Object> conditions, UserInfo userInfo) throws DdscApplicationException {
		return null;
	}

	@Override
	public List<Object> queryDataByParamsByService(Map<String, Object> conditions, UserInfo userInfo) throws DdscApplicationException {
		return null;
	}

	@Override
	public int getDataRowCountByConditions(Map<String, Object> conditions, UserInfo info) throws DdscApplicationException {
		try{
			return this.labItemMstDao.getDataRowCountByConditions(conditions, info);
		}catch (DdscApplicationException e) {
			throw e;
		} catch (Exception e) {
			throw new DdscApplicationException(e, info);
		}
	}

	public ILabItemMstDao getLabItemMstDao() {
		return labItemMstDao;
	}

	public void setLabItemMstDao(ILabItemMstDao labItemMstDao) {
		this.labItemMstDao = labItemMstDao;
	}
	
}
