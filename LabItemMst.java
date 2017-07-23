package com.ddsc.km.lab.entity;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.*;

import org.hibernate.annotations.NamedQuery;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.ddsc.core.entity.BaseEntity;
import com.ddsc.core.util.LocaleDataHelper;
import com.ddsc.km.lab.entity.LabSuppMst;

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

@Entity
@Table(name="LAB_ITEM_MST")
@NamedQuery(name="findItemMstByKey", query="select item.itemId, item.itemName_lang1 as name, item.itemPrice, item.itemPromoPrice, item.itemQty, item.itemBookQty from LabItemMst item where item.itemId=:itemId")
public class LabItemMst extends BaseEntity implements Serializable {
	
	private static final long serialVersionUID = -5822375534480401167L;
	
	private String itemId;
	private String itemName;
	private String itemName_lang1;
	private String itemName_lang2;
	private String itemName_lang3;
	private BigDecimal itemPrice;
	private BigDecimal itemPromoPrice;
	private String itemStatus;
	private BigDecimal itemQty;
	private BigDecimal itemBookQty;
	
	private LabSuppMst labSuppMst;
	
	@Id
	@Column(name="ITEM_ID")
	public String getItemId() {
		return itemId;
	}
	
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	
	@Transient
	public String getItemName() {
		if (null != this.itemName && this.itemName.length() == 0) {
			return null;
		} else {
			return this.itemName;
		}
	}
	
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	
	@Column(name="ITEM_NAME_LANG1")
	public String getItemName_lang1() {
		if (LocaleDataHelper.equalToLocale(LocaleDataHelper.LANGUAGE_1)) {
			return this.getItemName();
		} else {
			return itemName_lang1;
		}
	}

	public void setItemName_lang1(String itemName_lang1) {
		this.itemName_lang1 = itemName_lang1;
		if (LocaleDataHelper.equalToLocale(LocaleDataHelper.LANGUAGE_1)) {
			this.itemName = itemName_lang1;
		}
	}
	
	@Column(name="ITEM_NAME_LANG2")
	public String getItemName_lang2() {
		if (LocaleDataHelper.equalToLocale(LocaleDataHelper.LANGUAGE_2)) {
			return this.getItemName();
		} else {
			return itemName_lang2;
		}
	}

	public void setItemName_lang2(String itemName_lang2) {
		this.itemName_lang2 = itemName_lang2;
		if (LocaleDataHelper.equalToLocale(LocaleDataHelper.LANGUAGE_2)) {
			this.itemName = itemName_lang2;
		}
	}
	
	@Column(name="ITEM_NAME_LANG3")
	public String getItemName_lang3() {
		if (LocaleDataHelper.equalToLocale(LocaleDataHelper.LANGUAGE_3)) {
			return this.getItemName();
		} else {
			return itemName_lang3;
		}
	}

	public void setItemName_lang3(String itemName_lang3) {
		this.itemName_lang3 = itemName_lang3;
		if (LocaleDataHelper.equalToLocale(LocaleDataHelper.LANGUAGE_3)) {
			this.itemName = itemName_lang3;
		}
	}
	
	@Column(name="ITEM_PRICE")
	public BigDecimal getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(BigDecimal itemPrice) {
		this.itemPrice = itemPrice;
	}
	
	@Column(name="ITEM_PROMO_PRICE")
	public BigDecimal getItemPromoPrice() {
		return itemPromoPrice;
	}

	public void setItemPromoPrice(BigDecimal itemPromoPrice) {
		this.itemPromoPrice = itemPromoPrice;
	}
	
	@Column(name="ITEM_STATUS")	
	public String getItemStatus() {
		return itemStatus;
	}

	public void setItemStatus(String itemStatus) {
		this.itemStatus = itemStatus;
	}
	
	@Column(name="ITEM_QTY")
	public BigDecimal getItemQty() {
		return itemQty;
	}

	public void setItemQty(BigDecimal itemQty) {
		this.itemQty = itemQty;
	}
	
	@Column(name="ITEM_BOOK_QTY")
	public BigDecimal getItemBookQty() {
		return itemBookQty;
	}

	public void setItemBookQty(BigDecimal itemBookQty) {
		this.itemBookQty = itemBookQty;
	}

	@OneToOne(targetEntity = LabSuppMst.class, fetch = FetchType.EAGER)
	@NotFound(action = NotFoundAction.IGNORE)
	@JoinColumn(name = "SUPP_ID", referencedColumnName = "SUPP_ID")
	public LabSuppMst getLabSuppMst() {
		return labSuppMst;
	}

	public void setLabSuppMst(LabSuppMst labSuppMst) {
		this.labSuppMst = labSuppMst;
	}
	
}
