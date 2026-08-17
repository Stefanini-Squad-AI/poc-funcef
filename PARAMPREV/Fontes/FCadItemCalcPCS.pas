// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Rotina      : updDet
// Autor(a)    : Leo - Funcef
// Data        : 31.03.2004
// Alteração   : acerto no campo IDREGRAVALORRUB para IDREGRAVALORUB
//------------------------------------------------------------------------------

unit FCadItemCalcPCS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, Db, StdCtrls, Mask, DBCtrls, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn,
  TB97Tlbr, Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, wwdblook, CMDBLookupCombo, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, ImgList;

type
  TfrmCadItemCalcPCS = class(TfrmCadMestreDetalheCS)
    lblFinalVigencia: TLabel;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    lblNome: TLabel;
    lblPrazoPBC: TLabel;
    lblInicioVigencia: TLabel;
    dbeNome: TDBEdit;
    dbePrazoPBC: TDBEdit;
    dbdeInicioVigencia: TCMDateTimePicker;
    dbdeFinalVigencia: TCMDateTimePicker;
    lblCodigo: TLabel;
    dbeCodigo: TDBEdit;
    qryRubrica: TwwQuery;
    qryRegra: TwwQuery;
    stPatro: TStaticText;
    stNomePatro: TStaticText;
    pgctrlItens: TPageControl;
    tbsDadosMensais: TTabSheet;
    tbsDadosNoEvento: TTabSheet;
    dbrgrTipo: TDBRadioGroup;
    lblCodItemPCS: TLabel;
    dbeCodItemPCS: TDBEdit;
    lblOrdemCalc: TLabel;
    dbeOrdemCalc: TDBEdit;
    lblIdRubrica: TLabel;
    dblkpcmbRubrica: TCMDBLookupCombo;
    lblIDRegraValorRubrica: TLabel;
    dblkpcmbIDRegraVlrRubrica: TCMDBLookupCombo;
    lblIdRegraPercRubrica: TLabel;
    dblkpcmbIDRegraPercRubrica: TCMDBLookupCombo;
    lblPrazoApur: TLabel;
    dbePrazoApur: TDBEdit;
    Label1: TLabel;
    lblIdRegraCalcItem: TLabel;
    dblkpcmbIdRegraCalcItem: TCMDBLookupCombo;
    lblIdRegraCalcPercent: TLabel;
    dblkpcmbIdRegraCalcPercent: TCMDBLookupCombo;
    procedure FormActivate(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure sbtnAlterarClick(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadItemCalcPCS: TfrmCadItemCalcPCS;

implementation
  
uses FPrincipal, UAdmPrev, UMensErro, UDataBase;

{$R *.DFM}

procedure TfrmCadItemCalcPCS.FormActivate(Sender: TObject);
begin
  inherited;
  qryRegra.Open;

  qryRubrica.Close;

  qryRubrica.Open;

  qry.Close;
  qry.ParamByName('IDPESSJUR').Value := frmPrincipal.liIdPessJurPCS;
  qry.ParamByName('IDPCS').Value := 0;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDPCS').Value     := qry.ParamByName('IDPCS').Value;
  qryDet.Open;

  stNomePatro.Caption:=frmPrincipal.sNomepatroPCS;
  MontaSelect.Filtro.Clear;
  MontaSelect.Filtro.Add('PCS.IDPESSJUR = '+intToStr(frmPrincipal.liIdPessJurPCS));
end;

procedure TfrmCadItemCalcPCS.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbeCodigo.SetFocus;

  qryDet.Close;
  qryDet.ParamByName('IDPCS').Value     := 0;
  qryDet.Open;

  qry.FieldByName('IDPESSJUR').AsInteger   := frmPrincipal.liIdPessJurPCS;
  qry.FieldByName('IDPCS').AsInteger       := LeUltRegistro(nil,'PCS');
end;

procedure TfrmCadItemCalcPCS.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbeCodigo.SetFocus;
  sbtnInsDet.Enabled := True;
end;

procedure TfrmCadItemCalcPCS.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
  begin
    qry.Close;
    qry.ParamByName('IDPESSJUR').Value := StrToInt(MontaSelect.ValoresChave[0]);
    qry.ParamByName('IDPCS').Value     := StrToInt(MontaSelect.ValoresChave[1]);
    qry.Open;

    qryDet.Close;
    qryDet.ParamByName('IDPCS').Value     := qry.FieldByName('IDPCS').AsInteger;
    qryDet.Open;
  end;
end;

procedure TfrmCadItemCalcPCS.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  qryDet.FieldByName('FlgObrigatorio').AsInteger := 1;
end;

procedure TfrmCadItemCalcPCS.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  try
    AplicaAlteracoes([qryDet]);
  except
    raise;
  end;

end; 

procedure TfrmCadItemCalcPCS.CmeDetalheConfirma(Sender: TObject);
begin
   inherited;

end; 

procedure TfrmCadItemCalcPCS.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryDet.Close;
  qryDet.ParamByName('IDPCS').Value     := qry.FieldByName('IDPCS').AsInteger;
  qryDet.Open;

end;

procedure TfrmCadItemCalcPCS.qryBeforePost(DataSet: TDataSet);
begin
  inherited;

  If qry.State = dsInsert Then
   begin
     if dbeCodigo.Text = '' then
     begin
       MsgDlg('Código não preenchido','Erro',mtError,[mbOk,mbHelp],0);
       dbeCodigo.SetFocus;
       Abort;
     end;

     if dbeNome.Text = '' then
     begin
       MsgDlg('Nome não preenchido','Erro',mtError,[mbOk,mbHelp],0);
       dbeNome.SetFocus;
       Abort;
     end;

     if dbePrazoPBC.Text = '' then
     begin
       MsgDlg('Prazo não preenchido','Erro',mtError,[mbOk,mbHelp],0);
       dbePrazoPBC.SetFocus;
       Abort;
     end;
   end;
end;

procedure TfrmCadItemCalcPCS.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;
  if qryDet.State = dsInsert then
  begin
    qryDet.FieldByName('IDPCS').AsInteger     := qry.FieldByName('IDPCS').AsInteger;
    qryDet.FieldByName('IDITEMPCS').AsInteger := LeUltRegistro(nil,'ITEMPCS');
    qryDet.FieldByName('IDPESSJUR').AsInteger := frmPrincipal.liIdPessJurPCS;

  end;


  case dbrgrTipo.ItemIndex of
       0 : qryDet.FieldByName('DESCTIPO').AsString := 'Rubrica Salarial';
       1 : qryDet.FieldByName('DESCTIPO').AsString := 'Calculado';
       2 : qryDet.FieldByName('DESCTIPO').AsString := 'Cargo';
       3 : qryDet.FieldByName('DESCTIPO').AsString := 'Função';
       4 : qryDet.FieldByName('DESCTIPO').AsString := 'ATS';
       5 : qryDet.FieldByName('DESCTIPO').AsString := 'Baseado em Faixa Salarial';
  end;

  qryDet.FieldByName('DESCRUBRICA').AsString       := dblkpcmbRubrica.Text;

end;

procedure TfrmCadItemCalcPCS.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  sbtnInsDet.Enabled := True;
end;

end.
