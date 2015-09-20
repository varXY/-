//
//  Catalog.swift
//  Q2
//
//  Created by 文川术 on 15/9/12.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

enum roundButton {
	case button1L, button2L, button3L
}

enum AnimationType {
	case Appear
	case Disappear
	case Touched
	case MovingAround
	case IsRightAnswer
	case FromZeroToFull
	case Other
}

enum Equation: Int {
	case zero = 0
	case one
	case two
	case three

	var navigationTitle: String {
		switch self {
		case .zero:
			return "I = U / R"
		case .one:
			return "P = U * I"
		case .two:
			return "W = P * t"
		case .three:
			return "马力&功率"
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
			return ["公制", "P", "英制", "P"]
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
			return ["ps", "W", "hp", "W"]
		}
	}

	var sectionTitle: String {
		switch self {
		case .zero:
			return "电压U，电阻R，电流I"
		case .one:
			return "电压U，电流I，功率P，功率因素PF（小于等于1）"
		case .two:
			return "功率P，时间t，电量W（单位：度）"
		case .three:
			return "公制马力ps，英制马力hp，功率P"
		}
	}
}

enum SectionTitle: Int {
	case zero = 0
	case one = 1
	case two = 2

	var titles: [String] {
		switch self {
		case .zero:
			return ["基本", "功率", "其他"]
		case .one:
			return ["字母", "电池", "电阻", "电容", "开关", "二极管", "线圈", "变压器", "磁头", "其他"]
		case .two:
			return ["工具", "发电", "计量", "传输", "用电"]
		}
	}
}

enum Unit {
	case index(Int, Int)

	var unitSubtitles: [String] {
		switch self {
		case .index(0, 0):
			return ["电势不同产生的能量差", "通过导体横截面的电量", "导体对电流阻碍作用的大小", "单位时间内周期性变化的次数"]
		case .index(0, 1):
			return ["单位时间内所做的功的多少", "负载电阻所消耗的功率", "用来建立磁场和磁通的电功率", "用电设备额定电压和电流的乘积", "用来标识设备能转换的电功率", "有功功率和视在功率的比值"]
		case .index(0, 2):
			return ["用电设备所需（消耗）的电能数量"]
		default:
			return [String]()
		}
	}

	var stringImage: [String] {
		switch self {
		case .index(0, 0):
			return ["U", "I", "R", "f"]
		case .index(0, 1):
			return ["P", "P", "Q", "S", "P", "PF"]
		case .index(0, 2):
			return ["W"]
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
			return ["电压", "电流", "电阻", "频率"]
		case .index(0, 1):
			return ["功率", "有功功率", "无功功率", "视在功率", "额定功率", "功率因数"]
		case .index(0, 2):
			return ["电量"]
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
			return ["灯泡、指示灯、信号灯", "扬声器", "蜂鸣器", "电铃", "熔断器、保险丝", "天线", "柔性管路", "接地"]
		case .index(2, 0):
			return ["绝缘安全工具", "一般防护安全用具", "电工常用工具"]
		case .index(2, 1):
			return ["发电机"]
		case .index(2, 2):
			return ["电源", "空开", "变压器", "继电器", "镇流器", "电瓶", "UPS"]
		case .index(2, 3):
			return ["万用表", "电能表", "电力监控仪表"]
		case .index(2, 4):
			return ["电动机", "压缩机"]
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
			return "电压（voltage），也称作电势差或电位差，是衡量单位电荷在静电场中由于电势不同所产生的能量差的物理量。其大小等于单位正电荷因受电场力作用从A点移动到B点所做的功，电压的方向规定为从高电位指向低电位的方向。\n\n单位：伏特（V，简称伏），常用单位毫伏（mV）、微伏（μV）、千伏（kV）。\n1kV = 1000V\n1V = 1000mV\n1mV = 1000μV\n\n公式：U=IR\n（I为电流，R是电阻）这个公式只适用于纯电阻电路\n\n串联电路中，总压等于分压和。\n并联电路中，支压都等电源压。\n\n电压与水位高低所造成的“水压”相似。需要指出的是，“电压”一词一般只用于电路当中，“电势差”和“电位差”则普遍应用于一切电现象当中。\n\n如果电压的大小及方向都不随时间变化，则称之为稳恒电压或恒定电压，简称为直流电压，用大写字母U表示。如果电压的大小及方向随时间变化，则称为变动电压。\n\n高压：对地电压高于或等于1000V\n低压：对地电压小于1000V\n安全电压：36V最常见（安全电压五等级：42V，36V，24V，12V，6V）"
		case .index(0, 1):
			return "导体中的自由电荷在电场力的作用下做有规则的定向运动就形成了电流。只有电路中保持有恒定的电动势（电力场），同时电路闭合才能形成电流。\n\n单位：安倍（A，简称安），常用单位千安（kA）毫安（mA）、微安(μA)。\n1kA = 1000A\n1A = 1000mA\n1mA = 1000μA\n\n公式：I=Q/t \nQ为通过导体横截面的电荷量，单位是库仑。t为电荷通过导体的时间，单位是秒。\n\n串联电路中，电路各部分的电流相等。\n并联电路中，干路电流等于各支路电流之和。\n\n交流电：大小和方向都发生周期性变化。\n生活中插墙式电器使用的是民用交流电源。 交流电在家庭生活、工业生产中有着广泛的使用，生活民用电压220V、通用工业电压380V，都属于危险电压。\n\n直流电：方向不随时间发生改变。\n生活中使用的可移动外置式电源提供的的是直流电。直流电一般被广泛使用于手电筒（干电池）、手机（锂电池）等各类生活小电器等。干电池（1.5V）、锂电池、蓄电池等被称之为直流电源。因为这些电源电压都不会超过24V，所以属于安全电源。"
		case .index(0, 2):
			return "电阻是导体本身的一种特性。电阻将会导致电子流通量的变化，电阻越小，电子流通量越大，反之亦然。而超导体则没有电阻。柱形均匀导体里，其电阻R与长度L成正比，与横截面积S成反比。\n\n电阻率：符号ρ，用来表示各种物质电阻特性的物理量，与温度有关，与长度、横截面无关。\n\n单位：欧姆(Ω，简称欧）。常用单位兆欧（MΩ）和千欧（KΩ）。\n1MΩ = 10kΩ\n1kΩ = 1000Ω\n\n定义式：R=U/I\n决定式：R=ρL/S\nρ表示电阻的电阻率，是由其本身性质决定，L表示电阻的长度，S表示电阻的横截面积\n\n串联：R=R1+R2+...+Rn\n并联：R=1/(1/R1+1/R2+...+1/Rn)\n\n电阻种类：满足欧姆定律的为线性电阻（欧姆电阻），反之为非线性电阻。"
		case .index(0, 3):
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
			return "功率因素(cosφ)：有功功率和视在功率的比值。\n\n英文Power Factor，简称PF。\n\n公式：cosφ = P/S\n\n电阻负荷的功率因素为1，具有电感性负载的电路功率因素都小于1"
		case .index(2, 0):
			return "用电设备的功率（额定，有功，无功）除以1h，等于该设备1h消耗的电能。\n单位: 千瓦/时（kW/h)，无功电量的单位是（kvar/h)。\n1度电 = 1kW/h"
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
			return "电源是将其它形式的能转换成电能的装置。\n\n开关电源是通过控制开关管开通和关断的时间比率，维持稳定输出电压的一种电源。\n\n常见的电源有干电池（直流电）和家用的110V-220V 交流电源。"
		case .index(2, 1):
			return "空气开关，又名空气断路器，是一种当电路中电流超过额定电流就会自动断开的开关\n\n空开集控制和多种保护功能于一身。除能完成接触和分断电路外，也能对电路或电气设备发生的短路、严重过载及欠电压等进行保护，同时可以用于不频繁地启动电动机。"
		case .index(2, 2):
			return "变压器（Transformer）是利用电磁感应的原理来改变交流电压的装置，主要构件是初级线圈、次级线圈和铁芯（磁芯）。\n\n主要功能：电压变换、电流变换、阻抗变换、隔离、稳压（磁饱和变压器）等。\n\n电路符号常用T当作编号的开头。"
		case .index(2, 3):
			return "继电器（relay）是一种电控制器件，是当输入量（激励量）的变化达到规定要求时，在电气输出电路中使被控量发生预定的阶跃变化的一种电器。\n\n它具有控制系统（又称输入回路）和被控制系统（又称输出回路）之间的互动关系。通常应用于自动化的控制电路中，它实际上是用小电流去控制大电流运作的一种“自动开关”。\n\n在电路中起着自动调节、安全保护、转换电路等作用。"
		case .index(2, 4):
			return "镇流器（ballast resistor）是日光灯上起限流作用和产生瞬间高压的设备。\n\n它是在硅钢制作的铁芯上缠漆包线制作而成，这样的带铁芯的线圈，在瞬间开/关上电时，就会自感产生高压，加在日光灯管的两端的电极（灯丝）上。这个动作是交替进行，当启辉器（跳泡）闭合时，灯管的灯丝通过镇流器限流导通发热；当启辉器开路时，镇流器就会自感产生高压加在灯管的两端灯丝上，灯丝发射电子轰击管壁的萤光粉发光，启辉器反复几次通断，就会反复几次这样的动作，从而打通灯管。\n\n当灯管正常发光时，内阻变小，启辉器就始终保持开路状态，这样电流就稳定的通过灯管、镇流器工作了，使灯管正常发光。\n\n镇流器分电子镇流器和电感镇流器。"
		case .index(2, 5):
			return "电瓶，也叫蓄电池，电池的一种，它的工作原理就是把化学能转化为电能。\n\n通常，人们所说的电瓶是指铅酸蓄电池。即一种主要由铅及其氧化物制成，电解液是硫酸溶液的蓄电池。"
		case .index(2, 6):
			return "UPS（Uninterruptible Power System/Supply），即不间断电源，是将蓄电池（多为铅酸免维护蓄电池）与主机相连接，通过主机逆变器等模块电路将直流电转换成市电的系统设备。\n\n主要用于给单台计算机、计算机网络系统或其它电力电子设备如电磁阀、压力变送器等提供稳定、不间断的电力供应。\n\n当市电输入正常时，UPS 将市电稳压后供应给负载使用，此时的UPS就是一台交流市电稳压器，同时它还向机内电池充电。\n\n当市电中断（事故停电）时， UPS 立即将电池的直流电能，通过逆变零切换转换的方法向负载继续供应220V交流电，使负载维持正常工作并保护负载软、硬件不受损坏。\n\nUPS 设备通常对电压过高或电压过低都能提供保护。"
		case .index(3, 0):
			return "万用表是以测量电压、电流和电阻为主要目的测量仪表。\n\n万用表按显示方式分为指针万用表和数字万用表。\n\n万用表是一种多功能、多量程的测量仪表，一般万用表可测量直流电流、直流电压、交流电流、交流电压、电阻和音频电平等，有的还可以测交流电流、电容量、电感量及半导体的一些参数等。"
		case .index(3, 1):
			return "电能表是用来测量电能的仪表，又称电度表。\n\n是专门用来计量某一时间段电能累计值的仪表"
		case .index(3, 2):
			return "电力监控仪表是针对电力系统、工矿企业、公用设施、智能大厦的电力监控需求而设计的电压、电流、功率、功率因数和电能等仪表。"
		case .index(4, 0):
			return "电动机（Motor）是把电能转换成机械能的一种设备。电动机工作原理是利用通电导线在磁场中受力作用，使电动机转动。\n\n通电线圈产生旋转磁场并作用于转子，形成磁电动力旋转扭矩。\n\n电动机按使用电源不同分为直流电动机和交流电动机。\n\n电力系统中的电动机大部分是交流电机，可以是同步电机或者是异步电机。电动机主要由定子与转子组成，通电导线在磁场中受力运动的方向跟电流方向和磁感线（磁场方向）方向有关。"
		case .index(4, 1):
			return "压缩机（compressor）是将低压气体提升为高压气体的一种从动的流体机械，是制冷系统的心脏。\n\n它从吸气管吸入低温低压的制冷剂气体，通过电机运转带动活塞对其进行压缩后，向排气管排出高温高压的制冷剂气体，为制冷循环提供动力，从而实现压缩→冷凝（放热）→膨胀→蒸发 ( 吸热 ) 的制冷循环"
		default:
			return "Nothing Found"
		}
	}
}
