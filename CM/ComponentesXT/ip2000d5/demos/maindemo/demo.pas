unit Demo;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, grdlook, TabNotBk, search, demoloc,
  ExtCtrls, grdmemo, wwstr,
  shellapi, DB, DBTables, Wwtable, Wwdatsrc, Wwmemo, combos,
  packtest, isearch, qbe, Wwdbgrid, DBCtrls, FltEvent, grdbitmp, pictures,
  multi, filtdlg, lkdtl, lkquery, grdbttn, ComCtrls, wwriched, wwrich, rcdvw,
  Wwintl, savefilt, rcdpnldemo, Buttons, wwDialog, wwrcdvw,
  wwDBDateTimePicker, wwmonthcalendar, Mask, wwdbedit, Wwdotdot, Wwdbcomb,
  wwdblook, dtpick, monthcalu, navmany, wwSpeedButton, wwDBNavigator,
  NavigatorComb, rcdpnldemo2, dbchecku, DataInspectorU, GrdIniHint;

type
  TMainDemo = class(TForm)
    wwIntl1: TwwIntl;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    TabSheet12: TTabSheet;
    Button1: TButton;
    Button21: TButton;
    wwDBRichEdit7: TwwDBRichEdit;
    wwDBRichEditDemo: TwwDBRichEdit;
    Button20: TButton;
    wwDBRichEdit4: TwwDBRichEdit;
    Button9: TButton;
    Button17: TButton;
    Button18: TButton;
    wwDBRichEdit5: TwwDBRichEdit;
    Button16: TButton;
    Button8: TButton;
    GroupBox8: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    RadioGroup1: TRadioGroup;
    wwDBRichEdit6: TwwDBRichEdit;
    Button14: TButton;
    GroupBox7: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Button10: TButton;
    Memo2: TMemo;
    GroupBox6: TGroupBox;
    Button11: TButton;
    Memo8: TMemo;
    Panel1: TPanel;
    Label31: TLabel;
    Button2: TButton;
    wwDBRichEdit1: TwwDBRichEdit;
    wwDBRichEdit8: TwwDBRichEdit;
    wwDBRichEdit2: TwwDBRichEdit;
    Button3: TButton;
    Button5: TButton;
    Button13: TButton;
    Button15: TButton;
    Button19: TButton;
    Button4: TButton;
    Button6: TButton;
    wwDBRichEdit9: TwwDBRichEdit;
    Button7: TButton;
    wwDBRichEdit10: TwwDBRichEdit;
    wwDBRichEdit11: TwwDBRichEdit;
    PageControl2: TPageControl;
    TabSheet13: TTabSheet;
    TabSheet14: TTabSheet;
    wwDBRichEdit12: TwwDBRichEdit;
    wwDBRichEdit13: TwwDBRichEdit;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    wwDBRichEdit14: TwwDBRichEdit;
    Button25: TButton;
    Button12: TButton;
    TabSheet5: TTabSheet;
    TabSheet15: TTabSheet;
    wwDBRichEdit3: TwwDBRichEdit;
    Button26: TButton;
    Button27: TButton;
    wwDBRichEdit15: TwwDBRichEdit;
    Button28: TButton;
    Button29: TButton;
    procedure Demo1ButtonClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure DemoButtonClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainDemo: TMainDemo;

implementation

{$R *.DFM}

procedure TMainDemo.Demo1ButtonClick(Sender: TObject);
begin
   Screen.cursor:= crHourGlass;
   with TGridDemo.create(Application) do begin
      Screen.cursor:= crDefault;
      ShowModal;
      Free;
   end
end;

procedure TMainDemo.Button6Click(Sender: TObject);
begin
   Screen.cursor:= crHourGlass;
   with TIncrSearch.create(Application) do begin
      Screen.cursor:= crDefault;
      ShowModal;
      Free;
   end
end;

procedure TMainDemo.Button7Click(Sender: TObject);
begin
   Screen.cursor:= crHourGlass;
   with TLocate.create(Application) do begin
      Screen.cursor:= crDefault;
      ShowModal;
      Free;
   end
end;

procedure TMainDemo.Button8Click(Sender: TObject);
begin
   Screen.cursor:= crHourGlass;
   with TSaveFilterDemo.create(Application) do begin
      Screen.cursor:= crDefault;
      ShowModal;
      Free;
   end
end;

procedure TMainDemo.DemoButtonClick(Sender: TObject);
begin
   Screen.cursor:= crHourGlass;
   with TGridMemoApp.create(Application) do begin
      Screen.cursor:= crDefault;
      ShowModal;
      Free;
   end
end;

procedure TMainDemo.Button2Click(Sender: TObject);
begin
  wwDBRichEdit1.execute;
end;

procedure TMainDemo.Button9Click(Sender: TObject);
begin
   Screen.cursor:= crHourGlass;
   with TLookupForm.create(Application) do begin
      Screen.cursor:= crDefault;
      ShowModal;
      Free;
   end
end;

procedure TMainDemo.Button11Click(Sender: TObject);
begin
   Screen.cursor:= crHourGlass;
   with TPackMain.create(Application) do begin
      Screen.cursor:= crDefault;
      ShowModal;
      Free;
   end
end;

procedure TMainDemo.Button10Click(Sender: TObject);
begin
   Screen.cursor:= crHourGlass;
   with TQBEForm.create(Application) do begin
      Screen.cursor:= crDefault;
      ShowModal;
      Free;
   end
end;

procedure TMainDemo.Button4Click(Sender: TObject);
begin
   Screen.cursor:= crHourGlass;
   with TSearchForm.create(Application) do begin
      Screen.cursor:= crDefault;
      ShowModal;
      Free;
   end
end;

procedure TMainDemo.Button13Click(Sender: TObject);
begin
   Screen.cursor:= crHourGlass;
   with TBitmapForm.create(Application) do begin
      Screen.cursor:= crDefault;
      ShowModal;
      Free;
   end
end;

procedure TMainDemo.Button14Click(Sender: TObject);
begin
   Screen.cursor:= crHourGlass;
   with TPictureForm.create(Application) do begin
      Screen.cursor:= crDefault;
      ShowModal;
      Free;
   end
end;

procedure TMainDemo.Button15Click(Sender: TObject);
begin
   Screen.cursor:= crHourGlass;
   with TMultiSelectForm.create(Application) do begin
      Screen.cursor:= crDefault;
      ShowModal;
      Free;
   end
end;

procedure TMainDemo.Button16Click(Sender: TObject);
begin
   Screen.cursor:= crHourGlass;
   with TFilterDialogForm.create(Application) do begin
      Screen.cursor:= crDefault;
      ShowModal;
      Free;
   end
end;

procedure TMainDemo.Button17Click(Sender: TObject);
begin
   Screen.cursor:= crHourGlass;
   with TDetailComboForm.create(Application) do begin
      Screen.cursor:= crDefault;
      ShowModal;
      Free;
   end
end;

procedure TMainDemo.Button18Click(Sender: TObject);
begin
   Screen.cursor:= crHourGlass;
   with TTableQueryForm.create(Application) do begin
      Screen.cursor:= crDefault;
      ShowModal;
      Free;
   end
end;

procedure TMainDemo.Button19Click(Sender: TObject);
begin
   Screen.cursor:= crHourGlass;
   with TBtnGridForm.create(Application) do begin
      Screen.cursor:= crDefault;
      ShowModal;
      Free;
   end
end;

procedure TMainDemo.Button1Click(Sender: TObject);
begin
   Screen.cursor:= crHourGlass;
   with TRecordViewDemoForm.create(Application) do begin
      Screen.cursor:= crDefault;
      ShowModal;
      Free;
   end
end;

procedure TMainDemo.RadioGroup1Click(Sender: TObject);
begin
   if (Sender as TRadioGroup).ItemIndex=0 then
      wwIntl1.CheckBoxInGridStyle := cbStyleCheckmark
   else
      wwIntl1.CheckBoxInGridStyle := cbStyleXmark;
   wwIntl1.Connected := false;
   wwIntl1.Connected := true;
end;

procedure TMainDemo.CheckBox2Click(Sender: TObject);
begin
   if (Sender as TCheckBox).checked then
      wwIntl1.DialogFontStyle := wwIntl1.DialogFontStyle + [fsBold]
   else
      wwIntl1.DialogFontStyle := wwIntl1.DialogFontStyle - [fsBold];
   wwIntl1.Connected := false;
   wwIntl1.Connected := true;

end;

procedure TMainDemo.CheckBox1Click(Sender: TObject);
begin
   wwIntl1.OKCancelBitmapped := (Sender as TCheckBox).checked;
   wwIntl1.Connected := false;
   wwIntl1.Connected := true;
end;




procedure TMainDemo.Button20Click(Sender: TObject);
begin
   wwDBRichEditDemo.execute;
end;

procedure TMainDemo.FormShow(Sender: TObject);
begin
  ShortDAteFormat:= 'mm/dd/yyyy';
//  wwdbdatetimepicker1.options:= [];
//  wwdbdatetimepicker2.options:= [];
end;

procedure TMainDemo.Button21Click(Sender: TObject);
begin
   Screen.cursor:= crHourGlass;
   with TRecordPanelDemo.create(Application) do begin
      Screen.cursor:= crDefault;
      ShowModal;
      Free;
   end

end;

procedure TMainDemo.SpeedButton1Click(Sender: TObject);
begin
   with TwwRichEditForm(GetParentForm(Sender as TControl)).richedit1 do begin
      sellength:= 0;
      selText:= DateToStr(Date);
   end

          //   AddictSpell1.CheckCustomRichedit(
//      TwwRichEditForm(GetParentForm(Sender as TControl)).richedit1)
end;

procedure TMainDemo.Button22Click(Sender: TObject);
begin
   Screen.cursor:= crHourGlass;
   with TDateTimePickerForm.create(self) do begin
      Screen.cursor:= crDefault;
      ShowModal;
      Free;
   end;
end;

procedure TMainDemo.Button23Click(Sender: TObject);
begin
   Screen.cursor:= crHourGlass;
   with TMonthCalendarForm.create(self) do begin
      Screen.cursor:= crDefault;
      ShowModal;
      Free;
   end;
end;

procedure TMainDemo.Button24Click(Sender: TObject);
begin
   Screen.cursor:= crHourGlass;
   with TNavigatorForm1.create(self) do begin
      Screen.cursor:= crDefault;
      ShowModal;
      Free;
   end;
end;

procedure TMainDemo.Button25Click(Sender: TObject);
begin
   Screen.cursor:= crHourGlass;
   with TCombinedForm.create(self) do begin
      Screen.cursor:= crDefault;
      ShowModal;
      Free;
   end;
end;

procedure TMainDemo.Button12Click(Sender: TObject);
begin
   Screen.cursor:= crHourGlass;
   with TRecordViewPanelForm2.create(Application) do begin
      Screen.cursor:= crDefault;
      ShowModal;
      Free;
   end
end;

procedure TMainDemo.Button26Click(Sender: TObject);
begin
   Screen.cursor:= crHourGlass;
   with TCustomFramingForm.create(Application) do begin
      Screen.cursor:= crDefault;
      ShowModal;
      Free;
   end
end;

procedure TMainDemo.Button27Click(Sender: TObject);
begin
   Screen.cursor:= crHourGlass;
   with TRecordViewPanelForm2.create(Application) do begin
      Screen.cursor:= crDefault;
      ShowModal;
      Free;
   end
end;

procedure TMainDemo.Button28Click(Sender: TObject);
begin
   Screen.cursor:= crHourGlass;
   with TDataInspectorDemo.create(Application) do begin
      Screen.cursor:= crDefault;
      ShowModal;
      Free;
   end
end;

procedure TMainDemo.Button29Click(Sender: TObject);
begin
   Screen.cursor:= crHourGlass;
   with TGridHintIniDemo.create(Application) do begin
      Screen.cursor:= crDefault;
      ShowModal;
      Free;
   end
end;

end.
