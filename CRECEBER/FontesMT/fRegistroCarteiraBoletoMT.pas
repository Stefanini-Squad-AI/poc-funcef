{-------------------------------------------------------------------------------
---------------------------- ALTERAÇÕES ----------------------------------------
--------------------------------------------------------------------------------
N. SIG..........   : 99067
Data da Alteração: : 12/05/2020
Responsável:       : Everson Cunha
Descrição.......   : Incluir o convênio 208 - CEF - SIGCB - COPART/EMPREST - 
					           391400-3 na lista da subQuery do segmento "Y-53"
--------------------------------------------------------------------------------
N. SIG.............: 71745
Data da Alteração..: 16/03/2020
Responsável........: Everson Cunha
Descrição..........: Melhoria na rotina para registro de boletos agrupados.
--------------------------------------------------------------------------------
Rotina             : QueryArquivoGerado
N. SIG..........   : 71444
Data da Alteração: : 19/07/2018
Responsável:       : Everson Luiz Pereira da Cunha
Descrição.......   : Preencher com zeros o sufixo do CEP
--------------------------------------------------------------------------------
Alteração Form:    :
Rotina             : QueryArquivoGerado
N. SIG..........   : 64823
Data da Alteração: : 14/03/2018
Responsável:       : Edilaine
Descrição.......   : Inserir segmento Y53 possibilitando pagamento de boletos
                     com valor menor
--------------------------------------------------------------------------------
Rotina             : QueryArquivoGerado
N. SIG..........   : 60414
Data da Alteração: : 19/12/2017
Alteração Form:    : fRegistroCarteiraBoletoMT
Responsável:       : Everson Luiz Pereira da Cunha
Descrição.......   : Alterar o campo COD_BCO_COMP de '000' para '   '
--------------------------------------------------------------------------------
Rotina             : QueryArquivoGerado
N. SIG..........   : 60046
Data da Alteração: : 13/12/2017
Alteração Form:    : fRegistroCarteiraBoletoMT
Responsável:       : Everson Luiz Pereira da Cunha
Descrição.......   : Retornar a alteração que havia sido realizada no SIG 51426,
                     pois, segundo informações da Caixa, não é possível utilizar
                     o código de Devolução=2 quando não há protesto.
--------------------------------------------------------------------------------
Data      : 27/07/2017
Autor     : Osni Cavalcante
SIG       : 51426
Descrição : Alteração na consulta que gera o arquivo de boletos registrados para
            evitar a cobrança indevida de boletos não pagos.
--------------------------------------------------------------------------------
Data      : 05/07/2017
Autor     : Osni Cavalcante
SIG       : 49975
Descrição : Para a busca de boletos não registrados, o sistema deve exibir
            apenas os documentos que não estejam baixados.
--------------------------------------------------------------------------------
Data      : 13/02/2016
Autor     : Darivaldo Alencar
SIG       : 29271
Descrição : Criação do FORM: A partir de Janeiro/2017 as cobranças bancárias
            serão feitas somente por meio de cobrança registrada.
            Dessa forma, solicitamos a adequação da rotina de cobrança bancária
            utilizada pela Fundação, para atendimento e conformidade com esta
            nova modalidade.
            Registramos que esta é uma demanda legal
--------------------------------------------------------------------------------}

unit fRegistroCarteiraBoletoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ExtCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, wwdbdatetimepicker, CMDateTimePicker, wwdblook,
  CMProcuraSubTipo, Grids, Wwdbigrd, Wwdbgrid, MontaSelect, Db, Wwdatsrc,
  DBTables, Wwquery, TREdit, DBClient, uCMClientDataSet, uCmSqlParams, UDataBase,
  uSistema, CMProcura, DBaseDados, FileCtrl, UMensErro, uCtrlFuncoesCapCar;

const
  MSG01 = 'Os arquivos para registro de cobrança foram implementados apenas para o banco CAIXA.';
  MSG02 = 'Arquivo para registro de cobrança gerado com sucesso e disponibilizado ' + #13 + 'em: ';
  MSG03 = 'Arquivo para registro de cobrança não gerado, favor verificar.';
  MSG04 = 'Selecione um Portador Forma no campo Contas/Caixas x Tipo Cobr';
  MSG05 = 'A alteração neste filtro removerá os documentos listados nos campos "Disponíveis" e "Selecionados", continua?';
  MSG06 = 'Preenchimento incorreto do campo';
  MSG07 = 'Não existem documentos a exibir utilizando os filtros informados.' + #13#10 + 'Favor verifique os filtros e Selecione novamente.';

type
  TFrmRegistroCarteiraBoleto = class(TfrmOkCancelar)
    pnlTop: TPanel;
    rgpStatusBoleto: TRadioGroup;
    lblPortadorForma: TLabel;
    lblTipoDocum: TLabel;
    dblcPortadorForma: TwwDBLookupCombo;
    dblcTipoDoc: TwwDBLookupCombo;
    lblUsuarioLancamento: TLabel;
    lblModuloLanc: TLabel;
    dbclModuloLanc: TwwDBLookupCombo;
    dbclUsuarioLancamento: TwwDBLookupCombo;
    gbDatas: TGroupBox;
    lblData: TLabel;
    lblEmissao: TLabel;
    lblVencimento: TLabel;
    lblProgramada: TLabel;
    lblEmissao_a: TLabel;
    lblData_a: TLabel;
    lblVencimento_a: TLabel;
    lblProgramada_a: TLabel;
    dbeDataLanc: TCMDateTimePicker;
    dbeDataEmi: TCMDateTimePicker;
    dbeDataVenc: TCMDateTimePicker;
    dbeDataProgr: TCMDateTimePicker;
    dbeDataEmi_Fim: TCMDateTimePicker;
    dbeDataLanc_Fim: TCMDateTimePicker;
    dbeDataVenc_Fim: TCMDateTimePicker;
    dbeDataProgr_Fim: TCMDateTimePicker;
    BtnSelecionar: TBitBtn;
    GpbNumDocumento: TGroupBox;
    edtNumDocumento: TEdit;
    GrpValorMoeda: TGroupBox;
    lblValorMoeda_De: TLabel;
    lblValorMoeda_a: TLabel;
    pnlDivDisponiveis: TPanel;
    pnlDisponiveis: TPanel;
    pnlBotoes: TPanel;
    pnlDivSelecionados: TPanel;
    Panel1: TPanel;
    GrdDisponiveis: TwwDBGrid;
    GrdSelecionados: TwwDBGrid;
    MontaSelect: TMontaSelect;
    DsDisponiveis: TwwDataSource;
    DsSelecionados: TwwDataSource;
    BtnAddAll: TSpeedButton;
    btnAdd: TSpeedButton;
    BtnRemove: TSpeedButton;
    btnRemoveAll: TSpeedButton;
    pnlValor: TPanel;
    edtVlrTotal: TRealEdit;
    sqlTipoDoc: TCMSqlParams;
    cdsTipoDoc: TCMClientDataSet;
    cdsModLanc: TCMClientDataSet;
    cdsContas: TCMClientDataSet;
    sqlContas: TCMSqlParams;
    sqlModLanc: TCMSqlParams;
    sqlUsuLanc: TCMSqlParams;
    cdsUsuLanc: TCMClientDataSet;
    cdsModLancIDMODULO: TFloatField;
    cdsModLancNOMEMODULO: TStringField;
    cdsContasCODPORTFORMA: TFloatField;
    cdsContasDESCRICAO: TStringField;
    cdsTipoDocCODTIPDOC: TFloatField;
    cdsTipoDocDESCRICAO: TStringField;
    cdsUsuLancIDUSUARIO: TFloatField;
    cdsUsuLancNOMEUSUARIO: TStringField;
    gbxRazaoSocial: TGroupBox;
    ProcuraRz: TCMProcura;
    cdsSelecionados: TCMClientDataSet;
    cdsDisponiveis: TCMClientDataSet;
    sqlSelecionados: TCMSqlParams;
    sqlDisponiveis: TCMSqlParams;
    cdsDisponiveisCODDOCUMENTO: TFloatField;
    cdsDisponiveisNODOCUMENTO: TFloatField;
    cdsDisponiveisRAZAOSOCIAL: TStringField;
    cdsDisponiveisDATAPROGRAMADA: TDateTimeField;
    cdsDisponiveisNOSSONUMERO: TStringField;
    cdsDisponiveisVALOR: TFloatField;
    edtValorMoeda_De: TRealEdit;
    edtValorMoeda_a: TRealEdit;
    cdsSelecionadosCODDOCUMENTO: TFloatField;
    cdsSelecionadosNODOCUMENTO: TFloatField;
    cdsSelecionadosRAZAOSOCIAL: TStringField;
    cdsSelecionadosDATAPROGRAMADA: TDateTimeField;
    cdsSelecionadosNOSSONUMERO: TStringField;
    cdsSelecionadosVALOR: TFloatField;
    ds: TDataSource;
    cds: TCMClientDataSet;
    cdsRAZAOSOCIAL: TStringField;
    procedure BtnSelecionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
    procedure dblcPortadorFormaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure dblcPortadorFormaEnter(Sender: TObject);
    procedure GrdDisponiveisTitleButtonClick(Sender: TObject; AFieldName: string);
    procedure GrdSelecionadosTitleButtonClick(Sender: TObject; AFieldName: string);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveAllClick(Sender: TObject);
    procedure BtnAddAllClick(Sender: TObject);
    procedure edtNumDocumentoKeyPress(Sender: TObject; var Key: Char);
  private
    CtrlFuncoesCapCar: TCtrlFuncoesCapCar;
    sSqlLimpo, sNumDocumento: string;
    sNossoNumero: string; //Everson Cunha - SIG71745
    bErro: boolean;
    iNumNSA, iIdConta: Integer;
    sArquivo: TStringList;
    Query: TwwQuery;
    procedure PreparaAmbiente(iTp: Integer);
    function getBancoVinculado(iCodPlataforma: Integer): Integer;
    function getPath(iCodPlataforma: Integer): string;
    procedure LimpaFiltros;
    function GetSequence: Integer;
    function getQueryFiltro: string;
    function ValidaEntrada: Boolean;
    procedure FazQuery2(sqlparam: TCMSqlParams; sSql: string);
    function PovoaCds(cdsOrigem, cdsDestino: TCMClientDataSet): boolean;
    function QueryArquivoGerado: string;
    //procedure MarcaRegistrados(sCodDocumento: String);               //Everson Cunha - SIG71745
    procedure MarcaRegistrados(sCodDocumento: string; iTipo: Integer); //Everson Cunha - SIG71745
    function CompletaNumero(sNumero: string; iQtdeZero: Integer): string;
    procedure LimpaCDS(oCds: TCMClientDataSet);
  public
    { Public declarations }
  end;

var
  FrmRegistroCarteiraBoleto: TFrmRegistroCarteiraBoleto;

implementation

{$R *.DFM}

procedure TFrmRegistroCarteiraBoleto.BtnSelecionarClick(Sender: TObject);
var
  bPrimeiro: boolean;
  sSQL: TStringList; //Everson Cunha - SIG71745
begin
  inherited;
  if not (ValidaEntrada) then
    exit;

  FazQuery(Query, getQueryFiltro);
  bPrimeiro := true;
  sNumDocumento := EmptyStr;
  while not (Query.eof) do
  begin
    if bPrimeiro then
      sNumDocumento := Query.FieldByName('CODDOCUMENTO').AsString
    else
      sNumDocumento := sNumDocumento + ',' + Query.FieldByName('CODDOCUMENTO').AsString;
    bPrimeiro := false;
    Query.Next;
  end;

  if (sNumDocumento <> EmptyStr) then
  begin
        //Everson Cunha - SIG71745 - Início
    try
      sNumDocumento := CtrlFuncoesCapCar.QuebrarListaFiltro(1, '(D.CODDOCUMENTO', sNumDocumento, 1000);

      sSQL := TStringList.Create;
          //Verificar se os boletos foram agrupados ou não
      sSQL.Add('WITH DOCS AS (SELECT COUNT(*) AS QTDE, D.NOSSONUMERO');
      sSQL.Add('                FROM CM.DOCUMENTO D');
      sSQL.Add('               WHERE ' + sNumDocumento);
      sSQL.Add('            GROUP BY D.NOSSONUMERO)');
      sSQL.Add(' ');

      sSQL.Add('SELECT CASE WHEN DOCS.QTDE > 1 THEN NULL');
      sSQL.Add('       ELSE D.CODDOCUMENTO END AS CODDOCUMENTO,');
      sSQL.Add('       CASE WHEN DOCS.QTDE > 1 THEN NULL');
      sSQL.Add('       ELSE D.NODOCUMENTO END AS NODOCUMENTO,');
      sSQL.Add('       P.RAZAOSOCIAL, D.DATAPROGRAMADA, D.NOSSONUMERO,');
      sSQL.Add('       SUM(LANC.VLR_LIQ) AS VALOR');
      sSQL.Add('  FROM CM.DOCUMENTO D');
      sSQL.Add('  JOIN DOCS ON DOCS.NOSSONUMERO = D.NOSSONUMERO');
      sSQL.Add('  JOIN CM.PESSOA P ON P.IDPESSOA = D.IDFORCLI');
      sSQL.Add('  JOIN (SELECT L.CODDOCUMENTO, SUM(DECODE(L.DEBCRE, ''C'', L.VALOR *-1, L.VALOR)) AS VLR_LIQ');
      sSQL.Add('          FROM CM.LANCTODOCUM L');
      sSQL.Add('         WHERE L.OPERACAO <> 5');
      sSQL.Add('         GROUP BY L.CODDOCUMENTO) LANC ON LANC.CODDOCUMENTO = D.CODDOCUMENTO');
      sSQL.Add(' WHERE D.RECPAG = ''R'' AND ' + sNumDocumento);
      sSQL.Add(' GROUP BY CASE WHEN DOCS.QTDE > 1 THEN NULL');
      sSQL.Add('          ELSE D.CODDOCUMENTO END,');
      sSQL.Add('          CASE WHEN DOCS.QTDE > 1 THEN NULL');
      sSQL.Add('          ELSE D.NODOCUMENTO END,');
      sSQL.Add('          P.RAZAOSOCIAL, D.DATAPROGRAMADA, D.NOSSONUMERO');
      sSQL.Add(' ORDER BY DATAPROGRAMADA, RAZAOSOCIAL, VALOR');

      FazQuery2(sqlDisponiveis, sSQL.Text);

    finally
      FreeAndNil(sSQL);
    end;
        {
        sNumDocumento:= CtrlFuncoesCapCar.QuebrarListaFiltro(1,'(D.CODDOCUMENTO', sNumDocumento,1000);
        FazQuery2(sqlDisponiveis,'SELECT D.CODDOCUMENTO,  '+
                               '       D.NODOCUMENTO,   '+
                               '       P.RAZAOSOCIAL,   '+
                                '       D.DATAPROGRAMADA,'+
                                '       D.NOSSONUMERO,   '+
                                '       LANC.VLR_LIQ AS VALOR '+
                                '  FROM DOCUMENTO D           '+
                                '  JOIN PESSOA P ON (P.IDPESSOA = D.IDFORCLI)  '+
                                '  JOIN ( SELECT L.CODDOCUMENTO, SUM(DECODE(L.DEBCRE, ''C'', L.VALOR *-1, L.VALOR)) AS VLR_LIQ '+
                                '        FROM LANCTODOCUM L      '+
                                '       WHERE L.OPERACAO <> 5 '+
                                '       GROUP BY L.CODDOCUMENTO) LANC ON LANC.CODDOCUMENTO = D.CODDOCUMENTO '+
                                '  WHERE D.RECPAG = ''R''   AND ' + sNumDocumento +
                                '  ORDER BY D.DATAPROGRAMADA, P.RAZAOSOCIAL, LANC.VLR_LIQ ');}
        //Everson Cunha - SIG71745 - Fim

    if (cdsDisponiveis.IsEmpty) then
    begin
      MsgDlg(MSG07, 'Aviso', mtWarning, [mbOK], 0);
      exit;
    end;
  end
  else
  begin
    MsgDlg(MSG07, 'Aviso', mtWarning, [mbOK], 0);
    exit;
  end;
  PreparaAmbiente(1);
end;

procedure TFrmRegistroCarteiraBoleto.FormCreate(Sender: TObject);
begin
  inherited;
  iIdConta := 0;
  edtVlrTotal.Value := 0;
  sSqlLimpo := sqlDisponiveis.SQL.GetText;

  sArquivo := TStringList.Create;
  CtrlFuncoesCapCar := TCtrlFuncoesCapCar.Create;
  Query := TwwQuery.Create(nil);
  Query.DatabaseName := 'basedados';

  sqlDisponiveis.Prepare;
  sqlSelecionados.Prepare;
  sqlContas.Prepare;
  sqlTipoDoc.Prepare;
  sqlModLanc.Prepare;
  sqlUsuLanc.Prepare;

  sqlDisponiveis.open;
  sqlSelecionados.open;
  sqlContas.open;
  sqlTipoDoc.open;
  sqlModLanc.open;
  sqlUsuLanc.open;

  PreparaAmbiente(0);
  {sem este cds o componente ProcuraRz - estoura erros ao deletar}
  cds.CreateDataSet;
  cds.Insert;
end;

procedure TFrmRegistroCarteiraBoleto.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  cdsDisponiveis.Cancel;
  cdsSelecionados.Cancel;
  LimpaFiltros;
  PreparaAmbiente(0);
  if (dtmBaseDados.dbBaseDados.InTransaction) then
    dtmBaseDados.dbBaseDados.Rollback;
end;

function TFrmRegistroCarteiraBoleto.getBancoVinculado(iCodPlataforma: Integer): Integer;
begin
  FazQuery(Query, ' SELECT PO.CODPORTFORMA,                                  ' + 
                  ' BA.NUMBANCO                                              ' + 
                  ' FROM PORTADORFORMA PO                                    ' + 
                  ' JOIN PORTADORCONTA PC ON PC.CODPORTADOR = PO.CODPORTADOR ' + 
                  ' JOIN AGENCIABANCARIA AG ON AG.IDPESSOA = PC.IDAGENCIA    ' + 
                  ' JOIN BANCO BA ON BA.IDPESSOA = AG.IDBANCO                ' + 
                  ' WHERE PO.RECPAG = ''R''                                  ' + 
                  '  AND PO.CODPORTFORMA =  ' + IntToStr(iCodPlataforma)      );
  if not Query.isEmpty then
    result := Query.fieldbyname('NUMBANCO').AsInteger
  else
    result := 0;
end;

procedure TFrmRegistroCarteiraBoleto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  bbtnCancelar.Click;
  FreeAndNil(CtrlFuncoesCapCar);
  FreeAndnil(sArquivo);
  FreeAndNil(Query);
  cds.Cancel;
  inherited;
end;

procedure TFrmRegistroCarteiraBoleto.PreparaAmbiente(iTp: Integer);
begin
  bbtnConfirmar.Enabled := true;
  bbtnCancelar.Enabled := true;
  bbtnSair.Enabled := true;
  bbtnAjuda.Enabled := true;

  case iTp of
    0:
      begin
        rgpStatusBoleto.ItemIndex := iTp;
        bbtnConfirmar.Enabled := False;
      end;
    1:
      begin
        bbtnConfirmar.Enabled := not cdsSelecionados.isEmpty;
      end;
  end;
end;

function TFrmRegistroCarteiraBoleto.CompletaNumero(sNumero: string; iQtdeZero: Integer): string;
var
  i, iQtde: Integer;
begin
  iQtde := iQtdeZero - Length(Trim(sNumero));
  for i := 1 to iQtde do
    sNumero := '0' + sNumero;

  Result := sNumero;
end;

procedure TFrmRegistroCarteiraBoleto.bbtnConfirmarClick(Sender: TObject);
var
  sLinha: array[1..3] of string;
  sHead: string;
  iContador, iTotal: Integer;
  dValor: Double;
begin
  inherited;
  try
    dtmBaseDados.dbBaseDados.StartTransaction;
    if (getBancoVinculado(StrToInt(dblcPortadorForma.LookupValue)) <> 104) then
    begin
      MsgDlg(MSG01, 'Aviso', mtWarning, [mbOK], 0);
      dtmBaseDados.dbBaseDados.Rollback;
      exit;
    end;

    bErro := not (getPath(StrToInt(dblcPortadorForma.LookupValue)) <> EmptyStr);

    if not (bErro) then
    begin
      sNumDocumento := EmptyStr;
      sNossoNumero := EmptyStr; //Everson Cunha - SIG71745
      iTotal := cdsSelecionados.RecordCount;
      iContador := 1;
      cdsSelecionados.First;

      while (iTotal > 0) do
      begin
        if (iContador = 1) then
        begin
          if not cdsSelecionados.FieldByName('CODDOCUMENTO').IsNull then         //Everson Cunha - SIG71745
            sNumDocumento := cdsSelecionados.FieldByName('CODDOCUMENTO').AsString;

          sNossoNumero := QuotedStr(cdsSelecionados.FieldByName('NOSSONUMERO').AsString)    //Everson Cunha - SIG71745
        end
        else
        begin
          if not cdsSelecionados.FieldByName('CODDOCUMENTO').IsNull then         //Everson Cunha - SIG71745
            sNumDocumento := sNumDocumento + ',' + cdsSelecionados.FieldByName('CODDOCUMENTO').AsString;

          sNossoNumero := sNossoNumero + ',' + QuotedStr(cdsSelecionados.FieldByName('NOSSONUMERO').AsString);  //Everson Cunha - SIG71745
        end;

        if not cdsSelecionados.FieldByName('CODDOCUMENTO').IsNull then               //Everson Cunha - SIG71745
                  //MarcaRegistrados(cdsSelecionados.FieldByName('CODDOCUMENTO').AsString)  //Everson Cunha - SIG71745
          MarcaRegistrados(cdsSelecionados.FieldByName('CODDOCUMENTO').AsString, 1) //Everson Cunha - SIG71745
        else
          MarcaRegistrados(cdsSelecionados.FieldByName('NOSSONUMERO').AsString, 2); //Everson Cunha - SIG71745

        cdsSelecionados.Next;
        inc(iContador);
        iTotal := iTotal - 1;
      end;
    end;

      //bErro := (sNumDocumento = EmptyStr);                             //Everson Cunha - SIG71745
    bErro := (sNumDocumento = EmptyStr) and (sNossoNumero = EmptyStr); //Everson Cunha - SIG71745

    if not (bErro) then
    begin
      if sNumDocumento <> '' then //Everson Cunha - SIG71745
        sNumDocumento := CtrlFuncoesCapCar.QuebrarListaFiltro(1, '(D.CODDOCUMENTO', sNumDocumento, 1000);

      sNossoNumero := CtrlFuncoesCapCar.QuebrarListaFiltro(1, '(D.NOSSONUMERO', sNossoNumero, 1000); //Everson Cunha - SIG71745

      GetSequence;
      FazQuery(Query, QueryArquivoGerado);
      iContador := 1;
      dValor := 0;
      sArquivo.Clear;
      while not (Query.eof) do
      begin
        if (Trim(Query.FieldByName('ORDEM3').AsString) = 'P') or (Trim(Query.FieldByName('ORDEM3').AsString) = 'Q') or (Trim(Query.FieldByName('ORDEM3').AsString) = 'Y53') then    //edilaine - SIG63823
        begin
          sLinha[1] := Copy(Query.FieldByName('HEADER_ARQ').AsString, 1, 8);
          sLinha[2] := StringReplace(Query.FieldByName('HEADER_ARQ').AsString, Copy(Query.FieldByName('HEADER_ARQ').AsString, 1, 13), EmptyStr, [rfReplaceAll, rfIgnoreCase]);
          sLinha[3] := sLinha[1] + CompletaNumero(IntToStr(iContador), 5) + sLinha[2];
          Inc(iContador);
          dValor := dValor + Query.FieldByName('VLR').asCurrency; //Somar coluna valor
        end
        else if (Query.FieldByName('ORDEM').AsInteger = 5) then
        begin
                     {calculo do campo valor}
          sHead := Query.FieldByName('HEADER_ARQ').AsString;
          sLinha[1] := Copy(sHead, 1, 29);
          sLinha[2] := StringReplace(sHead, Copy(sHead, 1, 46), EmptyStr, [rfReplaceAll, rfIgnoreCase]);
          sLinha[3] := sLinha[1] + CompletaNumero(StringReplace(FormatFloat('#.00', dValor), ',', EmptyStr, [rfReplaceAll, rfIgnoreCase]), 17) + sLinha[2];
          sHead := sLinha[3];

                     {calculo do contador de registro}
          iContador := iContador - 1;
          sLinha[1] := Copy(sHead, 1, 17);
          sLinha[2] := StringReplace(sHead, Copy(sHead, 1, 29), EmptyStr, [rfReplaceAll, rfIgnoreCase]);
          sLinha[3] := sLinha[1] + CompletaNumero(IntToStr(iContador + 2), 6) + CompletaNumero(IntToStr(iContador div 2), 6) + sLinha[2];
        end
        else if (Query.FieldByName('ORDEM').AsInteger = 9) then
        begin
                     {contador já foi decrementando em ordem 5}
          sLinha[1] := Copy(Query.FieldByName('HEADER_ARQ').AsString, 1, 23);
          sLinha[2] := StringReplace(Query.FieldByName('HEADER_ARQ').AsString, Copy(Query.FieldByName('HEADER_ARQ').AsString, 1, 29), EmptyStr, [rfReplaceAll, rfIgnoreCase]);
          sLinha[3] := sLinha[1] + CompletaNumero(IntToStr(iContador + 4), 6) + sLinha[2];
        end
        else
          sLinha[3] := Query.FieldByName('HEADER_ARQ').AsString;
        sArquivo.Add(sLinha[3]);
        Query.Next;
      end;
      sArquivo.SaveToFile(getPath(StrToInt(dblcPortadorForma.LookupValue)));
      LimpaCDS(cdsSelecionados);
      edtVlrTotal.Value := 0;
      dtmBaseDados.dbBaseDados.Commit;
      MsgDlg(MSG02 + getPath(StrToInt(dblcPortadorForma.LookupValue)) + '.', 'Aviso', mtInformation, [mbOK], 0);
    end
    else
    begin
      dtmBaseDados.dbBaseDados.Rollback;
      MsgDlg(MSG03, 'Aviso', mtWarning, [mbOK], 0);
    end;
    bErro := False;
    PreparaAmbiente(1);
  except
    on e: Exception do
    begin
      dtmBaseDados.dbBaseDados.Rollback;
      MsgDlg(e.message, 'Erro', mtError, [mbOK], 0);
    end;
  end;
end;

procedure TFrmRegistroCarteiraBoleto.LimpaFiltros;
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TEdit) then
      TEdit(Components[i]).Text := EmptyStr
    else if (Components[i] is TCMDateTimePicker) then
      TCMDateTimePicker(Components[i]).Text := EmptyStr
    else if (Components[i] is TwwDBLookupCombo) then
      TwwDBLookupCombo(Components[i]).Text := EmptyStr
    else if (Components[i] is TRealEdit) then
      TRealEdit(Components[i]).Value := 0
  end;
  rgpStatusBoleto.ItemIndex := 0;
  ProcuraRz.Text := EmptyStr;
  sNumDocumento := EmptyStr;
  sNossoNumero := EmptyStr;  //Everson Cunha - SIG71745
  bErro := False;
  sArquivo.Clear;
  iNumNSA := 0;
  FazQuery2(sqlDisponiveis, sSqlLimpo);
  FazQuery2(sqlSelecionados, sSqlLimpo);
end;

function TFrmRegistroCarteiraBoleto.GetSequence: Integer;
begin
  FazQuery(Query, 'SELECT CM.SEQNSAREGBOLETOS.NEXTVAL FROM  DUAL');
  iNumNSA := Query.FieldByName('NEXTVAL').asInteger;
  result := iNumNSA;
end;

function TFrmRegistroCarteiraBoleto.getPath(iCodPlataforma: Integer): string;
var
  sNmArquivo, sCaminho: string;
  bBarra: Boolean;

  function Barra: string;
  var
    Caractere: string;
  begin
    Caractere := Copy(Query.FieldByName('PATHARQUIVOREM').AsString, Length(Query.FieldByName('PATHARQUIVOREM').AsString), 1);
    if (Caractere = '\') then
    begin
      bBarra := false;
      Result := EmptyStr;
    end
    else
    begin
      bBarra := True;
      Result := '\';
    end;
  end;

begin
  FazQuery(Query, 'SELECT PATHARQUIVOREM FROM PORTADORFORMA WHERE CODPORTFORMA = ' + InttoStr(iCodPlataforma));
  if not (Query.FieldByName('PATHARQUIVOREM').IsNull) then
  begin
    sNmArquivo := Barra + 'E' + FormatDateTime('DD', now) + CompletaNumero(IntToStr(iNumNSA), 5) + '.rem';
    result := Query.FieldByName('PATHARQUIVOREM').AsString + sNmArquivo;
  end
  else
    result := EmptyStr;

  {criar pasta se não existir}
  if (result <> EmptyStr) then
  begin
    if (bBarra) then
      sCaminho := StringReplace(result, '\E' + FormatDateTime('DD', now) + CompletaNumero(IntToStr(iNumNSA), 5) + '.rem', EmptyStr, [rfReplaceAll, rfIgnoreCase])
    else
      sCaminho := StringReplace(result, 'E' + FormatDateTime('DD', now) + CompletaNumero(IntToStr(iNumNSA), 5) + '.rem', EmptyStr, [rfReplaceAll, rfIgnoreCase]);

    if not (DirectoryExists(sCaminho)) then
      ForceDirectories(sCaminho);
  end;
end;

procedure TFrmRegistroCarteiraBoleto.bbtnSairClick(Sender: TObject);
begin
  bbtnCancelar.Click;
  inherited;
end;

function TFrmRegistroCarteiraBoleto.getQueryFiltro: string;
var
  sSQL: TStringList;
  sVlr: string;
begin
  try
    sSQL := TStringList.Create;
    sSQL.add(' SELECT D.CODDOCUMENTO ');
    sSQL.add(' FROM DOCUMENTO D ');
    sSQL.add(' JOIN LANCTODOCUM L ON L.CODDOCUMENTO = D.CODDOCUMENTO AND L.OPERACAO = 2 ');
    sSQL.add(' WHERE D.RECPAG = ''R'' ');
    sSQL.add(' AND D.NOSSONUMERO IS NOT NULL ');

    if (rgpStatusBoleto.ItemIndex = 0) then
    begin
      sSQL.add(' AND D.FLGREGISTRADO = ''N'' ');
      sSQL.add(' AND D.STATUS <> 2 '); //Osni Cavalcante - SIG 49975
    end
    else
      sSQL.add(' AND D.FLGREGISTRADO = ''S'' ');

    if (dblcPortadorForma.LookupValue <> EmptyStr) then
      sSQL.add(' AND D.CODPORTFORMA = ' + dblcPortadorForma.LookupValue);

    if (dblcTipoDoc.Text <> EmptyStr) then
      sSQL.add(' AND D.CODTIPDOC = ' + dblcTipoDoc.LookupValue);

    if (dbclModuloLanc.Text <> EmptyStr) then
      sSQL.add(' AND D.IDMODULO = ' + dbclModuloLanc.LookupValue);

    if (dbclUsuarioLancamento.Text <> EmptyStr) then
      sSQL.add(' AND D.IDUSUARIOINCLUSAO = ' + dbclUsuarioLancamento.LookupValue);

    if (ProcuraRz.Text <> EmptyStr) then
      sSQL.add(' AND D.IDFORCLI = ' + MontaSelect.ValoresChave[0]);

    if (dbeDataEmi.Text <> EmptyStr) then
      sSQL.add(' AND TO_DATE(D.DATAEMISSAO,''DD/MM/RRRR'') >=' + QuotedStr(dbeDataEmi.Text));

    if (dbeDataEmi_Fim.Text <> EmptyStr) then
      sSQL.add(' AND TO_DATE(D.DATAEMISSAO,''DD/MM/RRRR'') <=' + QuotedStr(dbeDataEmi_Fim.Text));

    if (dbeDataLanc.Text <> EmptyStr) then
      sSQL.add(' AND TO_DATE(L.DATALANCTO,''DD/MM/RRRR'') >=' + QuotedStr(dbeDataLanc.Text));

    if (dbeDataLanc_Fim.Text <> EmptyStr) then
      sSQL.add(' AND TO_DATE(L.DATALANCTO,''DD/MM/RRRR'') <=' + QuotedStr(dbeDataLanc_Fim.Text));

    if (dbeDataVenc.Text <> EmptyStr) then
      sSQL.add(' AND TO_DATE(D.DATAVENCTO,''DD/MM/RRRR'') >= ' + QuotedStr(dbeDataVenc.Text));

    if (dbeDataVenc_Fim.Text <> EmptyStr) then
      sSQL.add(' AND TO_DATE(D.DATAVENCTO,''DD/MM/RRRR'') <=' + QuotedStr(dbeDataVenc_Fim.Text));

    if (dbeDataProgr.Text <> EmptyStr) then
      sSQL.add(' AND TO_DATE(D.DATAPROGRAMADA,''DD/MM/RRRR'') >= ' + QuotedStr(dbeDataProgr.Text));

    if (dbeDataProgr_Fim.Text <> EmptyStr) then
      sSQL.add(' AND TO_DATE(D.DATAPROGRAMADA,''DD/MM/RRRR'') <= ' + QuotedStr(dbeDataProgr_Fim.Text));

    if (edtNumDocumento.Text <> EmptyStr) then
      sSQL.add(' AND D.NODOCUMENTO = ' + edtNumDocumento.Text);

    if (edtValorMoeda_De.Value > 0) then
      sSQL.add(' AND L.VALOR >= ' + StringReplace(FormatFloat('0.00', edtValorMoeda_De.Value), ',', '.', [rfReplaceAll, rfIgnoreCase]));

    if (edtValorMoeda_a.Value > 0) then
      sSQL.add(' AND L.VALOR <= ' + StringReplace(FormatFloat('0.00', edtValorMoeda_a.Value), ',', '.', [rfReplaceAll, rfIgnoreCase]));

    Result := sSQL.GetText;
  finally
    FreeAndNil(sSQL);
  end;
end;

procedure TFrmRegistroCarteiraBoleto.BtnRemoveClick(Sender: TObject);
begin
  inherited;
  if PovoaCds(cdsDisponiveis, cdsSelecionados) then
  begin
    edtVlrTotal.Value := edtVlrTotal.Value + cdsDisponiveis.FieldByName('VALOR').AsCurrency;
    cdsDisponiveis.Delete;
  end;
  PreparaAmbiente(1);
end;

function TFrmRegistroCarteiraBoleto.ValidaEntrada: Boolean;
begin
  result := True;

  if (dblcPortadorForma.Text = EmptyStr) then
  begin
    MsgDlg(MSG04, 'Aviso', mtWarning, [mbOK], 0);
    result := false;
  end;

  if (dbeDataEmi.Text <> EmptyStr) and (dbeDataEmi_Fim.Text <> EmptyStr) then
  begin
    if (dbeDataEmi.Date > dbeDataEmi_Fim.Date) then
    begin
      MsgDlg(MSG06 + ' <Data Emissão>.', 'Aviso', mtWarning, [mbOK], 0);
      result := false;
    end;
  end;

  if (dbeDataLanc.Text <> EmptyStr) and (dbeDataLanc_Fim.Text <> EmptyStr) then
  begin
    if (dbeDataLanc.Date > dbeDataLanc_Fim.Date) then
    begin
      MsgDlg(MSG06 + ' <Data Lançamento>.', 'Aviso', mtWarning, [mbOK], 0);
      result := false;
    end;
  end;

  if (dbeDataVenc.Text <> EmptyStr) and (dbeDataVenc_Fim.Text <> EmptyStr) then
  begin
    if (dbeDataVenc.Date > dbeDataVenc_Fim.Date) then
    begin
      MsgDlg(MSG06 + ' <Data Vencimento>.', 'Aviso', mtWarning, [mbOK], 0);
      result := false;
    end;
  end;

  if (dbeDataProgr.Text <> EmptyStr) and (dbeDataProgr_Fim.Text <> EmptyStr) then
  begin
    if (dbeDataProgr.Date > dbeDataProgr_Fim.Date) then
    begin
      MsgDlg(MSG06 + ' <Data Programada>.', 'Aviso', mtWarning, [mbOK], 0);
      result := false;
    end;
  end;

  if (edtValorMoeda_De.Value > 0) and (edtValorMoeda_a.Value > 0) then
  begin
    if (edtValorMoeda_De.Value > edtValorMoeda_a.Value) then
    begin
      MsgDlg(MSG06 + ' <Valor Moeda Corrente>.', 'Aviso', mtWarning, [mbOK], 0);
      result := false;
    end;
  end;

  bErro := not result;
end;

procedure TFrmRegistroCarteiraBoleto.dblcPortadorFormaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (iIdConta = 0) then
  begin
    if (dblcPortadorForma.LookupValue <> EmptyStr) then
      iIdConta := StrToInt(dblcPortadorForma.LookupValue);
  end;

  if not (cdsDisponiveis.IsEmpty) or not (cdsSelecionados.IsEmpty) then
  begin
    if (MsgDlg(MSG05, 'Confirmação', mtConfirmation, [mbyes, mbNo], 0) = mrNo) then
    begin
      dblcPortadorForma.LookupValue := IntToStr(iIdConta);
      iIdConta := 0;
    end
    else
    begin
      iIdConta := StrToInt(dblcPortadorForma.LookupValue);
      FazQuery2(sqlDisponiveis, sSqlLimpo);
      FazQuery2(sqlSelecionados, sSqlLimpo);
      edtVlrTotal.Value := 0;
    end;
  end;
end;

procedure TFrmRegistroCarteiraBoleto.dblcPortadorFormaEnter(Sender: TObject);
begin
  inherited;
  if (dblcPortadorForma.LookupValue <> EmptyStr) then
    iIdConta := StrToInt(dblcPortadorForma.LookupValue)
  else
    iIdConta := 0;
end;

procedure TFrmRegistroCarteiraBoleto.FazQuery2(sqlparam: TCMSqlParams; sSql: string);
begin
  sqlparam.ClientDataSet.Close;
  sqlparam.SQL.Clear;
  sqlparam.SQL.Add(sSql);
  sqlparam.Open;
end;

procedure TFrmRegistroCarteiraBoleto.GrdDisponiveisTitleButtonClick(Sender: TObject; AFieldName: string);
begin
  inherited;
  cdsDisponiveis.IndexFieldNames := AFieldName;
end;

procedure TFrmRegistroCarteiraBoleto.GrdSelecionadosTitleButtonClick(Sender: TObject; AFieldName: string);
begin
  inherited;
  cdsSelecionados.IndexFieldNames := AFieldName;
end;

function TFrmRegistroCarteiraBoleto.PovoaCds(cdsOrigem, cdsDestino: TCMClientDataSet): boolean;
begin
  result := False;
  if (cdsOrigem.IsEmpty) then
    exit;

  cdsDestino.Insert;
  //Everson Cunha - SIG71745 - Início
  //cdsDestino.FieldByName('CODDOCUMENTO').asInteger   := cdsOrigem.FieldByName('CODDOCUMENTO').asInteger;
  //cdsDestino.FieldByName('NODOCUMENTO').asInteger    := cdsOrigem.FieldByName('NODOCUMENTO').asInteger;
  cdsDestino.FieldByName('CODDOCUMENTO').AsString := cdsOrigem.FieldByName('CODDOCUMENTO').AsString;
  cdsDestino.FieldByName('NODOCUMENTO').AsString := cdsOrigem.FieldByName('NODOCUMENTO').AsString;
  //Everson Cunha - SIG71745 - Fim
  cdsDestino.FieldByName('RAZAOSOCIAL').AsString := cdsOrigem.FieldByName('RAZAOSOCIAL').AsString;
  cdsDestino.FieldByName('DATAPROGRAMADA').AsDateTime := cdsOrigem.FieldByName('DATAPROGRAMADA').AsDateTime;
  cdsDestino.FieldByName('NOSSONUMERO').AsString := cdsOrigem.FieldByName('NOSSONUMERO').AsString;
  cdsDestino.FieldByName('VALOR').AsCurrency := cdsOrigem.FieldByName('VALOR').AsCurrency;
  cdsDestino.Post;

  PreparaAmbiente(1);

  result := True;
end;

procedure TFrmRegistroCarteiraBoleto.btnAddClick(Sender: TObject);
begin
  inherited;
  if (PovoaCds(cdsSelecionados, cdsDisponiveis)) then
  begin
    edtVlrTotal.Value := edtVlrTotal.Value - cdsSelecionados.FieldByName('VALOR').AsCurrency;
    cdsSelecionados.Delete;
  end;
  PreparaAmbiente(1);
end;

procedure TFrmRegistroCarteiraBoleto.btnRemoveAllClick(Sender: TObject);
begin
  inherited;
  cdsDisponiveis.First;
  while not (cdsDisponiveis.Eof) do
  begin
    if (PovoaCds(cdsDisponiveis, cdsSelecionados)) then
    begin
      edtVlrTotal.Value := edtVlrTotal.Value + cdsDisponiveis.FieldByName('VALOR').AsCurrency;
      cdsDisponiveis.Delete;
    end
  end;
  PreparaAmbiente(1);
end;

procedure TFrmRegistroCarteiraBoleto.BtnAddAllClick(Sender: TObject);
begin
  inherited;
  cdsSelecionados.First;
  while not (cdsSelecionados.Eof) do
  begin
    if (PovoaCds(cdsSelecionados, cdsDisponiveis)) then
    begin
      edtVlrTotal.Value := edtVlrTotal.Value - cdsSelecionados.FieldByName('VALOR').AsCurrency;
      cdsSelecionados.Delete;
    end;
  end;
  PreparaAmbiente(1);
end;

function TFrmRegistroCarteiraBoleto.QueryArquivoGerado: string;
var
  sSQL: TStringList;
  iSequencia, iVlrTotLote: Integer;
begin
  try
    iSequencia := 0;
    iVlrTotLote := 0;

    sSQL := TStringList.Create;

     //Verificar se os boletos foram agrupados ou não
     //Everson Cunha - SIG71745 - Início
    sSQL.Add('WITH DOCS AS (SELECT COUNT(*) AS QTDE, D.NOSSONUMERO');
    sSQL.Add('                FROM CM.DOCUMENTO D');
    sSQL.Add('               WHERE ');

    if sNumDocumento <> '' then
      sSQL.add('         (' + sNumDocumento + ' OR ' + sNossoNumero + ' ) ')
    else
      sSQL.add(sNossoNumero);

    sSQL.Add('            GROUP BY D.NOSSONUMERO)');
    sSQL.Add(' ');
     //Everson Cunha - SIG71745 - Fim

    sSQL.add('     -- HEADER DO ARQUIVO                                                                                                                  ');
    sSQL.add('     SELECT ''0'' ORDEM,                                                                                                                   ');
    sSQL.add('            NULL ORDEM2,                                                                                                                   ');
    sSQL.add('            NULL ORDEM3,                                                                                                                   ');
    sSQL.add('            0 VLR,                                                                                                                         ');
    sSQL.add('            LPAD(NVL(REGEXP_REPLACE(BA.NUMBANCO, ''\D''), ''0''), 3, ''0'') ||--BANCO,                                                     ');
    sSQL.add('            LPAD(''0'', 4, ''0'') ||--COD_LOTE,                                                                                            ');
    sSQL.add('            ''0'' ||--TP_REG,                                                                                                              ');
    sSQL.add('            RPAD('' '', 9) ||--FILLER,');
    sSQL.add('            DECODE(P.TIPO, ''F'', ''1'', ''J'', ''2'', ''0'') ||--TP_INSC,                                                                 ');
    sSQL.add('            LPAD(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), 14, ''0'') ||--NUM_INSC,                                                          ');
    sSQL.add('            LPAD(''0'', 20, ''0'') ||--USO_CAIXA,                                                                                          ');
    sSQL.add('            CASE                                                                                                                           ');
    sSQL.add('              WHEN INSTR(BA.MASCARAAGENCIA, ''-'') = 0 THEN                                                                                ');
    sSQL.add('                LPAD(NVL(REGEXP_REPLACE(AG.NUMAGENCIA, ''\W''), ''0''), 5, ''0'')                                                          ');
    sSQL.add('              ELSE                                                                                                                         ');
    sSQL.add('                LPAD(NVL(SUBSTR(REGEXP_REPLACE(AG.NUMAGENCIA, ''\W''), 0, INSTR(TRIM(BA.MASCARAAGENCIA), ''-'')-1), 0), 5, ''0'')          ');
    sSQL.add('            END ||--AGENCIA,                                                                                                               ');
    sSQL.add('            ''9'' ||--DV_AG, --No cadastro está com o DV 5                                                                                 ');
    sSQL.add('            LPAD(NVL(REGEXP_REPLACE(PO.NUMEMPRESABANCO, ''\D''), ''0''), 6, ''0'') ||--COD_CONV,                                           ');
    sSQL.add('            LPAD(''0'', 7, ''0'') ||--USO_CAIXA,                                                                                           ');
    sSQL.add('            LPAD(''0'', 1, ''0'') ||--USO_CAIXA,                                                                                           ');
    sSQL.add('            RPAD(UPPER(TRANSLATE(REGEXP_REPLACE(P.NOME, ''\W'', '' '') ||'' - ''|| REGEXP_REPLACE(P.RAZAOSOCIAL, ''\W'', '' ''),           ');
    sSQL.add('                       ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü'',''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu'')), 30) ||--NOME_EMPRESA,  ');
    sSQL.add('            RPAD(''CAIXA ECONOMICA FEDERAL'', 30) ||--NOME_BANCO,                                                                          ');
    sSQL.add('            RPAD('' '', 10) ||--FILLER,                                                                                                    ');
    sSQL.add('            ''1'' ||--COD_REMESSA,                                                                                                         ');
    sSQL.add('            TO_CHAR(SYSDATE, ''DDMMYYYYHH24MISS'') ||--DT_HORA_ARQ, --CAMPOS 17.0 e 18.0                                                   ');

    sSQL.add('            LPAD(' + IntToStr(iNumNSA) + ', 6, ''0'') ||--NSA,                                                                                 ');
    sSQL.add('            ''050'' ||--V_LEIAUTE_ARQ,                                                                                                     ');
    sSQL.add('            LPAD(''0'', 5, ''0'') ||--DENSIDADE_GRAVA,                                                                                     ');
    sSQL.add('            RPAD('' '', 20) ||--FILLER, ');
    sSQL.add('            RPAD(''REMESSA-PRODUCAO'', 20) ||--SIT_ARQ, --''REMESSA-TESTE''                                                                ');
    sSQL.add('            RPAD('' '', 4) ||--V_APLICATIVO_CAIXA,                                                                                         ');
    sSQL.add('            RPAD('' '', 25) /*FILLER*/ HEADER_ARQ                                                                                          ');
    sSQL.add('       FROM PESSOA P                                                                                                                       ');
    sSQL.add('        JOIN PORTADORFORMA PO ON PO.IDPESSOA = P.IDPESSOA                                                                                  ');
    sSQL.add('       JOIN PORTADORCONTA PC ON PC.CODPORTADOR = PO.CODPORTADOR                                                                            ');
    sSQL.add('       JOIN AGENCIABANCARIA AG ON AG.IDPESSOA = PC.IDAGENCIA                                                                               ');
    sSQL.add('       JOIN BANCO BA ON BA.IDPESSOA = AG.IDBANCO                                                                                           ');
    sSQL.add('      WHERE PO.RECPAG = ''R''                                                                                                              ');
    sSQL.add('        AND PO.CODPORTFORMA = ' + dblcPortadorForma.LookupValue);

    sSQL.add('     UNION ALL                                                                                                                             ');
    sSQL.add('     -- HEADER DO LOTE                                                                                                                     ');
    sSQL.add('     SELECT ''1'' ORDEM,                                                                                                                   ');
    sSQL.add('            NULL ORDEM2,                                                                                                                   ');
    sSQL.add('            NULL ORDEM3,                                                                                                                   ');
    sSQL.add('            0 VLR,                                                                                                                         ');
    sSQL.add('            LPAD(NVL(REGEXP_REPLACE(BA.NUMBANCO, ''\D''), ''0''), 3, ''0'') ||--BANCO,                                                     ');
    sSQL.add('            LPAD(''1'', 4, ''0'') ||--LOTE_SERVICO, /*deve ser acrescido a cada lote dentro do mesmo arquivo*/                             ');
    sSQL.add('            ''1'' ||--TP_REG,                                                                                                              ');
    sSQL.add('            ''R'' ||--TP_OPERACAO,                                                                                                         ');
    sSQL.add('            ''01'' ||--TP_SERVICO,                                                                                                         ');
    sSQL.add('            RPAD(''0'', 2, ''0'') ||--FILLER,                                                                                              ');
    sSQL.add('            ''030'' ||--V_LEIAUTE_LOTE,                                                                                                    ');
    sSQL.add('            RPAD('' '', 1) ||--FILLER,                                                                                                     ');
    sSQL.add('            DECODE(P.TIPO, ''F'', ''1'', ''J'', ''2'', ''0'') ||--TP_INSC,                                                                 ');
    sSQL.add('            LPAD(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), 15, ''0'') ||--NUM_INSC,                                                          ');
    sSQL.add('            LPAD(NVL(REGEXP_REPLACE(PO.NUMEMPRESABANCO, ''\D''), ''0''), 6, ''0'') ||--COD_CONV,                                           ');
    sSQL.add('            LPAD(''0'', 14, ''0'') ||--USO_CAIXA,                                                                                          ');
    sSQL.add('            CASE                                                                                                                           ');
    sSQL.add('              WHEN INSTR(BA.MASCARAAGENCIA, ''-'') = 0 THEN                                                                                ');
    sSQL.add('                LPAD(NVL(REGEXP_REPLACE(AG.NUMAGENCIA, ''\W''), ''0''), 5, ''0'')                                                          ');
    sSQL.add('              ELSE                                                                                                                         ');
    sSQL.add('                LPAD(NVL(SUBSTR(REGEXP_REPLACE(AG.NUMAGENCIA, ''\W''), 0, INSTR(TRIM(BA.MASCARAAGENCIA), ''-'')-1), 0), 5, ''0'')          ');
    sSQL.add('            END ||--AGENCIA,                                                                                                               ');
    sSQL.add('            ''9'' ||--DV_AG, --No cadastro está com o DV 5                                                                                 ');
    sSQL.add('            LPAD(NVL(REGEXP_REPLACE(PO.NUMEMPRESABANCO, ''\D''), ''0''), 6, ''0'') ||--COD_CONV,                                           ');
    sSQL.add('            LPAD(''0'', 7, ''0'') ||--MODELO_BOLETO,                                                                                       ');
    sSQL.add('            LPAD(''0'', 1, ''0'') ||--USO_CAIXA,                                                                                           ');
    sSQL.add('            RPAD(UPPER(TRANSLATE(REGEXP_REPLACE(P.NOME, ''\W'', '' '') ||'' - ''|| REGEXP_REPLACE(P.RAZAOSOCIAL, ''\W'', '' ''),           ');
    sSQL.add('                       ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü'',''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu'')), 30) ||--NOME_EMPRESA,  ');
    sSQL.add('            RPAD('' '', 40) ||--MSG1,                                                                                                      ');
    sSQL.add('            RPAD('' '', 40) ||--MSG2,                                                                                                      ');
    sSQL.add('            LPAD(' + IntToStr(iNumNSA) + ', 8, ''0'') ||--NSA,                                                                                 ');
    sSQL.add('            TO_CHAR(SYSDATE, ''DDMMYYYY'') ||--DT_ARQ,                                                                                     ');
    sSQL.add('            RPAD(''0'', 8, ''0'') ||--FILLER,                                                                                              ');
    sSQL.add('            RPAD('' '', 33) /*FILLER*/ HEADER_LOTE                                                                                         ');
    sSQL.add('       FROM PESSOA P                                                                                                                       ');
    sSQL.add('       JOIN PORTADORFORMA PO ON PO.IDPESSOA = P.IDPESSOA                                                                                   ');
    sSQL.add('       JOIN PORTADORCONTA PC ON PC.CODPORTADOR = PO.CODPORTADOR                                                                            ');
    sSQL.add('       JOIN AGENCIABANCARIA AG ON AG.IDPESSOA = PC.IDAGENCIA                                                                               ');
    sSQL.add('       JOIN BANCO BA ON BA.IDPESSOA = AG.IDBANCO                                                                                           ');
    sSQL.add('      WHERE PO.RECPAG = ''R''                                                                                                              ');
    sSQL.add('        AND PO.CODPORTFORMA = ' + dblcPortadorForma.LookupValue);

    sSQL.add('     UNION ALL                                                                                                                             ');
    sSQL.add('     -- SEGMENTO P                                                                                                                         ');
    sSQL.add('     SELECT ''3'' ORDEM,                                                                                                                   ');
    sSQL.add('            D.CODDOCUMENTO ORDEM2,                                                                                                         ');
    sSQL.add('            ''P'' ORDEM3,                                                                                                                  ');
     //Everson Cunha - SIG71745 - Início
     //sSQL.add('            LANC.VLR_LIQ,                                                                                                                  ');
    sSQL.add('            D.VLR_LIQ,                                                                                                                     ');
     //sSQL.add('            LPAD(NVL(REGEXP_REPLACE(BA.NUMBANCO, ''\D''), ''0''), 3, ''0'') ||--BANCO,                                                     ');
    sSQL.add('            LPAD(NVL(REGEXP_REPLACE(D.NUMBANCO, ''\D''), ''0''), 3, ''0'') ||--BANCO,                                                      ');
     //Everson Cunha - SIG71745 - Fim
    sSQL.add('            LPAD(''1'', 4, ''0'') ||--LOTE_SERVICO, /*deve ser o mesmo número do header deste lote*/                                       ');
    sSQL.add('            ''3'' ||--TP_REG,                                                                                                              ');
    sSQL.add('            LPAD(' + IntToStr(iSequencia) + ', 5, ''0'') ||--NSRL, /*número sequencial dos registros dentro do lote.*/                       ');
    sSQL.add('            ''P'' ||--COD_SEG,                                                                                                             ');
    sSQL.add('            '' '' ||--FILLER,                                                                                                              ');
    sSQL.add('            ''01'' ||--COD_MOV,/*01 - Entrada de Título*/                                                                                  ');
    sSQL.add('            CASE                                                                                                                           ');
     //Everson Cunha - SIG71745 - Início
     //sSQL.add('              WHEN INSTR(BA.MASCARAAGENCIA, ''-'') = 0 THEN                                                                                ');
    sSQL.add('              WHEN INSTR(D.MASCARAAGENCIA, ''-'') = 0 THEN                                                                                 ');
     //sSQL.add('                LPAD(NVL(REGEXP_REPLACE(AG.NUMAGENCIA, ''\W''), ''0''), 5, ''0'')                                                          ');
    sSQL.add('                LPAD(NVL(REGEXP_REPLACE(D.NUMAGENCIA, ''\W''), ''0''), 5, ''0'')                                                           ');
    sSQL.add('              ELSE                                                                                                                         ');
     //sSQL.add('                LPAD(NVL(SUBSTR(REGEXP_REPLACE(AG.NUMAGENCIA, ''\W''), 0, INSTR(TRIM(BA.MASCARAAGENCIA), ''-'')-1), 0), 5, ''0'')          ');
    sSQL.add('                LPAD(NVL(SUBSTR(REGEXP_REPLACE(D.NUMAGENCIA, ''\W''), 0, INSTR(TRIM(D.MASCARAAGENCIA), ''-'')-1), 0), 5, ''0'')            ');
     //Everson Cunha - SIG71745 - Fim
    sSQL.add('            END ||--AGENCIA,                                                                                                               ');
    sSQL.add('            ''9'' ||--DV_AG, --No cadastro está com o DV 5                                                                                 ');
     //sSQL.add('            LPAD(NVL(REGEXP_REPLACE(PO.NUMEMPRESABANCO, ''\D''), ''0''), 6, ''0'') ||--COD_CONV,                                           '); //Everson Cunha - SIG71745
    sSQL.add('            LPAD(NVL(REGEXP_REPLACE(D.NUMEMPRESABANCO, ''\D''), ''0''), 6, ''0'') ||--COD_CONV,                                            ');   //Everson Cunha - SIG71745
    sSQL.add('            LPAD(''0'', 8, ''0'') ||--USO_CAIXA,                                                                                           ');
    sSQL.add('            LPAD(''0'', 3, ''0'') ||--FILLER,                                                                                              ');
    sSQL.add('            SUBSTR(REGEXP_REPLACE(D.NOSSONUMERO, ''\D''), 0, 2) ||--MOD_CARTEIRA,                                                          ');
    sSQL.add('            --''14'' /*||--*/MOD_CARTEIRA,                                                                                                 ');
    sSQL.add('            LPAD(SUBSTR(REGEXP_REPLACE(D.NOSSONUMERO, ''\D''), 3, 15), 15, ''0'') ||--ID_TIT_BANCO,                                        ');
    sSQL.add('            ''1'' ||--COD_CARTEIRA,                                                                                                        ');
    sSQL.add('            ''1'' ||--FORMA_CAD, -- 1 Registrada, 2 Sem Registro                                                                         ');
    sSQL.add('            ''2'' ||--TP_DOC,                                                                                                              ');
    sSQL.add('            ''2'' ||--ID_EMISS_BOLETO,                                                                                                     ');
    sSQL.add('            ''0'' ||--ID_ENTREGA_BOLETO,                                                                                                   ');
    sSQL.add('            RPAD(D.CODDOCUMENTO, 11) ||--NUM_DOC,                                                                                          ');
    sSQL.add('            RPAD('' '', 4) ||--FILLER,                                                                                                     ');
    sSQL.add('            TO_CHAR(D.DATAPROGRAMADA, ''DDMMYYYY'') ||--DT_VENCTO,                                                                         ');
     //sSQL.add('            LPAD(LTRIM(REPLACE(TO_CHAR(LANC.VLR_LIQ, ''9999999999999D99''), '','', '''')), 15, ''0'') ||--VLR_NOMINAL,                     ');  //Everson Cunha - SIG71745
    sSQL.add('            LPAD(LTRIM(REPLACE(TO_CHAR(D.VLR_LIQ, ''9999999999999D99''), '','', '''')), 15, ''0'') ||--VLR_NOMINAL,                        ');    //Everson Cunha - SIG71745
    sSQL.add('            LPAD(''0'', 5, ''0'') ||--AG_COB,                                                                                              ');
    sSQL.add('            ''0'' ||--DV_AG_COB,                                                                                                           ');
    sSQL.add('            ''99'' ||--ESPECIE_TIT,                                                                                                        ');
    sSQL.add('            ''N'' ||--ACEITE,                                                                                                              ');
    sSQL.add('            TO_CHAR(NVL(D.DATAREMESSA, SYSDATE), ''DDMMYYYY'') ||--DT_EMISSAO_TIT,                                                         ');
    sSQL.add('            ''3'' ||--COD_JUROS_MORA, /*1-Valor por dia, 2-Taxa Mensal, 3-Isento*/                                                         ');
    sSQL.add('            LPAD(''0'', 8, ''0'') ||--DT_JUROS_MORA, --TO_CHAR(D.DATAPROGRAMADA+1, ''DDMMYYYY'')                                           ');
    sSQL.add('            LPAD(''0'', 15, ''0'') ||--JUROS_MORA,                                                                                         ');
    sSQL.add('            ''0'' ||--COD_DESCONTO,                                                                                                        ');
    sSQL.add('            LPAD(''0'', 8, ''0'') ||--DT_DESCONTO,                                                                                         ');
    sSQL.add('            LPAD(''0'', 15, ''0'') ||--PERC_DESCONTO,                                                                                      ');
    sSQL.add('            LPAD(''0'', 15, ''0'') ||--IOF,                                                                                                ');
    sSQL.add('            LPAD(''0'', 15, ''0'') ||--ABATIMENTO,                                                                                         ');
    sSQL.add('            RPAD(D.CODDOCUMENTO, 25) ||--NUM_DOC,                                                                                          ');
    sSQL.add('            ''3'' ||--PROTESTO,                                                                                                            ');
    sSQL.add('            ''00'' ||--PRAZO_PROTESTO,                                                                                                     ');
// SIG60046 - Everson Luiz - Início da Alteração
// Voltar a alteração que havia sido feita pelo Osni no SIG 51426
// SIG51426 Osni Cavalcante - Início da alteração
//     sSQL.add('            ''2'' ||--DEVOLUCAO,                                                                                                           ');
//     sSQL.add('            ''000'' ||--DIAS_BAIXA, /*De 005 a 120 dias corridos após data de vencimento quando código de baixa = 1 e 000 quando código de baixa = 2 */');
    sSQL.add('            ''1'' ||--DEVOLUCAO,                                                                                                           ');
    sSQL.add('            ''005'' ||--DIAS_BAIXA, /*De 005 a 120 dias corridos após data de vencimento*/                                                 ');
// SIG51426 Osni Cavalcante - Fim da alteração
// SIG60046 - Everson Luiz - Fim da Alteração
    sSQL.add('            ''09'' ||--MOEDA,                                                                                                              ');
    sSQL.add('            LPAD(''0'', 10, ''0'') ||--FILLER,                                                                                             ');
    sSQL.add('            '' '' /*FILLER*/ SEGMENTO_P                                                                                                    ');

     //Everson Cunha - SIG71745 - Início
     {
     sSQL.add('       FROM DOCUMENTO D                                                                                                                    ');
     sSQL.add('       JOIN (                                                                                                                              ');
     sSQL.add('     SELECT L.CODDOCUMENTO, SUM(DECODE(L.DEBCRE, ''C'', L.VALOR*-1, L.VALOR)) VLR_LIQ                                                      ');
     sSQL.add('       FROM LANCTODOCUM L                                                                                                                  ');
     sSQL.add('      WHERE L.OPERACAO <> 5                                                                                                                ');
     sSQL.add('      GROUP BY L.CODDOCUMENTO) LANC ON LANC.CODDOCUMENTO = D.CODDOCUMENTO                                                                  ');
     sSQL.add('       JOIN PORTADORFORMA PO ON PO.CODPORTFORMA = D.CODPORTFORMA                                                                           ');
     sSQL.add('       JOIN PORTADORCONTA PC ON PC.CODPORTADOR = PO.CODPORTADOR                                                                            ');
     sSQL.add('       JOIN AGENCIABANCARIA AG ON AG.IDPESSOA = PC.IDAGENCIA                                                                               ');
     sSQL.add('       JOIN BANCO BA ON BA.IDPESSOA = AG.IDBANCO                                                                                           ');
     sSQL.add('       WHERE D.RECPAG = ''R''                                                                                                              ');
     sSQL.add('        AND '+ sNumDocumento +'                                                                                                            '); }

    sSQL.Add(' FROM (SELECT CASE WHEN DOCS.QTDE > 1 THEN D.CONTROLEREMESSA ');
    sSQL.Add('              ELSE D.CODDOCUMENTO END AS CODDOCUMENTO, ');
    sSQL.Add('              D.NOSSONUMERO, D.DATAPROGRAMADA, D.DATAREMESSA, D.CODPORTFORMA, BA.NUMBANCO, BA.MASCARAAGENCIA, ');
    sSQL.Add('              AG.NUMAGENCIA, PO.NUMEMPRESABANCO, SUM(LANC.VLR_LIQ) VLR_LIQ');
    sSQL.Add('         FROM DOCUMENTO D');
    sSQL.Add('         JOIN DOCS ON DOCS.NOSSONUMERO = D.NOSSONUMERO ');
    sSQL.Add('         JOIN ( SELECT L.CODDOCUMENTO, SUM(DECODE(L.DEBCRE, ''C'', L.VALOR*-1, L.VALOR)) VLR_LIQ ');
    sSQL.Add('                  FROM LANCTODOCUM L ');
    sSQL.Add('                 WHERE L.OPERACAO <> 5 ');
    sSQL.Add('                 GROUP BY L.CODDOCUMENTO) LANC ON LANC.CODDOCUMENTO = D.CODDOCUMENTO ');
    sSQL.Add('         JOIN PORTADORFORMA PO ON PO.CODPORTFORMA = D.CODPORTFORMA ');
    sSQL.Add('         JOIN PORTADORCONTA PC ON PC.CODPORTADOR = PO.CODPORTADOR ');
    sSQL.Add('         JOIN AGENCIABANCARIA AG ON AG.IDPESSOA = PC.IDAGENCIA ');
    sSQL.Add('         JOIN BANCO BA ON BA.IDPESSOA = AG.IDBANCO ');
    sSQL.Add('        WHERE D.RECPAG = ''R'' ');

    if sNumDocumento <> '' then
      sSQL.add('        AND (' + sNumDocumento + ' OR ' + sNossoNumero + ' )                                                                               ')
    else
      sSQL.add('        AND ' + sNossoNumero + '                                                                                                           ');

    sSQL.Add('        GROUP BY CASE WHEN DOCS.QTDE > 1 THEN D.CONTROLEREMESSA');
    sSQL.Add('                 ELSE D.CODDOCUMENTO END,');
    sSQL.Add('                 D.NOSSONUMERO, D.DATAPROGRAMADA, D.DATAREMESSA, D.CODPORTFORMA, BA.NUMBANCO, BA.MASCARAAGENCIA, ');
    sSQL.Add('                 AG.NUMAGENCIA, PO.NUMEMPRESABANCO) D ');
     //Everson Cunha - SIG71745 - Fim

    sSQL.add('     UNION ALL                                                                                                                             ');
    sSQL.add('     -- SEGMENTO Q                                                                                                                         ');
    sSQL.add('     SELECT ''3'' ORDEM,                                                                                                                   ');
    sSQL.add('            D.CODDOCUMENTO ORDEM2,                                                                                                         ');
    sSQL.add('            ''Q'' ORDEM3,                                                                                                                  ');
    sSQL.add('            0 VLR,                                                                                                                         ');
    //sSQL.add('            LPAD(NVL(REGEXP_REPLACE(BA.NUMBANCO, ''\D''), ''0''), 3, ''0'') ||--BANCO,                                                     '); //Everson Cunha - SIG71745
    sSQL.add('            LPAD(NVL(REGEXP_REPLACE(D.NUMBANCO, ''\D''), ''0''), 3, ''0'') ||--BANCO,                                                     ');    //Everson Cunha - SIG71745
    sSQL.add('            LPAD(''1'', 4, ''0'') ||--LOTE_SERVICO, /*deve ser o mesmo número do header deste lote*/                                       ');
    sSQL.add('            ''3'' ||--TP_REG,                                                                                                              ');
    sSQL.add('            LPAD(' + IntToStr(iSequencia) + ', 5, ''0'') ||--NSRL, /*número sequencial dos registros dentro do lote.*/                       ');
    sSQL.add('            ''Q'' ||--COD_SEG,                                                                                                             ');
    sSQL.add('            '' '' ||--FILLER,                                                                                                              ');
    sSQL.add('            ''01'' ||--COD_MOV,/*01 - Entrada de Título*/                                                                                  ');

    //Everson Cunha - SIG71745 - Início
    {
    sSQL.add('            DECODE(LENGTH(REGEXP_REPLACE(PAGADOR.NUMDOCUMENTO, ''\D'')), 11, ''1'', 14, ''2'', ''0'') ||--TP_INSCR_PAGADOR,                ');
    sSQL.add('            LPAD(NVL(REGEXP_REPLACE(PAGADOR.NUMDOCUMENTO, ''\D''), ''0''), 15, ''0'') ||--NO_INSCR_PAGADOR,                                ');
    sSQL.add('            RPAD(UPPER(TRANSLATE(REGEXP_REPLACE(NVL(PAGADOR.RAZAOSOCIAL, PAGADOR.NOME), ''\W'', '' ''),                                    ');
    sSQL.add('                ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü'', ''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu'')), 40) ||--RAZAOSOCIAL_PAGADOR, ');
    sSQL.add('            RPAD(NVL(TRIM(ED_PAGADOR.LOGRADOURO), '' ''), 25) ||--LOGRADOURO_PAGADOR,                                                      ');
    sSQL.add('            LPAD(NVL(TRIM(ED_PAGADOR.NUMERO), ''0''), 5, ''0'') ||--NUM_LOCAL_PAGADOR,                                                     ');
    sSQL.add('            RPAD(NVL(TRIM(ED_PAGADOR.COMPLEMENTO), '' ''), 10) ||--COMPL_LOGRA_PAGADOR,                                                    ');
    sSQL.add('            RPAD(NVL(TRIM(ED_PAGADOR.BAIRRO), '' ''), 15) ||--BAIRRO_PAGADOR,                                                              ');
    sSQL.add('            LPAD(NVL(TRIM(ED_PAGADOR.CEP), ''0''), 5, ''0'') ||--CEP_PAGADOR,                                                              ');
//     sSQL.add('            RPAD(NVL(SUBSTR(TRIM(ED_PAGADOR.CEP), 6, 3), '' ''), 3) ||--COMPL_CEP_PAGADOR,                                               '); //Everson Luiz - SIG71444
    sSQL.add('            LPAD(NVL(SUBSTR(TRIM(ED_PAGADOR.CEP), 6, 3), ''0''), 3, ''0'') ||--COMPL_CEP_PAGADOR,                                          '); //Everson Luiz - SIG71444
    sSQL.add('            RPAD(NVL(TRIM(C_PAGADOR.NOME), '' ''), 15) ||--CIDADE_PAGADOR,                                                                 ');
    sSQL.add('            RPAD(NVL(TRIM(C_PAGADOR.UF), '' ''), 2) ||--UF_PAGADOR,                                                                        ');}

    sSQL.add('            DECODE(LENGTH(REGEXP_REPLACE(D.NUMDOCUMENTO, ''\D'')), 11, ''1'', 14, ''2'', ''0'') ||--TP_INSCR_PAGADOR,                ');
    sSQL.add('            LPAD(NVL(REGEXP_REPLACE(D.NUMDOCUMENTO, ''\D''), ''0''), 15, ''0'') ||--NO_INSCR_PAGADOR,                                ');
    sSQL.add('            RPAD(UPPER(TRANSLATE(REGEXP_REPLACE(NVL(D.RAZAOSOCIAL, D.NOME), ''\W'', '' ''),                                    ');
    sSQL.add('                ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü'', ''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu'')), 40) ||--RAZAOSOCIAL_PAGADOR, ');
    sSQL.add('            RPAD(NVL(TRIM(D.LOGRADOURO), '' ''), 25) ||--LOGRADOURO_PAGADOR,                                                      ');
    sSQL.add('            LPAD(NVL(TRIM(D.NUMERO), ''0''), 5, ''0'') ||--NUM_LOCAL_PAGADOR,                                                     ');
    sSQL.add('            RPAD(NVL(TRIM(D.COMPLEMENTO), '' ''), 10) ||--COMPL_LOGRA_PAGADOR,                                                    ');
    sSQL.add('            RPAD(NVL(TRIM(D.BAIRRO), '' ''), 15) ||--BAIRRO_PAGADOR,                                                              ');
    sSQL.add('            LPAD(NVL(TRIM(D.CEP), ''0''), 5, ''0'') ||--CEP_PAGADOR,                                                              ');
    sSQL.add('            LPAD(NVL(SUBSTR(TRIM(D.CEP), 6, 3), ''0''), 3, ''0'') ||--COMPL_CEP_PAGADOR,                                          '); //Everson Luiz - SIG71444
    sSQL.add('            RPAD(NVL(TRIM(D.NOME), '' ''), 15) ||--CIDADE_PAGADOR,                                                                 ');
    sSQL.add('            RPAD(NVL(TRIM(D.UF), '' ''), 2) ||--UF_PAGADOR,                                                                        ');
    //Everson Cunha - SIG71745 - Fim

    sSQL.add('            ''0'' ||--TP_INSCR_BENEF,                                                                                                      ');
    sSQL.add('            LPAD(''0'', 15, ''0'') ||--NO_INSCR_BENEF,                                                                                     ');
    sSQL.add('            RPAD('' '', 40) ||-- NOME_BENEF,                                                                                               ');
// SIG60414 - Everson Luiz - Alterado o COD_BCO_COMP de '000' para '   '
    sSQL.add('            RPAD('' '', 3) ||--COD_BCO_COMP,                                                                                               ');
    sSQL.add('            RPAD('' '', 20) ||--NOSSO_NO_BCO_CORRESP,                                                                                      ');
    sSQL.add('            RPAD('' '', 8) /*FILLER*/ SEGMENTO_Q                                                                                           ');

    //Everson Cunha - SIG71745 - Início
    {
    sSQL.add('       FROM DOCUMENTO D                                                                                                                    ');
    sSQL.add('       JOIN PESSOA PAGADOR ON PAGADOR.IDPESSOA = D.IDFORCLI                                                                                ');
    sSQL.add('       JOIN PORTADORFORMA PO ON PO.CODPORTFORMA = D.CODPORTFORMA                                                                           ');
    sSQL.add('       JOIN PORTADORCONTA PC ON PC.CODPORTADOR = PO.CODPORTADOR                                                                            ');
    sSQL.add('       JOIN AGENCIABANCARIA AG ON AG.IDPESSOA = PC.IDAGENCIA                                                                               ');
    sSQL.add('       JOIN BANCO BA ON BA.IDPESSOA = AG.IDBANCO                                                                                           ');
    sSQL.add('       LEFT JOIN (SELECT MAX(E.IDENDERECO) MAX_ID,                                                                                         ');
    sSQL.add('                         E.IDPESSOA                                                                                                        ');
    sSQL.add('                    FROM ENDPESS E                                                                                                         ');
    sSQL.add('                   GROUP BY E.IDPESSOA) MAX_END_PAGADOR ON PAGADOR.IDPESSOA = MAX_END_PAGADOR.IDPESSOA                                     ');
    sSQL.add('       LEFT JOIN ENDPESS ED_PAGADOR ON ED_PAGADOR.IDENDERECO = MAX_END_PAGADOR.MAX_ID                                                      ');
    sSQL.add('       LEFT JOIN CIDADES C_PAGADOR ON C_PAGADOR.IDCIDADES = ED_PAGADOR.IDCIDADES                                                           ');
    sSQL.add('      WHERE D.RECPAG = ''R''                                                                                                               ');
    sSQL.add('        AND '+ sNumDocumento +'                                                                                                            ');}

    sSQL.Add(' FROM (SELECT CASE WHEN DOCS.QTDE > 1 THEN D.CONTROLEREMESSA ');
    sSQL.Add('              ELSE D.CODDOCUMENTO END AS CODDOCUMENTO, ');
    sSQL.Add('              D.NOSSONUMERO, D.DATAPROGRAMADA, D.DATAREMESSA, D.CODPORTFORMA, BA.NUMBANCO, BA.MASCARAAGENCIA, ');
    sSQL.Add('              AG.NUMAGENCIA, PO.NUMEMPRESABANCO, PAGADOR.RAZAOSOCIAL, PAGADOR.NOME, PAGADOR.NUMDOCUMENTO,     ');
    sSQL.Add('              ED_PAGADOR.LOGRADOURO, ED_PAGADOR.NUMERO, ED_PAGADOR.COMPLEMENTO, ED_PAGADOR.BAIRRO, ED_PAGADOR.CEP, C_PAGADOR.NOME CIDADE, C_PAGADOR.UF');
    sSQL.Add('         FROM DOCUMENTO D');
    sSQL.Add('         JOIN DOCS ON DOCS.NOSSONUMERO = D.NOSSONUMERO ');
    sSQL.Add('         JOIN PESSOA PAGADOR ON PAGADOR.IDPESSOA = D.IDFORCLI ');
    sSQL.Add('         JOIN PORTADORFORMA PO ON PO.CODPORTFORMA = D.CODPORTFORMA ');
    sSQL.Add('         JOIN PORTADORCONTA PC ON PC.CODPORTADOR = PO.CODPORTADOR ');
    sSQL.Add('         JOIN AGENCIABANCARIA AG ON AG.IDPESSOA = PC.IDAGENCIA ');
    sSQL.Add('         JOIN BANCO BA ON BA.IDPESSOA = AG.IDBANCO ');
    sSQL.Add('         LEFT JOIN (SELECT MAX(E.IDENDERECO) MAX_ID, E.IDPESSOA ');
    sSQL.Add('                      FROM ENDPESS E ');
    sSQL.Add('                     GROUP BY E.IDPESSOA) MAX_END_PAGADOR ON PAGADOR.IDPESSOA = MAX_END_PAGADOR.IDPESSOA ');
    sSQL.Add('         LEFT JOIN ENDPESS ED_PAGADOR ON ED_PAGADOR.IDENDERECO = MAX_END_PAGADOR.MAX_ID ');
    sSQL.Add('         LEFT JOIN CIDADES C_PAGADOR ON C_PAGADOR.IDCIDADES = ED_PAGADOR.IDCIDADES ');
    sSQL.Add('        WHERE D.RECPAG = ''R'' ');

    if sNumDocumento <> '' then
      sSQL.add('        AND (' + sNumDocumento + ' OR ' + sNossoNumero + ' )                                                                               ')
    else
      sSQL.add('        AND ' + sNossoNumero + '                                                                                                           ');

    sSQL.Add('        GROUP BY CASE WHEN DOCS.QTDE > 1 THEN D.CONTROLEREMESSA');
    sSQL.Add('                 ELSE D.CODDOCUMENTO END,');
    sSQL.Add('                 D.NOSSONUMERO, D.DATAPROGRAMADA, D.DATAREMESSA, ');
    sSQL.Add('                 D.CODPORTFORMA, BA.NUMBANCO, BA.MASCARAAGENCIA, ');
    sSQL.Add('                 AG.NUMAGENCIA, PO.NUMEMPRESABANCO, PAGADOR.RAZAOSOCIAL, ');
    sSQL.Add('                 PAGADOR.NOME, PAGADOR.NUMDOCUMENTO, ED_PAGADOR.LOGRADOURO, ');
    sSQL.Add('                 ED_PAGADOR.NUMERO, ED_PAGADOR.COMPLEMENTO, ');
    sSQL.Add('                 ED_PAGADOR.BAIRRO, ED_PAGADOR.CEP, C_PAGADOR.NOME, C_PAGADOR.UF) D ');
     //Everson Cunha - SIG71745 - Fim

    sSQL.add('     UNION ALL                                                                                                                             ');

     //edilaine - SIG64823 - inicio
    if (dblcPortadorForma.LookupValue = '204') or (dblcPortadorForma.LookupValue = '206')
                                               or (dblcPortadorForma.LookupValue = '208') then //Everson Cunha - SIG99067
    begin
      sSQL.add('     -- SEGMENTO Y-53                                                                                                                    ');
      sSQL.add('     SELECT ''3'' ORDEM,                                                                                                                 ');
      //sSQL.add('            D.CODDOCUMENTO ORDEM2,                                                                                                       '); //Everson Cunha - SIG71745
      sSQL.add('            CASE WHEN DOCS.QTDE > 1 THEN D.CONTROLEREMESSA ELSE D.CODDOCUMENTO END ORDEM2,                                               ');   //Everson Cunha - SIG71745
      sSQL.add('            ''Y53'' ORDEM3,                                                                                                              ');
      sSQL.add('            0 VLR,                                                                                                                       ');
      sSQL.add('            LPAD(NVL(REGEXP_REPLACE(BA.NUMBANCO, ''\D''), ''0''), 3, ''0'') ||--BANCO,                                                   ');
      sSQL.add('            LPAD(''1'', 4, ''0'') ||--LOTE_SERVICO, /*deve ser o mesmo número do header deste lote*/                                     ');
      sSQL.add('            ''3'' ||--TP_REG,                                                                                                            ');
      sSQL.add('            LPAD(' + IntToStr(iSequencia) + ', 5, ''0'') ||--NSRL, /*número sequencial dos registros dentro do lote.*/                     ');
      sSQL.add('            ''Y'' ||--COD_SEG,                                                                                                           ');
      sSQL.add('            '' '' ||--FILLER,                                                                                                            ');
      sSQL.add('            ''01'' ||--COD_MOV,/*01 - Entrada de Título*/                                                                                ');
      sSQL.add('            ''53'' ||--COD_REG,                                                                                                          ');
      sSQL.add('            ''04'' ||--TP_PAGTO,                                                                                                         ');
      sSQL.add('            ''00'' ||--QTD_PAGTO,                                                                                                        ');
      sSQL.add('            ''2''  ||--TP_VALOR_INFORMADO,/*2 - Valor*/                                                                                  ');
      sSQL.add('            ''999999999999999'' ||--VLR_MAXIMO,                                                                                          ');
      sSQL.add('            ''2''  ||--TP_VALOR_INFORMADO,/*2 - Valor*/                                                                                  ');
      sSQL.add('            ''000000000000500'' ||--VLR_MINIMO,                                                                                          ');
      sSQL.add('            RPAD('' '', 185) /*FILLER*/ SEGMENTO_Y                                                                                       ');
      sSQL.add('       FROM DOCUMENTO D                                                                                                                  ');
      sSQL.add('       JOIN DOCS ON DOCS.NOSSONUMERO = D.NOSSONUMERO                                                                                     '); //Everson Cunha - SIG71745
      sSQL.add('       JOIN PESSOA PAGADOR ON PAGADOR.IDPESSOA = D.IDFORCLI                                                                              ');
      sSQL.add('       JOIN PORTADORFORMA PO ON PO.CODPORTFORMA = D.CODPORTFORMA                                                                         ');
      sSQL.add('       JOIN PORTADORCONTA PC ON PC.CODPORTADOR = PO.CODPORTADOR                                                                          ');
      sSQL.add('       JOIN AGENCIABANCARIA AG ON AG.IDPESSOA = PC.IDAGENCIA                                                                             ');
      sSQL.add('       JOIN BANCO BA ON BA.IDPESSOA = AG.IDBANCO                                                                                         ');
      //Everson Cunha - SIG71745 - Início
      //Trecho não utilizado
      //sSQL.add('       LEFT JOIN (SELECT MAX(E.IDENDERECO) MAX_ID,                                                                                       ');
      //sSQL.add('                         E.IDPESSOA                                                                                                      ');
      //sSQL.add('                    FROM ENDPESS E                                                                                                       ');
      //sSQL.add('                   GROUP BY E.IDPESSOA) MAX_END_PAGADOR ON PAGADOR.IDPESSOA = MAX_END_PAGADOR.IDPESSOA                                   ');
      //sSQL.add('       LEFT JOIN ENDPESS ED_PAGADOR ON ED_PAGADOR.IDENDERECO = MAX_END_PAGADOR.MAX_ID                                                    ');
      //sSQL.add('       LEFT JOIN CIDADES C_PAGADOR ON C_PAGADOR.IDCIDADES = ED_PAGADOR.IDCIDADES                                                         ');
      //Everson Cunha - SIG71745 - Fim
      sSQL.add('      WHERE D.RECPAG = ''R''                                                                                                             ');

       //Everson Cunha - SIG71745 - Início
       //sSQL.add('        AND '+ sNumDocumento +'                                                                                                            ');

      if sNumDocumento <> '' then
        sSQL.add('        AND (' + sNumDocumento + ' OR ' + sNossoNumero + ' )                                                                               ')
      else
        sSQL.add('        AND ' + sNossoNumero + '                                                                                                           ');

      sSQL.add('     GROUP BY CASE WHEN DOCS.QTDE > 1 THEN D.CONTROLEREMESSA ELSE D.CODDOCUMENTO END, ');
      sSQL.add('     BA.NUMBANCO                                                                      ');
      //Everson Cunha - SIG71745 - Fim

      sSQL.add('     UNION ALL                                                                                                                           ');
    end;
     //edilaine - SIG64823 - Fim

    sSQL.add('     -- TRAILER LOTE                                                                                                                       ');
    sSQL.add('     SELECT ''5'' ORDEM,                                                                                                                   ');
    sSQL.add('            NULL ORDEM2,                                                                                                                   ');
    sSQL.add('            NULL ORDEM3,                                                                                                                   ');
    sSQL.add('            0 VLR,                                                                                                                         ');
    sSQL.add('            LPAD(NVL(REGEXP_REPLACE(BA.NUMBANCO, ''\D''), ''0''), 3, ''0'') ||--BANCO,                                                     ');
    sSQL.add('            LPAD(''1'', 4, ''0'') ||--LOTE_SERVICO, /*deve ser acrescido a cada lote dentro do mesmo arquivo*/                             ');
    sSQL.add('            ''5'' ||--TP_REG,                                                                                                              ');
    sSQL.add('            RPAD('' '', 9) ||--FILLER,                                                                                                     ');
    sSQL.add('            LPAD(' + IntToStr(iSequencia) + ' + 2, 6, ''0'') ||--QTD_REG_LOTE, /*conta o nº de linhas do REG 1 ao 5*/                        ');
    sSQL.add('            LPAD(' + IntToStr(iSequencia) + ' / 2, 6, ''0'') ||--QTD_TIT_LOTE, /*conta o nº de títulos. REG 3/P*/                            ');
    sSQL.add('            LPAD(' + IntToStr(iVlrTotLote) + ', 17, ''0'') ||--VLR_TIT_LOTE, /*somatória dos valores dos títulos. REG 3/P*/                  ');
    sSQL.add('            LPAD(''0'', 6, ''0'') ||--QTD_TIT_CAUCIONADO,                                                                                  ');
    sSQL.add('            LPAD(''0'', 17, ''0'') ||--VLR_TIT_CAUCIONADO,                                                                                 ');
    sSQL.add('            LPAD(''0'', 6, ''0'') ||--QTD_TIT_DESCONTADO,                                                                                  ');
    sSQL.add('            LPAD(''0'', 17, ''0'') ||--VLR_TIT_DESCONTADO,                                                                                 ');
    sSQL.add('            RPAD('' '', 31) ||--FILLER,                                                                                                    ');
    sSQL.add('            RPAD('' '', 117) /*FILLER*/ TRAILER_LOTE                                                                                       ');
    sSQL.add('       FROM PORTADORFORMA PO                                                                                                               ');
    sSQL.add('       JOIN PORTADORCONTA PC ON PC.CODPORTADOR = PO.CODPORTADOR                                                                            ');
    sSQL.add('       JOIN AGENCIABANCARIA AG ON AG.IDPESSOA = PC.IDAGENCIA                                                                               ');
    sSQL.add('       JOIN BANCO BA ON BA.IDPESSOA = AG.IDBANCO                                                                                           ');
    sSQL.add('      WHERE PO.RECPAG = ''R''                                                                                                              ');
    sSQL.add('        AND PO.CODPORTFORMA = ' + dblcPortadorForma.LookupValue);

    sSQL.add('     UNION ALL                                                                                                                             ');
    sSQL.add('     -- TRAILER ARQUIVO                                                                                                                    ');
    sSQL.add('     SELECT ''9'' ORDEM,                                                                                                                   ');
    sSQL.add('            NULL ORDEM2,                                                                                                                   ');
    sSQL.add('            NULL ORDEM3,                                                                                                                   ');
    sSQL.add('            0 VLR,                                                                                                                         ');
    sSQL.add('            LPAD(NVL(REGEXP_REPLACE(BA.NUMBANCO, ''\D''), ''0''), 3, ''0'') ||--BANCO,                                                     ');
    sSQL.add('            ''9999'' ||--LOTE_SERVICO,                                                                                                     ');
    sSQL.add('            ''9'' ||--TP_REG,                                                                                                              ');
    sSQL.add('            RPAD('' '', 9) ||--FILLER,                                                                                                     ');
    sSQL.add('            LPAD(''1'', 6, ''0'') ||--QTD_LOTE, /*conta o nº de lotes do arquivo*/                                                         ');
    sSQL.add('            LPAD(' + IntToStr(iSequencia) + ' + 4 , 6, ''0'') ||--QTD_REG_ARQUIVO, /*conta o nº de registros do arquivo. REG 0, 1, 3, 5 e 9*/');
    sSQL.add('            RPAD('' '', 6) ||--FILLER,                                                                                                     ');
    sSQL.add('            RPAD('' '', 205) /*FILLER*/ TRAILER_ARQUIVO                                                                                    ');
    sSQL.add('       FROM PORTADORFORMA PO                                                                                                               ');
    sSQL.add('       JOIN PORTADORCONTA PC ON PC.CODPORTADOR = PO.CODPORTADOR                                                                            ');
    sSQL.add('       JOIN AGENCIABANCARIA AG ON AG.IDPESSOA = PC.IDAGENCIA                                                                               ');
    sSQL.add('       JOIN BANCO BA ON BA.IDPESSOA = AG.IDBANCO                                                                                           ');
    sSQL.add('      WHERE PO.RECPAG = ''R''                                                                                                              ');
    sSQL.add('        AND PO.CODPORTFORMA = ' + dblcPortadorForma.LookupValue);

    sSQL.add('      ORDER BY 1, 2, 3                                                                                                                     ');
    Result := sSQL.Text;
  finally
    FreeAndNil(sSQL);
  end;
end;

procedure TFrmRegistroCarteiraBoleto.MarcaRegistrados(sCodDocumento: string; iTipo: Integer);
begin
  try
    if iTipo = 1 then //Everson Cunha - SIG71745
    begin
      ExecutarQuery(Query, 'UPDATE DOCUMENTO SET FLGREGISTRADO = ''S'', EMISBLOQ = ''S'', STATUS = 1 ' + 'WHERE CODDOCUMENTO = ' + sCodDocumento);
    end
    else
    begin
      //Everson Cunha - SIG71745 - Início
      ExecutarQuery(Query, 'UPDATE DOCUMENTO SET FLGREGISTRADO = ''S'', EMISBLOQ = ''S'', STATUS = 1 ' + 'WHERE NOSSONUMERO = ' + QuotedStr(sCodDocumento));
      //Everson Cunha - SIG71745 - Fim
    end;

  except
    on e: Exception do
      bErro := true;
  end;
end;

procedure TFrmRegistroCarteiraBoleto.edtNumDocumentoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', #08]) then
    Key := #;
end;

procedure TFrmRegistroCarteiraBoleto.LimpaCDS(oCds: TCMClientDataSet);
begin
  oCds.First;
  while not (oCds.Eof) do
    oCds.Delete;
end;

end.

