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

		questionMarks = getRandomNumbers(numberOfQuestions, uiform: 101)

		for i in questionMarks {
			questions.append(getQuestion(i)!)
		}

		return questions
	}

	func getRandomNumbers(amount: Int, uiform: UInt32) -> [Int] {
		var result = [Int]()

		do {
			let number = Int(arc4random_uniform(uiform))
			if let sameAtIndex = find(result, number) {
				result.removeAtIndex(sameAtIndex)
			}
			result.append(number)
		} while result.count < amount

		return result
	}

	func getQuestion(number: Int) -> Question? {
		var question = Question()

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
			question.question = "接地体离建筑物墙基之间的地下距离不得小于1 m 。"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
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
			question.question = "避雷器可釉预防高大建筑物免遭雷击？"
			question.rightAnswer = "错误"
			question.wrongAnswer = "正确"
			return question
		case 80:
			question.question = "供电企业低压供电的额定电压：单相为220V三相为380V？"
			question.rightAnswer = "正确"
			question.wrongAnswer = "错误"
			return question
		case 81:
			question.question = "由三个频率相同、电势振幅相等、相位差互差 120 °角的交流电路组成的电力系统，叫三相交流电。"
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
			question.question = "在值班期间需要移开或越过遮栏时"
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
			question.question = "带电设备着火时不得使用"
			question.rightAnswer = "泡沫灭火器"
			question.wrongAnswer = "二氧化碳灭火器"
			return question
		case 91:
			question.question = "道闸操作票至少要保存多长时间？"
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
			question.question = "将一根导线均匀拉长为原长度的3倍,则阻值为原来的几倍？"
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

		default:
			break
		}
		return nil
	}
}
