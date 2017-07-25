package com.ctoangels.go.common.modules.go.service.online;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ctoangels.go.common.modules.go.entity.*;
import com.ctoangels.go.common.modules.go.mapper.ShipMapper;
import com.ctoangels.go.common.modules.go.service.*;
import com.ctoangels.go.common.util.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by zhen_Tomcat on 2017/04/25.
 */

@Service
public class SyncServiceImpl implements ISyncService{

    @Autowired
    private ShipMapper shipMapper;

    @Autowired
    private IShipService shipService;


    @Autowired
    private IRepairSpecService repairSpecService;

    @Autowired
    private IRepairSpecItemService repairSpecItemService;

    @Autowired
    private IRepairSpecDetailService repairSpecDetailService;

    @Autowired
    private IRepairSpecDetailReqService repairSpecDetailReqService;

    @Autowired
    private IRepairSpecDetailMediaService repairSpecDetailMediaService;

    @Override
    public Boolean deleteShipByCompanyId(Integer id) {
        EntityWrapper<Ship> ew=new EntityWrapper();
        ew.addFilter("company_id={0} and del_flag={1}",id, Const.DEL_FLAG_NORMAL);
        List<Ship> shipList=shipService.selectList(ew);
        if(shipList.size()>0){
            for(Ship ship:shipList){
                shipMapper.deleteById(ship.getId());
            }
        }
        return null;
    }

    @Override
    public Boolean saveShipOne(Ship ship) {
        if(ship!=null){
            shipService.insert(ship);
        }
        return null;
    }

    @Override
    public Boolean deleteOnlineRepairSpec(Integer id) {

        //获取服务器中当前公司下的所有的工程单
        EntityWrapper<RepairSpec> ew=new EntityWrapper();
        ew.addFilter("company_id={0} and del_flag={1}",id, Const.DEL_FLAG_NORMAL);
        List<RepairSpec> repairSpecList = repairSpecService.selectList(ew);

        for(RepairSpec repairSpec:repairSpecList){

            //通过工程单获取所有的工程单的item
            EntityWrapper<RepairSpecItem> ew1=new EntityWrapper();
            ew1.addFilter("repair_spec_id={0}",repairSpec.getId());
            List<RepairSpecItem> repairSpecItemList =repairSpecItemService.selectList(ew1);

            for(RepairSpecItem repairSpecItem:repairSpecItemList){
                repairSpecItemService.deleteById(repairSpecItem);
            }

            //通过工程单获取所有的详单
            EntityWrapper<RepairSpecDetail> ew2=new EntityWrapper();
            ew2.addFilter("repair_spec_id={0}",repairSpec.getId());
            List<RepairSpecDetail> repairSpecDetailList =repairSpecDetailService.selectList(ew2);

            for(RepairSpecDetail repairSpecDetail:repairSpecDetailList){
                //通过详单id获取所有的media的信息
                EntityWrapper<RepairSpecDetailMedia> ew3=new EntityWrapper();
                ew3.addFilter("repair_spec_detail_id={0}",repairSpecDetail.getId());
                List<RepairSpecDetailMedia> repairSpecDetailMediaList =repairSpecDetailMediaService.selectList(ew3);

                for(RepairSpecDetailMedia repairSpecDetailMedia:repairSpecDetailMediaList){
                    repairSpecDetailMediaService.deleteById(repairSpecDetailMedia);
                }

                //通过详单id获取所有的req信息
                EntityWrapper<RepairSpecDetailReq> ew4=new EntityWrapper();
                ew4.addFilter("repair_spec_detail_id={0}",repairSpecDetail.getId());
                List<RepairSpecDetailReq> reqList =repairSpecDetailReqService.selectList(ew4);

                for(RepairSpecDetailReq req:reqList){
                    repairSpecDetailReqService.deleteById(req);
                }
                repairSpecDetailService.deleteById(repairSpecDetail);
            }
            repairSpecService.deleteById(repairSpec);

        }
        return null;
    }

    @Override
    public Boolean insertRepairSpec(RepairSpec repairSpec) {
        if(repairSpec!=null){
            repairSpecService.insert(repairSpec);
        }
        return null;
    }

    @Override
    public Boolean insertRepairSpecItem(List<RepairSpecItem> repairSpecItems) {
        if(repairSpecItems.size()>0){
            repairSpecItemService.insertBatch(repairSpecItems);
        }
        return null;
    }

    @Override
    public Boolean insertRepairSpecDetail(RepairSpecDetail repairSpecDetail) {
        if(repairSpecDetail!=null){
            repairSpecDetailService.insert(repairSpecDetail);
        }
        return null;
    }

    @Override
    public Boolean insertRepairSpecDetailMedia(List<RepairSpecDetailMedia> repairSpecDetailMedias) {
        if(repairSpecDetailMedias.size()>0){
            repairSpecDetailMediaService.insertBatch(repairSpecDetailMedias);
        }
        return null;
    }

    @Override
    public Boolean insertRepairSpecDetailReq(List<RepairSpecDetailReq> reqs) {
        if(reqs.size()>0){
            repairSpecDetailReqService.insertBatch(reqs);
        }
        return null;
    }
}
