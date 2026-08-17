unit FCadClassinvXinvest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, wwdblook, DBGrids, IvDictio,
  IvMulti, IvEMulti, Mask, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, ImgList;

type
  TFrmClassinvXinvest = class(TfrmCadMestreDetalheCS)
    QryBuscaTipoInvestimento: TwwQuery;
    QryBuscaTabelaClassif: TwwQuery;
    QryAux: TwwQuery;
    Label1: TLabel;
    Label2: TLabel;
    DbLkcTipoInvestimento: TwwDBLookupCombo;
    DbLkcTabelaClassif: TwwDBLookupCombo;
    QryBuscaClassificacao: TwwQuery;
    QryDetalhe: TwwQuery;
    DBDateEdit1: TCMDateTimePicker;
    Label5: TLabel;
    dblcCarteira: TwwDBLookupCombo;
    Label6: TLabel;
    qryCarteira: TwwQuery;
    QryInvestimento: TwwQuery;
    QryDetalheCODTABCLASSINV: TStringField;
    QryDetalheCODCLASSINVEST: TStringField;
    QryDetalheIDCARTEIRAINVEST: TFloatField;
    QryDetalheIDINVESTIMENTO: TFloatField;
    QryDetalheDTENQUADRA: TDateTimeField;
    updDetalhe: TUpdateSQL;
    Label7: TLabel;
    DbLkcInvestimento: TwwDBLookupCombo;
    QryDetalheDESCINVESTIMENTO: TStringField;
    Label4: TLabel;
    DbLckClassificacao: TwwDBLookupCombo;
    SB1: TSpeedButton;
    QryDetalheDESCCLASSINVEST: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DbLkcTipoInvestimentoChange(Sender: TObject);
    procedure DbLkcTabelaClassifChange(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure SB1Click(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure dblcCarteiraChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmClassinvXinvest: TFrmClassinvXinvest;

implementation

{$R *.DFM}

Uses UBibliotecaInvest, FBuscaClassif, UMensErro;

Var
  wTipo : Char; 

procedure TFrmClassinvXinvest.FormShow(Sender: TObject);
begin
  inherited;

  QryBuscaTabelaClassif.Open;
  QryBuscaTipoInvestimento.Open;
  QryInvestimento.Open;
  QryCarteira.Open;
  QryDetalhe.Open;
  QryBuscaClassificacao.Open;

  SbtnInserir.Enabled  := False;
  SbtnProcurar.Enabled := True;

  sbtnInsDet.Enabled    := False;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;
  PnlMestre.Enabled     := True;

end;

procedure TFrmClassinvXinvest.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryBuscaTipoInvestimento.Close;
  QryBuscaTabelaClassif.Close;
  QryInvestimento.Close;
  QryDetalhe.Close;
  QryCarteira.Close;
  QryBuscaClassificacao.Close;
end;

procedure TFrmClassinvXinvest.DbLkcTipoInvestimentoChange(
  Sender: TObject);
begin
  inherited;
  DbLkcTabelaClassif.Value := '';
  dblcCarteira.Value       := '';

  QryDetalhe.Close;

  If (Trim(DbLkcTipoInvestimento.Text) = '') Then Begin
    sbtnInsDet.Enabled    := False;
    QryDetalhe.Close;
    Exit;
  End Else Begin
    sbtnInsDet.Enabled    := True;
  End;

  FazQuery(QryDetalhe,
                     ' SELECT                                                   '+
                     '       CODTABCLASSINV,                                    '+
                     '       CODCLASSINVEST,                                    '+
                     '       IDCARTEIRAINVEST,                                  '+
                     '       IDINVESTIMENTO,                                    '+
                     '       DTENQUADRA                                         '+
                     ' FROM                                                     '+
                     '       CLASSINVxINVEST                                    '+
                     ' WHERE                                                    '+
                     '      (IDINVESTIMENTO  IN (SELECT DISTINCT                '+
                     '                                IDINVESTIMENTO            '+
                     '                           FROM                           '+
                     '                                 INVESTIMENTO             '+
                     '                           WHERE                          '+
                     '                                 IDTIPOINVEST = '''+
                            QryBuscaTipoInvestimento.FieldByName('IDTIPOINVEST').AsString+'''))');
end;

procedure TFrmClassinvXinvest.DbLkcTabelaClassifChange(
  Sender: TObject);
begin
  inherited;
  dblcCarteira.Value       := '';

  FazQuery(QryBuscaClassificacao,
           'SELECT CODTABCLASSINV, CODCLASSINVEST, DESCCLASSINVEST '+
           'FROM CLASSIFINVEST '+
           'WHERE (CODTABCLASSINV = '''+
             QryBuscaTabelaClassif.FieldByName('CODTABCLASSINV').AsString+''') '+
           'ORDER BY DESCCLASSINVEST ');

  If (Trim(DbLkcTipoInvestimento.Text) = '') Or (Trim(DbLkcTabelaClassif.Text)    = '') Then
  Begin
    sbtnInsDet.Enabled    := False;
    QryDetalhe.Close;
    Exit;
  End
  Else
    sbtnInsDet.Enabled    := True;

  FazQuery(QryDetalhe,
                     ' SELECT                                                   '+
                     '       CODTABCLASSINV,                                    '+
                     '       CODCLASSINVEST,                                    '+
                     '       IDCARTEIRAINVEST,                                  '+
                     '       IDINVESTIMENTO,                                    '+
                     '       DTENQUADRA                                         '+
                     ' FROM                                                     '+
                     '       CLASSINVxINVEST                                    '+
                     ' WHERE                                                    '+
                     '      (IDINVESTIMENTO  IN (SELECT DISTINCT                '+
                     '                                IDINVESTIMENTO            '+
                     '                           FROM                           '+
                     '                                 INVESTIMENTO             '+
                     '                           WHERE                          '+
                     '                                 IDTIPOINVEST = '''+
                            QryBuscaTipoInvestimento.FieldByName('IDTIPOINVEST').AsString+''')) AND '+
                     '      (CODTABCLASSINV   = '''+
                            QryBuscaTabelaClassif.FieldByName('CODTABCLASSINV').AsString+''') ');
end;

procedure TFrmClassinvXinvest.bbtnOkDetClick(Sender: TObject);
begin
  If sbtnInsDet.Down = True Then
  Begin
    If (Trim(DbLkcTipoInvestimento.Text) = '') Then
    Begin
       ShowMessage('Faltam Preencher o campo Tipo de Investimento.');
       bbtnCancelarDet.SetFocus;
       Exit;
    End;
    If (Trim(DbLkcTabelaClassif.Text)    = '') Then
    Begin
       ShowMessage('Faltam Preencher o campo Tabela de Classificação.');
       bbtnCancelarDet.SetFocus;
       Exit;
    End;
    If (Trim(dblcCarteira.Text)          = '') Then
    Begin
       ShowMessage('Faltam Preencher o campo Carteira.');
       bbtnCancelarDet.SetFocus;
       Exit;
    End;
    If (Trim(DbLkcInvestimento.Text)     = '') Then
    Begin
       ShowMessage('Faltam Preencher o campo Tipo de Investimento.');
       DbLkcInvestimento.SetFocus;
       Exit;
    End;
    If (Trim(DbLckClassificacao.Text)    = '') Then
    Begin
       ShowMessage('Faltam Preencher o campo Classificação.');
       bbtnCancelarDet.SetFocus;
       Exit;
    End;

    QryDetalhe.FieldByName('CODCLASSINVEST').AsString    :=
                            QryBuscaClassificacao.FieldByName('CODCLASSINVEST').AsString;
    QryDetalhe.FieldByName('CODTABCLASSINV').AsString    :=
                            QryBuscaTabelaClassif.FieldByName('CODTABCLASSINV').AsString;
    QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger   :=
                            QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
    QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger :=
                            QryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;
  End;

  Try
    inherited;
    QryDetalhe.Post;
    QryDetalhe.ApplyUpdates;
    QryDetalhe.CommitUpdates;
    BbtnCancelarDetClick(Application);
  Except;
    QryDetalhe.Cancel;
    QryDetalhe.CancelUpdates;
  End;

  SbtnInserir.Enabled  := False;
  SbtnProcurar.Enabled := False;

  If wTipo = 'A' Then
  Begin
    DbLkcTipoInvestimento.Enabled := True;
    DbLkcTabelaClassif.Enabled    := True;
    dblcCarteira.Enabled          := True;

    sbtnInsDet.Enabled    := True;
    sbtnAltDet.Enabled    := True;
    sbtnExcluiDet.Enabled := True;
  End;
  PnlMestre.Enabled     := True;
end;

procedure TFrmClassinvXinvest.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;

  SbtnInserir.Enabled  := False;
  SbtnProcurar.Enabled := False;

  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;

  DbLkcTipoInvestimento.Enabled := True;
  DbLkcTabelaClassif.Enabled    := True;
  dblcCarteira.Enabled          := True;

  If sbtnInsDet.Enabled = False Then
  Begin
    sbtnInsDet.Enabled := True;
    QryDetalhe.Close;
    QryDetalhe.Open;
  End;
  PnlMestre.Enabled     := True;
end;

procedure TFrmClassinvXinvest.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  SbtnInserir.Enabled  := False;
  SbtnProcurar.Enabled := False;

  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;

  DbLkcTipoInvestimento.Enabled := True;
  DbLkcTabelaClassif.Enabled    := True;
  dblcCarteira.Enabled          := True;

  If sbtnInsDet.Enabled = False Then
  Begin
    sbtnInsDet.Enabled := True;
    QryDetalhe.Close;
    QryDetalhe.Open;
  End;
  PnlMestre.Enabled     := True;
end;

procedure TFrmClassinvXinvest.sbtnExcluiDetClick(Sender: TObject);
begin
  If QryDetalhe.IsEmpty Then
  Begin
    sbtnExcluiDet.Down := False;
    Exit;
  End;

  If (MsgDlg('Deseja realmente excluir este registro ?',
             'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrNo) Then
  Begin
    sbtnExcluiDet.Down := False;
    Exit;
  End;

  inherited;

  SbtnInserir.Enabled   := False;
  SbtnProcurar.Enabled  := False;

  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;
  sbtnExcluiDet.Down    := False;
  PnlMestre.Enabled     := True;
end;

procedure TFrmClassinvXinvest.sbtnAltDetClick(Sender: TObject);
begin
  If QryDetalhe.IsEmpty Then
  Begin
    sbtnAltDet.Down := False;
    Exit;
  End;

  wTipo:='A';

  inherited;

  DbLkcTipoInvestimento.Enabled := False;
  DbLkcTabelaClassif.Enabled    := False;
  dblcCarteira.Enabled          := False;
end;

procedure TFrmClassinvXinvest.SB1Click(Sender: TObject);
begin
  inherited;

  Application.CreateForm(TFrmBuscaClassif, FrmBuscaClassif);
  FrmBuscaClassif.wCodTabelaClassif  :=
    QryBuscaTabelaClassif.FieldByName('CODTABCLASSINV').AsString;
  FrmBuscaClassif.wDescTabelaClassif :=
    QryBuscaTabelaClassif.FieldByName('DESCTABCLASSINV').AsString;

  FrmBuscaClassif.ShowModal;

  If FrmBuscaClassif.wClassifEscolhida <> '' Then
    QryDetalhe.FieldByName('CODCLASSINVEST').AsString :=
      FrmBuscaClassif.wClassifEscolhida;

  FrmBuscaClassif.Free;
end;

procedure TFrmClassinvXinvest.sbtnInsDetClick(Sender: TObject);
begin
  inherited;

  DbLkcTipoInvestimento.Enabled := False;
  DbLkcTabelaClassif.Enabled    := False;
  dblcCarteira.Enabled          := False;

  wTipo:='I';
  QryDetalhe.FieldByName('DTENQUADRA').AsDateTime:=Date;
end;

procedure TFrmClassinvXinvest.FormCreate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled    := True;
end;

procedure TFrmClassinvXinvest.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  PnlMestre.Enabled     := True;
end;

procedure TFrmClassinvXinvest.sbtnProcurarClick(Sender: TObject);
begin
   inherited;
  MontaSelect.Executar;
  If MontaSelect.RetornouValor Then Begin
    DbLkcTipoInvestimento.Value:=MontaSelect.ValoresChave[0];
    DbLkcTabelaClassif.Value   :=MontaSelect.ValoresChave[1];
    dblcCarteira.Value         :=MontaSelect.ValoresChave[3];
  End;
  sbtnProcurar.Down:=False;
end;

procedure TFrmClassinvXinvest.dblcCarteiraChange(Sender: TObject);
begin
  inherited;
  If (Trim(DbLkcTipoInvestimento.Text) = '') Or (Trim(DbLkcTabelaClassif.Text)    = '') Or
     (Trim(dblcCarteira.Text)          = '') Then
  Begin
    sbtnInsDet.Enabled    := False;
    QryDetalhe.Close;
    Exit;
  End Else Begin
    sbtnInsDet.Enabled    := True;
  End;

  FazQuery(QryDetalhe,
                     ' SELECT                                                   '+
                     '       CODTABCLASSINV,                                    '+
                     '       CODCLASSINVEST,                                    '+
                     '       IDCARTEIRAINVEST,                                  '+
                     '       IDINVESTIMENTO,                                    '+
                     '       DTENQUADRA                                         '+
                     ' FROM                                                     '+
                     '       CLASSINVxINVEST                                    '+
                     ' WHERE                                                    '+
                     '      (IDINVESTIMENTO  IN (SELECT DISTINCT                '+
                     '                                IDINVESTIMENTO            '+
                     '                           FROM                           '+
                     '                                 INVESTIMENTO             '+
                     '                           WHERE                          '+
                     '                                 IDTIPOINVEST = '''+
                            QryBuscaTipoInvestimento.FieldByName('IDTIPOINVEST').AsString+''')) AND '+
                     '      (CODTABCLASSINV   = '''+
                            QryBuscaTabelaClassif.FieldByName('CODTABCLASSINV').AsString+''') AND '+
                     '     (IDCARTEIRAINVEST= '''+
                            QryCarteira.FieldByName('IDCARTEIRAINVEST').AsString        +''') ');
end;

end.
