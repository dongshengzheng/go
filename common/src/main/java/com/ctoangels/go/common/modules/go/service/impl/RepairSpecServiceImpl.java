package com.ctoangels.go.common.modules.go.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ctoangels.go.common.modules.go.entity.RepairSpecDetail;
import com.ctoangels.go.common.modules.go.entity.RepairSpecItem;
import com.ctoangels.go.common.modules.go.entity.RepairSpecItemList;
import com.ctoangels.go.common.modules.go.mapper.RepairSpecDetailMapper;
import com.ctoangels.go.common.modules.go.mapper.RepairSpecItemMapper;
import com.ctoangels.go.common.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.RepairSpecMapper;
import com.ctoangels.go.common.modules.go.entity.RepairSpec;
import com.ctoangels.go.common.modules.go.service.IRepairSpecService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

import java.util.ArrayList;
import java.util.List;

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

    @Override
    public boolean saveRepairSpec(RepairSpec repairSpec, RepairSpecItemList specItemList, Integer[] repairDetailId) {
        if (repairSpecMapper.insert(repairSpec) < 0) {
            return false;
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
        for (RepairSpecItem item : list) {
            item.setRepairSpecId(repairSpec.getId());
        }
        if (repairSpecItemMapper.insertBatch(list) < 0) {
            return false;
        }
        if (repairDetailId != null && repairDetailId.length > 0) {
            List<RepairSpecDetail> detailList = new ArrayList<>();
            RepairSpecDetail detail;
            Integer specId = repairSpec.getId();
            for (Integer detailId : repairDetailId) {
                detail = repairSpecDetailMapper.selectById(detailId);
                detail.setRepairSpecId(specId);
                detailList.add(detail);
            }
            if (repairSpecDetailMapper.updateBatchById(detailList) < 0) {
                return false;
            }
        }
        return true;
    }

    @Override
    public boolean updateRepairSpec(RepairSpec repairSpec, RepairSpecItemList specItemList, Integer[] repairDetailId) {
        if (repairSpecMapper.updateById(repairSpec) < 0) {
            return false;
        }
        List<RepairSpecItem> list = new ArrayList<>();
        list.addAll(specItemList.getType1List());
        list.addAll(specItemList.getType2List());
        list.addAll(specItemList.getType3List());
        list.addAll(specItemList.getType4List());
        list.addAll(specItemList.getType5List());
        list.addAll(specItemList.getType6List());
        list.addAll(specItemList.getType7List());
        List<RepairSpecItem> updateList = new ArrayList<>();
        List<RepairSpecItem> insertList = new ArrayList<>();
        for (RepairSpecItem item : list) {
            if (item.getId() != null) {
                updateList.add(item);
            } else {
                insertList.add(item);
            }
        }
        if (insertList.size() > 0) {
            if (repairSpecItemMapper.insertBatch(insertList) < 0) {
                return false;
            }
        }
        if (updateList.size() > 0) {
            if (repairSpecItemMapper.updateBatchById(updateList) < 0) {
                return false;
            }
        }

        Integer specId = repairSpec.getId();
        RepairSpecDetail old = new RepairSpecDetail();
        old.setRepairSpecId(specId);
        List<RepairSpecDetail> oldList = repairSpecDetailMapper.selectList(new EntityWrapper<>(old));
        for (RepairSpecDetail oldDetail : oldList) {
            oldDetail.setRepairSpecId(0);
        }
        int a = repairSpecDetailMapper.updateBatchById(oldList);
        if (a < 0) {
            return false;
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
                return false;
            }
        }
        return true;
    }


}