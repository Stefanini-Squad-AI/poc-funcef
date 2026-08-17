//******************************************************************************
//Autor 	  : Fabio Fagundes
//Data	          : 29/06/2004
//Origem	  : FUNCEF
//Query 	  : QryTipoIndicador, QryIndicadores
//Motivo(S)       : Passado o Active da qry para 'False'
//******************************************************************************

//------------------------------------------------------------------
// Sistema  .: INVESTIMENTOS
// Objetivo .: Formulário de Cadastro de Valores nos Indicadores do Emissor
// Form     .: FrmCadValParamEmiss - Unit .: FCadValParamEmiss
// Data     .: 02/02/1999
// Autor    .: Alexandre Ramos  **--> Serious Developer ..
//------------------------------------------------------------------
unit FCadValParamEmiss;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TB97, TabControlDetalhe, ExtCtrls, Mask, 
  TREdit, wwdblook, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList;

type
  TFrmCadValParamEmiss = class(TfrmCadMestreDetalheCS)
    qryIDEMISSOR: TFloatField;
    qryNOME: TStringField;
    QryDetalhe: TwwQuery;
    DBlkTipoEvento: TwwDBLookupCombo;
    Label2: TLabel;
    LbLValor: TLabel;
    dbreValor: TDBRealEdit;
    DBData: TCMDateTimePicker;
    Label3: TLabel;
    QryTipoIndicador: TwwQuery;
    QryDetalheIDPARAMEMISSOR: TFloatField;
    QryDetalheIDEMISSOR: TFloatField;
    QryDetalheDATAREFPREMISSOR: TDateTimeField;
    QryDetalheVLRPARAMEMISSOR: TFloatField;
    QryDetalheIDREGRAUSOEMISSOR: TFloatField;
    QryDetalheDescIndicador: TStringField;
    wwDBLookupCombo1: TwwDBLookupCombo;
    Label4: TLabel;
    QryRegras: TwwQuery;
    QryIndicadores: TwwQuery;
    QryEmissor: TwwQuery;
    QryEmissorIDEMISSOR: TFloatField;
    QryEmissorSIGLAEMISSOR: TStringField;
    DsEmissor: TwwDataSource;
    DbLkcEmissor: TwwDBLookupCombo;
    Label5: TLabel;
    UpdateSQL1: TUpdateSQL;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure DBDataExit(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure QryDetalheAfterPost(DataSet: TDataSet);
    procedure QryDetalheAfterDelete(DataSet: TDataSet);
    procedure QryDetalheAfterCancel(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadValParamEmiss: TFrmCadValParamEmiss;

implementation

{$R *.DFM}

Uses UMensErro;

//-------------------------------------------------
// Mostra Formulario
procedure TFrmCadValParamEmiss.FormShow(Sender: TObject);
begin
  inherited;
// Abre Querys
  Qry.Open;
  QryDetalhe.Open;
  QryTipoIndicador.Open;
  QryRegras.Open;
  QryEmissor.Open;
// Abilita Botoes de Detalhe
  sbtnInsDet.Enabled   :=True;
  sbtnAltDet.Enabled   :=True;
  sbtnExcluiDet.Enabled:=True;

  DbLkcEmissor.Text := QryEmissor.FieldByName('SIGLAEMISSOR').AsString;
end;

//-------------------------------------------------
// Fecha Formulario
procedure TFrmCadValParamEmiss.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
// Fecha Querys
  QryDetalhe.Close;
  Qry.Close;
  QryTipoIndicador.Close;
  QryRegras.Close;
  QryEmissor.Close;
end;
//----------------------------------------------------------
// Fazer Procura
procedure TFrmCadValParamEmiss.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
// Volta da Procura e Seta Arquivo
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
// Recurso para acertar erro no primeiro Locate (Não apague) ..
    QryEmissor.Locate('IDEMISSOR',MontaSelect.ValoresChave[0],[]);
    DbLkcEmissor.Text := QryEmissor.FieldByName('SIGLAEMISSOR').AsString;
    Qry.Locate('IDEMISSOR',MontaSelect.ValoresChave[0],[]);
// Abilita Botoes de Detalhe
  sbtnInsDet.Enabled   :=True;
  sbtnAltDet.Enabled   :=True;
  sbtnExcluiDet.Enabled:=True;
  PnlFundo.Enabled     :=True;
  pnlMestre.Enabled:=True;
end;

//----------------------------------------------------------
// Ativa Formulario
procedure TFrmCadValParamEmiss.FormActivate(Sender: TObject);
begin
  inherited;
// Abilita Botoes de Detalhe
  sbtnInsDet.Enabled   :=True;
  sbtnAltDet.Enabled   :=True;
  sbtnExcluiDet.Enabled:=True;
  PnlFundo.Enabled:=True;
end;

//----------------------------------------------------------
// Cancela Alteracao no Detalhe
procedure TFrmCadValParamEmiss.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
// Abilita Botoes de Detalhe
  sbtnInsDet.Enabled   :=True;
  sbtnAltDet.Enabled   :=True;
  sbtnExcluiDet.Enabled:=True;
  DbLkcEmissor.Enabled :=True;
  sbtnProcurar.Enabled :=True;
// Reabre a Query
  QryDetalhe.Close;
  QryDetalhe.Open;
end;

//----------------------------------------------------------
// Volta a Alteracao no Detalhe
procedure TFrmCadValParamEmiss.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
// Abilita Botoes de Detalhe
  sbtnInsDet.Enabled   :=True;
  sbtnAltDet.Enabled   :=True;
  sbtnExcluiDet.Enabled:=True;
  DbLkcEmissor.Enabled :=True;
  sbtnProcurar.Enabled :=True;
// Reabre a Query
  QryDetalhe.Close;
  QryDetalhe.Open;
end;

//----------------------------------------------------------
// Ok do Detalhe
procedure TFrmCadValParamEmiss.bbtnOkDetClick(Sender: TObject);
begin
// Critica Valores
  If (DBlkTipoEvento.Value='') Or (dbreValor.Text='') Or
     (DBData.Text='') Then Begin
    ShowMessage('Faltam Preencher Valores ....');
    DBlkTipoEvento.SetFocus;
    Exit;
  End;
// Caso esteja inserindo Acrecenta ID do Emissor
  If QryDetalhe.State = DsInsert Then Begin
    QryDetalhe.FieldByName('IDEMISSOR').AsInteger:=
      QryEmissor.FieldByName('IDEMISSOR').AsInteger;
  End;
// Heranca
  inherited;
end;

//----------------------------------------------------------
// Excluir Detalhe
procedure TFrmCadValParamEmiss.sbtnExcluiDetClick(Sender: TObject);
begin
  If QryDetalhe.IsEmpty Then Begin
// Abilita Botoes de Detalhe
    sbtnInsDet.Enabled   :=True;
    sbtnAltDet.Enabled   :=True;
    sbtnExcluiDet.Enabled:=True;
    sbtnExcluiDet.Down   :=False;

    Exit;
  End;
// Pede Confirmacao
  If (MsgDlg('Deseja realmente excluir este registro ?',
             'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrNo) Then Begin
    Exit;         
  End;

  inherited;
// Abilita Botoes de Detalhe
  sbtnInsDet.Enabled   :=True;
  sbtnAltDet.Enabled   :=True;
  sbtnExcluiDet.Enabled:=True;
end;

procedure TFrmCadValParamEmiss.sbtnAltDetClick(Sender: TObject);
begin
// Caso Tabela Vazia  
  If QryDetalhe.IsEmpty Then Begin
// Abilita Botoes de Detalhe
    sbtnAltDet.Enabled   :=True;
    sbtnAltDet.Down      :=False;

    Exit;
  End;

  inherited;
end;

procedure TFrmCadValParamEmiss.DBDataExit(Sender: TObject);
begin
  inherited;
  bbtnOkDet.SetFocus;
end;

procedure TFrmCadValParamEmiss.FormPaint(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled :=True;
  pnlMestre.Enabled:=True;
end;

procedure TFrmCadValParamEmiss.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  DbLkcEmissor.Enabled:=False;
  sbtnProcurar.Enabled:=False;
end;

procedure TFrmCadValParamEmiss.QryDetalheAfterPost(DataSet: TDataSet);
begin
  inherited;
//  QryDetalhe.ApplyUpdates;
//  QryDetalhe.CommitUpdates;
end;

procedure TFrmCadValParamEmiss.QryDetalheAfterDelete(DataSet: TDataSet);
begin
  inherited;
//  QryDetalhe.ApplyUpdates;
//  QryDetalhe.CommitUpdates;
end;

procedure TFrmCadValParamEmiss.QryDetalheAfterCancel(DataSet: TDataSet);
begin
  inherited;
//  QryDetalhe.CancelUpdates;
end;

end.
