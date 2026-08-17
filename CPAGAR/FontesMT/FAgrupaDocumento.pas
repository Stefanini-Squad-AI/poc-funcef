{-------------------------------------------------------------------------------
--------------------------- HISTÓRICO DE ALTERAÇÕES ----------------------------
--------------------------------------------------------------------------------

Nº SIG.....: 123197
Responsável: Everson Cunha
Data.......: 11/08/2022
Descrição..: Criação da opção de desfazer agrupamento
--------------------------------------------------------------------------------
Nº SIG.....: 117206
Responsável: Everson Cunha
Data.......: 24/01/2022
Descrição..: Criação da funcionalidade.
             Baseado em C:\ProjetosCM5\CRECEBER\FontesMT\FAgrupaCnabMT.pas
             Atender a AP AGRUPADA DCTFWeb - INSS
--------------------------------------------------------------------------------}

unit FAgrupaDocumento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBClient, uCMClientDataSet, Wwdatsrc,
  CMProcuraSubTipo, wwdbdatetimepicker, CMDateTimePicker, wwdblook,
  uCtrlDocumento, uCmSqlParams, uCtrlPadroes, DBTables, Wwquery, Provider,
  Grids, Wwdbigrd, Wwdbgrid, TREdit;

const
  MSG01 = 'Informe o campo: ';
  MSG02 = 'Selecione no mínimo dois documentos para realizar o agrupamento';
  MSG03 = 'Só é permitido o agrupamento de documentos do mesmo Favorecido';
  MSG04 = 'Não existem documentos a exibir utilizando os filtros informados.' + #13#10 +
          'Favor verifique os filtros e Selecione novamente.';
  MSG05 = 'Confirma o agrupamento dos documentos selecionados?';
  MSG06 = 'Agrupamento realizado com sucesso!';
  MSG07 = 'Confirma o desagrupamento dos documentos selecionados?';
  MSG08 = 'Desagrupamento realizado com sucesso!';
         

type
  TFrmAgrupaDocumento = class(TfrmOkCancelar)
    ds: TwwDataSource;
    Cds: TCMClientDataSet;
    pnlFiltros: TPanel;
    pnlGrid: TPanel;
    dbLkpPortadorForma: TwwDBLookupCombo;
    dbdtDataProgramada: TCMDateTimePicker;
    cmpForCli: TCMProcuraForCli;
    btnSelecionar: TBitBtn;
    lblDtProgramada: TLabel;
    lblPortadorForma: TLabel;
    CdsPortadorForma: TCMClientDataSet;
    sqlPortadorForma: TCMSqlParams;
    pnlBotoes: TPanel;
    btnInverteSelecao: TSpeedButton;
    dbgrdDocumentos: TwwDBGrid;
    sqlSelecionar: TCMSqlParams;
    qryAux: TwwQuery;
    rgTipoProcesso: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnInverteSelecaoClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbgrdDocumentosUpdateFooter(Sender: TObject);
    procedure rgTipoProcessoClick(Sender: TObject);
  private
    { Private declarations }
    ctrlDocumento : TctrlDocumento;

    //Strings
    sSqlLimpo,
    sNodocumento,
    sNumAp : String;

    //Currency
    fValorTotalSelecionado : Currency;

    //Functions
    function QueryPrincipal(Tipo : Integer) : String;
    function ValidaFiltro : Boolean;
    function ValidaAgrupamento : Boolean;
    function ValidaDesagrupamento : Boolean;
    function GetSequence (NomeSeq : string) : String;

    //Procedures
    procedure AgrupaDocumento;
    procedure DesagrupaDocumento;
    procedure Limpar;
    procedure FazQuery2(sqlParam: TCMSqlParams; sSql: string);
  public
    { Public declarations }
  end;

var
  FrmAgrupaDocumento: TFrmAgrupaDocumento;

implementation

Uses dBaseDados, uMensErro, uDataBase;

{$R *.DFM}

procedure TFrmAgrupaDocumento.FormCreate(Sender: TObject);
begin
  inherited;

  //Create
  CtrlDocumento := TCtrlDocumento.Create;

  //Initialize
  CtrlDocumento.InitializeAs(Padroes);

  sqlPortadorForma.Prepare;
  sqlPortadorForma.Open;

  sSqlLimpo := sqlSelecionar.SQL.GetText;

  //Abre o Cds vazio e apresenta os títulos das colunas do grid
  FazQuery2(sqlSelecionar, sSqlLimpo);

  dbdtDataProgramada.Date := Date;
end;

procedure TFrmAgrupaDocumento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  FreeAndNil(CtrlDocumento);
end;

function TFrmAgrupaDocumento.ValidaFiltro: Boolean;
begin              
  if (rgTipoProcesso.ItemIndex = -1) then
  begin
    MsgDlg(MSG01 + rgTipoProcesso.Caption, 'Aviso', mtWarning, [mbOK], 0);

    exit;
  end;

  if (dbLkpPortadorForma.Text = EmptyStr) then
  begin
    MsgDlg(MSG01 + lblPortadorForma.Caption, 'Aviso', mtWarning, [mbOK], 0);

    if dbLkpPortadorForma.CanFocus then
    begin
      dbLkpPortadorForma.SetFocus;
      dbLkpPortadorForma.DropDown;
    end;

    exit;
  end;

  if (dbdtDataProgramada.Text = EmptyStr) then
  begin
    MsgDlg(MSG01 + lblDtProgramada.Caption, 'Aviso', mtWarning, [mbOK], 0);

    if dbdtDataProgramada.CanFocus then
      dbdtDataProgramada.SetFocus;

    exit;
  end;

  if (cmpForCli.Text = '') or (CmpForCli.ForCliReg.RazaoSocial = '') or (CmpForCli.ForCliReg.ID = 0) then
  begin
    MsgDlg(MSG01 + CmpForCli.Caption, 'Aviso', mtWarning, [mbOK], 0);

    exit;
  end;

  result := True;
end;

function TFrmAgrupaDocumento.ValidaAgrupamento: Boolean;
begin
  if (Cds.IsEmpty) or (Cds.RecordCount < 2) then
  begin
    MsgDlg(MSG02, 'Erro', mtError, [mbOk], 0);

    Exit;
  end;

  if not CtrlDocumento.IntBanco.VerificaConsistencia(Cds.data) then
  begin
    MsgDlg(MSG03, 'Aviso', mtWarning, [mbOK], 0);

    exit;
  end;

  result := True;
end;

function TFrmAgrupaDocumento.ValidaDesagrupamento: Boolean;
begin
  //TODO

  result := True;
end;

function TFrmAgrupaDocumento.QueryPrincipal(Tipo : Integer): String;
var sSQL : TStringList;
begin
  try
    sSQL := TStringList.Create;

    sSQL.add('SELECT '' '' AS SELECIONAR, ');
    sSQL.add('       D.NUMAPGR, ');
    sSQL.add('       D.NODOCUMENTO, ');
    sSQL.add('       P.RAZAOSOCIAL, ');
    sSQL.add('       D.DATAPROGRAMADA, ');
    sSQL.add('       (SELECT SUM(DECODE(LANC.DEBCRE, ''D'', ');
    sSQL.add('                   DECODE(DOC.RECPAG, ''R'', LANC.VALOR, LANC.VALOR * -1), ');
    sSQL.add('                   DECODE(DOC.RECPAG, ''R'', LANC.VALOR * -1, LANC.VALOR))) AS VALOR ');
    sSQL.add('          FROM LANCTODOCUM LANC ');
    sSQL.add('          JOIN DOCUMENTO DOC ON DOC.CODDOCUMENTO = LANC.CODDOCUMENTO ');
    sSQL.add('         WHERE D.CODDOCUMENTO = LANC.CODDOCUMENTO) VALOR, ');
    sSQL.add('       D.IDFORCLI, D.CODDOCUMENTO ');
    sSQL.add('  FROM CM.DOCUMENTO D ');
    sSQL.add('  JOIN CM.PESSOA P ON P.IDPESSOA = D.IDFORCLI ');
    sSQL.add(' WHERE NVL(D.EMISBLOQ, ''N'') = ''N'' ');
    sSQL.add('   AND D.STATUS = 0 ');

    if Tipo = 0 then //Agrupar
      sSQL.add('   AND D.CODGRUPOCNAB IS NULL ');

    if Tipo = 1 then //Desagrupar
      sSQL.add('   AND D.CODGRUPOCNAB IS NOT NULL ');

    if (CmpForCli.Text <> '') and (CmpForCli.ForCliReg.ID <> 0) then
      sSQL.add('   AND D.IDFORCLI = ' + IntToStr(CmpForCli.ForCliReg.ID));

    if (dbLkpPortadorForma.Text <> EmptyStr) then
      sSQL.add('   AND D.CODPORTFORMA = ' + dbLkpPortadorForma.LookupValue);

    if (dbdtDataProgramada.Text <> EmptyStr) then
      sSQL.add('   AND D.DATAPROGRAMADA = ' + QuotedStr(dbdtDataProgramada.Text));

    sSQL.add(' ORDER BY D.NUMAPGR, VALOR ');

    Result := sSQL.GetText;
  finally
    FreeAndNil(sSQL);
  end;
end;

procedure TFrmAgrupaDocumento.btnSelecionarClick(Sender: TObject);
begin
  inherited;

  if not(ValidaFiltro) then
    exit;

  FazQuery2(sqlSelecionar, QueryPrincipal(rgTipoProcesso.ItemIndex));

  if (Cds.IsEmpty) then
  begin
    MsgDlg(MSG04, 'Aviso', mtWarning, [mbOK], 0);

    exit;
  end;
end;

procedure TFrmAgrupaDocumento.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  with Cds do
  begin
    try
      Filter := ' SELECIONAR = ''S'' ';
      Filtered := True;

      if not Cds.IsEmpty then
        if rgTipoProcesso.ItemIndex = 0 then //Agrupamento dos documentos
        begin
          if not (ValidaAgrupamento) then
            exit;

          if MsgDlg(MSG05 + #13#10 + #13#10 + IntToStr(RecordCount) + ' documentos no valor total de ' + FormatFloat('###,###0.00', fValorTotalSelecionado), 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            exit;

          try
            AgrupaDocumento;
            FazQuery2(sqlSelecionar, QueryPrincipal(rgTipoProcesso.ItemIndex));
            MsgDlg(MSG06 + #13#10 + #13#10 + 'Nº AP: ' + sNumAp + #13#10 + 'Nº Documento: ' + sNodocumento, 'Informação', mtInformation, [mbOk], 0);
          except
            on e: Exception do
            begin
              MsgDlg(e.message, 'Erro', mtError, [mbOK], 0);
            end;
          end;
        end //Fim agrupamento
        else
        if rgTipoProcesso.ItemIndex = 1 then //Desagrupamento dos documentos
        begin
          if not (ValidaDesagrupamento) then
            exit;

          if MsgDlg(MSG07 + #13#10 + #13#10 + IntToStr(RecordCount) + ' documentos no valor total de ' + FormatFloat('###,###0.00', fValorTotalSelecionado), 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            exit;

          try
            DesagrupaDocumento;
            FazQuery2(sqlSelecionar, QueryPrincipal(rgTipoProcesso.ItemIndex));
            MsgDlg(MSG08, 'Informação', mtInformation, [mbOk], 0);
          except
            on e: Exception do
            begin
              MsgDlg(e.message, 'Erro', mtError, [mbOK], 0);
            end;
          end;
        end; //Fim desagrupamento

    finally
      Filter := '';
      Filtered := False;
    end;
  end;
end;

procedure TFrmAgrupaDocumento.btnInverteSelecaoClick(Sender: TObject);
begin
  inherited;

  with Cds do
  begin
    if not IsEmpty then
    begin
      DisableControls;
      First;

      while not Eof do
      begin
        Edit;

        if FieldByName('SELECIONAR').asString <> 'S' then
          FieldByName('SELECIONAR').asString := 'S'
        else
          FieldByName('SELECIONAR').asString := 'N';

        Post;
        Next;
      end;// while
      
      First;
      EnableControls;

      dbgrdDocumentosUpdateFooter(Self);
    end;
  end;
end;

procedure TFrmAgrupaDocumento.bbtnCancelarClick(Sender: TObject);
begin
  inherited;

  Limpar;
end;

procedure TFrmAgrupaDocumento.Limpar;
var i : Integer;
begin
  Cds.Cancel;

  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TEdit) then
      TEdit(Components[i]).Text := EmptyStr
    else
    if (Components[i] is TCMDateTimePicker) then
      TCMDateTimePicker(Components[i]).Text := EmptyStr
    else
    if (Components[i] is TwwDBLookupCombo) then
      TwwDBLookupCombo(Components[i]).Text := EmptyStr
    else
    if (Components[i] is TRealEdit) then
      TRealEdit(Components[i]).Value := 0
  end;

  rgTipoProcesso.itemIndex := 0;

  cmpForCli.Text := EmptyStr;

  dbdtDataProgramada.Date := Date;

  FazQuery2(sqlSelecionar, sSqlLimpo);
end;

procedure TFrmAgrupaDocumento.FazQuery2(sqlParam: TCMSqlParams;
  sSql: string);
begin
  sqlparam.ClientDataSet.Close;
  sqlparam.SQL.Clear;
  sqlparam.SQL.Add(sSql);
  sqlparam.Open;
end;

procedure TFrmAgrupaDocumento.AgrupaDocumento;
var sSQL, sCodgrupoCnab : String;
begin
  try
    StartTransacao;

    sNumAp        := GetSequence('SEQAPGR');
    sNodocumento  := GetSequence('DOCUMENTO');
    sCodgrupoCnab := GetSequence('GRUPOCNAB');

    Cds.First;
    while not Cds.Eof do
    begin
      sSQL := 'INSERT INTO CM.HISTAGRUPADOCUMENTO ' +
              'SELECT (SELECT NVL(MAX(ID), 0) + 1 ID FROM CM.HISTAGRUPADOCUMENTO), ' + //ID
               Cds.fieldbyname('coddocumento').AsString + ', ' +                       //CODDOCUMENTO
               Cds.fieldbyname('nodocumento').AsString + ', ' +                        //NODOCUMENTO
               Cds.fieldbyname('numapgr').AsString + ', ' +                            //NUM AP
              ' SYSDATE, ' +                                                           //TRGDTINCLUSAO
              ' USER ' +                                                               //TRGUSERINCLUSAO
              ' FROM DUAL ';

      ExecutarQuery(qryAux, sSQL);

      sSQL := 'UPDATE CM.DOCUMENTO ' +
              '   SET NODOCUMENTO  = ' + sNodocumento +
              '     , NUMAPGR      = ' + sNumAp +
              '     , CODGRUPOCNAB = ' + sCodgrupoCnab +
              ' WHERE CODDOCUMENTO = ' + Cds.fieldbyname('coddocumento').AsString;

      ExecutarQuery(qryAux, sSQL);

      Cds.Next;
    end;

    CommitTransacao;
  except
    on e: Exception do
    begin
      RollBackTransacao;
      Raise Exception.Create(e.message);
    end;
  end;
end;

procedure TFrmAgrupaDocumento.DesagrupaDocumento;
var sSQL : String;
begin
  try
    StartTransacao;

    Cds.First;
    while not Cds.Eof do
    begin
      sSQL := 'SELECT * ' +
              '  FROM CM.HISTAGRUPADOCUMENTO H ' +
              ' WHERE H.CODDOCUMENTO = ' + Cds.fieldbyname('coddocumento').AsString;

      FazQuery(qryAux, sSQL);

      sSQL := 'UPDATE CM.DOCUMENTO ' +
              '   SET NODOCUMENTO  = ' + qryAux.fieldbyname('nodocumento').AsString +
              '     , NUMAPGR      = ' + qryAux.fieldbyname('numapgr').AsString +
              '     , CODGRUPOCNAB = NULL ' +
              ' WHERE CODDOCUMENTO = ' + Cds.fieldbyname('coddocumento').AsString;

      ExecutarQuery(qryAux, sSQL);

      Cds.Next;
    end;

    CommitTransacao;
  except
    on e: Exception do
    begin
      RollBackTransacao;
      Raise Exception.Create(e.message);
    end;
  end;
end;

function TFrmAgrupaDocumento.GetSequence(NomeSeq: string): String;
begin
  FazQuery(qryAux, 'SELECT CM.SEQ' + UpperCase(NomeSeq) + '.NEXTVAL FROM DUAL');

  result := qryAux.fieldbyname('NEXTVAL').AsString;
end;

procedure TFrmAgrupaDocumento.dbgrdDocumentosUpdateFooter(Sender: TObject);
var cdsTemp : TClientDataSet;
begin
  inherited;

  fValorTotalSelecionado := 0;

  try
    try
      cdsTemp := TClientDataSet.Create(Nil);
      cdsTemp.Data := Cds.Data;

      cdsTemp.First;
      while not(cdsTemp.Eof) do
      begin
        if cdsTemp.FieldByName('selecionar').AsString = 'S' then
          fValorTotalSelecionado := fValorTotalSelecionado + cdsTemp.FieldByName('valor').AsFloat;

        cdsTemp.Next;
      end;
      
    except
      on e: Exception do
      begin
        MsgDlg('Erro ao totalizar a lista de documentos', 'Erro', mtError, [mbOK], 0);
      end;
    end;
  finally
    FreeAndNil(cdsTemp);
  end;

  dbgrdDocumentos.ColumnByName('valor').FooterValue := FormatFloat('###,###0.00', fValorTotalSelecionado);

end;

procedure TFrmAgrupaDocumento.rgTipoProcessoClick(Sender: TObject);
begin
  inherited;

  FazQuery2(sqlSelecionar, sSqlLimpo);
end;

end.
