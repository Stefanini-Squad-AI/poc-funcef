unit uCtrLancIRRF;

// Alterações:

{*******************************************************************************
Rotina             : GravaIRRF e OraNumeroString
N. SIG..........   : 62774
Data da Alteração: : 06/02/2018
Alteração Form:    :
Responsável:       : Andre Imakawa
Descrição          : Correção do arredondamento do valor gravado na LANCXINFORME
********************************************************************************
Analista.: Wylliam Leite da Silva - SOL:246488 PPM:1026389
SOL......: 246488
PPM......: 1026389
Data.....: 18/08/2015
Rotina...: Rotina de Busca IRRF
Descrição: Correção do Valor Idoso.
********************************************************************************
Analista.: Marcio Sanches Spinosa SOL 219250 KINTANA 2055037
Data.....: 10/09/2013
Sol......: 219250
Kintana..: 2055037
Rotina...: GravaIRRF
Descrição: Função ValidarModuloInforme, para validar se o sistema pode fazer
lançamento sem patrocinadora e patro.
********************************************************************************
Analista.: Felipe A. Santos SOL 195438 KINTANA 1878097
SOL......: 195438
Kintana..: 1878097
Data.....: 01/10/2013
Rotina...: GravaIRRF
Descrição: Gravação da quantidade de meses de RRA na lancIRRF
********************************************************************************
Analista.: Marcio Sanches Spinosa SOL 216223 KINTANA 2045657
Data.....: 10/09/2013
Sol......: 216223
Kintana..: 2045657
Rotina...: ValidarModuloInforme
Descrição: Função ValidarModuloInforme, para validar se o sistema pode fazer
lançamento sem patrocinadora e patro.
********************************************************************************
Analista.: Marcio Sanches Spinosa SOL 215621 KINTANA 2044679
Data.....: 03/09/2013
Sol......: 215621
Kintana..: 2044679
Rotina...: DeletaLancamentos
Descrição: CRIAÇÃO DA FUNÇÃO DELETALANCAMENTOS.
********************************************************************************
---------------------------------------------------------------------------------------------------
Analista.: Edilaine Ferraresi
SOL......: 211939
Kintana..: 2044010
Data.....: 27/08/2013
Rotina...: ProcurarDetalhe
Descrição: na alteração de lançamentos manuais está sumindo com lancamentos da busca
----------------------------------------------------------------------------------------------------
Rotina    : GravaIRRF
Data      : 30/04/2008
Autor     : Bruno Bastos
Pendência : 27546
Descrição : Gravar o código GPS quando houver alguma alteração na tela de manual de impostos.
----------------------------------------------------------------------------------------------------
Rotina    : GravaIRRF
Data      : 06/12/2007
Autor     : Bruno Bastos
Pendência : 27052
Descrição : Não inverter mais o sinal do valor de compensação de IR, ou seja, CodDirf = 8.
----------------------------------------------------------------------------------------------------
Rotina    : GravaIRRF
Data      : 05/07/2007
Autor     : Bruno Bastos
Pendência : 20091
Descrição : Passar a inserir o campo IdProcJud.
----------------------------------------------------------------------------------------------------
Rotina    : GravaIRRF
Data      : 19/04/2007
Autor     : Bruno Bastos
Pendência : 24530
Descrição : Passar a inserir o campo FlgPensaoAlim.
----------------------------------------------------------------------------------------------------
Rotina    : ListDocumentoCliente (nova)
Data      : 12/01/2007
Autor     : Paulo Ramos
Pendência : 22790
Descrição : Busca os documentos de uma pessoa (idforcli).
----------------------------------------------------------------------------------------------------
Rotina    : GravaIRRF
Data      : 24/10/2006
Autor     : Bruno Bastos
Pendência : 22156
Descrição : Gravar o campo CODIGOGPS quando for uma busca de INSS.
----------------------------------------------------------------------------------------------------
Rotina    : GravaIRRF
Data      : 18/10/2006
Autor     : Bruno Bastos
Pendência : 22465
Descrição : Não gravar mais o campo PLACONTARECDES.
----------------------------------------------------------------------------------------------------
Rotina    : ListModulos
Data      : 15/02/2006
Autor     : Bruno Bastos
Pendência : 21569
Descrição : Buscar o módulo Contas a Pagar filtrando também o idmodulo = 3.
----------------------------------------------------------------------------------------------------
Rotina    : GravaIRRF
Data      : 16/12/2005
Autor     : Bruno Bastos
Pendência : 20594
Descrição : Gravar o campo datapagamento. A funcão GravaIRRF recebeu mais um
            parâmetro opcional para não alterarmos todas as chamadas a mesma.
----------------------------------------------------------------------------------------------------
Rotina    : GravaIRRF
Data      : 10/05/2005
Autor     : Bruno Bastos
Pendência : 19101 e 19102
Descrição : Foi colocado mais um parâmetro para saber se é para compensar ou não
            o estorno da busca do irrf
----------------------------------------------------------------------------------------------------
Rotina    : GravaIRRF
Data      : 16/12/2004
Autor     : Marchetti
Pendência : 16831
Descrição : Colocada a busca da aliquota do IRRF
----------------------------------------------------------------------------------------------------
Rotina    : GravaIRRF
Data      : 10/09/2004
Autor     : Marchetti
Pendência : 17428
Descrição : Colocada a busca dos parametros das linhas do informe para IR do CAP
----------------------------------------------------------------------------------------------------
Rotina    : VerificaPlanoPatro
Data      : 04/08/2004
Autor     : Marchetti
Pendência : 15738
Descrição : Criada a rotina que verifica a restrição entre plano x patro
---------------------------------------------------------------------------------------------------}

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbLancIRRF, uDbLancxinforme, uSistema, DB, uDataBase, DbClient,
     {$IFNDEF VERSAO0505} uCMTypes {$ENDIF}, uCtrlPlanPrevContabPatro, DBaseDados;

  Type

    TCtrLancIRRF = Class(TCmControlObject)

    private
      FDbLancIRRF: TDbLancIRRF;
      FDbLancxinforme : TDbLancxinforme;
      CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;

      FCdsLancIRRF: TClientDataSet;
      FCdsLancxinforme: TClientDataSet;
      CdsAux : TClientDataSet;
      cdsAux1 : TclientDataSet;
      CdsAux2 : TclientDataSet;
      CdsAux3 : TclientDataSet;
      CdsInf  : TclientDataSet;
      FIcodLanc: Double;
      FpbPrimVez: Boolean;


      procedure SetDbLancxinforme(const Value: TDbLancxinforme);
      procedure SetCdsLancxinforme(const Value: TClientDataSet);

      procedure SetDbLancIRRF(const Value: TDbLancIRRF);
      procedure SetCdsLancIRRF(const Value: TClientDataSet);
      procedure SetIcodLanc(const Value: Double);
      procedure SetpbPrimVez(const Value: Boolean);


    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      iID: Integer;
      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsLancxinforme: TClientDataSet   read FCdsLancxinforme write SetCdsLancxinforme;
      property CdsLancIRRF: TClientDataSet          read FCdsLancIRRF        write SetCdsLancIRRF;
      property DbLancxinforme: TDbLancxinforme read FDbLancxinforme  write SetDbLancxinforme;
      property DbLancIRRF: TDbLancIRRF               read FDbLancIRRF         write setDbLancIRRF;
      property pIcodLanc : Double read FIcodLanc write SetIcodLanc;
      property pbPrimVez : Boolean read FpbPrimVez write SetpbPrimVez;

      {Grava os lançamentos de IRRF no Banco de Dados}
      function GravaIRRF(IdPessoa : LongInt;
                         UsaPlanoPatro : Boolean;
                         iCodDocumento,
                         iEmpresaProp,
                         iBenef:Double;
                         sCodNatureza,
                         sDataLanc:String;
                         rValBase,
                         rValIRRF,
                         rValINSS,
                         rValPIS,rValRef,
                         rPercIRRF,
                         rValCOFINS,
                         rValCSLL,
                         rValPISCOFCSLL:Real;
                         DataInf: OleVariant;
                         Var iCodLanc:double;
                         sContaContabil : String;
                         iPlano : LongInt;
                         sFlgFolha : String;
                         iIdPlanoPrev,
                         iIdPatro,
                         iIdPrograma : LongInt;
                         var bPrimvez : Boolean;
                         iIdModulo,iIdModuloRespon,
                         iIdMotivo : LongInt;
                         sCodCentroCusto : String;
                         iIdVersaoFolha : LongInt;
                         sCodtiprecdes,
                         sPlacontad : String;
                         sCodCentroRespon: String;
                         rValorDepIRRF : Real;
                         rValIOF : Real = 0;
                         Estorno : Boolean = False;
                         rValISS:Real = 0;
                         pbCompensa: Boolean = True;
                         sDataPagto: String = '';
                         iCodGPS: Integer = 0;
                         iFlgPensaoAlim: Integer = 0;
                         piIdProcJud: Integer = 0;
                         iQtdMeses : Integer = 0 // Felipe A. Santos SOL 195438 KINTANA 1878097
                         ): Boolean;

      {Apaga os lançamentos do IRRF do Bandco de Dados}
      Function ExcluirLancIRRF : Boolean;
      {Procurar Lançamentos de IRRF}
      function ProcurarLancIRRF(IdLancIRRF : LongInt) : OleVariant;
      {Procura os detalhes dos lançamentos de IRRF}
      function ProcurarDetalhe(piIdPessoa : LongInt; psDataPag : String; pstrCodigoNatureza : string) : OleVariant; overload;
      function ProcurarDetalhe(IdLancIRRF : LongInt) : OleVariant; overload;  // Edilaine - SOL 211939 / KTN 2044010

      //Novo método para retornar os documentos de um pessoa (cliente/fornecedor)
      function ListDocumentoCliente(pIdForCLi : LongInt) : OleVariant;

      {Lista os documentos Disponíveis}
      function ListDocumento(CodDocumento : LongInt) : OleVariant;
      {Lista centros de custo}
      function ListCentCust(IdEmpresa : integer) : OleVariant;
      {Lista motivos}
      function ListMotivo : OleVariant;
      {List a versão da Folha}
      function ListVersaoFolha : OleVariant;
      {Lista pessoa Física}
      function ListPF(IdPessoa : integer) : OleVariant;
      function OraNumero(rNumero : Double ):string;
      function OraNumeroString(sNumero : string):string; // Andre Imakawa - SIG 62774
      {Deleta Lancxinforme}
      function Deletar(IdLancIRRF : LongInt; bprincipal : Boolean) : Boolean; overload;
      
      function DeletaLancamentos(IdLancIRRF : LongInt) : Boolean;  //Marcio Sanches Spinosa SOL 215621 KINTANA 2044679

      function Deletar(const iIdLancIRRF     : LongInt;
                       const iIdBeneficiario : Integer;
                       const dDataPagamento  : tDateTime;
                       const bPrincipal      : Boolean;
                       const pStrCodNatureza : string = '') : Boolean; overload;


      function ListModulos : OleVariant;

      function VerificaPlanoPatro(const iPlano, iPatro : Int64) : Boolean;
      function BuscaAliquota(fBase : Extended; DataLanc : String) : Extended;
      function UpdateLanctoInforme(const pIDLancIRRF,
                                         pIDInforme    : Integer;
                                   const pValor        : Double) : Boolean;
    protected

    End;

implementation

{ TCtrLancIRRF }




constructor TCtrLancIRRF.Create;
begin
  inherited;
  FDbLancxinforme := TDbLancxinforme.Create(self);
  FDbLancIRRF   := TDbLancIRRF.create(self);
  CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
  CtrlPlanPrevContabPatro.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                                     Sistema.AppRemoteServer,True,nil,nil,False);
  
  cdsaux1   := TClientDataSet.Create(nil);
  cdsAux2   := TClientDataSet.Create(nil);
  cdsAux3   := TClientDataSet.Create(nil);
  cdsInf    := TClientDataSet.Create(nil);
end;

destructor TCtrLancIRRF.Destroy;
begin
  CtrlPlanPrevContabPatro.Free;
  FDbLancxinforme.Free;
  FDbLancIRRF.Free;
  cdsaux1.free;
  cdsAux2.free;
  cdsAux3.free;
  cdsInf.free;
  if isAppServer then
    Begin
      FCdsLancxinforme.Free;
      FCdsLancIRRF.free;
      CdsAux.free;
    end;
  inherited;
end;

procedure TCtrLancIRRF.DoChangeDataBase;
begin
  inherited;
  DbLancxinforme.DataBaseName := DataBaseName;
  DbLancIRRF.DataBaseName   := DataBaseName;
end;




procedure TCtrLancIRRF.SetCdsLancIRRF(
  const Value: TClientDataSet);
begin
  FCdsLancIRRF := Value;
end;

procedure TCtrLancIRRF.SetCdsLancxinforme(
                                        const Value: TClientDataSet);
begin
  FCdsLancxinforme := Value;
end;


procedure TCtrLancIRRF.SetDbLancIRRF(
        const Value: TDbLancIRRF);
begin
  FDbLancIRRF := Value;
end;

procedure TCtrLancIRRF.SetDbLancxinforme(
  const Value: TDbLancxinforme);
begin
  FDbLancxinforme := Value;
end;


function TCtrLancIRRF.ExcluirLancIRRF: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ExcluirLancIRRF(FCdsLancIRRF.data, FCdsLancxinforme.data);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;
           // itens Filhos
           Result := ApplyCds(FCdsLancxinforme,FDbLancxinforme,[],[] );
           Msg    := FDbLancxinforme.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           // Pai
           Result := ApplyCds(FCdsLancIRRF,FDbLancIRRF,[],[] );
           Msg    := FDbLancIRRF.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           Commit;
        except
           On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            End;
        End;
     End;
end;

procedure TCtrLancIRRF.OnCreateAppServer;
begin
  inherited;
  FCdsLancxinforme := TClientDataSet.Create(nil);
  FCdsLancIRRF := TClientDataSet.Create(nil);
  CdsAux := TClientDataSet.Create(nil);
end;

function TCtrLancIRRF.ProcurarLancIRRF(IdLancIRRF: Integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT * '+
          '  FROM LANCIRRF '+
          ' WHERE IDLANCIRRF = '+intTostr(IdLancIRRF);
  Result := GetDataPacket(Ssql);
end;

//Novo método para retornar os documentos de um pessoa (cliente/fornecedor)
function TCtrLancIRRF.ListDocumentoCliente(pIdForCLi: Integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql :=
    'SELECT '+#13#10+
    '  IDFORCLI, '+#13#10+
    '  CODDOCUMENTO, '+#13#10+
    '  NODOCUMENTO, '+#13#10+
    '  COMPLDOCUMENTO '+#13#10+
    'FROM '+#13#10+
    '  DOCUMENTO '+#13#10+
    'WHERE IDFORCLI = '+intTostr(pIdForCli);
  Result := GetDataPacket(Ssql);
end;

function TCtrLancIRRF.ListDocumento(CodDocumento : Integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT IDFORCLI, CODDOCUMENTO, NODOCUMENTO, COMPLDOCUMENTO '+
          '  FROM DOCUMENTO ';
  if CodDocumento <> -1 then
     Ssql := Ssql + ' WHERE CODDOCUMENTO = '+intTostr(CodDocumento);
  Result := GetDataPacket(Ssql);
end;

function TCtrLancIRRF.ListCentCust(IdEmpresa : integer) : OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT NOME, CODCENTROCUSTO, CODEXTERNO '+
          '  FROM CENTCUST '+
          ' WHERE (IDEMPRESA = '+intTostr(IdEmpresa)+') '+
          '   AND (IDPLANCENTCUST = (SELECT IDPLANCENTCUST FROM PARAMGLOBAL)) '+
          '  AND (ATIVO = ''S'') '+
          ' ORDER BY CODCENTROCUSTO';
  Result := GetDataPacket(Ssql);
end;

function TCtrLancIRRF.ListMotivo: OleVariant;
Var
 Ssql : string;
begin
  Ssql := 'SELECT IDMOTIVO, DESCRICAO '+
          '  FROM MOTIVO '+
          ' ORDER BY DESCRICAO ';
  result := GetDataPacket(Ssql);
end;


function TCtrLancIRRF.ListModulos: OleVariant;
Var
 Ssql : string;
begin
  Ssql := 'SELECT IDMODULO, NOMEMODULO AS DESCRICAO '+
          'FROM MODULO '+
          'WHERE IDMODULO IN (3,15,18,21,24) '+ 
          ' ORDER BY IDMODULO DESC ';
  result := GetDataPacket(Ssql);
end;


function TCtrLancIRRF.ListVersaoFolha: OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT IDHSTFOLHABENEF, HISTORICO '+
          '  FROM HSTFOLHABENEF '+
          ' ORDER BY HISTORICO ';
  Result := GetDataPacket(Ssql);
end;

function TCtrLancIRRF.ListPF(IdPessoa: integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT TIPO '+
          '  FROM PESSOA '+
          ' WHERE IDPESSOA = '+intTostr(IdPessoa);
  result := GetDataPacket(Ssql);
end;

function TCtrLancIRRF.OraNumero(rNumero: Double): string;
var sNumero : string;
    AuxDec  : char;
begin
   AuxDec           := DecimalSeparator;
   DecimalSeparator := '.';
   sNumero:= FloatToStr(rNumero);
   Result :=sNumero;
   DecimalSeparator:=AuxDec;
end;

function TCtrLancIRRF.Deletar(IdLancIRRF : LongInt; bprincipal: Boolean): Boolean;
Var
  Ssql: string;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ExcluirLancIRRF(FCdsLancIRRF.data, FCdsLancxinforme.data);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
    Begin
      Try

        StartTransaction;
        Result := True;

        Ssql := 'DELETE From LANCXINFORME '+
                ' WHERE IDLANCIRRF = '+ intTostr(IdLancIRRF) +
                '   AND NOT EXISTS (SELECT 1 FROM HISTRUBSAL H '+
                '                   WHERE H.IDLANCIRRF = LANCXINFORME.IDLANCIRRF) ';
        if not ExecSQL(Ssql) then
           Raise Exception.Create(messageinfo);

        if bprincipal then
          Begin
            Ssql := 'DELETE FROM LANCIRRF '+
                    ' WHERE IDLANCIRRF = '+IntToStr(IdLancIRRF) +
                '   AND NOT EXISTS (SELECT 1 FROM HISTRUBSAL H '+
                '                   WHERE H.IDLANCIRRF = LANCIRRF.IDLANCIRRF) ';
            if not ExecSQL(Ssql) then
              Raise Exception.Create(messageinfo);
          end;
        Commit;
      except
        On E:Exception Do
          Begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
          End;
      end;
    end;
end;

// Edilaine - SOL 211939 / KTN 2044010
function TCtrLancIRRF.ProcurarDetalhe(IdLancIRRF : LongInt) : OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT LI.*, I.NOMEINFORME, 0 AS VLRLANCSINAL '+
          '  FROM LANCXINFORME LI, INFORME I '+
          ' WHERE (LI.IDLANCIRRF = '+IntToStr(IdLancIRRF)+') '+
          '   AND (LI.IDINFORME = I.IDINFORME)';

  Result := GetDataPacket(Ssql);
end;
// Edilaine - SOL 211939 / KTN 2044010 - fim


function TCtrLancIRRF.ProcurarDetalhe(piIdPessoa : LongInt; psDataPag : String; pstrCodigoNatureza : string): Olevariant;
Var
  Ssql : string;
begin
{CPrev - Pend. 27817 - Início
  Ssql := 'SELECT LI.*, I.NOMEINFORME, 0 AS VLRLANCSINAL '+
          '  FROM LANCXINFORME LI, INFORME I '+
          ' WHERE (LI.IDLANCIRRF = '+IntToStr(IdLancIRRF)+') '+
          '   AND (LI.IDINFORME = I.IDINFORME)';
}

  sSql := ' SELECT LI.*, I.NOMEINFORME, 0 AS VLRLANCSINAL '    +
          ' FROM LANCXINFORME LI, INFORME I, lancirrf lir '    +
          ' WHERE lir.idbenefirrf = ' + IntToStr(piIdPessoa)   +
          '   and lir.idlancirrf  = li.idlancirrf '            +
          '   and lir.datapagamento = TO_DATE(' + quotedstr(psDataPag)+',''DD/MM/YYYY'')' +
          '   AND (LI.IDINFORME = I.IDINFORME) ';

   if (Trim(pstrCodigoNatureza) <> EmptyStr) then
      Ssql := Ssql + '   AND LIR.CODNATUREZA = ' + pstrCodigoNatureza;

  Result := GetDataPacket(Ssql);
end;

function TCtrLancIRRF.GravaIRRF(IdPessoa : LongInt;
                                UsaPlanoPatro : Boolean;
                                iCodDocumento,
                                iEmpresaProp,
                                iBenef:Double;
                                sCodNatureza,
                                sDataLanc:String;
                                rValBase,
                                rValIRRF,
                                rValINSS,
                                rValPIS,rValRef,
                                rPercIRRF,
                                rValCOFINS,
                                rValCSLL,
                                rValPISCOFCSLL:Real;
                                DataInf: OleVariant;
                                Var iCodLanc:double;
                                sContaContabil : String;
                                iPlano : LongInt;
                                sFlgFolha : String;
                                iIdPlanoPrev,
                                iIdPatro,
                                iIdPrograma : LongInt;
                                var bPrimvez : Boolean;
                                iIdModulo,iIdModuloRespon,
                                iIdMotivo : LongInt;
                                sCodCentroCusto : String;
                                iIdVersaoFolha : LongInt;
                                sCodtiprecdes,
                                sPlacontad : String;
                                sCodCentroRespon: String;
                                rValorDepIRRF : Real;
                                rValIOF : Real = 0;
                                Estorno : Boolean = False;
                                rValISS:Real = 0;
                                pbCompensa: Boolean = True;
                                sDataPagto: String = '';
                                iCodGPS: Integer = 0;
                                iFlgPensaoAlim: Integer = 0;
                                piIdProcJud: Integer = 0;
                                iQtdMeses : integer = 0 // Felipe A. Santos SOL 195438 KINTANA 1878097
                                ) : Boolean;

Var
    sValInfSinal,sValInf,sNumDocChave,sValRef,sPercIRRF,sValIRRF,sValBase,sValINSS,sValPIS, sValIOF, Ssql:String;
    bFez : Boolean;
    rFator : Double;
    sValCOFINS, sValCSLL, sValPISCOFCSLL, sValISS : String;
    sValNumdepIR : String;   
    sFontePagadora : String;
    iIDINFORME: Integer;
    iPosicao: Integer;
Begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarIRRF(IdPessoa, UsaPlanoPatro, iCodDocumento, iEmpresaProp, iBenef, sCodNatureza, sDataLanc,
                                               rValBase, rValIRRF, rValINSS, rValPIS, rValRef, rPercIRRF, ,rValCOFINS,rValCSLL, rValPISCOFCSLL,
                                               DataInf, iCodLanc, sContaContabil, iPlano,
                                               sFlgFolha, iIdPlanoPrev, iIdPatro, iIdPrograma, bPrimvez, iIdModulo, iIdMotivo,
                                               sCodCentroCusto, iIdVersaoFolha, sCodtiprecdes, sPlacontad, rValIOF, iIdModuloRespon, rValISS,
                                               iQtdMeses);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        try
           cdsInf.data := DataInf;

            if not  dtmBaseDados.dbBaseDados.InTransaction then
                   dtmBaseDados.dbBaseDados.StartTransaction;

//           StartTransaction;
           Result := True;

           // usada para o IR
           if (rValBase > 0)
           and (rPercIRRF = 0) then//Marcio Sanches Spinosa SOL 216223 KINTANA 2045657
           begin
              rPercIRRF := BuscaAliquota(rValBase, sDataLanc);
           end;

           If not pbCompensa Then
             rValIRRF := rValIRRF * -1;

           If not Estorno Then
             sDataPagto := sDataLanc;

           sValIRRF       := OraNumero(rValIRRF);
           sValBase       := OraNumero(rValBase);
           sValINSS       := OraNumero(rValINSS);
           sValPIS        := OraNumero(rValPIS);

           sValISS        := OraNumero(rValISS);

           sValIOF        := OraNumero(rValIOF);
           sValRef        := OraNumero(rValRef);
           sPercIRRF      := OraNumero(rPercIRRF);
           sValCOFINS     := OraNumero(rValCOFINS);
           sValCSLL       := OraNumero(rValCSLL);
           sValPISCOFCSLL := OraNumero(rValPISCOFCSLL);
           sValNumdepIR   := Oranumero(rValorDepIRRF); 
           sNumDocChave := '';
           //
           Ssql := 'SELECT NUMDOCUMENTO '+
                   '  FROM PESSOA '+
                   ' WHERE IDPESSOA = '+ IntToStr(idpessoa);
           cdsAux1.data := GetDataPacket(Ssql);

           sNumDocChave := cdsAux1.FieldByName('NUMDOCUMENTO').AsString;
           //
           if iCodDocumento <> 0 then Begin
              Ssql := 'SELECT CODDOCUMENTO '+
                      '  FROM LANCIRRF '+
                      ' WHERE CODDOCUMENTO = '+FloattoStr(iCodDocumento)+
                      ' AND CODNATUREZA = '''+sCodNatureza+'''';
              cdsAux1.Data := GetDataPacket(Ssql);
              //
              bFez := False;
              If (cdsAux1.IsEmpty) or (not bPrimvez) then begin
                 if (iCodLanc <> 0) then begin
                    bFez := True;
                    with cdsAux1 do begin
                       sSql :=        'UPDATE LANCIRRF ';
                       sSql := sSql + '   SET CODDOCUMENTO =    '+FloattoStr(iCodDocumento);
                       sSql := sSql + '       ,IDPESSOA =       '+FloatToStr(iEmpresaProp);
                       sSql := sSql + '       ,IDBENEFIRRF =    '+FloatToStr(iBenef);
                       sSql := sSql + '       ,CODNATUREZA =    '''+sCodNatureza+'''';
                       sSql := sSql + '       ,DATALANCAMENTO = TO_DATE('''+sDataLanc+''',''dd/mm/yyyy'')';

                       If not Estorno Then
                         sSql := sSql + '       ,DATAPAGAMENTO  = TO_DATE('''+sDataPagto+''',''dd/mm/yyyy'')';

                       sSql := sSql + '       ,VLRBASE =        '+sValBase;
                       sSql := sSql + '       ,VLRIRRF =        '+sValIRRF;
                       sSql := sSql + '       ,VLRINSS =        '+sValINSS;
                       sSql := sSql + '       ,VLRPIS  =        '+sValPIS;
                       sSql := sSql + '       ,VLRCOFINS =      '+sValCOFINS;
                       sSql := sSql + '       ,VLRCSLL =        '+sValCSLL;

                       sSql := sSql + '       ,VLRISS  =        '+sValISS;

                       sSql := sSql + '       ,VLRCSCOFPIS =    '+sValPISCOFCSLL;
                       sSql := sSql + '       ,VLRIOF  =        '+sValIOF;
                       sSql := sSql + '       ,VLRDEPIRRF =     '+sValNumdepIR;
                       sSql := sSql + '       ,NUMDOCUMENTO =   '''+sNumDocChave+'''';
                       sSql := sSql + '       ,VLRREFERENCIA =  '+sValRef;
                       sSql := sSql + '       ,PERCIRRF =       '+sPercIRRF;
                       sSql := sSql + '       ,FLGDARF  =  ''N''';
                       If (iPlano <= 0) then
                           sSql := sSql + '    ,PLANO = NULL  '
                       else
                          sSql := sSql + '    ,PLANO =    '+IntToStr(iPlano);
                       if (sContaContabil = '') then
                          sSql := sSql + '    ,PLACONTA =  NULL '
                       else
                          sSql := sSql + '    ,PLACONTA = '''+sContaContabil+'''';

                       if iIdPlanoPrev > 0 then
                          sSql := sSql + '    ,IDPLANOPREV =    '+quotedStr(IntToStr(iIdPlanoPrev));
                       if iIdPatro > 0 then
                          sSql := sSql + '    ,IDPATRO =        '+quotedStr(IntToStr(iIdPatro));
                       if iIdPrograma > 0 then begin
                          sSql := sSql + ' ,IDPROGRAMA =     '+quotedStr(IntToStr(iIdPrograma));
                       end else begin
                          sSql := sSql + ' ,IDPROGRAMA =  NULL ';
                       end;
                       if trim(sCodCentroCusto) <> '' then begin
                          sSql :=sSql + '  ,CODCENTROCUSTO = '''+sCodCentroCusto+'''';
                       end else begin
                          sSql :=sSql + '  ,CODCENTROCUSTO = NULL';
                       end;

                       sSql :=sSql + '  ,IDEMPRESA =     '+IntToStr(IdPessoa);
                       sSql := sSql + '       ,FLGFOLHA =       '''+sFlgFolha+'''';
                       sSql := sSql + '       ,IDMODULO =       '+IntToStr(iIdModulo);
                       sSql := sSql + '       ,CODTIPRECDES =   '''+sCodTipRecdes+'''';
                       sSql := sSql + '       ,CODCENTRORESPON = '''+sCodCentroRespon+'''';

                       ssql := ssql +'        ,IDMODULORESPON =  '+IntToStr(iIdModuloRespon);
                       if iIdMotivo > 0 then
                          sSql := sSql + '    ,IDMOTIVO =       '+IntToStr(iIdMotivo)
                       else
                          sSql := sSql + '    ,IDMOTIVO = NULL  ';
                       if iIdVersaoFolha > 0 then
                          sSql := sSql + '    ,IDHSTFOLHABENEF  =       '+IntToStr(iIdVersaoFolha)
                       else
                          sSql := sSql + '    ,IDHSTFOLHABENEF  = NULL  ';

                       // Felipe A. Santos SOL 195438 KINTANA 1878097
                       if iQtdMeses > 0 then
                          sSql := sSql + '    ,QTDMESES  =       '+IntToStr(iQtdMeses)
                       else
                          sSql := sSql + '    ,QTDMESES  = NULL  ';
                       // Felipe A. Santos SOL 195438 KINTANA 1878097 - fim

                       sSql := sSql + ' WHERE (IDLANCIRRF = '+FloatToStr(iCodLanc)+')';
                       if not  ExecSQL(Ssql) then
                         Raise Exception.Create(messageinfo);
                    end;
                 end else begin
                    bFez := True;
                    iCodLanc := GetSequence('LANCIRRF');
                    with cdsAux1 do begin
                       Close;
                       sSql :='INSERT INTO LANCIRRF(IDLANCIRRF,CODDOCUMENTO,IDPESSOA, '+
                              'IDBENEFIRRF,CODNATUREZA,DATALANCAMENTO,VLRBASE,VLRIRRF, '+
                              'VLRINSS,VLRPIS,VLRCOFINS,VLRCSLL,VLRCSCOFPIS,VLRISS,CODTIPRECDES, '+
                              'CODCENTRORESPON, '+
                              ' NUMDOCUMENTO, '+
                              'VLRREFERENCIA,PERCIRRF,VLRDEPIRRF,PLACONTA,PLANO, '+
                              'IDPLANOPREV,IDPATRO,IDPROGRAMA,CODCENTROCUSTO,IDEMPRESA, '+
                              'FLGFOLHA,IDMODULO,IDMODULORESPON,FLGDARF,IDMOTIVO,IDHSTFOLHABENEF, ';

                       If not Estorno Then
                         sSql := sSql + ' DATAPAGAMENTO, ';

                       sSql := sSql + ' CODIGOGPS, ';

                       //Felipe A. Santos SOL 195438 KINTANA 1878097
                       //sSql := sSql + ' VLRIOF) VALUES(';

                       sSql := sSql + 'VLRIOF, ';
                       sSql := sSql + 'QTDMESES';

                       sSql := sSql + ') VALUES(';
                       //Felipe A. Santos SOL 195438 KINTANA 1878097 - fim

                       sSql := sSql+FloatToStr(iCodLanc)+','+FloattoStr(iCodDocumento)+','+FloatToStr(iEmpresaProp)+',';
                       sSql := sSql+FloatToStr(iBenef)+','''+sCodNatureza+''',';
                       sSql := sSql+'TO_DATE('''+sDataLanc+''',''dd/mm/yyyy''),';
                       sSql := sSql+sValBase+','+sValIRRF+','+sValINSS+','+sValPIS+',';
                       ssql := ssql+sValCOFINS+','+sValCSLL+','+sValPISCOFCSLL+','+sValISS+',';
                       ssql := ssql+''''+sCodtiprecdes+''','+''''+sCodCentroRespon+''',';
                       sSql := sSql+''''+sNumDocChave+''','+sValRef+','+sPercIRRF+','+sValNumdepIR+',';
                       if (sContaContabil = '') then
                          sSql := sSql+' NULL, '
                       else
                          sSql := sSql+''''+sContaContabil+''',';

                       If (iPlano <= 0) then
                          sSql := sSql +' NULL, '
                       else
                           sSql := sSql +IntToStr(iPlano)+',';

                       if iIdPlanoPrev > 0 then
                          sSql := sSql+quotedStr(IntToStr(iIdPlanoPrev))+','
                       else
                          Ssql := Ssql+ 'NULL, ';
                       if iIdPatro > 0 then
                          Ssql := Ssql + quotedStr(IntToStr(iIdPatro))+','
                       else
                          Ssql := Ssql + 'NULL, ';
                       if iIdPrograma > 0 then begin
                          sSql := sSql+quotedStr(IntToStr(iIdPrograma))+',';
                       end else begin
                          sSql := sSql+' NULL,';
                       end;
                       if trim(sCodCentroCusto) <> '' then begin
                          sSql := sSql + ''''+sCodCentroCusto+''',';
                       end else begin
                          sSql := sSql + 'NULL, ';
                       end;

                       sSql := sSql +IntToStr(IdPessoa)+',';
                       sSql := sSql + ''''+sFlgFolha+''','+IntToStr(iIdModulo)+','+IntToStr(iIdModulorespon)+',''N'''+',';
                       if iIdMotivo > 0 then
                          sSql := sSql + IntToStr(iIdMotivo)+','
                       else
                          sSql := sSql + 'NULL,';
                       if iIdVersaoFolha > 0 then
                          sSql := sSql + IntToStr(iIdVersaoFolha)+','+'TO_DATE('''+sDataPagto+''',''dd/mm/yyyy''),'
                       else
                          sSql := sSql + 'NULL,'+'TO_DATE('''+sDataPagto+''',''dd/mm/yyyy''),';

                       If iCodGPS > 0 Then
                         sSql := sSql + IntToStr(iCodGPS) + ', '
                       Else
                         sSql := sSql + ' NULL, ';

                       if rValIOF = 0 then
                          sSql := sSql + 'NULL, ' // Alterado por Felipe A. Santos SOL 195438 KINTANA 1878097
                       else
                          sSql := sSql +  sValIOF+', '; // Alterado por Felipe A. Santos SOL 195438 KINTANA 1878097

                       // Felipe A. Santos SOL 195438 KINTANA 1878097
                       if iQtdMeses > 0 then
                          sSql := sSql + IntToStr(iQtdMeses) + ')'
                       else
                          sSql := sSql + 'NULL)';
                       // Felipe A. Santos SOL 195438 KINTANA 1878097 - fim

                       if not  ExecSQL(Ssql) then
                         Raise Exception.Create(messageinfo);
                    end;
                 end;
              end else begin
                 if (iCodLanc <> 0) then begin
                    bFez := True;
                    with cdsAux1 do begin
                       sSql := '      UPDATE LANCIRRF ';
                       sSql := sSql + '  SET CODDOCUMENTO =    '+FloattoStr(iCodDocumento);
                       sSql := sSql + '      ,IDPESSOA =       '+FloatToStr(iEmpresaProp);
                       sSql := sSql + '      ,IDBENEFIRRF =    '+FloatToStr(iBenef);
                       sSql := sSql + '      ,CODNATUREZA =    '''+sCodNatureza+'''';
                       sSql := sSql + '      ,DATALANCAMENTO = TO_DATE('''+sDataLanc+''',''dd/mm/yyyy'')';

                       If not Estorno Then
                         sSql := sSql + '      ,DATAPAGAMENTO = TO_DATE('''+sDataPagto+''',''dd/mm/yyyy'')';

                       sSql := sSql + '      ,VLRBASE =        '+sValBase;
                       sSql := sSql + '      ,VLRIRRF =        '+sValIRRF;
                       sSql := sSql + '      ,VLRINSS =        '+sValINSS;
                       sSql := sSql + '      ,VLRDEPIRRF =     '+sValNumdepIR;
                       sSql := sSql + '      ,VLRPIS  =        '+sValPIS;
                       sSql := sSql + '      ,VLRCOFINS =      '+sValCOFINS;
                       sSql := sSql + '      ,VLRCSLL =        '+sValCSLL;
                       sSql := sSql + '      ,VLRISS    =      '+sValISS;
                       sSql := sSql + '      ,VLRCSCOFPIS =    '+sValPISCOFCSLL;
                       sSql := sSql + '      ,CODTIPRECDES =   '''+sCodTipRecdes+''''; // p. 15761
                       sSql := sSql + '      ,CODCENTRORESPON = '''+sCodCentroRespon+'''';
                       sSql := sSql + '      ,VLRIOF  =        '+sValIOF;
                       sSql := sSql + '      ,NUMDOCUMENTO =   '''+sNumDocChave+'''';
                       sSql := sSql + '      ,VLRREFERENCIA =  '+sValRef;
                       sSql := sSql + '      ,PERCIRRF =       '+sPercIRRF;
                       sSql := sSql + '      ,FLGDARF  =  ''N''';

                       if (sContaContabil = '') then
                          sSql := sSql + '    ,PLACONTA =  NULL '
                       else
                          sSql := sSql + '    ,PLACONTA = '''+sContaContabil+'''';

                       if (iPlano <= 0) then
                          sSql := sSql + '    ,PLANO = NULL  '
                       else
                          sSql := sSql + '    ,PLANO =    '+IntToStr(iPlano);

                         if iIdPlanoPrev > 0 then
                            sSql := sSql + '    ,IDPLANOPREV =    '+quotedStr(IntToStr(iIdPlanoPrev));
                         if iIdPatro > 0 then
                            sSql := sSql + '    ,IDPATRO =        '+quotedStr(IntToStr(iIdPatro));
                          if iIdPrograma > 0 then begin
                             sSql := sSql + '    ,IDPROGRAMA =     '+IntToStr(iIdPrograma);
                          end else begin
                             sSql := sSql + '    ,IDPROGRAMA =  NULL ';
                          end;
                          if trim(sCodCentroCusto) <> '' then begin
                             sSql := sSql + '    ,CODCENTROCUSTO = '''+sCodCentroCusto+'''';
                          end else begin
                             sSql := sSql + '    ,CODCENTROCUSTO = NULL';
                          end;
                          sSql := sSql + '    ,IDEMPRESA =     '+IntToStr(IdPessoa);
                       sSql := sSql + '    ,FLGFOLHA =       '''+sFlgFolha+'''';
                       sSql := sSql + '    ,IDMODULO =       '+IntToStr(iIdModulo);
                       sSql := sSql + '    ,IDMODULORESPON =   '+IntToStr(iIdModuloRespon);
                       if iIdMotivo > 0 then
                          sSql := sSql + '    ,IDMOTIVO =       '+IntToStr(iIdMotivo)
                       else
                          sSql := sSql + '    ,IDMOTIVO = NULL  ';
                       if iIdVersaoFolha > 0 then
                          sSql := sSql + '    ,IDHSTFOLHABENEF  = '+IntToStr(iIdVersaoFolha)
                       else
                          sSql := sSql + '    ,IDHSTFOLHABENEF  = NULL';

                       // Felipe A. Santos SOL 195438 KINTANA 1878097
                       if iQtdMeses > 0 then
                          sSql := sSql + '    ,QTDMESES  =       '+IntToStr(iQtdMeses)
                       else
                          sSql := sSql + '    ,QTDMESES  = NULL  ';
                       // Felipe A. Santos SOL 195438 KINTANA 1878097 - fim

                       sSql := sSql + ' WHERE (IDLANCIRRF = '+FloatToStr(iCodLanc)+')';
                      if not  ExecSQL(Ssql) then
                         Raise Exception.Create(messageinfo);
                    end;
                 end;
              end;
              if not bFez and bPrimvez then
                 bPrimvez := true
              else
                 bPrimvez := false;
           end else begin
              if (iCodLanc <> 0) then begin
                 with cdsAux1 do begin
                    sSql := '       UPDATE LANCIRRF ';
                    sSql := sSql + '   SET CODDOCUMENTO = NULL  ';
                    sSql := sSql + '       ,IDPESSOA =       '+FloatToStr(iEmpresaProp);
                    sSql := sSql + '       ,IDBENEFIRRF =    '+FloatToStr(iBenef);
                    sSql := sSql + '       ,CODNATUREZA =    '''+sCodNatureza+'''';
                    sSql := sSql + '       ,DATALANCAMENTO = TO_DATE('''+sDataLanc+''',''dd/mm/yyyy'')';

                    sSql := sSql + '       ,DATAPAGAMENTO = TO_DATE('''+sDataPagto+''',''dd/mm/yyyy'')';

                    sSql := sSql + '       ,VLRBASE =        '+sValBase;
                    sSql := sSql + '       ,VLRIRRF =        '+sValIRRF;
                    sSql := sSql + '       ,VLRINSS =        '+sValINSS;
                    sSql := sSql + '       ,VLRDEPIRRF =     '+sValNumdepIR;
                    sSql := sSql + '       ,VLRPIS  =        '+sValPIS;

                    sSql := sSql + '       ,VLRISS  =        '+sValISS;

                    sSql := sSql + '       ,VLRCOFINS =      '+sValCOFINS;
                    sSql := sSql + '       ,CODTIPRECDES =   '''+sCodTipRecdes+'''';
                    sSql := sSql + '       ,CODCENTRORESPON = '''+sCodCentroRespon+'''';
                    sSql := sSql + '       ,VLRCSLL =        '+sValCSLL;
                    sSql := sSql + '       ,VLRCSCOFPIS =    '+sValPISCOFCSLL;
                    sSql := sSql + '       ,VLRIOF  =        '+sValIOF;
                    sSql := sSql + '       ,NUMDOCUMENTO =   '''+sNumDocChave+'''';
                    sSql := sSql + '       ,VLRREFERENCIA =  '+sValRef;
                    sSql := sSql + '       ,PERCIRRF =       '+sPercIRRF;
                    sSql := sSql + '       ,FLGDARF  =  ''N''';
                    if (sContaContabil = '') then
                       sSql :=sSql + '     ,PLACONTA =  NULL '
                    else
                       sSql :=sSql + '     ,PLACONTA = '''+sContaContabil+'''';

                    if (iPlano <= 0) then
                       sSql :=sSql + '     ,PLANO = NULL  '
                    else
                       sSql :=sSql + '     ,PLANO =    '+IntToStr(iPlano);

                      if iIdPlanoPrev > 0 then
                         sSql := sSql + '    ,IDPLANOPREV =    '+quotedStr(IntToStr(iIdPlanoPrev));
                      if iIdPatro > 0 then
                         sSql := sSql + '    ,IDPATRO =        '+quotedStr(IntToStr(iIdPatro));
                       if iIdPrograma > 0 then begin
                          sSql := sSql + '    ,IDPROGRAMA =     '+IntToStr(iIdPrograma);
                       end else begin
                          sSql := sSql + '    ,IDPROGRAMA =  NULL ';
                       end;
                       if trim(sCodCentroCusto) <> '' then begin
                          sSql := sSql + '    ,CODCENTROCUSTO = '''+sCodCentroCusto+'''';
                       end else begin
                          sSql := sSql + '    ,CODCENTROCUSTO = NULL';
                       end;

                       sSql := sSql + '    ,IDEMPRESA =     '+IntToStr(IdPessoa);
                    sSql := sSql + '          ,FLGFOLHA =       '''+sFlgFolha+'''';
                    sSql := sSql + '          ,IDMODULO =       '+IntToStr(iIdModulo);
                    sSql := sSql + '          ,IDMODULORESPON =  '+IntToStr(iIdModuloRespon);
                    if iIdMotivo > 0 then
                       sSql := sSql + '       ,IDMOTIVO =       '+IntToStr(iIdMotivo)
                    else
                       sSql := sSql + '        ,IDMOTIVO = NULL';
                    if iIdVersaoFolha > 0 then
                       sSql := sSql + '        ,IDHSTFOLHABENEF  = '+IntToStr(iIdVersaoFolha)
                    else
                       sSql := sSql + '        ,IDHSTFOLHABENEF  = NULL ';

                    //CPrev - Pend. 27546 - Início
                    if iCodGPS > 0 then
                       sSql := sSql + '        ,CODIGOGPS  = '+IntToStr(iCodGPS)
                    else
                       sSql := sSql + '        ,CODIGOGPS  = NULL ';
                    //CPrev - Pend. 27546 - Fim

                    // Felipe A. Santos SOL 195438 KINTANA 1878097
                    if iQtdMeses > 0 then
                       sSql := sSql + '    ,QTDMESES  =       '+IntToStr(iQtdMeses)
                    else
                        sSql := sSql + '    ,QTDMESES  = NULL  ';
                    // Felipe A. Santos SOL 195438 KINTANA 1878097 - fim

                    sSql := sSql + ' WHERE (IDLANCIRRF = '+FloatToStr(iCodLanc)+')';
                    if not  ExecSQL(Ssql) then
                       Raise Exception.Create(messageinfo);
                 end;
              end else begin
                 iCodLanc := GetSequence('LANCIRRF');
                 with cdsAux1 do begin
                    sSql := 'INSERT INTO LANCIRRF(IDLANCIRRF,IDPESSOA, '+
                            'IDBENEFIRRF,CODNATUREZA,DATALANCAMENTO,VLRBASE,VLRIRRF, '+
                            'VLRIRRFNAOCOMP, FLGIRRFNAOCOMP, '+
                            'DATAPAGAMENTO, '+
                            'VLRINSS,VLRPIS,VLRISS,CODCENTRORESPON, CODTIPRECDES, '+
                            'VLRCOFINS,VLRCSLL,VLRCSCOFPIS,NUMDOCUMENTO, '+
                            'VLRREFERENCIA,PERCIRRF,VLRDEPIRRF,PLACONTA,PLANO, '+
                            'IDPLANOPREV,IDPATRO,IDPROGRAMA,CODCENTROCUSTO,IDEMPRESA, '+
                            'FLGFOLHA,IDMODULO,IDMODULORESPON,FLGDARF,IDMOTIVO, '+
                    'IDHSTFOLHABENEF, CODIGOGPS, FLGPENSAOALIM, IDPROCJUD, VLRIOF, ' +
                    'QTDMESES) VALUES('; // Felipe A. Santos SOL 195438 KINTANA 1878097
                    sSql := sSql+FloattoStr(iCodLanc)+','+FloatToStr(iEmpresaProp)+',';
                    sSql := sSql+FloatToStr(iBenef)+','''+sCodNatureza+''',';
                    sSql := sSql+'TO_DATE('''+sDataLanc+''',''dd/mm/yyyy''),';

                    If pbCompensa Then
                      sSql := sSql+sValBase+','+sValIRRF+', 0, 0, '+'TO_DATE('''+sDataPagto+''',''dd/mm/yyyy''),'+sValINSS+','+sValPIS+','+sValISS+','+''''+sCodCentroRespon+''','
                    Else
                      sSql := sSql+sValBase+', 0, '+sValIRRF+', 1,'+'TO_DATE('''+sDataPagto+''',''dd/mm/yyyy''),'+sValINSS+','+sValPIS+','+sValISS+','+''''+sCodCentroRespon+''',';

                    If (sCodtiprecdes = '') then
                       ssql := ssql + ' NULL, '
                    else
                        sSql := sSql+''''+sCodtiprecdes+''',';

                    ssql := ssql+sValCOFINS+','+sValCSLL+','+sValPISCOFCSLL+',';
                    sSql := sSql+''''+sNumDocChave+''','+sValRef+','+sPercIRRF+','+sValNumdepIR+',';

                    if (sContaContabil = '') then
                       sSql := sSql+' NULL, '
                    else
                        sSql := sSql+''''+sContaContabil+''',';
                    If (iPlano <= 0) then
                       sSql := sSql + ' NULL, '
                    else
                       sSql := sSql+ IntToStr(iPlano)+',';
                       if iIdPlanoPrev > 0 then
                          sSql := sSql+quotedStr(IntToStr(iIdPlanoPrev))+','
                       else
                          Ssql := Ssql+ 'NULL, ';

                       if iIdPatro > 0 then
                          Ssql := Ssql + quotedStr(IntToStr(iIdPatro))+','
                       else
                          Ssql := Ssql + 'NULL, ';

                       if iIdPrograma > 0 then begin
                          sSql := sSql+IntToStr(iIdPrograma)+',';
                       end else begin
                          sSql := sSql+' NULL,';
                       end;
                       if trim(sCodCentroCusto) <> '' then begin
                          sSql := sSql + ''''+sCodCentroCusto+''',';
                     end else begin
                          sSql := sSql + 'NULL, ';
                       end;
                       sSql := sSql +IntToStr(IdPessoa)+',';
                    sSql := sSql + ''''+sFlgFolha+''','+IntToStr(iIdModulo)+','+IntToStr(iIdModuloRespon)+',''N'''+',';
                    if iIdMotivo > 0 then
                       sSql := sSql + IntToStr(iIdMotivo)+','
                    else
                       sSql := sSql + 'NULL,';
                    if iIdVersaoFolha > 0 then
                       sSql := sSql + IntToStr(iIdVersaoFolha)+','
                    else
                       sSql := sSql + 'NULL,';

                    If iCodGPS > 0 Then
                      sSql := sSql + IntToStr(iCodGPS) + ', '
                    Else
                      sSql := sSql + ' NULL, ';


                    sSql := sSql + IntToStr(iFlgPensaoAlim) + ', ';

                    if piIdProcJud = 0 then
                      sSql := sSql + 'NULL, '
                    else
                      sSql := sSql + IntToStr(piIdProcJud) + ', ';

                    if rValIOF = 0 then
                       sSql := sSql + 'NULL, ' // Alterado por Felipe A. Santos SOL 195438 KINTANA 1878097
                    else
                       sSql := sSql +  sValIOF+', '; // Alterado por Felipe A. Santos SOL 195438 KINTANA 1878097

                    // Felipe A. Santos SOL 195438 KINTANA 1878097
                    if iQtdMeses > 0 then
                       sSql := sSql + IntToStr(iQtdMeses) + ')'
                    else
                       sSql := sSql + 'NULL)';
                    // Felipe A. Santos SOL 195438 KINTANA 1878097 - fim

                    if not  ExecSQL(Ssql) then
                       Raise Exception.Create(messageinfo);
                 end;
              end;
           end;
           //Marcio Sanches Spinosa SOL 216223 KINTANA 2045657
           if not ((iIdModuloRespon = 3) and ((sCodNatureza  = '5952')
           or (sCodNatureza = '1708'))) then //Marcio Sanches Spinosa SOL 219250 KINTANA 2055037
           //Marcio Sanches Spinosa SOL 216223 KINTANA 2045657
           begin

               if iCodLanc > 0 then begin
                  if cdsInf.IsEmpty then begin
                     if rValBase <> 0 then begin

                        sSQL := 'SELECT NVL(IDINFORMERENDBRUT,0) AS IDINFORME FROM PARAMIRRF';
                        CdsAux2.data := GetDataPacket(Ssql);

                        if CdsAux2.FieldByName('IDINFORME').AsInteger = 0 then
                        begin
                           MessageInfo := 'Falta parametrizar a linha do Informe de Rendimento Bruto';
                           Raise Exception.Create(messageinfo);
                        end;

                        //
                        sSql := 'INSERT INTO LANCXINFORME(IDLANCIRRF,IDINFORME,'+                                           
                                ' VLRLANC, FLGTIPOREG ) VALUES(';
                        sSql := sSql+FloattoStr(iCodLanc)+','+IntToStr(CdsAux2.FieldByName('IDINFORME').AsInteger)+',';
                        If CdsInf.FindField('FLGTIPOREG') <> Nil Then
                        Begin
                          If CdsInf.FieldByName('FLGTIPOREG').AsString = '' Then
                            sSql := sSql + sValBase + ', ''N''' +')'
                          else
                            sSql := sSql + sValBase + ',' + QuotedStr(CdsInf.FieldByName('FLGTIPOREG').AsString) +')';
                        End
                        Else
                          sSql := sSql + sValBase + ', ''N''' +')';
                        if not ExecSQL(Ssql) then begin
                           sSql := 'UPDATE LANCXINFORME SET VLRLANC = VLRLANC + '+sValBase+' WHERE '+
                                   ' (IDLANCIRRF = '+FloattoStr(iCodLanc)+') AND '+
                                   ' (IDINFORME  = '+IntToStr(CdsAux2.FieldByName('IDINFORME').AsInteger)+')';
                           if not  ExecSQL(Ssql) then
                              Raise Exception.Create(messageinfo);
                        end;
                     end;
                     if rValIRRF <> 0 then begin
                        sSQL := 'SELECT NVL(IDINFORMEIRRETIDO,0) AS IDINFORME FROM PARAMIRRF';

                        CdsAux2.data := GetDataPacket(Ssql);

                        if CdsAux2.FieldByName('IDINFORME').AsInteger = 0 then
                        begin
                           MessageInfo := 'Falta parametrizar a linha do Informe de Imposto Retido';
                           Raise Exception.Create(messageinfo);
                        end;

                        //
                        sSql := 'INSERT INTO LANCXINFORME(IDLANCIRRF,IDINFORME,'+
                                'PERCLANC,VLRLANC,FLGTIPOREG) VALUES(';
                        sSql := sSql+FloattoStr(iCodLanc)+','+IntToStr(CdsAux2.FieldByName('IDINFORME').AsInteger)+',';
                        sSql := sSql+sPercIRRF+',';

                        If CdsInf.FindField('FLGTIPOREG') <> Nil Then
                        Begin
                          If cdsInf.FieldByName('FLGTIPOREG').AsString = '' Then
                            sSql := sSql + sValIRRF + ', ''N''' +')'
                          else
                            sSql := sSql + sValIRRF + ', '+ QuotedStr(cdsInf.FieldByName('FLGTIPOREG').AsString) +')';
                        End
                        Else
                          sSql := sSql + sValIRRF + ', ''N''' +')';


                        if not ExecSQL(Ssql) then begin
                           sSql :='UPDATE LANCXINFORME SET VLRLANC = VLRLANC + '+sValIRRF+' WHERE '+
                                  ' (IDLANCIRRF = '+FloattoStr(iCodLanc)+') AND '+
                                  ' (IDINFORME  = '+IntToStr(CdsAux2.FieldByName('IDINFORME').AsInteger)+')';
                           if not  ExecSQL(Ssql) then
                             Raise Exception.Create(messageinfo);
                        end;
                     end;
                     //
                     if rValINSS <> 0 then begin
                        Ssql := 'SELECT IDINFORME '+
                                '  FROM INFORME '+
                                ' WHERE CODDIRF = 4 ';
                        CdsAux2.data := GetDataPacket(Ssql);
                        //
                        sSql := 'INSERT INTO LANCXINFORME(IDLANCIRRF,IDINFORME,'+
                                'VLRLANC, FLGTIPOREG) VALUES(';
                        sSql := sSql+FloattoStr(iCodLanc)+','+IntToStr(CdsAux2.FieldByName('IDINFORME').AsInteger)+',';

                        If CdsInf.FieldByName('FLGTIPOREG') <> Nil Then
                        Begin
                          If cdsInf.FieldByName('FLGTIPOREG').AsString = '' Then
                            sSql := sSql + sValINSS + ', ''N''' +')'
                          else
                            sSql := sSql + sValINSS + ', '+ QuotedStr(cdsInf.FieldByName('FLGTIPOREG').AsString) +')';
                        End
                        Else
                          sSql := sSql + sValINSS + ', ''N''' +')';

                        if not ExecSQL(Ssql) then begin
                           sSql :='UPDATE LANCXINFORME SET VLRLANC = VLRLANC + '+sValINSS+' WHERE '+
                                  ' (IDLANCIRRF = '+FloattoStr(iCodLanc)+') AND '+
                                  ' (IDINFORME  = '+IntToStr(CdsAux2.FieldByName('IDINFORME').AsInteger)+')';
                           if not  ExecSQL(Ssql) then
                             Raise Exception.Create(messageinfo);
                        end;
                     end;
                  end else begin
                     cdsInf.First;
                     While not cdsInf.EOF do begin
                        //Wylliam Leite da Silva - SOL:246488 PPM:1026389
                        iIDINFORME := cdsInf.FieldByName('IDINFORME').AsInteger;
                        if (iIDINFORME = 0) then
                           cdsInf.Next;

                        Ssql := 'SELECT FLGNATUREZA,CODDIRF '+
                                '  FROM INFORME '+
                                ' WHERE IDINFORME = '+IntToStr(cdsInf.FieldByName('IDINFORME').AsInteger);
                        cdsAux2.data := GetDataPacket(Ssql);

                        if not Estorno then
                        if cdsAux2.FieldByName('FLGNATUREZA').isNull then begin
                           if cdsAux2.FieldByName('CODDIRF').AsInteger in [1,2,5,9,10,11,12,15] then
                              rFator := 1
                           else
                              rFator := -1;
                        end else begin
                           if (cdsAux2.FieldByName('FLGNATUREZA').AsString = 'P') or
                              (cdsAux2.FieldByName('CODDIRF').AsString     = '8') then //CPREV - Pend. 27052
                              rFator := 1
                           else
                              rFator := -1;
                        end;
                        //sValInf     := OraNumero(cdsInf.FieldByName('VLRLANC').AsFloat);       // Andre Imakawa - SIG 62774
                        sValInf     := OraNumeroString(formatfloat('#0.00',cdsInf.FieldByName('VLRLANC').AsFloat));  // Andre Imakawa - SIG 62774

                        sFontePagadora := '1';

                        if not cdsInf.FieldByName('FONTEPAGADORA').IsNull then
                           sFontePagadora := cdsInf.FieldByName('FONTEPAGADORA').AsString;

                        if not Estorno then
                          //sValInfSinal:= OraNumero(cdsInf.FieldByName('VLRLANCSINAL').AsFloat * rFator)                             // Andre Imakawa - SIG 62774
                          sValInfSinal:= OraNumeroString(formatfloat('#0.00',(cdsInf.FieldByName('VLRLANCSINAL').AsFloat* rFator)))   // Andre Imakawa - SIG 62774
                        else
                          //sValInfSinal:= OraNumero(cdsInf.FieldByName('VLRLANC').AsFloat);       // Andre Imakawa - SIG 62774
                          sValInfSinal:= OraNumeroString(formatfloat('#0.00',cdsInf.FieldByName('VLRLANC').AsFloat));  // Andre Imakawa - SIG 62774

                        sSql := 'INSERT INTO LANCXINFORME(IDLANCIRRF,IDINFORME,'+
                                'VLRLANC, FONTEPAGADORA, FLGTIPOREG) VALUES(';
                        sSql := sSql+FloattoStr(iCodLanc)+','+IntToStr(cdsInf.FieldByName('IDINFORME').AsInteger)+',';

                        If CdsInf.FindField('FLGTIPOREG') <> Nil Then
                        Begin
                          If cdsInf.FieldByName('FLGTIPOREG').AsString = '' Then
                            sSql := sSql + sValInfSinal +', '+ sFontePagadora  +', ''N''' +')'
                          else
                            sSql := sSql + sValInfSinal +', '+ sFontePagadora+',' + QuotedStr(cdsInf.FieldByName('FLGTIPOREG').AsString) +')';
                        End
                        Else
                          sSql := sSql + sValInfSinal +', '+ sFontePagadora + ', ''N''' +')';

                        if not ExecSql(Ssql) then begin
                          //Wylliam Leite da Silva - SOL:246488 PPM:1026389 - Inicio
                          iPosicao:= cdsInf.RecNo;
                          cdsInf.Filtered := False;
                          cdsInf.Filter := 'IDINFORME = 61';
                          cdsInf.Filtered := True;
                          if not (cdsInf.RecordCount > 1) then
                          begin
                             sSql := 'UPDATE LANCXINFORME SET VLRLANC = VLRLANC + '+sValInfSinal+' WHERE '+
                                     ' (IDLANCIRRF = '+FloattoStr(iCodLanc)+') AND '+
                                     ' (IDINFORME  = '+IntToStr(cdsInf.FieldByName('IDINFORME').AsInteger)+') AND ' +
                                     ' (FONTEPAGADORA  = '+sFontePagadora+')';
                             if not  ExecSQL(Ssql) then
                               Raise Exception.Create(messageinfo);
                          end;
                          cdsInf.Filtered := False;
                          cdsInf.RecNo:= iPosicao;
                          //Wylliam Leite da Silva - SOL:246488 PPM:1026389 - Fim
                        end;
                        cdsInf.Next;
                     end;
                  end;
               end;
           end;
           //
        except
          On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            End;
        end;
        dtmBaseDados.dbBaseDados.Commit;
//        commit;
     end;
end;

procedure TCtrLancIRRF.SetIcodLanc(const Value: Double);
begin
  FIcodLanc := Value;
end;

procedure TCtrLancIRRF.SetpbPrimVez(const Value: Boolean);
begin
  FpbPrimVez := Value;
end;


function TCtrLancIRRF.VerificaPlanoPatro(const iPlano, iPatro: Int64): Boolean;
begin
   Result := CtrlPlanPrevContabPatro.ValidaPlanoPatro(iPatro,iPlano);
end;



function TCtrLancIRRF.BuscaAliquota(fBase: Extended; DataLanc: String): Extended;
var
   sSQL   : String;
   bAchou : Boolean;
begin
   Result := 0;
   sSQL := 'SELECT '                                                                     + #13 +
           '    FAIXA_IRRF, '                                                            + #13 +
           '    ALIQUOTA_IRRF '                                                          + #13 +
           'FROM '                                                                       + #13 +
           '    IRRF '                                                                   + #13 +
           'WHERE '                                                                      + #13 +
           '    DATAINIVIGENCIA = (SELECT '                                              + #13 +
           '                           MAX(DATAINIVIGENCIA) '                            + #13 +
           '                       FROM '                                                + #13 +
           '                           IRRF '                                            + #13 +
           '                       WHERE '                                               + #13 +
           '                           DATAINIVIGENCIA <= TO_DATE('''+DataLanc+''',''dd/mm/yyyy'') ) ' + #13 +
           'ORDER BY ALIQUOTA_IRRF '                                                     + #13;

   cdsAux1.Data := GetDataPacket(sSQL);
   bAchou       := False;
   while not cdsAux1.Eof do
   begin
      if not bAchou then
      begin
         if cdsAux1.FieldByName('FAIXA_IRRF').AsFloat > fBase then
         begin
            Result := cdsAux1.FieldByName('ALIQUOTA_IRRF').AsFloat;
            bAchou := True;
         end;
      end;
      cdsAux1.Next;
   end;
end;


function TCtrLancIRRF.UpdateLanctoInforme(const pIDLancIRRF,
                                                pIDInforme: Integer;
                                          const pValor : Double): Boolean;
var sSql : String;
    sValor : String;
begin
  Result := True;
  sValor := FloatToStr(pValor);
  sValor := StringReplace(sValor,',','.',[rfReplaceAll]);

  Try
    If Not InTransaction then
      StartTransaction;

    sSql := 'UPDATE LANCXINFORME' + #13 +
            'SET VLRLANC = '+ sValor + #13 +
            'WHERE (IDLANCIRRF = '+ InttoStr(pIdLancIRRF)+')'+#13+
            '  AND (IDINFORME  = '+ IntToStr(pIDInforme)+')';

    ExecSql(sSql);
    Commit;
  except
    Result := False;
    RollBack;
  end;


end;

function TCtrLancIRRF.Deletar(const iIdLancIRRF : LongInt;
                              const iIdBeneficiario: Integer;
                              const dDataPagamento: tDateTime;
                              const bPrincipal: Boolean;
                              const pStrCodNatureza : string): Boolean;
Var Ssql: string;
begin
  Try
    StartTransaction;
    Result := True;
    sSql := 'DELETE FROM LANCXINFORME'+#13+
            'WHERE IDLANCIRRF IN ( SELECT DISTINCT LI.IDLANCIRRF'+#13+
            '                      FROM LANCXINFORME LI, INFORME I, LANCIRRF LIR'+#13+
            '                      WHERE lir.idbenefirrf = '+IntToStr(iIdBeneficiario)+#13+
            '                        and lir.idlancirrf  = li.idlancirrf'+#13+
            '                        and lir.datapagamento = TO_DATE('+QuotedStr(DateToStr(dDataPagamento))+',''DD/MM/YYYY'')'+#13+
            '                        AND (LI.IDINFORME = I.IDINFORME) ';

    if (pStrCodNatureza <> EmptyStr) then
        Ssql := Ssql + ' AND LIR.CODNATUREZA = ' + pStrCodNatureza ;

    Ssql := Ssql + '            )';


    if not ExecSQL(Ssql) then
       Raise Exception.Create(messageinfo);

    if bprincipal then
      Begin
        Ssql := 'DELETE FROM LANCIRRF '+
                ' WHERE IDLANCIRRF = '+IntToStr(iIdLancIRRF);
        if not ExecSQL(Ssql) then
          Raise Exception.Create(messageinfo);
      end;
    Commit;
  except
    On E:Exception Do
      Begin
        Rollback;
        Result := False;
        MessageInfo := E.Message;
      End;
  end;
end;
//Marcio Sanches Spinosa SOL 215621 KINTANA 2044679 - Inicio
function TCtrLancIRRF.DeletaLancamentos(IdLancIRRF: Integer): Boolean;
Var
  Ssql: string;
begin
  Try

    StartTransaction;
    Result := True;

    Ssql := 'DELETE From LANCXINFORME '+
            ' WHERE IDLANCIRRF = '+ intTostr(IdLancIRRF);

    if not ExecSQL(Ssql) then
       Raise Exception.Create(messageinfo);

    commit;

  except
    On E:Exception Do
      Begin
        Rollback;
        Result := False;
        MessageInfo := E.Message;
      End;
  end;
end;
//Marcio Sanches Spinosa SOL 215621 KINTANA 2044679 - Fim

// Andre Imakawa - SIG 62774 - Inicio
function TCtrLancIRRF.OraNumeroString(sNumero : string):string;
var i : integer;
    sResult,
    sOra : string;
    bPrimPonto : boolean;
begin
   sOra := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1
   do begin
     if sNumero[i] = ','
     then begin
        if not bPrimPonto
        then begin
           sOra := sOra + '.';
           bPrimPonto := True;
        end
        else sOra := sOra;
     end
     else begin
        if sNumero[i] <> '.'
        then sOra := sOra + sNumero[i]
        else begin
           if not bPrimPonto
           then begin
              sOra := sOra+'.';
              bPrimPonto := True;
           end
           else sOra := sOra;
        end;
     end;
   end;
   sResult := '';
   for i := length(sOra) downto 1
   do begin
      sResult := sResult + sOra[i];
   end;
   if trim(sResult) = '' then
     sResult:='0';
   Result := sResult;
end;
// Andre Imakawa - SIG 62774 - Fim
end.

