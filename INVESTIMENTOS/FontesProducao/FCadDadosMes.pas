//*********************************************************************************************
// Data      : 21/02/2006
// Pendência : 21260
// SOL         39832
// Código    : AL_1
// Motivo    : Acerto na qryDetalhe que estava com o campo chave errado causando erro
//             na abertura do form
//*********************************************************************************************

unit FCadDadosMes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TB97, TabControlDetalhe, ExtCtrls, Mask,
  TREdit, wwdblook, IvDictio, IvMulti, IvEMulti, CmEventosCadastro, ImgList;

type
  TFrmCadDadosMes = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    DbLkcEmpresa: TwwDBLookupCombo;
    dbreValor: TDBRealEdit;
    LbLValor: TLabel;
    DBData: TMaskEdit;
    Label4: TLabel;
    qryIDPESSOA: TFloatField;
    qryNOMEEMPRESA: TStringField;
    QryDetalhe: TwwQuery;
    UpdtDet: TUpdateSQL;
    QryDetalheIDEMPRESAPROP: TFloatField;
    QryDetalheMESTELA: TStringField;
    QryDetalheMES: TStringField;
    QryDetalheVLRRECURGARAN: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure QryDetalheAfterPost(DataSet: TDataSet);
    procedure QryDetalheAfterCancel(DataSet: TDataSet);
    procedure QryDetalheAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  FrmCadDadosMes: TFrmCadDadosMes;

implementation

{$R *.DFM}

Uses UMensErro;

//-------------------------------------------------
// Mostra Formulario
procedure TFrmCadDadosMes.FormShow(Sender: TObject);
begin
  inherited;
// Abre Querys
  Qry.Open;
  QryDetalhe.Open;
// Habilita Botoes de Detalhe
  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;

  DbLkcEmpresa.Text := Qry.FieldByName('NOMEEMPRESA').AsString;

end;

//-------------------------------------------------
// Fecha Formulario
procedure TFrmCadDadosMes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
// Fecha Querys
  QryDetalhe.Close;
  Qry.Close;
end;

//----------------------------------------------------------
// Fazer Procura
procedure TFrmCadDadosMes.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
// Volta da Procura e Seta Arquivo
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then begin
// Recurso para acertar erro no primeiro Locate (Não apague) ..
    Qry.Locate('IDPESSOA',MontaSelect.ValoresChave[0],[]);
    DbLkcEmpresa.Text := Qry.FieldByName('NOMEEMPRESA').AsString;
  end;
// Habilita Botoes de Detalhe
  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;
  PnlFundo.Enabled      :=True;
  pnlMestre.Enabled     := True;  
end;

//-----------------------------------------------------
// Ativa Formulario
procedure TFrmCadDadosMes.FormActivate(Sender: TObject);
begin
  inherited;
// Habilita Botoes de Detalhe
  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;
end;

//-------------------------------------------------------------
// Cancela Alteracao no Detalhe
procedure TFrmCadDadosMes.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
// Habilita Botoes de Detalhe
  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;
  DbLkcEmpresa.Enabled  := True;
// Reabre a Query
  QryDetalhe.Close;
  QryDetalhe.Open;
end;

//-----------------------------------------------------------
// Volta a Alteracao no Detalhe
procedure TFrmCadDadosMes.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
// Habilita Botoes de Detalhe
  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;
  DbLkcEmpresa.Enabled  := True;
// Reabre a Query
  QryDetalhe.Close;
  QryDetalhe.Open;
end;

//-------------------------------------------------------
// Ok do Detalhe
procedure TFrmCadDadosMes.bbtnOkDetClick(Sender: TObject);
begin
// Critica Valores
  If (dbreValor.Text='') Or  (DBData.Text='') Then Begin
    ShowMessage('Faltam Preencher Valores ....');
    dbreValor.SetFocus;
    Exit;
  End;
// Caso esteja inserindo Acrecenta ID da empresa
  If QryDetalhe.State = DsInsert Then Begin
    //al_1
    QryDetalhe.FieldByName('IDEMPRESAPROP').AsInteger:=
      Qry.FieldByName('IDPESSOA').AsInteger;
  End;
  QryDetalhe.FieldByName('MES').AsString := DBData.Text;
// Heranca
  inherited;
  DBData.Text := '';
end;

//-----------------------------------------------------------
// Excluir Detalhe
procedure TFrmCadDadosMes.sbtnExcluiDetClick(Sender: TObject);
begin
// Habilita Botoes de Detalhe
  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;

  If QryDetalhe.IsEmpty Then Exit;
// Pede Confirmacao
  If (MsgDlg('Deseja realmente excluir este registro ?',
             'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrNo) Then Begin
    Exit;
  End;
  inherited;

// Habilita Botoes de Detalhe
  sbtnInsDet.Enabled   :=True;
  sbtnAltDet.Enabled   :=True;
  sbtnExcluiDet.Enabled:=True;
end;

procedure TFrmCadDadosMes.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  DbLkcEmpresa.Enabled := False;
end;

procedure TFrmCadDadosMes.FormPaint(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled :=True;
  pnlMestre.Enabled:=True;
end;

procedure TFrmCadDadosMes.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
// Caso esteja alterando, altera a data
   DBData.Text := QryDetalhe.FieldByName('MES').AsString;
end;

procedure TFrmCadDadosMes.QryDetalheAfterPost(DataSet: TDataSet);
begin
  inherited;
  QryDetalhe.ApplyUpdates;
  QryDetalhe.CommitUpdates;
end;

procedure TFrmCadDadosMes.QryDetalheAfterCancel(DataSet: TDataSet);
begin
  inherited;
  QryDetalhe.CancelUpdates;
  QryDetalhe.CommitUpdates;
end;

procedure TFrmCadDadosMes.QryDetalheAfterDelete(DataSet: TDataSet);
begin
  inherited;
  QryDetalhe.ApplyUpdates;
  QryDetalhe.CommitUpdates;
end;

end.

