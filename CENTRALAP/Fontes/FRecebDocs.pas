(*******************************************************************************
 Analista Responsável: André Cavalcante Tavares

 Objetivo do processo: Inserir no sistema os documentos entregues na fundação bem
 como indicar a seção de destino da documentação. Para ser possível faz-se necessário que
 o sistema cadastre uma RUB sem que haja um atendimento vinculado.

 Soclicidado por Flávio Dias PARA FUNDAÇÃO FCRT em 21/05/2002

 Início da Implementação: 21/05/2002
 Fim da Implementação: 04/06/2002
 Última Alteração:
*******************************************************************************)
unit FRecebDocs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, Mask, wwdbedit, uDataBase,
  uRubs, dBaseDados, UMensErro, ComCtrls, wwriched;

type
  TFrmRecebDocs = class(TfrmCadastroCS)
    DBEditMatr: TwwDBEdit;
    DBEditNome: TwwDBEdit;
    dbdataInclusao: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    BtnInclui: TSpeedButton;
    BtnIncluiTodos: TSpeedButton;
    BtnExcluiTodos: TSpeedButton;
    BtnExclui: TSpeedButton;
    GrdDocsSel: TwwDBGrid;
    GrdTipDesemb: TwwDBGrid;
    Panel5: TPanel;
    PnlTitDesemb: TPanel;
    DBEditSituacao: TwwDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Bevel1: TBevel;
    dblkBeneficio: TwwDBLookupCombo;
    dblkSitBenef: TwwDBLookupCombo;
    DSBeneficio: TwwDataSource;
    QryBeneficio: TwwQuery;
    QryBeneficioIDSERVICOS: TFloatField;
    QryBeneficioNOME: TStringField;
    DSsitBenef: TwwDataSource;
    qrySitBenef: TwwQuery;
    qrySitBenefIDSITBENEF: TFloatField;
    qrySitBenefDESCRICAO: TStringField;
    QrydocsXbenef: TwwQuery;
    QrydocsXbenefNOMEDOCUMENTO: TStringField;
    QrydocsXbenefIDBENEFICIO: TFloatField;
    QrydocsXbenefIDSITBENEF: TFloatField;
    DSdocsXbenef: TwwDataSource;
    UpdQryRubxBenef: TUpdateSQL;
    QryRubxBenef: TwwQuery;
    QryRubxBenefIDRUBXBENEFICIO: TFloatField;
    QryRubxBenefIDPESSJUR: TFloatField;
    QryRubxBenefIDPESSOA: TFloatField;
    QryRubxBenefIDPLANOPREV: TFloatField;
    QryRubxBenefIDBENEFICIO: TFloatField;
    QryRubxBenefIDRUBS: TFloatField;
    QryRubxBenefIDSITBENEF: TFloatField;
    QryRubxBenefIDTITULAR: TFloatField;
    UpdHistRubs: TUpdateSQL;
    qryTipodocXrub: TwwQuery;
    qryHistRubs: TwwQuery;
    qryHistRubsIDHISTMOVRUBS: TFloatField;
    qryHistRubsIDRUBS: TFloatField;
    qryHistRubsFLGSTATUS: TStringField;
    qryHistRubsHISTORICO: TMemoField;
    qryHistRubsDATAMOV: TDateTimeField;
    QryDocAssoc: TwwQuery;
    QryDocAssocIDDOCUMENTO: TFloatField;
    QryDocAssocNOMEDOCUMENTO: TStringField;
    qryConfigRubTitular: TwwQuery;
    qryConfigRubTitularDESCRUB: TStringField;
    qryConfigRubTitularIDCONFIGRUBS: TFloatField;
    UpdqryTipoDocXrub: TUpdateSQL;
    qryConfigRubDepend: TwwQuery;
    qryConfigRubDependDESCRUB: TStringField;
    qryConfigRubDependIDCONFIGRUBS: TFloatField;
    DSTipoDocXrub: TwwDataSource;
    QrydocsXbenefIDDOCUMENTO: TFloatField;
    UpdDocsXBenef: TUpdateSQL;
    qryDocs: TwwQuery;
    Dsdocs: TwwDataSource;
    MsGrupoUsu: TMontaSelect;
    qryIDRUBS: TFloatField;
    qryFLGSTATUS: TStringField;
    qryIDASSUNTOXATEND: TFloatField;
    qryIDHISTLANCTO: TFloatField;
    qryIDHISTBAIXA: TFloatField;
    qryIDCANCELAMENTO: TFloatField;
    qryIDCONFIGRUBS: TFloatField;
    qryDATAGERACAO: TDateTimeField;
    DbRichEditOBS: TwwDBRichEdit;
    Label4: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    qryTipodocXrubIDPESSOA: TFloatField;
    qryTipodocXrubIDRUBS: TFloatField;
    qryTipodocXrubIDBENEFICIO: TFloatField;
    qryTipodocXrubIDSITBENEF: TFloatField;
    qryTipodocXrubNOMEDOCUMENTO: TStringField;
    qryTipodocXrubIDRUBXBENEFICIO: TFloatField;
    qryTipodocXrubIDTIPODOCXRUB: TFloatField;
    qryTipodocXrubIDDOCUMENTO: TFloatField;
    qryTipodocXrubDATARECEB: TDateTimeField;
    qryTipodocXrubFLGRECEBIDO: TStringField;
    qryTipodocXrubIDGRUPO: TFloatField;
    qryTipodocXrubOBS: TStringField;
    qryTipodocXrubNOMEGRUPO: TStringField;
    Label8: TLabel;
    DBEditNumRUBS: TwwDBEdit;
    MsParticipDepen: TMontaSelect;
    qryAux: TwwQuery;
    qryTipoDocxRubAux: TwwQuery;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblkBeneficioChange(Sender: TObject);
    procedure dblkSitBenefChange(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CancelaTudo;
    procedure GeraRubSemDocumentos;
    procedure IncluiDocumentosSelecionados;
    procedure IncluiTodosDocumentos;
    procedure ExcluiDocumentosSelecionados;
    procedure ExcluiTodosDocumentos;
    procedure BtnExcluiClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure AbreQueries;
    procedure BtnIncluiClick(Sender: TObject);
    procedure BtnExcluiTodosClick(Sender: TObject);
    procedure BtnIncluiTodosClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure dblkBeneficioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    IDPESSJUR   : string;
    IDPLANOPREV : string;
    IDPESSOA    : string;
    IDTITULAR   : string;
    IDRUBS      : string;
    Gerou       : Boolean;
    SalvaQuery, SalvaQueryRubs, SalvaQryRubsXBeneficio, sqlAux  : string;
  public
    { Public declarations }
  end;

var
  FrmRecebDocs: TFrmRecebDocs;

implementation

{$R *.DFM}

procedure TFrmRecebDocs.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if montaSelect.RetornouValor then
  begin
    DBEditMatr.Text     :=  MontaSelect.ValoresChave[15];
    DBEditNome.Text     :=  MontaSelect.ValoresChave[14];
    DBEditSituacao.Text :=  MontaSelect.ValoresChave[9];
    IDPESSJUR           :=  MontaSelect.ValoresChave[7];
    IDPLANOPREV         :=  MontaSelect.ValoresChave[11];
    IDPESSOA            :=  MontaSelect.ValoresChave[10];
    IDTITULAR           :=  MontaSelect.ValoresChave[8];
    IDRUBS              :=  MontaSelect.ValoresChave[0];
    qryTipoDocXrub.Close;
    qryTipoDocXrub.Sql.Text := ' select '+
                               '     RB.IDPESSOA, '+
                               '     RB.IDRUBS, '+
                               '     RB.IDBENEFICIO, '+
                               '     RB.IDSITBENEF, '+
                               '     DOC.NOMEDOCUMENTO, '+
                               '     TP.IDRUBXBENEFICIO, '+
                               '     TP.IDTIPODOCXRUB, '+
                               '     TP.IDDOCUMENTO, '+
                               '     TP.DATARECEB, '+
                               '     TP.FLGRECEBIDO, '+
                               '     TP.IDGRUPO, '+
                               '     TP.OBS, '+
                               '     GA.NOMEGRUPO '+
                               ' from TIPODOCXRUB TP, RUBXBENEFICIO RB, DOCUMENTOS DOC, GRUPOACESSO GA '+
                               ' where '+
                               '            DOC.IDDOCUMENTO = TP.IDDOCUMENTO AND '+
                               '            TP.IDGRUPO = GA.IDGRUPO AND '+
                               '            TP.IDRUBXBENEFICIO = RB.IDRUBXBENEFICIO AND '+
                               '            RB.IDRUBS = '+ IDRUBS + 'AND'+
                               '            RB.IDPESSOA = '+ IDPESSOA;

    qryTipoDocXrub.Open;
    // Carrega os Campos na tela

    if not qryBeneficio.active then
      qryBeneficio.Open;

    qryAux.Close;
    qryAux.sql.text := ' SELECT IDBENEFICIO, IDSITBENEF FROM RUBXBENEFICIO WHERE IDRUBS = ' + IDRUBS;
    qryAux.Open;

    qryBeneficio.Locate('IDSERVICOS', qryAux.FieldByName('IDBENEFICIO').asInteger, []);

    dblkBeneficio.text := qryBeneficioNOME.asString;

    qrySitBenef.Close;
    QrySitBenef.paramByName('idpessoa').AsFloat    := strToFloat(IDPESSJUR);
    QrySitBenef.paramByName('idplanoprev').AsFloat := strToFloat(IDPLANOPREV);
    QrySitBenef.paramByName('idbeneficio').AsFloat := QryBeneficio.FieldByName('IDSERVICOS').asFloat;
    qrySitBenef.Open;

    dblkSitBenef.Enabled := true;

    QrySitBenef.Locate('IDSITBENEF', qryAux.fieldByName('IDSITBENEF').asInteger, []);
    dblkSitBenef.text := qrySitBenefDESCRICAO.asString;

    if (not qryTipoDocXrub.IsEmpty) and (qryTipodocXrubDATARECEB.asDateTime > 0) then
      dbDataInclusao.Text := qryTipoDocXrubDATARECEB.asString
    else
      dbDataInclusao.Text := dateToStr(date);

    dblkSitBenef.Refresh;

    qry.Close;
    qry.SQL.Text := ' select '+
                    '   IDRUBS, '+
                    '   FLGSTATUS, '+
                    '   IDASSUNTOXATEND, '+
                    '   IDHISTLANCTO, '+
                    '   IDHISTBAIXA, '+
                    '   IDCANCELAMENTO, '+
                    '   IDCONFIGRUBS, '+
                    '   DATAGERACAO '+
                    ' from  RUBS '+
                    ' where IDRUBS = '+ IDRUBS;
    qry.Open;

    DbEditNumRubs.Text := qryIDRUBS.asString;

    // se já existe uma rub criada, então seleciona-se os registros desta rub na tabela RUBXBENEFICIO
    qryRubXBenef.Close;
    qryRubXBenef.sql.Text := ' select IDRUBXBENEFICIO, '+
                                 '          IDPESSJUR, '+
                                 '          IDPESSOA, '+
                                 '          IDPLANOPREV, '+
                                 '          IDBENEFICIO, '+
                                 '          IDRUBS, '+
                                 '          IDSITBENEF, '+
                                 '          IDTITULAR from RUBXBENEFICIO where IDRUBS = '+ IDRUBS;
    qryRubXBenef.Open;

    qryHistRubs.Close;
    qryHistRubs.Sql.Text := ' select  '+
                            '   IDHISTMOVRUBS,  '+
                            '   IDRUBS,         '+
                            '   FLGSTATUS,      '+
                            '   HISTORICO,      '+
                            '   DATAMOV         '+
                            ' from  HISTMOVRUBS '+
                            ' where IDRUBS = '+ IDRUBS;
    qryHistRubs.Open;

  end;
end;

procedure TFrmRecebDocs.FormCreate(Sender: TObject);
begin
  inherited;
  IDRUBS := '';
  sqlAux := '';
  SalvaQueryRubs := qry.Sql.Text;
  SalvaQryRubsXBeneficio := qryRubXBenef.Sql.Text;
  SalvaQuery := qryTipoDocXrub.Sql.Text;
  Gerou := False;
  dbdataInclusao.Date := Date;
  AbreQueries;
end;

procedure TFrmRecebDocs.AbreQueries;
begin
  if not qry.active then
    qry.Open;
  if not qryBeneficio.active then
    qryBeneficio.Open;
  if not qryTipodocXrub.active then
    qryTipodocXrub.Open;
  if not qryHistRubs.active then
    qryHistRubs.Open;
  if not QryRubxBenef.active then
    QryRubxBenef.Open;
end;

procedure TFrmRecebDocs.dblkBeneficioChange(Sender: TObject);
begin
  inherited;
  QrydocsXbenef.close;
  if (dblkBeneficio.Text <> '') and (dblkBeneficio.Text <> '') and (IDPESSJUR <> '') and (IDPLANOPREV <> '') then
  begin
    if (qryTipoDocXRub.isEmpty) or (qryTipoDocXRub.active = false) then
    begin
      QrySitBenef.Close;
      QrySitBenef.paramByName('idpessoa').AsFloat := strToFloat(IDPESSJUR);
      QrySitBenef.paramByName('idplanoprev').AsFloat := strToFloat(IDPLANOPREV);
      QrySitBenef.paramByName('idbeneficio').AsFloat := QryBeneficio.FieldByName('IDSERVICOS').asFloat;
      QrySitBenef.Open;
    end
    else
    begin
      sqlAux :=    ' select   '+
                   '     TP.IDDOCUMENTO '+
                   ' from TIPODOCXRUB TP, RUBXBENEFICIO RB, DOCUMENTOS DOC, GRUPOACESSO GA '+
                   ' where '+
                   '            DOC.IDDOCUMENTO = TP.IDDOCUMENTO(+) AND '+
                   '            TP.IDGRUPO = GA.IDGRUPO AND '+
                   '            TP.IDRUBXBENEFICIO = RB.IDRUBXBENEFICIO AND '+
                   '            RB.IDRUBS = '+ IDRUBS + ' AND '+
                   '            RB.IDPESSOA = '+ IDPESSOA;

      qryDocsXBenef.Close;
      qryDocsXBenef.sql.Text := ' SELECT TP.IDDOCUMENTO, TP.NOMEDOCUMENTO, TB.IDBENEFICIO,  TB.IDSITBENEF '+
                                ' FROM DOCUMENTOS TP, TIPODOCXBENEF TB '+
                                ' WHERE (TB.IDPESSOA    = :IDPESSOA) AND '+
                                '       (TB.IDPLANOPREV = :IDPLANOPREV) AND '+
                                '       (TB.IDDOCUMENTO = TP.IDDOCUMENTO) AND '+
                                '       (TB.IDBENEFICIO = :IDBENEFICIO) AND '+
                                '       (TB.IDSITBENEF = :IDSITBENEF) AND '+
                                '       (TB.IDDOCUMENTO NOT IN ('+sqlAux+ ' )) '+
                                ' ORDER  BY  TP.NOMEDOCUMENTO ';

      QryDocsXbenef.paramByName('IDPESSOA').asFloat    := strToFloat(idpessjur);
      QryDocsXbenef.paramByName('IDPLANOPREV').asFloat := strToFloat(idplanoprev);
      QryDocsXbenef.paramByName('IDBENEFICIO').asFloat := QryBeneficio.fieldByName('IDSERVICOS').AsFloat;
      QryDocsXbenef.paramByName('IDSITBENEF').asFloat  := QrySitBenef.fieldByName('IDSITBENEF').AsFloat;

      qryDocsXBenef.Open;
    end;
    DblkSitBenef.Enabled := true;
  end;
end;



procedure TFrmRecebDocs.dblkSitBenefChange(Sender: TObject);
begin
  inherited;
  QryDocsXbenef.close;
  if (idpessjur <> '') and (idplanoprev <> '') and
     (DblkBeneficio.Text <> '') and (DblkSitBenef.Text <> '') then
  begin
    if (qryTipoDocXRub.isEmpty) or (qryTipoDocXRub.active = false) then
    begin
      QryDocsXbenef.paramByName('IDPESSOA').asFloat    := strToFloat(idpessjur);
      QryDocsXbenef.paramByName('IDPLANOPREV').asFloat := strToFloat(idplanoprev);
      QryDocsXbenef.paramByName('IDBENEFICIO').asFloat := QryBeneficio.fieldByName('IDSERVICOS').AsFloat;
      QryDocsXbenef.paramByName('IDSITBENEF').asFloat  := QrySitBenef.fieldByName('IDSITBENEF').AsFloat;
      QryDocsXbenef.Open;
    end
    else
    begin
      sqlAux :=    ' select '+
                   '     TP.IDDOCUMENTO '+
                   ' from TIPODOCXRUB TP, RUBXBENEFICIO RB, DOCUMENTOS DOC, GRUPOACESSO GA '+
                   ' where '+
                   '            DOC.IDDOCUMENTO = TP.IDDOCUMENTO(+) AND '+
                   '            TP.IDGRUPO = GA.IDGRUPO AND '+
                   '            TP.IDRUBXBENEFICIO = RB.IDRUBXBENEFICIO AND '+
                   '            RB.IDRUBS = '+ IDRUBS + ' AND '+
                   '            RB.IDPESSOA = '+ IDPESSOA;
      qryDocsXBenef.Close;
      qryDocsXBenef.sql.Text := ' SELECT  TP.IDDOCUMENTO, TP.NOMEDOCUMENTO, TB.IDBENEFICIO,  TB.IDSITBENEF '+
                                ' FROM DOCUMENTOS TP, TIPODOCXBENEF TB '+
                                ' WHERE (TB.IDPESSOA    = :IDPESSOA) AND '+
                                '       (TB.IDPLANOPREV = :IDPLANOPREV) AND '+
                                '       (TB.IDDOCUMENTO = TP.IDDOCUMENTO) AND '+
                                '       (TB.IDBENEFICIO = :IDBENEFICIO) AND '+
                                '       (TB.IDSITBENEF = :IDSITBENEF) AND '+
                                '       (TB.IDDOCUMENTO NOT IN ('+sqlAux+ ' )) '+
                                ' ORDER  BY  TP.NOMEDOCUMENTO ';

      QryDocsXbenef.paramByName('IDPESSOA').asFloat    := strToFloat(idpessjur);
      QryDocsXbenef.paramByName('IDPLANOPREV').asFloat := strToFloat(idplanoprev);
      QryDocsXbenef.paramByName('IDBENEFICIO').asFloat := QryBeneficio.fieldByName('IDSERVICOS').AsFloat;
      QryDocsXbenef.paramByName('IDSITBENEF').asFloat  := QrySitBenef.fieldByName('IDSITBENEF').AsFloat;

      qryDocsXBenef.Open;
    end;

  end;
end;


Procedure TFrmRecebDocs.CancelaTudo;
begin
  Gerou := False;
  qry.Close;
  QryBeneficio.Close;
  QryDocsXbenef.Close;
  QrySitBenef.Close;
  qryHistRubs.Close;
  QryRubxBenef.Close;
  qryTipodocXrub.Close;
  IDPESSJUR   := '';
  IDPLANOPREV := '';
  IDPESSOA    := '';
  IDTITULAR   := '';
  DBEditMatr.Text := '';
  DBEditNome.Text := '';
  DBEditSituacao.Text := '';
  dbdataInclusao.Date := Date;
  dblkBeneficio.Text := '';
  dblkSitBenef.Text := '';
  Refresh;
end;


procedure TFrmRecebDocs.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  CancelaTudo;
end;

Procedure TFrmRecebDocs.GeraRubSemDocumentos;
begin

  if dblkBeneficio.Text = '' then
  begin
   MsgDlg('Obrigatório Indicar o Benefício','Erro',MtError,[MbOk],0);
   if dblkBeneficio.CanFocus then dblkBeneficio.SetFocus;
   abort;
  end;
  if dblkSitBenef.Text = '' then
  begin
   MsgDlg('Obrigatório Indicar a Siuação do Benefício','Erro',MtError,[MbOk],0);
   if dblkSitBenef.CanFocus then dblkSitBenef.SetFocus;
   abort;
  end;

  // insere na tabela RUBS
  qry.insert;
  qryIDRUBS.AsFloat := LeultRegistro(nil,'RUBS');
  //***
  IDRUBS := qryIDRUBS.AsString;

  qryFLGSTATUS.AsString := '7';  //Recebido
  qryIDASSUNTOXATEND.clear;
  qryIDHISTLANCTO.Clear;
  qryIDHISTBAIXA.Clear;
  qryIDCANCELAMENTO.Clear;
  qryDATAGERACAO.asDateTime := dbdataInclusao.Date;
  qryIDCONFIGRUBS.clear;
  qry.post;
  DbEditNumRubs.Text := qryIDRUBS.asString;

  //insere na tabela HISTMOVRUBS
  qryHistRubs.insert;
  qryHistRubsIDHISTMOVRUBS.AsInteger := LeultRegistro(nil,'HISTMOVRUBS');
  qryHistRubsIDRUBS.AsInteger   := qryIDRUBS.AsInteger;
  qryHistRubsFLGSTATUS.AsString := IntToStr(Integer(srEncerrado) + 1);
  qryHistRubsHISTORICO.AsString := 'Recebida';
  qryHistRubsDATAMOV.AsDateTime := Date;
  qryHistRubs.post;

    // insere na tabela RUBXBENEFICIO
    QryRubxBenef.Insert;
    QryRubxBenefIDRUBXBENEFICIO.asInteger := LeultRegistro(nil,'RUBXBENEFICIO');
    QryRubxBenefIdPessJur.CLEAR;
    QryRubxBenefIdPessoa.asInteger        := StrToInt(IDPESSOA);
    QryRubxBenefIdPlanoPrev.asInteger     := StrToInt(IDPLANOPREV);
    QryRubxBenefIDTITULAR.asInteger       := StrToInt(IDTITULAR);
    QryRubxBenefIdBeneficio.asInteger     := StrToInt(dblkBeneficio.LookupValue);
    QryRubxBenefIDRUBS.AsInteger          := qryIDRUBS.asInteger;
    QryRubxBenefIdsitbenef.asInteger      := StrToInt(dblkSitBenef.LookupValue);
    QryRubxBenef.post;
end;



procedure TFrmRecebDocs.IncluiDocumentosSelecionados;
var i : integer;
begin
  MsGrupoUsu.Executar;
  if (not MsGrupoUsu.RetornouValor) or (MsGrupoUsu.ValoresChave[0] = '') then
  begin
    MessageDlg('É Obrigatório Indicar o Grupo de Usuário (seção) de Encaminhamento '+#13+#10+'do(s) Documento(s)', mtCustom, [mbOK], 0);
    abort;
  end;
  QrydocsXbenef.First;

  while not QrydocsXbenef.EOF do
  begin
    if GrdDocsSel.IsSelectedRecord then
    begin
        // insere na tabela TIPODOCXRUB todos os documentos associados ao modelo de RUB
          qryTipodocXrub.insert;
          qryTipodocXrubIDTIPODOCXRUB.AsFloat   := LeultRegistro(nil,'TIPODOCXRUB');
          qryTipodocXrubIDRUBXBENEFICIO.AsFloat := QryRubxBenefIDRUBXBENEFICIO.asFloat;
          qryTipodocXrubIDDOCUMENTO.AsFloat     := QrydocsXbenefIDDOCUMENTO.AsInteger;
          qryTipodocXrubNOMEdOCUMENTO.AsString  := QrydocsXbenefNOMEdOCUMENTO.asString;
          qryTipodocXrubFLGRECEBIDO.AsString    := 'S';
          qryTipodocXrubDATARECEB.asDateTime    := dbdataInclusao.Date;
          qryTipodocXrubIDGRUPO.asInteger       := strToInt(MsGrupoUsu.ValoresChave[0]);
          qryTipodocXrubNOMEGRUPO.AsString      := MsGrupoUsu.ValoresChave[1];
          qryTipodocXrub.post;

    end;
    QrydocsXbenef.Next;
  end;
  qryTipodocXrub.First;

  // O código abaixo serve para deletar as linhas do DbGrid que foram movidas
  with GrdDocsSel, GrdDocsSel.datasource.dataset do
  begin
    DisableControls;	{Disable controls to improve performance}
    for i:= 0 to SelectedList.Count-1 do
    begin
      GotoBookmark(SelectedList.items[i]);
      Freebookmark(SelectedList.items[i]);
      Delete;		{ Delete Record }
    end;
    SelectedList.clear;	{ Clear selected record list }
    { since they are all deleted }
    EnableControls;		{ Re-enable controls }
  end;

end;

// Inclui Todos os documentos do Grid.
procedure TFrmRecebDocs.IncluiTodosDocumentos;
begin

  MsGrupoUsu.Executar;
  if (not MsGrupoUsu.RetornouValor) or (MsGrupoUsu.ValoresChave[0] = '') then
  begin
    MessageDlg('É Obrigatório Indicar o Grupo de Usuário (seção) de Encaminhamento '+#13+#10+'do(s) Documento(s)', mtCustom, [mbOK], 0);
    abort;
  end;

  QrydocsXbenef.First;
  while not QrydocsXbenef.EOF do
  begin
      // insere na tabela TIPODOCXRUB todos os documentos associados ao modelo de RUB
      qryTipodocXrub.insert;
      qryTipodocXrubIDTIPODOCXRUB.AsFloat   := LeultRegistro(nil,'TIPODOCXRUB');
      qryTipodocXrubIDRUBXBENEFICIO.AsFloat := QryRubxBenefIDRUBXBENEFICIO.asInteger;
      qryTipodocXrubIDDOCUMENTO.AsFloat     := QrydocsXbenefIDDOCUMENTO.AsInteger;
      qryTipodocXrubNOMEdOCUMENTO.AsString  := QrydocsXbenefNOMEdOCUMENTO.asString;
      qryTipodocXrubFLGRECEBIDO.AsString    := 'S';
      qryTipodocXrubDATARECEB.asDateTime    := dbdataInclusao.Date;
      qryTipodocXrubIDGRUPO.asInteger       := strToInt(MsGrupoUsu.ValoresChave[0]);
      qryTipodocXrubNOMEGRUPO.AsString      := MsGrupoUsu.ValoresChave[1];
      qryTipodocXrub.post;

    QrydocsXbenef.Next;
  end;
  qryTipodocXrub.First;
  QrydocsXbenef.First;
  while not QrydocsXbenef.EOF do
  begin
    QrydocsXbenef.Delete;
  end;
end;




// Devolve o Documento Para o DBGrid da Esquerda
procedure TFrmRecebDocs.ExcluiDocumentosSelecionados;
var i : integer;
begin
  qryTipodocXrub.First;
  while not qryTipodocXrub.EOF do
  begin
    if GrdTipDesemb.IsSelectedRecord then
    begin
      QrydocsXbenef.Insert;
      QrydocsXbenefNOMEdOCUMENTO.asString := qryTipodocXrubNOMEdOCUMENTO.AsString;
      QrydocsXbenefIDDOCUMENTO.asFloat    := qryTipodocXrubIDDOCUMENTO.AsFloat;
      QrydocsXbenefIDBENEFICIO.asFloat    := qryTipodocXrubIDRUBXBENEFICIO.AsFloat;
      // tavares 10/07/2003
      if qrySitBenef.Locate('DESCRICAO', dblkSitBenef.Text, []) then
        QrydocsXbenefIDSITBENEF.asInteger   := qrySitBenefIDSITBENEF.asInteger;

      QrydocsXbenef.Post;
    end;
    qryTipodocXrub.Next;
  end;
  QrydocsXbenef.First;

  // O código abaixo serve para deletar as linhas do DbGrid que foram movidas
  with GrdTipDesemb, GrdTipDesemb.datasource.dataset do
  begin
    DisableControls;	{Disable controls to improve performance}
    for i:= 0 to SelectedList.Count-1 do
    begin
      GotoBookmark(SelectedList.items[i]);
      Freebookmark(SelectedList.items[i]);
      Delete;		{ Delete Record }
    end;
    SelectedList.clear;	{ Clear selected record list }
    { since they are all deleted }
    EnableControls;		{ Re-enable controls }
  end;

end;



procedure TFrmRecebDocs.ExcluiTodosDocumentos;
begin
  qryTipodocXrub.First;
  while not qryTipodocXrub.EOF do
  begin
    QrydocsXbenef.Insert;
    QrydocsXbenefNOMEdOCUMENTO.asString := qryTipodocXrubNOMEdOCUMENTO.AsString;
    QrydocsXbenefIDDOCUMENTO.asFloat    := qryTipodocXrubIDDOCUMENTO.AsFloat;
    QrydocsXbenefIDBENEFICIO.asFloat    := qryTipodocXrubIDRUBXBENEFICIO.AsFloat;
    QrydocsXbenefIDSITBENEF.asInteger   := qrySitBenefIDSITBENEF.asInteger;
    QrydocsXbenef.Post;
    qryTipodocXrub.Next;
  end;
  QrydocsXbenef.First;
  qryTipodocXrub.First;
  while not qryTipodocXrub.EOF do
  begin
    qryTipodocXrub.Delete;
  end;

end;



procedure TFrmRecebDocs.BtnExcluiClick(Sender: TObject);
begin
  inherited;
  if not Gerou then
  begin
    GeraRubSemDocumentos;
    Gerou := True;
  end;
  IncluiDocumentosSelecionados;
end;


procedure TFrmRecebDocs.CmeCadastroConfirma(Sender: TObject);
begin
  if dblkBeneficio.Text = '' then
  begin
   MsgDlg('Obrigatório Indicar o Benefício','Erro',MtError,[MbOk],0);
   if dblkBeneficio.CanFocus then dblkBeneficio.SetFocus;
   abort;
  end;
  if dblkSitBenef.Text = '' then
  begin
   MsgDlg('Obrigatório Indicar o Benefício','Erro',MtError,[MbOk],0);
   if dblkSitBenef.CanFocus then dblkSitBenef.SetFocus;
   abort;
  end;

  inherited;
  if qry.state in [dsEdit, dsBrowse] then
  begin
    qry.Edit;

    qryHistRubs.Edit;

    if trim(IDRUBS) = '' then
      IDRUBS := intToStr(LeultRegistro(nil,'RUBS'));

    qryIDRUBS.asInteger := strToInt(IDRUBS);
    if qrydocsXbenef.RecordCount > 0 then
      qryFLGSTATUS.AsString := '1'  // status gerado
    else
      qryFLGSTATUS.AsString := '7';  // status encerrado
    qryIDASSUNTOXATEND.clear;
    qryIDHISTLANCTO.Clear;
    qryIDHISTBAIXA.Clear;
    qryIDCANCELAMENTO.Clear;
    qryDATAGERACAO.asDateTime := dbdataInclusao.Date;
    qryIDCONFIGRUBS.clear;
    qry.post;

    qryTipodocXrub.edit;
    if qryTipodocXrubIDTIPODOCXRUB.isNull then
      qryTipodocXrubIDTIPODOCXRUB.AsFloat   := LeultRegistro(nil,'TIPODOCXRUB');
    qryTipodocXrubFLGRECEBIDO.AsString    := 'S';
    qryTipodocXrubDATARECEB.asDateTime    := strTodate(dbdataInclusao.text);
    qryTipodocXrub.Post;

    QryRubxBenef.edit;
    if QryRubxBenefIDRUBXBENEFICIO.IsNull then
      QryRubxBenefIDRUBXBENEFICIO.asInteger := LeultRegistro(nil,'RUBXBENEFICIO');
    QryRubxBenefIdPessJur.CLEAR;
    QryRubxBenefIdPessoa.asInteger        := StrToInt(IDPESSOA);
    QryRubxBenefIdPlanoPrev.asInteger     := StrToInt(IDPLANOPREV);
    QryRubxBenefIDTITULAR.asInteger       := StrToInt(IDTITULAR);
    QryRubxBenefIdBeneficio.asInteger     := QryBeneficioIDSERVICOS.asInteger;
    QryRubxBenefIDRUBS.AsInteger          := qryIDRUBS.asInteger;
    QryRubxBenefIdsitbenef.asInteger      := QrySitBenefIDSITBENEF.asInteger;
    QryRubxBenef.Post;

    qryHistRubs.edit;
    if qryHistRubsIDHISTMOVRUBS.isnull then
      qryHistRubsIDHISTMOVRUBS.AsInteger := LeultRegistro(nil,'HISTMOVRUBS');
    qryHistRubsIDRUBS.AsInteger   := strToInt(IDRUBS);
    if qrydocsXbenef.RecordCount > 0 then
    begin
      qryHistRubsFLGSTATUS.AsString := IntToStr(Integer(srGerado) + 1);
      qryHistRubsHISTORICO.AsString := 'Gerada';
    end else begin
      qryHistRubsFLGSTATUS.AsString := IntToStr(Integer(srEncerrado) + 1);
      qryHistRubsHISTORICO.AsString := 'Recebida';
    end;
    qryHistRubsDATAMOV.AsDateTime := Date;
    qryHistRubs.Post;

  end;

  IF NOT dtmBaseDados.dbBaseDados.InTransaction THEN
  StartTransacao;
  try
    qry.ApplyUpdates;
    QryRubxBenef.ApplyUpdates;
    qryTipodocXrub.ApplyUpdates;
    qryHistRubs.ApplyUpdates;
    Gerou := False;
    CommitTransacao;
  except
    RollbackTransacao;
    MsgDlg('Erro Ao Atualizar RUBS. As alterações nao foram efetivadas.','Atenção',mtError,[mbOk],0);
  end;

end;

procedure TFrmRecebDocs.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.sql.Text := SalvaQueryRubs;
  qryRubXbenef.sql.Text := SalvaQryRubsXBeneficio;
  DBEditNumRUBS.text := '';
  AbreQueries;
  MsParticipDepen.Executar;
  if MsParticipDepen.RetornouValor then
  begin
    DBEditMatr.Text     :=  MsParticipDepen.ValoresChave[14];
    DBEditNome.Text     :=  MsParticipDepen.ValoresChave[0];
    DBEditSituacao.Text :=  MsParticipDepen.ValoresChave[8];
    IDPESSJUR           :=  MsParticipDepen.ValoresChave[6];
    IDPLANOPREV         :=  MsParticipDepen.ValoresChave[10];
    IDTITULAR           :=  MsParticipDepen.ValoresChave[7];
    IDPESSOA            :=  MsParticipDepen.ValoresChave[9];
    qryTipoDocXrub.Close;
    qryTipoDocXrub.Sql.Text := SalvaQuery;
    AbreQueries;
  end
  else
    CmeCadastroCancel(Sender);
end;


procedure TFrmRecebDocs.BtnIncluiClick(Sender: TObject);
begin
  inherited;
  ExcluiDocumentosSelecionados;
end;

procedure TFrmRecebDocs.BtnExcluiTodosClick(Sender: TObject);
begin
  inherited;
  if not Gerou then
  begin
    GeraRubSemDocumentos;
    Gerou := True;
  end;
  IncluiTodosDocumentos;
end;

procedure TFrmRecebDocs.BtnIncluiTodosClick(Sender: TObject);
begin
  inherited;
  ExcluiTodosDocumentos;
end;

procedure TFrmRecebDocs.sbtnInserirClick(Sender: TObject);
begin
  Gerou := False;
  AbreQueries;
  inherited;
end;

procedure TFrmRecebDocs.sbtnAlterarClick(Sender: TObject);
begin
  Gerou := True;
  inherited;
end;

procedure TFrmRecebDocs.sbtnProcurarClick(Sender: TObject);
begin
  Gerou := True;
  inherited;
end;

procedure TFrmRecebDocs.sbtnApagarClick(Sender: TObject);
begin
  Gerou := True;
  inherited;
end;

procedure TFrmRecebDocs.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.SQL.Text := ' select '+
                  '   IDRUBS, '+
                  '   FLGSTATUS, '+
                  '   IDASSUNTOXATEND, '+
                  '   IDHISTLANCTO, '+
                  '   IDHISTBAIXA, '+
                  '   IDCANCELAMENTO, '+
                  '   IDCONFIGRUBS, '+
                  '   DATAGERACAO '+
                  ' from  RUBS '+
                  ' where IDRUBS = -1';
  qry.Open;

  DBEditNumRUBS.text := '';

  qryTipoDocXrub.Close;
  qryTipoDocXrub.Sql.Text := ' select '+
                             '     RB.IDPESSOA, '+
                             '     RB.IDRUBS, '+
                             '     RB.IDBENEFICIO, '+
                             '     RB.IDSITBENEF, '+
                             '     DOC.NOMEDOCUMENTO, '+
                             '     TP.IDRUBXBENEFICIO, '+
                             '     TP.IDTIPODOCXRUB, '+
                             '     TP.IDDOCUMENTO, '+
                             '     TP.DATARECEB, '+
                             '     TP.FLGRECEBIDO, '+
                             '     TP.IDGRUPO, '+
                             '     TP.OBS, '+
                             '     GA.NOMEGRUPO '+
                             ' from TIPODOCXRUB TP, RUBXBENEFICIO RB, DOCUMENTOS DOC, GRUPOACESSO GA '+
                             ' where '+
                             '            DOC.IDDOCUMENTO = TP.IDDOCUMENTO(+) AND '+
                             '            TP.IDGRUPO = GA.IDGRUPO AND '+
                             '            TP.IDRUBXBENEFICIO = RB.IDRUBXBENEFICIO AND '+
                             '            RB.IDRUBS = -1 AND '+
                             '            RB.IDPESSOA = -1 ';

  qryTipoDocXrub.Open;

  qryRubXBenef.Close;
  qryRubXBenef.sql.Text := ' select         IDRUBXBENEFICIO, '+
                                 '          IDPESSJUR, '+
                                 '          IDPESSOA, '+
                                 '          IDPLANOPREV, '+
                                 '          IDBENEFICIO, '+
                                 '          IDRUBS, '+
                                 '          IDSITBENEF, '+
                                 '          IDTITULAR from RUBXBENEFICIO where IDRUBS = -1';
  qryRubXBenef.Open;

  qryHistRubs.Close;
  qryHistRubs.Sql.Text := ' select            '+
                          '   IDHISTMOVRUBS,  '+
                          '   IDRUBS,         '+
                          '   FLGSTATUS,      '+
                          '   HISTORICO,      '+
                          '   DATAMOV         '+
                          ' from  HISTMOVRUBS '+
                          ' where IDRUBS = -1';
  qryHistRubs.Open;

end;

procedure TFrmRecebDocs.dblkBeneficioCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if TRIM(qryTipoDocXRubNOMEDOCUMENTO.AsString) <> '' then
  begin
    showMessage(' Não é possível alterar o campo "Benefício/Serviço",'+#13#10+
                ' pois o recebimento de documentos já foi efetivado. '+#13#10+
                ' Antes de fazer esta operação você deve devolver os documentos '+#13#10+
                ' clicando na seta dupla para esquerda e clicando no botão OK para confirmar.');
    bbtnCancelarClick(self);
    exit;
  end;
end;

procedure TFrmRecebDocs.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  IF dtmBaseDados.dbBaseDados.InTransaction THEN
    RollBackTransacao;
end;

end.
