package com.ctoangels.go.common.modules.go.service.online;

import com.ctoangels.go.common.modules.go.entity.*;

import java.util.List;

/**
 * Created by zhen_Tomcat on 2017/04/25.
 */
public interface ISyncService {


    Boolean deleteShipByCompanyId(Integer id);

    Boolean saveShipOne(Ship ship);

    Boolean deleteOnlineRepairSpec(Integer id);

    Boolean insertRepairSpec(RepairSpec repairSpec);

    Boolean insertRepairSpecItem(List<RepairSpecItem> repairSpecItems);

    Boolean insertRepairSpecDetail( RepairSpecDetail repairSpecDetail);

    Boolean insertRepairSpecDetailMedia(List<RepairSpecDetailMedia> repairSpecDetailMedias);

    Boolean insertRepairSpecDetailReq(List<RepairSpecDetailReq> reqs);

}
