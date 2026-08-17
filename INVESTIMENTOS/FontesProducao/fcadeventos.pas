//******************************************************************************
//Data	          : 29/06/2004
//Origem	  : FUNCEF
//Query 	  : QryTipoEvento
//Motivo(S)       : Passado o Active da qry para 'False'
//******************************************************************************

unit FCadEventos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TB97, TabControlDetalhe, ExtCtrls, Mask, 
  TREdit, wwdblook, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker,
  CMDateTimePicker, DBCtrls, CmEventosCadastro, ImgList;

type
  TFrmCadEventos = class(TfrmCadMestreDetalheCS)
    qryIDEMISSOR: TFloatField;
    qryNOME: TStringField;
    Label1: TLabel;
    QryDetalhe: TwwQuery;
    QryExibeDetalhe: TwwQuery;
    DsExibeDetalhe: TwwDataSource;
    QryDetalheIDTIPOEVENEMISSOR: TFloatField;
    QryDetalheIDEMISSOR: TFloatField;
    QryDetalheDATAEVENTOEMISSOR: TDateTimeField;
    QryDetalheVLREVENTOEMISSOR: TFloatField;
    QryDetalheSTATEVENTOEMISSOR: TStringField;
    QryExibeDetalheIDTIPOEVENEMISSOR: TFloatField;
    QryExibeDetalheDESCTPEVENEMISSOR: TStringField;
    QryExibeDetalheIDEMISSOR: TFloatField;
    QryExibeDetalheDATAEVENTOEMISSOR: TDateTimeField;
    QryExibeDetalheVLREVENTOEMISSOR: TFloatField;
    QryExibeDetalheSTATEVENTOEMISSOR: TStringField;
    dbrgStat: TDBRadioGroup;
    DBlkTipoEvento: TwwDBLookupCombo;
    Label2: TLabel;
    LbLValor: TLabel;
    dbreValor: TDBRealEdit;
    DBData: TCMDateTimePicker;
    Label3: TLabel;
    QryTipoEvento: TwwQuery;
    QryDetalheTIPOEVENTO: TStringField;
    DbLkcEmissor: TwwDBLookupCombo;
    QryEmissor: TwwQuery;
    QryEmissorIDEMISSOR: TFloatField;
    QryEmissorSIGLAEMISSOR: TStringField;
    DsEmissor: TwwDataSource;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  FrmCadEventos: TFrmCadEventos;

implementation

{$R *.DFM}

Uses UMensErro;

procedure TFrmCadEventos.FormShow(Sender: TObject);
begin
  inherited;

  Qry.Open;
  QryDetalhe.Open;
  QryTipoEvento.Open;
  QryEmissor.Open;

// Habilita Botoes de Detalhe
  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;

  DbLkcEmissor.Text := QryEmissor.FieldByName('SIGLAEMISSOR').AsString;

end;

procedure TFrmCadEventos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  QryDetalhe.Close;
  Qry.Close;
  QryTipoEvento.Close;
  QryEmissor.Close;  
end;

procedure TFrmCadEventos.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
// Volta da Procura e Seta Arquivo
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
  begin
    QryEmissor.Locate('IDEMISSOR',MontaSelect.ValoresChave[0],[]);
    DbLkcEmissor.Text := QryEmissor.FieldByName('SIGLAEMISSOR').AsString;
    Qry.Locate('IDEMISSOR',MontaSelect.ValoresChave[0],[]);
  end;

// Habilita Botoes de Detalhe
  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;
  PnlFundo.Enabled      :=True;
  pnlMestre.Enabled     := True;
end;


procedure TFrmCadEventos.FormActivate(Sender: TObject);
begin
  inherited;
// Habilita Botoes de Detalhe
  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;
end;

procedure TFrmCadEventos.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
// Habilita Botoes de Detalhe
  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;
  DbLkcEmissor.Enabled  := True;

  QryDetalhe.Close;
  QryDetalhe.Open;
end;

procedure TFrmCadEventos.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
// Habilita Botoes de Detalhe
  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;
  DbLkcEmissor.Enabled  := True;

  QryDetalhe.Close;
  QryDetalhe.Open;
end;

procedure TFrmCadEventos.bbtnOkDetClick(Sender: TObject);
begin
// Critica Valores
  If (DBlkTipoEvento.Value='') Or (dbreValor.Text='') Or
     (DBData.Text='') Then
  Begin
    ShowMessage('Faltam Preencher Valores ....');
    DBlkTipoEvento.SetFocus;
    Exit;
  End;
// Caso esteja inserindo Acrecenta ID do Emissor
  If QryDetalhe.State = DsInsert Then Begin
    QryDetalhe.FieldByName('IDEMISSOR').AsInteger:= QryEmissor.FieldByName('IDEMISSOR').AsInteger;
  End;

  inherited;
end;

procedure TFrmCadEventos.sbtnExcluiDetClick(Sender: TObject);
begin
// Habilita Botoes de Detalhe
  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;

  If QryDetalhe.IsEmpty Then
     Exit;

  If (MsgDlg('Deseja realmente excluir este registro ?',
             'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrNo) Then 
    Exit;

  inherited;

// Habilita Botoes de Detalhe
  sbtnInsDet.Enabled   :=True;
  sbtnAltDet.Enabled   :=True;
  sbtnExcluiDet.Enabled:=True;
end;

procedure TFrmCadEventos.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  DbLkcEmissor.Enabled := False;
end;

procedure TFrmCadEventos.FormPaint(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled :=True;
  pnlMestre.Enabled:=True;
end;

end.

