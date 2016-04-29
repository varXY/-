//
//  AdvancedQuestion.swift
//  电工助手
//
//  Created by 文川术 on 4/28/16.
//  Copyright © 2016 xiaoyao. All rights reserved.
//

import Foundation

extension Question {

	func getAdvancedQuestion(number: Int) -> Question? {
		var question = Question()

		switch number {
		case 0:
			question.question = "在直流电路中，基尔霍夫第二定律的正确表达式是："
			question.rightAnswer = "∑∪=0"
			question.wrongAnswer = "∑IR=0"
			return question
		case 1:
			question.question = "共发射级放大电路中，当负载电阻增大时，其电压放大倍数的值将："
			question.rightAnswer = "增大"
			question.wrongAnswer = "减小"
			return question
		case 2:
			question.question = "把3块磁体从中间等分成6块可获得几个磁极？"
			question.rightAnswer = "12"
			question.wrongAnswer = "6"
			return question
		case 3:
			question.question = "以下列材料分别组成相同规格的四个磁路，磁阻最大的材料是："
			question.rightAnswer = "黄铜"
			question.wrongAnswer = "镍"
			return question
		case 4:
			question.question = "在铁磁物质组成的磁路中，磁阻是非线性的原因是："
			question.rightAnswer = "磁导率是非线性的"
			question.wrongAnswer = "磁通是非线性的"
			return question
		case 5:
			question.question = "示波器中的扫描发生器实际上是一个："
			question.rightAnswer = "正弦波振荡器"
			question.wrongAnswer = "多谐振荡器"
			return question
		case 6:
			question.question = "线圈自感电动势的大小与什么无关？"
			question.rightAnswer = "线圈的电阻"
			question.wrongAnswer = "线圈的匝数"
			return question
		case 7:
			question.question = "互感器线圈的极性一般根据什么来判定？"
			question.rightAnswer = "同名端"
			question.wrongAnswer = "楞次定律"
			return question
		case 8:
			question.question = "用晶体管图示仪观察共发射极放大电路的输入特性时，X轴作用开关置于基极电压，Y轴作用开关置于基极电流。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 9:
			question.question = "同步示波器采用触发扫描方式，即外界信号触发一次，产生扫描电压波形的个数为："
			question.rightAnswer = "1个"
			question.wrongAnswer = "2个"
			return question
		case 10:
			question.question = "直流电动机的换向极极性与顺着电枢转向的下一个主极极性："
			question.rightAnswer = "相反"
			question.wrongAnswer = "相同"
			return question
		case 11:
			question.question = "SR-8型双踪示波器中的电子开关有几个工作状态？"
			question.rightAnswer = "5个"
			question.wrongAnswer = "3个"
			return question
		case 12:
			question.question = "在实际调整模拟放大电路的静态工作点时，一般是以什么为准？"
			question.rightAnswer = "Ib"
			question.wrongAnswer = "Ube"
			return question
		case 13:
			question.question = "直流放大器中，产生零点飘移的主要原因是："
			question.rightAnswer = "温度变化"
			question.wrongAnswer = "频率变化"
			return question
		case 14:
			question.question = "在运算电路中，集成运算放大器工作在线性区域，因而要引入什么，从而利用反馈网络实现各种数学运算？"
			question.rightAnswer = "深度负反馈"
			question.wrongAnswer = "深度正反馈"
			return question
		case 15:
			question.question = "TTL与非门的输入端全部同时悬空时，输出为："
			question.rightAnswer = "低电平"
			question.wrongAnswer = "高电平"
			return question
		case 16:
			question.question = "在下列数码显示器中，最省电的是："
			question.rightAnswer = "液晶显示器"
			question.wrongAnswer = "荧光数码管"
			return question
		case 17:
			question.question = "电力晶体管的缺点是："
			question.rightAnswer = "易受二次击穿而损坏"
			question.wrongAnswer = "功率容量小"
			return question
		case 18:
			question.question = "电子设备的输入电路与输出电路尽量不要靠近，以免发生："
			question.rightAnswer = "自激振荡"
			question.wrongAnswer = "短路"
			return question
		case 19:
			question.question = "大型变压器为充分利用空间，常采用："
			question.rightAnswer = "阶梯形截面"
			question.wrongAnswer = "方形截面"
			return question
		case 20:
			question.question = "变压器内清洗时，油箱及铁心等处的油泥可用铲刀刮除，再用布擦干净，然后用变压器油冲洗。决不能用："
			question.rightAnswer = "碱水刷洗"
			question.wrongAnswer = "强流油刷洗"
			return question
		case 21:
			question.question = "水轮发电机的定子结构与三相异步电动机的定子结构基本相同，但其转子一般采用："
			question.rightAnswer = "凸极式"
			question.wrongAnswer = "罩极式"
			return question
		case 22:
			question.question = "三相异步电动机转子绕组的绕制和嵌线时，较大容量的绕线式转子绕组采用："
			question.rightAnswer = "裸铜条"
			question.wrongAnswer = "圆铜线"
			return question
		case 23:
			question.question = "三相异步电动机的故障一般可分为几类？"
			question.rightAnswer = "两类"
			question.wrongAnswer = "三类"
			return question
		case 24:
			question.question = "按技术要求规定，什么电动机要进行超速试验？"
			question.rightAnswer = "线绕式异步"
			question.wrongAnswer = "鼠笼式异步"
			return question
		case 25:
			question.question = "变压器耐压试验时，电压持续时间为："
			question.rightAnswer = "1分钟"
			question.wrongAnswer = "3分钟"
			return question
		case 26:
			question.question = "三相异步电动机启动瞬间，启动电流很大，启动转矩："
			question.rightAnswer = "不很大"
			question.wrongAnswer = "最大"
			return question
		case 27:
			question.question = "直流电动机采用能耗制动是利用励磁电流产生的什么磁通，进而产生感生电动势，致使电动机制动？"
			question.rightAnswer = "恒定磁通"
			question.wrongAnswer = "交变磁通"
			return question
		case 28:
			question.question = "线绕式异步电动机，采用转子串联电阻进行调速时，串联的电阻越大，则转速："
			question.rightAnswer = "越低"
			question.wrongAnswer = "越高"
			return question
		case 29:
			question.question = "测速发电机有两套绕组，其输出绕组与什么相接？"
			question.rightAnswer = "高阻抗仪表"
			question.wrongAnswer = "低阻抗仪表"
			return question
		case 30:
			question.question = "交流伺服电动机的转子通常做成："
			question.rightAnswer = "鼠笼式"
			question.wrongAnswer = "罩极式"
			return question
		case 31:
			question.question = "发电机的基本工作原理是："
			question.rightAnswer = "电磁感应"
			question.wrongAnswer = "电流的热效应"
			return question
		case 32:
			question.question = "线性异步电动机采用转子串电阻调速时，在电阻上将消耗大量的能量，调速高低与损耗大小的关系是："
			question.rightAnswer = "调速越低，损耗越大"
			question.wrongAnswer = "调速越高，损耗越大"
			return question
		case 33:
			question.question = "下列哪种做法不能改变交流异步电动机转速？"
			question.rightAnswer = "改变供电电网的电压"
			question.wrongAnswer = "改变定子绕组的磁极对数"
			return question
		case 34:
			question.question = "转子供电式三相并励交流换向器电动机的调速范围在多少以内时，调速平滑性很高？"
			question.rightAnswer = "3：1"
			question.wrongAnswer = "5：1"
			return question
		case 35:
			question.question = "变频调速中的变频电源是什么之间的接口？"
			question.rightAnswer = "市电电源与交流电机"
			question.wrongAnswer = "交流电机"
			return question
		case 36:
			question.question = "直流电动机调速的方法中，什么能实现无级调速且能量损耗小？"
			question.rightAnswer = "斩波器"
			question.wrongAnswer = "改变电枢回路电阻"
			return question
		case 37:
			question.question = "电压负反馈调速系统通过稳定直流电动机电枢电压来达到稳定转速的目的，其原理是电枢电压的变化与："
			question.rightAnswer = "转速的变化成正比"
			question.wrongAnswer = "转速的变化成反比"
			return question
		case 38:
			question.question = "电流截止负反馈的截止方法可以用："
			question.rightAnswer = "电压比较法"
			question.wrongAnswer = "功率比较法"
			return question
		case 39:
			question.question = "带有速度、电流双闭环的调速系统，在启动时调节作用主要靠什么调节器产生？"
			question.rightAnswer = "电流"
			question.wrongAnswer = "速度"
			return question
		case 40:
			question.question = "磁尺主要参数有动态范围、精度、分辨率，其中动态范围应为："
			question.rightAnswer = "1～20m"
			question.wrongAnswer = "1～50m"
			return question
		case 41:
			question.question = "CNC数控系统工作时是："
			question.rightAnswer = "一边插补，一边加工"
			question.wrongAnswer = "先加工，后插补"
			return question
		case 42:
			question.question = "现代数控机床的数控系统是由机床控制程序、数控装置、可编程控制器、主轴控制系统及进给控制系统等组成，其核心部分是："
			question.rightAnswer = "数控装置"
			question.wrongAnswer = "主轴控制系统"
			return question
		case 43:
			question.question = "交流双速电梯的运行速度一般应小于："
			question.rightAnswer = "1m/s"
			question.wrongAnswer = "2.5m/s"
			return question
		case 44:
			question.question = "缩短基本时间的措施是："
			question.rightAnswer = "采用新技术、新设备、新工艺"
			question.wrongAnswer = "减少准备时间"
			return question
		case 45:
			question.question = "交流集选电梯，当电梯(自由状态)从3层向上运行时，2层有人按向上呼梯按钮，4层有人按向下呼梯按钮，5层有人按向上呼梯按钮同时轿厢有人按1层按钮，电梯应停于："
			question.rightAnswer = "5层"
			question.wrongAnswer = "4层"
			return question
		case 46:
			question.question = "PLC交流双速电梯，PLC输出接口一般采用什么方式？"
			question.rightAnswer = "继电器"
			question.wrongAnswer = "晶闸管"
			return question
		case 47:
			question.question = "当PLC交流电梯额定速度大于0.63m/s时，安全钳应选用："
			question.rightAnswer = "渐进式"
			question.wrongAnswer = "瞬时式"
			return question
		case 48:
			question.question = "计算机运行过程不能自动连续，需人工干预。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 49:
			question.question = "一个完整的计算机硬件系统包括："
			question.rightAnswer = "计算机及其外围设备"
			question.wrongAnswer = "主机、键盘及显示器"
			return question
		case 50:
			question.question = "计算机内采用二进制的主要原因是："
			question.rightAnswer = "电子元件特征"
			question.wrongAnswer = "运算精度高"
			return question
		case 51:
			question.question = "单相半桥逆变器(电压型)有几个导电臂？"
			question.rightAnswer = "2个"
			question.wrongAnswer = "4个"
			return question
		case 52:
			question.question = "工时定额通常包括作业时间、布置工作地时间、休息与生活需要的时间、以及："
			question.rightAnswer = "加工准备和结束时间"
			question.wrongAnswer = "停工损失时间"
			return question
		case 53:
			question.question = "缩短辅助时间的措施是："
			question.rightAnswer = "正确编制操作工艺"
			question.wrongAnswer = "减少准备时间"
			return question
		case 54:
			question.question = "PLC交流双速电梯，目前层楼指示器普遍采用："
			question.rightAnswer = "七段数码管"
			question.wrongAnswer = "发光二极管"
			return question
		case 55:
			question.question = "剖分式轴瓦两端凸缘的作用是："
			question.rightAnswer = "防止轴瓦的轴向移动"
			question.wrongAnswer = "增强轴瓦的刚度"
			return question
		case 56:
			question.question = "对两轴对中不好或偏斜有补偿能力的联轴器是："
			question.rightAnswer = "滑块联轴器"
			question.wrongAnswer = "齿轮联轴器"
			return question
		case 57:
			question.question = "开式油箱的吸油管和回油管间的距离应该："
			question.rightAnswer = "尽可能远一点"
			question.wrongAnswer = "越近越好"
			return question
		case 58:
			question.question = "使用示波器时，不要经常开闭电源，防止损伤示波管的灯丝。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 59:
			question.question = "克服零点飘移最有效的措施是采用交流负反馈电路。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 60:
			question.question = "在不需要外加输入信号的情况下，放大电路能够输出持续的、有足够幅度的直流信号的现象叫振荡。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 61:
			question.question = "串联稳压电路的输出电压可以任意。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 62:
			question.question = "非门的逻辑功能可概括为有0出1，有1出0。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 63:
			question.question = "石英晶体多谐振荡器的频率稳定性比TTL与非门RC环形多谐振荡器的高。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 64:
			question.question = "晶闸管斩波器的作用是把可调的直流电压变为固定的直流电压。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 65:
			question.question = "电力场效应管是理想的电流控制器件。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 66:
			question.question = "一般直流电机的换向极铁心采用硅钢片叠装而成。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 67:
			question.question = "直流发电机在原动机的拖动下产生交流电动势，再通过电枢产生直流电压输出。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 68:
			question.question = "旋转变压器是一种输出电压随转子转角变化的信号元件。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 69:
			question.question = "在自动装置和遥控系统中使用的自整角机都是单台电机。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 70:
			question.question = "直流力矩电动机一般做成电磁的少极磁场。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 71:
			question.question = "三相交流换向器电动机其输出功率和电动机转速成正比例增减，因为电动机具有恒转矩特性。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 72:
			question.question = "斩波器属于直流/直流变换。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 73:
			question.question = "调速范围满足一定的静差率条件，同理，静差率是在满足一定的调速范围条件下讲的。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 74:
			question.question = "转速负反馈调速系统的动态特点取决于系统的闭环放大倍数。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 75:
			question.question = "电流正反馈反映的物理量是电机负载的大小，而不是被调整量电压或速度的大小。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 76:
			question.question = "在电压型逆变器中，是用大电感来缓冲无功能量的。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 77:
			question.question = "V型带带轮的计算直径是带轮的外径。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 78:
			question.question = "下列多级放大电路中，低频特性较好的是："
			question.rightAnswer = "直接耦合"
			question.wrongAnswer = "阻容耦合"
			return question
		case 79:
			question.question = "逻辑表达式A＋AB等于："
			question.rightAnswer = "A"
			question.wrongAnswer = "1＋B"
			return question
		case 80:
			question.question = "微机中，存贮器与磁盘之间的数据传送采用："
			question.rightAnswer = "DMA方式"
			question.wrongAnswer = "查询方式"
			return question
		case 81:
			question.question = "在三相半波可控整流电路中，当负载为电感性时，负载电感量越大，则："
			question.rightAnswer = "导通角越大"
			question.wrongAnswer = "导通角越小"
			return question
		case 82:
			question.question = "逆变器是："
			question.rightAnswer = "直流电变换为交流电"
			question.wrongAnswer = "交流电压升高或降低"
			return question
		case 83:
			question.question = "在自动控制系统中，若想稳定某个物理量，就该引入该物理量的："
			question.rightAnswer = "负反馈"
			question.wrongAnswer = "正反馈"
			return question
		case 84:
			question.question = "带有速度、电流双闭环调速系统，在启动时，调节作用主要靠什么产生？"
			question.rightAnswer = "电流调节器"
			question.wrongAnswer = "速度调节器"
			return question
		case 85:
			question.question = "带有速度、电流双闭环调速系统，在系统过载或堵转时，速度调节器处于："
			question.rightAnswer = "饱和状态"
			question.wrongAnswer = "截止状态"
			return question
		case 86:
			question.question = "不属于分布式网络的是："
			question.rightAnswer = "环型网"
			question.wrongAnswer = "总线型网"
			return question
		case 87:
			question.question = "PLC的直流开关量输出模块又称为晶体管开关量输出模块，属无触点输出模块。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 88:
			question.question = "PLC与变频器都可进行故障自诊断。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 89:
			question.question = "PLC的输入电路采用光电耦合方式。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 90:
			question.question = "不是计算机网络的基本组成的是："
			question.rightAnswer = "集中器"
			question.wrongAnswer = "通信子网"
			return question
		case 91:
			question.question = "组合逻辑门电路在任意时刻的输出状态只取决于该时刻的："
			question.rightAnswer = "输入状态"
			question.wrongAnswer = "电路状态"
			return question
		case 92:
			question.question = "在三相半波可控整流电路中，每只晶闸管的最大导通角为："
			question.rightAnswer = "120°"
			question.wrongAnswer = "90°"
			return question
		case 93:
			question.question = "电压负反馈主要补偿什么电阻上电压的损耗？"
			question.rightAnswer = "电源内阻"
			question.wrongAnswer = "电枢电阻"
			return question
		case 94:
			question.question = "带有速度、电流双闭环调速系统，在负载变化时出现偏差，消除偏差主要靠："
			question.rightAnswer = "速度调节器"
			question.wrongAnswer = "电流调节器"
			return question
		case 95:
			question.question = "软件是网络系统软件中的最重要、最核心的部分是："
			question.rightAnswer = "网络协议"
			question.wrongAnswer = "网络通信"
			return question
		case 96:
			question.question = "RS-232-C标准中规定逻辑1信号电平为："
			question.rightAnswer = "-3～-15V"
			question.wrongAnswer = "+3～+15V"
			return question
		case 97:
			question.question = "属于轮廓控制型数控机床的是："
			question.rightAnswer = "数控车床"
			question.wrongAnswer = "数控钻床"
			return question
		case 98:
			question.question = "“CNC”的含义是："
			question.rightAnswer = "计算机数字控制"
			question.wrongAnswer = "数字控制"
			return question
		case 99:
			question.question = "PLC的工作方式是："
			question.rightAnswer = "串行工作方式"
			question.wrongAnswer = "并行工作方式"
			return question
		case 100:
			question.question = "数控系统所规定的最小设定单位是："
			question.rightAnswer = "脉冲当量"
			question.wrongAnswer = "机床的加工精度"
			return question
		case 101:
			question.question = "计算机由输入设备、输出设备、存储器、运算器和什么组成？"
			question.rightAnswer = "控制器"
			question.wrongAnswer = "管理器"
			return question
		case 102:
			question.question = "计算机中最基本的存取单位是："
			question.rightAnswer = "字节"
			question.wrongAnswer = "位"
			return question
		case 103:
			question.question = "目前使用最广泛的网络拓朴结构是："
			question.rightAnswer = "总线拓朴"
			question.wrongAnswer = "星形拓朴"
			return question
		case 104:
			question.question = "一个发光二极管显示器应显示“7”，实际显示“1”，故障线段应为："
			question.rightAnswer = "a"
			question.wrongAnswer = "b"
			return question
		case 105:
			question.question = "将二进制数00111011转换为十六进制数是："
			question.rightAnswer = "3BH"
			question.wrongAnswer = "3AH"
			return question
		case 106:
			question.question = "PLC交流电梯的PLC输出接口驱动负载是直流感性负载时，则该在负载两端："
			question.rightAnswer = "并联一个二极管"
			question.wrongAnswer = "串联一个二极管"
			return question
		case 107:
			question.question = "PLC可编程序控制器，整个工作过程分五个阶段，当PLC通电运行时，第四个阶段应为："
			question.rightAnswer = "执行用户程序"
			question.wrongAnswer = "读入现场信号"
			return question
		case 108:
			question.question = "国内外PLC各生产厂家都把什么作为第一用户编程语言？"
			question.rightAnswer = "梯形图"
			question.wrongAnswer = "逻辑功能图"
			return question
		case 109:
			question.question = "输入采样阶段是PLC的中央处理器，对各输入端进行扫描，将输入端信号送入："
			question.rightAnswer = "状态寄存器"
			question.wrongAnswer = "累加器"
			return question
		case 110:
			question.question = "PLC可编程序控制器，依据负载情况不同，输出接口有几种类型？"
			question.rightAnswer = "3种"
			question.wrongAnswer = "4种"
			return question
		case 111:
			question.question = "OUT指令能够驱动："
			question.rightAnswer = "暂存继电器"
			question.wrongAnswer = "输入继电器"
			return question
		case 112:
			question.question = "连续使用OR-LD指令的数量应："
			question.rightAnswer = "小于8个"
			question.wrongAnswer = "大于8个"
			return question
		case 113:
			question.question = "理想集成运放的共模抑制比应该为："
			question.rightAnswer = "无穷大"
			question.wrongAnswer = "零"
			return question
		case 114:
			question.question = "微机中，存贮器与磁盘之间的数据传送采用："
			question.rightAnswer = "DMA"
			question.wrongAnswer = "查询方式"
			return question
		case 115:
			question.question = "驱动功率小，驱动电路简单的是："
			question.rightAnswer = "功率场控晶体管"
			question.wrongAnswer = "可关断晶闸管"
			return question
		case 116:
			question.question = "在自动控制系统中，若想稳定某个物理量，就该引入该物理量的："
			question.rightAnswer = "负反馈"
			question.wrongAnswer = "微分负反馈"
			return question
		case 117:
			question.question = "集成运放实质是直接耦合与阻容耦合密切结合的多级放大电路。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 118:
			question.question = "自动调速系统采用PI调节器，因它既有较高的静态精度，又有较快的动态响应。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 119:
			question.question = "过零比较器的基础上再引入负反馈，可构成迟滞比较器。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 120:
			question.question = "时序逻辑电路具有自启动能力的关键是能否从无效状态转入有效状态。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 121:
			question.question = "转速超调是速度调节器退出饱和的唯一方式。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 122:
			question.question = "及时抑制电压扰动是双环调速系统中电流调节器作用之一。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 123:
			question.question = "计算机网络体系结构是由网络协议决定的。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 124:
			question.question = "矢量变换控制是将静止坐标系所表示的电动机矢量变换到以气隙磁通或转子磁通定向的坐标系。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 125:
			question.question = "全面质量管理的核心是强调提高人的工作质量。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 126:
			question.question = "放大电路的频率响应，是电路电压放大倍数和频率的关系。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 127:
			question.question = "无静差调速系统是指动态有差而静态无差。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 128:
			question.question = "时序逻辑电路与组合逻辑电路最大不同在于前者与电路原来的状态有关。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 129:
			question.question = "单闭环直流调速系统，突加给定信号启动时，限制电流冲击的方法是电流截止负反馈。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 130:
			question.question = "安装均衡电抗器是削除脉动环流的办法。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 131:
			question.question = "异步电机与同步电机变频的实质是改变旋转磁场的转速。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 132:
			question.question = "全控整流电路可以工作于整流状态和有源逆变状态。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 133:
			question.question = "全面质量管理，简称TQC，由企业全体人员参加。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 134:
			question.question = "理想的集成运算放大器的输入电阻 ，输入电阻 。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 135:
			question.question = "自动调速系统采用PI调节器，因它既有较高的静态精度，又有较快的动态响应。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 136:
			question.question = "功率场控晶体管MOSFET是一种复合型电力半导体器件。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 137:
			question.question = "组合逻辑电路的分析和设计是互逆的两个过程。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 138:
			question.question = "及时抑制电压扰动是双环调速系统中电流调节器作用之一。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 139:
			question.question = "计算机网络体系结构是由网络协议决定的。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 140:
			question.question = "矢量变换控制是将静止坐标系所表示的电动机矢量变换到以气隙磁通或转子磁通定向的坐标系。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 141:
			question.question = "全面质量管理的核心是强调提高人的工作质量。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 142:
			question.question = "周围产生稳定磁场的导线是："
			question.rightAnswer = "500V直流输电"
			question.wrongAnswer = "380V交流输电"
			return question
		case 143:
			question.question = "互感系数的大小值与什么因素无关？"
			question.rightAnswer = "两线圈的绕向"
			question.wrongAnswer = "两个线圈的匝数"
			return question
		case 144:
			question.question = "各点磁感应强度相同的是："
			question.rightAnswer = "地球同纬度线各点"
			question.wrongAnswer = "地球同经度线各点"
			return question
		case 145:
			question.question = "如果在某线圈中放入铁磁性材料，该线圈的自感系数将会："
			question.rightAnswer = "显著增大"
			question.wrongAnswer = "显著减小"
			return question
		case 146:
			question.question = "在可控硅调速系统中，选择可控硅额定平均电流应以电动机的什么作为依据？"
			question.rightAnswer = "起动电流"
			question.wrongAnswer = "额定电流"
			return question
		case 147:
			question.question = "直流放大器的最大特点是："
			question.rightAnswer = "能直接耦合"
			question.wrongAnswer = "稳定性好"
			return question
		case 148:
			question.question = "HTL与ITL与非门相比："
			question.rightAnswer = "HTL比TTL抗干扰能力高"
			question.wrongAnswer = "HTL比TTL集成度高"
			return question
		case 149:
			question.question = "数字电路的特点是："
			question.rightAnswer = "输入输出信号都是离散的"
			question.wrongAnswer = "输入输出信号都是连续的"
			return question
		case 150:
			question.question = "如果电阻的阻值能反映温度、压力等非电量的变化，我们可以利用什么来测这些非电量？"
			question.rightAnswer = "不平衡电桥"
			question.wrongAnswer = "平衡电桥"
			return question
		case 151:
			question.question = "变压器主绝缘击穿的修理步骤为：更换绝缘、烘干器身和："
			question.rightAnswer = "灌入合格的变压器油"
			question.wrongAnswer = "修好接地片"
			return question
		case 152:
			question.question = "露天安装变压器与火灾危险场所的距离不应小于："
			question.rightAnswer = "25米"
			question.wrongAnswer = "20米"
			return question
		case 153:
			question.question = "SW6-220型少油断路器三相底座中心线误差不大于："
			question.rightAnswer = "5mm"
			question.wrongAnswer = "8mm"
			return question
		case 154:
			question.question = "GN型隔离开关可动刀片进入插口的度不应小于："
			question.rightAnswer = "80％"
			question.wrongAnswer = "90％"
			return question
		case 155:
			question.question = "真空断路器大修后必须检验合闸接触器是否动作灵活，其最低动作电压应是额定电压的："
			question.rightAnswer = "85％"
			question.wrongAnswer = "50％"
			return question
		case 156:
			question.question = "电容器安装时，三相电容量的差值应调配到最小，其最大与最小的差值不应超过平均值的："
			question.rightAnswer = "5％"
			question.wrongAnswer = "10％"
			return question
		case 157:
			question.question = "起动直流电动机时，通常在电枢回路中串入必要的电阻，目的是："
			question.rightAnswer = "限制起动电流"
			question.wrongAnswer = "产生必要的电磁转矩"
			return question
		case 158:
			question.question = "在过载冲击时，处理由电枢反应引起主磁极下面的磁场畸变故障应："
			question.rightAnswer = "采用补偿绕组"
			question.wrongAnswer = "更换换向极"
			return question
		case 159:
			question.question = "直流小母线和控制盘的电压小母线，在断开其它连接支路时，绝缘电阻应不小于："
			question.rightAnswer = "10M"
			question.wrongAnswer = "30M"
			return question
		case 160:
			question.question = "什么时候开始微处理器被应用到可编程序控制器中，从而真正成为一种电子计算机工业控制装置？"
			question.rightAnswer = "60年代后期"
			question.wrongAnswer = "70年代初期"
			return question
		case 161:
			question.question = "EEPROM存储卡盒第一次使用时，“PROG-E”LED闪烁，表示："
			question.rightAnswer = "卡盒尚未初始化"
			question.wrongAnswer = "卡盒与内置RAM将同时工作"
			return question
		case 162:
			question.question = "FX2N系列PLC可编程序控制器能够提供100ms时钟脉冲辅助继电器是："
			question.rightAnswer = "M8012"
			question.wrongAnswer = "M8011"
			return question
		case 163:
			question.question = "FX2N可编程序控制器面板上的“RPOG-E”LED闪烁是："
			question.rightAnswer = "忘记设置定时器或计数器常数"
			question.wrongAnswer = "设备正常运行状态电源指示"
			return question
		case 164:
			question.question = "PLC程序中的END指令的用途是："
			question.rightAnswer = "指令扫描到端点，将进行新扫描"
			question.wrongAnswer = "程序结束，停止运行"
			return question
		case 165:
			question.question = "PLC的程序编写有哪种图形方法？"
			question.rightAnswer = "梯形图和流程图"
			question.wrongAnswer = "图形符号逻辑"
			return question
		case 166:
			question.question = "PLC的基本系统由CPU模块、存储器模块、电源模块和输入输出模块组成。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 167:
			question.question = "PLC的计数器是："
			question.rightAnswer = "软件实现的计数单元"
			question.wrongAnswer = "一种定时时钟继电器"
			return question
		case 168:
			question.question = "PLC的清零程序是："
			question.rightAnswer = "ZRST S20 S30"
			question.wrongAnswer = "RST T20 T20"
			return question
		case 169:
			question.question = "PLC 的输入继电器是："
			question.rightAnswer = "从输入端口到内部的线路"
			question.wrongAnswer = "实际的输入继电器"
			return question
		case 170:
			question.question = "PLC的特殊辅助继电器指的是："
			question.rightAnswer = "有特定功能的内部继电器"
			question.wrongAnswer = "断电保护继电器"
			return question
		case 171:
			question.question = "输出是无触点输出，用于控制交流负载的是PLC的："
			question.rightAnswer = "双向晶闸管"
			question.wrongAnswer = "单结晶体管"
			return question
		case 172:
			question.question = "输出是有触点输出，既可控制交流负载又可控制支流负载的是："
			question.rightAnswer = "继电器"
			question.wrongAnswer = "晶闸管"
			return question
		case 173:
			question.question = "PLC机的扫描周期与程序的步数、时钟频率及所用指令的执行时间有关。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 174:
			question.question = "PLC机可编程序控制器输出方式为："
			question.rightAnswer = "R、T、S"
			question.wrongAnswer = "M、S、R"
			return question
		case 175:
			question.question = "PLC机输出类型有继电器、晶体管、双向晶闸管三种输出形式。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 176:
			question.question = "在PLC中能做到用一个按纽就可以控制负载的启动和停止功能的指令是："
			question.rightAnswer = "ATL"
			question.wrongAnswer = "ZRST"
			return question
		case 177:
			question.question = "在梯形图中同一编号的什么在一个程序段中不能重复使用？"
			question.rightAnswer = "输出线圈"
			question.wrongAnswer = "输入继电器"
			return question
		case 178:
			question.question = "在同一段程序内，不能使用相同的暂存寄存器存储不相同的变量。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 179:
			question.question = "在现场观察PLC的内部数据变化而不影响程序的运行可采用："
			question.rightAnswer = "监控运行状态"
			question.wrongAnswer = "编程状态"
			return question
		case 180:
			question.question = "在市场经济条件下，职业道德具有什么社会功能？"
			question.rightAnswer = "促进人们的行为规范化"
			question.wrongAnswer = "遏制牟利最大化"
			return question
		case 181:
			question.question = "为了促进企业的规范化发展，需要发挥企业文化的什么功能？"
			question.rightAnswer = "自律"
			question.wrongAnswer = "决策"
			return question
		case 182:
			question.question = "下列选项中属于职业道德作用的是："
			question.rightAnswer = "增强企业的凝聚力"
			question.wrongAnswer = "决定企业的经济效益"
			return question
		case 183:
			question.question = "要做到办事公道,在处理公私关系时，要："
			question.rightAnswer = "公平公正"
			question.wrongAnswer = "公私不分"
			return question
		case 184:
			question.question = "I/O接口芯片8255A有几个可编程(选择其工作方式的)通道？"
			question.rightAnswer = "3个"
			question.wrongAnswer = "2个"
			return question
		case 185:
			question.question = "逆变桥由晶闸管VT7～VT10组成.每个晶闸管均串有空心电感以限制晶闸管导通时的："
			question.rightAnswer = "电流上升率"
			question.wrongAnswer = "电流变化"
			return question
		case 186:
			question.question = "液压传动的调压回路中起主要调压作用的液压元件是："
			question.rightAnswer = "溢流泵"
			question.wrongAnswer = "换向阀"
			return question
		case 187:
			question.question = "电压型逆变器是用电容器来："
			question.rightAnswer = "缓冲无功能量"
			question.wrongAnswer = "缓冲有功能量"
			return question
		case 188:
			question.question = "逆变器根据对无功能量的处理方法不同，分为："
			question.rightAnswer = "电压型和电流型"
			question.wrongAnswer = "电压型和电阻型"
			return question
		case 189:
			question.question = "单相半桥逆变器（电压型）的输出电压为："
			question.rightAnswer = "矩形波"
			question.wrongAnswer = "正弦波"
			return question
		case 190:
			question.question = "单相半桥逆变器（电压型）的每个导电臂由一个电力晶体管和一个二极管："
			question.rightAnswer = "反并联组成"
			question.wrongAnswer = "并联组成"
			return question
		case 191:
			question.question = "在梯形图编程中，常闭触头与母线连接指令的助记符应为："
			question.rightAnswer = "LDI"
			question.wrongAnswer = "OR"
			return question
		case 192:
			question.question = "输入采样阶段是PLC的中央处理器对各输入端进行扫描，将输入端信号送入："
			question.rightAnswer = "状态寄存器"
			question.wrongAnswer = "累加器"
			return question
		case 193:
			question.question = "PLC可编程序控制整个工作过程分五个阶段，当PLC通电运行时，第一个阶段应为："
			question.rightAnswer = "自诊断"
			question.wrongAnswer = "与编程器通讯"
			return question
		case 194:
			question.question = "不属于微机在工业生产中应用的是："
			question.rightAnswer = "自动售票"
			question.wrongAnswer = "智能仪表"
			return question
		case 195:
			question.question = "将二进制数010101011011转换为十进制数是："
			question.rightAnswer = "1361 "
			question.wrongAnswer = "3161"
			return question
		case 196:
			question.question = "微机中的中央处理器包括控制器和："
			question.rightAnswer = "运算器"
			question.wrongAnswer = "存储器"
			return question
		case 197:
			question.question = "微机的核心是："
			question.rightAnswer = "CPU"
			question.wrongAnswer = "总线"
			return question
		case 198:
			question.question = "计算机发展的方向是巨型化、微型化、网络化、智能化，其中“巨型化”是指功能更强、运算速度更快、存储量更大。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 199:
			question.question = "用晶体管作为电子器件制作的计算机属于："
			question.rightAnswer = "第二代"
			question.wrongAnswer = "第一代"
			return question
		case 200:
			question.question = "为了保证PLC交流电梯安全运行，什么电器元件必须采用常闭触点，输入到PLC的输入接口？"
			question.rightAnswer = "终端限位行程开关"
			question.wrongAnswer = "停止按钮"
			return question
		case 201:
			question.question = "PLC交流双速电梯，目前层楼指示器普遍采用："
			question.rightAnswer = "七段数码管"
			question.wrongAnswer = "发光二极管"
			return question
		case 202:
			question.question = "直流电梯轿厢的平层调整准确度应满足："
			question.rightAnswer = "±15"
			question.wrongAnswer = "±30"
			return question
		case 203:
			question.question = "自动生产流水线电气部分，由顺序控制器装置、执行器、被控对象和检测元件组成，其中核心部分是："
			question.rightAnswer = "顺序控制器"
			question.wrongAnswer = "执行器"
			return question
		case 204:
			question.question = "自动生产线系统的输入信号一般采用："
			question.rightAnswer = "开关量信号"
			question.wrongAnswer = "模拟量信号"
			return question
		case 205:
			question.question = "计算机在电力传动的自动控制，一般分为："
			question.rightAnswer = "生产管理级和过程控制级"
			question.wrongAnswer = "管理级和监控级"
			return question
		case 206:
			question.question = "在自动化综合控制系统中包括哪两方面？"
			question.rightAnswer = "顺序控制和反馈控制"
			question.wrongAnswer = "顺序控制和数字控制"
			return question
		case 207:
			question.question = "下列属于轮廓控制型数控机床的是："
			question.rightAnswer = "加工中心"
			question.wrongAnswer = "数控钻床"
			return question
		case 208:
			question.question = "现代数控机床的数控系统由机床控制程序、数控装置、可编程控制器、主轴控制系统及进给控制系统等组成，其核心部分是："
			question.rightAnswer = "数控装置"
			question.wrongAnswer = "主轴控制系统"
			return question
		case 209:
			question.question = "CNC数控机床中的可编程控制器得到控制指令后，可以去控制机床："
			question.rightAnswer = "刀具库换刀，油泵升起"
			question.wrongAnswer = "刀具的进给"
			return question
		case 210:
			question.question = "感应同步器在安装时必须保持两尺平行，两平面间的间隙约为："
			question.rightAnswer = "0.25mm"
			question.wrongAnswer = "0.5mm"
			return question
		case 211:
			question.question = "磁尺主要参数有动态范围、精度、分辨率，其中动态范围为："
			question.rightAnswer = "1～20m"
			question.wrongAnswer = "1～10m"
			return question
		case 212:
			question.question = "感应同步器主要技术参数有动态范围、精度、分辩率，其中动态范围为："
			question.rightAnswer = "0.2～40m"
			question.wrongAnswer = "2～20m"
			return question
		case 213:
			question.question = "光栅透射直线式是一种用光电元件把两块光栅移动时产生的明暗变化转变为什么变化进行的测量方式？"
			question.rightAnswer = "电压"
			question.wrongAnswer = "电流"
			return question
		case 214:
			question.question = "在标尺光栅移动过程中（透射直线式），光电元件接收到的光通量忽强忽弱，于是产生了近似什么的电流？"
			question.rightAnswer = "正弦波"
			question.wrongAnswer = "方波"
			return question
		case 215:
			question.question = "带有速度、电流双闭环调速系统，在启动时速度调节器处于："
			question.rightAnswer = "饱和状态"
			question.wrongAnswer = "截止截止"
			return question
		case 216:
			question.question = "无静差调速系统，比例调节器的输出电压与："
			question.rightAnswer = "输入电压成正比"
			question.wrongAnswer = "输入电压成反比"
			return question
		case 217:
			question.question = "电流截止负反馈的截止方法不仅可以用电压比较方法，而且可以在反馈回路中对接一个什么元件来实现？"
			question.rightAnswer = "稳压管"
			question.wrongAnswer = "三极管"
			return question
		case 218:
			question.question = "带有电流截止负反馈环节的调速系统，为了使电流截止负反馈参与调节后机械特性曲线下垂更陡一些，应把反馈取样电阻阻值选得："
			question.rightAnswer = "大一些"
			question.wrongAnswer = "小一些"
			return question
		case 219:
			question.question = "在负载增加时，电流正反馈引起的转速补偿其实是转速："
			question.rightAnswer = "上升"
			question.wrongAnswer = "下降"
			return question
		case 220:
			question.question = "电压负反馈自动调速系统，一般调速范围D应为："
			question.rightAnswer = "D<10"
			question.wrongAnswer = "10<D<20"
			return question
		case 221:
			question.question = "电压负反馈调速系统是通过稳定直流电动机电枢电压来达到稳定转速的目的，其原理是电枢电压的变化与："
			question.rightAnswer = "转速的变化成正比"
			question.wrongAnswer = "转速的变化成反比"
			return question
		case 222:
			question.question = "在转速互反馈系统中，闭环系统的转速降为开环系统转速降的："
			question.rightAnswer = "1/(1+K)倍"
			question.wrongAnswer = "1+K倍"
			return question
		case 223:
			question.question = "开环自动控制系统在出现偏差时，系统将："
			question.rightAnswer = "不能消除偏差"
			question.wrongAnswer = "完全能消除偏差"
			return question
		case 224:
			question.question = "调速系统的调速范围和静差率这两个指标："
			question.rightAnswer = "相互制约"
			question.wrongAnswer = "相互补充"
			return question
		case 225:
			question.question = "直流电动机用斩波器调速时，可实现："
			question.rightAnswer = "无级调速"
			question.wrongAnswer = "恒定转速"
			return question
		case 226:
			question.question = "变频调速中的变频电源是什么与什么之间的接口？"
			question.rightAnswer = "市电电源与交流电机"
			question.wrongAnswer = "市电电源与交流电源"
			return question
		case 227:
			question.question = "在实现恒转矩调速时，调频的同时："
			question.rightAnswer = "必须调整电压"
			question.wrongAnswer = "必须调整电流"
			return question
		case 228:
			question.question = "无换向器电动机基本电路中，当电动机工作在再生制动状态时，逆变电路部分工作在："
			question.rightAnswer = "整流状态"
			question.wrongAnswer = "斩波状态"
			return question
		case 229:
			question.question = "无换向器电动机的逆变电路直流侧："
			question.rightAnswer = "串有大电感"
			question.wrongAnswer = "并有大电容"
			return question
		case 230:
			question.question = "三相并励换向器电动机调速适用于："
			question.rightAnswer = "恒转矩负载"
			question.wrongAnswer = "恒功率负载"
			return question
		case 231:
			question.question = "线绕式异步电动机采用串级调速与转子回路串电阻调速相比："
			question.rightAnswer = "机械特性较硬"
			question.wrongAnswer = "机械特性较软"
			return question
		case 232:
			question.question = "线绕式异步电动机串级调速的特点是："
			question.rightAnswer = "可在一定范围内调速"
			question.wrongAnswer = "功率损耗大"
			return question
		case 233:
			question.question = "直流电动机调速所用的斩波器主要起："
			question.rightAnswer = "调电压作用"
			question.wrongAnswer = "调电阻作用"
			return question
		case 234:
			question.question = "直流电动机的转速公式为："
			question.rightAnswer = "n=(U-IaRa) /CeΦ"
			question.wrongAnswer = "n=(U+IaR2) /CeΦ"
			return question
		case 235:
			question.question = "变频调速所用的VVVF型变频器，具有："
			question.rightAnswer = "调压与调频功能"
			question.wrongAnswer = "调功率功能"
			return question
		case 236:
			question.question = "用独立的变频电路给同步电动机供电的称为："
			question.rightAnswer = "他控变频"
			question.wrongAnswer = "辅控变频"
			return question
		case 237:
			question.question = "无换向器电动机是由转子位置检测器来检测磁极位置以控制什么电路，从而实现自控变频？"
			question.rightAnswer = "变频"
			question.wrongAnswer = "限幅"
			return question
		default:
			break
		}

		return nil
	}
}