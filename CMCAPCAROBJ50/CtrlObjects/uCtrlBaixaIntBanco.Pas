{
--------------------------------------------------------------------------------
Rotina    : BaixaDocumento
Data      : 01/09/2006
Pendência : 23195
Autor     : Andre Tavares
Descrição : Utilizar o float do código de liquidação de baixa se o mesmo estiver preenchido.
--------------------------------------------------------------------------------
}
//------------------------------------------------------------------------------
//  Autor      : André Tavares
//  Rotina     : Diversas
//  Data       : 30/05/2006
//  Pendência  : 21102
//  Descrição  : Adaptação para fazer o lançamento no cfinan de acordo com o
//  portadorforma de retorno (vide sicob Cef CNAB 240 nota 42)
//------------------------------------------------------------------------------
// atualizado em 24/08/2004 - Andre tavares - pendência - 18013 - só processa um documento (um registro)
// por vez e não um pacote de dados cheio de documentos, portanto só vai fazer o commit para um documento por vez
// atualizado em 24/08/2004 - Andre tavares - pendência 17412 -
//                            criação do parâmetro pdataDisp na rotina bbtnConfirmarClick
// atualizado em 05/03/2004 - André Tavares - pendência 16170
// atualizado em 25/07/2003 - André Tavares - pendência 14439
// atualizado em 14/06/2004 - André Tavares - pendência 16953
// atualizado em 11/01/2006 - Andre Tavares - pendencia 21229 - retira os zeros à esquerda do campo nossoNumero
Unit
  uCtrlBaixaIntBanco;

Interface                      

Uses
  SysUtils, Classes, DB, DbClient, uCmControlObject, uCmDbObject, uDataBase, ComCtrls,
  uCMTypes, uMidasUtil, JclStrings, uCMClientDataSet, uCMSqlParams, uCtrlIntBanco,
  uCtrlPadroes, uCtrlFinanc, uCtrlDocumento, uDtmBaixaIntBanco, uCtrlBaixaDocumentos,
  dbaseDados, usistema, ucmFileUtils;

Type
  TCtrlBaixaIntBanco = Class(TCmControlObject)
  Protected
    Procedure DoChangeDataBase; override;
    Procedure OnCreateAppServer; override;
    Procedure AfterInitialize; override;
  Private
    DtmBaixaIntBanco    : TDtmBaixaIntBanco;
    CtrlDocumento       : TCtrlDocumento;
    CtrlLancFinanc      : TCtrlFinanc;
    CtrlIntBanco        : TCtrlIntBanco;
    CtrlBaixaDocumentos : TCtrlBaixaDocumentos;
    sDataLancto         : string;

    FUsaPlanoPatro      : Boolean;
    FIdUsuario          : Double;
    FIdModulo           : Double;
    FIdEspAcesso        : Double;
    FIdEmpresa          : Double;
    FPlanoConta         : Double;
    FParamIntegraRecPag : String;
    FPrefixoServidor    : String;
    FLancaBaixaFloat    : Boolean;
    FPartidaDobrada     : Boolean;
    FIntegraContab      : Boolean;

    FCdsAuxCodDoc    : TClientDataSet;
    FCdsPortaDorForma: TClientDataSet;
    FCdsModelosCnab  : TClientDataSet;
    FCdsDocumentos   : TClientDataSet;
    FCdsOcorrencia   : TClientDataSet;
    FCdsAlt          : TClientDataSet;
    FCdsAux          : TClientDataSet;
    FCdsUnid         : TClientDataSet;
    FCdsParamCAP     : TClientDataSet;
    FCds             : TClientDataSet;
    FsNomeArqLog: String;
    FbUsaPortFormaRetorno: boolean;

    Function StrToFloatDef(sValor: String; rDefault: Double): Double;
    Function DevolveString(sString, sCaracter: String): String;
    Function Devolvevirgula(sString, sCaracter: String): String;

    Procedure SetCdsAlt(const Value: TClientDataSet);
    Procedure SetCdsAux(const Value: TClientDataSet);
    Procedure SetCdsAuxCodDoc(const Value: TClientDataSet);
    Procedure SetCdsDocumentos(const Value: TClientDataSet);
    Procedure SetCdsModelosCnab(const Value: TClientDataSet);
    Procedure SetCdsOcorrencia(const Value: TClientDataSet);
    Procedure SetCdsParamCAP(const Value: TClientDataSet);
    Procedure SetCdsPortaDorForma(const Value: TClientDataSet);
    Procedure SetCdsUnid(const Value: TClientDataSet);
    Procedure SetCds( Const Value: TClientDataSet);
    procedure SetsNomeArqLog(const Value: String);
    function gravaLog(const sConteudo: string): string;
    procedure SetbUsaPortFormaRetorno(const Value: boolean);
  Public
    OnBaixa : TEventoBaixa;

    Constructor Create;  Override;
    Destructor  Destroy; Override;

    Function AbreOcorrencia( pCmbModeloCnabLookupValue : String ): Boolean;
    Function BuscaBaixa( pCmbModeloCnabLookupValue: Integer;
                         pDlgAbrirFileName,
                         pNomeEmpresa : String ) : TStrings;
    Function bbtnConfirmarClick( psListaRetorno : TStrings;
                                 pCodPortForma  : Integer;
                                 pNumChqBordero : Double;
                                 pDataBaixa     : TDateTime;
                                 pDataDisp      : TDateTime = 0; // André Tavares - pendência 17412 - 24/08/2004
                                 iCommit: integer = 100 // Alex commitar a x registros
                                 ) : Boolean;

    Procedure AbreQueries;
    Procedure FechaQueries;
    Procedure MontaGrid( psListaRetorno : TStrings;
                         pCmbModeloCnabLookupValue : String );

    Property IdEmpresa          : Double         Read FIdEmpresa          Write FIdEmpresa;
    Property IdModulo           : Double         Read FIdModulo           Write FIdModulo;
    Property IdUsuario          : Double         Read FIdUsuario          Write FIdUsuario;
    Property IdEspAcesso        : Double         Read FIdEspAcesso        Write FIdEspAcesso;
    Property UsaPlanoPatro      : Boolean        Read FUsaPlanoPatro      Write FUsaPlanoPatro;
    Property PlanoConta         : Double         Read FPlanoConta         Write FPlanoConta;
    Property RecPag             : String         Read FParamIntegraRecPag Write FParamIntegraRecPag;
    Property PrefixoServidor    : String         Read FPrefixoServidor    Write FPrefixoServidor;
    Property LancaBaixaFloat    : Boolean        Read FLancaBaixaFloat    Write FLancaBaixaFloat;
    Property IntegraContab      : Boolean        Read FIntegraContab      Write FIntegraContab;
    Property PartidaDobrada     : Boolean        Read FPartidaDobrada     Write FPartidaDobrada;
    Property CdsDocumentos      : TClientDataSet Read FCdsDocumentos      Write SetCdsDocumentos;
    Property CdsPortaDorForma   : TClientDataSet Read FCdsPortaDorForma   Write SetCdsPortaDorForma;
    Property CdsParamCAP        : TClientDataSet Read FCdsParamCAP        Write SetCdsParamCAP;
    Property CdsOcorrencia      : TClientDataSet Read FCdsOcorrencia      Write SetCdsOcorrencia;
    Property CdsAux             : TClientDataSet Read FCdsAux             Write SetCdsAux;
    Property CdsUnid            : TClientDataSet Read FCdsUnid            Write SetCdsUnid;
    Property CdsModelosCnab     : TClientDataSet Read FCdsModelosCnab     Write SetCdsModelosCnab;
    Property CdsAlt             : TClientDataSet Read FCdsAlt             Write SetCdsAlt;
    Property CdsAuxCodDoc       : TClientDataSet Read FCdsAuxCodDoc       Write SetCdsAuxCodDoc;
    Property Cds                : TClientDataSet Read FCds                Write SetCds;
    Property sNomeArqLog        : String read FsNomeArqLog write SetsNomeArqLog;
    Property bUsaPortFormaRetorno : boolean read FbUsaPortFormaRetorno write SetbUsaPortFormaRetorno; //  andre tavares 02/06/2006 - Pendência  : 21102 - propriedade que indica se usa portador forma de retorno para baixa
End;

Implementation

{ TCtrlBaixaIntBanco }

Constructor TCtrlBaixaIntBanco.Create;
Begin
  Inherited;
  OnBaixa := nil;
  FbUsaPortFormaRetorno := false;
End;


Destructor TCtrlBaixaIntBanco.Destroy;
Begin
  If isAppServer Then FreeCds( [ CdsDocumentos,   CdsPortaDorForma,  CdsParamCAP,
                                 CdsOcorrencia,   CdsAux,            CdsUnid,
                                 CdsModelosCnab,  CdsAlt,            CdsAuxCodDoc ] );
  DtmBaixaIntBanco.Free;
  CtrlDocumento.Free;
  CtrlLancFinanc.Free;
  CtrlIntBanco.Free;
  CtrlBaixaDocumentos.Free;
  Cds.Free;
  Inherited;
End;



Procedure TCtrlBaixaIntBanco.AfterInitialize;
Begin
  Inherited;
  Cds                 := TClientDataSet.Create( Nil );
  DtmBaixaIntBanco    := TDtmBaixaIntBanco.Create( Nil );

  CtrlDocumento       := TCtrlDocumento.Create;
  CtrlLancFinanc      := TCtrlFinanc.Create( IdEmpresa, IdModulo, IdUsuario, UsaPlanoPatro );
  CtrlIntBanco        := TCtrlIntBanco.Create;
  CtrlBaixaDocumentos := TCtrlBaixaDocumentos.Create;

  DtmBaixaIntBanco.SqlDocumentos.ClientDataSet    := CdsDocumentos;
  DtmBaixaIntBanco.SqlPortaDorForma.ClientDataSet := CdsPortaDorForma;
  DtmBaixaIntBanco.SqlParamCAP.ClientDataSet      := CdsParamCAP;
  DtmBaixaIntBanco.SqlOcorrencia.ClientDataSet    := CdsOcorrencia;
  DtmBaixaIntBanco.SqlAux.ClientDataSet           := CdsAux;
  DtmBaixaIntBanco.SqlUnid.ClientDataSet          := CdsUnid;
  DtmBaixaIntBanco.SqlModelosCnab.ClientDataSet   := CdsModelosCnab;
  DtmBaixaIntBanco.SqlAlt.ClientDataSet           := CdsAlt;
  DtmBaixaIntBanco.SqlAuxCodDoc.ClientDataSet     := CdsAuxCodDoc;

  CtrlDocumento.OpenTransaction                   := False;
  CtrlLancFinanc.OpenTransaction                  := False;
  CtrlIntBanco.OpenTransaction                    := False;

  CtrlDocumento.IdModulo                          := Trunc( IdModulo );
  CtrlDocumento.IdUsuario                         := Trunc( IdUsuario );
  CtrlDocumento.UsaPlanoPatro                     := UsaPlanoPatro;
  CtrlDocumento.IdEspAcesso                       := Trunc( IdEspAcesso );

  CtrlDocumento.InitializeAs( Self );
  CtrlLancFinanc.InitializeAs( Self );
  CtrlIntBanco.InitializeAs( Self );
  CtrlBaixaDocumentos.InitializeAs( Self );
End;




Procedure TCtrlBaixaIntBanco.DoChangeDataBase;
Begin
  Inherited;

End;





Procedure TCtrlBaixaIntBanco.OnCreateAppServer;
Begin
  Inherited;
  CdsDocumentos    := TClientDataSet.Create( Nil );
  CdsPortaDorForma := TClientDataSet.Create( Nil );
  CdsParamCAP      := TClientDataSet.Create( Nil );
  CdsOcorrencia    := TClientDataSet.Create( Nil );
  CdsAux           := TClientDataSet.Create( Nil );
  CdsUnid          := TClientDataSet.Create( Nil );
  CdsModelosCnab   := TClientDataSet.Create( Nil );
  CdsAlt           := TClientDataSet.Create( Nil );
  CdsAuxCodDoc     := TClientDataSet.Create( Nil );

End;

Procedure TCtrlBaixaIntBanco.SetCdsAlt(const Value: TClientDataSet);
Begin
  FCdsAlt := Value;
End;

Procedure TCtrlBaixaIntBanco.SetCdsAux(const Value: TClientDataSet);
Begin
  FCdsAux := Value;
End;

Procedure TCtrlBaixaIntBanco.SetCdsAuxCodDoc( Const Value: TClientDataSet);
Begin
  FCdsAuxCodDoc := Value;
End;

Procedure TCtrlBaixaIntBanco.SetCdsDocumentos( Const Value: TClientDataSet);
Begin
  FCdsDocumentos := Value;
End;

Procedure TCtrlBaixaIntBanco.SetCdsModelosCnab( Const Value: TClientDataSet);
Begin
  FCdsModelosCnab := Value;
End;

Procedure TCtrlBaixaIntBanco.SetCdsOcorrencia( Const Value: TClientDataSet);
Begin
  FCdsOcorrencia := Value;
End;

Procedure TCtrlBaixaIntBanco.SetCdsParamCAP( Const Value: TClientDataSet);
Begin
  FCdsParamCAP := Value;
End;

Procedure TCtrlBaixaIntBanco.SetCdsPortaDorForma( Const Value: TClientDataSet);
Begin
  FCdsPortaDorForma := Value;
End;

Procedure TCtrlBaixaIntBanco.SetCdsUnid(const Value: TClientDataSet);
Begin
  FCdsUnid := Value;
End;

Procedure TCtrlBaixaIntBanco.SetCds(const Value: TClientDataSet);
Begin
  FCds := Value;
End;

Procedure TCtrlBaixaIntBanco.AbreQueries;
Begin
  With DtmBaixaIntBanco Do Begin
    SqlDocumentos.Open; 

    CdsModelosCnab.Close;
    SqlModelosCnab.Prepare;
    SqlModelosCnab.ParamByName( 'PRECPAG' ).AsString := RecPag;
    SqlModelosCnab.Open;

    If Not SqlPortaDorForma.Prepared Then SqlPortaDorForma.Prepare;
    If Not SqlAlt.Prepared Then SqlAlt.Prepare;

    SqlParamcap.Sql.Text := 'SELECT ' +
                            ' INTEGRACONTAB,HISTPADFINAN,CODALTERADORABAT,' +
                            ' CODALTERADORDESC,CODALTERADORJUROS,CODALTERADORTARIF ' +
                            'FROM PARAMCAP ' +
                            'WHERE (IDPESSOA = '+ FloatToStr( IdEmpresa ) + ') AND ' +
                            '(RECPAG = ''' + RecPag +''')';
    SqlParamcap.Prepare;
    SqlParamcap.Open;

    Sqlunid.Sql.Text   := 'SELECT UNIDNEGOC FROM ' + PrefixoServidor +
                          'PARAMGLOBAL WHERE IDPESSOA = ' + FloatToStr( IdEmpresa );
    Sqlunid.Prepare;
    Sqlunid.Open;
  End;
End;

Procedure TCtrlBaixaIntBanco.FechaQueries;
Begin
  With DtmBaixaIntBanco Do Begin

    CdsAuxCodDoc.Close;

    CdsPortaDorForma.Close;
    If SqlPortaDorForma.Prepared Then SqlPortaDorForma.UnPrepare;

    CdsAlt.Close;
    If SqlAlt.Prepared Then SqlAlt.UnPrepare;
  End;
End;

Function TCtrlBaixaIntBanco.AbreOcorrencia( pCmbModeloCnabLookupValue : String ) : Boolean;
Begin
  CdsOcorrencia.Close;

  DtmBaixaIntBanco.SqlOcorrencia.Sql.Text :='SELECT ' +
                                            '  C.IDCODIGOSCNAB, ' +
                                            '  C.RECPAG, ' +
                                            '  C.IDMODELOSCNAB , ' +
                                            '  C.TIPO, ' +
                                            '  C.CODIGO, ' +
                                            '  C.DESCRICAO, ' +
                                            '  C.FLGINDICABAIXA, ' +

                                            // Rodolpho da Silva - P: 20932 - 21/12/2005
                                            '  C.FLGCONTABALTERADOR, ' +

                                            '  M.DESCRICAO AS DESCMODELO, C.CODALTERADOR ' + (* Gustavo - 06/03/2003 *)
                                            'FROM ' +
                                            '  CODIGOSCNAB C, MODELOSCNAB M ' +
                                            'WHERE ' +
                                            '  (C.IDMODELOSCNAB = ' +  pCmbModeloCnabLookupValue + ') AND ' +
                                            '  (C.RECPAG = ''' + RecPag + ''') AND ' +
                                            '  (C.IDMODELOSCNAB = M.IDMODELOSCNAB) AND ' +
                                            '  (C.RECPAG = M.RECPAG) ';
  DtmBaixaIntBanco.SqlOcorrencia.Open;

  If CdsOcorrencia.RecordCount = 0 Then Begin
    Result := False;

    If RecPag = 'R' Then
      MessageInfo := 'Falta indicação dos Códigos de Baixa para este tipo de Cobrança'
    Else
      MessageInfo := 'Falta indicação dos Códigos de Baixa para este tipo de Pagamento';

    CdsOcorrencia.Close;

  End Else Begin

    Result := True;
  End;
End;

Function TCtrlBaixaIntBanco.BuscaBaixa( pCmbModeloCnabLookupValue : Integer;
                                           pDlgAbrirFileName,
                                           pNomeEmpresa              : String ) : TStrings;
Begin
  If RecPag = 'R' Then Begin
    Result := CtrlIntBanco.BaixadeTitulosAutomatica( pCmbModeloCnabLookupValue,
                                              pDlgAbrirFileName,
                                              pNomeEmpresa )
  End Else Begin
    Result := CtrlIntBanco.BaixadeSispagAutomatica( pCmbModeloCnabLookupValue,
                                             pDlgAbrirFileName,
                                             pNomeEmpresa );
  End;
End;


// pendência 18013 - andre tavares - o log pode ser gravado também numa exceção dentro da function bbtnConfirmarClick
function TCtrlBaixaIntBanco.gravaLog(const sConteudo: string): string;
var Arq : Text;
    sNomeArq : string;
begin
  sNomeArq := 'Log_Docs_Nao_Recebidos_'+formatDateTime('YYMMDD', now)+'.txt';
  result := sNomeArq;
  try
    AssignFile(Arq, sNomeArq);
    if not FileExists(sNomeArq) then
    begin
      Rewrite(Arq);
      writeLn(Arq, 'RELAÇÃO DE DOCUMENTOS GRUPADOS NÃO BAIXADOS');
      writeLn(Arq, '--------------------------------------------------------------------------------------------------------------------------------------------------------------');
      writeLn(Arq, 'RAZAO SOCIAL                                                     CODGRUPOCNAB             CODDOCUMENTO             NODOCUMENTO              DATA PROGRAMADA        VALOR                       MOTIVO');
      writeLn(Arq, '---------------------------------------------------------------- ------------------------ ------------------------ ------------------------ ---------------------- --------------------------- -------------------------------------'+
                   '----------------------------------------------------------------------------------------------');
    end
    else
      Append(Arq);
    writeLn(Arq, sconteudo);
    Flush(Arq);
    CloseFile(Arq);
  except
    MessageInfo := 'Não foi possível gravar o log de documentos rejeitados.'
  end;
end;




Procedure TCtrlBaixaIntBanco.MontaGrid( psListaRetorno : TStrings;
                                        pCmbModeloCnabLookupValue : String );
Var
  X:Integer;
  sAux ,SSQL,
  sFlgContabAlterador, // Rodolpho da Silva - P: 20932 - 21/12/2008
  sCodAlterador : string;
  bChaveNossoNum,
  bRejeitaDocumento : Boolean;

  cdsLocalAux, cdsSaldoDoc, cdsDocsCnab, cdsPortFormaRetorno: tDataSet;

  // retorna o valor total liquido do documento
  function PegaValorLiquidoDocum(codDocumento : integer) : Extended;
  begin
    result := 0;
    OpenDataSetParams(cdsSaldoDoc, ['CODDOCUMENTO'], vararrayof([CodDocumento]));
    result := cdsSaldoDoc.fieldByName('VALOR').asFloat;
  end;

  // retorna o valor total liquido dos documentos do grupoCnab
  function PegaValorTotalGrupoCnab(codGrupoCnab : integer) : Extended;
  var valTotal : Extended;
  begin
    result := 0;
    valTotal := 0;
    OpenDataSetParams(cdsDocsCnab, ['CODGRUPOCNAB'], vararrayof([codGrupoCnab]));

    cdsDocsCnab.First;
    while not cdsDocsCnab.Eof do
    begin
      valTotal := valTotal + PegaValorLiquidoDocum(cdsDocsCnab.FieldByName('CODDOCUMENTO').asInteger);
      cdsDocsCnab.Next;
    end;
    result := valTotal;
  end;

Begin
  sNomeArqLog           := '';
  bRejeitaDocumento     := false;
  bChaveNossoNum        := false;
  FbUsaPortFormaRetorno := false;

  try
    // criando datasets PARA PREPARE UNICO
    cdsSaldoDoc := CreateDataSetParams(' SELECT ' +
                                       '  SUM(DECODE(LANC.DEBCRE,''D'',DECODE(DOC.RECPAG,''R'',LANC.VALOR,LANC.VALOR * -1),DECODE(DOC.RECPAG,''R'',LANC.VALOR * -1,LANC.VALOR))) AS VALOR, ' +
                                       '  SUM(DECODE(LANC.DEBCRE,''D'',DECODE(DOC.RECPAG,''R'',LANC.VALOROUTRAMOEDA,LANC.VALOROUTRAMOEDA * -1),DECODE(DOC.RECPAG,''R'',LANC.VALOROUTRAMOEDA * -1,LANC.VALOROUTRAMOEDA))) AS VALOROUTRAMOEDA ' +
                                       ' FROM  LANCTODOCUM LANC, DOCUMENTO DOC ' +
                                       ' WHERE DOC.CODDOCUMENTO = :CODDOCUMENTO ' +
                                       ' AND DOC.CODDOCUMENTO = LANC.CODDOCUMENTO ',  ['CODDOCUMENTO'], [ftInteger]);
    cdsDocsCnab := CreateDataSetParams(' SELECT D.CODDOCUMENTO FROM DOCUMENTO D '+
                                       ' WHERE D.CODGRUPOCNAB = :CODGRUPOCNAB ' +
                                       ' ORDER BY D.CODDOCUMENTO ASC ', ['CODGRUPOCNAB'], [ftInteger]);
    cdsLocalAux := CreateDataSetParams('SELECT CODDOCUMENTO, CODGRUPOCNAB FROM DOCUMENTO WHERE CODDOCUMENTO = :CODDOCUMENTO', ['CODDOCUMENTO'], [ftInteger]);

    cdsPortFormaRetorno := CreateDataSetParams(' SELECT PF.* FROM CODLIQBAIXACNAB CL, CODIGOSCNAB CC, PORTADORFORMA PF, FORMARECPAG FRP '+
                                               ' WHERE CL.IDMODELOSCNAB = CC.IDMODELOSCNAB '+
                                               ' AND CL.CODPORTFORMA = PF.CODPORTFORMA '+
                                               ' AND PF.CODFORMA = FRP.CODFORMA '+
                                               ' AND CC.CODIGO = :CODIGO '+
                                               ' AND CL.CODIGOLIQ = :CODIGOLIQ '+
                                               ' AND CL.IDMODELOSCNAB = :IDMODELOSCNAB '+
                                               ' AND FRP.CODFORMABANCO = :CODFORMABANCO ',
                                               ['CODIGO', 'CODIGOLIQ', 'IDMODELOSCNAB', 'CODFORMABANCO'],
                                               [ftString, ftString, ftString, ftInteger, ftString]);

    // Exibe o formprogresso
    OnBaixa([0,1,1,1,1,'Aguardando...',1,psListaRetorno.Count,'Processando arquivo de retorno']);

    If RecPag = 'R' Then
    Begin
      //Monta Grid de Pagamento do CNAB
      For x:= 0 To psListaRetorno.Count -1 Do
      Begin
        Try
          // Anda o formprogresso
          if assigned(OnBaixa) then
             OnBaixa([1,1,(x + 1),1,1,'Aguardando...',1,psListaRetorno.Count,'Processando arquivo de retorno']);
   
          { sAux vai receber o CODIGO DE OCORRÊNCIA de RETORNO }
          sAux := Trim( Copy( psListaRetorno[ X ], 26, 2 ) );

          // Se eoncontrar o código da ocorrência de retorno...
          If ( CdsOcorrencia.Locate('Codigo',sAux, [ ] ) ) then
          begin
             if ( CdsOcorrencia.FieldByName( 'FLGINDICABAIXA' ).ASSTRING = 'S' ) Then
             Begin
                if ( CdsOcorrencia.FieldByName('CODALTERADOR').AsFloat = 0 ) then
                begin
                   sCodAlterador       := ', (0) AS CODALTERADORBAIXA ';
                   sFlgContabAlterador := ', ''N'' AS FLGCONTABALTERADOR ';
                end
                else
                begin
                   sCodAlterador := ', (' + CdsOcorrencia.FieldByName('CODALTERADOR').AsString + ') AS CODALTERADORBAIXA ';
                   sFlgContabAlterador := ', ' + QuotedStr(CdsOcorrencia.FieldByName('FLGCONTABALTERADOR').AsString) + ' AS FLGCONTABALTERADOR ';
                end;

               IF (CtrlIntBanco.IndiceDoBanco In [0,1,2,9,10,11,12,13,14,17,19,20,21,23,50,52,55, 58]) Then  //andre tavares - pendência 24978 - 15/06/2007 - inclui o 58
               begin
                  sAux    := Trim(Copy( psListaRetorno[x],41,16));
                  bChaveNossoNum := false;
                  if trim(sAux) = '' then
                  begin
                    sAux    := Trim(Copy( psListaRetorno[x],1,15));
                    bChaveNossoNum := true;
                  end;
               end
               //Para fazer o recebimento do cnab240 do banco do brasil
               else if CtrlIntBanco.IndiceDoBanco = 7 then
                  sAux    := Trim(Copy( psListaRetorno[x],1,15))
               ELSE
                  sAux    := Trim(Copy( psListaRetorno[x],1,20));

              { Alterar as remessas do contas a receber para gravar junto com a referencia para retorno(CODDOCUMENTO)
                o FLGGRUPO. Testar na baixa se o primeiro caracter do sAux acima é igual a S, se for fazer
                o select pelo CODGRUPOCNAB, se for N ou se for numérico faser como está abaixo, pelo CODDOCUMENTO.
                Implementar um loop para preencher a query de baixa pq o CODGRUPOCNAB pode trazer vários registros }

               SSQL:= ' SELECT D.CODDOCUMENTO, D.IDPESSOA,D.CODSUBCONTA, D.PLACONTA, D.CODCENTROCUSTO, D.IDFORCLI, ' +
                      '     D.IDUSUARIOINCLUSAO, D.NODOCUMENTO, D.COMPLDOCUMENTO, D.DATAEMISSAO, ' +
                      '     D.DATAVENCTO, D.DATAPROGRAMADA, D.OPERACAO,  '+
                      '     SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOR,L.VALOR*-1),DECODE(D.RECPAG,''R'',L.VALOR*-1,L.VALOR))) AS VALOR, '+
                      '     SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1),DECODE(D.RECPAG,''R'',L.VALOROUTRAMOEDA*-1,L.VALOROUTRAMOEDA))) AS VALOROUTRAMOEDA, '+
                      '     DECODE(D.RECPAG,''P'',''D'',''C'') AS DEBCRE, '+
                      '     D.IDMODULO, D.NOSSONUMERO, '  +
                      'DECODE( P.NOME, NULL, P.RAZAOSOCIAL, P.NOME ) AS RAZAOSOCIAL, ' +
                      '     D.STATUS, D.CODPORTFORMA, ' +
                      '     D.RECPAG, D.STATUS, D.CODTIPDOC, D.PLANO, D.CODGRUPOCNAB, L.NUMLANCTO, L.VLRLIQUIDO ' +
                      ', ''00'' AS CODLIQBAIXA '+
                      ', ''00'' AS CODFORMAPAG '+
                      ', ''0'' AS FLOATFORMAPAG '+
                      sFlgContabAlterador +
                      sCodAlterador +
                      ' FROM DOCUMENTO D, LANCTODOCUM L, PESSOA P ';

               IF (CtrlIntBanco.IndiceDoBanco In [0,1,2,7,9,10,11,12,13,14,17,19,20,21,23,50,52,55,58]) Then
               begin
                 //Se a primeira posição não for um NÚMERO.
                 if not StrIsNumber(copy(sAux,1,1)) then begin
                   { Se a primeira posição for igual a 'S' ou 'N', significa que o
                     arquivo de remessa foi gerado utilizando essa nova filosofia da
                     baixa pelo GRUPO. Se a segunda posição não estiver em branco,
                     significa que este documento foi gerado por outro sistema e não
                     deve ser baixado. }
                   if not bChaveNossoNum then // andre tavares - pendencia 19024
                   begin
                     if copy(sAux,1,1) = 'S' then
                        SSQL := SSQL+ ' WHERE (D.CODGRUPOCNAB = ' + Trim(Copy(sAux,3,20)) + ') AND '
                     else
                        SSQL := SSQL+ ' WHERE (D.CODDOCUMENTO = ' + Trim(Copy(sAux,3,20)) + ') AND ';
                   end
                   else
                     SSQL := SSQL+ ' WHERE (D.NOSSONUMERO LIKE ''%' + intToStr(strToInt(sAux)) + '%'') AND ' ;

                   { Se TRUE, significa que o documento foi gerado por outro sistema }
                   if trim(copy(sAux,2,1)) <> '' then
                      SSQL := SSQL+ ' (1 = 2) AND ';

                 end else
                   {Se for um NÜMERO, significa que o arquivo de remessa foi gerado
                    pela rotina antiga.}
                    if (CtrlIntBanco.IndiceDoBanco = 50) then //se é convênio SICOV
                    begin
                      OpenDataSetParams(cdsLocalAux, ['CODDOCUMENTO'], vararrayof([StrToIntDef(sAux,0)]));
                      if not cdsLocalAux.IsEmpty then
                      begin
                        if (trim(cdsLocalAux.fieldByName('CODGRUPOCNAB').asString) <> '') then
                          SSQL := SSQL+ ' WHERE (D.CODGRUPOCNAB = ' + cdsLocalAux.fieldByName('CODGRUPOCNAB').asString + ') AND '
                        else
                          SSQL := SSQL+ ' WHERE (D.CODDOCUMENTO = ' + sAux + ') AND ';
                      end;

                    end
                    else
                    begin
                      if not bChaveNossoNum then // andre tavares - pendencia 19024
                        SSQL := SSQL+ ' WHERE (D.CODDOCUMENTO = ' + sAux + ') AND '
                      else
                        SSQL := SSQL+ ' WHERE (D.NOSSONUMERO LIKE ''%' + floatToStr(strToFloat(sAux)) + '%'') AND ' ;
                    end;
               end
               else
                 SSQL:=SSQL+ ' WHERE (D.NOSSONUMERO LIKE ''%' + sAux + '%'') AND ' ;

               SSQL:=SSQL+
               '    (D.IDPESSOA = ' + FloatToStr( IdEmpresa ) + ') AND ' +
               '    (D.RECPAG = ''R'') AND ' +
               '    ((D.STATUS <> ''2'') OR (D.STATUS IS NULL))  AND ' +
               '    (D.IDFORCLI = P.IDPESSOA) AND ' +
               '    (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' +
               '    (RTRIM(D.OPERACAO) IN (''1'',''2'',''3'',''14'')) '+
               'GROUP BY D.CODDOCUMENTO, D.IDPESSOA,D.CODSUBCONTA, D.PLACONTA, D.CODCENTROCUSTO, D.IDFORCLI, '+
               '         D.IDUSUARIOINCLUSAO, D.NODOCUMENTO, D.COMPLDOCUMENTO, D.DATAEMISSAO, ' +
               '         D.DATAVENCTO, D.DATAPROGRAMADA, D.OPERACAO, D.RECPAG,  '+
               '         D.IDMODULO, ' +
               '         D.NOSSONUMERO, ' +
               'DECODE( P.NOME, NULL, P.RAZAOSOCIAL, P.NOME ), ' +
               '         D.STATUS, D.CODPORTFORMA, ' +
               '         D.RECPAG, D.STATUS, D.CODTIPDOC, D.PLANO, D.CODGRUPOCNAB, L.NUMLANCTO, L.VLRLIQUIDO';

               If (sAux <> '') And FazQuery(CdsAuxCodDoc,SSQL) Then
               Begin
                 while not CdsAuxCodDoc.EOF do begin
                   if CtrlIntBanco.IndiceDoBanco in [8, 55, 58] then  //andre tavares - pendência 24978 - 15/06/2007 - inclui o 58
                   begin
                     CdsAuxCodDoc.Edit;
                     //preeche a coluna de código de liquidação de baixa
                     CdsAuxCodDoc.fieldByName('CODLIQBAIXA').asString := Copy( psListaRetorno[x], 176, 2);
                      //andré tavares - pendência 21102 - 24/05/2006 - este campo será preenchido pelo código de pagamento no banco do arquivo de retorno do banco
                     CdsAuxCodDoc.fieldByName('CODFORMAPAG').asString := Copy( psListaRetorno[x], 178, 2);

                     cdsPortFormaRetorno.Close;
                     //Busca o portadorforma de retorno adequado para baixa
                     //andre tavares pendência 23789 - retirei o parâmetro CODFORMABANCO, pois não é necessário e esva causando problemas

                     if strTointdef(Copy(psListaRetorno[x], 180, 1), 0) <> 0 then //andre tavares - pendencia 23195 - 06/12/2006 - se não tiver float no arquivo de retorno
                       CdsAuxCodDoc.fieldByName('FLOATFORMAPAG').asString := Copy(psListaRetorno[x], 180, 1) //andre tavares - pendencia 23195 - 06/12/2006 - se não tiver float no arquivo de retorno
                     else
                       OpenDataSetParams(cdsPortFormaRetorno, ['CODIGO', 'CODIGOLIQ', 'IDMODELOSCNAB', 'CODFORMABANCO'],
                                         vararrayof([  CdsOcorrencia.FieldByName('CODIGO').asString,
                                                       CdsAuxCodDoc.fieldByName('CODLIQBAIXA').asString,
                                                       CtrlIntBanco.IndiceDoBanco,
                                                       CdsAuxCodDoc.fieldByName('CODFORMAPAG').asString  ]) );


                     if (cdsPortFormaRetorno.Active) and (not cdsPortFormaRetorno.IsEmpty) then
                     begin
                       CdsAuxCodDoc.fieldByName('CODPORTFORMA').asInteger := cdsPortFormaRetorno.fieldByName('CODPORTFORMA').asInteger;

                       //Float para o código de liquidação de baixa
                       CdsAuxCodDoc.fieldByName('FLOATFORMAPAG').asInteger := cdsPortFormaRetorno.fieldByName('DMAIS').asInteger;

                       FbUsaPortFormaRetorno := true;
                     end else FbUsaPortFormaRetorno := false;

                     CdsAuxCodDoc.Post;
                   end;

                   If StrToFloatDef(DevolveString(Copy( psListaRetorno[x],111,20),','),0) >= 0 Then // andre tavares - 28/04/2004
                   Begin
                     Try
                       If Trim(CdsAuxCodDoc.FieldByName( 'STATUS' ).AsString ) <> '2' Then
                          sDataLancto := DevolveString(Copy( psListaRetorno[x],31,10),'/');
                     Except
                       sDataLancto := DateToStr(Date);
                     End;

                     CdsDocumentos.fieldByName('VALOR').EditMask := '#,##0.00;(#,##0.00)';

                     If Not ( CdsDocumentos.Locate( 'CODDOCUMENTO', VarArrayOf( [ CdsAuxCodDoc.FieldByName( 'CODDOCUMENTO' ).AsInteger ] ), [] ) ) Then Begin

                       CdsDocumentos.Append;

                       //início andre Tavares - 05/03/2004 - pendência 16170
                       if not CdsAuxCodDoc.fieldByName('CodGrupoCnab').IsNull then //se é grupamento de documentos
                       begin
                         // inicio - andre tavares - 29/07/2004 - coloquei o float formatado como string para evitar problemas de comparação de valores
                         if (formatFloat('#,##0.00', PegaValorTotalGrupoCnab(CdsAuxCodDoc.fieldByName('CodGrupoCnab').asInteger)) = formatFloat('#,##0.00', StrToFloatDef(DevolveString(Copy( psListaRetorno[x],111,20),','),0))) then
                         // fim - andre tavares - 29/07/2004
                         begin
                           CdsDocumentos.FieldByName('VALOR').AsFloat := PegaValorLiquidoDocum(CdsAuxCodDoc.FieldByName('CODDOCUMENTO').AsInteger);
                           bRejeitaDocumento := false;
                         end
                         else
                           bRejeitaDocumento := true;
                       end
                       else //senão, é um único documento
                       begin
                         // inicio - andre tavares - 29/07/2004 - coloquei o float formatado como string para evitar problemas de comparação de valores

                         //Conforme orientação da FUNCEF, se for sicov e o valor pago for
                         //diferente do valor nominal do documento
                         bRejeitaDocumento := (CtrlIntBanco.IndiceDoBanco = 50) and
                                               (formatFloat('#,##0.00',StrToFloatDef(DevolveString(Copy( psListaRetorno[x],111,20),','),0)) <>
                                               formatFloat('#,##0.00', PegaValorLiquidoDocum(CdsAuxCodDoc.FieldByName('CODDOCUMENTO').AsInteger)));

                         CdsDocumentos.FieldByName( 'VALOR' ).AsFloat := StrToFloatDef(DevolveString(Copy( psListaRetorno[x],111,20),','),0);
                         CdsAuxCodDoc.Edit;
                         CdsAuxCodDoc.FieldByName('VALOR').AsFloat := CdsDocumentos.FieldByName('VALOR').AsFloat;
                       end;

                       if bRejeitaDocumento then // se rejeita o documento ou o grupo de documentos]
                       begin
                         // este documento é rejeitado e gravado num log
                         sNomeArqLog := gravaLog(
                                  CdsAuxCodDoc.FieldByName( 'RAZAOSOCIAL' ).asString +
                                  StringOfChar(' ', 65 - length(CdsAuxCodDoc.FieldByName( 'RAZAOSOCIAL' ).asString))+
                                  CdsAuxCodDoc.FieldByName( 'CODGRUPOCNAB' ).asString +
                                  StringOfChar(' ', 25 - length(CdsAuxCodDoc.FieldByName( 'CODGRUPOCNAB' ).asString))+
                                  CdsAuxCodDoc.FieldByName( 'CODDOCUMENTO' ).asString +
                                  StringOfChar(' ', 25 - length(CdsAuxCodDoc.FieldByName( 'CODDOCUMENTO' ).asString))+
                                  CdsAuxCodDoc.FieldByName( 'NODOCUMENTO' ).asString  +
                                  StringOfChar(' ', 25 - length(CdsAuxCodDoc.FieldByName( 'NODOCUMENTO' ).asString))+
                                  CdsAuxCodDoc.FieldByName( 'DATAPROGRAMADA' ).asString+
                                  StringOfChar(' ', 23 - length(CdsAuxCodDoc.FieldByName( 'DATAPROGRAMADA' ).asString))+
                                  formatFloat('#,##0.00', StrToFloatDef(DevolveString(Copy( psListaRetorno[x],111,20),','),0))+
                                  StringOfChar(' ', 25 - length(CdsAuxCodDoc.FieldByName( 'VALOR' ).asString))+
                                  'O VALOR TOTAL PAGO DO GRUPO DE DOCUMENTOS É DIFERENTE DO VALOR TOTAL ESPERADO.'
                                  );
                         CdsDocumentos.FieldByName('VALOR').AsFloat := CdsAuxCodDoc.FieldByName('VALOR').AsFloat;
                       end
                       //fim andre Tavares - 05/03/2004 - pendência 16170
                       else begin

                         //início - andré tavares - pendência 21102 - 24/05/2006 - este campo será preenchido pelo código de liquidação/baixa oriundo do arquivo de retorno do banco
                         CdsDocumentos.FieldByName( 'CODLIQBAIXA' ).asString         := CdsAuxCodDoc.FieldByName('CODLIQBAIXA').asString;
                         CdsDocumentos.FieldByName( 'CODFORMAPAG' ).asString         := CdsAuxCodDoc.fieldByName('CODFORMAPAG').asString;
                         //fim - andré tavares - pendência 21102 - 24/05/2006 - este campo será preenchido pelo código de liquidação/baixa oriundo do arquivo de retorno do banco

                         //andré tavares - pendência 23195 - 04/09/2006
                         CdsDocumentos.fieldByName('FLOATFORMAPAG').asString := CdsAuxCodDoc.fieldByName('FLOATFORMAPAG').asString;



                         CdsDocumentos.FieldByName( 'CODDOCUMENTO' ).AsInteger       := CdsAuxCodDoc.FieldByName( 'CODDOCUMENTO' ).AsInteger;
                         CdsDocumentos.FieldByName( 'IDPESSOA' ).AsInteger           := CdsAuxCodDoc.FieldByName( 'IDPESSOA' ).AsInteger;
                         CdsDocumentos.FieldByName( 'PLACONTA' ).AsString            := CdsAuxCodDoc.FieldByName( 'PLACONTA' ).AsString;
                         CdsDocumentos.FieldByName( 'CODCENTROCUSTO' ).AsString      := CdsAuxCodDoc.FieldByName( 'CODCENTROCUSTO' ).AsString;
                         CdsDocumentos.FieldByName( 'CODSUBCONTA' ).AsInteger        := CdsAuxCodDoc.FieldByName( 'CODSUBCONTA' ).AsInteger;
                         CdsDocumentos.FieldByName( 'IDFORCLI' ).AsInteger           := CdsAuxCodDoc.FieldByName( 'IDFORCLI' ).AsInteger;
                         CdsDocumentos.FieldByName( 'IDUSUARIOINCLUSAO' ).AsInteger  := CdsAuxCodDoc.FieldByName( 'IDUSUARIOINCLUSAO' ).AsInteger;
                         CdsDocumentos.FieldByName( 'NODOCUMENTO' ).AsFloat          := CdsAuxCodDoc.FieldByName( 'NODOCUMENTO' ).AsFloat;
                         CdsDocumentos.FieldByName( 'COMPLDOCUMENTO' ).AsString      := CdsAuxCodDoc.FieldByName( 'COMPLDOCUMENTO' ).AsString;
                         CdsDocumentos.FieldByName( 'DATAEMISSAO' ).AsDateTime       := CdsAuxCodDoc.FieldByName( 'DATAEMISSAO' ).AsDateTime;
                         CdsDocumentos.FieldByName( 'DATAVENCTO' ).AsDateTime        := CdsAuxCodDoc.FieldByName( 'DATAVENCTO' ).AsDateTime;
                         CdsDocumentos.FieldByName( 'DATAPROGRAMADA' ).AsDateTime    := CdsAuxCodDoc.FieldByName( 'DATAPROGRAMADA' ).AsDateTime;
                         CdsDocumentos.FieldByName( 'OPERACAO' ).AsString            := CdsAuxCodDoc.FieldByName( 'OPERACAO' ).AsString;
                         CdsDocumentos.FieldByName( 'NOSSONUMERO' ).AsString         := CdsAuxCodDoc.FieldByName( 'NOSSONUMERO' ).AsString;
                         CdsDocumentos.FieldByName( 'RAZAOSOCIAL' ).AsString         := CdsAuxCodDoc.FieldByName( 'RAZAOSOCIAL' ).AsString;
                         CdsDocumentos.FieldByName( 'DataBaixa' ).AsDateTime         := StrToDate(sDataLancto);
                         CdsDocumentos.FieldByName( 'CODPORTFORMA' ).AsInteger       := CdsAuxCodDoc.FieldByName( 'CODPORTFORMA' ).AsInteger;

                         // ALEX 07/12/2005 GRAVAR O CODTIPDOC E IDMODULO
                         CdsDocumentos.FieldByName( 'IDMODULO' ).AsInteger       := CdsAuxCodDoc.FieldByName( 'IDMODULO' ).AsInteger;
                         CdsDocumentos.FieldByName( 'CODTIPDOC' ).AsInteger       := CdsAuxCodDoc.FieldByName( 'CODTIPDOC' ).AsInteger;
                         CdsDocumentos.FieldByName( 'VALOROUTRAMOEDA' ).AsFloat      := CdsAuxCodDoc.FieldByName( 'VALOROUTRAMOEDA' ).AsFloat;
                         CdsDocumentos.FieldByName( 'VALORNOMINAL' ).AsFloat         := PegaValorLiquidoDocum(CdsAuxCodDoc.FieldByName('CODDOCUMENTO').AsInteger);
                         // fim - André Tavares - pendência 16953 - 14/06/2004

                         CdsDocumentos.FieldByName( 'DebCre' ).AsString              := CdsAuxCodDoc.FieldByName( 'DEBCRE' ).AsString;

                         CdsDocumentos.FieldByName( 'Juros' ).AsFloat                := StrToFloatDef(DevolveString(Copy( psListaRetorno[x],131,20),','),0);
                         CdsDocumentos.FieldByName( 'Descontos' ).AsFloat            := StrToFloatDef(DevolveString(Copy( psListaRetorno[x],91,20),','),0);

                         If CtrlIntBanco.IndiceDoBanco = 9 Then   //HSBC   MARIA
                           CdsDocumentos.FieldByName( 'Abatimento' ).AsFloat           := 0
                         Else Begin
                           CdsDocumentos.FieldByName( 'Abatimento' ).AsFloat           := StrToFloatDef(DevolveString(Copy( psListaRetorno[x],71,20),','),0);
                         End;
                         // início andre tavares - 28/04/2004 - pendência 16170
                         if CtrlIntBanco.IndiceDoBanco = 50 then // sicov - CEF
                         begin
                           CdsDocumentos.FieldByName( 'TarifaBancaria' ).AsFloat := 0;
                         end
                         else

                         If (CdsDocumentos.FieldByName( 'VALOR' ).AsFloat <> 0) and
                            (CdsDocumentos.FieldByName( 'VALOR' ).AsFloat >= CdsDocumentos.FieldByName( 'ValorNominal' ).AsFloat) then
                           CdsDocumentos.FieldByName( 'TarifaBancaria' ).AsFloat := ((CdsDocumentos.FieldByName( 'ValorNominal' ).AsFloat +
                                                                                          CdsDocumentos.FieldByName( 'Juros' ).AsFloat -
                                                                                          CdsDocumentos.FieldByName( 'Descontos' ).AsFloat -
                                                                                          CdsDocumentos.FieldByName( 'Abatimento' ).AsFloat) -
                                                                                          CdsDocumentos.FieldByName( 'VALOR' ).AsFloat)
                         Else
                            CdsDocumentos.FieldByName( 'TarifaBancaria' ).AsFloat := 0;

                         if CdsDocumentos.FieldByName( 'TarifaBancaria' ).AsFloat < 0 then
                            CdsDocumentos.FieldByName( 'TarifaBancaria' ).AsFloat := 0;

                         CdsDocumentos.FieldByName( 'CODALTERADORBAIXA' ).AsFloat    := CdsAuxCodDoc.FieldByName( 'CODALTERADORBAIXA' ).AsFloat; (* Gustavo - 06/03/2003 *)

                         // Rodolpho da Silva - P: 20932 - 21/12/2005
                         CdsDocumentos.FieldByName('FLGCONTABALTERADOR' ).AsString := CdsAuxCodDoc.FieldByName('FLGCONTABALTERADOR').AsString;


                         CdsDocumentos.Post;

                         // Anda o formprogresso
                         if assigned(OnBaixa) then
                            OnBaixa([1,CdsAuxCodDoc.RecNo,(x + 1),1,CdsAuxCodDoc.RecordCount,'Processando documento',1,psListaRetorno.Count,'Processando arquivo de retorno']);

                       End;
                     End;
                   end; // else
                   CdsAuxCodDoc.Next;
                   //início andre Tavares - 05/03/2004 - pendência 16170
                   if bRejeitaDocumento then
                   begin
                     cdsDocumentos.Delete;
                     bRejeitaDocumento := false;
                   end;
                   //fim andre Tavares - 05/03/2004 - pendência 16170
                 End;
               End;
             End;

          end;


          Except
            On E : Exception Do MessageInfo := E.Message;
          End;

      End;
    End Else Begin
      //Monta Grid Do Sispag
      For x:=0 To psListaRetorno.Count - 1 Do Begin
        Try
          If DevolveString(Copy( psListaRetorno[x],76,20),',') <> '' Then Begin
            If CtrlIntBanco.IndiceDoBanco = 0 Then Begin
              CdsOcorrencia.Close;
              With DtmBaixaIntBanco Do Begin
                SqlOcorrencia.Sql.Text :='SELECT ' +
                                       '  C.IDCODIGOSCNAB, ' +
                                       '  C.RECPAG, ' +
                                       '  C.IDMODELOSCNAB , ' +
                                       '  C.TIPO, ' +
                                       '  C.CODIGO, ' +
                                       '  C.DESCRICAO, ' +
                                       '  C.FLGINDICABAIXA, ' +

                                       // Rodolpho da Silva - P: 20932 - 21/12/2005
                                       '  C.FLGCONTABALTERADOR, ' +

                                       '  M.DESCRICAO AS DESCMODELO, C.CODALTERADOR ' + (* Gustavo - 06/03/2003 *)
                                       'FROM ' +
                                       '  CODIGOSCNAB C, MODELOSCNAB M ' +
                                       'WHERE ' +
                                       '  (C.IDMODELOSCNAB = ' +  pCmbModeloCnabLookupValue + ') AND ' +
                                       '  (C.RECPAG = ''' + RecPag + ''') AND ' +
                                       '  (C.IDMODELOSCNAB = M.IDMODELOSCNAB) AND ' +
                                       '  (C.RECPAG = M.RECPAG) AND ' +
                                       '  (C.FLGINDICABAIXA = ''S'') AND ' +
                                       '  (C.CODIGO IN (' + DevolveString(Copy( psListaRetorno[x],76,20),',') + '))';
                SqlOcorrencia.Open;
              End;
            End Else Begin
              CdsOcorrencia.Close;
              If Copy( psListaRetorno[x],76,2) = '01' Then
                sAux := ' AND C.CODIGO = ''01'' '
              Else
                if  (CtrlIntBanco.IndiceDoBanco = 18) and ( RecPag='P') then //maria
                  sAux := ' AND C.CODIGO IN (' + Devolvevirgula(Copy( psListaRetorno[x],76,32),',') + ')'
                else if  (CtrlIntBanco.IndiceDoBanco = 58) and ( RecPag='P') then //andre tavares - 06/07/2007
                  sAux := ' AND C.CODIGO IN (' + Devolvevirgula(Copy( psListaRetorno[x],76,32),',') + ')'
                else
                  sAux := ' AND C.CODIGO IN (' + DevolveString(Copy( psListaRetorno[x],76,20),',') + ')';

              With DtmBaixaIntBanco Do Begin
                SqlOcorrencia.Sql.Text :='SELECT ' +
                                         '  C.IDCODIGOSCNAB, ' +
                                         '  C.RECPAG, ' +
                                         '  C.IDMODELOSCNAB , ' +
                                         '  C.TIPO, ' +
                                         '  C.CODIGO, ' +
                                         '  C.DESCRICAO, ' +
                                         '  C.FLGINDICABAIXA, ' +

                                         // Rodolpho da Silva - P: 20932 - 21/12/2005
                                         '  C.FLGCONTABALTERADOR, ' +

                                         '  M.DESCRICAO AS DESCMODELO, C.CODALTERADOR ' + (* Gustavo - 06/03/2003 *)
                                         'FROM ' +
                                         '  CODIGOSCNAB C, MODELOSCNAB M ' +
                                         'WHERE ' +
                                         '  (C.IDMODELOSCNAB = ' +  pCmbModeloCnabLookupValue + ') AND ' +
                                         '  (C.RECPAG = ''' + RecPag + ''') AND ' +
                                         '  (C.IDMODELOSCNAB = M.IDMODELOSCNAB) AND ' +
                                         '  (C.FLGINDICABAIXA = ''S'') AND ' +
                                         '  (C.RECPAG = M.RECPAG) ' + sAux;
                SqlOcorrencia.Open;
              End;
            End;

            If Not CdsOcorrencia.IsEmpty Then Begin
              sAux := (Trim(Copy( psListaRetorno[x],31,20)));
              If (sAux <> '') Then Begin
                If FazQuery(CdsAuxCodDoc,      ' SELECT D.CODDOCUMENTO, D.IDPESSOA,D.CODSUBCONTA, D.PLACONTA, D.CODCENTROCUSTO, D.IDFORCLI, ' +
                                               '     D.IDUSUARIOINCLUSAO, D.NODOCUMENTO, D.COMPLDOCUMENTO, D.DATAEMISSAO, ' +
                                               '      D.DATAVENCTO, D.DATAPROGRAMADA, D.OPERACAO,  ' +
                                               '     SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOR,L.VALOR*-1),DECODE(D.RECPAG,''R'',L.VALOR*-1,L.VALOR))) AS VALOR, '+
                                               '     SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1),DECODE(D.RECPAG,''R'',L.VALOROUTRAMOEDA*-1,L.VALOROUTRAMOEDA))) AS VALOROUTRAMOEDA, '+
                                               '     DECODE(D.RECPAG,''P'',''D'',''C'') AS DEBCRE, '+
                                               '     D.NOSSONUMERO, DECODE( P.NOME, NULL, P.RAZAOSOCIAL, P.NOME ) RAZAOSOCIAL, D.STATUS, D.CODPORTFORMA, P.NOME, ' +
                                               '     D.RECPAG, D.STATUS, D.CODTIPDOC, D.PLANO, D.CODGRUPOCNAB, L.NUMLANCTO, L.VLRLIQUIDO, ' +

                                               //andré tavares - pendência 21102 - 24/05/2006 - este campo será preenchido pelo código de liquidação/baixa oriundo do arquivo de retorno do banco
                                               ' ''00'' AS CODLIQBAIXA, '+
                                               //andré tavares - pendência 21102 - 24/05/2006 - este campo será preenchido pelo código de pagamento no banco do arquivo de retorno do banco
                                               ' ''00'' AS CODFORMAPAG, '+
                                               //andré tavares - pendência 23195 - 01/09/2006 - float para o código de liquidação de baixa
                                               ' ''0'' AS FLOATFORMAPAG, '+

                                               // Rodolpho da Silva - P: 20932 - 21/12/2005
                                               '  ''N'' AS FLGCONTABALTERADOR, ' +

                                               '     (0) AS CODALTERADORBAIXA, ' + (* Gustavo - 06/03/2003 *)
                                               //início - andré Tavares - pendência 22528 - pega o lote do documento para colocar no histórico contábil
                                               ' (SELECT MAX(NUMLOTE) FROM LOTEXDOCUM WHERE CODDOCUMENTO =  ' + sAux + ') AS NUMLOTE '+
                                               //fim - andré Tavares - pendência 22528

                                               ' FROM DOCUMENTO D, LANCTODOCUM L, PESSOA P ' +
                                               ' WHERE (D.CODDOCUMENTO = ' + sAux + ') AND ' +
                                               '    (D.IDPESSOA = ' + FloatToStr(IdEmpresa) + ') AND ' +
                                               '    (D.RECPAG = ''P'') AND ' +
                                               '    ((D.STATUS <> ''2'') OR (D.STATUS IS NULL)) AND ' +
                                               '    (D.IDFORCLI = P.IDPESSOA) AND ' +
                                               '    (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' +
                                               '    (D.OPERACAO = L.OPERACAO) AND ' + //andre tavares - pendência 23586 - 20/10/2006
                                               '    (RTRIM(D.OPERACAO) IN (''1'',''2'',''3'',''14''))' +
                                               ' GROUP BY D.CODDOCUMENTO, D.IDPESSOA,D.CODSUBCONTA, D.PLACONTA, D.CODCENTROCUSTO, D.IDFORCLI, ' +
                                               '     D.IDUSUARIOINCLUSAO, D.NODOCUMENTO, D.COMPLDOCUMENTO, D.DATAEMISSAO, ' +
                                               '     D.DATAVENCTO, D.DATAPROGRAMADA, D.OPERACAO, D.RECPAG, ' +
                                               '     D.NOSSONUMERO, DECODE( P.NOME, NULL, P.RAZAOSOCIAL, P.NOME ), D.STATUS, D.CODPORTFORMA, P.NOME, ' +
                                               '     D.RECPAG, D.STATUS, D.CODTIPDOC, D.PLANO, D.CODGRUPOCNAB, L.NUMLANCTO, L.VLRLIQUIDO' ) Then
                If StrToFloatDef(DevolveString(Copy( psListaRetorno[x],61,15),','),0) > 0 Then Begin
                  Try
                    If Trim(CdsAuxCodDoc.FieldByName( 'STATUS' ).AsString) <> '2' Then
                      sDataLancto := DevolveString(Copy( psListaRetorno[x],51,10),'/');
                  Except
                    sDataLancto := DateToStr(Date);
                  End;

                  CdsDocumentos.fieldByName('VALOR').EditMask := '#,##0.00;(#,##0.00)';

                  If Not ( CdsDocumentos.Locate( 'CODDOCUMENTO', VarArrayOf( [ CdsAuxCodDoc.FieldByName( 'CODDOCUMENTO' ).AsInteger ] ), [] ) ) Then
                  Begin
                    CdsDocumentos.Append;
                    //andré tavares - pendência 21102 - 24/05/2006 - este campo será preenchido pelo código de liquidação/baixa oriundo do arquivo de retorno do banco
                    CdsDocumentos.FieldByName( 'CODLIQBAIXA' ).asString         := CdsAuxCodDoc.FieldByName('CODLIQBAIXA').asString;
                    CdsDocumentos.FieldByName( 'CODFORMAPAG' ).asString         := CdsAuxCodDoc.fieldByName('CODFORMAPAG').asString;
                    //fim - andré tavares - pendência 21102 - 24/05/2006 - este campo será preenchido pelo código de liquidação/baixa oriundo do arquivo de retorno do banco

                    //andré tavares - pendência 23195 - 01/09/2006 - float para o código de liquidação de baixa
                    CdsDocumentos.FieldByName( 'FLOATFORMAPAG' ).asString       := CdsAuxCodDoc.fieldByName('FLOATFORMAPAG').asString;

                    CdsDocumentos.FieldByName( 'CODDOCUMENTO' ).AsInteger       := CdsAuxCodDoc.FieldByName( 'CODDOCUMENTO' ).AsInteger;
                    CdsDocumentos.FieldByName( 'IDPESSOA' ).AsInteger           := CdsAuxCodDoc.FieldByName( 'IDPESSOA' ).AsInteger;
                    CdsDocumentos.FieldByName( 'PLACONTA' ).AsString            := CdsAuxCodDoc.FieldByName( 'PLACONTA' ).AsString;
                    CdsDocumentos.FieldByName( 'CODCENTROCUSTO' ).AsString      := CdsAuxCodDoc.FieldByName( 'CODCENTROCUSTO' ).AsString;
                    CdsDocumentos.FieldByName( 'CODSUBCONTA' ).AsInteger        := CdsAuxCodDoc.FieldByName( 'CODSUBCONTA' ).AsInteger;
                    CdsDocumentos.FieldByName( 'IDFORCLI' ).AsInteger           := CdsAuxCodDoc.FieldByName( 'IDFORCLI' ).AsInteger;
                    CdsDocumentos.FieldByName( 'IDUSUARIOINCLUSAO' ).AsInteger  := CdsAuxCodDoc.FieldByName( 'IDUSUARIOINCLUSAO' ).AsInteger;
                    CdsDocumentos.FieldByName( 'NODOCUMENTO' ).AsFloat          := CdsAuxCodDoc.FieldByName( 'NODOCUMENTO' ).AsFloat;
                    CdsDocumentos.FieldByName( 'COMPLDOCUMENTO' ).AsString      := CdsAuxCodDoc.FieldByName( 'COMPLDOCUMENTO' ).AsString;
                    CdsDocumentos.FieldByName( 'DATAEMISSAO' ).AsDateTime       := CdsAuxCodDoc.FieldByName( 'DATAEMISSAO' ).AsDateTime;
                    CdsDocumentos.FieldByName( 'DATAVENCTO' ).AsDateTime        := CdsAuxCodDoc.FieldByName( 'DATAVENCTO' ).AsDateTime;
                    CdsDocumentos.FieldByName( 'DATAPROGRAMADA' ).AsDateTime    := CdsAuxCodDoc.FieldByName( 'DATAPROGRAMADA' ).AsDateTime;
                    CdsDocumentos.FieldByName( 'OPERACAO' ).AsString            := CdsAuxCodDoc.FieldByName( 'OPERACAO' ).AsString;
                    CdsDocumentos.FieldByName( 'NOSSONUMERO' ).AsString         := CdsAuxCodDoc.FieldByName( 'NOSSONUMERO' ).AsString;
                    CdsDocumentos.FieldByName( 'RAZAOSOCIAL' ).AsString         := CdsAuxCodDoc.FieldByName( 'RAZAOSOCIAL' ).AsString;
                    CdsDocumentos.FieldByName( 'DataBaixa' ).AsDateTime         := StrToDate(sDataLancto);
                    CdsDocumentos.FieldByName( 'CODPORTFORMA' ).AsInteger       := CdsAuxCodDoc.FieldByName( 'CODPORTFORMA' ).AsInteger;

                    //início - andre tavares - pendência 23586 - 20/10/2006
                    CdsDocumentos.FieldByName( 'VALOR' ).asString               := Copy( psListaRetorno[x],61,15 );
                    //fim - andre tavares - pendência 23586 - 20/10/2006


                    CdsDocumentos.FieldByName( 'VALOROUTRAMOEDA' ).AsFloat      := 0;

                    CdsDocumentos.FieldByName( 'ValorNominal' ).AsFloat         := CdsAuxCodDoc.FieldByName( 'VALOR' ).AsFloat;

                    CdsDocumentos.FieldByName( 'DebCre' ).AsString              := CdsAuxCodDoc.FieldByName( 'DEBCRE' ).AsString;
                    CdsDocumentos.FieldByName( 'Juros' ).AsFloat                := 0;
                    CdsDocumentos.FieldByName( 'Descontos' ).AsFloat            := 0;
                    CdsDocumentos.FieldByName( 'Abatimento' ).AsFloat           := 0;
                    CdsDocumentos.FieldByName( 'TarifaBancaria' ).AsFloat       := 0;
                    CdsDocumentos.FieldByName( 'RECPAG' ).AsString              := CdsAuxCodDoc.FieldByName( 'RECPAG' ).AsString;
                    CdsDocumentos.FieldByName( 'STATUS' ).AsString              := CdsAuxCodDoc.FieldByName( 'STATUS' ).AsString;
                    CdsDocumentos.FieldByName( 'CODTIPDOC' ).AsString           := CdsAuxCodDoc.FieldByName( 'CODTIPDOC' ).AsString;
                    CdsDocumentos.FieldByName( 'PLANO' ).AsInteger              := CdsAuxCodDoc.FieldByName( 'PLANO' ).AsInteger;
                    CdsDocumentos.FieldByName( 'CODGRUPOCNAB' ).AsInteger       := CdsAuxCodDoc.FieldByName( 'CODGRUPOCNAB' ).AsInteger;
                    CdsDocumentos.FieldByName( 'NUMLANCTO' ).AsInteger          := CdsAuxCodDoc.FieldByName( 'NUMLANCTO' ).AsInteger;
                    CdsDocumentos.FieldByName( 'VLRLIQUIDO' ).AsFloat           := CdsAuxCodDoc.FieldByName( 'VLRLIQUIDO' ).AsFloat;
                    CdsDocumentos.FieldByName( 'CODALTERADORBAIXA' ).AsFloat    := CdsAuxCodDoc.FieldByName( 'CODALTERADORBAIXA' ).AsFloat; (* Gustavo - 06/03/2003 *)
                    // Rodolpho da Silva - P: 20932 - 21/12/2005
                    CdsDocumentos.FieldByName( 'FLGCONTABALTERADOR' ).AsString  := CdsAuxCodDoc.FieldByName( 'FLGCONTABALTERADOR' ).AsString;
                    //início - andré Tavares - pendência 22528 - pega o lote do documento para colocar no histórico contábil
                    CdsDocumentos.FieldByName( 'NUMLOTE' ).AsString  := CdsAuxCodDoc.FieldByName( 'NUMLOTE' ).AsString;
                    //fim - andré Tavares - pendência 22528


                    CdsDocumentos.Post;

                    if assigned(OnBaixa) then
                      OnBaixa([1, 0, psListaRetorno.count, cdsDocumentos.RecordCount, 'Selecionando Documentos para Baixa']); // andre tavares 07/12/2006

                    // Anda o formprogresso
                    if assigned(OnBaixa) then
                       OnBaixa([1,CdsAuxCodDoc.RecNo,(x + 1),1,CdsAuxCodDoc.RecordCount,'Processando documento',1,psListaRetorno.Count,'Processando arquivo de retorno']);


                  End;
                End;
              End;
            End;
          End;
        Except
          On E : Exception Do MessageInfo := E.Message;
        End;
      End;
    End;
  finally
    FreeAndNil (cdsSaldoDoc);
    FreeAndNil (cdsDocsCnab);
    FreeAndNil (cdsLocalAux);
    FreeAndNil (cdsPortFormaRetorno);
  end;
End;

Function TCtrlBaixaIntBanco.bbtnConfirmarClick( psListaRetorno : TStrings;
                                                pCodPortForma  : Integer;
                                                pNumChqBordero : Double;
                                                pDataBaixa     : TDateTime;
                                                pDataDisp      : TDateTime = 0; // André Tavares - pendência 17412 - 24/08/2004
                                                iCommit: integer = 100// alex commitar a cada x registros
                                                ) : Boolean;
Var
  iCodPortForma: Integer;
  sBaixaObservacao: String;
  _PlnCodigoBaixa,  _CodLancFinancBaixa, i : integer;
  bLancaFinanceiro : boolean;

Begin
  if assigned(self.OnBaixa) then
    CtrlBaixaDocumentos.OnBaixa := self.OnBaixa; // andre tavares - 07/12/2006

  Result := False;

  if pCodPortForma = 0 then
  begin
    CdsDocumentos.First; // andre tavares - 07/12/2006
    CtrlDocumento.Lote.GetNumLote(CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger);
    iCodPortForma := CtrlDocumento.Lote.CodPortForma;
  end
  else
     iCodPortForma := pCodPortForma;

  Try
    Try

      //-------------------------- Prepara o dataSet para o método
      Cds.Data := CtrlBaixaDocumentos.GetEmptyCdsBaixa(True);

      _PlnCodigoBaixa          := 0;
      _CodLancFinancBaixa      := 0;
      CdsDocumentos.First;
      CdsDocumentos.LogChanges := false;
      fCds.LogChanges          := false;

      While ( Not CdsDocumentos.Eof ) Do
      Begin
        for i:= 1 to iCommit do begin
           fCds.Append;
           fCds.FieldByName('IDFORCLI').AsInteger        := CdsDocumentos.FieldByName( 'IDFORCLI' ).AsInteger;
           fCds.FieldByName('OPERACAO').AsString         := CdsDocumentos.FieldByName( 'OPERACAO' ).AsString;
           fCds.FieldByName('CODTIPDOC').AsInteger       := CdsDocumentos.FieldByName( 'CODTIPDOC' ).AsInteger;
           fCds.FieldByName('IDPESSOA').AsInteger        := CdsDocumentos.FieldByName( 'IDPESSOA' ).AsInteger;
           fCds.FieldByName('CODDOCUMENTO').AsInteger    := CdsDocumentos.FieldByName( 'CODDOCUMENTO' ).AsInteger;
           fCds.FieldByName('NODOCUMENTO').AsInteger     := CdsDocumentos.FieldByName( 'NODOCUMENTO' ).AsInteger;
           fCds.FieldByName('COMPLDOCUMENTO').AsString   := CdsDocumentos.FieldByName( 'COMPLDOCUMENTO' ).AsString;
           fCds.FieldByName('DATAPROGRAMADA').AsDateTime := CdsDocumentos.FieldByName( 'DATAPROGRAMADA' ).AsDateTime;
           fCds.FieldByName('DATAVENCTO').AsDateTime     := CdsDocumentos.FieldByName( 'DATAVENCTO' ).AsDateTime;
           fCds.FieldByName('RECPAG').AsString           := CdsDocumentos.FieldByName( 'RECPAG' ).AsString;
           fCds.FieldByName('NOME').AsString             := CdsDocumentos.FieldByName( 'RAZAOSOCIAL' ).AsString;
           fCds.FieldByName('STATUS').AsString           := CdsDocumentos.FieldByName( 'STATUS' ).AsString;
           fCds.FieldByName('MOECODIGO').AsInteger       := 0;
           fCds.FieldByName('PLANO').AsInteger           := CdsDocumentos.FieldByName( 'PLANO' ).AsInteger;
           fCds.FieldByName('PLACONTA').AsString         := CdsDocumentos.FieldByName( 'PLACONTA' ).AsString;
           fCds.FieldByName('CODSUBCONTA').AsInteger     := CdsDocumentos.FieldByName( 'CODSUBCONTA' ).AsInteger;
           fCds.FieldByName('CODCENTROCUSTO').AsString   := CdsDocumentos.FieldByName( 'CODCENTROCUSTO' ).AsString;
           fCds.FieldByName('CODGRUPOCNAB').AsInteger    := CdsDocumentos.FieldByName( 'CODGRUPOCNAB').AsInteger;
           fCds.FieldByName('NOSSONUMERO').AsString      := CdsDocumentos.FieldByName( 'NOSSONUMERO' ).AsString;
           fCds.FieldByName('NUMLANCTO').AsInteger       := CdsDocumentos.FieldByName( 'NUMLANCTO').AsInteger;
           fCds.FieldByName('VALOROUTRAMOEDA').AsFloat   := CdsDocumentos.FieldByName( 'VALOROUTRAMOEDA' ).AsFloat;
           fCds.FieldByName('DEBCRE').AsString           := CdsDocumentos.FieldByName( 'DEBCRE' ).AsString;
           fCds.FieldByName('VLRLIQUIDO').AsFloat        := CdsDocumentos.FieldByName( 'VLRLIQUIDO').AsFloat;
           fCds.FieldByName('VALOR').AsFloat             := CdsDocumentos.FieldByName( 'VALOR' ).AsFloat;
           fCds.FieldByName('CODALTERADORBAIXA').AsFloat := CdsDocumentos.FieldByName( 'CODALTERADORBAIXA' ).AsFloat;

           //início - andre tavares - pendencia 21102 - 30/05/2006 -
           fCds.FieldByName('CODPORTFORMA').AsInteger    := CdsDocumentos.FieldByName( 'CODPORTFORMA' ).AsInteger;

           //andré tavares - pendência 23195 - 01/09/2006 - float para o código de liquidação de baixa
           fCds.FieldByName('FLOATFORMAPAG').asString   := CdsDocumentos.FieldByName( 'FLOATFORMAPAG' ).AsString;


           // Rodolpho da Silva - P: 20932 - 21/12/2005
           fCds.FieldByName('FLGCONTABALTERADOR').AsString := CdsDocumentos.FieldByName( 'FLGCONTABALTERADOR' ).AsString;

           // Rodolpho da Silva - P: 18013 - 07/11/2005
           fCds.FieldByName('IDMODULO').AsFloat :=  CdsDocumentos.FieldByName('IDMODULO').AsFloat;

           // início - André Tavares - pendência 16170  - não estava correto
           fCds.FieldByName('ABATIMENTO').AsFloat     := CdsDocumentos.FieldByName('ABATIMENTO').AsFloat;
           fCds.FieldByName('DESCONTOS').AsFloat      := CdsDocumentos.FieldByName('DESCONTOS').AsFloat;
           fCds.FieldByName('JUROS').AsFloat          := CdsDocumentos.FieldByName('JUROS').AsFloat;
           fCds.FieldByName('TARIFABANCARIA').AsFloat := CdsDocumentos.FieldByName('TARIFABANCARIA').AsFloat;
          // fim - André Tavares - pendência 16170  - não estava correto

           // André Tavares - pendência 22528  - não estava correto - 21/08/2006
           if (CdsDocumentos.FindField('NUMLOTE') <> nil) then  //este campo só deve existir se o documento for do cap
             fCds.FieldByName('NUMLOTE').asInteger := CdsDocumentos.FieldByName( 'NUMLOTE' ).asInteger;

           fCds.Post;
           CdsDocumentos.Next;
           if CdsDocumentos.Eof then break;
        end;

        // Início - Rodolpho da Silva - P: 22526 - 06/06/2006
        _Cds.Data := GetDataPacket('SELECT LANCAFINANC FROM PARAMCAP WHERE RECPAG = ''P''');
        bLancaFinanceiro := (_Cds.FieldByName('LANCAFINANC').AsString = 'N');
        // Fim - Rodolpho da Silva - P: 22526 - 06/06/2006

        If CtrlBaixaDocumentos.ProcessaBaixaManual( False, iCodPortForma, pNumChqBordero,  Cds.Data,
                                                    pDataBaixa, TSistemaLancto( Trunc( IdModulo ) - 3 ),
                                                    LancaBaixaFloat, Trunc( IdUsuario ), Trunc( IdEmpresa ),
                                                    Trunc( IdEspAcesso ), Trunc( PlanoConta ),
                                                    UsaPlanoPatro, IntegraContab, PartidaDobrada,
                                                    True, 0, _PlnCodigoBaixa, _CodLancFinancBaixa,
                                                    bLancaFinanceiro,
                                                     0, -1, pDataDisp, false,
                                                    FbUsaPortFormaRetorno,
                                                    True, sBaixaObservacao,
                                                    CdsDocumentos.RecordCount ) Then
        Begin
          Result := True;
        End
        Else
        begin
          Result := false;
          sNomeArqLog := gravaLog(CdsDocumentos.FieldByName( 'RAZAOSOCIAL' ).asString +
                   StringOfChar(' ', 65 - length(CdsDocumentos.FieldByName( 'RAZAOSOCIAL' ).asString))+
                   CdsDocumentos.FieldByName( 'CODGRUPOCNAB' ).asString +
                   StringOfChar(' ', 25 - length(CdsDocumentos.FieldByName( 'CODGRUPOCNAB' ).asString))+
                   CdsDocumentos.FieldByName( 'CODDOCUMENTO' ).asString +
                   StringOfChar(' ', 25 - length(CdsDocumentos.FieldByName( 'CODDOCUMENTO' ).asString))+
                   CdsDocumentos.FieldByName( 'NODOCUMENTO' ).asString  +
                   StringOfChar(' ', 25 - length(CdsDocumentos.FieldByName( 'NODOCUMENTO' ).asString))+
                   CdsDocumentos.FieldByName( 'DATAPROGRAMADA' ).asString+
                   StringOfChar(' ', 23 - length(CdsDocumentos.FieldByName( 'DATAPROGRAMADA' ).asString))+
                   formatFloat('#,##0.00', CdsDocumentos.FieldByName( 'VALOR' ).asfloat)+
                   StringOfChar(' ', 25 - length(CdsDocumentos.FieldByName( 'VALOR' ).asString))+
                   CtrlBaixaDocumentos.MessageInfo
                   );

        end; // else

        _PlnCodigoBaixa     := strTointDef(formatFloat('0', CtrlBaixaDocumentos.PlnCodigoBaixa), 0);
        _CodLancFinancBaixa := strTointDef(formatFloat('0', CtrlBaixaDocumentos.CodLancFinancBaixa), -1);

        fcds.EmptyDataSet;

      End; // while
      If Not Padroes.GravaLogOperacoes( IdEmpresa, IdMOdulo, IdUsuario, 'Pagamento Eletronico' ) Then
        MessageInfo := 'Não Consegui Gravar o Log';

      // Realiza a gravação dos dados
      CdsDocumentos.First;

    Except
      On E : Exception Do Begin
        Result := False;
        MessageInfo := MessageInfo + #13 + #10 +
                      'Erro ao efetuar baixa dos documentos'  + #13 + #10 +
                      E.Message;
      End;
    End;
  Finally


    If CdsDocumentos.Active Then
      If ( CdsDocumentos.ChangeCount > 0 ) Then CdsDocumentos.CancelUpdates;

    CdsDocumentos.Close;
    DtmBaixaIntBanco.SqlDocumentos.Open; 
  End;
End;




Function TCtrlBaixaIntBanco.StrToFloatDef(sValor :String; rDefault :Double) :Double;
Begin
  Try
    Result := StrToFloat(sValor)

  Except
    Result := rDefault;
  End;
End;

Function TCtrlBaixaIntBanco.DevolveString(sString,sCaracter:String):String;
Var
  sAux : String;
Begin
  sAux := Trim(sString);
  While Pos(' ',sAux) <> 0 Do sAux[Pos(' ',sAux)] := sCaracter[1];
  Result := sAux;
End;

Function TCtrlBaixaIntBanco.Devolvevirgula(sString,sCaracter:String):String;
Var
  sAux : String;
  posi : integer;
Begin
  sAux := Trim(sString);
  While Pos(' ',sAux) <> 0 Do Begin
    posi := Pos(' ',sAux);
    sAux := Copy(sAux,1,Posi-2)+sCaracter[1]+copy(sAux,Posi+2,length(saux));
  End;
  Result := sAux;
End;
procedure TCtrlBaixaIntBanco.SetsNomeArqLog(const Value: String);
begin
  FsNomeArqLog := Value;
end;

procedure TCtrlBaixaIntBanco.SetbUsaPortFormaRetorno(const Value: boolean);
begin
  FbUsaPortFormaRetorno := Value;
end;

End.
