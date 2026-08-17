unit FCadGrupUsuXTipoOper;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  wwdblook, CmEventosCadastro, ImgList;

type
  TFrmCadGrupUsuXTipoOper = class(TfrmCadMestreDetalheCS)
    QryGrupUsu: TwwQuery;
    QryTipoOper: TwwQuery;
    QryDet: TwwQuery;
    DbLkcGrupUsu: TwwDBLookupCombo;
    Label1: TLabel;
    DsGrupUsu: TwwDataSource;
    UpdDet: TUpdateSQL;
    wwDBLookupCombo1: TwwDBLookupCombo;
    Label2: TLabel;
    dbLkcTipoInvest: TwwDBLookupCombo;
    Label3: TLabel;
    QryTipoInvest: TwwQuery;
    DsTipoInvest: TwwDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure QryDetAfterPost(DataSet: TDataSet);
    procedure QryDetAfterCancel(DataSet: TDataSet);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure DbLkcGrupUsuChange(Sender: TObject);
    procedure QryDetAfterDelete(DataSet: TDataSet);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure CmeDetalheFind(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadGrupUsuXTipoOper: TFrmCadGrupUsuXTipoOper;

implementation

{$R *.DFM}

Uses UMensErro; 

procedure TFrmCadGrupUsuXTipoOper.FormShow(Sender: TObject);
begin
  inherited;

  QryGrupUsu.Open;
  QryTipoInvest.Open;
  QryTipoOper.Open;

  PnlFundo.Enabled := True;
  PnlMestre.Enabled:= True;
  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;
end;

procedure TFrmCadGrupUsuXTipoOper.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  QryGrupUsu.Close;
  QryTipoInvest.Close;
  QryTipoOper.Close;
end;

procedure TFrmCadGrupUsuXTipoOper.bbtnOkDetClick(Sender: TObject);
Var
  Editando:Boolean;
  wTipoInvest:Integer;
begin

// Preenche o Resto dos Dados
  QryDet.FieldByName('IDGRUPO').AsString:=DbLkcGrupUsu.LookupValue;

  wTipoInvest := QryDet.FieldByName('IDTIPOINVEST').AsInteger;
  Editando    := False;

  If QryDet.State In [DsEdit] Then Editando := True;

  inherited;

  If Editando = True Then
  Begin
    QryDet.Close;
    QryDet.Open;
  End;

end;

procedure TFrmCadGrupUsuXTipoOper.QryDetAfterPost(DataSet: TDataSet);
begin
  inherited;
  QryDet.ApplyUpdates;
  QryDet.CommitUpdates;
end;

procedure TFrmCadGrupUsuXTipoOper.QryDetAfterCancel(DataSet: TDataSet);
begin
  inherited;
  QryDet.CancelUpdates;
  QryDet.CommitUpdates;
end;

procedure TFrmCadGrupUsuXTipoOper.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;

  QryDet.Close;
  QryDet.Open;

// Volta Ambiente
  PnlFundo.Enabled := True;
  PnlMestre.Enabled:= True;
  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;
end;

procedure TFrmCadGrupUsuXTipoOper.DbLkcGrupUsuChange(Sender: TObject);
begin
  inherited;
  If Trim(DbLkcGrupUsu.Text) <> '' Then Begin
    QryDet.Close;
    QryDet.ParamByName('IDGRUPO').AsString:= QryGrupUsu.FieldByName('IDGRUPO').AsString;
    QryDet.Open;
  End Else Begin
    QryDet.Close;
  End;
end;

procedure TFrmCadGrupUsuXTipoOper.QryDetAfterDelete(DataSet: TDataSet);
begin
  inherited;
  QryDet.ApplyUpdates;
  QryDet.CommitUpdates;
end;

procedure TFrmCadGrupUsuXTipoOper.sbtnExcluiDetClick(Sender: TObject);
begin
  If QryDet.IsEmpty Then Begin
    MsgDlg('A Tabela está vazia ','Mensagem do Sistema',MtError,[MbOk],0);
    Exit;
  End;

  inherited;
  PnlFundo.Enabled := True;
  PnlMestre.Enabled:= True;
  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;
end;

procedure TFrmCadGrupUsuXTipoOper.sbtnInsDetClick(Sender: TObject);
begin
  If Trim(DbLkcGrupUsu.Text) = '' Then Begin
    MsgDlg('Escolha um Grupo de Usuário.','Mensagem do Sistema',MtError,[MbOk],0);
    sbtnInsDet.Down := False;
    Exit;
  End;

  inherited;

end;

procedure TFrmCadGrupUsuXTipoOper.sbtnAltDetClick(Sender: TObject);
begin
  If QryDet.IsEmpty Then Begin
    MsgDlg('A Tabela está vazia ','Mensagem do Sistema',MtError,[MbOk],0);
    sbtnAltDet.Down := False;
    Exit;
  End;

  inherited;
end;

procedure TFrmCadGrupUsuXTipoOper.CmeDetalheFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then Begin
    QryGrupUsu.Locate('IDGRUPO',MontaSelect.ValoresChave[0],[]);

    DbLkcGrupUsu.LookupValue:=MontaSelect.ValoresChave[0];
    DbLkcGrupUsu.RefreshDisplay;
    DbLkcGrupUsu.PerformSearch;
  End;

// Habilita Botoes de Detalhe
  PnlFundo.Enabled      := True;
  PnlMestre.Enabled     := True;
  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;
end;

end.
