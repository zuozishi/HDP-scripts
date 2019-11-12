#初始化数据集
def loadDataSet():
    return [['豆奶', '莴苣'],
            ['莴苣', '尿布', '葡萄酒', '甜菜'],
            ['豆奶', '尿布', '葡萄酒', '橙汁'],
            ['莴苣', '豆奶', '尿布', '葡萄酒'],
            ['莴苣', '豆奶', '尿布', '橙汁']]

# 创建1项集
def createC1(ds):
    C1 = []
    for alist in ds:
        for item in alist:
            if not {item} in C1:
                C1.append({item})
    C1.sort()
    return list(map(frozenset,C1))

# 计算支持度
def scanD(ds, C1, minSupport=0.5):
    supportCount = {}
    for item in C1:
        count = 0
        for alist in ds:
            if item.issubset(alist):
                count += 1
        supportCount[item] = count
    supportData = {}
    itemList = []
    listNum = float(len(ds))
    for item in supportCount.keys():
        supportData[item] = supportCount[item] / listNum
        if supportData[item] >= minSupport:
            itemList.append(item)
    return itemList, supportData
    
# 生成k项集
def aprioriGen(Lk, k):
    Ck = []
    lenLk = len(Lk)
    for i in range(lenLk):
        for j in range(i + 1, lenLk):
            L1 = list(Lk[i])[: k - 2]
            L1.sort()
            L2 = list(Lk[j])[: k - 2]
            L2.sort()
            if L1 == L2:
                Ck.append(Lk[i] | Lk[j])
    return Ck

# 生成所有项集并计算支持度
def apriori(ds, minSupport=0.5,includeAll = False,includeC1 = False):
    C1 = createC1(ds)
    L, supportData = scanD(ds, C1, minSupport)
    lenL = len(L)
    for i in range(2, lenL):
        L = aprioriGen(L, i)
        L, sd = scanD(ds, L, minSupport)
        supportData.update(sd)
    C = []
    for item in supportData.keys():
        if supportData[item] >= minSupport:
            C.append(item)
    if not includeC1:
        Cnew = []
        for item in list(C):
            if len(item) > 1:
                Cnew.append(item)
        C.clear()
        C.extend(Cnew)
    if not includeAll:
        for item in list(supportData.keys()):
            if item not in C:
                supportData.pop(item)
    return C,supportData

dataSet = loadDataSet()
C, supportData = apriori(dataSet,0.6)
print('项集：')
for item in C:
    print(item)
print('支持度：')
for item in supportData.keys():
    print(item,' - ',supportData[item])
