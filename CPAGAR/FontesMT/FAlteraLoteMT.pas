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
  uCtrlDocumento, uCmSqlParams, uCtrlBaixaDocumentos; //andré tavares - pendência 24357 - 31/01/2007

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
    Panel3: TPanel;
    lblDataProgramada: TLabel;
    dtedDataProg: TCMDateTimePicker;
    lblDocumento: TLabel;
    bbtnSelecionaDoc: TToolbarButton97;
    Panel8: TPanel;
    Pnldocpago: TPanel;
    LckDoc: TwwDBLookupCombo;
    cdsDocPendentes: TCMClientDataSet;
    cdsLotePagto: TCMClientDataSet;
    cdsDocumentos: TCMClientDataSet;
    cdsLotexDocum: TCMClientDataSet;
    cdsLotexDocumNOME: TStringField;
    cdsLotexDocumDATAPROGRAMADA: TDateTimeField;
    cdsLotexDocumDATAVENCTO: TDateTimeField;
    cdsLotexDocumNODOCUMENTO: TFloatField;
    cdsLotexDocumCOMPLDOCUMENTO: TStringField;
    cdsLotexDocumVALOR: TFloatField;
    cdsLotexDocumNUMBANCO: TStringField;
    cdsLotexDocumNUMAGENCIA: TStringField;
    cdsLotexDocumCONTACORRENTE: TStringField;
    cdsLotexDocumPLANOPREV: TStringField;
    cdsDocumentosNOME: TStringField;
    cdsDocumentosDATAPROGRAMADA: TDateTimeField;
    cdsDocumentosDATAVENCTO: TDateTimeField;
    cdsDocumentosNODOCUMENTO: TFloatField;
    cdsDocumentosCOMPLDOCUMENTO: TStringField;
    cdsDocumentosVALOR: TFloatField;
    cdsDocumentosNUMBANCO: TStringField;
    cdsDocumentosNUMAGENCIA: TStringField;
    cdsDocumentosCONTACORRENTE: TStringField;
    cdsDocumentosPLANOPREV: TStringField;
    cdsDocumentosCODDOCUMENTO: TFloatField;
    cdsLotexDocumIDPESSOA: TFloatField;
    cdsLotexDocumCODDOCUMENTO: TFloatField;
    cdsLotexDocumSALDO: TFloatField;
    cdsDocumentosSALDO: TFloatField;
    cdsLotexDocumNUMLOTE: TFloatField;
    cdsDocumentosNUMLOTE: TFloatField;
    verificaradLote: TCMSqlParams;
    cdsVerificaradlote: TCMClientDataSet;
    cdsLotexDocumCODPORTFORMA: TFloatField;
    bbtnConfirma: TBitBtn;
    BtnCancela: TBitBtn;
    dblkcmbloteIni: TwwDBLookupCombo;
    Label3: TLabel;
    Splitter1: TSplitter;

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
    procedure dbgrdDocumentosTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure dbgrdLotePagtoTitleButtonClick(Sender: TObject;
      AFieldName: String);
  private
    { Private declarations }
    _CtrlBaixaDocumentos : TCtrlBaixaDocumentos; //andré tavares - pendência 24357 - 31/01/2007
    _codportForma :integer;
    _AlteraLote : TCtrlAlteraLote;
    _Documento  : TCtrlDocumento;
    iOrdem : integer;
    _numLote: integer;
    procedure Calcula_Saldo;
  public
    { Public declarations }
  end;

var
  FrmAlteraLoteMT: TFrmAlteraLoteMT;

implementation

Uses   UDataBase, DBaseDados, uModulo, JclMath;

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
   bDocumentoPPDiferente : boolean;
begin
  inherited;

  if Trim(dblkcmbloteIni.Text) = '' then Exit;

  if (dbgrdDocumentos.SelectedList.count)>0 then
  begin
    bbtnincluir.Enabled := False;
    cdsdocumentos.DisableControls;
    cdslotexdocum.DisableControls;

    bDocumentoPPDiferente := false;
    for i := 0 to (dbgrdDocumentos.SelectedList.count-1) do
    begin
      dbgrdDocumentos.datasource.dataset.GotoBookmark(dbgrdDocumentos.SelectedList.items[i]);
      dbgrdDocumentos.datasource.dataset.FreeBookmark(dbgrdDocumentos.SelectedList.items[i]);

      //andré tavares - pendência 24357 - 31/01/2007 - só inclui o documento se passar por esta crítica
      if _CtrlBaixaDocumentos.VerificaPortadorContaXPlano(cdsDocumentos.FieldByName('CODDOCUMENTO').Asinteger, _codPortForma) then
      begin
        cdslotexdocum.Insert;
        cdslotexdocum.FieldByName('NUMLOTE').AsInteger          := strtoint(dblkcmbloteIni.text);
        cdslotexdocum.FieldByName('CODDOCUMENTO').ASinteger     := cdsDocumentos.FieldByName('CODDOCUMENTO').Asinteger;
        cdslotexdocum.FieldByName('NODOCUMENTO').AsFloat        := cdsDocumentos.FieldByName('NODOCUMENTO').AsFloat;
        cdslotexdocum.FieldByName('COMPLDOCUMENTO').AsString    := cdsDocumentos.FieldByName('COMPLDOCUMENTO').AsString;
        cdslotexdocum.FieldByName('DATAPROGRAMADA').AsDateTime  := cdsDocumentos.FieldByName('DATAPROGRAMADA').AsDateTime;
        cdslotexdocum.FieldByName('DATAVENCTO').AsDateTime      := cdsDocumentos.FieldByName('DATAVENCTO').AsDateTime;
        cdslotexdocum.FieldByName('VALOR').AsFloat              := cdsDocumentos.FieldByName('SALDO').AsFloat;
        cdslotexdocum.FieldByName('NOME').Asstring              := cdsDocumentos.FieldByName('NOME').Asstring ;

        //início - andré tavares - pendência 23734 - 16/11/2006 - Incluir 4 colunas na grade: plano, banco, agência e conta. Similar a tela de criação do lote.
        cdslotexdocum.FieldByName('VALOR').AsFloat              := cdsDocumentos.FieldByName('VALOR').AsFloat;
        cdslotexdocum.FieldByName('NUMBANCO').AsString          := cdsDocumentos.FieldByName('NUMBANCO').AsString;
        cdslotexdocum.FieldByName('NUMAGENCIA').AsString        := cdsDocumentos.FieldByName('NUMAGENCIA').AsString;
        cdslotexdocum.FieldByName('CONTACORRENTE').AsString     := cdsDocumentos.FieldByName('CONTACORRENTE').AsString;
        cdslotexdocum.FieldByName('PLANOPREV').AsString         := cdsDocumentos.FieldByName('PLANOPREV').AsString;
        //fim - andré tavares - pendência 23734 - 16/11/2006

        cdslotexdocum.Post;
        cdsdocumentos.Delete;
      end//if
      else
      begin
        cdsDocumentos.Edit;
        cdsDocumentos.FieldByName('NUMLOTE').AsInteger := -1;
        cdsDocumentos.Post;
        bDocumentoPPDiferente := true;
      end;//else  
    end;//for

    //andré tavares - pendência 24357 - 31/01/2007
    if bDocumentoPPDiferente then
    begin
      Msgdlg('Um ou mais documentos selecionados possuem rateios cujos planos previdenciários'+#13+
             'contábeis não estão relacionados à Conta Caixa X Forma de Pagamento selecionada.',
             'Atenção!',mtInformation,[mbOk],0);

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

      //início - andré tavares - pendência 23734 - 16/11/2006 - Incluir 4 colunas na grade: plano, banco, agência e conta. Similar a tela de criação do lote.
      cdsDocumentos.FieldByName('VALOR').AsFloat              := cdsLoteXDocum.FieldByName('VALOR').AsFloat;
      cdsDocumentos.FieldByName('NUMBANCO').AsString          := cdsLoteXDocum.FieldByName('NUMBANCO').AsString;
      cdsDocumentos.FieldByName('NUMAGENCIA').AsString        := cdsLoteXDocum.FieldByName('NUMAGENCIA').AsString;
      cdsDocumentos.FieldByName('CONTACORRENTE').AsString     := cdsLoteXDocum.FieldByName('CONTACORRENTE').AsString;
      cdsDocumentos.FieldByName('PLANOPREV').AsString         := cdsLoteXDocum.FieldByName('PLANOPREV').AsString;
      //fim - andré tavares - pendência 23734 - 16/11/2006

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
      if not IsFloatZero(rSaldo) then
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

{pendência 26773 - 20/11/2007 - esta crítica agora é feita internamente no método _AlteraLote.GravaLotexDocum
  verificaradLote.Prepare;
  verificaradLote.paramByName('NUMLOTE').asInteger := strToIntDef(dblkcmbloteIni.LookupValue, -1);
  verificaradLote.Open;
  if not cdsVerificaradlote.fieldByName('IDPROCESSO').isNull then
    if (Sistema.UsaRAD) and (Modulo.ProcessoRadLiberado(strToIntDef(dblkcmbloteIni.LookupValue, -1))) then
    begin
      cdsDocumentos.CancelUpdates;
      cdsLotexDocum.CancelUpdates;
      Msgdlg('Este lote já foi autorizado. Não é possível inserir documentos no mesmo.','Aviso',mterror,[mbOk],0);
      Exit;
    end;
}

  inherited;
  bbtnIncluir.Enabled      := False;
  bbtnExcluir.Enabled      := False;
  bbtnConfirma.Enabled     := False;
  BtnCancela.Enabled       := False;
  bbtnSelecionaDoc.Enabled := True;

  //Rodolpho da Silva - P: 24671 - 13/03/2007
  if not _AlteraLote.GravaLotexDocum(cdsLotexDocum.Data, sistema.idEmpresa, sistema.IdUsuario, _numLote) then
     MsgDlg('Houve um erro ao alterar o lote. ' +
            'Mensagem: ' + _AlteraLote.MessageInfo,'Erro',mtError,[mbOk],0)
  else
  begin
     Msgdlg('Lote ' + dblkcmbloteIni.LookupValue + ' alterado com sucesso', 'Atenção!', mtInformation, [mbOk], 0);
     dblkcmbloteIni.Clear;
     BtnCancela.Click;
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

  _codportForma := cdsLotePagto.fieldByName('CODPORTFORMA').asInteger; //andré tavares - pendência 24357 - 31/01/2007
  _numLote := cdsLotexDocum.fieldByName('NUMLOTE').asInteger;
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

  //andré tavares - pendência 24357 - 31/01/2007 - marca o documento em cinza para que o usuário não o seleicione para este lote
  if ((Sender As TwwDbGrid).DataSource.DataSet.FindField ('NUMLOTE') <> nil) then
    if (Not (Sender As TwwDbGrid).DataSource.DataSet.IsEmpty) And
       ((Sender As TwwDbGrid).DataSource.DataSet.FieldByName('NUMLOTE').asInteger = -1) then
    begin
       AFont.Color := clGrayText;
    end;

end;

procedure TFrmAlteraLoteMT.FormCreate(Sender: TObject);
begin
  inherited;
  _numLote := 0;
  _CtrlBaixaDocumentos := TCtrlBaixaDocumentos.Create; //andré tavares - pendência 24357 - 31/01/2007
  _codportForma        := 0;
  _AlteraLote          := TCtrlAlteraLote.Create;
  _Documento           := TCtrlDocumento.Create;

  _CtrlBaixaDocumentos.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);; //andré tavares - pendência 24357 - 31/01/2007
  _AlteraLote.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  _Documento.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  cdsDocPendentes.Data := _AlteraLote.ListDocPendentes(Sistema.IDEmpresa, ParamIntegra.RecPag);
  cdsLotePagto.Data    := _AlteraLote.ListLotePagto(Sistema.IdEmpresa, Sistema.IDUsuario,
                                                    ParamIntegra.RecPag,
                                                    ParamIntegra.IntegraFinanceiro);

  cdsDocumentos.Data   := _AlteraLote.ListDocumento;
  cdsLoteXDocum.Data   := _AlteraLote.ListLotexDocumEmpty;

// Daniel Simões - 26/01/2006 - Início------------------------------------------
  if ParamIntegra.Recpag = 'P' then
  begin
    HelpContext           := 30024;
    bbtnAjuda.HelpContext := 30024;
  end;
// Daniel Simões - 26/01/2006 - Fim---------------------------------------------

end;

procedure TFrmAlteraLoteMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  _CtrlBaixaDocumentos.Free; //andré tavares - pendência 24357 - 31/01/2007
  _AlteraLote.Free;
  _Documento.Free;
end;

procedure TFrmAlteraLoteMT.dbgrdDocumentosTitleButtonClick(Sender: TObject;
  AFieldName: String);
var
  IndexDef : TIndexDef;

begin
  inherited;
  if ( iOrdem = 0 ) or ( iOrdem = 2 ) then
    iOrdem := 1
  else
    iOrdem := 2;

  cdsDocumentos.IndexName := '';
  cdsDocumentos.IndexDefs.Clear;
  IndexDef := cdsDocumentos.IndexDefs.AddIndexDef;
  IndexDef.Name := 'i' + IntToStr( GetTickCount );

  if iOrdem = 1 then
  begin
    IndexDef.Fields := AFieldName;
    IndexDef.DescFields := '';
    IndexDef.Options := [];
  end
  else
  begin
    IndexDef.Fields := AFieldName;
    IndexDef.DescFields := AFieldName;
    IndexDef.Options := [ixDescending];
  end;

  cdsDocumentos.IndexName := IndexDef.Name;
  cdsDocumentos.First;
end;

procedure TFrmAlteraLoteMT.dbgrdLotePagtoTitleButtonClick(Sender: TObject;
  AFieldName: String);
var
  IndexDef : TIndexDef;

begin
  inherited;
  if ( iOrdem = 0 ) or ( iOrdem = 2 ) then
    iOrdem := 1
  else
    iOrdem := 2;

  cdsLotexDocum.IndexName := '';
  cdsLotexDocum.IndexDefs.Clear;
  IndexDef := cdsLotexDocum.IndexDefs.AddIndexDef;
  IndexDef.Name := 'i' + IntToStr( GetTickCount );

  if iOrdem = 1 then
  begin
    IndexDef.Fields := AFieldName;
    IndexDef.DescFields := '';
    IndexDef.Options := [];
  end
  else
  begin
    IndexDef.Fields := AFieldName;
    IndexDef.DescFields := AFieldName;
    IndexDef.Options := [ixDescending];
  end;

  cdsLotexDocum.IndexName := IndexDef.Name;
  cdsLotexDocum.First;
end;

end.

