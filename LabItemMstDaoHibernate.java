package com.ddsc.km.lab.dao.hibernate;

import java.util.*;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.Hibernate;

import com.ddsc.core.dao.hibernate.GenericDaoHibernate;
import com.ddsc.core.entity.UserInfo;
import com.ddsc.core.exception.DdscApplicationException;
import com.ddsc.core.util.HibernateScalarHelper;
import com.ddsc.core.util.LocaleDataHelper;
import com.ddsc.core.util.Pager;
import com.ddsc.km.lab.dao.ILabItemMstDao;
import com.ddsc.km.lab.entity.LabItemMst;

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

public class LabItemMstDaoHibernate extends GenericDaoHibernate<LabItemMst,String> implements ILabItemMstDao {

	@Override
	public Pager searchByConditions(Map<String, Object> conditions, Pager pager, UserInfo userInfo) throws DdscApplicationException {
		
		String suppName_lang = LocaleDataHelper.getPropertityWithLocalUpper("ITEM_NAME", userInfo.getLocale());
		StringBuffer sbsql = new StringBuffer();
		sbsql.append("SELECT ITEM.ITEM_ID, ITEM."+suppName_lang+" AS ITEM_NAME, ITEM.ITEM_PRICE, ITEM.ITEM_PROMO_PRICE, ITEM.ITEM_STATUS, ITEM.ITEM_QTY, ITEM.SUPP_ID ");
		sbsql.append("FROM LAB_ITEM_MST ITEM ");
		sbsql.append("join LAB_SUPP_MST SUPP ");
		sbsql.append("ON (ITEM.SUPP_ID = SUPP.SUPP_ID) ");

		String keyword = "WHERE ";
		List<Object> value = new ArrayList<Object>();
		if (StringUtils.isNotEmpty((String) conditions.get("itemId"))) {
			sbsql.append(keyword + "ITEM.ITEM_ID LIKE ? ");
			value.add(conditions.get("itemId") + "%");
			keyword = "AND ";
		}
		if (StringUtils.isNotEmpty((String) conditions.get("itemName"))) {
			sbsql.append(keyword +"ITEM."+ suppName_lang + " LIKE ? ");
			value.add("%"+conditions.get("itemName") + "%");
			keyword = "AND ";
		}
		if (StringUtils.isNotEmpty((String) conditions.get("labSuppMst.suppId"))) {
			sbsql.append(keyword + "ITEM.SUPP_ID LIKE ? ");
			value.add(conditions.get("labSuppMst.suppId") + "%");
			keyword = "AND ";
		}
		
//		List<String> alist = (List<String>) conditions.get("itemStatus");
//		if(alist != null && !alist.isEmpty()){
//			sbsql.append(keyword + " ITEM.ITEM_STATUS IN ( " + this.getSqlQuestionMark(alist.size()));
//		}
		if (CollectionUtils.isNotEmpty((List<String>) conditions.get("itemStatus"))) {
			sbsql.append(keyword + " ITEM.ITEM_STATUS IN ( ");

			for (String custLevel : (List<String>) conditions.get("itemStatus")) {
				if (StringUtils.isNotEmpty(custLevel)) {
					sbsql.append(" ?, ");
					value.add(custLevel);
				}
			}
			sbsql.deleteCharAt(sbsql.lastIndexOf(","));
			sbsql.append(") ");
			keyword = " AND ";
		}
		sbsql.append(" ORDER BY ITEM.ITEM_ID ");
		
		// 建立List<HibernateScalarHelper> scalarList = new ArrayList<HibernateScalarHelper>(); 並add
		List<HibernateScalarHelper> scalarList = new ArrayList<HibernateScalarHelper>();
		scalarList.add(new HibernateScalarHelper("ITEM_ID", Hibernate.STRING));
		scalarList.add(new HibernateScalarHelper("ITEM_NAME", Hibernate.STRING));
		scalarList.add(new HibernateScalarHelper("ITEM_PRICE", Hibernate.BIG_DECIMAL));
		scalarList.add(new HibernateScalarHelper("ITEM_PROMO_PRICE", Hibernate.BIG_DECIMAL));
		scalarList.add(new HibernateScalarHelper("ITEM_STATUS", Hibernate.STRING));
		scalarList.add(new HibernateScalarHelper("ITEM_QTY", Hibernate.BIG_DECIMAL));
		scalarList.add(new HibernateScalarHelper("SUPP_ID", Hibernate.STRING));
		
		// 回傳
		return super.findBySQLQueryMapPagination(sbsql.toString(), pager, scalarList, value, userInfo);
	}
	
}
