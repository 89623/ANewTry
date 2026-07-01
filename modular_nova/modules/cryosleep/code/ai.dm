/mob/living/silicon/ai/verb/ai_cryo()
	set name = "AI 低温休眠"
	set desc = "将当前AI人格置于低温休眠状态，为另一个AI释放空间。"
	set category = "AI Commands"

	if(incapacitated)
		return
	switch(alert("你想要进入低温休眠吗？这会让你变成幽灵。请记住，在脱离重要职位前，即使没有管理员在线，也要先发送管理员求助（AHELP）。",,"Yes.","No."))
		if("Yes.")
			src.ghostize(FALSE)
			minor_announce("空间站AI已从系统网络断开连接并移至远程存储。正在准备新AI人格上传。", "空间站AI")
			new /obj/structure/ai_core/latejoin_inactive(loc)
			if(src.mind)
				//Handle job slot/tater cleanup.
				if(src.mind.assigned_role.title == JOB_AI)
					SSjob.FreeRole(JOB_AI)
			src.mind.special_roles = null
			qdel(src)
		else
			return
