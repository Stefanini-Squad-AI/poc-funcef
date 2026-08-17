//******************************************************************************
//N. Sol..........: 171426
//N. Kintana......: 1537613
//Data............: 10/03/2012
//Responsável.....: Edilaine Ferraresi
//Descrição.......: Inclusão de novas faixas salariais (de 9 para 20)
// *****************************************************************************

unit fCadParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCadastroMT,
  wwdbedit, Wwdbspin, StdCtrls, Mask, DBCtrls, IvDictio, IvMulti, IvEMulti, MontaSelect,
  DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97, wwdblook,
  ComCtrls, FCadastro, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro,
  ImgList, DBClient, uCMClientDataSet, uCtrlParamRH;

type
  TfrmCadParam = class(TFrmCadastroMT)
    pgctrlPaginas: TPageControl;
    tbshMotivoRubricas: TTabSheet;
    Label16: TLabel;
    LabelFolhaNormal: TLabel;
    dblcMotivo: TwwDBLookupCombo;
    wwDBLookupCombo1: TwwDBLookupCombo;
    tbshDataProc: TTabSheet;
    gbxNormal: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    dbedNorIni: TCMDateTimePicker;
    dbedNorFim: TCMDateTimePicker;
    gbxFerias: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    dbedFerIni: TCMDateTimePicker;
    dbedFerFim: TCMDateTimePicker;
    gbx13Sal: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    dbed13Ini: TCMDateTimePicker;
    dbed13Fim: TCMDateTimePicker;
    tbshPolitSal: TTabSheet;
    Label17: TLabel;
    labTit1: TLabel;
    labTit2: TLabel;
    labTit3: TLabel;
    labTit4: TLabel;
    labTit5: TLabel;
    labTit6: TLabel;
    labTit7: TLabel;
    labTit8: TLabel;
    labTit9: TLabel;
    dbspeQtdSt: TwwDBSpinEdit;
    dbedSt1: TDBEdit;
    dbedSt2: TDBEdit;
    dbedSt3: TDBEdit;
    dbedSt4: TDBEdit;
    dbedSt5: TDBEdit;
    dbedSt6: TDBEdit;
    dbedSt7: TDBEdit;
    dbedSt8: TDBEdit;
    dbedSt9: TDBEdit;
    gbxDoisCargos: TDBRadioGroup;
    dbrgNivelIndiv: TDBRadioGroup;
    tbshUsoPessoal: TTabSheet;
    dbrgUsoPessoal: TDBRadioGroup;
    gbxAutor: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    dbcbxInsEnder: TDBCheckBox;
    dbcbxAltEnder: TDBCheckBox;
    dbcbxExcEnder: TDBCheckBox;
    dbcbxInsTelef: TDBCheckBox;
    dbcbxAltTelef: TDBCheckBox;
    dbcbxExcTelef: TDBCheckBox;
    dbcbxInsContt: TDBCheckBox;
    dbcbxAltContt: TDBCheckBox;
    dbcbxExcContt: TDBCheckBox;
    dbcbxInsCurso: TDBCheckBox;
    dbcbxAltCurso: TDBCheckBox;
    dbcbxExcCurso: TDBCheckBox;
    dbcbxInsFeria: TDBCheckBox;
    dbcbxAltFeria: TDBCheckBox;
    dbcbxExcFeria: TDBCheckBox;
    dbcbxEmprgIns: TDBCheckBox;
    dbcbxEmprgAlt: TDBCheckBox;
    dbcbxEmprgExc: TDBCheckBox;
    dbcbxAltCtSal: TDBCheckBox;
    TabSheet1: TTabSheet;
    rgTipDurContr: TDBRadioGroup;
    gbxTamMatric: TGroupBox;
    wwDBSpinEdit1: TwwDBSpinEdit;
    dbrgNumeraMatric: TDBRadioGroup;
    DBRadioGroup1: TDBRadioGroup;
    CdsRubrica: TCMClientDataSet;
    CdsMotivo: TCMClientDataSet;
    Label28: TLabel;
    dblcMotivoResc: TwwDBLookupCombo;
    tbshInterface: TTabSheet;
    DBRadioGroup2: TDBRadioGroup;
    labTit10: TLabel;
    dbedSt10: TDBEdit;
    labTit11: TLabel;
    labTit12: TLabel;
    labTit13: TLabel;
    labTit14: TLabel;
    labTit15: TLabel;
    labTit16: TLabel;
    labTit17: TLabel;
    labTit18: TLabel;
    labTit19: TLabel;
    dbedSt11: TDBEdit;
    dbedSt12: TDBEdit;
    dbedSt13: TDBEdit;
    dbedSt14: TDBEdit;
    dbedSt15: TDBEdit;
    dbedSt16: TDBEdit;
    dbedSt17: TDBEdit;
    dbedSt18: TDBEdit;
    dbedSt19: TDBEdit;
    labTit20: TLabel;
    dbedSt20: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure dbspeQtdStChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbrgNumeraMatricChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    CtrlParamRH: TCtrlParamRH;

    procedure Sel;
    function  GravarRegistro: boolean;
  end;

var
  frmCadParam: TfrmCadParam;

implementation

uses uMensErro, uCtrlPadroes, uSistema, uCMTypes;

{$R *.DFM}

procedure TfrmCadParam.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlParamRH := TCtrlParamRH.Create;
  CtrlParamRH.InitializeAs(Padroes);
  CtrlParamRH.CdsParamRH := Cds;

  Sel;
  if (Cds.IsEmpty) then
  begin
    CtrlParamRH.ExecInsert;
    CtrlParamRH.GravarParamRH;
    Sel;
  end;

  CdsRubrica.Data := CtrlParamRH.ListRubrica(Sistema.IdEmpresa);
  CdsMotivo.Data := CtrlParamRH.ListMotivo;

  tbshInterface.TabVisible := (Sistema.TipoEmpresa = 'P');

  pgctrlPaginas.ActivePageIndex := 0;
end;

procedure TfrmCadParam.FormShow(Sender: TObject);
begin
  inherited;
  pnlFundo.Enabled := true;
  sbtnAlterar.Enabled := not(Cds.IsEmpty);
end;

procedure TfrmCadParam.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlParamRH);
  inherited;
end;

procedure TfrmCadParam.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadParam.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
  Sel;
end;

procedure TfrmCadParam.dbspeQtdStChange(Sender: TObject);
var
   iInd, iTag, iCol, iInc : integer;
begin
  inherited;
  // Edilaine Ferraresi - SOL 171426 / KTN 1537613
  {
  Label1.Visible  := (dbspeQtdSt.Value >= 1);
  dbedSt1.Visible := (dbspeQtdSt.Value >= 1);
  Label2.Visible  := (dbspeQtdSt.Value >= 2);
  dbedSt2.Visible := (dbspeQtdSt.Value >= 2);
  Label3.Visible  := (dbspeQtdSt.Value >= 3);
  dbedSt3.Visible := (dbspeQtdSt.Value >= 3);
  Label4.Visible  := (dbspeQtdSt.Value >= 4);
  dbedSt4.Visible := (dbspeQtdSt.Value >= 4);
  Label5.Visible  := (dbspeQtdSt.Value >= 5);
  dbedSt5.Visible := (dbspeQtdSt.Value >= 5);
  Label6.Visible  := (dbspeQtdSt.Value >= 6);
  dbedSt6.Visible := (dbspeQtdSt.Value >= 6);
  Label7.Visible  := (dbspeQtdSt.Value >= 7);
  dbedSt7.Visible := (dbspeQtdSt.Value >= 7);
  Label8.Visible  := (dbspeQtdSt.Value >= 8);
  dbedSt8.Visible := (dbspeQtdSt.Value >= 8);
  Label9.Visible  := (dbspeQtdSt.Value >= 9);
  dbedSt9.Visible := (dbspeQtdSt.Value >= 9);
  }

  // se inserir nova faixa, colocar na TAG do label e edit o no. correspondente a faixa
  // para que o 'for' abaixo possa ter efeito sobre o item novo
  if dbspeQtdSt.Value <= 10 then
     iCol := 158
  else
     iCol := 30;

  for iInd := 1 to 20 do
  begin
    // label
    if FindComponent('labTit'+IntToStr(iInd)) <> nil then
    begin
      iTag := TLabel(FindComponent('labTit'+IntToStr(iInd))).tag;
      TLabel(FindComponent('labTit'+IntToStr(iInd))).Visible := (iTag <= dbspeQtdSt.Value);
      TLabel(FindComponent('labTit'+IntToStr(iInd))).Left    := iCol;
    end;
    // edit
    if FindComponent('dbedSt'+IntToStr(iInd)) <> nil then
    begin
      iTag := TDBEdit(FindComponent('dbedSt'+IntToStr(iInd))).tag;
      TDBEdit(FindComponent('dbedSt'+IntToStr(iInd))).Visible := (iTag <= dbspeQtdSt.Value);
      TDBEdit(FindComponent('dbedSt'+IntToStr(iInd))).Left    := iCol+104;
    end;

    if iInd mod 10 = 0 then
       iCol := 290;
  end;
  // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - fim
end;

procedure TfrmCadParam.dbrgNumeraMatricChange(Sender: TObject);
begin
  inherited;
  gbxTamMatric.Visible := dbrgNumeraMatric.ItemIndex = 0;
end;

procedure TfrmCadParam.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  FormShow(Sender);
end;

procedure TfrmCadParam.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FormShow(Sender);
end;

procedure TfrmCadParam.Sel;
begin
  Cds.Data := CtrlParamRH.ListParamRH;
end;

function TfrmCadParam.GravarRegistro: boolean;
begin
  Result := CtrlParamRH.GravarParamRH;
  if not(Result) then
    raise exception.Create(CtrlParamRH.MessageInfo);
end;

end.
