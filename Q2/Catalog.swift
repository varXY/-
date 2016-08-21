//
//  Catalog.swift
//  Q2
//
//  Created by 文川术 on 15/9/12.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit


enum AnimationType {
	case appear
	case disappear
	case touched
	case isRightAnswer
	case bigger
	case biggerAndAppear
	case other
}

enum Equation: Int {
	case zero, one, two, three

	var navigationTitle: String {
		switch self {
		case .zero:
			return "I = U / R"
		case .one:
			return "P = U * I"
		case .two:
			return "W = P * t"
		case .three:
			return "R = ρ * L / S"
		}
	}

	var firstWords: [String] {
		switch self {
		case .zero:
			return ["U", "R", "I"]
		case .one:
			return ["U", "I", "P", "PF", "有功", "无功"]
		case .two:
			return ["P", "t", "W"]
		case .three:
			return ["ρ", "L", "S", "R"]
		}
	}

	var lastWords: [String] {
		switch self {
		case .zero:
			return ["V", "Ω", "A"]
		case .one:
			return ["V", "A", "W", "0~1", "W", "W"]
		case .two:
			return ["W", "h", "kWh"]
		case .three:
			return ["Ω·m", "m", "㎡", "Ω"]
		}
	}

	var sectionTitle: String {
		switch self {
		case .zero:
			return "电压U，电阻R，电流I"
		case .one:
			return "电压U，电流I，功率P，功率因素PF(≤1)"
		case .two:
			return "功率P，时间t（大写），电量W（单位：度）"
		case .three:
			return "电阻率ρ（大写），长度L， 面积S，电阻R"
		}
	}
}

enum SectionTitle: Int {
	case zero, one, two

	var titles: [String] {
		switch self {
		case .zero:
			return ["基本", "功率", "其他"]
		case .one:
			return ["字母", "电池", "电阻", "电容", "开关", "二极管", "线圈", "变压器", "磁头", "逻辑门", "其他"]
		case .two:
			return ["工具", "发电", "传输&储存", "计量", "用电"]
		}
	}
}

enum Unit {
	case index(Int, Int)

	var unitSubtitles: [String] {
		switch self {
		case .index(0, 0):
			return ["电势不同产生的能量差", "通过导体横截面的电量", "导体对电流阻碍作用的大小", "给定电位差下的电荷储藏量", "电流与线圈的相互作用关系", "磁感应强度与面积的乘积", "单位时间内周期性变化的次数"]
		case .index(0, 1):
			return ["单位时间内所做的功的多少", "负载电阻所消耗的功率", "用来建立磁场和磁通的电功率", "用电设备额定电压和电流的乘积", "用来标识设备能转换的电功率", "有功功率和视在功率的比值"]
		case .index(0, 2):
			return ["用电设备所需（消耗）的电能数量", "集成电路上的基本组件"]
		default:
			return [String]()
		}
	}

	var stringImage: [String] {
		switch self {
		case .index(0, 0):
			return ["U", "I", "R", "C", "L", "Φ", "f"]
		case .index(0, 1):
			return ["P", "P", "Q", "S", "P", "PF"]
		case .index(0, 2):
			return ["W", "LG"]
		default:
			return [String]()
		}
	}
}


enum titlesInSection {
	case index(Int, Int)

	var titles: [String] {
		switch self {
		case .index(0, 0):
			return ["电压", "电流", "电阻", "电容", "电感", "磁通量", "频率"]
		case .index(0, 1):
			return ["功率", "有功功率", "无功功率", "视在功率", "额定功率", "功率因数"]
		case .index(0, 2):
			return ["电量", "逻辑门"]
		case .index(1, 0):
			return ["电流表", "电压表", "电动机", "继电器", "用电器"]
		case .index(1, 1):
			return ["电池、电源", "硅光电池"]
		case .index(1, 2):
			return ["电阻", "可调电阻", "可调电阻2", "光敏电阻"]
		case .index(1, 3):
			return ["无极性电容", "极性电容、电解电容", "可变电容"]
		case .index(1, 4):
			return ["开关", "拨动开关", "按钮开关（常开）", "按钮开关（常闭）", "联动开关", "联动按钮开关"]
		case .index(1, 5):
			return ["二极管", "发光二极管", "光电、光敏二极管", "稳压二极管", "变容二极管", "恒流二极管"]
		case .index(1, 6):
			return ["电感器、线圈、绕组、扼流器", "铁芯线圈", "带抽头的铁芯线圈", "可调铁芯线圈", "磁芯线圈", "双绕组变压器", "一绕组上有抽头的变压器", "磁芯变压器"]
		case .index(1, 7):
			return ["变压器", "变压器2、电压互感器"]
		case .index(1, 8):
			return ["放音磁头", "录音磁头", "录放磁头", "消音磁头"]
		case .index(1, 9):
			return ["与门", "或门", "与非门", "或非门", "缓冲器（inverter）", "反相器（buffer）"]
		case .index(1, 10):
			return ["灯泡、指示灯、信号灯", "扬声器", "蜂鸣器", "电铃", "熔断器、保险丝", "天线", "柔性管路", "接地"]
		case .index(2, 0):
			return ["绝缘安全工具", "一般防护安全用具", "电工常用工具"]
		case .index(2, 1):
			return ["发电机"]
		case .index(2, 2):
			return ["电源", "电容器", "电感器", "变压器", "逆变器", "整流器", "继电器", "空气断路器", "镇流器", "电池", "UPS"]
		case .index(2, 3):
			return ["万用表", "电能表", "电力监控仪表"]
		case .index(2, 4):
			return ["电动机", "压缩机", "微波炉"]
		default:
			return [String]()
		}
	}
}

enum textBodies {
	case index(Int, Int)

	var unitBody: String {
		switch self {
		case .index(0, 0):
			return "电压（Voltage），也称作电势差或电位差，是衡量单位电荷在静电场中由于电势不同所产生的能量差的物理量。其大小等于单位正电荷因受电场力作用从A点移动到B点所做的功，电压的方向规定为从高电位指向低电位的方向。\n\n单位：伏特（V，简称伏），常用单位毫伏（mV）、微伏（μV）、千伏（kV）。\n1kV = 1000V\n1V = 1000mV\n1mV = 1000μV\n\n公式：U=IR\n（I为电流，R是电阻）这个公式只适用于纯电阻电路\n\n串联电路中，总压等于分压和。\n并联电路中，支压都等电源压。\n\n电压与水位高低所造成的“水压”相似。需要指出的是，“电压”一词一般只用于电路当中，“电势差”和“电位差”则普遍应用于一切电现象当中。\n\n如果电压的大小及方向都不随时间变化，则称之为稳恒电压或恒定电压，简称为直流电压，用大写字母U表示。如果电压的大小及方向随时间变化，则称为变动电压。\n\n高压：对地电压高于或等于1000V\n低压：对地电压小于1000V\n安全电压：36V最常见（安全电压五等级：42V，36V，24V，12V，6V）"
		case .index(0, 1):
			return "导体中的自由电荷在电场力的作用下做有规则的定向运动就形成了电流。只有电路中保持有恒定的电动势（电力场），同时电路闭合才能形成电流。\n\n单位：安倍（A，简称安），常用单位千安（kA）毫安（mA）、微安(μA)。\n1kA = 1000A\n1A = 1000mA\n1mA = 1000μA\n\n公式：I=Q/t \nQ为通过导体横截面的电荷量，单位是库仑。t为电荷通过导体的时间，单位是秒。\n\n串联电路中，电路各部分的电流相等。\n并联电路中，干路电流等于各支路电流之和。\n\n交流电：大小和方向都发生周期性变化。\n生活中插墙式电器使用的是民用交流电源。 交流电在家庭生活、工业生产中有着广泛的使用，生活民用电压220V、通用工业电压380V，都属于危险电压。\n\n直流电：方向不随时间发生改变。\n生活中使用的可移动外置式电源提供的的是直流电。直流电一般被广泛使用于手电筒（干电池）、手机（锂电池）等各类生活小电器等。干电池（1.5V）、锂电池、蓄电池等被称之为直流电源。因为这些电源电压都不会超过24V，所以属于安全电源。"
		case .index(0, 2):
			return "电阻是导体本身的一种特性。电阻将会导致电子流通量的变化，电阻越小，电子流通量越大，反之亦然。而超导体则没有电阻。柱形均匀导体里，其电阻R与长度L成正比，与横截面积S成反比。\n\n电阻率：符号ρ，用来表示各种物质电阻特性的物理量，与温度有关，与长度、横截面无关。\n\n单位：欧姆(Ω，简称欧）。常用单位兆欧（MΩ）和千欧（KΩ）。\n1MΩ = 1000kΩ\n1kΩ = 1000Ω\n\n定义式：R=U/I\n决定式：R=ρL/S\nρ表示电阻的电阻率，是由其本身性质决定，L表示电阻的长度，S表示电阻的横截面积\n\n串联：R=R1+R2+...+Rn\n并联：R=1/(1/R1+1/R2+...+1/Rn)\n\n电阻种类：满足欧姆定律的为线性电阻（欧姆电阻），反之为非线性电阻。"
		case .index(0, 3):
			return "电容，亦称作“电容量”，是指在给定电位差下的电荷储藏量，记为C。一般来说，电荷在电场中会受力而移动，当导体之间有了介质，则阻碍了电荷移动而使得电荷累积在导体上，造成电荷的累积储存，储存的电荷量则称为电容。\n\n单位：法拉（F），常用的电容单位有毫法（mF）、微法（μF）、纳法（nF）和皮法（pF）等。\n1F = 1000mF = 1000000μF\n1μF = 1000nF = 1000000pF\n\n一个电容器，如果带1库的电量时两级间的电势差是1伏，这个电容器的电容就是1法拉，即：C=Q/U 。但电容的大小不是由Q（带电量）或U（电压）决定的，即电容的决定式为：C=εS/4πkd 。其中，ε是一个常数，S为电容极板的正对面积，d为电容极板的距离，k则是静电力常量。常见的平行板电容器，电容为C=εS/d（ε为极板间介质的介电常数，S为极板面积，d为极板间的距离）。\n\n定义式： C = Q / U\n电容器的电势能计算公式：E = CU^2/2 = QU/2 = Q^2/2C\n多电容器并联计算公式：C = C1+C2+C3+…+Cn\n多电容器串联计算公式：1/C = 1/C1+1/C2+…+1/Cn\n三电容器串联：C =（C1*C2*C3）/（C1*C2+C2*C3+C1*C3\n\n电容与电池容量的关系：\n1伏安时=1瓦时=3600焦耳\nW=0.5CUU\n\n电容是指容纳电场的能力。任何静电场都是由许多个电容组成，有静电场就有电容，电容是用静电场描述的。一般认为：孤立导体与无穷远处构成电容，导体接地等效于接到无穷远处，并与大地连接成整体。\n\n电容（或称电容量）是表现电容器容纳电荷本领的物理量。电容从物理学上讲，它是一种静态电荷存储介质，可能电荷会永久存在，这是它的特征，它的用途较广，它是电子、电力领域中不可缺少的电子元件。主要用于电源滤波、信号滤波、信号耦合、谐振、滤波、补偿、充放电、储能、隔直流等电路中。\n\n电容的种类：\n从原理上分为：无极性可变电容、无极性固定电容、有极性电容等。\n\n从材料上分为：CBB电容（聚乙烯）、涤纶电容、瓷片电容、云母电容、独石电容、电解电容、钽电容等。"
		case .index(0, 4):
			return "电感（Inductance）是闭合回路的一种属性，是一个物理量。当线圈通过电流后，在线圈中形成磁场感应，感应磁场又会产生感应电流来抵制通过线圈中的电流。这种电流与线圈的相互作用关系称为电的感抗，也就是电感，单位是“亨利（H）”，以美国科学家约瑟夫·亨利命名。它是描述由于线圈电流变化，在本线圈中或在另一线圈中引起感应电动势效应的电路参数。电感是自感和互感的总称。提供电感的器件称为电感器。\n\n当通过闭合回路的电流改变时，会出现电动势来抵抗电流的改变。这种电感称为自感（self-inductance），是闭合回路自己本身的属性。假设一个闭合回路的电流改变，由于感应作用而产生电动势于另外一个闭合回路，这种电感称为互感（mutual inductance）。\n\n电感单位：\n亨（H）、毫亨（mH）、微亨（μH）\n\n换算关系：\n1H = 1000mH\n1mH = 1000μH\n\n人们利用电感的特性，制造了阻流圈、变压器、继电器等工具设备。"
		case .index(0, 5):
			return "设在磁感应强度为B的匀强磁场中，有一个面积为S且与磁场方向垂直的平面，磁感应强度B与面积S的乘积，叫做穿过这个平面的磁通量，简称磁通（Magnetic Flux）。标量，符号“Φ”。\n\n公式：Φ=BS，其中Φ为磁通量，B为磁感应强度，S为面积，适用条件是B与S平面垂直。当S与B的垂面存在夹角θ时，Φ=B·S·cosθ，θ<90°为正值，θ>90°为负值，正负仅代表穿向。\n\n在国际单位制中，磁通量的单位是韦伯，是以德国物理学家威廉·韦伯的名字命名的。Weber，符号是Wb，1Wb=1T*m²=1V*S。韦伯可以用法拉第电磁感应定律来推导。1韦伯=10⁸（1亿）麦克斯韦。"
		case .index(0, 6):
			return "频率，物质在1秒内完成周期性变化的次数。常用符号f表示。每个物体都有由它本身性质决定的与振幅无关的频率，叫做固有频率。\n\n单位：赫兹（Hz，简称赫），常用单位千赫（kHz）或兆赫（MHz）或吉赫（GHz）。\n1GHz = 1000MHz\n1MHz = 1000kHz\n1kHz = 1000Hz\n\n公式：f=1/T\nT为周期\n\n中国使用正弦交流电，频率为50Hz。全世界的电力系统中，工频有两种，一种为50Hz，还有一种是60Hz。"
		case .index(1, 0):
			return "表示物体做功快慢的物理量。单位时间内所做的功叫功率，用P表示。功率分电功率、力功率。\n\n单位：瓦特（W，简称瓦），常用千瓦（kW），兆瓦（MW），马力。\n1MW = 1000kW\n1kW = 1000W\n1马力 = 735W\n\n电功率计算公式：P=W/t=UI\n公式中的P表示功率，单位是“瓦特”，简称“瓦”，符号是W。\nW表示功。单位是“焦耳”，简称“焦”，符号是J。\nt表示时间，单位是“秒”，符号是“s”\n\n不管电器串联还是并联，总功率都等于各电器功率之和。"
		case .index(1, 1):
			return "有功功率P：将电能转换为其他形式能量(机械能、光能、热能)的电功率。\n\n单位：瓦（W）\n\n公式：P = UIcosφ\n\n负载电阻所消耗的功率，也称平均功率。"
		case .index(1, 2):
			return "无功功率Q：为建立交变磁场和感应磁通而需要的电功率。\n\n单位：乏（var），常用千乏（kvar）\n\n公式：Q = UIsinφ\n\n无功功率不被转化为其他形式能量(机械能、光能、热能)。"
		case .index(1, 3):
			return "视在功率S：用电设备额定电压和电流的乘积。\n\n单位：伏安（VA），常用千伏安（kVA）\n\n公式：S = UI\n\n衡量设备的容量。"
		case .index(1, 4):
			return "额定功率P：指设备的有功功率。\n\n单位：瓦（W）\n\n公式：P = UIcosφ\n\n标识设备能转换的电功率。"
		case .index(1, 5):
			return "功率因素(cosφ)：有功功率和视在功率的比值。\n\n英文Power Factor，简称PF。\n\n公式：cosφ = P/S\n\n电阻负荷的功率因素为1，具有电感性负载的电路功率因素都小于1。"
		case .index(2, 0):
			return "用电设备的功率（额定，有功，无功）除以1h，等于该设备1h消耗的电能。\n\n单位: 千瓦/时（kW/h)，无功电量的单位是（kvar/h)。\n\n1度电 = 1kW/h"
		case .index(2, 1):
			return "逻辑门（Logic Gates)是在集成电路(Integrated Circuit)上的基本组件。简单的逻辑门可由晶体管组成。这些晶体管的组合可以使代表两种信号的高低电平在通过它们之后产生高电平或者低电平的信号。高、低电平可以分别代表逻辑上的“真”与“假”或二进制当中的1和0，从而实现逻辑运算。\n\n电平指电路中两点或几点在相同阻抗下电量的相对比值。\n\n常见的逻辑门：\n与门 AND\n或门 OR\n与非门 NAND：结果和与门相反\n或非门 NOR：结果和或门相反\n非门 NOT\n\n逻辑门可以组合使用实现更为复杂的逻辑运算。"
		default:
			return "Nothing Found"
		}
	}

	var introBody: String {
		switch self {
		case .index(0, 0):
			return "绝缘安全工具分：\n基本安全用具：绝缘强度应能长期承受工作电压，并能在本工作电压等级产生过电压时，保证工作人员的人身安全。\n\n辅助安全用具：绝缘强度不能承受电气设备或线路的工作电压，只能加强基本安全用具的保护作用，用来防止接触电压、跨步电压、电弧灼伤等对操作人员的危害。\n\n高压绝缘安全用具中：\n基本安全用具：绝缘棒、绝缘钳和验电笔等。\n辅助安全用具：绝缘手套、绝缘靴、绝缘垫、绝缘站台和绝缘毯等。\n\n低压绝缘安全用具中：\n基本安全用具：绝缘手套、装有绝缘柄的工具和低压验电器。\n辅助安全用具：绝缘台、绝缘垫、绝缘鞋和绝缘靴等。"
		case .index(0, 1):
			return "防止工作人员触电、电弧灼伤、高空坠落的一般安全用具，其本身不是绝缘物。常见有：\n\n携带型接地线\n\n临时遮拦\n\n标示牌\n\n警告牌\n\n护目镜\n\n安全带\n\n竹、木梯\n\n脚扣"
		case .index(0, 2):
			return "低压验电笔\n\n钢丝钳\n\n尖嘴钳\n\n斜口钳\n\n剥线钳\n\n电工刀\n\n螺钉旋具\n\n扳手\n\n冲击电钻\n\n电锤\n\n射钉枪\n\n压接钳\n\n电焊机\n\n振捣器、蛤蟆夯、清水泵及五齿锯\n\n移动式起重设备\n\n交流弧焊机"
		case .index(1, 0):
			return "发电机是将其他形式的能源转换成电能的机械设备，它由水轮机、汽轮机、柴油机或其他动力机械驱动，将水流，气流，燃料燃烧或原子核裂变产生的能量转化为机械能传给发电机，再由发电机转换为电能。\n\n按发电类型分类：\n直流发电机\n交流发电机\n\n按原理分类：\n同步发电机\n异步发电机\n单向发电机\n三相发电机\n\n按产生方式分类：\n汽轮发电机\n水轮发电机\n柴油发电机\n汽油发电机\n\n按能源分类：\n火力发电机\n水力发电机"
		case .index(2, 0):
			return "电源是将其它形式的能转换成电能的装置。\n\n电源自“磁生电”原理，由水力、风力、海潮、水坝水压差、太阳能等可再生能源，及烧煤炭、油渣等产生电力来源。\n\n开关电源是通过控制开关管开通和关断的时间比率，维持稳定输出电压的一种电源。\n\n常见的电源有干电池（直流电）和家用的110V-220V 交流电源。"
		case .index(2, 1):
			return "电容器，通常简称其容纳电荷的本领为电容，用字母C表示。\n\n定义1：电容器，顾名思义，是‘装电的容器’，是一种容纳电荷的器件。英文名称：capacitor。电容器是电子设备中大量使用的电子元件之一，广泛应用于电路中的隔直通交，耦合，旁路，滤波，调谐回路， 能量转换，控制等方面。\n\n定义2：电容器，任何两个彼此绝缘且相隔很近的导体（包括导线）间都构成一个电容器。\n\n是由两块金属电极之间夹一层绝缘电介质构成。当在两金属电极间加上电压时，电极上就会存储电荷，所以电容器是储能元件。任何两个彼此绝缘又相距很近的导体，组成一个电容器。平行板电容器由电容器的极板和电介质组成。\n\n特点：\n1.它具有充放电特性和阻止直流电流通过，允许交流电流通过的能力。\n\n2.在充电和放电过程中，两极板上的电荷有积累过程，也即电压有建立过程，因此，电容器上的电压不能突变。\n电容器的充电：两板分别带等量异种电荷，每个极板带电量的绝对值叫电容器的带电量。\n电容器的放电：电容器两极正负电荷通过导线中和。在放电过程中导线上有短暂的电流产生。\n\n3.电容器的容抗与频率、容量之间成反比。即分析容抗大小时就得联系信号的频率高低、容量大小。"
		case .index(2, 2):
			return "电感器(Inductor)是能够把电能转化为磁能而存储起来的元件。电感器的结构类似于变压器，但只有一个绕组。电感器具有一定的电感，它只阻碍电流的变化。如果电感器在没有电流通过的状态下，电路接通时它将试图阻碍电流流过它；如果电感器在有电流通过的状态下，电路断开时它将试图维持电流不变。电感器又称扼流器、电抗器、动态电抗器。\n\n电感器一般由骨架、绕组、屏蔽罩、封装材料、磁心或铁心等组成。主要参数有电感量、允许偏差、品质因数、分布电容及额定电流等。\n\n由单一线圈组成的电感器称为自感器，它的自感量又称为自感系数。两个电感线圈相互靠近时，一个电感线圈的磁场变化将影响另一个电感线圈，这种影响就是互感。互感的大小取决于电感线圈的自感与两个电感线圈耦合的程度，利用此原理制成的元件叫做互感器。\n\n电感器在电路中主要起到滤波、振荡、延迟、陷波等作用，还有筛选信号、过滤噪声、稳定电流及抑制电磁波干扰等作用。电感器的特性与电容器的特性正好相反，它具有阻止交流电通过而让直流电顺利通过的特性。电感在电路最常见的作用就是与电容一起，组成LC滤波电路。"
		case .index(2, 3):
			return "变压器（Transformer）是利用电磁感应的原理来改变交流电压的装置，主要构件是初级线圈、次级线圈和铁芯（磁芯）。\n\n主要功能：电压变换、电流变换、阻抗变换、隔离、稳压（磁饱和变压器）等。\n\n按相数分：\n1. 单相变压器：用于单相负荷和三相变压器组。\n2. 三相变压器：用于三相系统的升、降电压。\n\n按冷却方式分：\n1. 干式变压器：依靠空气对流进行自然冷却或增加风机冷却，多用于高层建筑、高速收费站点用电及局部照明、电子线路等小容量变压器。\n2. 油浸式变压器：依靠油作冷却介质、如油浸自冷、油浸风冷、油浸水冷、强迫油循环等。\n\n按用途分：\n1. 电力变压器：用于输配电系统的升、降电压。\n2. 仪用变压器：如电压互感器、电流互感器、用于测量仪表和继电保护装置。\n3. 试验变压器：能产生高压，对电气设备进行高压试验。\n4. 特种变压器：如电炉变压器、整流变压器、调整变压器、电容式变压器、移相变压器等。\n\n按绕组形式分：\n1. 双绕组变压器：用于连接电力系统中的两个电压等级。\n2. 三绕组变压器：一般用于电力系统区域变电站中，连接三个电压等级。\n3. 自耦变电器：用于连接不同电压的电力系统。也可做为普通的升压或降后变压器用。\n\n按铁芯形式分：\n1. 芯式变压器：用于高压的电力变压器。\n2. 非晶合金变压器：非晶合金铁芯变压器是用新型导磁材料，空载电流下降约80%，是节能效果较理想的配电变压器，特别适用于农村电网和发展中地区等负载率较低地方。\n3. 壳式变压器：用于大电流的特殊变压器，如电炉变压器、电焊变压器；或用于电子仪器及电视、收音机等的电源变压器。\n\n电路符号常用T当作编号的开头。"
		case .index(2, 4):
			return "逆变器（Inverter）是把直流电能（电池、蓄电瓶）转变成交流电（一般为220V,50Hz正弦波）。它由逆变桥、控制逻辑和滤波电路组成。逆变器广泛用于各种生活电器、电动工具上。\n\n逆变器在工作时其本身也要消耗一部分电力，因此，它的输入功率要大于它的输出功率。逆变器的效率即是逆变器输出功率与输入功率之比，即逆变器效率为输出功率比上输入功率。如一台逆变器输入了100瓦的直流电，输出了90瓦的交流电，那么，它的效率就是90%。"
		case .index(2, 5):
			return "整流器（Rectifier）是把交流电转换成直流电的装置，可用于供电装置及侦测无线电信号等。整流器可以由真空管，引燃管，固态矽半导体二极管，汞弧等制成。\n\n整流器是一个整流装置，简单的说就是将交流（AC）转化为直流（DC）的装置。它有两个主要功能：第一，将交流电（AC）变成直流电(DC)，经滤波后供给负载，或者供给逆变器；第二，给蓄电池提供充电电压。因此，它同时又起到一个充电器的作用。\n\n在备用UPS中只需要给蓄电池充电，不需要给负载供电，故只有充电机。在双变换UPS中，此装置既为逆变器供电，又给蓄电池充电，故称为整流器/充电机。"
		case .index(2, 6):
			return "继电器（Relay）是一种电控制器件，是当输入量（激励量）的变化达到规定要求时，在电气输出电路中使被控量发生预定的阶跃变化的一种电器。\n\n它具有控制系统（又称输入回路）和被控制系统（又称输出回路）之间的互动关系。通常应用于自动化的控制电路中，它实际上是用小电流去控制大电流运作的一种“自动开关”。\n\n在电路中起着自动调节、安全保护、转换电路等作用。\n\n继电器可以作为一个电流控制而非人工控制的开关，实现逻辑运算，这让它成为计算机的基础元件之一。"
		case .index(2, 7):
			return "空气开关，又名空气断路器，是一种当电路中电流超过额定电流就会自动断开的开关。\n\n空开集控制和多种保护功能于一身。除能完成接触和分断电路外，也能对电路或电气设备发生的短路、严重过载及欠电压等进行保护，同时可以用于不频繁地启动电动机。\n\n脱扣方式有热动、电磁和复式脱扣3种。当线路发生一般性过载时，过载电流虽不能使电磁脱扣器动作，但能使热元件产生一定热量，促使双金属片受热向上弯曲，推动杠杆使搭钩与锁扣脱开，将主触头分断，切断电源。当线路发生短路或严重过载电流时，短路电流超过瞬时脱扣整定电流值，电磁脱扣器产生足够大的吸力，将衔铁吸合并撞击杠杆，使搭钩绕转轴座向上转动与锁扣脱开，锁扣在反力弹簧的作用下将三副主触头分断，切断电源。\n\n开关的脱扣机构是一套连杆装置。当主触点通过操作机构闭合后，就被锁钩锁在合闸的位置。如果电路中发生故障，则有关的脱扣器将产生作用使脱扣机构中的锁钩脱开，于是主触点在释放弹簧的作用下迅速分断。按照保护作用的不同，脱扣器可以分为过电流脱扣器及失压脱扣器等类型。"
		case .index(2, 8):
			return "镇流器（Ballast resistor）是日光灯上起限流作用和产生瞬间高压的设备。\n\n它是在硅钢制作的铁芯上缠漆包线制作而成，这样的带铁芯的线圈，在瞬间开/关上电时，就会自感产生高压，加在日光灯管的两端的电极（灯丝）上。这个动作是交替进行，当启辉器（跳泡）闭合时，灯管的灯丝通过镇流器限流导通发热；当启辉器开路时，镇流器就会自感产生高压加在灯管的两端灯丝上，灯丝发射电子轰击管壁的萤光粉发光，启辉器反复几次通断，就会反复几次这样的动作，从而打通灯管。\n\n当灯管正常发光时，内阻变小，启辉器就始终保持开路状态，这样电流就稳定的通过灯管、镇流器工作了，使灯管正常发光。\n\n镇流器分电子镇流器和电感镇流器。"
		case .index(2, 9):
			return "电池（Battery）指盛有电解质溶液和金属电极以产生电流的杯、槽或其他容器或复合容器的部分空间，能将化学能转化成电能的装置。具有正极、负极之分。随着科技的进步，电池泛指能产生电能的小型装置。如太阳能电池。电池的性能参数主要有电动势、容量、比能量和电阻。利用电池作为能量来源，可以得到具有稳定电压，稳定电流，长时间稳定供电，受外界影响很小的电流，并且电池结构简单，携带方便，充放电操作简便易行，不受外界气候和温度的影响，性能稳定可靠，在现代社会生活中的各个方面发挥有很大作用。\n\n电瓶，也叫蓄电池，电池的一种。通常，人们所说的电瓶是指铅酸蓄电池。即一种主要由铅及其氧化物制成，电解液是硫酸溶液的蓄电池。"
		case .index(2, 10):
			return "UPS（Uninterruptible Power System/Supply），即不间断电源，是将蓄电池（多为铅酸免维护蓄电池）与主机相连接，通过主机逆变器等模块电路将直流电转换成市电的系统设备。\n\n主要用于给单台计算机、计算机网络系统或其它电力电子设备如电磁阀、压力变送器等提供稳定、不间断的电力供应。\n\n当市电输入正常时，UPS 将市电稳压后供应给负载使用，此时的UPS就是一台交流市电稳压器，同时它还向机内电池充电。\n\n当市电中断（事故停电）时， UPS 立即将电池的直流电能，通过逆变零切换转换的方法向负载继续供应220V交流电，使负载维持正常工作并保护负载软、硬件不受损坏。\n\nUPS 设备通常对电压过高或电压过低都能提供保护。"
		case .index(3, 0):
			return "万用表是以测量电压、电流和电阻为主要目的测量仪表。\n\n万用表按显示方式分为指针万用表和数字万用表。\n\n万用表是一种多功能、多量程的测量仪表，一般万用表可测量直流电流、直流电压、交流电流、交流电压、电阻和音频电平等，有的还可以测交流电流、电容量、电感量及半导体的一些参数等。"
		case .index(3, 1):
			return "电能表是用来测量电能的仪表，又称电度表。是专门用来计量某一时间段电能累计值的仪表。\n\n电能表分为感应式和电子式两大类：\n\n感应式电能表采用电磁感应的原理把电压、电流、相位转变为磁力矩，推动铝制圆盘转动，圆盘的轴（蜗杆）带动齿轮驱动计度器的鼓轮转动，转动的过程即是时间量累积的过程。因此感应式电能表的好处就是直观、动态连续、停电不丢数据。\n\n电子式电能表运用模拟或数字电路得到电压和电流向量的乘积，然后通过模拟或数字电路实现电能计量功能。由于应用了数字技术，分时计费电能表、预付费电能表、多用户电能表、多功能电能表纷纷登场，进一步满足了科学用电、合理用电的需求。"
		case .index(3, 2):
			return "电力监控仪表是针对电力系统、工矿企业、公用设施、智能大厦的电力监控需求而设计的电压、电流、功率、功率因数和电能等仪表。"
		case .index(4, 0):
			return "电动机（Motor）是把电能转换成机械能的一种设备。电动机工作原理是利用通电导线在磁场中受力作用，使电动机转动。\n\n通电线圈产生旋转磁场并作用于转子，形成磁电动力旋转扭矩。\n\n电动机按使用电源不同分为直流电动机和交流电动机。\n\n电力系统中的电动机大部分是交流电机，可以是同步电机或者是异步电机。电动机主要由定子与转子组成，通电导线在磁场中受力运动的方向跟电流方向和磁感线（磁场方向）方向有关。"
		case .index(4, 1):
			return "压缩机（Compressor）是将低压气体提升为高压气体的一种从动的流体机械，是制冷系统的心脏。\n\n它从吸气管吸入低温低压的制冷剂气体，通过电机运转带动活塞对其进行压缩后，向排气管排出高温高压的制冷剂气体，为制冷循环提供动力，从而实现压缩→冷凝（放热）→膨胀→蒸发 ( 吸热 ) 的制冷循环。"
		case .index(4, 2):
			return "微波炉（Microwave oven/microwave），顾名思义，就是用微波来烹饪的电器。微波炉是一种用微波加热食品的现代化烹调灶具。\n\n微波是一种电磁波。微波炉由电源，磁控管，控制电路和烹调腔等部分组成。电源向磁控管提供大约4000伏高压，磁控管在电源激励下，连续产生微波，再经过波导系统，耦合到烹调腔内。在烹调腔的进口处附近，有一个可旋转的搅拌器，因为搅拌器是风扇状的金属，旋转起来以后对微波具有各个方向的反射，所以能够把微波能量均匀地分布在烹调腔内，从而加热食物。微波炉的功率范围一般为500～1000瓦。\n\n用普通炉灶煮食物时，热量总是从食物外部逐渐进入食物内部的。而用微波炉烹饪，热量则是直接深入食物内部，所以烹饪速度比其它炉灶快4至10倍，热效率高达80%以上。目前，其它各种炉灶的热效率无法与它相比。 "
		default:
			return "Nothing Found"
		}
	}
}



