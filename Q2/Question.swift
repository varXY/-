//
//  Question.swift
//  Questions
//
//  Created by 文川术 on 15/9/3.
//  Copyright (c) 2015年 xiaoyao. All rights reserved.
//

import Foundation

class Question {

	var question: String = ""
	var rightAnswer: String = ""
	var wrongAnswer: String = ""

	func getQestions(numberOfQuestions: Int) -> [Question] {
		var questionMarks = [Int]()
		var questions = [Question]()

		questionMarks = getRandomNumbers(numberOfQuestions, uiform: 301)

		for i in questionMarks {
			questions.append(getQuestion(i)!)
		}

		return questions
	}

	func getRandomNumbers(amount: Int, uiform: UInt32) -> [Int] {
		var result = [Int]()

		repeat {
			let number = Int(arc4random_uniform(uiform))
			if let sameAtIndex = result.indexOf(number) {
				result.removeAtIndex(sameAtIndex)
			}
			result.append(number)
		} while result.count < amount

		return result
	}

	func getQuestion(number: Int) -> Question? {
		let question = Question()

		switch number {
		case 0:
			question.question = "电气隔离变压器二次侧的导线长度多少合适？"
			question.rightAnswer = "不宜太长"
			question.wrongAnswer = "越长越好"
			return question
		case 1:
			question.question = "电工至少多长时间对漏电保护器用试验按钮试验一次？"
			question.rightAnswer = "每月"
			question.wrongAnswer = "每季度"
			return question
		case 2:
			question.question = "独立避雷针的接地体与其他邻近接地体之间的最小距离为："
			question.rightAnswer = "3m"
			question.wrongAnswer = "1.5m"
			return question
		case 3:
			question.question = "成套开关柜使用的漏电保护器，其动作电流应取："
			question.rightAnswer = "100mA"
			question.wrongAnswer = "150mA"
			return question
		case 4:
			question.question = "漏电保护装置的额定不动作电流不得低于额定动作电流的多少倍？"
			question.rightAnswer = "0.5倍"
			question.wrongAnswer = "0.35倍"
			return question
		case 5:
			question.question = "家用电器回路使用的漏电保护器，其动作电流应取："
			question.rightAnswer = "30mA"
			question.wrongAnswer = "50mA"
			return question
		case 5:
			question.question = "高灵敏度电流型漏电保护装置是指额定漏电动作电流多大及以下的漏电保护装置？"
			question.rightAnswer = "30mA"
			question.wrongAnswer = "60mA"
			return question
		case 6:
			question.question = "为防止电气火灾使用的漏电保护器，其动作电流应取："
			question.rightAnswer = "300mA"
			question.wrongAnswer = "500mA"
			return question
		case 7:
			question.question = "用于防止漏电火灾的漏电报警装置的动作电流约为："
			question.rightAnswer = "200-300mA"
			question.wrongAnswer = "300-400mA"
			return question
		case 8:
			question.question = "装设在烟囱顶端的用圆钢制作的避雷针，圆钢直径不得小于："
			question.rightAnswer = "20mm"
			question.wrongAnswer = "15mm"
			return question
		case 9:
			question.question = "电气隔离安全的实质是："
			question.rightAnswer = "将接地电网转换成不接地电网"
			question.wrongAnswer = "将不接地电网转换成接地电网"
			return question
		case 10:
			question.question = "单相安全隔离变压器的额定容量不应超过："
			question.rightAnswer = "10kVA"
			question.wrongAnswer = "15kVA"
			return question
		case 11:
			question.question = "FS 系列阀型避雷器主要由什么组成？"
			question.rightAnswer = "瓷套、火花间隙、非线性电阻"
			question.wrongAnswer = "瓷套、火花间隙、线性电阻"
			return question
		case 12:
			question.question = "上级漏电保护器的额定漏电流应比下级漏电保护器的额定漏电流大还是小？"
			question.rightAnswer = "大"
			question.wrongAnswer = "小"
			return question
		case 13:
			question.question = "《安全生产法》规定，生产经营单位应当在较大危险因素的生产经营场所和有关设施、设备上，设置明显的："
			question.rightAnswer = "安全警示标志"
			question.wrongAnswer = "正在施工标志"
			return question
		case 14:
			question.question = "安全隔离变压器输入回路与输出回路之间的绝缘电阻不应低于："
			question.rightAnswer = "5MΩ"
			question.wrongAnswer = "3MΩ"
			return question
		case 15:
			question.question = "标准上规定防雷装置的接地电阻一般指什么电阻？"
			question.rightAnswer = "冲击接地电阻"
			question.wrongAnswer = "工频接地电阻"
			return question
		case 16:
			question.question = "电流型漏电保护装置采用什么作为检测元件？"
			question.rightAnswer = "零序电流互感器"
			question.wrongAnswer = "零序电压互感器"
			return question
		case 17:
			question.question = "验电前，宜先在有电设备上进行试验，确认验电器良好；无法在有电设备上进行试验时，可用高压发生器等确证验电器良好。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 18:
			question.question = "电工作业人员包括从事电气装置运行、检修和试验工作的人员，不包括电气安装和装修人员。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 19:
			question.question = "送电操作前应除去或拆除为检修装设的临时安全措施和临时接地线。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 20:
			question.question = "接地体离建筑物墙基之间的地下距离不得小于1.5m。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 21:
			question.question = " PE线不得穿过漏电保护器，但PEN线可以穿过漏电保护器。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 22:
			question.question = "雷雨天气户外巡视应远离接地装置，并应穿绝缘靴。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 23:
			question.question = "宾馆客房内的插座应装设漏电保护装置。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 24:
			question.question = "爆炸危险场所的工作零线应当与保护零线合用。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 25:
			question.question = "在发生人身触电事故时，可以不经许可，即行断开有关设备的电源，但事后应立即报告调度(或设备运行管理单位)和上级部门。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 26:
			question.question = "送电操作应当先合上负荷侧隔离开关，后合上电源侧隔离开关，最后合上断路器。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 27:
			question.question = "工作零线必须经过漏电保护器，保护零线不得经过漏电保护器。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 28:
			question.question = "电气设备的重复接地装置可以与独立避雷针的接地装置连接起来。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 29:
			question.question = "送电操作后应检查电压、负荷是否正常。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 30:
			question.question = "照明及其他单相用电负载要均匀分布在三相电源线上。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 31:
			question.question = "油料火灾可用水灭火。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 32:
			question.question = "扑灭电器设备火灾时，首先要切断电源，在切断电源后，可以使用水进行灭火。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 33:
			question.question = "蓄电池可能有氢气排出，应有良好的通风。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 34:
			question.question = "泡沫灭火机不能用于带电灭火。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 35:
			question.question = "停电操作应当先断开断路器，后断开负荷侧隔离开关，最后断开电源侧隔离开关。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 36:
			question.question = "下面用来保护电力设备的是："
			question.rightAnswer = "避雷器"
			question.wrongAnswer = "避雷线"
			return question
		case 37:
			question.question = "运行状态是断路器和隔离开关都处在合闸位置的状态。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 38:
			question.question = "工作零线和保护零线都应当穿过漏电保护器。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 39:
			question.question = "接地体上端离地面深度不应小于："
			question.rightAnswer = "0.6m"
			question.wrongAnswer = "0.5m"
			return question
		case 40:
			question.question = "阀型避雷器是由火花间隙和什么组成？"
			question.rightAnswer = "阀电阻片"
			question.wrongAnswer = "绝缘电阻"
			return question
		case 41:
			question.question = "多少米以上的高楼要有防雷设施？"
			question.rightAnswer = "45m"
			question.wrongAnswer = "60m"
			return question
		case 42:
			question.question = "三相电A、B、C的颜色表示分别是："
			question.rightAnswer = "黄、绿、红"
			question.wrongAnswer = "红、绿、黄"
			return question
		case 43:
			question.question = "火线、零线、接地线的符号表示分别为："
			question.rightAnswer = "L、N、PE"
			question.wrongAnswer = "PE、N、L"
			return question
		case 44:
			question.question = "中国使用的正弦交流电的频率是多少？"
			question.rightAnswer = "50Hz"
			question.wrongAnswer = "60Hz"
			return question
		case 45:
			question.question = "钳形电流表上读出的交流电流值是电流的："
			question.rightAnswer = "有效值"
			question.wrongAnswer = "平均值"
			return question
		case 46:
			question.question = "低压配电柜背面通道宽度不应低于："
			question.rightAnswer = "1.0m"
			question.wrongAnswer = "0.8m"
			return question
		case 47:
			question.question = "高压设备在不带电的情况下，是否允许电气工作人员单独移开或越过遮拦进行工作？"
			question.rightAnswer = "不允许"
			question.wrongAnswer = "允许"
			return question
		case 48:
			question.question = "“220V、40W”的电灯L1接到220V电路上，“36V、40W”的电灯接到36V电路上，则："
			question.rightAnswer = "一样亮"
			question.wrongAnswer = "L1较亮"
			return question
		case 49:
			question.question = "测量绝缘电阻的仪表是："
			question.rightAnswer = "摇表"
			question.wrongAnswer = "万用表"
			return question
		case 50:
			question.question = "导线的允许载流量应该大于导线的最大工作电流。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 51:
			question.question = "低压设备停电检修时，将检修设备各方面电源断开后，应立即："
			question.rightAnswer = "取下熔断器"
			question.wrongAnswer = "装设接地线"
			return question
		case 52:
			question.question = "测量低压电缆及二次电缆的绝缘电阻时应使用多大的摇表？"
			question.rightAnswer = "500V"
			question.wrongAnswer = "1000V"
			return question
		case 53:
			question.question = "母线的颜色有统一规定，其中W相线的颜色规定为？"
			question.rightAnswer = "红色 "
			question.wrongAnswer = "黄色"
			return question
		case 54:
			question.question = "在不接地的电压电网的绝缘监视中，当3只电压表读数均为相电压时，则表示电网："
			question.rightAnswer = "对地绝缘正常"
			question.wrongAnswer = "某相绝缘恶化"
			return question
		case 55:
			question.question = "在什么线上严禁通过工作电流，且严禁断线？"
			question.rightAnswer = "PE线"
			question.wrongAnswer = "N线"
			return question
		case 56:
			question.question = "当负荷电流达到熔断器熔体的额定电流时，熔体将："
			question.rightAnswer = "不会熔断"
			question.wrongAnswer = "立即熔断"
			return question
		case 57:
			question.question = "三相对称负载采用三角形接法接到线电压为380V的三相电源上，已知负载电流为10A，则火线中的电流为多少？"
			question.rightAnswer = "17.32A"
			question.wrongAnswer = "10A"
			return question
		case 58:
			question.question = "用三只电压表来监视中性点不接地电网的绝缘，当发生单相接地时，接地相电压表读数将会？"
			question.rightAnswer = "急剧降低"
			question.wrongAnswer = "显著升高"
			return question
		case 59:
			question.question = "安装单相三孔插座，零线孔在："
			question.rightAnswer = "左"
			question.wrongAnswer = "右"
			return question
		case 60:
			question.question = "电容器组不允许装设："
			question.rightAnswer = "自动复合闸装置"
			question.wrongAnswer = "熔断器"
			return question
		case 61:
			question.question = "母线的着色有统一规定，其中不接地中性线的颜色规定为："
			question.rightAnswer = "紫色"
			question.wrongAnswer = "蓝色"
			return question
		case 62:
			question.question = "在有爆炸性危险场所，配线方式应采用什么配线？"
			question.rightAnswer = "钢管"
			question.wrongAnswer = "塑料管"
			return question
		case 63:
			question.question = "碘钨灯等高热灯具与易燃物距离不宜小于："
			question.rightAnswer = "1000mm"
			question.wrongAnswer = "800mm"
			return question
		case 64:
			question.question = "电流互感器的二次侧回路采用铜芯绝缘导线，其截面应不小于多少平方毫米？"
			question.rightAnswer = "2.5"
			question.wrongAnswer = "1.5"
			return question
		case 65:
			question.question = "在施工地点，临近戴电设备的遮栏上应悬挂什么标示牌？"
			question.rightAnswer = "止步，高压危险"
			question.wrongAnswer = "请勿合闸"
			return question
		case 66:
			question.question = "当线路或设备的负荷超过允许范围时，经延时后切断电源的保护方式是什么？"
			question.rightAnswer = "过载保护"
			question.wrongAnswer = "缺相保护"
			return question
		case 67:
			question.question = "装拆接地线应由几人进行？"
			question.rightAnswer = "2人"
			question.wrongAnswer = "1人"
			return question
		case 68:
			question.question = "按规程规定220V线路允许的电压损失是："
			question.rightAnswer = "11V"
			question.wrongAnswer = "22V"
			return question
		case 69:
			question.question = "三相四线制电路中采用漏电保护时，应穿过零序电流互感器的是："
			question.rightAnswer = "相线和零线"
			question.wrongAnswer = "相线"
			return question
		case 70:
			question.question = "低压脱扣器的瞬动脱扣器在线路上是作为什么保护使用？"
			question.rightAnswer = "短路保护"
			question.wrongAnswer = "过载保护"
			return question
		case 71:
			question.question = "照明线路常见的故障是："
			question.rightAnswer = "漏电"
			question.wrongAnswer = "电压过高"
			return question
		case 72:
			question.question = "属于安全电压等级的是："
			question.rightAnswer = "36V"
			question.wrongAnswer = "50V"
			return question
		case 73:
			question.question = "与金属导体的电阻有关的因素是："
			question.rightAnswer = "导体长度"
			question.wrongAnswer = "所加电压大小"
			return question
		case 74:
			question.question = "电气线路从安全角度考虑对它的要求有："
			question.rightAnswer = "导电能力"
			question.wrongAnswer = "横截面大小"
			return question
		case 75:
			question.question = "电容器运行时发生什么情况必须立刻停止使用？"
			question.rightAnswer = "外壳膨胀"
			question.wrongAnswer = "三相电流出现不平衡"
			return question
		case 76:
			question.question = "在纯电阻正弦交流电路中："
			question.rightAnswer = "消耗有功功率"
			question.wrongAnswer = "消耗无功功率"
			return question
		case 77:
			question.question = "室内配线导线截面的选择主要依据是："
			question.rightAnswer = "导线的安全电流值"
			question.wrongAnswer = "导线的绝缘程度"
			return question
		case 78:
			question.question = "重复接地的主要作用是减轻零线断线时造成的触电危险？"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 79:
			question.question = "避雷器可以预防高大建筑物免遭雷击？"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 80:
			question.question = "供电企业低压供电的额定电压：单相为220V三相为380V？"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 81:
			question.question = "由三个频率相同、电势振幅相等、相位差互差 120°角的交流电路组成的电力系统，叫三相交流电。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 82:
			question.question = "两只额定电压相同的电阻，串联接在电路中，则阻值较大的电阻会："
			question.rightAnswer = "发热量较大"
			question.wrongAnswer = "发热量较小"
			return question
		case 83:
			question.question = "万用表的开关是用来："
			question.rightAnswer = "转换测量种类及量程"
			question.wrongAnswer = "接通电流"
			return question
		case 84:
			question.question = "绝缘手套测验周期为："
			question.rightAnswer = "六个月一次"
			question.wrongAnswer = "每年一次"
			return question
		case 85:
			question.question = "绝缘靴的试验周期是："
			question.rightAnswer = "六个月一次"
			question.wrongAnswer = "每年一次"
			return question
		case 86:
			question.question = "在值班期间需要移开或越过遮栏时："
			question.rightAnswer = "必须有监护人在场"
			question.wrongAnswer = "必须有领导在场"
			return question
		case 87:
			question.question = "接地中线相色漆规定涂为："
			question.rightAnswer = "黑"
			question.wrongAnswer = "紫"
			return question
		case 88:
			question.question = "变电站（所）设备接头和线夹的最高允许温度为："
			question.rightAnswer = "85 ℃"
			question.wrongAnswer = "95 ℃"
			return question
		case 89:
			question.question = "电力变压器的油起什么作用？"
			question.rightAnswer = "绝缘和灭弧 "
			question.wrongAnswer = "绝缘和散热"
			return question
		case 90:
			question.question = "带电设备着火时不得使用："
			question.rightAnswer = "泡沫灭火器"
			question.wrongAnswer = "二氧化碳灭火器"
			return question
		case 91:
			question.question = "倒闸操作票至少要保存多长时间？"
			question.rightAnswer = "3个月"
			question.wrongAnswer = "1个月"
			return question
		case 92:
			question.question = "各断路器的配合中，电路上一级的熔断时间应为下一级熔断器的几倍以上？"
			question.rightAnswer = "3倍"
			question.wrongAnswer = "2倍"
			return question
		case 93:
			question.question = "凡接到任何违反电器安全工作规程制度的命令时应："
			question.rightAnswer = "拒绝执行"
			question.wrongAnswer = "部分执行"
			return question
		case 94:
			question.question = "指针万用表的优劣，主要看？"
			question.rightAnswer = "灵敏度高低"
			question.wrongAnswer = "量程大小"
			return question
		case 95:
			question.question = "交流电机在空载运行时，功率因素很"
			question.rightAnswer = "低"
			question.wrongAnswer = "高"
			return question
		case 96:
			question.question = "变压器铁心应接地，但只允许有一点接地。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 97:
			question.question = "通过人体的安全直流电流在多少以下？"
			question.rightAnswer = "50mA"
			question.wrongAnswer = "60mA"
			return question
		case 98:
			question.question = "将一根导线均匀拉长为原长度的3倍，则阻值为原来的几倍？"
			question.rightAnswer = "9倍"
			question.wrongAnswer = "3倍"
			return question
		case 99:
			question.question = "阻值不随外加电压或电流的大小而改变的电阻叫："
			question.rightAnswer = "线性电阻 "
			question.wrongAnswer = "固定电阻"
			return question
		case 100:
			question.question = "阻值随外加电压或电流的大小而改变的电阻叫："
			question.rightAnswer = "非线性电阻"
			question.wrongAnswer = "可变电阻"
			return question
		case 101:
			question.question = "额定电压为220V的灯泡接在110V电源上，灯泡的功率是原来的："
			question.rightAnswer = "1/4"
			question.wrongAnswer = "1/2"
			return question
		case 102:
			question.question = "电路主要由负载、线路、电源和什么组成？"
			question.rightAnswer = "开关"
			question.wrongAnswer = "仪表"
			return question
		case 103:
			question.question = "交流电的三要素是指最大值、频率和什么？"
			question.rightAnswer = "初相角"
			question.wrongAnswer = "相位"
			return question
		case 104:
			question.question = "两根平行导线通过同向电流时，导体之间相互："
			question.rightAnswer = "吸引"
			question.wrongAnswer = "排斥"
			return question
		case 105:
			question.question = "集肤效应指：在导体中的电流，越接近于导体表面，其什么越大？"
			question.rightAnswer = "电流"
			question.wrongAnswer = "电压"
			return question
		case 106:
			question.question = "在三相四线制中，当三相负载不平衡时，三相电压会相等，中性线电流："
			question.rightAnswer = "不等于零"
			question.wrongAnswer = "等于零"
			return question
		case 107:
			question.question = "串联电路中，电压的分配与电阻成："
			question.rightAnswer = "正比"
			question.wrongAnswer = "反比"
			return question
		case 108:
			question.question = "并联电路中，电流的分配与电阻成："
			question.rightAnswer = "反比"
			question.wrongAnswer = "正比"
			return question
		case 109:
			question.question = "在纯电感电路中，没有能量消耗，只有能量："
			question.rightAnswer = "交换"
			question.wrongAnswer = "增强"
			return question
		case 110:
			question.question = "电压互感器的一次绕组的匝数远大于二次绕组的匝数。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 111:
			question.question = "二极管的主要特性是？"
			question.rightAnswer = "单向导通"
			question.wrongAnswer = "整流"
			return question
		case 112:
			question.question = "建筑电气图上的总平面图要精确到："
			question.rightAnswer = "厘米"
			question.wrongAnswer = "分米"
			return question
		case 113:
			question.question = "建筑电气安装图一般用什么表示？"
			question.rightAnswer = "平面图"
			question.wrongAnswer = "立体图"
			return question
		case 114:
			question.question = "并列运行的变压器其容量之比一般不超过："
			question.rightAnswer = "3:1"
			question.wrongAnswer = "4:1"
			return question
		case 115:
			question.question = "为防止分接开关故障，应测量分接开关接头阻值，其相差不超过："
			question.rightAnswer = "2%"
			question.wrongAnswer = "1.5%"
			return question
		case 116:
			question.question = "油浸变压器在正常情况下为使绝缘油不致过速氧化，上层油温不宜超过多少度？"
			question.rightAnswer = "85"
			question.wrongAnswer = "95"
			return question
		case 117:
			question.question = "变压器绝缘自投入运行后，在允许条件下运行，其寿命可达多少年？"
			question.rightAnswer = "20 ~ 25"
			question.wrongAnswer = "15 ~ 20"
			return question
		case 118:
			question.question = "变压器在同等负荷及同等冷却条件下，油温比平时高多少度，应判断变压器发生内部故障。"
			question.rightAnswer = "10"
			question.wrongAnswer = "15"
			return question
		case 119:
			question.question = "电力变压器中短路电压一般为额定电压的："
			question.rightAnswer = "5% ~ 10%"
			question.wrongAnswer = "15% ~ 20%"
			return question
		case 120:
			question.question = "电力系统中以“kWh”作为什么的计量单位？"
			question.rightAnswer = "电能"
			question.wrongAnswer = "电功率"
			return question
		case 121:
			question.question = "一个实际电源的电压随着负载电流的减小将："
			question.rightAnswer = "升高"
			question.wrongAnswer = "降低"
			return question
		case 122:
			question.question = "我国交流电的频率为50Hz，其周期为多少秒？"
			question.rightAnswer = "0.02"
			question.wrongAnswer = "0.01"
			return question
		case 123:
			question.question = "参考点也叫零点位点它是由："
			question.rightAnswer = "人为规定"
			question.wrongAnswer = "参考方向决定"
			return question
		case 124:
			question.question = "线圈磁场方向的判断方法用："
			question.rightAnswer = "螺旋管右手定则"
			question.wrongAnswer = "直导线右手定则"
			return question
		case 125:
			question.question = "一电感线圈接到f=50Hz的交流电路中，感抗XL=50Ω，若改接到f=150Hz的电源时，则感抗XL为："
			question.rightAnswer = "150Ω"
			question.wrongAnswer = "250Ω"
			return question
		case 126:
			question.question = "三相电动势的相序为U-V-W称为："
			question.rightAnswer = "正序"
			question.wrongAnswer = "零序"
			return question
		case 127:
			question.question = "为示正相序，在变电所三相母线应分别涂以："
			question.rightAnswer = "黄、绿、红"
			question.wrongAnswer = "绿、黄 、红"
			return question
		case 128:
			question.question = "正序的顺序是："
			question.rightAnswer = "U、V、W"
			question.wrongAnswer = "W、V、U"
			return question
		case 129:
			question.question = "纯电阻单相正弦交流电路中的电压与电流，其瞬间时值遵循欧姆定律。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 130:
			question.question = "线圈右手螺旋定则是：四指表示电流方向，大拇指表示磁力线方向。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 131:
			question.question = "电位高低的含义，是指该点对参考点间的电流大小。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 132:
			question.question = "电动势的实际方向规定为从正极指向负极。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 133:
			question.question = "没有电压就没有电流，没有电流就没有电压。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 134:
			question.question = "视在功率就是有功功率加上无功功率。 "
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 135:
			question.question = "相线间的电压就是线电压。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 136:
			question.question = "纯电感线圈对直流电来说，相当于短路。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 137:
			question.question = "每相负载的端电压叫负载的相电压。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 138:
			question.question = "线电压额定是380V，相电压额定是220V。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 139:
			question.question = "三相电动势达到最大值的先后次序叫相序。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 140:
			question.question = "从中性点引出的导线叫中性线，当中性线直接接地时称为零线，又叫地线。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 141:
			question.question = "从各相首端引出的导线叫相线，俗称火线。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 142:
			question.question = "有中性线的三相供电方式叫三相四线制，它常用于低压配电系统。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 143:
			question.question = "不引出中性线的三相供电方式叫三相三线制，一般用于高压输电系统。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 144:
			question.question = "一个线圈电流变化而在另一个线圈产生电磁感应的现象叫："
			question.rightAnswer = "互感现象"
			question.wrongAnswer = "自感现象"
			return question
		case 145:
			question.question = "铁芯内部环流称为涡流，涡流所消耗的电功率，称为涡流损耗。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 146:
			question.question = "三相交流电的相位互差为多少度？"
			question.rightAnswer = "120"
			question.wrongAnswer = "90"
			return question
		case 147:
			question.question = "高压断路器具有相当完善的灭弧结构和足够的断流能力。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 148:
			question.question = "电流互感器，又称仪用变流器，作用是将大电流变成："
			question.rightAnswer = "小电流"
			question.wrongAnswer = "更大电流"
			return question
		case 149:
			question.question = "绝缘棒，又称令克棒、绝缘拉杆、操作杆等。绝缘棒由工作头、绝缘杆和握柄三部分构成。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 150:
			question.question = "发现有人触电时，应当先打120请医生，等医生到达后立即开始人工急救。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 151:
			question.question = "电工作业人员必须年满多少岁？"
			question.rightAnswer = "18"
			question.wrongAnswer = "17"
			return question
		case 152:
			question.question = "我国标准规定工频安全电压有效值的限值为："
			question.rightAnswer = "50V"
			question.wrongAnswer = "36V"
			return question
		case 153:
			question.question = "装设接地线的顺序为："
			question.rightAnswer = "先接地端后导体端 "
			question.wrongAnswer = "先导体端后接地端"
			return question
		case 154:
			question.question = " 一般居民住宅、办公场所，若以防止触电为主要目的时，应选用漏电动作电流为多大的漏电保护开关？"
			question.rightAnswer = "30mA"
			question.wrongAnswer = "15mA"
			return question
		case 155:
			question.question = "《劳动法》特别强调从业人员的权利包括在集体合同、劳动合同中，都要载明劳动安全、防止职业危害和工伤社会保险等事项。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 156:
			question.question = "安全生产法规的出发点是以人为本，为了保护从业人员的安全和健康。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 157:
			question.question = "新参加电气工作的人员、实习人员和临时参加劳动的人员，工作能力强的，可以单独从事危险工作。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 158:
			question.question = "万用表的红表笔插在﹙＋﹚的插孔，黑笔插在﹙－﹚的插孔。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 159:
			question.question = "接地体上端离地面深度不应小于多少米？"
			question.rightAnswer = "0.6m"
			question.wrongAnswer = "0.5m"
			return question
		case 160:
			question.question = "《特种作业人员安全操作证》有效期为多少年？"
			question.rightAnswer = "六年"
			question.wrongAnswer = "三年"
			return question
		case 161:
			question.question = "《安全生产法》规定的安全生产方针："
			question.rightAnswer = "安全第一，预防为主"
			question.wrongAnswer = "防消结合，预防为主"
			return question
		case 162:
			question.question = "能清除皮肤上的油、尘、毒等沾污，使皮肤免受损害的皮肤防护用品称作："
			question.rightAnswer = "洁肤型护肤剂"
			question.wrongAnswer = "防油型护肤剂"
			return question
		case 163:
			question.question = "关于电气装置，不属于电工作业的工作是："
			question.rightAnswer = "购买"
			question.wrongAnswer = "安装"
			return question
		case 164:
			question.question = "1kΩ与2kΩ的电阻串联后接到6V的电压上，流过电的电流为："
			question.rightAnswer = "2mA"
			question.wrongAnswer = "2A"
			return question
		case 165:
			question.question = "就对被测电路的影响而言，电压表的内阻："
			question.rightAnswer = "越大越好"
			question.wrongAnswer = "适中为好"
			return question
		case 166:
			question.question = "下列最危险的电流途径是："
			question.rightAnswer = "左手至胸部"
			question.wrongAnswer = "左手至脚"
			return question
		case 167:
			question.question = "发生心室纤维性颤动时，血液循环实际上："
			question.rightAnswer = "终止"
			question.wrongAnswer = "加快"
			return question
		case 168:
			question.question = "漏电保护装置的试验按钮要多长时间按一次？"
			question.rightAnswer = "一个月"
			question.wrongAnswer = "三个月"
			return question
		case 169:
			question.question = "工艺过程中产生静电的主要危险是："
			question.rightAnswer = "引起爆炸和火灾"
			question.wrongAnswer = "妨碍生产"
			return question
		case 170:
			question.question = "避雷针的接地装置与道路出入口之间的距离不应小于："
			question.rightAnswer = "3m"
			question.wrongAnswer = "2m"
			return question
		case 171:
			question.question = "采用扁钢作防雷装置的引下线时，其截面积应不小于多少平方毫米？"
			question.rightAnswer = "100"
			question.wrongAnswer = "75"
			return question
		case 172:
			question.question = "低压电力电缆直埋时的最小深度为多少米？"
			question.rightAnswer = "0.7m"
			question.wrongAnswer = "0.6m"
			return question
		case 173:
			question.question = "水泥电杆横向裂纹长度不超过电杆周长的："
			question.rightAnswer = "1/3"
			question.wrongAnswer = "1/2"
			return question
		case 174:
			question.question = "电工是特殊工种。其特殊性表现之一为与他人安全相关。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 175:
			question.question = "兆欧表的电压等级有："
			question.rightAnswer = "500V"
			question.wrongAnswer = "220V"
			return question
		case 176:
			question.question = "工艺过程中产生的静电具有什么特征？"
			question.rightAnswer = "电压高"
			question.wrongAnswer = "电流大"
			return question
		case 177:
			question.question = "防止雷电冲击波侵入室内的方法是："
			question.rightAnswer = "架空线入户处安装避雷器"
			question.wrongAnswer = "建筑物上方安装避雷针"
			return question
		case 178:
			question.question = "特种作业人员进行作业前禁止喝含有酒精的饮料。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 179:
			question.question = "从业人员在生产过程中，发现有危及人身安全的紧急情况时，有权停止作业，但对事故隐患及不安全因素没有报告的义务。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 180:
			question.question = "口对口呼吸法的吹气次数大约在每分钟12～16次。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 181:
			question.question = "在生产过程中产生的粉尘称为生产性粉尘，对作业人员身体健康有害。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 182:
			question.question = "发现有人触电，应赶紧徒手拉其脱离电源。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 183:
			question.question = "值班人员应熟悉电气设备配置、性能和电气结线。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 184:
			question.question = "为了防止因导线短路而引起重大安全事故，不同回路、不同电压、交流与直流的导线不得穿在同一根管内。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 185:
			question.question = "架空地线的接地电阻愈小，屏蔽效果愈好。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 186:
			question.question = "从功能上讲，高压断路器可以用高压隔离开关、高压负荷开关代替。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 187:
			question.question = "能防御焊接作业的火花、熔融金属、高温金属、高温辐射等伤害足部，并能使足部与带电物体绝缘的鞋是："
			question.rightAnswer = "焊接防护鞋"
			question.wrongAnswer = "绝缘鞋 "
			return question
		case 188:
			question.question = "人体体内电阻大约为："
			question.rightAnswer = "数百欧"
			question.wrongAnswer = "数千欧"
			return question
		case 189:
			question.question = "触电致人死亡的决定因素是："
			question.rightAnswer = "电流"
			question.wrongAnswer = "电压"
			return question
		case 190:
			question.question = "漏电保护装置的额定不动作电流不得低于额定动作电流的："
			question.rightAnswer = "0.5"
			question.wrongAnswer = "0.75"
			return question
		case 191:
			question.question = "电弧温度最高可达多少度？"
			question.rightAnswer = "8000℃"
			question.wrongAnswer = "4000℃"
			return question
		case 192:
			question.question = "土壤电阻的季节系数："
			question.rightAnswer = "大于或等于1"
			question.wrongAnswer = "小于或等于1"
			return question
		case 193:
			question.question = "运行中的橡皮导线一般温度不得超过："
			question.rightAnswer = "65℃"
			question.wrongAnswer = "70℃"
			return question
		case 194:
			question.question = "当把通信电缆埋设在地面以下时，通信电缆不受强电线电干扰的影响。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 195:
			question.question = "用于高处作业的主要用具有："
			question.rightAnswer = "脚手架、梯子"
			question.wrongAnswer = "安全带、安全网"
			return question
		case 196:
			question.question = "走出可能产生跨步电压的区域应采用的正确方法是："
			question.rightAnswer = "单脚跳出"
			question.wrongAnswer = "大步跨出"
			return question
		case 197:
			question.question = "什么操作不需办理操作票？"
			question.rightAnswer = "事故处理"
			question.wrongAnswer = "全站停电"
			return question
		case 198:
			question.question = "当电力线与通信线交越时："
			question.rightAnswer = "必须停电后作业"
			question.wrongAnswer = "不必停电后作业"
			return question
		case 199:
			question.question = "从业人员只要了解其作业场所和工作岗位上的安全生产规章制度和操作规程即可上岗作业。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 200:
			question.question = "对摔伤者的救护应特别防止在搬动中可能对伤者脊柱的损害。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 201:
			question.question = "万用表的红表笔插在﹙＋﹚的插孔，黑笔插在﹙－﹚的插孔。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 202:
			question.question = "摆脱电流是人能自主摆脱带电体的最大电流，人的工频摆脱电流约为10A。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 203:
			question.question = "在直流电路中电流和电压的大小和方向都不随时间变化。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 204:
			question.question = "在正弦交流电压的波形图坐标系中，横坐标表示时间，纵坐标表示："
			question.rightAnswer = "电压瞬时值"
			question.wrongAnswer = "电压平均值"
			return question
		case 205:
			question.question = "铁心是变压器的磁通道，铁心多用彼此绝缘的硅钢片叠成目的是为了减小涡流和磁带。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 206:
			question.question = "在电磁感应现象中，感应电流的磁场的方向总是："
			question.rightAnswer = "与原磁场的方向相反"
			question.wrongAnswer = "阻碍原磁场的变化"
			return question
		case 207:
			question.question = "如果通电直导体在匀强磁场中受到的磁场力最大，则说明该导体与磁力线夹角为多少度？"
			question.rightAnswer = "90"
			question.wrongAnswer = "60"
			return question
		case 208:
			question.question = "三相对称的额定工作电压为380V，由我国供电系统供电，该三相负载应接成："
			question.rightAnswer = "Y形接法"
			question.wrongAnswer = "三角形接法"
			return question
		case 209:
			question.question = "旋转磁场的转速与："
			question.rightAnswer = "频率成正比"
			question.wrongAnswer = "电压电源成正比"
			return question
		case 210:
			question.question = "我国发电厂发出交流电的频率都是50Hz习惯上称为："
			question.rightAnswer = "工频"
			question.wrongAnswer = "频率"
			return question
		case 211:
			question.question = "角频率的单位是："
			question.rightAnswer = "radls"
			question.wrongAnswer = "Hz"
			return question
		case 212:
			question.question = "正弦交流电的三要素分别是振幅、频率和："
			question.rightAnswer = "初相"
			question.wrongAnswer = "电流"
			return question
		case 213:
			question.question = "变压器主要由铁心和什么组成？"
			question.rightAnswer = "绕组"
			question.wrongAnswer = "绝缘漆"
			return question
		case 214:
			question.question = "电感是储能元件，不消耗电能，其有功功率为："
			question.rightAnswer = "零"
			question.wrongAnswer = "不知"
			return question
		case 215:
			question.question = "周期和频率之间有什么关系？"
			question.rightAnswer = "倒数"
			question.wrongAnswer = "乘数"
			return question
		case 216:
			question.question = "视在功率用什么表示？"
			question.rightAnswer = "S"
			question.wrongAnswer = "P"
			return question
		case 217:
			question.question = "串联电路中，电压的分配与电阻成："
			question.rightAnswer = "正比"
			question.wrongAnswer = "反比"
			return question
		case 218:
			question.question = "并联电路中，电流的分配与电阻成："
			question.rightAnswer = "反比"
			question.wrongAnswer = "正比"
			return question
		case 219:
			question.question = "变压器运行中的电压不应超过额定电压的："
			question.rightAnswer = "±5% "
			question.wrongAnswer = "±10%"
			return question
		case 220:
			question.question = "电位高低的含义，是指该点对参考点间的电流大小。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 221:
			question.question = "没有电压就没有电流，没有电流就没有电压。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 222:
			question.question = "将一根条形磁铁截去一段仍为条形磁铁，它仍然具有两个磁极。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 223:
			question.question = "相线与零线间的电压就叫相电压。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 224:
			question.question = "从各相首端引出的导线叫相线，俗称火线。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 225:
			question.question = "有中性线的三相供电方式叫三相四线制，它常用于低压配电系统。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 226:
			question.question = "不引出中性线的三相供电方式叫三相三线制，一般用于高压输电系统。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 227:
			question.question = "各断路器的配合中，电路上一级的熔断时间应为下一级熔断器的多少倍以上？"
			question.rightAnswer = "三倍"
			question.wrongAnswer = "两倍"
			return question
		case 228:
			question.question = "在额定负载恒转矩负载下运行的三相异步电动机，若电源电压下降，则电机的温度将会："
			question.rightAnswer = "升高"
			question.wrongAnswer = "降低"
			return question
		case 229:
			question.question = "真空断路器的触点常采取："
			question.rightAnswer = "对接式触头"
			question.wrongAnswer = "桥式触头"
			return question
		case 230:
			question.question = "1安培等于多少微安？"
			question.rightAnswer = "106"
			question.wrongAnswer = "109"
			return question
		case 231:
			question.question = "半导体的电阻随温度的升高而："
			question.rightAnswer = "减小"
			question.wrongAnswer = "增大"
			return question
		case 232:
			question.question = "电场力做功与所经过的路径无关，参考点确定后，电场中各点的电位之值便唯一确定，这是电位的什么原理？"
			question.rightAnswer = "唯一性"
			question.wrongAnswer = "稳定性"
			return question
		case 233:
			question.question = "磁通的单位是："
			question.rightAnswer = "WB"
			question.wrongAnswer = "MB"
			return question
		case 234:
			question.question = "对称三相电势在任一瞬间的什么等于零？"
			question.rightAnswer = "代数和"
			question.wrongAnswer = "频率"
			return question
		case 235:
			question.question = "电场力在单位时间内所做的功称为："
			question.rightAnswer = "电功率"
			question.wrongAnswer = "功耗"
			return question
		case 236:
			question.question = "电流互感器的准确度D级是用于接："
			question.rightAnswer = "差动保护"
			question.wrongAnswer = "微机保护"
			return question
		case 237:
			question.question = "电压互感器的一次绕组的匝数远大于二次绕组的匝数。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 238:
			question.question = "在加有滤波电容的整流电路中，二极管的导通总是："
			question.rightAnswer = "小于1800"
			question.wrongAnswer = "大于1800"
			return question
		case 239:
			question.question = "双极型晶体管的控制信号为："
			question.rightAnswer = "电压"
			question.wrongAnswer = "电流"
			return question
		case 240:
			question.question = "场效应晶体管的控制信号为："
			question.rightAnswer = "电流"
			question.wrongAnswer = "电压"
			return question
		case 241:
			question.question = "三相半波可控整流电路带阻性负载时，当控制角大于多少时，输出电流开始断续？"
			question.rightAnswer = "900"
			question.wrongAnswer = "600"
			return question
		case 242:
			question.question = "三极管基极的作用是什么？"
			question.rightAnswer = "输送控制载流子"
			question.wrongAnswer = "放大载流子"
			return question
		case 243:
			question.question = "解决放大器截止失真的方法是："
			question.rightAnswer = "减小偏置电阻"
			question.wrongAnswer = "增大下偏电阻"
			return question
		case 244:
			question.question = "二极管的主要特性就是："
			question.rightAnswer = "单向通导"
			question.wrongAnswer = "整流"
			return question
		case 245:
			question.question = "在整流电路的输出端并一个电容，主要是利用电容的什么特性，使脉动电压变得较平稳？"
			question.rightAnswer = "充放电"
			question.wrongAnswer = "升压"
			return question
		case 246:
			question.question = "为防止分接开关故障，应测量分接开关接头阻值，其相差不超过："
			question.rightAnswer = "2%"
			question.wrongAnswer = "1.5%"
			return question
		case 247:
			question.question = "电力变压器中短路电压一般为额定电压的："
			question.rightAnswer = "5%～10%"
			question.wrongAnswer = "11%～15%"
			return question
		case 248:
			question.question = "运动导体切割磁力线而产生最大电动势时，导体与磁力线间的夹角应为："
			question.rightAnswer = "90°"
			question.wrongAnswer = "45°"
			return question
		case 249:
			question.question = "如果把一个24V的电源正极接地，则负极的电位是-24V。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 250:
			question.question = "正弦交流电的周期与角频率的关系是互为倒数。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 251:
			question.question = "下面那种电路工作状态是必须禁止的？"
			question.rightAnswer = "短路"
			question.wrongAnswer = "开路"
			return question
		case 252:
			question.question = " 晶体三极管的三种工作状态是饱和状态、截止状态和："
			question.rightAnswer = "放大状态"
			question.wrongAnswer = "缩小状态"
			return question
		case 253:
			question.question = "瓦数越大的白炽灯其电阻："
			question.rightAnswer = "越小"
			question.wrongAnswer = "越大"
			return question
		case 254:
			question.question = "电路在同一节点处，各支路的电流之和为："
			question.rightAnswer = "零"
			question.wrongAnswer = "大于零"
			return question
		case 255:
			question.question = "磁场中磁力线的方向总是："
			question.rightAnswer = "N极指向S极"
			question.wrongAnswer = "S极指向N极"
			return question
		case 256:
			question.question = "一个正弦交流电压，其有效值为100V，则其最大值为："
			question.rightAnswer = "141.4V"
			question.wrongAnswer = "120.5V"
			return question
		case 257:
			question.question = "回路中，电感电容都是储能元件而电阻是耗能元件。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 258:
			question.question = "线路的绝缘电阻的大小和测试电压："
			question.rightAnswer = "无关"
			question.wrongAnswer = "有关"
			return question
		case 259:
			question.question = "市电220伏是指交流电的："
			question.rightAnswer = "有效值"
			question.wrongAnswer = "平均值"
			return question
		case 260:
			question.question = "串联负反馈使输入电阻："
			question.rightAnswer = "增大"
			question.wrongAnswer = "减小"
			return question
		case 261:
			question.question = "描绘磁场的磁力线在磁体内由："
			question.rightAnswer = "S -> N"
			question.wrongAnswer = "N -> S"
			return question
		case 262:
			question.question = "某直流稳压电源，输出电压为6V，将它接到匝比为1∶10的变压器次级，则其初级的电压为："
			question.rightAnswer = "60V"
			question.wrongAnswer = "600V"
			return question
		case 263:
			question.question = "万用表测量三极管时万用表应放在哪一档上？"
			question.rightAnswer = "R×1000Ω"
			question.wrongAnswer = "R×1Ω"
			return question
		case 264:
			question.question = "并联电容个数愈多，其等效电容越大。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 265:
			question.question = "导电体全是金属材料。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 266:
			question.question = " 用电压表测量电路中的电压时，应并联在电路中。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 267:
			question.question = "两瓦数不同的灯泡串联起来接到电源上，瓦数大的暗。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 268:
			question.question = "放大器中为什么要加负反馈？"
			question.rightAnswer = "提高放大器的稳定性"
			question.wrongAnswer = "降低功耗"
			return question
		case 269:
			question.question = "用叠加原理计算复杂电路，就是把一个复杂电路化为什么电路进行计算的？"
			question.rightAnswer = "单电源"
			question.wrongAnswer = "较小"
			return question
		case 270:
			question.question = "电荷的基本单位不是："
			question.rightAnswer = "安培"
			question.wrongAnswer = "库仑"
			return question
		case 271:
			question.question = "正弦交流电的有效值等于最大值的："
			question.rightAnswer = "0.7"
			question.wrongAnswer = "0.5"
			return question
		case 272:
			question.question = "实际电压源在供电时，它的端电压低于它的电动势。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 273:
			question.question = "已知交流电路中，某元件的阻抗与频率成反比，则元件是："
			question.rightAnswer = "电容"
			question.wrongAnswer = "电感"
			return question
		case 274:
			question.question = "减小涡流损耗可以采用："
			question.rightAnswer = "增大铁芯的电阻率"
			question.wrongAnswer = "增大铁芯的磁导率"
			return question
		case 275:
			question.question = "三相四线制系统中，相电压是指火线和零线之间的电压，线电压是指火线和火线之间的电压。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 276:
			question.question = "在几级及以上的大风以及暴雷电、冰雹、大雾、沙尘暴等恶劣天气下，应停止露天高处作业？"
			question.rightAnswer = "6级"
			question.wrongAnswer = "7级"
			return question
		case 277:
			question.question = "在带电的导线、设备、变压器、油开关附近，不应使用钢卷尺和带金属丝的线尺。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 278:
			question.question = "行灯或移动式电灯的电压，应不高于36V。在金属容器和潮湿地点作业，安全电压应不超过12V。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 279:
			question.question = "人站在干燥的木梯上带电安装灯具，为了站稳，可以一手安装，另一手："
			question.rightAnswer = "可戴绝缘手套扶墙"
			question.wrongAnswer = "可扶墙"
			return question
		case 280:
			question.question = "高压设备接地，室内不得在接地点几米以内？"
			question.rightAnswer = "4米"
			question.wrongAnswer = "6米"
			return question
		case 281:
			question.question = "变压器试运行应进行几次全电压冲击试验？"
			question.rightAnswer = "5次"
			question.wrongAnswer = "3次"
			return question
		case 282:
			question.question = "真空断路器大修周期是："
			question.rightAnswer = "两年"
			question.wrongAnswer = "200次操作"
			return question
		case 283:
			question.question = "变压器大修的周期是投入运行后5年内一次，以后每间隔十年吊芯检查一次。"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 284:
			question.question = "运行中的电流互感器的二次回路开路，则电流互感器会："
			question.rightAnswer = "烧毁"
			question.wrongAnswer = "空载运行"
			return question
		case 285:
			question.question = "运行中的电压互感器工作在："
			question.rightAnswer = "近似空载状态"
			question.wrongAnswer = "近似短路状态"
			return question
		case 286:
			question.question = "2006年新国标将S9系列中的损耗值规定为："
			question.rightAnswer = "能效限定值"
			question.wrongAnswer = "节能评价值"
			return question
		case 287:
			question.question = "接地线为多股软铜线，其截面积不少于多少平方毫米？"
			question.rightAnswer = "25"
			question.wrongAnswer = "16"
			return question
		case 288:
			question.question = "三相二元件电能表不能用于什么系统中，否则少计电能。"
			question.rightAnswer = "三相四线制系统"
			question.wrongAnswer = "三相三线制系统"
			return question
		case 289:
			question.question = "好的变压器油是："
			question.rightAnswer = "浅黄色"
			question.wrongAnswer = "浅红色"
			return question
		case 290:
			question.question = "好的变压器油无味或略带一点："
			question.rightAnswer = "煤油味"
			question.wrongAnswer = "酸味"
			return question
		case 291:
			question.question = "值班巡检时，人体与10KV带电设备间的安全距离为多少米？"
			question.rightAnswer = "0.7"
			question.wrongAnswer = "1.0"
			return question
		case 292:
			question.question = "变压器绕组为A级绝缘，其最高允许温度为："
			question.rightAnswer = "105℃"
			question.wrongAnswer = "130℃"
			return question
		case 293:
			question.question = "触电急救的第一步是："
			question.rightAnswer = "迅速脱离电源"
			question.wrongAnswer = "心肺复苏"
			return question
		case 294:
			question.question = "用利器切断低压电源线时应："
			question.rightAnswer = "逐相切断"
			question.wrongAnswer = "一次切断"
			return question
		case 295:
			question.question = "窃电时间无法查明，窃电日数至少按多少天计算？"
			question.rightAnswer = "180天"
			question.wrongAnswer = "90天"
			return question
		case 296:
			question.question = "变压器小修周期为："
			question.rightAnswer = "一年"
			question.wrongAnswer = "二年"
			return question
		case 297:
			question.question = "在母线倒闸操作程中，母联断路器的操作电源应："
			question.rightAnswer = "拉开"
			question.wrongAnswer = "合上"
			return question
		case 298:
			question.question = "铝合金制的设备接头过热后，其颜色会："
			question.rightAnswer = "呈灰白色"
			question.wrongAnswer = "呈黑色"
			return question
		case 299:
			question.question = "有功功率最优分配的准则是："
			question.rightAnswer = "按等耗量微增率分配"
			question.wrongAnswer = "按消耗量"
			return question
		case 300:
			question.question = "在系统的初始运行条件、故障持续时间均完全相同的情况下，导致系统的暂态稳定性最差的故障应为："
			question.rightAnswer = "三相短路"
			question.wrongAnswer = "断相故障"
			return question

		default:
			break
		}
		return nil
	}
}
