unit FCadClassifXTipoTitulo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, wwdblook, DBGrids, IvDictio,
  IvMulti, IvEMulti, Mask, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, ImgList;

type
  TFrmCadClassifXTipoTitulo = class(TfrmCadMestreDetalheCS)
    QryBuscaTipoInvestimento: TwwQuery;
    QryBuscaTabelaClassif: TwwQuery;
    QryAux: TwwQuery;
    Label1: TLabel;
    Label2: TLabel;
    DbLkcTipoInvestimento: TwwDBLookupCombo;
    DbLkcTabelaClassif: TwwDBLookupCombo;
    QryBuscaTipoTitulo: TwwQuery;
    QryBuscaClassificacao: TwwQuery;
    DbLkcTipoTituloAcao: TwwDBLookupCombo;
    Label3: TLabel;
    DbLkcTipoTituloRendaFixa: TwwDBLookupCombo;
    QryDetalhe: TwwQuery;
    QryDetalheCODTIPTITULO: TStringField;
    QryDetalheCODTABCLASSINV: TStringField;
    QryDetalheCODCLASSINVEST: TStringField;
    QryDetalheIDTIPOINVEST: TFloatField;
    QryDetalheDESCTIPOTITULO: TStringField;
    QryDetalheDESCCLASSIFICACAO: TStringField;
    DbLckClassificacao: TwwDBLookupCombo;
    Label4: TLabel;
    SB1: TSpeedButton;
    DBDateEdit1: TCMDateTimePicker;
    Label5: TLabel;
    QryDetalheDTENQUADRA: TDateTimeField;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadClassifXTipoTitulo: TFrmCadClassifXTipoTitulo;

implementation

{$R *.DFM}

Uses UBibliotecaInvest, FBuscaClassif, UMensErro;

Var
  wTipo : Char;

procedure TFrmCadClassifXTipoTitulo.FormShow(Sender: TObject);
begin
  inherited;

  QryBuscaTabelaClassif.Open;
  QryBuscaTipoInvestimento.Open;
  QryDetalhe.Open;

  SbtnInserir.Enabled  := False;
  SbtnProcurar.Enabled := True;

  sbtnInsDet.Enabled    := False;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;
  PnlMestre.Enabled     := True;

end;

procedure TFrmCadClassifXTipoTitulo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryBuscaTipoInvestimento.Close;
  QryBuscaTabelaClassif.Close;
  QryDetalhe.Close;
  QryBuscaTipoTitulo.Close;
  QryBuscaClassificacao.Close;
end;

procedure TFrmCadClassifXTipoTitulo.DbLkcTipoInvestimentoChange(
  Sender: TObject);
begin
  inherited;

  QryBuscaTipoTitulo.Close;
  QryBuscaTipoTitulo.ParamByName('IDTIPOINVEST').AsInteger   :=
    QryBuscaTipoInvestimento.FieldByName('IDTIPOINVEST').AsInteger;
  QryBuscaTipoTitulo.Open;

  QryDetalhe.Close;

  If QryBuscaTipoInvestimento.FieldByName('IDTIPOINVEST').AsInteger = 1 Then
  Begin
     DbLkcTipoTituloAcao.Selected.Clear;
     DbLkcTipoTituloAcao.Selected.Add('DESCTIPRENFIXA'+#9+'40'+#9+'Tipo de Titulo');
     QryDetalheDESCTIPOTITULO.LookupResultField := 'DESCTIPRENFIXA';
  End
  Else If QryBuscaTipoInvestimento.FieldByName('IDTIPOINVEST').AsInteger = 2 Then
  Begin
    DbLkcTipoTituloAcao.Selected.Clear;
    DbLkcTipoTituloAcao.Selected.Add('DESCTIPOACAO'+#9+'40'+#9+'Tipo de Titulo');
    QryDetalheDESCTIPOTITULO.LookupResultField := 'DESCTIPOACAO';
  End;

  If (Trim(DbLkcTabelaClassif.Text) = '') Or (Trim(DbLkcTipoInvestimento.Text) = '') Then
  Begin
     sbtnInsDet.Enabled    := False;
     QryDetalhe.Close;
     Exit;
  End
  Else
     sbtnInsDet.Enabled    := True;


  FazQuery(QryDetalhe,'SELECT CODTIPTITULO, CODTABCLASSINV, CODCLASSINVEST, IDTIPOINVEST, DTENQUADRA '+
                      'FROM 	CLASSINVXTIPTIT '   +
                      'WHERE 	(CODTABCLASSINV = '''+
                       QryBuscaTabelaClassif.FieldByName('CODTABCLASSINV').AsString+''')  AND '+
                      '        (IDTIPOINVEST   = '''+
                       QryBuscaTipoInvestimento.FieldByName('IDTIPOINVEST').AsString+''') ');
end;

procedure TFrmCadClassifXTipoTitulo.DbLkcTabelaClassifChange(
  Sender: TObject);
begin
  inherited;

  FazQuery(QryBuscaClassificacao,'SELECT CODTABCLASSINV, CODCLASSINVEST, DESCCLASSINVEST '+
                                 'FROM CLASSIFINVEST '+
                                 'WHERE (CODTABCLASSINV = '''+
                                 QryBuscaTabelaClassif.FieldByName('CODTABCLASSINV').AsString+''') '+
                                 'ORDER BY DESCCLASSINVEST ');

  If (Trim(DbLkcTabelaClassif.Text) = '') Or (Trim(DbLkcTipoInvestimento.Text) = '') Then
  Begin
     sbtnInsDet.Enabled    := False;
     QryDetalhe.Close;
     Exit;
  End
  Else
    sbtnInsDet.Enabled    := True;

  FazQuery(QryDetalhe,'SELECT CODTIPTITULO, CODTABCLASSINV, CODCLASSINVEST, IDTIPOINVEST, DTENQUADRA '+
                      'FROM 	CLASSINVXTIPTIT '+
                      'WHERE 	(CODTABCLASSINV = '''+
                       QryBuscaTabelaClassif.FieldByName('CODTABCLASSINV').AsString+''')  AND '+
                      '        (IDTIPOINVEST   = '''+
                       QryBuscaTipoInvestimento.FieldByName('IDTIPOINVEST').AsString+''') ');
end;

procedure TFrmCadClassifXTipoTitulo.bbtnOkDetClick(Sender: TObject);
begin
  If sbtnInsDet.Down = True Then
  Begin
     QryDetalhe.FieldByName('IDTIPOINVEST').AsInteger  := QryBuscaTipoInvestimento.FieldByname('IDTIPOINVEST').AsInteger;
     QryDetalhe.FieldByName('CODTABCLASSINV').AsString := QryBuscaTabelaClassif.FieldByname('CODTABCLASSINV').AsString;
  End;

  Inherited;

  SbtnInserir.Enabled  := False;
  SbtnProcurar.Enabled := False;

  If wTipo = 'A' Then
  Begin
    DbLkcTipoInvestimento.Enabled := True;
    DbLkcTabelaClassif.Enabled    := True;

    sbtnInsDet.Enabled    := True;
    sbtnAltDet.Enabled    := True;
    sbtnExcluiDet.Enabled := True;
  End;
  PnlMestre.Enabled     := True;
end;

procedure TFrmCadClassifXTipoTitulo.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;

  SbtnInserir.Enabled  := False;
  SbtnProcurar.Enabled := False;

  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;

  DbLkcTipoInvestimento.Enabled := True;
  DbLkcTabelaClassif.Enabled    := True;

  If sbtnInsDet.Enabled = False Then
  Begin
     sbtnInsDet.Enabled := True;
     QryDetalhe.Close;
     QryDetalhe.Open;
  End;
  PnlMestre.Enabled     := True;
end;

procedure TFrmCadClassifXTipoTitulo.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  SbtnInserir.Enabled  := False;
  SbtnProcurar.Enabled := False;

  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;

  DbLkcTipoInvestimento.Enabled := True;
  DbLkcTabelaClassif.Enabled    := True;

  If sbtnInsDet.Enabled = False Then
  Begin
     sbtnInsDet.Enabled := True;
     QryDetalhe.Close;
     QryDetalhe.Open;
  End;
  PnlMestre.Enabled     := True;
end;

procedure TFrmCadClassifXTipoTitulo.sbtnExcluiDetClick(Sender: TObject);
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

procedure TFrmCadClassifXTipoTitulo.sbtnAltDetClick(Sender: TObject);
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
  If QryBuscaTipoInvestimento.FieldByName('IDTIPOINVEST').AsInteger = 1 Then
    DbLkcTipoTituloAcao.Text:=QryBuscaTipoTitulo.FieldByName('DESCTIPRENFIXA').AsString
  Else If QryBuscaTipoInvestimento.FieldByName('IDTIPOINVEST').AsInteger = 2 Then
    DbLkcTipoTituloAcao.Text:=QryBuscaTipoTitulo.FieldByName('DESCTIPOACAO').AsString;
end;

// Botao Pesquisar Classificação
procedure TFrmCadClassifXTipoTitulo.SB1Click(Sender: TObject);
begin
  inherited;
// Carrega Formulário de Consulta de Classificacoes
  Application.CreateForm(TFrmBuscaClassif, FrmBuscaClassif);
  FrmBuscaClassif.wCodTabelaClassif  :=
    QryBuscaTabelaClassif.FieldByName('CODTABCLASSINV').AsString;
  FrmBuscaClassif.wDescTabelaClassif :=
    QryBuscaTabelaClassif.FieldByName('DESCTABCLASSINV').AsString;
// Mostra Formulário
  FrmBuscaClassif.ShowModal;

// Busca Informação
  If FrmBuscaClassif.wClassifEscolhida <> '' Then
     QryDetalhe.FieldByName('CODCLASSINVEST').AsString :=  FrmBuscaClassif.wClassifEscolhida;
// Libera Formulario
  FrmBuscaClassif.Free;
end;

procedure TFrmCadClassifXTipoTitulo.sbtnInsDetClick(Sender: TObject);
begin
  inherited;

  DbLkcTipoInvestimento.Enabled := False;
  DbLkcTabelaClassif.Enabled    := False;

  wTipo:='I';

  QryDetalhe.FieldByName('DTENQUADRA').AsDateTime := Date;
end;

procedure TFrmCadClassifXTipoTitulo.FormCreate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled    := True;
end;

procedure TFrmCadClassifXTipoTitulo.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  PnlMestre.Enabled     := True;
end;

procedure TFrmCadClassifXTipoTitulo.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;
  If MontaSelect.RetornouValor Then Begin
    DbLkcTipoInvestimento.Value:=MontaSelect.ValoresChave[0];
    DbLkcTabelaClassif.Value   :=MontaSelect.ValoresChave[1];
  End;
  sbtnProcurar.Down:=False;
end;

end.
