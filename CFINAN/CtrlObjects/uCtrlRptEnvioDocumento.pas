unit uCtrlRptEnvioDocumento;
{
--------------------------------------------------------------------------------
Rotina..........: btPesquisa
N. Sol..........: 90779
N. Kintana......: 383016
Data............: 12/11/2008
Responsável.....: Marilza Colpani
Descrição.......: Inclusão do campo PLNPLANIL na grid dbgrdDocumento
--------------------------------------------------------------------------------
Rotina..........: _DesfazEnvioMovimento, _GravaEnvioTabelaMovimento, SqlListaDocumento, SqlListaMovimento
N. Sol..........: 90187-90779-90780-90781
N. Kintana......: 380204-383016-383017-383018
Data............: 12/11/2008
Responsável.....: Marilza Colpani
Descrição.......: - Corrigido o envio de parte dos documentos de um lote;
                  - Resultado da pesquisa de Documentos está retornando Nodocumento;
                  - O último filtro do formulário está identificado (Nº Fatura).
                  - Inserido filtros: Data do Envio e Data da Baixa;
                  - Filtro Planilha Contábil foi referenciado ao campo PLNPLANIL da tabela PLANILHA;
                  - Ao alterar entre as abas ”Não Enviados” e “Enviados”, os Checks Box da opção Módulos permanecem ativados;
                  - Corrigido problemas da movimentação do Controle Financeiro;
                  - Corrigida as consultas por: Documento, Número AP/AR, Número do Lote, Valor Documento, Planilha Contábil;
                  - A Hora do Envio foi corrigida;
                  - Inserido Check Box nos documentos na opção “Enviados”;
                  - Inserido número da planilha contábil dos documentos;
                  - Valor do documento está sendo exibido corretamente;
                  - Corrigido as emissões de relatórios.
--------------------------------------------------------------------------------
Rotina..........: _DesfazEnvioDocumento, _GravaTodosDocumentos, SqlListaDocumento
N. Sol..........: 90187-90779-90780-90781
N. Kintana......: 380204-383016-383017-383018
Data............: 28/11/2008
Responsável.....: Marilza Colpani
Descrição.......: Inclusão do campo NUMLANCTO
--------------------------------------------------------------------------------
}

interface

uses SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet, uCMTypes,
     uDbEnvioDocumento, uSistema, DBClient, Classes, db;

type
  TTipoEnvio = (TpEnviado, TpNaoEnviado, TpRptEnviado, TpRptNaoEnviado);
  // Alterado por Arnaldo V. Scarin em 21/07/2008 - SOL 90781
  // TTipoData  = (TpLancamento, TpDisponibilidade);
  TTipoData  = (tdLancamento, tdDisponibilidade, tdEnvioContabilidade, tdBaixaDoc);
  TCtrlRptEnvioDocumento = class(TCMControlObject)
  private
    FDbEnvioDocumento: TDbEnvioDocumento;
    procedure SetDbEnvioDocumento(const Value: TDbEnvioDocumento);
  protected
    procedure AfterInitialize;   override;
    procedure OnCreateAppServer; override;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    property DbEnvioDocumento : TDbEnvioDocumento read FDbEnvioDocumento write SetDbEnvioDocumento;

    function GravaFazEnvioDocumento ( pDataIni,
                                      pDataFim : string;
                                      _OleMovimento,
                                      _OleDocumento : OleVariant;
                                      var pIdEnvioDocumento : Integer): Boolean;

    function GravaDesfazEnvioDocumento(_OleMovimento,
                                       _OleDocumento : OleVariant;
                                       IDEnvio       : String): Boolean;

    function ListaEnviodocumento: OleVariant;

    function ListaPesquisa(oDocumentoData: TCmClientDataSet;
                           DataIni,
                           DataFim       : String;
                           TipoData      : TTipoData;
                           Enviado       : TTipoEnvio;
                           IdEnvio       : String = '';
                           IdModulo      : String = ''; //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
                           NroDoc        : String = '';
                           NroApAr       : String = '';
                           NroLote       : String = '';
                           NroPlanContab : String = '';
                           VlrDocumento  : String = '') : OleVariant;


    function SqlListaMovimento(DataIni,
                               DataFim       : String;
                               TipoData      : TTipoData;
                               Enviado       : TTipoEnvio;
                               IdEnvio       : String = '';
                               CodLacFinan   : String = '';
                               IdModulo      : String = '';
                               NroDoc        : String = '';
                               NroApAr       : String = '';
                               NroLote       : String = '';
                               NroPlanContab : String = '';
                               VlrDocumento  : String = ''): String;

    function SqlListaMovimentoRpt(DataIni,
                                  DataFim     : String;
                                  TipoData    : TTipoData;
                                  Enviado     : TTipoEnvio;
                                  IdEnvio     : String = '';
                                  CodLacFinan : String = '';
                                  IdModulo    : String = ''): String;

    function SqlListaDocumento(DataIni,
                               DataFim       : String;
                               TipoData      : TTipoData;
                               Enviado       : TTipoEnvio;
                               IdEnvio       : String = '';
                               CodLacFinan   : String = '';
                               //IdModulo      : String = ''; //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
                               NroDoc        : String = '';
                               NroApAr       : String = '';
                               NroLote       : String = '';
                               NroPlanContab : String = '';
                               VlrDocumento  : String = '';
                               sFiltro       : String = ''): String;

    function ListCodEnvio(DataIni, DataFim: String): OleVariant;
  end;

implementation

var
  bTodos : Boolean;

{ TCtrlRptEnvioDocumento }

procedure TCtrlRptEnvioDocumento.AfterInitialize;
begin
  inherited;
  FDbEnvioDocumento.DataBaseName := DataBaseName;

end;

constructor TCtrlRptEnvioDocumento.Create;
begin
  inherited;
  FDbEnvioDocumento := TDbEnviodocumento.Create(self);
end;

destructor TCtrlRptEnvioDocumento.Destroy;
begin
  FreeAndNil (FDbEnvioDocumento);
  inherited;
end;

function TCtrlRptEnvioDocumento.GravaDesfazEnvioDocumento(_OleMovimento,
                                                          _OleDocumento : OleVariant;
                                                          IDEnvio       : String): Boolean;

      function _ProcuraIdEnvio(const _OleMovimento : OleVariant) : string;
      var oMov : TClientDataSet;
          sSql : String;
      begin
        Result := '';
        oMov := TClientDataSet.Create(nil);
        oMov.Data := _OleMovimento;
        oMov.First;
        while not( oMov.Eof ) do
        begin
          if oMov.FieldByName('SELECIONADO').AsString = '1' then
          begin
            If pos(oMov.FieldByName('IDEnvioDocumento').AsString,Result) = 0 then
              Result := Result + oMov.FieldByName('IdEnvioDocumento').AsString +',';
          end;
          oMov.Next;
        end; { while }
        oMov.Close;
        Result := '('+Copy(Result,1,Length(Result)-1)+')';
        FreeAndNil(oMov);
      end;

      function _DesfazEnvioDocumento(const _OleDocumento : OleVariant) : String;
      var oDoc : TClientDataSet;
          sSql : String;

      begin
        Result := '';
        oDoc := TClientDataSet.Create(nil);
        oDoc.Data := _OleDocumento;
        oDoc.First;

        bTodos := oDoc.IsEmpty();
       // bTodos := False;
        while not( oDoc.Eof ) do
        begin
          if oDoc.FieldByName('SELECIONADO').AsString = '1' then
          begin
            If pos(oDoc.FieldByName('IDEnvioDocumento').AsString,Result) = 0 then
              Result := Result + oDoc.FieldByName('IdEnvioDocumento').AsString +',';
            //Marilza 28/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
            sSQL := 'UPDATE LANCTODOCUM SET IDENVIODOCUMENTO = Null' +
                    ' WHERE NUMLANCTO = ' + oDoc.FieldByName('NUMLANCTO').AsString +
                    '   and CODDOCUMENTO = '+oDoc.FieldByName('CodDocumento').asString;
//            sSQL := 'UPDATE DOCUMENTO SET IDENVIODOCUMENTO = Null' +
//                    ' WHERE CODDOCUMENTO = ' + oDoc.FieldByName('CODDOCUMENTO').AsString;
            ExecSQL( sSQL );
            bTodos := True;
          end;
           // else
          //  bTodos := False;
          oDoc.Next;
        end; { while }
        oDoc.Close;
        Result := '('+Copy(Result,1,Length(Result)-1)+')';
        FreeAndNil(oDoc);
      end;
      // ---------------------------------------------------------------- //
      //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
      Function _DesfazEnvioMovimento(const _OleMovimento : OleVariant) : Boolean;
      var oLote : TClientDataSet;
          sSql : String;
      begin
        Result := False;
        oLote := TClientDataSet.Create(nil);
        oLote.Data := _OleMovimento;
        oLote.First;
        while not( oLote.Eof ) do
        begin
          if oLote.FieldByName('SELECIONADO').AsString = '1' then
          begin
            if bTodos then
            begin
              sSQL := 'UPDATE MOVIMFINANC SET IDENVIODOCUMENTO = Null' +
                      ' WHERE CODLANCFINANC = ' + oLote.FieldByName('CODLANCFINANC').asString;
              ExecSQL( sSQL );
            end;
            Result := True;
          end;
          oLote.Next;
        end; { while }
        oLote.Close;
        FreeAndNil(oLote);
      end;

var
  sSQL: String;
  sListaEnvio : String;
begin
  try
    StartTransaction;

    sListaEnvio := _DesfazEnvioDocumento(_OleDocumento);
    If (sListaEnvio = '()') then
    begin
      If IDEnvio <> '' then
        sListaEnvio := '('+IdEnvio+')'
      else
      begin
        sListaEnvio := _ProcuraIdEnvio(_OleMovimento);
        bTodos := True;
      end
    end;

    If ( _DesfazEnvioMovimento(_OleMovimento) and (bTodos) ) then
    begin
      sSQL := 'DELETE FROM ENVIODOCUMENTO WHERE IDENVIODOCUMENTO in ' + sListaEnvio;
      ExecSQL( sSQL );
    end;

    Commit;
    Result := True;
  except
    on E : Exception do
    begin
      Result := False;
      Rollback;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlRptEnvioDocumento.GravaFazEnvioDocumento( pDataIni,
                                                        pDataFim : string;
                                                        _OleMovimento,
                                                        _OleDocumento : OleVariant;
                                                        var pIdEnvioDocumento : Integer): Boolean;



      Function _GravaTodosDocumentos(const _OleDocumento     : Olevariant;
                                     const pCodigoLancamento : String;
                                     const iCodigoEnvio      : Integer;
                                     var sFiltro             : String     ): Boolean;
      var oDoc : TClientDataSet;
          sSql : String;
      begin
        oDoc := TClientDataSet.Create(nil);
        oDoc.Data := _OleDocumento;
        oDoc.Filter := 'CODLANCFINANC = '+pCodigoLancamento;
        oDoc.Filtered := True;
        result := True;
        oDoc.First;
        sFiltro := '';
        while not( oDoc.Eof ) do
        begin
          if oDoc.FieldByName('SELECIONADO').AsString = '1' then
          begin
            //Marilza 28/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
            sSQL := 'UPDATE LANCTODOCUM SET IDENVIODOCUMENTO = ' +
                    IntToStr( iCodigoEnvio ) +
                    ' WHERE NUMLANCTO = ' + oDoc.FieldByName('NUMLANCTO').AsString +
                    '   and CODDOCUMENTO = '+oDoc.FieldByName('CodDocumento').asString;
//            sSQL := 'UPDATE DOCUMENTO SET IDENVIODOCUMENTO = ' +
//                    IntToStr( iCodigoEnvio ) +
//                    ' WHERE CODDOCUMENTO = ' + oDoc.FieldByName('CODDOCUMENTO').AsString;
            ExecSQL( sSQL );
            sFiltro := sFiltro + oDoc.FieldByName('NUMLANCTO').AsString + ',';
          end
          else
            Result := False;
          oDoc.Next;
        end; { while }
        oDoc.Close;
        // Cria Filtro de Documentos para ser utilizado dentro da rotina
        // de Update do Lote
        If sFiltro <> '' then
          sFiltro := '('+Copy(sFiltro,1,length(sFiltro)-1)+')';

        FreeAndNil(oDoc);
      end;

      //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
      Procedure _GravaEnvioTabelaMovimento(const psCodigoLancamento : String;
                                           const piCodigoEnvio      : Integer;
                                           const psFiltro           : String);

      var oDoc : TClientDataSet;
          sSql : String;
      begin
        oDoc := TClientDataSet.Create(nil);
        try
          sSql := SqlListaDocumento(pDataIni,
                                    pDataFim,
                                    tdLancamento,
                                    tpNaoEnviado,
                                    '',
                                    psCodigoLancamento,
                                    '',
                                    '',
                                    '',
                                    '',
                                    '',
                                    psFiltro);
          oDoc.Data := GetDataPacket(sSql);
          If oDoc.IsEmpty then
          begin
            sSQL := 'UPDATE MOVIMFINANC SET IDENVIODOCUMENTO = ' +
                    IntToStr( piCodigoEnvio ) +
                    ' WHERE CODLANCFINANC = ' + psCodigoLancamento;
            ExecSQL( sSQL );
          end;
          oDoc.Close;
        finally
          FreeAndNil(oDoc);
        end;
      end;

var sSQL: String;
    sFiltro : String;
    oLote : TClientDataSet;
    FGravouEnvioDocumento: Boolean;
    iEnvioDocumento : Integer;

begin
  try { Finally }
    try { Except }
      oLote := TClientDataSet.Create(nil);
      oLote.Data := _OleMovimento;

      if not InTransaction then
        StartTransaction;

      oLote.First;

      FGravouEnvioDocumento := False;
      iEnvioDocumento := 0;

      while not( oLote.Eof ) do
      begin
        if oLote.FieldByName('SELECIONADO').AsString = '1' then
        begin
           // Caso não tenha sido gravado nenhum envio de documento ainda
          // gera o numero do idEnvioDocumento
          if not FGravouEnvioDocumento then
          begin
            FDbEnvioDocumento.Idusuario.AsInteger := Sistema.IdUsuario;
            if FDbEnvioDocumento.Insert then
            begin
              FGravouEnvioDocumento := True;
              iEnvioDocumento := FDbEnvioDocumento.Idenviodocumento.AsInteger;
            end
            else
               Exception.Create(FDbEnvioDocumento.MessageInfo);
          end;
          //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
          // Se gravou todos os documentos, ou todos os documentos já tem IdEnvioDocumento
          If _GravaTodosDocumentos(_OleDocumento,oLote.FieldByName('CODLANCFINANC').AsString,iEnvioDocumento, sFiltro) then
          begin
            //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
            // Grava o IDEnvioDocumento no Lote
            _GravaEnvioTabelaMovimento(oLote.FieldByName('CODLANCFINANC').AsString,iEnvioDocumento,sFiltro);//, aIdModulo);
          end;
        end;
        oLote.Next;
      end; { while }

      Commit;
      Result := FGravouEnvioDocumento;
      pIdEnvioDocumento := iEnvioDocumento;
    except
      on E : Exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
        pIdEnvioDocumento := -1;
      end;
    end;
  finally
    oLote.Close;
    FreeAndNil( oLote );
  end;
end;

function TCtrlRptEnvioDocumento.ListaEnvioDocumento: OleVariant;
begin
  result := GetDataPacket ('select * from enviodocumento');
end;

function TCtrlRptEnvioDocumento.ListaPesquisa(oDocumentoData: TCMClientDataSet;
                                              DataIni,
                                              DataFim       : String;
                                              TipoData      : TTipoData;
                                              Enviado       : TTipoEnvio;
                                              IdEnvio       : String = '';
                                              IdModulo      : String = '';
                                              NroDoc        : String = '';
                                              NroApAr       : String = '';
                                              NroLote       : String = '';
                                              NroPlanContab : String = '';
                                              VlrDocumento  : String = '') : OleVariant;
var
  sSql: String;
  oCds : TCMClientDataSet;

  Function _CodLancFinanceiro : String;
  begin
    Result := '';
    oCds.First;
    while not oCds.Eof do
    begin
      Result := Result + ',' + oCds.FieldByName('CODLANCFINANC').AsString;
      oCds.Next;
    end;
    Result := copy(Result,2,length(Result));
  end;

begin
  SSql := SqlListaMovimento(DataIni,
                           DataFim,
                           TipoData,
                           Enviado,
                           IdEnvio,
                           '',
                           IdModulo,
                           NroDoc,
                           NroApAr,
                           NroLote,
                           NroPlanContab,
                           VlrDocumento);

  result := GetDataPacket(sSQL);

  Try
    oCds := TCMClientDataSet.Create(Nil);
    oCds.Data := result;
    If Not oCds.IsEmpty then
    begin
      sSql := SqlListaDocumento(DataIni,
                                DataFim,
                                TipoData,
                                Enviado,
                                IdEnvio,
                                _CodLancFinanceiro(),
                                NroDoc,
                                NroApAr,
                                NroLote,
                                NroPlanContab,
                                VlrDocumento);
      oDocumentoData.Data := GetDataPacket(sSql);
    end;
    oCds.Close;
  finally
    FreeAndNil(oCds);
  end;
end;

function TCtrlRptEnvioDocumento.ListCodEnvio(DataIni, DataFim: String): OleVariant;
var sSQL: TStrings;
begin
  sSQL := TStringList.Create;
  sSQL.Clear;
  sSQL.Add('SELECT IDENVIODOCUMENTO');
  sSQL.Add('FROM ENVIODOCUMENTO');
  sSQL.Add('WHERE TRUNC(TRGDTINCLUSAO) >= TO_DATE(' + #39 + DataIni + #39 + ',''DD/MM/YYYY'') ');
  sSQL.Add('  AND TRUNC(TRGDTINCLUSAO) <= TO_DATE(' + #39 + DataFim + #39 + ',''DD/MM/YYYY'') ');
  sSQL.Add('  AND IDUSUARIO = '+ IntToStr( Sistema.IdUsuario ) );
  sSQL.Add('ORDER BY IDENVIODOCUMENTO');
  result := GetDataPacket(sSQL);
  FreeAndNil(sSQL);
end;

procedure TCtrlRptEnvioDocumento.OnCreateAppServer;
begin
  inherited;
  // será necessário apenas se tivermos um cds como propriedade
end;

procedure TCtrlRptEnvioDocumento.SetDbEnvioDocumento(const Value: TDbEnvioDocumento);
begin
  FDbEnvioDocumento := Value;
end;

function TCtrlRptEnvioDocumento.SqlListaDocumento(DataIni,
                                                  DataFim       : String;
                                                  TipoData      : TTipoData;
                                                  Enviado       : TTipoEnvio;
                                                  IdEnvio       : String = '';
                                                  CodLacFinan   : String = '';
                                                  NroDoc        : String = '';
                                                  NroApAr       : String = '';
                                                  NroLote       : String = '';
                                                  NroPlanContab : String = '';
                                                  VlrDocumento  : String = '';
                                                  sFiltro       : String = '') : String;

var
  sSQL: TStrings;
  sDataIni, sDataFim, sTipoEnvio, sDocEnvio, sBaixaDoc : String;
  i: integer;
begin
  sDataIni   := '';
  sDataFim   := '';
  sTipoEnvio := '';
  sBaixaDoc  := '';

  // //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
  // Deve ser feito um filtro para que somente as linhas com o tipo de operacao
  // igual a 5 (baixa de documentos) sejam listados para o join com a tabela de
  // documentos e com a tabela de recebimentos (RecebtoPagto), pois somente as
  // baixas sao enviadas à contabilidade, e dessa forma, o select original não
  // funciona corretamente.

  sSQL := TStringList.Create;
  sSQL.Clear;

  sSQL.Add('SELECT 0 as selecionado');
  sSQL.Add('      ,DECODE(LDC.IDENVIODOCUMENTO, NULL,''Não Encaminhado'', ''Encaminhado'') AS STATUS');
  //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
  //                           LDC.Operacao = 5: pois todos os registros dessa tabela são baixados
  //                           Doc.Operacao = 2: apesar de o documento ter sido baixado, o tipo de
  //                                             operacao não é o mesmo da baixa.
  //sSQL.Add('      ,SUM(DECODE(LDC.OPERACAO, DOC.OPERACAO, LDC.VALOR, 0)) AS VLRBRUTO');
  sSQL.Add('      ,SUM(DECODE(LDC.OPERACAO, 5, LDC.VALOR, 0)) AS VLRBRUTO');


  sSQL.Add('      ,SUM(DECODE(LDC.NUMLOTEMANUAL,NULL,0, LDC.VALOR)) AS VLRLIQUIDO');
 // sSQL.Add('      ,SUM(LDC.VALOR) AS VLRLIQUIDO'); //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018

  sSQL.Add('      ,REC.NUMLOTE');
  sSQL.Add('      ,''Manual'' AS TIPO');
  sSql.Add('      ,PLN.PLNPLANIL');      //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
  sSQL.Add('      ,MVC.CODLANCFINANC');
  sSQL.Add('      ,DOC.CODDOCUMENTO');
  sSQL.Add('      ,DOC.IDPESSOA');
  sSQL.Add('      ,DOC.IDFORCLI');
  sSQL.Add('      ,DOC.NODOCUMENTO');
  sSql.Add('      ,LDC.NUMLANCTO');  //Marilza 28/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
  sSQL.Add('      ,DOC.NUMAPGR');
  sSQL.Add('      ,PES.NOME');
  sSQL.Add('      ,PES.RAZAOSOCIAL');
  sSQL.Add('      ,LDC.IDENVIODOCUMENTO');
  sSQL.Add('FROM MOVIMFINANC MVC, RECBTOPAGTO REC, DOCUMENTO DOC, LANCTODOCUM LDC, PESSOA PES, PLANILHA PLN'); // Marilza 12/11/2008 N.Sol  / N.Kintana
  if enviado = tpenviado then
  begin
    sSql.Add( ', ENVIODOCUMENTO ENV'); // inclusao da tabela EnvioDocumento
  end;
  sSQL.Add('WHERE MVC.IDPESSOA = 1');
  sSQL.Add('  AND MVC.CODLANCFINANC = REC.CODLANCFINANC');
  sSQL.Add('  AND REC.CODDOCUMENTO  = LDC.CODDOCUMENTO');
  sSql.Add('  AND TRIM(DECODE(REC.NUMLOTE,NULL,REC.NUMCHQBORDERO,REC.NUMLOTE)) = TRIM(DECODE(LDC.NUMLOTEMANUAL,NULL,LDC.NUMRECIBO,LDC.NUMLOTEMANUAL))');
  sSQL.Add('  AND LDC.CODDOCUMENTO  = DOC.CODDOCUMENTO');
  sSQL.Add('  AND DOC.IDFORCLI      = PES.IDPESSOA');
  sSql.Add('  AND LDC.PLNCODIGO     = PLN.PLNCODIGO'); //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018

//Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
//  If TipoData = tdBaixaDoc then
//   sSQL.Add('  AND ((REC.NUMLOTE = LDC.NUMLOTEMANUAL) OR (5 = LDC.OPERACAO))');
////  else
  sSQL.Add('  AND ((REC.NUMLOTE = LDC.NUMLOTEMANUAL) OR (LDC.OPERACAO IN (2,5)))');


//Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
  if (enviado = tpEnviado) then
  begin
    sSql.Add( '  AND LDC.IDENVIODOCUMENTO = ENV.IDENVIODOCUMENTO');
//    sSql.Add( '  AND MVC.IDENVIODOCUMENTO(+) = ENV.IDENVIODOCUMENTO');
  end;

  if IdEnvio <> '' then
  begin
//    sSQL.Add('  AND MVC.IDENVIODOCUMENTO = '+IdEnvio);
    sSql.Add('  AND LDC.IDENVIODOCUMENTO = '+IdEnvio);
  end
  else
  begin
    If (DataIni <> '') or (DataFim <> '') then
    begin
      Case TipoData Of

        tdLancamento :
          begin
             //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
            if ((NroDoc = '') and (NroApAr = '') and (NroLote = '') and (VlrDocumento = '') and (NroPlanContab = '')) then
            begin
              sDataIni := '  AND MVC.DATALANCFINAN >= TO_DATE('+QuotedStr(DataIni)+',''DD/MM/YYYY'') ';
              sDataFim := '  AND MVC.DATALANCFINAN <= TO_DATE('+QuotedStr(DataFim)+',''DD/MM/YYYY'') ';
            end;
          end;

        tdDisponibilidade :
           begin
             if ((NroDoc = '') and (NroApAr = '') and (NroLote = '') and (VlrDocumento = '') and (NroPlanContab = '')) then
             begin
               sDataIni := '  AND MVC.DATADISPFINANC >= TO_DATE('+QuotedStr(DataIni)+',''DD/MM/YYYY'') ';
               sDataFim := '  AND MVC.DATADISPFINANC <= TO_DATE('+QuotedStr(DataFim)+',''DD/MM/YYYY'') ';
             end;
           end;

        tdEnvioContabilidade :
          begin
           if ((NroDoc = '') and (NroApAr = '') and (NroLote = '') and (VlrDocumento = '') and (NroPlanContab = '')) then
            begin
              sDataIni := '  AND TRUNC(ENV.TRGDTINCLUSAO) >= TO_DATE('+QuotedStr(DataIni)+',''DD/MM/YYYY'') ';  //
              sDataFim := '  AND TRUNC(ENV.TRGDTINCLUSAO) <= TO_DATE('+QuotedStr(DataFim)+',''DD/MM/YYYY'') ';  //
            end;
          end;

        tdBaixaDoc :
          begin
            if ((NroDoc = '') and (NroApAr = '') and (NroLote = '') and (VlrDocumento = '') and (NroPlanContab = '')) then
            begin
              sDataIni := '  AND LDC.DATALANCTO >= TO_DATE('+QuotedStr(DataIni)+',''DD/MM/YYYY'') ';
              sDataFim := '  AND LDC.DATALANCTO <= TO_DATE('+QuotedStr(DataFim)+',''DD/MM/YYYY'') ';
            end;
//              sBaixaDoc := '  and LDC.OPERACAO = ''5''';
          end;
      end;
    end;

    Case Enviado Of
      TpEnviado    : begin
                       //sTipoEnvio := '  AND MVC.IDENVIODOCUMENTO IS NOT NULL '; //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
                       sDocEnvio  := '  AND LDC.IDENVIODOCUMENTO IS NOT NULL ';
                     end;
      TpNaoEnviado : begin
                     //  sTipoEnvio := '  AND MVC.IDENVIODOCUMENTO IS NULL ';   //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
                       sDocEnvio  := '  AND LDC.IDENVIODOCUMENTO IS NULL ';
                     end;
    end;

    If (sDataIni <> '') and (NroDoc = EmptyStr) then //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
      sSql.Add(sDataIni);
    If (sDataFim <> '') and (NroDoc = EmptyStr) then //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
      sSql.Add(sDataFim);

    If (sBaixaDoc <> '') and (NroDoc = EmptyStr) then //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
      sSql.Add(sBaixaDoc);

    If sTipoEnvio <> '' then
      sSql.Add(sTipoEnvio);

    If sDocEnvio <> '' then
      sSql.Add(sDocEnvio);

    If NroApAr <> '' then
      sSQL.Add('  AND DOC.NUMAPGR = '+ QuotedStr(NroApAr));

    If NroDoc <> '' then
      sSQL.Add('  AND DOC.NODOCUMENTO = '+ QuotedStr(NroDoc));

    If VlrDocumento <> '' then
      sSQL.Add('  AND LDC.VALOR = '+ VlrDocumento );

    If (NroPlanContab <> '') and (enviado = tpEnviado) then
      sSQL.Add('  AND PLN.PLNPLANIL = '+ NroPlanContab );

    If sFiltro <> '' then
    Begin
      //Marilza 28/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
      sSql.Add('  AND NOT LDC.NUMLANCTO IN '+sFiltro);
//      sSql.Add('  AND NOT DOC.CODDOCUMENTO IN '+sFiltro);
    End;


  end;

  if CodLacFinan <> '' then
    sSQL.Add('  AND MVC.CODLANCFINANC IN ('+CodLacFinan+')');

  sSQL.Add('GROUP BY DECODE(LDC.IDENVIODOCUMENTO, NULL,''Não Encaminhado'', ''Encaminhado'')');
  sSQL.Add('        ,REC.NUMLOTE');
  sSql.Add('        ,PLN.PLNPLANIL'); //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
  sSQL.Add('        ,MVC.CODLANCFINANC');
  sSQL.Add('        ,DOC.CODDOCUMENTO');
  sSQL.Add('        ,DOC.IDPESSOA');
  sSQL.Add('        ,DOC.IDFORCLI');
  sSQL.Add('        ,DOC.NODOCUMENTO');
  sSql.Add('        ,LDC.NUMLANCTO'); //Marilza 28/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
  sSQL.Add('        ,DOC.NUMAPGR');
  sSQL.Add('        ,PES.NOME');
  sSQL.Add('        ,PES.RAZAOSOCIAL');
  sSQL.Add('        ,LDC.IDENVIODOCUMENTO');

//Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
//  If TipoData = tdBaixaDoc then
//    sSql.Add('HAVING SUM(DECODE(LDC.OPERACAO, ''5'', 0, LDC.VALOR)) > 0') //
//  else
  sSql.Add('HAVING SUM(DECODE(LDC.OPERACAO, 5, LDC.VALOR, 0)) > 0'); //

  //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
  // Se existe filtro de Documentos não deve ser utilizada o
  // union com o movimento financeiro
  If sFiltro = '' then
  begin
    sSQL.Add('UNION ALL');
    sSQL.Add('SELECT 0 as selecionado');
    sSQL.Add('      ,DECODE(MVC.IDENVIODOCUMENTO, NULL,''Não Encaminhado'', ''Encaminhado'') AS STATUS');
    sSQL.Add('      ,LOTX.VALOR AS VLRLIQUIDO');
    sSQL.Add('      ,LDC.VALOR  AS VALORBRUTO');
    sSQL.Add('      ,LOT.NUMLOTE');
    sSQL.Add('      ,''Lote''   AS TIPO');
    sSQl.Add('      ,PLN.PLNPLANIL');   //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
    sSQL.Add('      ,MVC.CODLANCFINANC');
    sSQL.Add('      ,DOC.CODDOCUMENTO');
    sSQL.Add('      ,DOC.IDPESSOA');
    sSQL.Add('      ,DOC.IDFORCLI');
    sSQL.Add('      ,DOC.NODOCUMENTO');
    sSql.Add('      ,0 as NUMLANCTO');  //Marilza 28/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
    sSQL.Add('      ,DOC.NUMAPGR');
    sSQL.Add('      ,PES.NOME');
    sSQL.Add('      ,PES.RAZAOSOCIAL');
    sSQL.Add('      ,MVC.IDENVIODOCUMENTO');
    sSQL.Add('FROM MOVIMFINANC MVC, LOTEPAGTO LOT, LOTEXDOCUM LOTX, DOCUMENTO DOC, LANCTODOCUM LDC, PESSOA PES, PLANILHA PLN'); //
    if (enviado = tpEnviado) then
    begin
     sSql.Add( ',ENVIODOCUMENTO ENV'); //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
    end;
    sSQL.Add('WHERE MVC.IDPESSOA = 1');
    sSQL.Add('  AND MVC.CODLANCFINANC = LOT.CODLANCFINANC');
    sSQL.Add('  AND LOT.NUMLOTE       = LOTX.NUMLOTE');
    sSQL.Add('  AND LOTX.CODDOCUMENTO = DOC.CODDOCUMENTO');
    sSQL.Add('  AND DOC.CODDOCUMENTO  = LDC.CODDOCUMENTO');
    sSQL.Add('  AND DOC.OPERACAO      = LDC.OPERACAO');
    sSQL.Add('  AND DOC.IDFORCLI      = PES.IDPESSOA');
    sSql.Add('  AND MVC.PLNCODIGO     = PLN.PLNCODIGO'); //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
    if (enviado = tpEnviado) then
    begin
     sSql.Add( '  AND MVC.IDENVIODOCUMENTO = ENV.IDENVIODOCUMENTO'); //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
    end;
    if IdEnvio <> '' then
    begin
      sSQL.Add('  AND MVC.IDENVIODOCUMENTO = '+IdEnvio);
//      sSql.Add('  AND DOC.IDENVIODOCUMENTO = '+IdEnvio); //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
    end
    else
    begin
      If sDataIni <> '' then
        sSql.Add(sDataIni);
      If sDataFim <> '' then
        sSql.Add(sDataFim);
      If sTipoEnvio <> '' then
        sSql.Add(sTipoEnvio);
      If sDocEnvio <> '' then
        sSql.Add(sDocEnvio);
    end; 

    if CodLacFinan <> '' then
      sSQL.Add('  AND MVC.CODLANCFINANC IN ('+CodLacFinan+')');
  end;
  result := sSQL.Text;
  FreeAndNil(sSQL);
end;

Function TCtrlRptEnvioDocumento.SqlListaMovimentoRpt(DataIni,
                                                    DataFim       : String;
                                                    TipoData      : TTipoData;
                                                    Enviado       : TTipoEnvio;
                                                    IdEnvio       : String = '';
                                                    CodLacFinan   : String = '';
                                                    IdModulo      : String = ''): String;
begin
  Case Enviado of
    TpEnviado    : Enviado := TpRptEnviado;
    TpNaoEnviado : Enviado := TpRptNaoEnviado;
  end;
  Result := SqlListaMovimento(DataIni,
                             DataFim,
                             TipoData,
                             Enviado,
                             IdEnvio,
                             '',
                             IdModulo);
end;



function TCtrlRptEnvioDocumento.SqlListaMovimento(DataIni,
                                                 DataFim       : String;
                                                 TipoData      : TTipoData;
                                                 Enviado       : TTipoEnvio;
                                                 IdEnvio       : String = '';
                                                 CodLacFinan   : String = '';
                                                 IdModulo      : String = '';
                                                 NroDoc        : String = '';
                                                 NroApAr       : String = '';
                                                 NroLote       : String = '';
                                                 NroPlanContab : String = '';
                                                 VlrDocumento  : String = ''): String;
var
  sSQL: TStrings;
  sDataIni, sDataFim, sTipoEnvio, sDocEnvio, sBaixaDoc : String;
  i : integer;
  bUnion : boolean;
begin
  sSQL := TStringList.Create;
  sSQL.Clear;
  bUnion := False;
  If (Pos('3',idModulo) <> 0) or
     (Pos('4',idModulo) <> 0) or
     (enviado = tpEnviado) then
  begin
    bUnion := True;
    sSQL.Add( 'SELECT Distinct (0) AS SELECIONADO');
    sSQL.Add( '      ,DECODE(MOV.IDENVIODOCUMENTO, NULL,''Não Encaminhado'', ''Encaminhado'') AS STATUS');
    sSQL.Add( '      ,MOV.HISTORICO');
    sSQL.Add( '      ,MOV.VALORLANCFINAN');
    sSQL.Add( '      ,MOV.NUMCHQBORDERO');
    sSQL.Add( '      ,MOV.DATALANCFINAN');
    sSQL.Add( '      ,MOV.ENTRADASAIDA');
    sSQL.Add( '      ,MOV.DATADISPFINANC');
    sSQL.Add( '      ,MOV.IDENVIODOCUMENTO');
    sSQL.Add( '      ,MOV.CODLANCFINANC');
    sSQL.Add( '      ,MOD.NOMEMODULO');
    sSQL.Add( '      ,PORT.DESCRICAO AS PORTADORCONTA');
    If (enviado <> tpEnviado) then
    begin
      sSQL.Add( '      ,(SELECT SUM(DECODE(LDC.OPERACAO, DOC.OPERACAO, LDC.VALOR, 0))');
      sSQL.Add( '        FROM MOVIMFINANC MVC, RECBTOPAGTO REC, DOCUMENTO DOC, LANCTODOCUM LDC, PESSOA PES, PLANILHA PLN');
      sSQL.Add( '        WHERE MVC.IDPESSOA = 1');
      sSQL.Add( '          AND MVC.CODLANCFINANC = REC.CODLANCFINANC');
      sSQL.Add( '          AND REC.CODDOCUMENTO  = LDC.CODDOCUMENTO');
      sSQL.Add( '          AND LDC.CODDOCUMENTO  = DOC.CODDOCUMENTO');
      sSQL.Add( '          AND DOC.IDFORCLI      = PES.IDPESSOA');
      sSQL.Add( '          AND LDC.PLNCODIGO     = PLN.PLNCODIGO');
      sSQL.Add( '          AND ((REC.NUMLOTE = LDC.NUMLOTEMANUAL) OR (LDC.OPERACAO IN (2,5))) ');
      //Marilza 28/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
      If (enviado = tpEnviado) then
      begin
        sSql.Add( '        AND MVC.DATALANCFINAN >= TO_DATE('+QuotedStr(DataIni)+',''DD/MM/YYYY'')');
        sSql.Add( '        AND MVC.DATALANCFINAN <= TO_DATE('+QuotedStr(DataFim)+',''DD/MM/YYYY'')');
      end;
      sSQL.Add( '          AND LDC.IDENVIODOCUMENTO IS NULL');
      sSQL.Add( '          AND MVC.CODLANCFINANC = MOV.CODLANCFINANC');
      sSQL.Add( '        GROUP BY MVC.CODLANCFINANC) AS DOCVALOR');
    end;
    //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
    //if enviado <> tpenviado then
    //begin
      //sSql.Add( '      ,LDC.PLNCODIGO');
    //end;
    sSQL.Add( 'FROM MOVIMFINANC MOV, MODULO MOD, PORTADORCONTA PORT, RECBTOPAGTO REC, DOCUMENTO DOC, LANCTODOCUM LDC');
    sSQL.Add( ', PLANILHA PLA');
    if enviado = tpenviado then
    begin
//      sSQL.Add( ', PLANILHA PLA');
      sSql.Add( ', ENVIODOCUMENTO ENV'); // inclusao da tabela EnvioDocumento
    end;
    sSQL.Add( 'WHERE MOV.IDPESSOA      = '+ IntToStr( Sistema.IdEmpresa ) );
    sSQL.Add( '  AND MOV.IDMODULO      = MOD.IDMODULO');
    sSQL.Add( '  AND MOV.CODPORTADOR   = PORT.CODPORTADOR');
    sSQL.Add( '  AND MOV.CODLANCFINANC = REC.CODLANCFINANC');
    sSQL.Add( '  AND REC.CODDOCUMENTO  = LDC.CODDOCUMENTO(+)');
    sSQL.Add( '  AND TRIM(DECODE(REC.NUMLOTE,NULL,REC.NUMCHQBORDERO,REC.NUMLOTE)) = TRIM(DECODE(LDC.NUMLOTEMANUAL,NULL,LDC.NUMRECIBO,LDC.NUMLOTEMANUAL))');
    sSQL.Add( '  AND LDC.CODDOCUMENTO  = DOC.CODDOCUMENTO');
    sSql.Add( '  AND LDC.PLNCODIGO     = PLA.PLNCODIGO(+)');
    sSql.Add( '  AND LDC.DATALANCTO    = PLA.PLNDATDIA(+)');
    if (enviado = tpEnviado) then
    begin
//      sSql.Add( '  AND LDC.PLNCODIGO     = PLA.PLNCODIGO(+)');
//      sSql.Add( '  AND LDC.DATALANCTO    = PLA.PLNDATDIA(+)');
      sSql.Add( '  AND LDC.IDENVIODOCUMENTO = ENV.IDENVIODOCUMENTO');
//      sSql.Add( '  AND LDC.IDENVIODOCUMENTO = MOV.IDENVIODOCUMENTO');
    end;
    //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
    if ( (TipoData <> tdLancamento) and
         ((IdEnvio <> '') or (NroDoc <> '') or (NroLote <>'') or (VlrDocumento <> '') or (NroPlanContab = '')) )then
    begin
     sSql.Add( '  AND (REC.CODDOCUMENTO IS NULL OR LDC.OPERACAO = 5)');
    end
    else
    begin
     sSql.Add( '  AND (REC.CODDOCUMENTO IS NULL OR LDC.OPERACAO IN (2,5))');
    end;
    if IdModulo <> '' then
      sSQL.Add('  AND MOD.IDMODULO IN ('+IdModulo+') ');

    if IdEnvio <> '' then
    begin
      sSQL.Add('  AND LDC.IDENVIODOCUMENTO = '+IdEnvio); //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
    end
    else
    begin
      If (DataIni <> '') or (DataFim <> '') then
      begin
        Case TipoData Of
           //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
           tdLancamento :
            begin
              if ( (NroDoc = '') and (NroApAr = '') and (NroLote = '') and (VlrDocumento = '') and (NroPlanContab = '')) then
              begin
                sDataIni := '  AND MOV.DATALANCFINAN >= TO_DATE('+QuotedStr(DataIni)+',''DD/MM/YYYY'') ';
                sDataFim := '  AND MOV.DATALANCFINAN <= TO_DATE('+QuotedStr(DataFim)+',''DD/MM/YYYY'') ';
              end;
            end;

           tdDisponibilidade :
             begin
               if ((NroDoc = '') and (NroApAr = '') and (NroLote = '') and (VlrDocumento = '') and (NroPlanContab = '')) then
               begin
                 sDataIni := '  AND MOV.DATADISPFINANC >= TO_DATE('+QuotedStr(DataIni)+',''DD/MM/YYYY'') ';
                 sDataFim := '  AND MOV.DATADISPFINANC <= TO_DATE('+QuotedStr(DataFim)+',''DD/MM/YYYY'') ';
               end;
              end;

          tdEnvioContabilidade :
            begin
             if ((NroDoc = '') and (NroApAr = '') and (NroLote = '') and (VlrDocumento = '') and (NroPlanContab = '')) then
              begin
                sDataIni := '  AND TRUNC(ENV.TRGDTINCLUSAO) >= TO_DATE('+QuotedStr(DataIni)+',''DD/MM/YYYY'') ';  //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
                sDataFim := '  AND TRUNC(ENV.TRGDTINCLUSAO) <= TO_DATE('+QuotedStr(DataFim)+',''DD/MM/YYYY'') ';  //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
              end;
            end;

          tdBaixaDoc :
            begin
              if ((NroDoc = '') and (NroApAr = '') and (NroLote = '') and (VlrDocumento = '') and (NroPlanContab = '')) then
              begin
                sDataIni := '  AND LDC.DATALANCTO >= TO_DATE('+QuotedStr(DataIni)+',''DD/MM/YYYY'') ';
                sDataFim := '  AND LDC.DATALANCTO <= TO_DATE('+QuotedStr(DataFim)+',''DD/MM/YYYY'') ';
              //If (DataIni <> '') and (DataFim <> '') then //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
              end;
                sBaixaDoc := '  and LDC.OPERACAO = ''5''';
            end;
         end;
      end;

      Case Enviado Of
        tpEnviado    : begin
                         sTipoEnvio := '  AND MOV.IDENVIODOCUMENTO IS NOT NULL ';
                         sDocEnvio  := '  AND LDC.IDENVIODOCUMENTO IS NOT NULL ';
                       end;
        tpNaoEnviado : begin
                         sTipoEnvio := '  AND MOV.IDENVIODOCUMENTO IS NULL ';   //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
                         sDocEnvio  := '  AND LDC.IDENVIODOCUMENTO IS NULL ';
                       end;
      end;

      If (sDataIni <> '') and (NroDoc = EmptyStr) then //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
        sSql.Add(sDataIni);

      If (sDataFim <> '') and (NroDoc = EmptyStr) then //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
        sSql.Add(sDataFim);

      If (sBaixaDoc <> '') and (NroDoc = EmptyStr) then //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
        sSql.Add(sBaixaDoc);

      If (sTipoEnvio <> '') and (enviado = tpNaoEnviado) then
        sSql.Add(sTipoEnvio);

      If (idModulo <> '9') then  //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
        iF (sDocEnvio <> '') then
          sSql.Add(sDocEnvio);

         If NroDoc <> '' then
        sSQL.Add('  AND DOC.NODOCUMENTO = '+ QuotedStr(NroDoc));

      If NroApAr <> '' then
        sSQL.Add('  AND DOC.NUMAPGR = '+ QuotedStr(NroApAr));

      If NroLote <> '' then
        sSQL.Add('  AND MOV.NUMCHQBORDERO = '+ QuotedStr(NroLote) );

      If VlrDocumento <> '' then
        sSQL.Add('  AND LDC.VALOR = '+ VlrDocumento );

      If (NroPlanContab <> '') then // and (enviado = tpEnviado) then  //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
        sSQL.Add('  AND PLA.PLNPLANIL = '+ NroPlanContab );
    end;

    if CodLacFinan <> '' then
      sSQL.Add( '  AND MOV.CODLANCFINANC IN ('+CodLacFinan+')');
    If (enviado <> tpEnviado) then
    begin
      sSQL.Add( '   AND (SELECT SUM(DECODE(LDC.OPERACAO, DOC.OPERACAO, LDC.VALOR, 0))');
      sSQL.Add( '        FROM MOVIMFINANC MVC, RECBTOPAGTO REC, DOCUMENTO DOC, LANCTODOCUM LDC, PESSOA PES, PLANILHA PLN');
      sSQL.Add( '        WHERE MVC.IDPESSOA = 1');
      sSQL.Add( '          AND MVC.CODLANCFINANC = REC.CODLANCFINANC');
      sSQL.Add( '          AND REC.CODDOCUMENTO  = LDC.CODDOCUMENTO');
      sSQL.Add( '          AND LDC.CODDOCUMENTO  = DOC.CODDOCUMENTO');
      sSQL.Add( '          AND DOC.IDFORCLI      = PES.IDPESSOA');
      sSQL.Add( '          AND LDC.PLNCODIGO     = PLN.PLNCODIGO');
      sSQL.Add( '          AND ((REC.NUMLOTE = LDC.NUMLOTEMANUAL) OR (LDC.OPERACAO IN (2,5))) ');
      //Marilza 28/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
      If (enviado = tpEnviado) then
      begin
        sSQL.Add( '        AND MVC.DATALANCFINAN >= TO_DATE('+QuotedStr(DataIni)+',''DD/MM/YYYY'')');
        sSql.Add( '        AND MVC.DATALANCFINAN <= TO_DATE('+QuotedStr(DataFim)+',''DD/MM/YYYY'')');
      end;
      sSQL.Add( '          AND LDC.IDENVIODOCUMENTO IS NULL');
      sSQL.Add( '          AND MVC.CODLANCFINANC = MOV.CODLANCFINANC');
      sSQL.Add( '        GROUP BY MVC.CODLANCFINANC) > 0');
    end;
  end;

  //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
  {if (Pos('9',idModulo) <> 0) or
     ((enviado = tpEnviado) and
      (NroDoc = EmptyStr) and (NroApAr = EmptyStr) and (VlrDocumento = EmptyStr)) then  }
  if ( (Pos('9',idModulo) <> 0) or (enviado = tpEnviado) ) and
     ((NroDoc = EmptyStr) and (NroApAr = EmptyStr) and (VlrDocumento = EmptyStr)) then
  begin
    If bUnion then
      sSql.Add('Union');

    sSQL.Add( 'SELECT Distinct (0) AS SELECIONADO');
    sSQL.Add( '      ,DECODE(MOV.IDENVIODOCUMENTO, NULL,''Não Encaminhado'', ''Encaminhado'') AS STATUS');
    sSQL.Add( '      ,MOV.HISTORICO');
    sSQL.Add( '      ,MOV.VALORLANCFINAN');
    sSQL.Add( '      ,MOV.NUMCHQBORDERO');
    sSQL.Add( '      ,MOV.DATALANCFINAN');
    sSQL.Add( '      ,MOV.ENTRADASAIDA');
    sSQL.Add( '      ,MOV.DATADISPFINANC');
    sSQL.Add( '      ,MOV.IDENVIODOCUMENTO');
    sSQL.Add( '      ,MOV.CODLANCFINANC');
    sSQL.Add( '      ,MOD.NOMEMODULO');
    sSQL.Add( '      ,PORT.DESCRICAO AS PORTADORCONTA');
    If enviado <> tpEnviado then
      sSQL.Add( '      ,0 AS QTDE');

    sSQL.Add( 'FROM MOVIMFINANC MOV, MODULO MOD, PORTADORCONTA PORT, RECBTOPAGTO REC ');
    sSQL.Add( ', PLANILHA PLA');
    if enviado = tpEnviado then
    begin
      sSql.Add( ', ENVIODOCUMENTO ENV'); // inclusao da tabela EnvioDocumento
    end;
    sSQL.Add( 'WHERE MOV.IDPESSOA      = '+ IntToStr( Sistema.IdEmpresa ) );
    sSQL.Add( '  AND MOV.IDMODULO      = MOD.IDMODULO');
    sSQL.Add( '  AND MOV.CODPORTADOR   = PORT.CODPORTADOR');
    sSQL.Add( '  AND MOV.CODLANCFINANC = REC.CODLANCFINANC(+)');
    sSql.Add( '  AND MOV.PLNCODIGO     = PLA.PLNCODIGO(+)');
    sSql.Add( '  AND MOV.DATALANCFINAN = PLA.PLNDATDIA(+)');

    if (enviado = tpEnviado) then
    begin
      sSql.Add( '  AND MOV.IDENVIODOCUMENTO = ENV.IDENVIODOCUMENTO'); //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018

    end;
    if ( (TipoData <> tdLancamento) and
         ((IdEnvio <> '') or (NroDoc <> '') or (NroLote <>'') or (VlrDocumento <> '') or (NroPlanContab = '')) )then
      sSql.Add( '  AND (REC.CODDOCUMENTO IS NULL)')
    else
      sSql.Add( '  AND (REC.CODDOCUMENTO IS NULL)');
    if IdModulo <> '' then
      sSQL.Add('  AND MOD.IDMODULO IN (''9'') ');

    if IdEnvio <> '' then
    begin
      sSQL.Add('  AND MOV.IDENVIODOCUMENTO = '+IdEnvio);
    end
    else
    begin
      If (DataIni <> '') or (DataFim <> '') then
      begin
        Case TipoData Of
          tdLancamento, tdBaixaDoc :
            begin
              if ( (NroDoc = '') and (NroApAr = '') and (NroLote = '') and (VlrDocumento = '') and (NroPlanContab = '')) then
              begin
                sDataIni := '  AND MOV.DATALANCFINAN >= TO_DATE('+QuotedStr(DataIni)+',''DD/MM/YYYY'') ';
                sDataFim := '  AND MOV.DATALANCFINAN <= TO_DATE('+QuotedStr(DataFim)+',''DD/MM/YYYY'') ';
              end;
            end;

          tdDisponibilidade :
            begin
              if ((NroDoc = '') and (NroApAr = '') and (NroLote = '') and (VlrDocumento = '') and (NroPlanContab = '')) then
              begin
                sDataIni := '  AND MOV.DATADISPFINANC >= TO_DATE('+QuotedStr(DataIni)+',''DD/MM/YYYY'') ';
                sDataFim := '  AND MOV.DATADISPFINANC <= TO_DATE('+QuotedStr(DataFim)+',''DD/MM/YYYY'') ';
             end;
            end;

          tdEnvioContabilidade :
            begin
             if ((NroDoc = '') and (NroApAr = '') and (NroLote = '') and (VlrDocumento = '') and (NroPlanContab = '')) then
              begin
                sDataIni := '  AND TRUNC(ENV.TRGDTINCLUSAO) >= TO_DATE('+QuotedStr(DataIni)+',''DD/MM/YYYY'') ';  //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
                sDataFim := '  AND TRUNC(ENV.TRGDTINCLUSAO) <= TO_DATE('+QuotedStr(DataFim)+',''DD/MM/YYYY'') ';  //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
              end;
            end;
         end;
      end;

      Case Enviado Of
        tpEnviado    : sTipoEnvio := '  AND MOV.IDENVIODOCUMENTO IS NOT NULL ';
        tpNaoEnviado : sTipoEnvio := '  AND MOV.IDENVIODOCUMENTO IS NULL ';   //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
      end;

      If (sDataIni <> '') and (NroDoc = EmptyStr) then //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
        sSql.Add(sDataIni);

      If (sDataFim <> '') and (NroDoc = EmptyStr) then //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
        sSql.Add(sDataFim);

      If sTipoEnvio <> '' then
        sSql.Add(sTipoEnvio);

      If NroLote <> '' then
        sSQL.Add('  AND MOV.NUMCHQBORDERO = '+ QuotedStr(NroLote) );

      If (NroPlanContab <> '') then // and (enviado = tpEnviado) then  //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
        sSQL.Add('  AND PLA.PLNPLANIL = '+ NroPlanContab );
    end;

    if CodLacFinan <> '' then
      sSQL.Add( '  AND MOV.CODLANCFINANC IN ('+CodLacFinan+')');

  end;
  result := sSQL.Text;
  FreeAndNil(sSQL);
end;

end.
