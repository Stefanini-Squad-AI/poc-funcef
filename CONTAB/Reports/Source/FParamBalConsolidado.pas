{*******************************************************************************
Rotina..........: TfrmParamBalConsolidado.bbtnConfirmarClick
N. Sol..........: 108683
N. Kintana......: 495605
Data............: 20/05/2009
Responsável.....: Marilza Colpani
Descrição.......: Inclusão do checkbox cbDesconsidera
*******************************************************************************}
unit FParamBalConsolidado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, Db, Wwdatsrc, wwclient, uCmSqlParams, DBClient,
  uCMClientDataSet, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, ExtCtrls, Spin,
  ComCtrls, wwdblook, CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97;

type
  TfrmParamBalConsolidado = class(TfrmParamReports_Padrao)
    grpDatas: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    dblkPeriodoIni: TwwDBLookupCombo;
    dblkPeriodoFim: TwwDBLookupCombo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label10: TLabel;
    chkMascara: TCheckBox;
    chkGrupo: TCheckBox;
    chkGrau: TCheckBox;
    spnGrau: TSpinEdit;
    chkIndenta: TCheckBox;
    chkEspaco: TCheckBox;
    rdgValores: TRadioGroup;
    spnPagIni: TSpinEdit;
    TabSheet2: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    edtTitulo: TEdit;
    edtSubTitulo: TEdit;
    tbsEmpresas: TTabSheet;
    dbgrEmpresaProp: TwwDBGrid;
    cdsExercicio: TCMClientDataSet;
    cdsPeriodoFim: TCMClientDataSet;
    cdsPeriodoIni: TCMClientDataSet;
    sqlPeriodoIni: TCMSqlParams;
    sqlExercicio: TCMSqlParams;
    sqlPeriodoFim: TCMSqlParams;
    cdsEmpresa: TwwClientDataSet;
    sqlEmpresa: TCMSqlParams;
    dsEmpresa: TwwDataSource;
    chkDesconsidera: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblkExercicioExit(Sender: TObject);
    procedure chkGrauClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamBalConsolidado: TfrmParamBalConsolidado;

implementation

uses UMensErro, uDatabase, DBaseDados,  uSistema, FSM_FxLib,
     uModulo,  uData, uFuncaoGeral;

{$R *.DFM}

procedure TfrmParamBalConsolidado.FormCreate(Sender: TObject);
begin
  inherited;
   sqlEmpresa.Open;
   TwwClientDataSet(cdsEmpresa).ControlType.Add('FLGCONSOL;CheckBox;S;N');


   with sqlExercicio do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      Open;
   end;
   with sqlPeriodoIni do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      ParamByName('PEREXERCICIO').asInteger := Year(Date);
      Open;
   end;
   with sqlPeriodoFim do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      ParamByName('PEREXERCICIO').asInteger := Year(Date);
      Open;
   end;


   spnGrau.MaxValue := FuncaoGeral.CalcGrauMax(modulo.sMascaraContas);
   spnGrau.Value    := FuncaoGeral.CalcGrauMax(modulo.sMascaraContas);
   spnGrau.MinValue := 1;

end;

procedure TfrmParamBalConsolidado.bbtnConfirmarClick(Sender: TObject);
var sIdPessoa :string;
begin
  inherited;
   if dblkExercicio.text = '' then begin
      MsgDlg('O Exercício deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

   if dblkPeriodoIni.text = '' then begin
      MsgDlg('O Período Inicial deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

   if dblkPeriodoFim.text = '' then begin
      MsgDlg('O Período Final deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

   sIdPessoa := '';
   cdsEmpresa.First;
   While not cdsEmpresa.EOF do begin
      if cdsEmpresa.FieldByName('FLGCONSOL').AsString = 'S' then begin
         if sIdPessoa = '' then begin
            sIdPessoa := trim(IntToStr(cdsEmpresa.FieldByName('IDPESSOA').AsInteger));
         end else begin
            sIdPessoa := sIdPessoa+','+trim(IntToStr(cdsEmpresa.FieldByName('IDPESSOA').AsInteger));
         end;
      end;
      cdsEmpresa.Next;
   end;

  //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsInteger  := StrToInt(dblkExercicio.LookupValue);
  Cmp_Padrao.ParamValues[1].AsInteger  := StrToInt(dblkPeriodoIni.LookupValue);
  Cmp_Padrao.ParamValues[2].AsInteger  := StrToInt(dblkPeriodoFim.LookupValue);
  Cmp_Padrao.ParamValues[3].AsInteger  := StrToInt(spnGrau.Text);
  Cmp_Padrao.ParamValues[4].AsBoolean  := chkMascara.Checked;
  Cmp_Padrao.ParamValues[5].AsBoolean  := chkGrupo.Checked;
  Cmp_Padrao.ParamValues[6].AsBoolean  := chkEspaco.Checked;
  Cmp_Padrao.ParamValues[7].AsBoolean  := chkIndenta.Checked;
  Cmp_Padrao.ParamValues[8].AsInteger  := rdgValores.ItemIndex;
  Cmp_Padrao.ParamValues[9].AsInteger  := StrToInt(spnPagIni.text);
  Cmp_Padrao.ParamValues[10].AsString  := sIdPessoa;
  Cmp_Padrao.ParamValues[11].AsString  := edtTitulo.text;
  Cmp_Padrao.ParamValues[12].AsString  := edtSubTitulo.text;
  Cmp_Padrao.ParamValues[12].AsString  := edtSubTitulo.text;
  Cmp_Padrao.ParamValues[13].AsBoolean  := chkDesconsidera.Checked;  //Marilza Colpani 28/05/2009 N.Sol: 108683 - N.Kintana: 495605

end;

procedure TfrmParamBalConsolidado.FormShow(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePageIndex := 0;
end;

procedure TfrmParamBalConsolidado.dblkExercicioExit(Sender: TObject);
begin
  inherited;
   if dblkExercicio.text <> '' then begin
      with sqlPeriodoIni do begin
         Prepare;
         ParamByName('IDPESSOA').asInteger     := Sistema.idEmpresa;
         ParamByName('PEREXERCICIO').asInteger := StrToInt(dblkExercicio.text);
         Open;
      end;
      with sqlPeriodoFim do begin
         Prepare;
         ParamByName('IDPESSOA').asInteger     := Sistema.idEmpresa;
         ParamByName('PEREXERCICIO').asInteger := StrToInt(dblkExercicio.text);
         Open;
      end;
   end;

end;

procedure TfrmParamBalConsolidado.chkGrauClick(Sender: TObject);
begin
  inherited;
   if chkGrau.checked then begin
      spnGrau.enabled := true;
      spnGrau.Color   := clWindow;
   end else begin
      spnGrau.enabled := false;
      spnGrau.Color   := clBtnFace;
   end;

end;

end.
