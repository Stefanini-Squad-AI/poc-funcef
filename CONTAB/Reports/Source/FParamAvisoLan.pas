// Atualizado por: Marcus Oliveira - P. 21543 - 02/10/2006 - Incluir uma opção de pesquisa pelo código interno.
// Aualizado por: andre tavares - pendência 16948 - 25/06/2004 - imnplementação dos filtros Plano e Patro

unit FParamAvisoLan;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, StdCtrls, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, uCmSqlParams, Db, DBClient,
  uCMClientDataSet;

type
  TfrmParamAvisoLan = class(TfrmParamReports_Padrao)
    dteDataIni: TCMDateTimePicker;
    gbFaixaPlanilha: TGroupBox;
    Label1: TLabel;
    rePlanilFim: TRealEdit;
    rePlanilIni: TRealEdit;
    gbPlanilhas: TGroupBox;
    rePlanil2: TRealEdit;
    rePlanil1: TRealEdit;
    rePlanil3: TRealEdit;
    rePlanil4: TRealEdit;
    rePlanil5: TRealEdit;
    rePlanil6: TRealEdit;
    rePlanil7: TRealEdit;
    rePlanil8: TRealEdit;
    rePlanil9: TRealEdit;
    Label4: TLabel;
    dblkPlano: TwwDBLookupCombo;
    dblkPatro: TwwDBLookupCombo;
    Label2: TLabel;
    Label3: TLabel;
    sqlPlanPrev: TCMSqlParams;
    sqlPatro: TCMSqlParams;
    cdsPlanPrev: TCMClientDataSet;
    cdsPatro: TCMClientDataSet;
    CheckBox1: TCheckBox;
    rgReferencia: TRadioGroup;
    ChkBxAPsSelecionadas: TCheckBox;
    Label5: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure cbNumAPClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgReferenciaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamAvisoLan: TfrmParamAvisoLan;

implementation

uses UMensErro, uString;


{$R *.DFM}

procedure TfrmParamAvisoLan.bbtnConfirmarClick(Sender: TObject);
Var
    xx         : Integer;
    sPlanilhas : String;
    bPrimVez   : Boolean;
begin
  inherited;

if rgReferencia.ItemIndex = 2 then begin
   if rePlanilFim.text <= IntToStr(0) then begin
      MsgDlg('O código final deve ser informado.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      rePlanilFim.SetFocus;
      Exit;
   end;
end;

 if rgReferencia.ItemIndex = 0 then begin

  //  if not cbNumAP.Checked then begin
     if dteDataIni.text = '' then begin
        MsgDlg('A Data deve ser preenchida.','Erro',mtError,[mbOk],0);
        modalResult := mrNone;
        dteDataIni.SetFocus;
        Exit;
     end;
  end;

  sPlanilhas := '';
  bPrimVez   := True;
  for xx := 0 to (ComponentCount - 1) do begin

     if (Components[xx].Tag = 21) then begin
        if TRealEdit(Components[xx]).Value <> 0 then begin
           if not bPrimVez then begin
              sPlanilhas:=sPlanilhas + ','+FloatToStr(TRealEdit(Components[xx]).Value);
           end else begin
              sPlanilhas:=sPlanilhas + FloatToStr(TRealEdit(Components[xx]).Value);
              bPrimVez := false;
           end;
        end;
     end;
  end;

  if bPrimvez then begin
  //Marcus Oliveira P. 21543 02/10/2006
     if rgReferencia.ItemIndex = 0 then
  //   if cbNumAP.Checked then
        MsgDlg('Pelo menos uma planilha deve ser preenchida.','Erro',mtError,[mbOk],0);

     if rgReferencia.ItemIndex = 1 then
        MsgDlg('Pelo menos uma A.P. deve ser preenchida.','Erro',mtError,[mbOk],0);

     if rgReferencia.ItemIndex = 2 then
        MsgDlg('Pelo menos um código deve ser preenchido.','Erro',mtError,[mbOk],0);

     modalResult := mrNone;
     rePlanil1.SetFocus;
     Exit;
  end;

  //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsString   := dteDataIni.Text;

  Cmp_Padrao.ParamValues[2].AsInteger  := StrToIntDef(rePlanilIni.Text,0);
  Cmp_Padrao.ParamValues[3].AsInteger  := StrToIntDef(rePlanilFim.Text,0);
  Cmp_Padrao.ParamValues[4].AsInteger  := StrToIntDef(rePlanil1.Text,0);
  Cmp_Padrao.ParamValues[5].AsInteger  := StrToIntDef(rePlanil2.Text,0);
  Cmp_Padrao.ParamValues[6].AsInteger  := StrToIntDef(rePlanil3.Text,0);
  Cmp_Padrao.ParamValues[7].AsInteger  := StrToIntDef(rePlanil4.Text,0);
  Cmp_Padrao.ParamValues[8].AsInteger  := StrToIntDef(rePlanil5.Text,0);
  Cmp_Padrao.ParamValues[9].AsInteger  := StrToIntDef(rePlanil6.Text,0);
  Cmp_Padrao.ParamValues[10].AsInteger := StrToIntDef(rePlanil7.Text,0);
  Cmp_Padrao.ParamValues[11].AsInteger := StrToIntDef(rePlanil8.Text,0);
  Cmp_Padrao.ParamValues[12].AsInteger := StrToIntDef(rePlanil9.Text,0);

  // inicio - andre tavares - pendência 16948 - 25/06/2004
  if trim(dblkPlano.text) <> '' then
    Cmp_Padrao.ParamValues[13].AsString := dblkPlano.LookupValue
  else
    Cmp_Padrao.ParamValues[13].AsString := '';

  if trim(dblkPatro.text) <> '' then
    Cmp_Padrao.ParamValues[14].AsString := dblkPatro.LookupValue
  else
    Cmp_Padrao.ParamValues[14].AsString := '';
  // fim - andre tavares - pendência 16948 - 25/06/2004


  // Rodolpho da Silva - P: 21543 - 16/11/2006
  Cmp_Padrao.ParamValues[15].AsInteger := rgReferencia.ItemIndex;

  Cmp_Padrao.ParamValues[16].Value := ChkBxAPsSelecionadas.Checked; { Augusto 17/11/2007 }

end;

procedure TfrmParamAvisoLan.cbNumAPClick(Sender: TObject);
begin
{  inherited;    Para Satisfazer a P. 21543 Marcus Oliveira 02/10/2006
  if cbNumAP.Checked then begin
     dteDataIni.Enabled := false;
     dteDataIni.text := ''; // andre tavares - pendencia 18333 - 30/12/2004
     gbFaixaPlanilha.Caption := ' Faixa de A.P.s ';
     gbPlanilhas.Caption     := ' A.P.s Alternadas ';
  end else begin
     dteDataIni.Enabled := true;
     dteDataIni.date := date; // andre tavares - pendencia 18333 - 30/12/2004
     gbFaixaPlanilha.Caption := ' Faixa de Planilhas ';
     gbPlanilhas.Caption     := ' Planilhas Alternadas ';
  end;
  Application.ProcessMessages;
 }
end;

procedure TfrmParamAvisoLan.FormCreate(Sender: TObject);
begin
  inherited;
  rgReferencia.ItemIndex:=0;
  dteDataIni.date := date;  // andre tavares - pendencia 18333 - 30/12/2004
  // inicio - andre tavares - pendência 16948 - 25/06/2004
  sqlPlanPrev.Open;
  sqlPatro.Open
  // fim - andre tavares - pendência 16948 - 25/06/2004
end;

procedure TfrmParamAvisoLan.rgReferenciaClick(Sender: TObject);
begin
  inherited;
     if rgReferencia.ItemIndex = 0 then begin

     dteDataIni.Enabled := true;
     dteDataIni.date := date; // andre tavares - pendencia 18333 - 30/12/2004
     gbFaixaPlanilha.Caption := ' Faixa de Planilhas ';
     gbPlanilhas.Caption     := ' Planilhas Alternadas '

   end Else if rgReferencia.ItemIndex = 1 then begin

    //  if cbNumAP.Checked then begin
     dteDataIni.Enabled := false;
     dteDataIni.text := ''; // andre tavares - pendencia 18333 - 30/12/2004
     gbFaixaPlanilha.Caption := ' Faixa de A.P.s ';
     gbPlanilhas.Caption     := ' A.P.s Alternadas '


   end Else if rgReferencia.ItemIndex = 2 then begin
     dteDataIni.Enabled := false;
     dteDataIni.text := ''; // andre tavares - pendencia 18333 - 30/12/2004
     gbFaixaPlanilha.Caption := ' Código Interno ';
     gbPlanilhas.Caption     := ' Código Interno Alternadas '

end;
Application.ProcessMessages;



end;

end.
