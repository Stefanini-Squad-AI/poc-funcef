(*******************************************************************************
 11/01/1999
  Erro ao confirmar a inclusão do documento
 09/03/1999 - 02.05.08
  Alteração no Grid dos Documentos Pendentes e do Lote para exibir em vermelho os
  Documentos Atrasados e Exibição dos Complementos Documentos do Clientes;
  Alteração na Query Dos Lostes para Exibição do Complemento do Documento;
  Verificação do Cálculos dos Saldos, excluindo os Saldos Zerados e Alterando
  Rotina Pois Quando Deletava Saldo Zerado não calculava o saldo do anterior;
 01/11/1999 - 2.14.10
   Possibilitar a alteração do lote qdo o lançamento no financeiro for exclusivamente
   na baixa do documento e o cheque não for contabilizado no momento da emissão
 19/07/2002 - 3.01.44 - Fábio Barros
   Migração deste módulo para o modelo 3 Camadas
*******************************************************************************)

unit FAlteraLoteMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Db, DBTables, Wwquery, StdCtrls, wwdblook, Grids, Wwdbigrd, uCtrlParamIntegra,
  Wwdbgrid, MAHlpBtn, Buttons, TB97, ExtCtrls, Wwdatsrc, uSistema, uMensErro,
  TB97Tlbr, TB97Ctls, MontaSelect, IvDictio,
  IvMulti, IvEMulti, CMProcuraSubTipo, FProcuraCliForDlg, uCtrlAlteraLote,
  wwdbdatetimepicker, CMDateTimePicker, DBClient, uCMClientDataSet,
  uCtrlDocumento;

type
  TFrmAlteraLoteMT = class(TFrmProcuraCliForDlg)
    Panel2: TPanel;
    dbgrdLotePagto: TwwDBGrid;
    dbgrdDocumentos: TwwDBGrid;
    dslotexdocum: TwwDataSource;
    dsdocumento: TwwDataSource;
    Panel1: TPanel;
    bbtnincluir: TBitBtn;
    bbtnExcluir: TBitBtn;
    bbtnConfirma: TBitBtn;
    Panel3: TPanel;
    lblDataProgramada: TLabel;
    dtedDataProg: TCMDateTimePicker;
    lblDocumento: TLabel;
    bbtnSelecionaDoc: TToolbarButton97;
    Label3: TLabel;
    BtnCancela: TBitBtn;
    Panel8: TPanel;
    Pnldocpago: TPanel;
    dblkcmbloteIni: TwwDBLookupCombo;
    LckDoc: TwwDBLookupCombo;
    cdsDocPendentes: TCMClientDataSet;
    cdsLotePagto: TCMClientDataSet;
    cdsDocumentos: TCMClientDataSet;
    cdsLotexDocum: TCMClientDataSet;
    qryDocumentos: TwwQuery;
    qryDocumentosNOME: TStringField;
    qryDocumentosNODOCUMENTO: TFloatField;
    qryDocumentosCOMPLDOCUMENTO: TStringField;
    qryDocumentosDATAPROGRAMADA: TDateTimeField;
    qryDocumentosDATAVENCTO: TDateTimeField;
    qryDocumentosSALDO: TFloatField;
    qryDocumentosDOCUMENTO: TStringField;
    qryDocumentosIDPESSOA: TFloatField;
    qryDocumentosCODDOCUMENTO: TFloatField;
    qryDocumentosRECPAG: TStringField;
    qryDocumentosSTATUS: TStringField;
    qryDocumentosIDFORCLI: TFloatField;

    procedure dbgrdDocumentosMultiSelectRecord(Grid: TwwDBGrid;
      Selecting: Boolean; var Accept: Boolean);

    procedure bbtnExcluirClick(Sender: TObject);

    procedure bbtnConfirmaClick(Sender: TObject);

    procedure dbgrdLotePagtoMultiSelectRecord(Grid: TwwDBGrid;
      Selecting: Boolean; var Accept: Boolean);

    procedure dblkcmbloteIni1CloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);

    procedure BtnCancelaClick(Sender: TObject);
    procedure dbgrdDocumentosCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);

    procedure bbtnincluirClick(Sender: TObject);
    procedure bbtnSelecionaDocClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    _AlteraLote : TCtrlAlteraLote;
    _Documento  : TCtrlDocumento;
    procedure Calcula_Saldo;
  public
    { Public declarations }
  end;

var
  FrmAlteraLoteMT: TFrmAlteraLoteMT;

implementation
Uses   UDataBase, DBaseDados, uModulo;
{$R *.DFM}



procedure TFrmAlteraLoteMT.bbtnSelecionaDocClick(Sender: TObject);
var
  sDocSelecionado : String;
  iIDCliente      : Integer;
begin
  inherited;

  if Trim(dblkcmbloteIni.Text) = '' then
  begin
    Msgdlg('Não Há Lote para ser alterado','Atenção!', mtError, [mbOk], 0);
    Exit;
  end;

  bbtnIncluir.Enabled  := False;
  bbtnExcluir.Enabled  := False;
  bbtnConfirma.Enabled := False;
  btnCancela.Enabled   := False;

  iIDCliente      := 0;
  sDocSelecionado := '0';
  if (CPForCli.ForCliReg.RazaoSocial <> '') Then iIDCliente := CPForCli.ForCliReg.Id;
  if LckDoc.Text <> '' then  sDocSelecionado := LckDoc.LookupValue;

  cdsDocumentos.DisableControls;

  if cdsDocumentos.Active then cdsDocumentos.Close;
  cdsDocumentos.Data := _AlteraLote.ListDocum(Sistema.IDUsuario,
                                              iIDCliente,
                                              Sistema.IDEmpresa,
                                              ParamIntegra.RecPag,
                                              sDocSelecionado,
                                              dtedDataProg.Text);
  Calcula_Saldo;
  cdsDocumentos.EnableControls;
  if (not cdsDocumentos.IsEmpty) and (not cdsLotexDocum.IsEmpty) then
  begin
    bbtnIncluir.Enabled := True;
    bbtnExcluir.Enabled := True;
  end;
end;

procedure TFrmAlteraLoteMT.bbtnincluirClick(Sender: TObject);
var
   i : integer;
begin
  inherited;
  if (Sistema.UsaRAD) and (Modulo.ProcessoRadLiberado(cdsLotePagto.FieldByName('NUMLOTE').AsInteger)) then
  begin
    Msgdlg('Este lote já foi autorizado. Não é possível inserir documentos no mesmo.','Aviso',mterror,[mbOk],0);
    Exit;
  end;

  if Trim(dblkcmbloteIni.Text) = '' then Exit;

  if (dbgrdDocumentos.SelectedList.count)>0 then
  begin
    bbtnincluir.Enabled := False;
    cdsdocumentos.DisableControls;
    cdslotexdocum.DisableControls;
    for i := 0 to (dbgrdDocumentos.SelectedList.count-1) do
    begin
      dbgrdDocumentos.datasource.dataset.GotoBookmark(dbgrdDocumentos.SelectedList.items[i]);
      dbgrdDocumentos.datasource.dataset.FreeBookmark(dbgrdDocumentos.SelectedList.items[i]);

      cdslotexdocum.Insert;
      cdslotexdocum.FieldByName('NUMLOTE').AsInteger          := strtoint(dblkcmbloteIni.text);
      cdslotexdocum.FieldByName('CODDOCUMENTO').ASinteger     := cdsDocumentos.FieldByName('CODDOCUMENTO').Asinteger;
      cdslotexdocum.FieldByName('NODOCUMENTO').AsFloat        := cdsDocumentos.FieldByName('NODOCUMENTO').AsFloat;
      cdslotexdocum.FieldByName('COMPLDOCUMENTO').AsString    := cdsDocumentos.FieldByName('COMPLDOCUMENTO').AsString;
      cdslotexdocum.FieldByName('DATAPROGRAMADA').AsDateTime  := cdsDocumentos.FieldByName('DATAPROGRAMADA').AsDateTime;
      cdslotexdocum.FieldByName('DATAVENCTO').AsDateTime      := cdsDocumentos.FieldByName('DATAVENCTO').AsDateTime;
      cdslotexdocum.FieldByName('VALOR').AsFloat              := cdsDocumentos.FieldByName('SALDO').AsFloat;
      cdslotexdocum.FieldByName('NOME').Asstring              := cdsDocumentos.FieldByName('NOME').Asstring ;
      cdslotexdocum.Post;
      cdsdocumentos.Delete;
    end;
    dbgrdDocumentos.SelectedList.clear;
    cdsdocumentos.EnableControls;
    cdslotexdocum.EnableControls;
    bbtnConfirma.Enabled := True;
    btnCancela.Enabled  := True;
  end;
end;

procedure TFrmAlteraLoteMT.dbgrdDocumentosMultiSelectRecord(Grid: TwwDBGrid;
  Selecting: Boolean; var Accept: Boolean);
begin
  inherited;
  if ((dbgrdDocumentos.SelectedList.count>0) or (dbgrdDocumentos.SelectedList.count = 0)) then
  begin
    bbtnIncluir.Enabled  := True;
    bbtnConfirma.Enabled := True;
    bbtnExcluir.Enabled  := False;
    BtnCancela.Enabled   := True;
  end;
end;

procedure TFrmAlteraLoteMT.bbtnExcluirClick(Sender: TObject);
var
  i: integer;
begin
  inherited;
  if (dbgrdLotePagto.SelectedList.count)>0 then
  begin

    bbtnExcluir.Enabled := False;
    for i := 0 to (dbgrdLotePagto.SelectedList.count-1) do
    begin
      dbgrdLotePagto.datasource.dataset.GotoBookmark(dbgrdLotePagto.SelectedList.items[i]);
      dbgrdLotePagto.datasource.dataset.FreeBookmark(dbgrdLotePagto.SelectedList.items[i]);
      // insere novamente documento nas pendencias
      cdsDocumentos.Insert;
      cdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger     := cdsLoteXDocum.FieldByName('CODDOCUMENTO').AsInteger;
      cdsDocumentos.FieldByName('NODOCUMENTO').AsFloat        := cdsLoteXDocum.FieldByName('NODOCUMENTO').AsFloat;
      cdsDocumentos.FieldByName('COMPLDOCUMENTO').AsString    := cdsLoteXDocum.FieldByName('COMPLDOCUMENTO').AsString;
      cdsDocumentos.FieldByName('DATAPROGRAMADA').AsDateTime  := cdsLoteXDocum.FieldByName('DATAPROGRAMADA').AsDateTime;
      cdsDocumentos.FieldByName('DATAVENCTO').AsDateTime      := cdsLoteXDocum.FieldByName('DATAVENCTO').AsDateTime ;
      cdsDocumentos.FieldByName('SALDO').AsFloat              := cdsLoteXDocum.FieldByName('VALOR').AsFloat;
      cdsDocumentos.FieldByName('NOME').AsString              := cdsLoteXDocum.FieldByName('NOME').AsString;
      cdsDocumentos.Post;
      cdsLotexDocum.Delete;
    end;
    dbgrdLotePagto.SelectedList.clear; // Limpa selecao no grid
    if cdsLotexDocum.RecordCount = 0 then
      cdsLotePagto.Delete; // lote fica vazio entao e deletado
    bbtnConfirma.Enabled := True;
    btnCancela.Enabled  := True;
  end;
end;

procedure TFrmAlteraLoteMT.Calcula_saldo;
var
  icodigo: integer;
  rsaldo: real;
begin
  if not cdsDocumentos.EOF then
    while not(cdsDocumentos.EOF) do
    begin
      icodigo          := cdsDocumentos.FieldByName('CODDOCUMENTO').Asinteger;
      _Documento.Saldo.CalculaSaldo(iCodigo);
      rSaldo           := _Documento.Saldo.Valor;
      if Format('%17.2f',[rSaldo]) <> Format('%17.2f',[Modulo.ValorZero]) then
      begin
        cdsDocumentos.Edit;
        cdsDocumentos.FieldByName('SALDO').AsFloat := rSaldo;
        cdsDocumentos.post;
        cdsDocumentos.Next;
      end
      else
        cdsDocumentos.Delete;
    end;
end;


procedure TFrmAlteraLoteMT.bbtnConfirmaClick(Sender: TObject);
begin
  inherited;
  try
  bbtnIncluir.Enabled      := False;
  bbtnExcluir.Enabled      := False;
  bbtnConfirma.Enabled     := False;
  BtnCancela.Enabled       := False;
  bbtnSelecionaDoc.Enabled := True;
  _AlteraLote.GravaLotexDocum(cdsLotexDocum.Data);
//    dtmBaseDados.dbBaseDados.ApplyUpdates([qryLotexDocum]);
  Msgdlg('Lote alterado com sucesso', 'Atenção!', mtInformation, [mbOk], 0);
  except
     raise;
  end;
end;




procedure TFrmAlteraLoteMT.dbgrdLotePagtoMultiSelectRecord(Grid: TwwDBGrid;
  Selecting: Boolean; var Accept: Boolean);
begin
  inherited;
  if  ((dbgrdLotePagto.SelectedList.count>0) or (dbgrdLotePagto.SelectedList.count = 0)) then
  begin
    bbtnConfirma.enabled := True;
    bbtnExcluir.enabled  := True;
    bbtnIncluir.enabled  := False;
    BtnCancela.enabled   := True;
  end;
end;

procedure TFrmAlteraLoteMT.dblkcmbloteIni1CloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if trim(dblkcmbloteIni.Text) <> '' then
    cdsLotexDocum.Data := _AlteraLote.ListLotexDocum(Sistema.IDEmpresa,
                                                     ParamIntegra.RecPag, dblkcmbloteIni.Text);
end;

procedure TFrmAlteraLoteMT.BtnCancelaClick(Sender: TObject);
begin
  inherited;
  bbtnIncluir.Enabled      := False;
  bbtnExcluir.Enabled      := False;
  bbtnConfirma.Enabled     := False;
  BtnCancela.Enabled       := False;
  bbtnSelecionaDoc.enabled := True;

  if cdsLoteXDocum.Active then cdsLoteXDocum.Close;
  cdsLoteXDocum.Data := _AlteraLote.ListLotexDocumEmpty;

  if cdsDocumentos.Active then cdsDocumentos.Close;
  cdsDocumentos.Data := _AlteraLote.ListDocumento;
end;

procedure TFrmAlteraLoteMT.dbgrdDocumentosCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if (not (Sender as TwwDbGrid).DataSource.DataSet.IsEmpty) and
     ((Sender As TwwDbGrid).DataSource.DataSet.FieldByName('DATAPROGRAMADA').AsDateTime < Date) then
  begin
    if (Field.FieldName = 'SALDO') or (Field.FieldName = 'VALOR') then
    begin
      AFont.Color  := $0080FFFF;
      ABrush.Color := ClRed;
    end;
  end
  else
  if (Field.FieldName = 'SALDO') OR (Field.FieldName = 'VALOR') then
  begin
    AFont.Color  := clNavy;
    ABrush.Color := $0080FFFF; {Amarelo claro}
  end;
end;

procedure TFrmAlteraLoteMT.FormCreate(Sender: TObject);
begin
  inherited;
  _AlteraLote          := TCtrlAlteraLote.Create;
  _Documento           := TCtrlDocumento.Create;
  _AlteraLote.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  _Documento.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  cdsDocPendentes.Data := _AlteraLote.ListDocPendentes(Sistema.IDEmpresa, ParamIntegra.RecPag);
  cdsLotePagto.Data    := _AlteraLote.ListLotePagto(Sistema.IdEmpresa, Sistema.IDUsuario,
                                                    ParamIntegra.RecPag,
                                                    ParamIntegra.IntegraFinanceiro);
  cdsDocumentos.Data   := _AlteraLote.ListDocumento;
  cdsLoteXDocum.Data   := _AlteraLote.ListLotexDocumEmpty;
end;

procedure TFrmAlteraLoteMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  _AlteraLote.Free;
  _Documento.Free;
end;

end.

