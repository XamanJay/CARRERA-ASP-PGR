var menu = new TMainMenu('menu','horizontal');
menu.SetBorder(0,'navy','solid');
menu.SetCellSpacing(0)
menu.SetBackground('whitesmoke','img/b.gif','repeat-y','top left');		
menu.SetItemText('','left','','','');
menu.SetItemTextHL('','left','','','');
menu.SetItemTextClick('','left','','','');
menu.SetItemBorder(1,'whitesmoke','solid');

menu.SetItemDimension(90,20);
menu._pop.SetCorrection(0,0);
menu._pop.SetAlpha(75);
menu._pop.SetItemDimension(150,20);
menu._pop.SetPaddings(1);
menu._pop.SetBackground('whitesmoke','img/xp.gif','repeat-y','top left');
menu._pop.SetSeparator(125,'right','gray','');
menu._pop.SetExpandIcon(true,'',6);
menu._pop.SetFont('tahoma,verdana,arial','8pt');
menu._pop.SetBorder(1,'gray','solid');
menu._pop.SetDelay(500);