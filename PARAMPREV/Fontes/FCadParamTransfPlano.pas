// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 16.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FCadParamTransfPlano;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  DBCtrls, Mask, wwdbedit, wwdblook,  CMDBLookupCombo,
  wwdbdatetimepicker, CMDateTimePicker, Wwdbspin, CmEventosCadastro,
  ImgList;

type
  TfrmCadParamTransfPlano = class(TfrmCadMestreDetalheCS)
    dbedTitulo: TwwDBEdit;
    qryCampos: TwwQuery;
    updDet: TUpdateSQL;
    tbsNivel: TTabSheet;
    pnlControlesNivel: TPanel;
    dbgrdOpcoes: TwwDBGrid;
    dsOpcoes: TwwDataSource;
    updOpcoes: TUpdateSQL;
    dbedCodigoCargoExt: TDBEdit;
    Label2: TLabel;
    lblCodigo: TLabel;
    qryDet: TwwQuery;
    qryOpcoes: TwwQuery;
    Label1: TLabel;
    dbedDescInput: TDBEdit;
    dbrgrpTipoInput: TDBRadioGroup;
    lblCampoBD: TLabel;
    lblCampoRegra: TLabel;
    dbedCampoRegra: TDBEdit;
    lblRegraCalc: TLabel;
    dblkpcmbRegraCalc: TwwDBLookupCombo;
    Label3: TLabel;
    dbedDescOpcao: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    grbSituacao: TGroupBox;
    rdbAtivo: TRadioButton;
    rdbMantido: TRadioButton;
    rdbMantParc: TRadioButton;
    rdbAssistido: TRadioButton;
    rdbBeneficiario: TRadioButton;
    dbedValorDefault: TDBEdit;
    Label4: TLabel;
    dbchkPodeAlterar: TDBCheckBox;
    dbedOrder: TDBEdit;
    Label5: TLabel;
    dbedValoraMigrar: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    updEstimativa: TUpdateSQL;
    dsEstimativa: TwwDataSource;
    qryEstimativa: TwwQuery;
    tbsEstimativa: TTabSheet;
    Panel1: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    dbedDescEstimativa: TDBEdit;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    DBCheckBox10: TDBCheckBox;
    DBEdit2: TDBEdit;
    dbgrdEstimativa: TwwDBGrid;
    CMDateTimePicker1: TCMDateTimePicker;
    CMDateTimePicker2: TCMDateTimePicker;
    tbsBases: TTabSheet;
    Panel2: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    dbedDescBase: TDBEdit;
    DBCheckBox11: TDBCheckBox;
    DBCheckBox12: TDBCheckBox;
    DBCheckBox13: TDBCheckBox;
    DBCheckBox14: TDBCheckBox;
    DBCheckBox15: TDBCheckBox;
    DBEdit4: TDBEdit;
    dbgrdBases: TwwDBGrid;
    dsBases: TwwDataSource;
    qryBases: TwwQuery;
    updBases: TUpdateSQL;
    qryTipoDado: TwwQuery;
    dblkpcmbTipoBase: TwwDBLookupCombo;
    Label14: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    wwDBLookupCombo4: TwwDBLookupCombo;
    qryRegra: TwwQuery;
    dblkpcmbCampos: TwwDBLookupCombo;
    Label15: TLabel;
    DBEdit1: TDBEdit;
    Label16: TLabel;
    DBEdit3: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure qryDetBeforePost(DataSet: TDataSet);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure dbrgrpTipoInputClick(Sender: TObject);
    procedure qryDetAfterScroll(DataSet: TDataSet);
    procedure qryOpcoesBeforePost(DataSet: TDataSet);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure qryEstimativaBeforePost(DataSet: TDataSet);
    procedure qryBasesBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    OpDetalhe           : String;
  public
    { Public declarations }
  end;


var
  frmCadParamTransfPlano: TfrmCadParamTransfPlano;

implementation

uses FPrincipal, UDataBase, UMensErro, USistema, UAdmPrev;

{$R *.DFM}

procedure TfrmCadParamTransfPlano.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.ValoresChave.Count <=  0) or (MontaSelect.ValoresChave[0] = '')
  then Exit;

  qry.Close;
  qry.ParamByName('IDEVENTOGERADOR').Value   := StrToInt(MontaSelect.ValoresChave[0]);
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDEVENTOGERADOR').Value    := qry.FieldByName('IDEVENTOGERADOR').AsInteger;
  qryDet.Open;

  qryOpcoes.Close;
  qryOpcoes.ParamByName('IDEVENTOGERADOR').Value    := qry.FieldByName('IDEVENTOGERADOR').AsInteger;
  qryOpcoes.Open;

  qryBases.Close;
  qryBases.ParamByName('IDEVENTOGERADOR').Value    := qry.FieldByName('IDEVENTOGERADOR').AsInteger;
  qryBases.Open;

  qryEstimativa.Close;
  qryEstimativa.ParamByName('IDEVENTOGERADOR').Value    := qry.FieldByName('IDEVENTOGERADOR').AsInteger;
  qryEstimativa.Open;

end;


procedure TfrmCadParamTransfPlano.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;

  Try
   if OpDetalhe <> 'E'
    Then AplicaAlteracoes([qryDet, qryOpcoes, qryBases, qryEstimativa])
    Else AplicaAlteracoes([qryOpcoes, qryBases, qryEstimativa,qryDet]);
  except
     raise;
  end;
    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end; 

procedure TfrmCadParamTransfPlano.CmeDetalheConfirma(Sender: TObject);
begin

  If qryDet.State in [dsEdit, dsInsert]
   Then begin
    If rdbAtivo.Checked
     Then qryDet.FieldByName('FLGATIVO').AsInteger        := 1
     Else qryDet.FieldByName('FLGATIVO').AsInteger        := 0;

    If rdbMantido.Checked
     Then qryDet.FieldByName('FLGMANTIDO').AsInteger      := 1
     Else qryDet.FieldByName('FLGMANTIDO').AsInteger      := 0;

    If rdbMantParc.Checked
     Then qryDet.FieldByName('FLGMANTPARC').AsInteger     := 1
     Else qryDet.FieldByName('FLGMANTPARC').AsInteger     := 0;

    If rdbAssistido.Checked
     Then qryDet.FieldByName('FLGASSISTIDO').AsInteger    := 1
     Else qryDet.FieldByName('FLGASSISTIDO').AsInteger    := 0;

    If rdbBeneficiario.Checked
     Then qryDet.FieldByName('FLGBENEFICIARIO').AsInteger := 1
     Else qryDet.FieldByName('FLGBENEFICIARIO').AsInteger := 0;
   End;

   inherited;
end; 


procedure TfrmCadParamTransfPlano.FormActivate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('IDEVENTOGERADOR').Value             := 0;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDEVENTOGERADOR').Value          := 0;
  qryDet.Open;

  qryOpcoes.Close;
  qryOpcoes.ParamByName('IDEVENTOGERADOR').Value       := 0;
  qryOpcoes.Open;

  qryBases.Close;
  qryBases.ParamByName('IDEVENTOGERADOR').Value        := 0;
  qryBases.Open;

  qryEstimativa.Close;
  qryEstimativa.ParamByName('IDEVENTOGERADOR').Value  := 0;
  qryEstimativa.Open;

  qryRegra.Close;
  qryRegra.Open;

  qryTipoDado.Close;
  qryTipoDado.Open;

  qryCampos.Close;
  qryCampos.Open;

end;

procedure TfrmCadParamTransfPlano.qryDetBeforePost(DataSet: TDataSet);
begin
  if dbedDescInput.Text = '' then
  begin
    MsgDlg('Descrição do Parâmetro não preenchida.','Erro',mtError,[mbOk,mbHelp],0);
    dbedDescInput.SetFocus;
    Abort;
  end;

  if dbrgrpTipoInput.ItemIndex < 0 then
  begin
    MsgDlg('Tipo do Parâmetro não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
    dbrgrpTipoInput.SetFocus;
    Abort;
  end;

  if qryDet.State = dsInsert then
  begin
    qryDet.FieldByName('IDEVENTOGERADOR').AsInteger    := qry.FieldByName('IDEVENTOGERADOR').AsInteger;
    qryDet.FieldByName('IDINPUT').AsInteger            := LeUltRegistro(nil, 'INPUTTRANSFPLANO');
  end;

  if dbrgrpTipoInput.ItemIndex > 0
  then begin
     qryDet.FieldByName('TABELA').AsString := '';
     qryDet.FieldByName('CAMPO').AsString  := '';
  end
  else begin
     qryDet.FieldByName('TABELA').AsString         := 'SIMULAMIGRACAO';
     qryDet.FieldByName('CAMPO').AsString          := qryCampos.FieldByName('NOMECAMPO').AsString;
     qryDet.FieldByName('NOMEPARAREGRA').AsString  := qryCampos.FieldByName('NOMECAMPO').AsString;
  end;

  inherited;

end;

procedure TfrmCadParamTransfPlano.dbrgrpTipoInputClick(Sender: TObject);
begin
  inherited;
  lblCampoBD.Visible        := (dbrgrpTipoInput.ItemIndex = 0);
  dblkpcmbCampos.Visible        := (dbrgrpTipoInput.ItemIndex = 0);
  lblCampoRegra.Visible     := (dbrgrpTipoInput.ItemIndex <> 0);
  dbedCampoRegra.Visible    := (dbrgrpTipoInput.ItemIndex <> 0);
  lblRegraCalc.Visible      := (dbrgrpTipoInput.ItemIndex = 2);
  dblkpcmbRegraCalc.Visible := (dbrgrpTipoInput.ItemIndex = 2);
end;

procedure TfrmCadParamTransfPlano.qryDetAfterScroll(DataSet: TDataSet);
var i : word;
begin
  inherited;
  lblCampoBD.Visible        := (dbrgrpTipoInput.ItemIndex = 0);
  dblkpcmbCampos.Visible        := (dbrgrpTipoInput.ItemIndex = 0);
  lblCampoRegra.Visible     := (dbrgrpTipoInput.ItemIndex <> 0);
  dbedCampoRegra.Visible    := (dbrgrpTipoInput.ItemIndex <> 0);
  lblRegraCalc.Visible      := (dbrgrpTipoInput.ItemIndex = 2);
  dblkpcmbRegraCalc.Visible := (dbrgrpTipoInput.ItemIndex = 2);

  

  rdbAtivo.Checked        := (qryDet.FieldByName('FLGATIVO').AsInteger = 1);
  rdbMantido.Checked      := (qryDet.FieldByName('FLGMANTIDO').AsInteger = 1);
  rdbMantParc.Checked     := (qryDet.FieldByName('FLGMANTPARC').AsInteger = 1);
  rdbAssistido.Checked    := (qryDet.FieldByName('FLGASSISTIDO').AsInteger = 1);
  rdbBeneficiario.Checked := (qryDet.FieldByName('FLGBENEFICIARIO').AsInteger = 1);

  
end;

procedure TfrmCadParamTransfPlano.qryOpcoesBeforePost(DataSet: TDataSet);
begin

  if dbedDescOpcao.Text = '' then
  begin
    MsgDlg('Descrição da Opção não preenchida.','Erro',mtError,[mbOk,mbHelp],0);
    dbedDescOpcao.SetFocus;
    Abort;
  end;

  if qryOpcoes.State = dsInsert then
  begin
    qryOpcoes.FieldByName('IDEVENTOGERADOR').AsInteger    := qry.FieldByName('IDEVENTOGERADOR').AsInteger;
    qryOpcoes.FieldByName('IDTIPOTRANSF').AsInteger       := LeUltRegistro(nil, 'TIPOSTRANSFPLANO');
    qryOpcoes.FieldByName('FLGTIPO').AsString             := 'O';
  end;
  inherited;

end;

procedure TfrmCadParamTransfPlano.CmeDetalheInsert(Sender: TObject);
begin
  inherited;

  OpDetalhe := 'I';

end;

procedure TfrmCadParamTransfPlano.CmeDetalheEdit(Sender: TObject);
begin
  inherited;

  OpDetalhe := 'A';

end;

procedure TfrmCadParamTransfPlano.CmeDetalheDelete(Sender: TObject);
begin
  inherited;

  OpDetalhe := 'E';

end;

procedure TfrmCadParamTransfPlano.qryEstimativaBeforePost(
  DataSet: TDataSet);
begin
  inherited;

  if dbedDescEstimativa.Text = '' then
  begin
    MsgDlg('Descrição da Estimativa não preenchida.','Erro',mtError,[mbOk,mbHelp],0);
    dbedDescOpcao.SetFocus;
    Abort;
  end;

  if qryEstimativa.State = dsInsert then
  begin
    qryEstimativa.FieldByName('IDEVENTOGERADOR').AsInteger    := qry.FieldByName('IDEVENTOGERADOR').AsInteger;
    qryEstimativa.FieldByName('IDTIPOTRANSF').AsInteger       := LeUltRegistro(nil, 'TIPOSTRANSFPLANO');
    qryEstimativa.FieldByName('FLGTIPO').AsString             := 'E';
  end;
  inherited;

end;

procedure TfrmCadParamTransfPlano.qryBasesBeforePost(DataSet: TDataSet);
begin

  if dbedDescBase.Text = '' then
  begin
    MsgDlg('Descrição da Opção não preenchida.','Erro',mtError,[mbOk,mbHelp],0);
    dbedDescOpcao.SetFocus;
    Abort;
  end;

  if qryBases.State = dsInsert then
  begin
    qryBases.FieldByName('IDEVENTOGERADOR').AsInteger    := qry.FieldByName('IDEVENTOGERADOR').AsInteger;
    qryBases.FieldByName('IDTIPOTRANSF').AsInteger       := LeUltRegistro(nil, 'TIPOSTRANSFPLANO');
    qryBases.FieldByName('FLGTIPO').AsString             := 'B';
  end;
  inherited;

end;

procedure TfrmCadParamTransfPlano.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add('EVENTOGERADOR.IDFUNDACAO = '+IntToStr(iIdFundacao));
end;

end.

