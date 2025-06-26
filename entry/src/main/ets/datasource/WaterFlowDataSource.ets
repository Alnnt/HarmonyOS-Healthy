import { getSecKillList } from "../api/GoodsApi";
import { GoodsType, Item } from "./Type";

// 实现IDataSource接口的对象，用于瀑布流组件加载数据
export class WaterFlowDataSource implements IDataSource {
  protected dataArray: GoodsType[] = [];
  private listeners: DataChangeListener[] = [];
  private loadDataFunc: () => Promise<GoodsType[]> = async () => {
    return []
  }

  constructor(loadDataFunc: () => Promise<GoodsType[]>) {
    // for (let i = 0; i < 10; i++) {
    //   this.dataArray.push(this.generateRandomItem());
    // }
    this.loadDataFunc = loadDataFunc
    this.refreshItems()
    // this.loadDataFromBackend().then((res: GoodsType[]) => {
    //   this.dataArray = res
    //   console.log(JSON.stringify(res))
    //
    // })
  }


  // 获取索引对应的数据
  public getData(index: number): GoodsType {
    return this.dataArray[index];
  }


  // 通知控制器数据重新加载
  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }


  // 通知控制器数据增加
  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }


  // 通知控制器数据变化
  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }


  // 通知控制器数据删除
  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }


  // 通知控制器数据位置变化
  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }


  //通知控制器数据批量修改
  notifyDatasetChange(operations: DataOperation[]): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange(operations);
    })
  }


  // 获取数据总数
  public totalCount(): number {
    return this.dataArray.length;
  }


  // 注册改变数据的控制器
  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }


  // 注销改变数据的控制器
  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }


  // 增加数据
  public add1stItem(): void {
    // this.dataArray.splice(0, 0, this.dataArray.length);
    // this.dataArray.splice(0, 0, this.generateRandomItem());

    this.notifyDataAdd(0);
  }

  private generateRandomItem(): Item {
    const itemList: Item[] = [
      {
        img: "https://p3.maiyaole.com/img/item/202001/08/380_20200108182001442.jpg",
        name: '999感冒灵颗粒',
        sellOut: '2.9万',
        cost: '32.4'
      },
      {
        img: "https://img1.baidu.com/it/u=3791403069,3481170650&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=682",
        name: '阿奇霉素药品系列包装',
        sellOut: '2.9万',
        cost: '68.8'
      },
      {
        img: "https://p3.maiyaole.com/img/item/202006/28/380_20200628164617624.jpg",
        name: '海氏海诺 医用棉签',
        sellOut: '16.9万',
        cost: '9.9'
      },
      {
        img: "https://p1.maiyaole.com/img/item/202212/06/380_20221206152806436.png",
        name: '东方基因 新型冠状病毒(2019-nCoV)抗原检测试剂盒(胶体金法) 卡型',
        sellOut: '8.2万',
        cost: '99.8'
      },
      {
        img: "https://pic2.zhimg.com/v2-e262dcd1ae598b18b26ddc0597e50b3f_1440w.jpg",
        name: '可瑞达 帕博利珠单抗注射液',
        sellOut: '453万',
        cost: '254.1'
      },
      {
        img: "https://picx.zhimg.com/v2-a5cd9ebf26998a9445419661b833b819_1440w.jpg",
        name: '盐酸曲唑酮片 ancozy安适药物',
        sellOut: '5.1万',
        cost: '399.5'
      }
    ]
    let randomIndex = Math.floor(Math.random() * itemList.length);
    return itemList[randomIndex];
  }

  // 在数据尾部增加一个元素
  public addLastItem(): void {
    // const item = this.generateRandomItem()
    // this.dataArray.splice(this.dataArray.length, 0, item);
    this.notifyDataAdd(this.dataArray.length - 1);
  }


  // 在指定索引位置增加一个元素
  // public addItem(index: number): void {
  //   this.dataArray.splice(index, 0, this.dataArray.length);
  //   this.notifyDataAdd(index);
  // }


  // 删除第一个元素
  public delete1stItem(): void {
    this.dataArray.splice(0, 1);
    this.notifyDataDelete(0);
  }


  // 删除第二个元素
  public delete2ndItem(): void {
    this.dataArray.splice(1, 1);
    this.notifyDataDelete(1);
  }


  // 删除最后一个元素
  public deleteLastItem(): void {
    this.dataArray.splice(-1, 1);
    this.notifyDataDelete(this.dataArray.length);
  }


  // 在指定索引位置删除一个元素
  public deleteItem(index: number): void {
    this.dataArray.splice(index, 1);
    this.notifyDataDelete(index);
  }


  // 重新加载数据
  public reload(): void {
    // this.dataArray.splice(1, 1);
    // this.dataArray.splice(3, 2);
    this.notifyDataReload();
  }


  // 在数据尾部增加count个元素
  // public addNewItems(count: number): void {
  //   let len = this.dataArray.length;
  //   for (let i = 0; i < count; i++) {
  //     this.dataArray.push(this.dataArray[len - 1] + i + 1);
  //     this.notifyDataAdd(this.dataArray.length - 1);
  //   }
  // }


  // 刷新所有元素
  public refreshItems(): void {
    // let newDataArray: Item[] = [];
    // for (let i = 0; i < 15; i++) {
    //   newDataArray.push(this.generateRandomItem());
    // }
    // this.dataArray = newDataArray;
    console.log('refreshing')
    this.loadDataFunc().then((res: GoodsType[]) => {
      console.log('最终数据')
      console.log(JSON.stringify(res))
      this.dataArray = res
      this.notifyDataReload()
      setTimeout(() => {
        this.notifyDataReload()
      }, 3000)
    }).catch((err: Error) => {
      console.error('Error: ' + err.message)
    })
  }
}