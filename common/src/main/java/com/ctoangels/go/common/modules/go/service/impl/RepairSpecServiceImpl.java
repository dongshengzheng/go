package com.ctoangels.go.common.modules.go.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ctoangels.go.common.modules.go.entity.*;
import com.ctoangels.go.common.modules.go.mapper.RepairModelItemMapper;
import com.ctoangels.go.common.modules.go.mapper.RepairSpecDetailMapper;
import com.ctoangels.go.common.modules.go.mapper.RepairSpecItemMapper;
import com.ctoangels.go.common.util.Const;
import com.ctoangels.go.common.util.ItemId;
import com.ctoangels.go.common.util.StringUtils;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.RepairSpecMapper;
import com.ctoangels.go.common.modules.go.service.IRepairSpecService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

import java.lang.reflect.InvocationTargetException;
import java.util.*;

/**
 * RepairSpec 表数据服务层接口实现类
 */
@Service
public class RepairSpecServiceImpl extends SuperServiceImpl<RepairSpecMapper, RepairSpec> implements IRepairSpecService {
    @Autowired
    RepairSpecMapper repairSpecMapper;

    @Autowired
    RepairSpecItemMapper repairSpecItemMapper;

    @Autowired
    RepairSpecDetailMapper repairSpecDetailMapper;

    @Autowired
    RepairModelItemMapper repairModelItemMapper;

    @Override
    public boolean saveRepairSpec(RepairSpec repairSpec) {
        if (repairSpecMapper.insert(repairSpec) < 0) {
            return false;
        }
        Integer specId = repairSpec.getId();
        Integer modelId = repairSpec.getModelId();
        EntityWrapper<RepairModelItem> ew = new EntityWrapper<>();
        //判读中英文
        Locale locale = LocaleContextHolder.getLocale();
        String language=locale.getDisplayLanguage();
        if(language.equals("中文")){
            ew.addFilter("language={0}",Const.MESSAGE_ZH);
        }
        if (language.equals("英文")){
            ew.addFilter("language={0}",Const.MESSAGE_EN);
        }
        ew.addFilter("repair_model_id={0}", modelId);
        List<RepairModelItem> modelItemList = repairModelItemMapper.selectList(ew);

        List<RepairSpecItem> specItemList = new ArrayList<>();
        for (RepairModelItem rmi : modelItemList) {
            RepairSpecItem specItem = new RepairSpecItem();
            try {
                BeanUtils.copyProperties(specItem, rmi);
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }
            specItem.setRepairSpecId(specId);
            specItem.setStatus(1);
            specItem.setDelFlag(Const.DEL_FLAG_NORMAL);
            specItemList.add(specItem);
        }
        if (repairSpecItemMapper.insertBatch(specItemList) < 0) {
            return false;
        }
        return true;
    }
//    public boolean saveRepairSpec(RepairSpec repairSpec, RepairSpecItemList specItemList, Integer[] repairDetailId) {
//        if (repairSpecMapper.insert(repairSpec) < 0) {
//            return false;
//        }
//        List<RepairSpecItem> list = new ArrayList<>();
//        list.addAll(specItemList.getType1List());
//        list.addAll(specItemList.getType2List());
//        list.addAll(specItemList.getType3List());
//        list.addAll(specItemList.getType4List());
//        list.addAll(specItemList.getType5List());
//        list.addAll(specItemList.getType6List());
//        list.addAll(specItemList.getType7List());
//        list.addAll(specItemList.getType8List());
//        for (RepairSpecItem item : list) {
//            item.setRepairSpecId(repairSpec.getId());
//        }
//        if (repairSpecItemMapper.insertBatch(list) < 0) {
//            return false;
//        }
//        if (repairDetailId != null && repairDetailId.length > 0) {
//            List<RepairSpecDetail> detailList = new ArrayList<>();
//            RepairSpecDetail detail;
//            Integer specId = repairSpec.getId();
//            for (Integer detailId : repairDetailId) {
//                detail = repairSpecDetailMapper.selectById(detailId);
//                detail.setRepairSpecId(specId);
//                detailList.add(detail);
//            }
//            if (repairSpecDetailMapper.updateBatchById(detailList) < 0) {
//                return false;
//            }
//        }
//        return true;
//    }

    @Override
    public Map<String, Object> updateRepairSpec(RepairSpec repairSpec, RepairSpecItemList specItemList, Integer[] repairDetailId, Integer[] deleteItemId) {
        Map<String, Object> result = new HashedMap();
        List<ItemId> idList = new ArrayList<>();
        if (repairSpecMapper.updateById(repairSpec) < 0) {
            result.put("success", false);
            result.put("idList", idList);
            return result;
        }
        List<RepairSpecItem> list = new ArrayList<>();
        list.addAll(specItemList.getType1List());
        list.addAll(specItemList.getType2List());
        list.addAll(specItemList.getType3List());
        list.addAll(specItemList.getType4List());
        list.addAll(specItemList.getType5List());
        list.addAll(specItemList.getType6List());
        list.addAll(specItemList.getType7List());
        list.addAll(specItemList.getType8List());
        List<RepairSpecItem> updateList = new ArrayList<>();
        List<RepairSpecItem> insertList = new ArrayList<>();
        for (RepairSpecItem item : list) {
            item.setRepairSpecId(repairSpec.getId());
            if (item.getId() != null) {
                updateList.add(item);
            } else {
                insertList.add(item);
            }
        }

        if (insertList.size() > 0) {
            if (repairSpecItemMapper.insertBatch(insertList) < 0) {
                result.put("success", false);
                return result;
            }
            for (RepairSpecItem item : insertList) {
                idList.add(new ItemId(item.getCode(), item.getId()));
            }
        }

        if (updateList.size() > 0) {
            if (repairSpecItemMapper.updateBatchById(updateList) < 0) {
                result.put("success", false);
                return result;
            }
        }

        Integer specId = repairSpec.getId();
        RepairSpecDetail old = new RepairSpecDetail();
        old.setRepairSpecId(specId);
        List<RepairSpecDetail> oldList = repairSpecDetailMapper.selectList(new EntityWrapper<>(old));
        for (RepairSpecDetail oldDetail : oldList) {
            oldDetail.setRepairSpecId(0);
        }
        if (oldList != null && oldList.size() > 0) {
            int a = repairSpecDetailMapper.updateBatchById(oldList);
            if (a < 0) {
                result.put("success", false);
                result.put("idList", idList);
                return result;
            }
        }

        if (repairDetailId != null && repairDetailId.length > 0) {
            List<RepairSpecDetail> detailList = new ArrayList<>();
            RepairSpecDetail detail;

            for (Integer detailId : repairDetailId) {
                detail = repairSpecDetailMapper.selectById(detailId);
                detail.setRepairSpecId(specId);
                detailList.add(detail);
            }
            if (repairSpecDetailMapper.updateBatchById(detailList) < 0) {
                result.put("success", false);
                result.put("idList", idList);
                return result;
            }
        }

        if (deleteItemId != null && deleteItemId.length > 0) {
            List<Integer> delIdList = Arrays.asList(deleteItemId);
            if (repairSpecItemMapper.deleteBatchIds(delIdList) < 0) {
                result.put("success", false);
                result.put("idList", idList);
                return result;
            }
        }

        result.put("success", true);
        result.put("idList", idList);
        return result;
    }


}