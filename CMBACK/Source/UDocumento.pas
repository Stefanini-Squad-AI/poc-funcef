{  Alterações:                                                                 }
{ --------------------------------------------------------------------------------------------------
Rotina......:
Autor.......: Edilaine Ferraresi
Data........: 04/08/2012
Nº SOL......: 188755
Nº KINTANA..: 1784317
Descrição...: depois de agrupar lançamentos, se não fechar o adminimob não imprime
              as linhas de msg no boleto, no contas a receber
--------------------------------------------------------------------------------
Rotina......: Excluir
Nº SOL......: 153925
Nº KINTANA..: 1167543
Data........: 02/03/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação para exclui a CCBAIXASXDOCUM na exclusão do documento.
---------------------------------------------------------------------------------------------------}
//------------------------------------------------------------------------------
// Rotinas   : GeraRAD
// Data      : 16/12/2004
// Autor     : Andre Tavares
// Pendência : 17664
// Descrição : Só permite gerar o processo Rad se o tipo de documento permitir.
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Rotinas   : GeraRAD, CancelaRAD
// Data      : 05/07/2004 (Término)
// Autor     : David Ayrolla
// Pendência : 14646
// Descrição : Criação de processo RAD no lançamento de documentos e
//             cancelamento de processo RAD.
//------------------------------------------------------------------------------

unit UDocumento;

interface

uses Classes, USistema, CMwwQuery,SysUtils, Forms, UAutorizacao, UMensErro, Messages,
     UDatabase, Dialogs, db, uIntegraBack, wwQuery, uRad;

Type TRateioUnid = Record
     rValor: Double;
     rValorom: Double;
     CodUnid: LongInt;
     CodCentroCusto: String;
     IdPrograma: LongInt;
     IdPlanoPrev: LongInt;
     IdPatrocinadora: LongInt;
End;

(******************************************************************************)

Type TSaldo = Class
     Public
      procedure GetSaldoDoc(icoddoc:integer;sDataLanc:string;sRecPag:string;
                                var rSaldo,rSaldoOutraMoeda:real); {Ok!}

      function GetSaldoLote(inumlote:integer): Double; {Ok!}

      Function GetValorLote(iNumLote:Integer;bFormataResult:Boolean):String; {Ok!}
End;

(******************************************************************************)

Type TRateio = Class
     Public
      function Inserir(iCodDocumento: LongInt; CodTipRecDes, RecPag,CodCentroRespon: String;
      IdPessoa: LongInt; Valor,ValorOutraMoeda: Real; IdUsuarioInclusao,
      UnidNegoc, IdReservaOrcamen: LongInt; sCodCentroCusto: String;
      IdPatro, IdPrograma, IdPlanoPrev :Real):Double; {Ok!}

      procedure Alterar(iCodDocumento: LongInt; CodTipRecDes,RecPag, CodCentroRespon: String;
      IdPessoa, CodUnidNegoc: LongInt; Valor,ValorOutraMoeda: Real; sCodCentroCusto: String;
      IdRateioDocum, IdUsuarioInclusao, IdReservaOrcamen :LongInt; UnidNegoc :Real;
      IdPatro, IdPrograma, IdPlanoPrev :Real); {Ok!}

      procedure Excluir(iCodDocumento: LongInt;CodTipRecDes, RecPag: String; IdRateioDocum :LongInt); {Ok!}
End;

(******************************************************************************)

Type TIntBanco = Class
     private
      FDeletaMensagens :Boolean; {Ok!}
      FCodigosGrupo    :TStrings; {Ok!}

     Public
      Constructor Create;
      Destructor  Destroy;  Override;

      Function AgrupaDocCnab(Qry:TwwQuery; bInTransaction, bAbreQry, bFechaQry,
      bAlteraEmisBloq: Boolean; sCamposParaGrupo: Array of String):Boolean; {Ok!}

      Function GetCodGrupoCnab(iCodDocumento:LongInt):LongInt; {Ok!}

      Function SetaMensagensCNAB(iCodDocumento,ICodGrupo:Integer;
      sMensagens: Array of String):Boolean; {Ok!}

      Property DeletaMensagens :Boolean  read FDeletaMensagens write FDeletaMensagens; {Ok!}
      Property CodigosGrupo    :TStrings read FCodigosGrupo; {Ok!}
End;

(******************************************************************************)

Type TRecbToPagto = Class
     Private
      fCodlancnaoident :LongInt; {Ok!}
      fNumBaixa        :LongInt; {Ok!}
     Public
      Constructor Create;

      Property Codlancnaoident :LongInt read fCodlancnaoident write fCodlancnaoident; {Ok!}
      Property NumBaixa        :LongInt read fNumBaixa        write fNumBaixa; {Ok!}

      procedure Inserir(qry: TwwQuery;
            iCodDocumento,iNumLancto,idUsuarioInclusao,iCodLancFinanc,CodPortForma: LongInt;
            iNumLote:LongInt;
            NumChqBordero,DataFloat,DataBaixa: String); {Ok!}

      Procedure Excluir(qry:TwwQuery;iCodDocumento,iNumLancto:integer); {Ok!}
End;

(******************************************************************************)

Type TContabilizacao = Class
     Public
      Function gera_lanca_contab(shistorico1,sdocumento,sabc,datalanc,
                                       Sccustod,sccustoc,Scontadeb,Scontacred,Sconversao:string;
                                       rvalorlanc:real;iCodSubContaD,iCodSubContaC:LongInt;var liplanilha:longint): Boolean;

      Procedure gera_lanca_contadeb(Shistorico1,sdocumento,sabc,datalanc,Sccusto,
                                   Scontadeb,sconversao:string;rvalorlanc:real;
                                   iempresa,iperiodo,iexercicio : integer;
                                   iCodSubContaD:LongInt;
                                   var liplanilha:LongInt);

      Procedure gera_lanca_contacred(Shistorico1,sdocumento,sabc,datalanc,Sccusto,
                                      Scontacred,sconversao:string;rvalorlanc:real;
                                      iempresa,iperiodo,iexercicio : integer;
                                      iCodSubContaC:LongInt;
                                      var liplanilha:LongInt);

      Function gera_periodo(datalanc:string;var iperiodo : integer; var iexercicio : integer;iempresa:integer):Integer;

End;

(******************************************************************************)

Type TForCli = Class
     Private
      Procedure CriaFornecedor(ipessoa,iempresacc,icodsubconta,iplano,iramotipocli,autorizacaoidempresa : integer;
                                   sccusto,scontacadianto,scontacforn,scontacdespesa: string); {ok!}

      procedure criafornserv(ipessoa: integer);

      procedure criaempforn(ipessoa,autorizacaoidempresa,iempresacc,iplano,icodsubconta: integer;
                                 sccusto,scontacadianto,scontacdespesa,scontacforn: string); {ok!}

      procedure criaramotipocli(ipessoa,iramotipocli: integer); {ok!}

      Procedure CriaCliente(ipessoa,iempresacc,icodsubconta,iplano,iramotipocli,autorizacaoidempresa : integer;
                                     sccusto,scontacadianto,scontacforn,scontacdespesa: string); {ok!}

      procedure criaclientepess(ipessoa,iramotipocli: integer); {ok!}

      procedure criaempcli(ipessoa,autorizacaoidempresa,iempresacc,iplano,icodsubconta: integer;
                                sccusto,scontacadianto,scontacdespesa,scontacforn: string);  {ok!}

     Public
      Function CriaPessoa(sNome, sRazaoSocial, sDocumento: String): longint; {ok!}
      function Inserir(ipessoa,iempresacc,icodsubconta,iplano,iramotipocli,autorizacaoidempresa : integer;
                     sccusto,scontacadianto,scontacforn,scontacdespesa,sforncli : string; {ok!}
                     bExibeMensagem: Boolean):Boolean; {ok!}
End;

(******************************************************************************)

Type TDocumento = Class

   private
      FNumRateio                    :LongInt;
      FCodDocumento                 :LongInt;
      FNumLancto                    :LongInt;
      FNumLote                      :LongInt;
      FCodLancFinanc                :LongInt;
      FMoeCodigo                    :LongInt;
      FNumFatura                    :LongInt;
      fNumAp                        :LongInt;
      FSubContaBaixa                :LongInt;
      FCodTipDoc                    :LongInt;
      FCriado                       :Boolean;
      FDiasFloat                    :Integer;
      FContabaixa                   :String;
      fNumFatLanc                   :String;
      FOperacao                     :String;
      fTipoFaturaLancto             :String;
      FRateioUnid                   :Array [0..99] of TRateioUnid;
      FSaldo                        :TSaldo;
      FRateio                       :TRateio;
      FIntBanco                     :TIntBanco;
      FRecbToPagto                  :TRecbToPagto;
      FContabilizacao               :TContabilizacao;
      FForCli                       :TForCli;
      FValorliquido                 :Double;
      fReferencia                   :String;
      fObs                          :String;
      fMostraMsgContab              :Boolean;
      fMsgContab                    :String;
      fIdContaBancaria              :LongInt;
      fUnidNegocioLancto            :LongInt;
      fNumLoteManual                :LongInt;
      FProcessoAutLote              :LongInt;
    FDataDisponibilidade: TDateTime;

      Procedure LancaRateioContab(qry: TwwQuery;
        iCodDocumento,CodAlterador: LongInt;    Var PlnCodigo: LongInt;
        DataLancto: String; Valor,ValorOutraMoeda : Real;
        DebCre,sOperacao,HistoricoCompl: String;
        iCodPortForma: LongInt; sNumChqBord: String);

      Procedure BuscaRateio(Qry: TwwQuery; iCodDocumento: LongInt;
      ValorLanc,ValorLancom: Double; CodAlterador :LongInt; Var bLancaRateioAlterador :Boolean);

    procedure SetProcessoAutLote(const Value: LongInt);
    procedure SetDataDisponibilidade(const Value: TDateTime);
   public
      Property CodDocumento      :LongInt         read FCodDocumento      Write FCodDocumento;
      Property NumLancto         :LongInt         read FNumLancto         Write FNumLancto;
      Property NumLote           :LongInt         read FNumLote           Write FNumLote;
      Property CodLancFinanc     :LongInt         read FCodLancFinanc     Write FCodLancFinanc;
      Property MoeCodigo         :LongInt         read FMoeCodigo         Write FMoeCodigo;
      Property NumFatura         :LongInt         read FNumFatura         Write FNumFatura;
      Property Criado            :Boolean         read FCriado            Write FCriado;
      Property Saldo             :TSaldo          read FSaldo             Write FSaldo;
      Property Rateio            :TRateio         read FRateio            Write FRateio;
      Property IntBanco          :TIntBanco       read FIntBanco          Write FIntBanco;
      Property RecbToPagto       :TRecbToPagto    read FRecbToPagto       Write FRecbToPagto;
      Property Contabilizacao    :TContabilizacao read FContabilizacao    Write FContabilizacao;
      Property ForCli            :TForCli         read FForCli            Write FForCli;
      Property DiasFloat         :Integer         read FDiasFloat         Write FDiasFloat;
      Property Operacao          :String          read FOperacao          Write FOperacao;
      Property Contabaixa        :String          read fContabaixa        Write fContabaixa;
      Property SubContaBaixa     :LongInt         read fSubContaBaixa     Write fSubContaBaixa;
      Property CodTipDoc         :LongInt         read FCodTipDoc         Write FCodTipDoc;
      Property NumFaturaLancto   :String          read fNumFatLanc        Write fNumFatLanc;
      Property TipoFaturaLancto  :String          read fTipoFaturaLancto  Write fTipoFaturaLancto;
      Property Valorliquido      :Double          read fValorliquido      Write fValorliquido;
      Property Referencia        :String          read fReferencia        Write fReferencia;
      Property Obs               :String          read fObs               Write fObs;
      Property NumApg            :LongInt         read fNumAp             Write fNumAp;
      Property MostraMsgContab   :Boolean         read fMostraMsgContab   Write fMostraMsgContab;
      Property MsgContab         :String          read fMsgContab         Write fMsgContab;
      Property IdContaBancaria   :LongInt         read fIdContaBancaria   Write fIdContaBancaria;
      Property UnidNegocioLancto :LongInt         read fUnidNegocioLancto Write fUnidNegocioLancto;
      Property NumLoteManual     :LongInt         read fNumLoteManual     Write fNumLoteManual;
      Property ProcessoAutLote   :LongInt         read FProcessoAutLote   Write SetProcessoAutLote;
      property DataDisponibilidade: TDateTime read FDataDisponibilidade write SetDataDisponibilidade;

      function GetNumLoteManual  : LongInt;

      //------------------------------------------------------------------------
      //Documento
      Constructor Create;
      Destructor Destroy; Override;

      procedure Inserir(qry: TwwQuery; iCodDocumento: LongInt;
      Smodulo,Splano, Splaconta, Sccusto: String;
      iMoeCodigo,UnidNegoc,IdPessoa,IdForCli,CodTipDoc,CodPortForma: LongInt;
      RecPag : String; NoDocumento: Real; ComplDocumento : String;
      DataEmissao,DataVencto,DataProgramada,Status: String; NumFatura: Integer;
      sOperacao: String; IdUsuarioInclusao,iCodSubConta, iCodForma : LongInt;
      sNumLeitCodBarras, sNumDigCodBarras: String; bEmisBloq: Boolean;
      rVALORJUROS, rVLRMULTA: Real; iINDICECORRECAO: Integer; bDocConciliado :Boolean = False); {Ok!}


      //Gera um processo RAD para o documento passado como parâmetro
      function GeraRAD( iCodDocumento: LongInt ) : boolean;
      //Cancela o processo RAD do documento passado como parâmetro
      function CancelaRAD( iCodDocumento: LongInt ) : boolean;

      procedure Alterar(qry: TwwQuery; iCodDocumento: LongInt;
      iMoeCodigo,IdPessoa,IdForCli,CodTipDoc,CodPortForma: LongInt;
      DataEmissao,DataVencto,DataProgramada,Status: String; NumFatura: Integer;
      NumSlip,EmisBloq : String; iCodForma : LongInt;
      sNumLeitCodBarras, sNumDigCodBarras, RecPag: String;
      rVALORJUROS, rVLRMULTA: Real; iIndiceCorrecao, iPLANO, iCODSUBCONTA: Integer;
      sPLACONTA, sCODCENTROCUSTO, sOperacao: String; bDocConciliado :Boolean = False); {Ok!}

      procedure Excluir(qry : TwwQuery; iCodDocumento,iNumLancto: LongInt; Const bExcluiContabLancDoc: Boolean = True); {Ok!}

      function GetCodigo(qry: TwwQuery) : LongInt; {Ok!}

      function ValidaNumDoc(qry: TwwQuery; recPag : String;
          idForCli: LongInt; NoDocumento: Real; ComplDocumento: String; var iCodDocumento,CodSubConta:LongInt;
          var Plano:Integer;var Placonta,CodCentroCusto:String): Boolean; {Ok!}

      Function BuscaDebCre(iCodTipDoc: Longint):String; {Ok!}

      function Procurar(qry: TwwQuery; IdForCli: LongInt;
      NoDocumento: Real; ComplDocumento : String): LongInt; {Descontinuado!}

      Function ValidaNumApGr(iNumApGr :LongInt): Boolean; {Ok!}

      function GetNumLote(iCodDocumento:integer;Var iCodPOrtForma,iNumLote: LongInt):Boolean; {Ok!}

      function GetNumFatura(qry: TwwQuery) : LongInt; {Ok!}

      Function AutorizaDataVencimento(DataVencto: TDateTime; sRecPag: String): Boolean; {Ok!}

      procedure EmiteLancaBaixa(iCodDoc: LongInt; bMarcaComoEmitido: boolean); {Ok!}

      function AjustaDataFloat(dData: TDateTime; iFloat: Integer) :TDateTime; {Ok!}

      Function BuscaContaContabil(IdPrograma :LongInt; TipRecDes, CentroCusto :String):String; {Ok!}

      //------------------------------------------------------------------------
      //LanctoDocum
      function GerarNumLancto(qry: TwwQuery; iCodDocumento: LongInt): Longint; {Ok!}

      procedure CriarLanctoDoc(qry: TwwQuery; iCodDocumento,iNumLancto,
      CodAlterador: LongInt; Var PlnCodigo: LongInt; DataLancto: String;
      Valor,ValorOutraMoeda : Double; Estorno: LongInt; DebCre,sOperacao,
      HistoricoCompl: String; idUsuarioInclusao: LongInt; bContabiliza: Boolean;
      iCodPortForma: LongInt; sNumChqBord: String); {Ok!}

      procedure AlterarLanctoDoc(qry: TwwQuery; iCodDocumento,iNumLancto,
      CodAlterador: LongInt; Var PlnCodigo: Integer; DataLancto: String;
      Valor,ValorOutraMoeda : Real;  Estorno: LongInt; DebCre,
      HistoricoCompl, sOperacao: String;bContabiliza: Boolean;
      iCodPortForma: LongInt; sNumChqBord: String); {Ok!}

      Procedure Informa_Planilha(qry:TwwQuery;iplanilha:longint;icodigo,inumlancto:integer); {Ok!}

      Procedure baixa_lote(qry: TwwQuery;icodocumento:integer); {Ok!}

      Procedure baixa_lotepagto(qry: TwwQuery;Snumlote:string); {Ok!}

      Procedure LiberaEmissaoLote(qry: TwwQuery;iNumLote:integer;bExcluiLote:Boolean); {Ok!}

      Function baixa_documento(qry: TwwQuery;icodocumento:integer):Boolean; {Ok!}

      Procedure baixa_adiantamento(qry: TwwQuery;icodocumento, iPlnCodigo:integer; sDataLancto :String); {Ok!}

      Procedure Cancelabaixa_adiantamento(qry: TwwQuery;icodocumento,iNumLancto:integer); {Ok!}

      Procedure AlteraStatusOrcamento(iCodDocumento:LongInt; sStatus:Char); {Ok!}

      Procedure GravaValorCompromisso(idRateioDocum:LongInt;rValor:Double); {Ok!}

      Procedure RegularizaAdto(iCodDocDoc,iCodDocAdto:LongInt;sDataRegu,sDocumDoc,sDocumAdto,sNomeCliFor:String;rValor:Real); {Ok!}      

      Procedure EstornoCAPCAR(sDataEstorno:String;var iCodAnterior,iNumLanc,iCodDocumento:integer); {Ok!}

      Function EstornaExcluiContab(iPlanilha: LongInt; sDataLancto: String; Var bIndicaEstorno: Boolean; bExcluiPlanilha:Boolean):Boolean; {Ok!}
end;

var
  Documento  :TDocumento;

implementation

uses DBaseDados, UlancContab, ULancFinanc, uFuncaoGeral, uJurosCorrecao,
     uImpostoRetido, dCmBackDocumento, uString, JclMath, uOrcamento, uCMFileUtils;

Constructor TDocumento.Create;
Begin
   Inherited Create;
   FCodDocumento       := -1;
   FNumLancto          := -1;
   FNumLote            := -1;
   FCodLancFinanc      := -1;
   FMoeCodigo          := -1;
   FNumFatura          := -1;
   FDiasFloat          := 0;
   fSubContaBaixa      := 0;
   FCodTipDoc          := -1;
   fNumFatLanc         := '';
   fTipoFaturaLancto   := '';
   FContabaixa         := '';
   FOperacao           := '';
   fReferencia         := '';
   fObs                := '';
   fNumAp              := 0;
   fIdContaBancaria    := 0;
   fMostraMsgContab    := True;
   fProcessoAutLote    := 0;
   fMsgContab          := '';
   fUnidNegocioLancto  := 0;
   fNumLoteManual      := 0;
   FCriado             := False;
   FRecbToPagto        := TRecbToPagto.Create;
   FIntBanco           := TIntBanco.Create;
   FDataDisponibilidade := 0;
End;

Destructor TDocumento.Destroy;
Begin
   Try
     FIntBanco.Free;
     FRecbToPagto.Free;
   finally
     Inherited Destroy;
   End;
End;

(******************************************************************************)
function TDocumento.ValidaNumDoc(qry: TwwQuery; recPag : String;
                idForCli: LongInt; NoDocumento: Real; ComplDocumento: String; var iCodDocumento,CodSubConta:LongInt;
                var Plano:Integer;var Placonta,CodCentroCusto:String): Boolean;
Var
   sSql: String;
begin
   {** Verificado! **}
   with TwwQuery.Create(nil) do
   Try
      DataBaseName := 'BaseDados';
      Close;
      if Trim(ComplDocumento) = ''
      then sSql := 'SELECT CODDOCUMENTO,PLANO,PLACONTA,CODCENTROCUSTO,CODSUBCONTA FROM DOCUMENTO '+
              ' WHERE RECPAG = '''+ recPag +''''+
              ' AND IDPESSOA = '+ IntToStr(Sistema.idEmpresa)+
              ' AND IDFORCLI = '+ IntToStr(idForCli)+
              ' AND NODOCUMENTO = '+ FuncaoGeral.RemoveChar('.',FloatToStrF(NoDocumento,ffnumber,20,0)) +
              ' AND ((COMPLDOCUMENTO IS NULL) OR (COMPLDOCUMENTO = '''+ComplDocumento+'''))'
      else sSql := 'SELECT CODDOCUMENTO,PLANO,PLACONTA,CODCENTROCUSTO,CODSUBCONTA FROM DOCUMENTO '+
              ' WHERE RECPAG = '''+ recpag +''''+
              ' AND IDPESSOA = '+ IntToStr(Sistema.idEmpresa)+
              ' AND IDFORCLI = '+ IntToStr(idForCli)+
              ' AND NODOCUMENTO = '+ FuncaoGeral.RemoveChar('.',FloatToStrF(NoDocumento,ffnumber,20,0))+
              ' AND COMPLDOCUMENTO = '''+ComplDocumento+'''';
      Sql.Text := sSql;
      Open;
      Result := Not isEmpty; //Duplicado

      if Result Then
      Begin
         iCodDocumento  := FieldByname('CodDocumento').AsInteger;
         Plano          := FieldByname('PLANO').AsInteger;
         Placonta       := FieldByname('PLACONTA').AsString;
         CodCentroCusto := FieldByname('CODCENTROCUSTO').AsString;
         CodSubConta    := FieldByname('CODSUBCONTA').AsInteger;
      end;
      Close;
   finally
      Free;
   End;
   
end;
(******************************************************************************)

function TDocumento.GetCodigo(qry: TwwQuery) : LongInt;
begin
   {** Verificado! **}
   Result := leultregistro(nil,'DOCUMENTO');
   FCodDOcumento := Result;
end;

function TDocumento.GetNumLoteManual : LongInt;
begin
   {** Verificado! **}
   Result := leultregistro(nil,'LOTEMANUAL');
   FCodDOcumento := Result;
end;


procedure TDocumento.Inserir(qry: TwwQuery; iCodDocumento: LongInt;
      Smodulo,Splano, Splaconta, Sccusto: String;
      iMoeCodigo,UnidNegoc,IdPessoa,IdForCli,CodTipDoc,CodPortForma: LongInt;
      RecPag : String; NoDocumento: Real; ComplDocumento : String;
      DataEmissao,DataVencto,DataProgramada,Status: String; NumFatura: Integer;
      sOperacao: String; IdUsuarioInclusao,iCodSubConta, iCodForma : LongInt;
      sNumLeitCodBarras, sNumDigCodBarras: String; bEmisBloq: Boolean;
      rVALORJUROS, rVLRMULTA: Real; iINDICECORRECAO: Integer; bDocConciliado :Boolean = False);
begin
   {** Verificado! **}
   FCriado := False;

   If Not AutorizaDataVencimento(StrToDate(DataVencto),RecPag) Then Abort;

   Try
      With DtmCmBackDocumento.QryInsereDoc Do
      Begin
         If Not Prepared Then Prepare;

         ParamByName('CODDOCUMENTO').AsFloat := iCodDocumento;
         ParamByName('IDPESSOA').AsFloat := IdPessoa;
         ParamByName('IDFORCLI').AsFloat := IdForCli;
         ParamByName('CODTIPDOC').AsFloat := CodTipDoc;
         ParamByName('RECPAG').AsString := RecPag;
         ParamByName('NODOCUMENTO').AsFloat := NoDocumento;
         ParamByName('COMPLDOCUMENTO').AsString := ComplDocumento;
         ParamByName('DATAEMISSAO').AsDateTime := StrToDate(DataEmissao);
         ParamByName('DATAVENCTO').AsDateTime := StrToDate(DataVencto);
         ParamByName('DATAPROGRAMADA').AsDateTime := StrToDate(DataProgramada);
         ParamByName('OPERACAO').AsString := Trim(sOperacao);
         ParamByName('IDUSUARIOINCLUSAO').AsFloat := idUsuarioInclusao;
         ParamByName('IDMODULO').AsFloat := StrToFloat(Smodulo);

         If bDocConciliado Then
           ParamByName('FLGNAOCONCILIADO').AsString := '0'
         Else
           ParamByName('FLGNAOCONCILIADO').AsString := '1';

         If rVALORJUROS <= 0 Then
            ParamByName('VALORJUROS').AsFloat := 0
         Else
            ParamByName('VALORJUROS').AsFloat := rVALORJUROS;

         If rVLRMULTA <=0 Then
           ParamByName('VLRMULTA').AsFloat := 0
         Else
           ParamByName('VLRMULTA').AsFloat := rVLRMULTA;

         If (iMoeCodigo <= 0) Then
            ParamByName('MOECODIGO').Clear
         Else
            ParamByName('MOECODIGO').AsFloat := iMoeCodigo;

         If (CodPortForma <= 0) Then
            ParamByName('CODPORTFORMA').Clear
         Else
            ParamByName('CODPORTFORMA').AsFloat := CodPortForma;

         If (Trim(Status) = '') Then
            ParamByName('STATUS').AsString := '0'
         Else
            ParamByName('STATUS').AsString := Trim(Status);

         If (NumFatura <= 0) Then
            ParamByName('NUMFATURA').Clear
         else
            ParamByName('NUMFATURA').AsFloat := NumFatura;

         If (Trim(Splano) = '') Then
            ParamByName('PLANO').Clear
         else
            ParamByName('PLANO').AsFloat := StrToFloat(Splano);

         If (Trim(Splaconta) = '') Or (Trim(Splano) = '') Then
            ParamByName('PLACONTA').Clear
         Else
            ParamByName('PLACONTA').AsString := Splaconta;

         If (Trim(Sccusto) = '') then
         Begin
            ParamByName('CODCENTROCUSTO').Clear;
            ParamByName('IDEMPRESA').Clear;
         End
         Else
         Begin
            ParamByName('CODCENTROCUSTO').AsString := Sccusto;
            ParamByName('IDEMPRESA').AsFloat      := Sistema.IdEmpresa;
         End;

         if (iCodSubConta <= 0) then
            ParamByName('CODSUBCONTA').Clear
         Else
            ParamByName('CODSUBCONTA').AsFloat := iCodSubConta;

         If (iCodForma <= 0) Then
            ParamByName('CODFORMA').Clear
         Else
            ParamByName('CODFORMA').AsFloat := iCodForma;

         If Trim(sNumLeitCodBarras) = '' Then
            ParamByName('NUMLEITCODBARRAS').Clear
         Else
           ParamByName('NUMLEITCODBARRAS').AsString := Trim(sNumLeitCodBarras);

         If Trim(sNumDigCodBarras) = '' Then
            ParamByName('NUMDIGCODBARRAS').Clear
         Else
            ParamByName('NUMDIGCODBARRAS').AsString := Trim(sNumDigCodBarras);

         If bEmisBloq Then
           ParamByName('EMISBLOQ').AsString := 'N'
         Else
           ParamByName('EMISBLOQ').Clear;

         If (iIndiceCorrecao <= 0) Then
            ParamByName('INDICECORRECAO').Clear
         Else
            ParamByName('INDICECORRECAO').AsFloat := iIndiceCorrecao;

         If (UnidNegoc <= 0) Then
            ParamByName('UNIDNEGOC').Clear
         Else
            ParamByName('UNIDNEGOC').AsFloat := UnidNegoc;

         If (Trim(fReferencia) = '') Then
             ParamByName('REFERENCIA').Clear
         Else
             ParamByName('REFERENCIA').AsString := fReferencia;

         If (Trim(fObs) = '') Then
             ParamByName('OBS').Clear
         Else
             ParamByName('OBS').AsString := fObs;

         If fNumAp <= 0 Then
             ParamByName('NUMAPGR').Clear
         Else
             ParamByName('NUMAPGR').AsInteger := fNumAp;

         If (fIdContaBancaria <= 0) Then
            ParamByName('IDCBANCARIA').Clear
         else
            ParamByName('IDCBANCARIA').AsFloat := fIdContaBancaria;

         If (FDataDisponibilidade <= 0) Then
            ParamByName('DATADISPONIB').Clear
         else
            ParamByName('DATADISPONIB').AsDateTime := FDataDisponibilidade;

         FDataDisponibilidade := 0;

         ExecSQL;

         fReferencia := '';
         fObs        := '';
         fNumAp      := 0;
         fIdContaBancaria := 0;
      End;
   Except
      fReferencia := '';
      fObs        := '';
      FDataDisponibilidade := 0;
      Raise;
   End;
end;

(******************************************************************************)

Function TDocumento.BuscaDebCre(iCodTipDoc: Longint):String;
Begin
  {** Verificado! **}
  Result := '';

  If FazQuery(dtmBaseDados.qry,'SELECT DEBCRE FROM TIPODOCRECPAG  WHERE ' +
              '(CODTIPDOC = ' + IntToStr(iCodTipDoc) + ')') Then
     Result := dtmBaseDados.qry.Fields[0].AsString;

  If dtmBaseDados.qry.Active Then dtmBaseDados.qry.Close;

  If (Trim(Result) <> 'C') And (Trim(Result) <> 'D') Then
     Raise Exception.Create('Erro ao selecionar DebCre para o CodTipDoc = ' + IntToStr(iCodTipDoc));  
End;

(******************************************************************************)

procedure TDocumento.EmiteLancaBaixa(iCodDoc: LongInt; bMarcaComoEmitido: boolean);
Begin
    If bMarcaComoEmitido Then
    Begin
       If Not ExecutarQuery(DtmBaseDados.Qry,'UPDATE DOCUMENTO SET FLGEMITELANCBAIX = ''S'' WHERE CODDOCUMENTO = ' + IntToStr(iCodDoc)) Then
          Raise EdataBaseError.Create('Erro ao marcar lança e baixa como emitido para o CodDocumento ' + IntToStr(iCodDoc) + ', verifique');
    End
    Else
      If Not ExecutarQuery(DtmBaseDados.Qry,'UPDATE DOCUMENTO SET FLGEMITELANCBAIX = NULL WHERE CODDOCUMENTO = ' + IntToStr(iCodDoc)) Then
         Raise EdataBaseError.Create('Erro ao liberar lança e baixa para emissão para o CodDocumento ' + IntToStr(iCodDoc) + ', verifique');
end;

Function TDocumento.ValidaNumApGr(iNumApGr :LongInt): Boolean;
Begin
   {** Verificado! **} 
   With DtmCmBackDocumento.QryValidaNumApGr Do
   Begin
      If Active Then Close;
      If Not Prepared Then Prepare;
      ParamByname('NUMAPGR').AsFloat := iNumApGr;
      Open;
      Result := IsEmpty;
      Close;
   End;
End;

(******************************************************************************)

procedure TDocumento.Alterar(qry: TwwQuery; iCodDocumento: LongInt;
      iMoeCodigo,IdPessoa,IdForCli,CodTipDoc,CodPortForma: LongInt;
      DataEmissao,DataVencto,DataProgramada,Status: String; NumFatura: Integer;
      NumSlip,EmisBloq : String; iCodForma : LongInt;
      sNumLeitCodBarras, sNumDigCodBarras, RecPag: String;
      rVALORJUROS, rVLRMULTA: Real; iIndiceCorrecao, iPLANO, iCODSUBCONTA: Integer;
      sPLACONTA, sCODCENTROCUSTO, sOperacao: String; bDocConciliado :Boolean = False);
begin
   If Not AutorizaDataVencimento(StrToDate(DataVencto),RecPag) Then Abort;

   Try
      With DtmCmBackDocumento.QryAlteraDoc Do
      Begin
         If Not Prepared Then Prepare;

         ParamByName('CODDOCUMENTO').AsFloat := iCodDocumento;
         ParamByName('IDPESSOA').AsFloat := IdPessoa;
         ParamByName('IDFORCLI').AsFloat := IdForCli;
         ParamByName('CODTIPDOC').AsFloat := CodTipDoc;
         ParamByName('RECPAG').AsString := RecPag;
         ParamByName('DATAEMISSAO').AsDateTime := StrTodate(DataEmissao);
         ParamByName('DATAVENCTO').AsDateTime := StrTodate(DataVencto);
         ParamByName('DATAPROGRAMADA').AsDateTime := StrTodate(DataProgramada);
         ParamByName('OPERACAO').AsString := Trim(sOperacao);

         If bDocConciliado Then
           ParamByName('FLGNAOCONCILIADO').AsString := '0'
         Else
           ParamByName('FLGNAOCONCILIADO').AsString := '1';

         If rVALORJUROS <= 0 Then
            ParamByName('VALORJUROS').AsFloat := 0
         Else
            ParamByName('VALORJUROS').AsFloat := rVALORJUROS;

         If rVLRMULTA <=0 Then
           ParamByName('VLRMULTA').AsFloat := 0
         Else
           ParamByName('VLRMULTA').AsFloat := rVLRMULTA;

         If (iMoeCodigo <= 0) Then
            ParamByName('MOECODIGO').Clear
         Else
            ParamByName('MOECODIGO').AsFloat := iMoeCodigo;

         If (CodPortForma <= 0) Then
            ParamByName('CODPORTFORMA').Clear
         Else
            ParamByName('CODPORTFORMA').AsFloat := CodPortForma;

         If (Trim(NumSlip) = '') Then
            ParamByName('NumSlip').AsString := '0'
         Else
            ParamByName('NumSlip').AsString := Trim(NumSlip);

         If (Trim(Status) = '') Then
            ParamByName('STATUS').AsString := '0'
         Else
            ParamByName('STATUS').AsString := Trim(Status);

         If (NumFatura <= 0) Then
            ParamByName('NUMFATURA').Clear
         else
            ParamByName('NUMFATURA').AsFloat := NumFatura;

         If (iplano <= 0) Then
            ParamByName('PLANO').Clear
         else
            ParamByName('PLANO').AsFloat := iplano;

         If (Trim(Splaconta) = '') Then
            ParamByName('PLACONTA').Clear
         Else
            ParamByName('PLACONTA').AsString := Splaconta;

         If (Trim(sCODCENTROCUSTO) = '') then
         Begin
            ParamByName('CODCENTROCUSTO').Clear;
            ParamByName('IDEMPRESA').Clear;
         End
         Else
         Begin
            ParamByName('CODCENTROCUSTO').AsString := sCODCENTROCUSTO;
            ParamByName('IDEMPRESA').AsFloat := Sistema.IdEmpresa;
         End;

         if (iCodSubConta <= 0) then
            ParamByName('CODSUBCONTA').Clear
         Else
            ParamByName('CODSUBCONTA').AsFloat := iCodSubConta;

         If (iCodForma <= 0) Then
            ParamByName('CODFORMA').Clear
         Else
            ParamByName('CODFORMA').AsFloat := iCodForma;

         If Trim(sNumLeitCodBarras) = '' Then
            ParamByName('NUMLEITCODBARRAS').Clear
         Else
           ParamByName('NUMLEITCODBARRAS').AsString := Trim(sNumLeitCodBarras);

         If Trim(sNumDigCodBarras) = '' Then
            ParamByName('NUMDIGCODBARRAS').Clear
         Else
            ParamByName('NUMDIGCODBARRAS').AsString := Trim(sNumDigCodBarras);

         If (Trim(EmisBloq) <> '') Then
           ParamByName('EMISBLOQ').AsString := EmisBloq
         Else
           ParamByName('EMISBLOQ').Clear;

         If (iIndiceCorrecao <= 0) Then
            ParamByName('INDICECORRECAO').Clear
         Else
            ParamByName('INDICECORRECAO').AsFloat := iIndiceCorrecao;

         If (Trim(fReferencia) = '') Then
             ParamByName('REFERENCIA').Clear
         Else
             ParamByName('REFERENCIA').AsString := fReferencia;

         If (Trim(fObs) = '') Then
             ParamByName('OBS').Clear
         Else
             ParamByName('OBS').AsString := fObs;

         If fNumAp <= 0 Then
             ParamByName('NUMAPGR').Clear
         Else
             ParamByName('NUMAPGR').AsInteger := fNumAp;

         If (fIdContaBancaria <= 0) Then
            ParamByName('IDCBANCARIA').Clear
         else
            ParamByName('IDCBANCARIA').AsFloat := fIdContaBancaria;

         If (FDataDisponibilidade <= 0) Then
            ParamByName('DATADISPONIB').Clear
         else
            ParamByName('DATADISPONIB').AsDateTime := FDataDisponibilidade;

         FDataDisponibilidade := 0;


         ExecSQL;

         fReferencia := '';
         fObs        := '';
         fNumAp      := 0;
         fIdContaBancaria := 0;
      End;
   Except
      fReferencia := '';
      fObs        := '';
      FDataDisponibilidade := 0;
      Raise;
   End;
end;

function TDocumento.GerarNumLancto(qry: TwwQuery; iCodDocumento: LongInt): Longint;
begin
   Result := LeUltRegistro(nil,'LANCTODOCUM');
end;

procedure TDocumento.CriarLanctoDoc(qry: TwwQuery;
        iCodDocumento,iNumLancto,CodAlterador: LongInt;
        Var PlnCodigo: LongInt;
        DataLancto: String; Valor,ValorOutraMoeda : Double;
        Estorno: LongInt;
        DebCre,sOperacao,HistoricoCompl: String; idUsuarioInclusao: LongInt;
        bContabiliza: Boolean; iCodPortForma: LongInt; sNumChqBord: String);
Var
   ImpostoAlterador :TImpostoRetido;
begin
   If (Trim(sOperacao) = '5') Then
   Begin
     Try
       JurosCorrecao              := TJurosCorrecao.Create;
       JurosCorrecao.CodDocumento := iCodDocumento;
       JurosCorrecao.DataCorrecao := StrToDate(DataLancto);
       JurosCorrecao.CorrigeDocumento;
     finally
       JurosCorrecao.Free;
     End;
   End;

   If FDiasFloat <> 0 Then
   Begin
      If bContabiliza And (IntegraBack.Contabilidade = 'S') Then
         LancaRateioContab(qry, iCodDocumento, CodAlterador, PlnCodigo,
         DateToStr(AjustaDataFloat(StrToDate(DataLancto),FDiasFloat)), Valor,ValorOutraMoeda, DebCre,sOperacao, HistoricoCompl,
         iCodPortForma,sNumChqBord);
   End
   Else
   Begin
      If bContabiliza And (IntegraBack.Contabilidade = 'S') Then
         LancaRateioContab(qry, iCodDocumento, CodAlterador, PlnCodigo,
         DataLancto, Valor,ValorOutraMoeda, DebCre,sOperacao, HistoricoCompl,
         iCodPortForma,sNumChqBord);
   End;

   If Trim(sOperacao) = '15' Then Exit;

   With DtmCmBackDocumento.QryInsereLanc Do
   Begin
      ParamByName('CODDOCUMENTO').AsFloat := iCodDocumento;
      ParamByName('NUMLANCTO').AsFloat := iNumLancto;

      If CodAlterador <= 0 Then
         ParamByName('CODALTERADOR').Clear
      Else
         ParamByName('CODALTERADOR').AsFloat := CodAlterador;

      If PlnCodigo <= 0 Then
         ParamByName('PLNCODIGO').Clear
      Else
         ParamByName('PLNCODIGO').AsFloat := PlnCodigo;

      If FDiasFloat <> 0 Then
         ParamByName('DATALANCTO').AsDateTime := AjustaDataFloat(StrToDate(DataLancto),FDiasFloat)
      Else
         ParamByName('DATALANCTO').AsDateTime := StrToDate(DataLancto);

      ParamByName('VALOR').AsFloat := Valor;

      If ValorOutraMoeda = 0.00 Then
         ParamByName('VALOROUTRAMOEDA').Clear
      Else
         ParamByName('VALOROUTRAMOEDA').AsFloat := ValorOutraMoeda;

      If Estorno <= 0 Then
         ParamByName('ESTORNO').Clear
      Else
         ParamByName('ESTORNO').AsFloat := Estorno;

      ParamByName('DEBCRE').AsString := DebCre;
      ParamByName('OPERACAO').AsString := sOperacao;

      If HistoricoCompl = '' then
         ParamByName('HISTORICOCOMPL').Clear
      else
         ParamByName('HISTORICOCOMPL').AsString := Copy(HistoricoCompl,1,60);

      ParamByName('IDUSUARIOINCLUSAO').AsFloat := idUsuarioInclusao;

      If (fNumFatLanc = '') Then
         ParamByName('NUMFATURA').Clear
      Else
         ParamByName('NUMFATURA').AsString := fNumFatLanc;

      If (fTipoFaturaLancto = '') Then
         ParamByName('FLGTIPOFATURA').Clear
      Else
         ParamByName('FLGTIPOFATURA').AsString := fTipoFaturaLancto;

      If FCodTipDoc <= 0 Then
         ParamByName('CODTIPDOC').Clear
      Else
         ParamByName('CODTIPDOC').AsFloat := FCodTipDoc;

      If fValorliquido > 0 Then
         ParamByName('VLRLIQUIDO').AsFloat := fValorliquido
      Else
         ParamByName('VLRLIQUIDO').AsFloat := Valor;

      If fUnidNegocioLancto <= 0 Then
      Begin
         ParamByName('IDPESSOA').Clear;
         ParamByName('UNIDNEGOC').Clear;
      End
      Else
      Begin
         ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
         ParamByName('UNIDNEGOC').AsFloat := fUnidNegocioLancto;
      End;

      If fNumLoteManual <= 0 Then
         ParamByName('NUMLOTEMANUAL').Clear
      Else
         ParamByName('NUMLOTEMANUAL').AsFloat := fNumLoteManual;

      ExecSql;
   End;

   If sOperacao <> '10' Then
      baixa_documento(Qry,iCodDocumento);

   If (Trim(sOperacao) = '5') And (IntegraBack.RecPag = 'P') Then
      If (Not ExecutarQuery(dtmBaseDados.qry,'UPDATE DOCUMENTO SET ' +
                             'EMISBLOQ = Null WHERE CODDOCUMENTO = ' + IntToStr(iCodDocumento) )) Then
         Raise EdataBaseError.Create('Erro ao liberar documento ' + IntToStr(iCodDocumento) + ' para emissão no momento da baixa');

   If (sOperacao = '4') Then
   Begin
      If FazQuery(dtmBaseDados.qry,'SELECT ' +
                                        ' D.DATAPROGRAMADA, D.IDFORCLI, ' +
                                        ' D.DATAEMISSAO, D.CODTIPDOC, D.OPERACAO ' +
                                        'FROM ' +
                                        ' DOCUMENTO D, LANCTODOCUM L, TIPOALTERADOR T ' +
                                        'WHERE ' +
                                        ' (L.CODDOCUMENTO    = ' + IntToStr(iCodDocumento) + ') AND ' +
                                        ' (L.NUMLANCTO    = ' + IntToStr(iNumLancto) + ') AND ' +
                                        ' (T.FLGCALCULAIMPOSTO = ''S'') AND ' +
                                        ' (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' +
                                        ' (L.CODALTERADOR = T.CODALTERADOR)') Then
      Begin
        ImpostoAlterador                   := TImpostoRetido.Create;
        Try
          ImpostoAlterador.MomentoLancamento := mlLancamento;
          ImpostoAlterador.DataProgramada    := dtmBaseDados.qry.FieldByName('DATAPROGRAMADA').AsDateTime;
          ImpostoAlterador.OperacaoDocumento := dtmBaseDados.qry.FieldByName('OPERACAO').AsString;
          ImpostoAlterador.OperacaoDocumento := sOperacao;
          ImpostoAlterador.IdForCli          := dtmBaseDados.qry.FieldByName('IDFORCLI').AsInteger;
          ImpostoAlterador.CodDocumento      := iCodDocumento;
          ImpostoAlterador.NumLancto         := iNumLancto;
          ImpostoAlterador.ValorLancto       := Valor;
          ImpostoAlterador.ValorLiquido      := fValorliquido;
          ImpostoAlterador.CodTipoDoc        := dtmBaseDados.qry.FieldByName('CODTIPDOC').AsInteger;

          If FDiasFloat <> 0 Then
             ImpostoAlterador.DataLancto        := AjustaDataFloat(StrToDate(DataLancto),FDiasFloat)
          Else
             ImpostoAlterador.DataLancto        := StrToDate(DataLancto);

          ImpostoAlterador.DataEmissao       := dtmBaseDados.qry.FieldByName('DATAEMISSAO').AsDateTime;
          ImpostoAlterador.DebCre            := DebCre;
          ImpostoAlterador.Incluir;
        Finally
          ImpostoAlterador.Free;
        End;
      End;
   End;

   fValorliquido      := 0;
   FDiasFloat         := 0;
   fUnidNegocioLancto := 0;
   fNumLoteManual     := 0;
   fNumFatLanc        := '';
   fTipoFaturaLancto  := '';
   FCodTipDoc         := -1;
end;

(******************************************************************************)

procedure TDocumento.AlterarLanctoDoc(qry: TwwQuery; iCodDocumento,iNumLancto,
                     CodAlterador: LongInt; Var PlnCodigo: Integer; DataLancto: String;
                     Valor,ValorOutraMoeda : Real;  Estorno: LongInt; DebCre,
                     HistoricoCompl, sOperacao: String;bContabiliza: Boolean;
                     iCodPortForma: LongInt; sNumChqBord: String);
Var
   bEstorno   :Boolean;
begin
   If bContabiliza And (IntegraBack.Contabilidade = 'S') Then
   Begin
      If Not EstornaExcluiContab(PlnCodigo,DataLancto,bEstorno,False) Then Abort;

      If bEstorno Then PlnCodigo := 0;

      LancaRateioContab(qry, iCodDocumento, CodAlterador, PlnCodigo,
      DataLancto, Valor,ValorOutraMoeda, DebCre, sOperacao, HistoricoCompl,
      iCodPortForma,sNumChqBord);
   End;

   If Trim(sOperacao) = '15' Then Exit;

   With DtmCmBackDocumento.QryAlteraLanc Do
   Begin
      if CodAlterador <= 0  then
         ParamByName('CODALTERADOR').Clear
      else
         ParamByName('CODALTERADOR').AsFloat := CodAlterador;

      if PlnCodigo <= 0 then
         ParamByName('PLNCODIGO').Clear
      else
         ParamByName('PLNCODIGO').AsFloat := PlnCodigo;

      ParamByName('DATALANCTO').AsDateTime := StrToDate(DataLancto);
      ParamByName('OPERACAO').AsString := sOperacao;
      ParamByName('VALOR').AsFloat := Valor;

      if ValorOutraMoeda = 0.00 then
         ParamByName('VALOROUTRAMOEDA').Clear
      else
         ParamByName('VALOROUTRAMOEDA').AsFloat := ValorOutraMoeda;

      if Estorno <= 0 then
         ParamByName('ESTORNO').Clear
      else
         ParamByName('ESTORNO').AsFloat := Estorno;

      ParamByName('DEBCRE').AsString := DebCre;

      if HistoricoCompl = '' then
         ParamByName('HISTORICOCOMPL').Clear
      else
         ParamByName('HISTORICOCOMPL').AsString := Copy(HistoricoCompl,1,60);

      If fNumFatLanc = '' Then
         ParamByName('NUMFATURA').Clear
      Else
         ParamByName('NUMFATURA').AsString := fNumFatLanc;

      if fTipoFaturaLancto = '' Then
         ParamByName('FLGTIPOFATURA').Clear
      Else
         ParamByName('FLGTIPOFATURA').AsString := fTipoFaturaLancto;

      If FCodTipDoc <= 0 Then
         ParamByName('CODTIPDOC').Clear
      Else
         ParamByName('CODTIPDOC').AsFloat := FCodTipDoc;

      if fValorliquido <= 0 then
         ParamByName('VLRLIQUIDO').Clear
      Else
         ParamByName('VLRLIQUIDO').AsFloat := fValorliquido;

      If fUnidNegocioLancto <= 0 Then
      Begin
         ParamByName('IDPESSOA').Clear;
         ParamByName('UNIDNEGOC').Clear;
      End
      Else
      Begin
         ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
         ParamByName('UNIDNEGOC').AsFloat := fUnidNegocioLancto ;
      End;

      If fNumLoteManual <= 0 Then
         ParamByName('NUMLOTEMANUAL').Clear
      Else
         ParamByName('NUMLOTEMANUAL').AsFloat := fNumLoteManual;


      ParamByName('CODDOCUMENTO').AsFloat := iCodDocumento;
      ParamByName('NUMLANCTO').AsFloat := iNumLancto;

      ExecSql;
   End;

   fUnidNegocioLancto := 0;
   fNumLoteManual     := 0;
   fNumFatLanc        := '';
   fTipoFaturaLancto  := '';
   fCodTipDoc         := -1;
   fValorliquido      := 0;


   If Not ExecutarQuery(DtmCmBackDocumento.Qry,'UPDATE DOCUMENTO SET FLGNAOCONCILIADO = ''1'' WHERE CODDOCUMENTO = ' +  IntToStr(iCodDocumento)) Then
      Raise EDataBaseError.Create('Erro ao atualizar status de CONCILIADO do documento');

   If sOperacao <> '10' Then  baixa_documento(Qry,iCodDocumento);
end;


(******************************************************************************)

function TDocumento.Procurar(qry: TwwQuery; IdForCli: LongInt;
                NoDocumento: Real; ComplDocumento : String): LongInt;
Var
   sSql: String;
begin
   with qry do begin
      Close;
      if ComplDocumento = ''
      then sSql := 'Select CodDocumento from Documento '+
                  'Where idForCli = '+IntToStr(IdForCli)+
                  ' and NoDocumento = '+FloatToStr(NoDocumento)+
                  ' and ComplDocumento is Null'
      else sSql := 'Select CodDocumento from Documento '+
                  'Where idForCli = '+IntToStr(IdForCli)+
                  ' and NoDocumento = '+FloatToStr(NoDocumento)+
                  ' and ComplDocumento = '''+ComplDocumento+'''';
      Sql.Text := sSql;
      Open;
      if RecordCount = 0
      then Result := -1 //nao achou nenhum
      else if RecordCount = 1
      then Result := FieldByName('CodDocumento').AsInteger
      else Result := -2; //Achou mais de um
      Close;
   end;
end;


(******************************************************************************)

function TDocumento.GetNumFatura(qry: TwwQuery) : LongInt;
begin
   Result := LeultRegistro(nil,'DOCNUMFATURA');
   FNumFatura := Result;
end;

procedure TDocumento.Excluir(qry : TwwQuery; iCodDocumento, iNumLancto: LongInt;
     Const bExcluiContabLancDoc: Boolean = True);
Var
   sMens :String;
   ImpostoRetidoExc :TImpostoRetido;
   OrcamentoDoc :TorcamentoBack;
   liEmpresa, liPeriodo, liExercicio: Integer;

   Procedure ExecSql(sSql: String);
   Begin
      If Qry.Active Then Qry.Close;
      Qry.Sql.Text := sSql;
      Qry.ExecSQL;
   End;
begin
   if iNumLancto = 0 then
   Begin
     ImpostoRetidoExc := TImpostoRetido.Create;
     OrcamentoDoc := TorcamentoBack.Create;
      With DtmCmBackDocumento Do
        Try
           //Verifica se existem lançamentos de baixa para o documento a ser excluído
           If QryBuscaParamBaixa.Active Then QryBuscaParamBaixa.Close;
           QryBuscaParamBaixa.Prepare;
           QryBuscaParamBaixa.ParamByName('CODDOCUMENTO').AsFloat := iCodDocumento;
           QryBuscaParamBaixa.Open;

           If Not QryBuscaParamBaixa.IsEmpty Then
              Raise Exception.Create('Existem lançamentos de baixa no dia ' +
                                     QryBuscaParamBaixa.FieldByName('DATALANCTO').AsString + ' na conta ' +
                                     QryBuscaParamBaixa.FieldByName('DESCRICAO').AsString);

           If QryBuscaParamBaixa.Active Then QryBuscaParamBaixa.Close;
           //
           // Busca parâmetros de lançamento do Documento a ser excluído.
           If QryParamDocs.Active Then QryParamDocs.Close;
           QryParamDocs.Prepare;
           QryParamDocs.ParamByName('CODDOCUMENTO').AsFloat := iCodDocumento;
           QryParamDocs.Open;

           If Not QryParamDocs.IsEmpty Then
           Begin
              // Verifica se o documento foi englobado ou parcelado
              If Not QryParamDocs.FieldByName('NUMFATURA').IsNull Then
                 Raise Exception.Create('Este documento foi englobado\parcelado.');
              //
              // Verifica se o documento a ser excluído foi estornado.
              If Not QryParamDocs.FieldByName('ESTORNO').IsNull Then
                 Raise Exception.Create('Este Lançamento foi estornado ou é um estorno.');
              //
              // Verifica se o documento foi lançado com integração na contabilidade e se o
              // período contábil do lançamento do documento está aberto, caso contrário obriga o
              // estorno do mesmo.
              if (IntegraBack.Contabilidade = 'S') And
                 (Not QryParamDocs.FieldByName('PLNCODIGO').IsNull) Then
              begin
                 liEmpresa := Sistema.IdEmpresa;
                 liPeriodo := 0;
                 liExercicio := 0;

                 if TestaPeriodo(True, 'BASEDADOS', QryParamDocs.FieldByName('DATALANCTO').AsString, IntToStr(Sistema.IdModulo), liExercicio,
                                 liPeriodo, liEmpresa, sMens) <> 0 then
                    Raise Exception.Create('Este Documento não pode ser excluido, somente pode ser estornado');
              end;
              //
              // Verfica se o documento lançado é um efetivo e "Exclui" as possíveis rentenções de imposto
              // para o documento a ser excluído.
              if (Trim(QryParamDocs.FieldByName('OPERACAO').AsString) = '2') Or
                 (Trim(QryParamDocs.FieldByName('OPERACAO').AsString) = '1') Then
              begin
                  ImpostoRetidoExc.CodDocumento := iCodDocumento;
                  ImpostoRetidoExc.NumLancto := 0;
                  ImpostoRetidoExc.ExcluiAlteradores := True;
                  ImpostoRetidoExc.Excluir;
              end;
              //
              If QryParamDocs.Active Then QryParamDocs.Close;
              //
              //Seleciona os PLNCODIGO dos lançamento do documento a ser excluído para
              If QryDadosDelImpLanc.Active Then QryDadosDelImpLanc.Close;
              QryDadosDelImpLanc.Prepare;
              QryDadosDelImpLanc.ParamByName('CODDOCUMENTO').AsFloat := iCodDocumento;
              QryDadosDelImpLanc.Open;
              //
              //Exclusão da retenção de impostos associada ao lancamento a ser excluído
              QryDadosDelImpLanc.First;
              While Not QryDadosDelImpLanc.Eof Do
              Begin
                 ImpostoRetidoExc.CodDocumento        := QryDadosDelImpLanc.FieldByName('CODDOCUMENTO').AsInteger;
                 ImpostoRetidoExc.NumLancto           := QryDadosDelImpLanc.FieldByName('NUMLANCTO').AsInteger;
                 ImpostoRetidoExc.ExcluiAlteradores   := True;
                 ImpostoRetidoExc.Excluir;
                 QryDadosDelImpLanc.Next;
              End;

              //Seleciona os IDRESERVAORCAMEN, NUMRESERVA, VLRRESORCAMEN do rateio do
              //Documento a ser excluído para Estorno do comprisso assumido no lançamento do Documento
              If QryDadosDelOrc.Active Then QryDadosDelOrc.Close;
              QryDadosDelOrc.Prepare;
              QryDadosDelOrc.ParamByName('CODDOCUMENTO').AsFloat := iCodDocumento;
              QryDadosDelOrc.Open;
              //
              //Verifica se o documento está contido em um lote cancelado, caso esteja verifica
              //se o lote só contem este documento, caso este seja o único exclui o LOTEXDOCUM e o LOTEPAGTO
              //Caso contrário gera uma excessão.
              If QryDadosDelLote.Active Then QryDadosDelLote.Close;
              QryDadosDelLote.Prepare;
              QryDadosDelLote.ParamByName('CODDOCUMENTO').AsFloat := iCodDocumento;
              QryDadosDelLote.Open;

              QryDadosDelLote.First;
              While Not QryDadosDelLote.Eof Do
              Begin
                 If QryDadosDelLote.FieldByName('FLAGCANCEL').AsString = 'B' Then
                    Raise Exception.Create('Este documento consta no Lote ' + QryDadosDelLote.FieldByName('NUMLOTE').AsString + ' que foi baixado')
                 Else
                   If (QryDadosDelLote.FieldByName('FLAGCANCEL').AsString = 'R') Or
                      (Trim(QryDadosDelLote.FieldByName('FLAGCANCEL').AsString) = '') Then
                      Raise Exception.Create('Este documento consta no Lote ' + QryDadosDelLote.FieldByName('NUMLOTE').AsString);


                 ExecSql('DELETE FROM LOTEXDOCUM WHERE NUMLOTE = ' +  QryDadosDelLote.FieldByName('NUMLOTE').AsString);
                 ExecSql('DELETE FROM LOTEPAGTO WHERE NUMLOTE = ' +  QryDadosDelLote.FieldByName('NUMLOTE').AsString);

                 QryDadosDelLote.Next;
              End;
              //
              //Apaga as tabelas LanctoDocum, LotexDocum, RateioDocum e Documento
              ExecSql('DELETE FROM LANCTODOCUM WHERE CODDOCUMENTO = '+IntToStr(iCodDocumento));
              ExecSql('DELETE FROM RATEIODOCUM WHERE CODDOCUMENTO = '+IntToStr(iCodDocumento));
              ExecSql('DELETE FROM IMPOSTORETIDO WHERE CODDOCLANCADO = '+IntToStr(iCodDocumento));
              ExecSql('DELETE FROM CCBAIXASXDOCUM WHERE CODDOCUMENTO = '+IntToStr(iCodDocumento)); // Alterado por FHBS - SOL: 153925 KTN: 1167543
              ExecSql('DELETE FROM DOCUMENTO WHERE CODDOCUMENTO = '+IntToStr(iCodDocumento));
              //
              //Estorno do comprisso assumido no lançamento do Documento
              QryDadosDelOrc.First;
              While Not QryDadosDelOrc.Eof Do
              Begin
                 If OrcamentoDoc.EstornaCompromisso(
                     QryDadosDelOrc.FieldByName('NUMRESERVA').AsInteger,
                     QryDadosDelOrc.FieldByName('VLRRESORCAMEN').AsFloat,True) <> 0 Then
                     raise Exception.Create('Não Foi Possível Estornar Compromisso orçamentário da reserva ' + QryDadosDelOrc.FieldByName('NUMRESERVA').AsString + '.');

                 QryDadosDelOrc.Next;
              End;
              //
              //Exclusão dos lançamentos contábeis referentes a contabilização do lançamento do
              //Documento ou alteradores lançados para este documento
              if bExcluiContabLancDoc then
              begin
                 QryDadosDelImpLanc.First;
                 While Not QryDadosDelImpLanc.Eof Do
                 Begin
                     //Verifica se o lançamento se refere a um estono
                     If Not QryDadosDelImpLanc.FieldByName('ESTORNO').IsNull Then
                        Raise Exception.Create('O Lançamento ' + QryDadosDelImpLanc.FieldByName('NUMLANCTO').AsString + 'foi estornado ou é um estorno. Proíbido excluí-lo.');

                     //Verifica se o lançamento foi integrado com a contabilidade e exclui a contabilização
                     If Not QryDadosDelImpLanc.FieldByName('PLNCODIGO').IsNull Then
                     Begin
                        liRetFuncao := ExcluiLanc(True,
                                       QryDadosDelImpLanc.FieldByName('PLNCODIGO').AsInteger,
                                       'BASEDADOS',
                                       IntToStr(Sistema.IdModulo),
                                       IntegraBack.Plano,
                                       Sistema.IdEmpresa,
                                       Sistema.IdUsuario,
                                       true,
                                       0,
                                       IntegraBack.MascaraPlano);

                        if liRetFuncao < 0 then
                           Exception.Create('Não foi possível excluir a contabilização do lançamento.');
                     End;
                     QryDadosDelImpLanc.Next;
                 End;
              End;
           End
           Else
              Raise Exception.Create('Não foi possível selecionar parâmetros para exclusão do documento');
           //
           If QryParamDocs.Active Then QryParamDocs.Close;
           If QryBuscaParamBaixa.Active Then QryBuscaParamBaixa.Close;
           If QryDadosDelImpLanc.Active Then QryDadosDelImpLanc.Close;
           If QryDadosDelOrc.Active Then QryDadosDelOrc.Close;
           If QryDadosDelLote.Active Then QryDadosDelLote.Close;
           //
           ImpostoRetidoExc.Free;
           OrcamentoDoc.Free;
        Except
           On E: Exception Do
           Begin
             If QryParamDocs.Active Then QryParamDocs.Close;
             If QryBuscaParamBaixa.Active Then QryBuscaParamBaixa.Close;
             If QryDadosDelImpLanc.Active Then QryDadosDelImpLanc.Close;
             If QryDadosDelOrc.Active Then QryDadosDelOrc.Close;
             If QryDadosDelLote.Active Then QryDadosDelLote.Close;
             //
             ImpostoRetidoExc.Free;
             OrcamentoDoc.Free;
             //
             Raise Exception.Create('Erro ao excluir o CODDOCUMENTO ' + IntToStr(iCodDocumento) + '.' + (#13+#10) + E.Message);
           End;
        End;
   End
   else
   Begin
      Try
         If DtmCmBackDocumento.QrySelLanc.Active Then DtmCmBackDocumento.QrySelLanc.Close;
         DtmCmBackDocumento.QrySelLanc.Prepare;
         DtmCmBackDocumento.QrySelLanc.ParamByName('CODDOCUMENTO').AsFloat := iCodDocumento;
         DtmCmBackDocumento.QrySelLanc.ParamByName('NUMLANCTO').AsFloat := iNumLancto;
         DtmCmBackDocumento.QrySelLanc.Open;

         //Verifica se o lançamento se refere a um estono
         If Not DtmCmBackDocumento.QrySelLanc.FieldByName('ESTORNO').IsNull Then
            Raise Exception.Create('O Lançamento ' + DtmCmBackDocumento.QrySelLanc.FieldByName('NUMLANCTO').AsString + 'foi estornado ou é um estorno. Proíbido excluí-lo.');

         ExecSql('DELETE FROM RECBTOPAGTO WHERE CODDOCUMENTO = ' + IntToStr(iCodDocumento) +
                 ' AND NUMLANCTO = ' + IntToStr(iNumLancto));

         ExecSql('DELETE FROM IMPOSTORETIDO WHERE CODDOCUMENTO = ' + IntToStr(iCodDocumento) +
                 ' AND NUMLANCTOORIGEM = ' + IntToStr(iNumLancto));

         ExecSql('DELETE FROM LANCTODOCUM WHERE CODDOCUMENTO = ' + IntToStr(iCodDocumento) +
                 ' AND NUMLANCTO = ' + IntToStr(iNumLancto));

         //Verifica se o lançamento foi integrado com a contabilidade e exclui a contabilização
         If Not DtmCmBackDocumento.QrySelLanc.FieldByName('PLNCODIGO').IsNull Then
         Begin
            ExecSql('UPDATE LANCTODOCUM SET PLNCODIGO = NULL WHERE PLNCODIGO = ' + DtmCmBackDocumento.QrySelLanc.FieldByName('PLNCODIGO').AsString);

            liRetFuncao := ExcluiLanc(True,
                           DtmCmBackDocumento.QrySelLanc.FieldByName('PLNCODIGO').AsInteger,
                           'BASEDADOS',
                           IntToStr(Sistema.IdModulo),
                           IntegraBack.Plano,
                           Sistema.IdEmpresa,
                           Sistema.IdUsuario,
                           true,
                           0,
                           IntegraBack.MascaraPlano);

            if liRetFuncao < 0 then
               Exception.Create('Não foi possível excluir a contabilização do lançamento.');
         End;

         Baixa_Documento(qry,iCodDocumento);

         If DtmCmBackDocumento.QrySelLanc.Active Then DtmCmBackDocumento.QrySelLanc.Close;
      Except
           On E: Exception Do
           Begin
             If DtmCmBackDocumento.QrySelLanc.Active Then DtmCmBackDocumento.QrySelLanc.Close;
             //
             Raise Exception.Create('Erro ao excluir o NUMLANCTO ' + IntToStr(iCodDocumento) + ' para o  CODDOCUMENTO ' + IntToStr(iCodDocumento) + '.' + (#13+#10) + E.Message);
           End;
      End;
   End;
end;

(*************************** X *******************************)

Constructor TRecbToPagto.Create;
Begin
  fCodlancnaoident := -1;
  fNumBaixa        := -1;
End;

procedure TRecbToPagto.Inserir(qry: TwwQuery;
            iCodDocumento,iNumLancto,idUsuarioInclusao,iCodLancFinanc,CodPortForma: LongInt;
            iNumLote:LongInt;
            NumChqBordero,DataFloat,DataBaixa: String);
Var
   sSql, sSqlInc : String;
   sSeparador    :Char;
begin
 sSeparador := DecimalSeparator;
 Try
   sSeparador := DecimalSeparator;
   with qry do
   begin
      Close;
      DecimalSeparator := '.';
      sSql := 'Insert Into RecbtoPagto(CodDocumento,NumLancto,IdUsuarioInclusao,'+
      'CodLancFinanc,CodPortForma,NumLote,NumChqBordero,DatacFloat,CODLANCNAOIDENT, NumBaixa, DataBaixa) Values(';
      sSqlInc := IntToStr(iCodDocumento);
      sSqlInc := sSqlInc +','+IntToStr(iNumLancto);

      sSqlInc := sSqlInc +','+ IntToStr(idUsuarioInclusao);

      if iCodLancFinanc <= 0 then
         sSqlInc := sSqlInc +',Null'
      else
         sSqlInc := sSqlInc +','+IntToStr(iCodLancFinanc);

      if CodPortForma <= 0 then
         sSqlInc := sSqlInc +',Null'
      else
         sSqlInc := sSqlInc +','+IntToStr(CodPortForma);

      if iNumLote <= 0 then
         sSqlInc := sSqlInc +',Null'
      else
         sSqlInc := sSqlInc +','+IntToStr(iNumLote);

      if NumChqBordero <> '' then
         sSqlInc := sSqlInc + ',''' + Trim(NumChqBordero) + ''''
      else
         sSqlInc := sSqlInc +',Null';

      sSqlInc := sSqlInc + ',to_date('''+DataFloat+''',''dd/MM/yyyy'')';

      if fCodlancnaoident <= 0 then
         sSqlInc := sSqlInc +',Null'
      else
         sSqlInc := sSqlInc +','+IntToStr(fCodlancnaoident);

      if fNumBaixa <= 0 then
         sSqlInc := sSqlInc +',Null'
      else
         sSqlInc := sSqlInc +','+IntToStr(fNumBaixa);

      if DataBaixa = '' then
         sSqlInc := sSqlInc +',Null'
      else
         sSqlInc := sSqlInc + ',to_date('''+DataBaixa+''',''dd/MM/yyyy'')';

      DecimalSeparator := sSeparador;
      sSql := sSql + sSqlInc + ')';
      Sql.Text := sSql;
      ExecSQL;
      Close;
   end;
   fCodlancnaoident := -1;
 Except
  fCodlancnaoident := -1;
  DecimalSeparator := sSeparador;
  Raise;
 End;
end;

Function TContabilizacao.gera_lanca_contab(shistorico1,sdocumento,sabc,datalanc,
                                      Sccustod,sccustoc,Scontadeb,Scontacred,Sconversao:string;
                                      rvalorlanc:real;iCodSubContaD,iCodSubContaC:LongInt;var liplanilha:longint): Boolean;

var
   iperiodo,iexercicio,iempresa: integer;
   sMens, smodulo,shist1,shist2,shist3,shist4,shist5,sSubContaD,sSubContaC: string;
begin

    Result := True;

    if Sconversao <> 'N' then
       Sconversao := '';

    if IntegraBack.RecPag = 'P' then
       Smodulo := '3'
    else
       Smodulo := '4';

    sSubContaD:='';
    sSubContaC:='';
    if iCodSubContaD > 0 then
       sSubContaD:=IntToStr(iCodSubContaD);
    if iCodSubContaC > 0 then
       sSubContaC:=IntToStr(iCodSubContaC);
    // debito
    liplanilha:=0;
    iexercicio:= 0;
    iperiodo:=0;
    iempresa := Sistema.idempresa;

    If TestaPeriodo(True,'BaseDados',datalanc,'2',iexercicio,iperiodo,iempresa,sMens) <> 0 Then
    Begin
        Result := False;
        Exit;
    End;

 FuncaoGeral.ArrumaHistorico(shistorico1,shist1,shist2,shist3,shist4,shist5);

 liplanilha:=   LancaContab(True,'BaseDados',                               // alias do bde
                            datalanc,                                  // data de lançamento
                            Smodulo,                                       // número do sistema de origem - tabela MODULO
                            '0',                                       // tipo de lançamento débito = 0 e crédito = 1  e ambos = 2
                            'D',                                       // débito-crédito
                            Sconversao,                                // tipo de conversão
                            Sconversao,
                            Sconversao,
                            Sconversao,
                            'O',                                       // origem da aplicação a débito
//                          'N',                                       // mutações PL
                            Sconversao,                                // tipo de conversão a credito
                            Sconversao,
                            Sconversao,
                            Sconversao,
                            'O',                                       // origem da aplicação a débito
//                          'N',                                       // mutações PL
                            Copy(sdocumento,1,15),                                // Número do documento
                            shist1,                               // histórico 1
                            shist2,
                            shist3,
                            shist4,
                            shist5,                                        // histórico 5
                            '03',                                      // grupo (tipo de operação - tabela tipooper
                            Sccustod,                                   // ccusto a débito
                            Scontadeb,                                 // conta contábil a débito
                            '',                                        // ccusto a crédito
                            '',                                        // conta contábil a crédito
                            iexercicio,                                // exercício (perexercício)
                            iperiodo,                                  // pernumero (tabperiodo)
                            Sistema.idempresa,                     // pessoa
                            Sistema.idusuario,                     // usuario
                            IntegraBack.Plano ,                           // plano
                            rvalorlanc,                                // valor do lançamento
                            0,                                         // valor do lançamento a débito moeda oficial
                            0,                                         // valor do lançamento a débito moeda gerencial 1
                            0,                                         // valor do lançamento a débito moeda gerencial 2
                            0,                                         // valor do lançamento a débito moeda gerencial 3
                            0,                                         // valor do lançamento a crédito moeda oficial
                            0,                                         // valor do lançamento a crédito moeda gerencial 1
                            0,                                         // valor do lançamento a crédito moeda gerencial 2
                            0,                                         // valor do lançamento a crédito moeda gerencial 3
                            Sabc,                                      // unidade de negocio
                            false,                                     // bjunta = false
                            0,                                         // valor do lancamento em moeda historica
                            0,                                         // valor do lancamento em moeda
                            sSubContaD,                                // subconta debito
                            '',                                        // subconta credito
                            '',  // acrescentei
                            '',  // acrescentei
                            liplanilha, sMens,IntegraBack.MascaraPlano,True,0,-1,-1,False);


  if liplanilha <=0 then
    Begin
        Result := False;
        Exit;
    End;
  FuncaoGeral.ArrumaHistorico(shistorico1,shist1,shist2,shist3,shist4,shist5);

  liplanilha:=  LancaContab(True,'BaseDados',                                // alias do bde
                 datalanc,                                  // data de lançamento
                 Smodulo,                                       // número do sistema de origem - tabela MODULO
                 '1',                                       // tipo de lançamento débito = 0 e crédito = 1  e ambos = 2
                 'C',                                       // débito-crédito
                 Sconversao,                                // tipo de conversão
                 Sconversao,
                 Sconversao,
                 Sconversao,
                 'O',                                       // origem da aplicação a débito
                 // 'N',                                       // mutações PL
                 Sconversao,                                // tipo de conversão a credito
                 Sconversao,
                 Sconversao,
                 Sconversao,
                 'O',                                       // origem da aplicação a débito
                 //'N',                                       // mutações PL
                 Copy(sdocumento,1,15),                                // Número do documento
                 shist1,
                 shist2,
                 shist3,
                 shist4,
                 shist5,
                 '03',                                      // grupo (tipo de operação - tabela tipooper
                 '',                                        // ccusto a débito
                 '',                                        // conta contábil a débito
                 Sccustoc,                                  // ccusto a crédito
                 Scontacred,                                // conta contábil a crédito
                 iexercicio,                                // exercício (perexercício)
                 iperiodo,                                  // pernumero (tabperiodo)
                 Sistema.idempresa,                     // pessoa
                 Sistema.idusuario,                     // usuario
                 IntegraBack.Plano ,                           // plano
                 rvalorlanc,                                // valor do lançamento
                 0,                                         // valor do lançamento a débito moeda oficial
                 0,                                         // valor do lançamento a débito moeda gerencial 1
                 0,                                         // valor do lançamento a débito moeda gerencial 2
                 0,                                         // valor do lançamento a débito moeda gerencial 3
                 0,                                         // valor do lançamento a crédito moeda oficial
                 0,                                         // valor do lançamento a crédito moeda gerencial 1
                 0,                                         // valor do lançamento a crédito moeda gerencial 2
                 0,                                         // valor do lançamento a crédito moeda gerencial 3
                 Sabc,                                      // unidade de negocio
                 false,                                     // bjunta = false
                 0,                                         // valor do lancamento em moeda historica
                 0,                                         // valor do lancamento em moeda
                 '',                                        // subconta debito
                 sSubContaC,                                // subconta credito
                 '',  // acrescentei
                 '',  // acrescentei
                 liplanilha, sMens,IntegraBack.MascaraPlano,True,0,-1,-1,False);
  if liplanilha <=0 then
    Begin
        Result := False;
        Exit;
    End;

end;

function TContabilizacao.gera_periodo(datalanc:string;var iperiodo : integer; var iexercicio : integer;iempresa:integer):Integer;
var sMens : String;
begin
    Result := TestaPeriodo(True,'BaseDados',datalanc,'3',iexercicio,iperiodo,iempresa,sMens);
end;

Procedure TContabilizacao.gera_lanca_contadeb(Shistorico1,sdocumento,sabc,datalanc,Sccusto,
                                         Scontadeb,sconversao:string;rvalorlanc:real;
                                         iempresa,iperiodo,iexercicio : integer;
                                         iCodSubContaD:LongInt;
                                         var liplanilha:LongInt);

var
   sMens, smodulo,shist1,shist2,shist3,shist4,shist5,sSubContaD : string;
begin
  if Sconversao <> 'N' then
       Sconversao := '';

    if IntegraBack.RecPag = 'P' then
       Smodulo := '3'
    else
       Smodulo := '4';

    sSubContaD:='';
    if iCodSubContaD > 0 then
       sSubContaD:=IntToStr(iCodSubContaD);

  FuncaoGeral.ArrumaHistorico(shistorico1,shist1,shist2,shist3,shist4,shist5);

  liplanilha:=   LancaContab(True,'BaseDados',                               // alias do bde
                            datalanc,                                  // data de lançamento
                            Smodulo,                                       // número do sistema de origem - tabela MODULO
                            '0',                                       // tipo de lançamento débito = 0 e crédito = 1  e ambos = 2
                            'D',                                       // débito-crédito
                            Sconversao,                                // tipo de conversão
                            Sconversao,
                            Sconversao,
                            Sconversao,
                            'O',                                       // origem da aplicação a débito
                            //'N',                                       // mutações PL
                            Sconversao,                                // tipo de conversão a credito
                            Sconversao,
                            Sconversao,
                            Sconversao,
                            'O',                                       // origem da aplicação a débito
                            //'N',                                       // mutações PL
                            Copy(sdocumento,1,15),                                // Número do documento
                            shist1,
                            shist2,
                            shist3,
                            shist4,
                            shist5,
                            '03',                                      // grupo (tipo de operação - tabela tipooper
                            Sccusto,                                   // ccusto a débito
                            Scontadeb,                                 // conta contábil a débito
                            '',                                        // ccusto a crédito
                            '',                                        // conta contábil a crédito
                            iexercicio,                                // exercício (perexercício)
                            iperiodo,                                  // pernumero (tabperiodo)
                            Sistema.idempresa,                     // pessoa
                            Sistema.idusuario,                     // usuario
                            IntegraBack.Plano ,                           // plano
                            rvalorlanc,                                // valor do lançamento
                            0,                                         // valor do lançamento a débito moeda oficial
                            0,                                         // valor do lançamento a débito moeda gerencial 1
                            0,                                         // valor do lançamento a débito moeda gerencial 2
                            0,                                         // valor do lançamento a débito moeda gerencial 3
                            0,                                         // valor do lançamento a crédito moeda oficial
                            0,                                         // valor do lançamento a crédito moeda gerencial 1
                            0,                                         // valor do lançamento a crédito moeda gerencial 2
                            0,                                         // valor do lançamento a crédito moeda gerencial 3
                            Sabc,                                      // unidade de negocio
                            false,                                     // bjunta = false
                            0,                                         // valor do lancamento em moeda historica
                            0,                                         // valor do lancamento em moeda
                            sSubContaD,                                // subconta debito
                            '',                                        // subconta credito
                            '',  // acrescentei
                            '',  // acrescentei
                            liplanilha, sMens,IntegraBack.MascaraPlano,True,0,-1,-1,False)

end;

Procedure TContabilizacao.gera_lanca_contacred(Shistorico1,sdocumento,sabc,datalanc,Sccusto,
                                         Scontacred,sconversao:string;rvalorlanc:real;
                                         iempresa,iperiodo,iexercicio : integer;
                                         iCodSubContaC:LongInt;
                                         var liplanilha:LongInt);
var
    sMens, Smodulo,shist1,shist2,shist3,shist4,shist5,sSubContaC : string;

begin
    if Sconversao <> 'N' then
       Sconversao := '';

    if IntegraBack.RecPag = 'P' then
       Smodulo := '3'
    else
       Smodulo := '4';
    sSubContaC:='';
    if iCodSubContaC > 0 then
       sSubContaC:=IntToStr(iCodSubContaC);

    FuncaoGeral.ArrumaHistorico(shistorico1,shist1,shist2,shist3,shist4,shist5);

    liplanilha:= LancaContab(True,'BaseDados',                                // alias do bde
                              datalanc,                                  // data de lançamento
                              Smodulo,                                       // número do sistema de origem - tabela MODULO
                              '1',                                       // tipo de lançamento débito = 0 e crédito = 1  e ambos = 2
                              'C',                                       // débito-crédito
                              Sconversao,                                // tipo de conversão
                              Sconversao,
                              Sconversao,
                              Sconversao,
                              'O',                                       // origem da aplicação a débito
                              //'N',                                       // mutações PL
                              Sconversao,                                // tipo de conversão a credito
                              Sconversao,
                              Sconversao,
                              Sconversao,
                              'O',                                       // origem da aplicação a débito
                              //'N',                                       // mutações PL
                              Copy(sdocumento,1,15),                                // Número do documento
                              shist1,
                              shist2,
                              shist3,
                              shist4,
                              shist5,
                              '03',                                      // grupo (tipo de operação - tabela tipooper
                              '',                                        // ccusto a débito
                              '',                                        // conta contábil a débito
                              Sccusto,                                   // ccusto a crédito
                              Scontacred,                                // conta contábil a crédito
                              iexercicio,                                // exercício (perexercício)
                              iperiodo,                                  // pernumero (tabperiodo)
                              Sistema.idempresa,                     // pessoa
                              Sistema.idusuario,                     // usuario
                              IntegraBack.Plano ,                           // plano
                              rvalorlanc,                                // valor do lançamento
                              0,                                         // valor do lançamento a débito moeda oficial
                              0,                                         // valor do lançamento a débito moeda gerencial 1
                              0,                                         // valor do lançamento a débito moeda gerencial 2
                              0,                                         // valor do lançamento a débito moeda gerencial 3
                              0,                                         // valor do lançamento a crédito moeda oficial
                              0,                                         // valor do lançamento a crédito moeda gerencial 1
                              0,                                         // valor do lançamento a crédito moeda gerencial 2
                              0,                                         // valor do lançamento a crédito moeda gerencial 3
                              Sabc,                                      // unidade de negocio
                              false,                                     // bjunta = false
                              0,                                         // valor do lancamento em moeda historica
                              0,                                         // valor do lancamento em moeda
                              '',                                        // subconta debito
                              sSubContaC,                                // subconta credito
                              '',  // acrescentei
                              '',  // acrescentei
                              liplanilha, sMens,IntegraBack.MascaraPlano,True,0,-1,-1,False);

end;

Function TDocumento.baixa_documento(qry: TwwQuery;icodocumento:integer):Boolean;
var
  sSql, sStatus:String;
  rSaldo,rSaldoOutraMoeda, rValorZero:Real;
begin
  rValorZero := 0;

  Saldo.GetSaldoDoc(icodocumento,'',IntegraBack.RecPag,rSaldo,rSaldoOutraMoeda);
  Result := False;

  if Format('%17.2f',[rSaldo]) <> Format('%17.2f',[rValorZero]) then
     sStatus:='0'
  else
  Begin
     Result := True;
     sStatus:='2';
  End;

  sSql := 'UPDATE DOCUMENTO SET STATUS = '''+sStatus+''' WHERE CODDOCUMENTO = '+IntToStr(icodocumento);

  If Not ExecutarQuery(Qry,sSql) Then
     Raise EdataBaseError.Create('Erro ao alterar status do documento ' + IntToStr(icodocumento));
end;

Procedure TDocumento.baixa_lote(qry: TwwQuery;icodocumento:integer);
Var
  sSql: String;
begin
  sSql := 'UPDATE LOTEXDOCUM SET FLGBAIXA= ''B'' WHERE CODDOCUMENTO = '  + InttoStr(icodocumento);
  If Not ExecutarQuery(Qry,sSql) Then
     Raise EdataBaseError.Create('Erro ao marcar o documento ' + IntToStr(icodocumento) + ' como baixado');
end;

Procedure TDocumento.baixa_adiantamento(qry: TwwQuery;icodocumento, iPlnCodigo:integer; sDataLancto :String);
Var sDebCre, sSql: String;
begin
    sSql := 'UPDATE DOCUMENTO SET STATUS = ''0'', OPERACAO = ''15'' WHERE CODDOCUMENTO = '+ InttoStr(icodocumento) + ' AND OPERACAO = ''14''';
    If Not ExecutarQuery(qry,sSQL) Then
       Raise EdataBaseError.Create('Erro ao marcar o adiantamento ' + IntToStr(icodocumento) + ' como adiantamento baixado');

    If IntegraBack.RecPag = 'R' Then
      sDebCre := 'C'
    Else
      sDebCre := 'D';

    If iPlnCodigo > 0 Then
       sSql := 'UPDATE LANCTODOCUM SET OPERACAO = ''15'', DATALANCTO = TO_DATE(''' + sDataLancto + ''',''DD\MM\YYYY''), DEBCRE = ''' + sDebCre + ''', PLNCODIGO = ' + IntToStr(iPlnCodigo) + ' WHERE CODDOCUMENTO = '+ InttoStr(icodocumento) + ' AND OPERACAO = ''14'''
    Else
       sSql := 'UPDATE LANCTODOCUM SET OPERACAO = ''15'', DATALANCTO = TO_DATE(''' + sDataLancto + ''',''DD\MM\YYYY''), DEBCRE = ''' + sDebCre + '''  WHERE CODDOCUMENTO = '+ InttoStr(icodocumento) + ' AND OPERACAO = ''14''';

    If Not ExecutarQuery(Qry,sSQL) Then
       Raise EdataBaseError.Create('Erro ao marcar o lancamento do adiantamento ' + IntToStr(icodocumento) + ' como baixado');
end;

Procedure TDocumento.baixa_lotepagto(qry: TwwQuery;Snumlote:string);
Var
   sSql: String;
begin
   // Atualiza Status do LotePagto
   sSql := 'UPDATE LOTEPAGTO SET FLAGCANCEL = ''B'' WHERE NUMLOTE = '+ Snumlote;
   If Not ExecutarQuery(Qry,sSql) Then
      Raise EdataBaseError.Create('Erro ao marcar o lote ' + sNumLote + ' como baixado');
end;

Procedure TDocumento.Informa_Planilha(qry:TwwQuery;iplanilha:longint;icodigo,inumlancto:integer);
Var
  sSql: String;
begin
   // Atualiza Status do LotePagto
   If icodigo = null Then
      sSql := ' UPDATE LANCTODOCUM SET PLNCODIGO = '+ inttostr(iplanilha) +
              ' WHERE coddocumento = null and  '  +
              '       numlancto    = '+ inttostr(inumlancto)
   Else
      sSql := ' UPDATE LANCTODOCUM SET PLNCODIGO = '+ inttostr(iplanilha) +
              ' WHERE coddocumento = '+ inttostr(icodigo)  + ' and  '  +
              '       numlancto    = '+ inttostr(inumlancto);
   If Not ExecutarQuery(Qry,sSql) Then
     Raise EdataBaseError.Create('Erro ao informar planilha ' + IntToStr(iPlanilha) + ' para do documento ' + IntToStr(icodigo));
end;

Function TForCli.CriaPessoa(sNome, sRazaoSocial, sDocumento:String): longint;
Var
  iIdPessoa: Integer;
Begin
  iIdPessoa := LeultRegistro(nil,'PESSOA');
  If ExecutarQuery(dtmBaseDados.qry,'INSERT INTO PESSOA (IDPESSOA, NOME, RAZAOSOCIAL, NUMDOCUMENTO) VALUES (' +
                                IntToStr(iIdPessoa) + ',''' + sNome + ''',''' + sRazaoSocial + ''',''' + sDocumento+ ''')')
  Then
    Result := iIdPessoa
  Else
    Result := -1;
End;

function TForCli.Inserir(ipessoa,iempresacc,icodsubconta,iplano,iramotipocli,autorizacaoidempresa : integer;
                     sccusto,scontacadianto,scontacforn,scontacdespesa,sforncli : string;
                     bExibeMensagem: Boolean):Boolean;
var
   sSQL, sNome, sRazaoSocial : string;
Begin
  Result := True;
  Try
    sSql := ' select nome, razaosocial from pessoa where  idpessoa = ' + inttostr(ipessoa);
    sNome          := '';
    sRazaoSocial   := '';

    If FazQuery(dtmBaseDados.qry,sSql) Then
    Begin
        sNome          := dtmBaseDados.qry.FieldByName('NOME').AsString;
        sRazaoSocial   := dtmBaseDados.qry.FieldByName('RAZAOSOCIAL').AsString;

        try
            If (sforncli = 'F') then
            Begin
               If Not FazQuery(dtmBaseDados.qry,'SELECT IDPESSOA FROM EMPRESAFORN WHERE IDPESSOA =  ' + IntToStr(iempresacc) + ' AND IDFORCLI = ' + IntToStr(ipessoa)) Then
                  CriaFornecedor(ipessoa,iempresacc,icodsubconta,iplano,iramotipocli,autorizacaoidempresa,
                                 sccusto,scontacadianto,scontacforn,scontacdespesa)
               Else
               Begin
                  If bExibeMensagem Then
                     MsgDlg('Fornecedor\Favorecido Ja Exite para esta empresa','Erro',mtWarning,[mbOk],0);
                  Result := False;
               End;
            End
            Else
             If (sforncli = 'C')then
             Begin
                If Not FazQuery(dtmBaseDados.qry,'SELECT IDPESSOA FROM EMPRESACLIENTE WHERE IDPESSOA =  ' + IntToStr(iempresacc) + ' AND IDFORCLI = ' + IntToStr(ipessoa)) Then
                   CriaCliente(ipessoa,iempresacc,icodsubconta,iplano,iramotipocli,autorizacaoidempresa,
                               sccusto,scontacadianto,scontacforn,scontacdespesa)
               Else
               Begin
                  If bExibeMensagem Then
                     MsgDlg('Cliente Ja Exite para esta empresa','Erro',mtWarning,[mbOk],0);
                  Result := False;
               End;
             End;
        except
            Raise;
        End;

        If (sRazaoSocial = '') And (sNome <> '') Then
           If Not ExecutarQuery(dtmBaseDados.Qry,'UPDATE PESSOA SET RAZAOSOCIAL = NOME WHERE IDPESSOA = ' + inttostr(ipessoa)) Then
              Raise EdataBaseError.Create('Erro ao atualizar razao social para a pessoa ' + IntToStr(ipessoa));

        If (sRazaoSocial <> '') And (sNome = '') Then
            If Not ExecutarQuery(dtmBaseDados.Qry,'UPDATE PESSOA SET NOME = RAZAOSOCIAL WHERE IDPESSOA = ' + inttostr(ipessoa)) Then
               Raise EdataBaseError.Create('Erro ao atualizar o nome para a pessoa ' + IntToStr(ipessoa));
    End
    Else
    Begin
      If bExibeMensagem Then
      Begin
        If iPessoa = 0 Then
           MsgDlg('Falta Identificação','Erro',mtWarning,[mbOk],0)
        Else
           MsgDlg('Identificação não cadastrada','Erro',mtWarning,[mbOk],0);
      End;
      Result := False;
    End;
  Except
    On E:Exception do
    Begin
       If bExibeMensagem Then MsgDlg(E.Message,'Erro',mtWarning,[mbOk],0);
       Abort;
    End;
  End;
End;

Procedure TForCli.CriaFornecedor(ipessoa,iempresacc,icodsubconta,iplano,iramotipocli,autorizacaoidempresa : integer;
                                   sccusto,scontacadianto,scontacforn,scontacdespesa:string);
begin
   criafornserv(ipessoa);
   criaempforn(ipessoa,autorizacaoidempresa,iempresacc,iplano,icodsubconta,
               sccusto,scontacadianto,scontacdespesa,scontacforn);
   if iramotipocli > 0 then
      criaramotipocli(ipessoa,iramotipocli);
end;


procedure TForCli.criafornserv(ipessoa:integer);
begin
  If Not FazQuery(dtmBaseDados.qry,'SELECT IDPESSOA FROM FORNSERV WHERE IDPESSOA = ' + IntToStr(ipessoa)) Then
     If Not ExecutarQuery(dtmBaseDados.qry,'INSERT INTO FORNSERV (IDPESSOA,FLGASS) VALUES (' + IntToStr(ipessoa) +
                                    ','+inttostr(0) + ')') Then
        Raise EdataBaseError.Create('Erro ao criar fornecedor ' + IntToStr(ipessoa));
end;

procedure TForCli.criaempforn(ipessoa,autorizacaoidempresa,iempresacc,iplano,icodsubconta: integer;
                                 sccusto,scontacadianto,scontacdespesa,scontacforn:string);
Var
  sSql,sSqlInc : string;
begin
  If Not FazQuery(dtmBaseDados.qry,'SELECT IDFORCLI FROM EMPRESAFORN WHERE IDFORCLI = ' + IntToStr(ipessoa) +
                                   ' AND IDPESSOA = ' + inttostr(autorizacaoidempresa)) Then
  Begin
    sSql := 'INSERT INTO EMPRESAFORN(IDFORCLI,IDPESSOA,IDEMPRESA,CODCENTROCUSTO,         '+
            '                        CODSUBCONTA,PLANO,CONTACADIANTAMENTO,CONTACDESPESA, '+
            '                        CONTACFORN) VALUES (';

    sSqlInc := IntToStr(ipessoa);
    sSqlInc := sSqlInc + ','+inttostr(autorizacaoidempresa);

    If iempresacc > 0 Then
        sSqlInc := sSqlInc + ','+inttostr(iempresacc)
    Else
         sSqlInc := sSqlInc + ', null';

    if   Sccusto = ''
    then sSqlInc := sSqlInc + ',NULL'
    else sSqlInc := sSqlInc + ','''+Sccusto+'''';

    If icodsubconta > 0 Then
       sSqlInc := sSqlInc + ','+inttostr(icodsubconta)
    Else
       sSqlInc := sSqlInc + ', null';

    sSqlInc := sSqlInc + ','+inttostr(iplano);

    if   scontacadianto = ''
    then sSqlInc := sSqlInc + ',NULL'
    else sSqlInc := sSqlInc + ','''+scontacadianto+'''';

    if   scontacdespesa = ''
    then sSqlInc := sSqlInc + ',NULL'
    else sSqlInc := sSqlInc + ','''+scontacdespesa+'''';

    if   scontacforn = ''
    then sSqlInc := sSqlInc + ',NULL'
    else sSqlInc := sSqlInc + ','''+scontacforn+'''';

    sSql := sSql + sSqlInc + ')';

    If Not ExecutarQuery(dtmBaseDados.qry,sSql) Then
       Raise EdataBaseError.Create('Erro ao criar fornecedor ' + IntToStr(ipessoa) + ' para a empresa ' + IntToStr(autorizacaoidempresa));
  End;
end;

procedure TForCli.criaramotipocli(ipessoa,iramotipocli:integer);
begin
  If Not FazQuery(dtmBaseDados.qry,'SELECT IDPESSOA FROM FORNXRAMO WHERE IDPESSOA = ' + IntToStr(ipessoa) +
                                   ' AND IDRAMOFORNECEDOR = ' + inttostr(iramotipocli)) Then
    If Not ExecutarQuery(dtmBaseDados.qry,'INSERT INTO FORNXRAMO (IDPESSOA,IDRAMOFORNECEDOR) VALUES (' +
                         IntToStr(ipessoa) + ','+inttostr(iramotipocli) + ')') Then
           Raise EdataBaseError.Create('Erro ao inserir ramo para o fornecedor ' + IntToStr(ipessoa));                         
end;

Procedure TForCli.CriaCliente(ipessoa,iempresacc,icodsubconta,iplano,iramotipocli,autorizacaoidempresa : integer;
                                     sccusto,scontacadianto,scontacforn,scontacdespesa:string);
begin
   criaclientepess(ipessoa,iramotipocli);
   criaempcli(ipessoa,autorizacaoidempresa,iempresacc,iplano,icodsubconta,
              sccusto,scontacadianto,scontacdespesa,scontacforn);
end;


procedure TForCli.criaclientepess(ipessoa,iramotipocli :integer);
var
     sSql,sSqlInc : string;
begin
  If Not FazQuery(dtmBaseDados.qry,'SELECT IDPESSOA FROM CLIENTEPESS WHERE IDPESSOA = ' + IntToStr(ipessoa)) Then
  Begin
   sSql := 'INSERT INTO CLIENTEPESS(IDPESSOA,IDTIPOCLIENTE) VALUES (';
   sSqlInc := IntToStr(ipessoa);
   sSqlInc := sSqlInc + ','+inttostr(iramotipocli);
   sSql := sSql + sSqlInc + ')';
   If Not ExecutarQuery(DtmBaseDados.Qry,sSql) Then
      Raise EdataBaseError.Create('Erro ao criar cliente ' + IntToStr(ipessoa));
  End;
end;

procedure TForCli.criaempcli(ipessoa,autorizacaoidempresa,iempresacc,iplano,icodsubconta: integer;
                                sccusto,scontacadianto,scontacdespesa,scontacforn:string);
Var
  sSql,sSqlInc : string;
begin
  If Not FazQuery(dtmBaseDados.qry,'SELECT IDFORCLI FROM EMPRESACLIENTE WHERE IDFORCLI = ' + IntToStr(ipessoa) +
                                   ' AND IDPESSOA = ' + inttostr(autorizacaoidempresa)) Then
  Begin
    sSql := 'INSERT INTO EMPRESACLIENTE(IDFORCLI,IDPESSOA,IDEMPRESA,CODCENTROCUSTO,         '+
            '                           CODSUBCONTA,PLANO,CONTACADIANTAMENTO,CONTACRECEITA, '+
            '                           CONTACCLIENTE) VALUES (';
    sSqlInc := IntToStr(ipessoa);
    sSqlInc := sSqlInc + ','+inttostr(autorizacaoidempresa);

    If iempresacc > 0 Then
       sSqlInc := sSqlInc + ','+inttostr(iempresacc)
    Else
       sSqlInc := sSqlInc + ', null';

    if   Sccusto = ''
    then sSqlInc := sSqlInc + ',NULL'
    else sSqlInc := sSqlInc + ','''+Sccusto+'''';

    if iCodsubconta = -1 Then
       sSqlInc := sSqlInc + ',NULL'
    Else
       sSqlInc := sSqlInc + ','+inttostr(icodsubconta);

    if iPlano = -1 Then
       sSqlInc := sSqlInc + ',NULL'
    Else
       sSqlInc := sSqlInc + ','+inttostr(iplano);

    if   scontacadianto = ''
    then sSqlInc := sSqlInc + ',NULL'
    else sSqlInc := sSqlInc + ','''+scontacadianto+'''';

    if   scontacdespesa = ''
    then sSqlInc := sSqlInc + ',NULL'
    else sSqlInc := sSqlInc + ','''+scontacdespesa+'''';

     if  scontacforn = ''
    then sSqlInc := sSqlInc + ',NULL'
    else sSqlInc := sSqlInc + ','''+scontacforn+'''';

    sSql := sSql + sSqlInc + ')';

    If Not ExecutarQuery(DtmBaseDados.Qry,sSql) Then
      Raise EdataBaseError.Create('Erro ao criara cliente ' + IntToStr(ipessoa) + ' para a empresa ' + IntToStr(autorizacaoidempresa));
  End;
end;

procedure TDocumento.EstornoCAPCAR(sDataEstorno:String;var iCodAnterior, iNumLanc,iCodDocumento:integer);
var
  qry,qry1,qryContabil,qryFinanc,qryFinanc1:TwwQuery;
  sEntradaSaida,sDebCre,sSql: String;
  iNumLancto,iPlnCodigoOri: Integer;
  liExercicio,liPeriodo, iEmpresaProp,liRetFuncao:Integer;
  iNumLote,iPlnCodigoP,iCodLancFinanc,iPlnCodigo:Integer;
Begin
  qry :=TwwQuery.Create(Application);
  qry.DatabaseName  := 'BASEDADOS';
  qry1 :=TwwQuery.Create(Application);
  qry1.DatabaseName  := 'BASEDADOS';
  qryContabil :=TwwQuery.Create(Application);
  qryContabil.DatabaseName  := 'BASEDADOS';
  qryFinanc :=TwwQuery.Create(Application);
  qryFinanc.DatabaseName  := 'BASEDADOS';
  qryFinanc1 :=TwwQuery.Create(Application);
  qryFinanc1.DatabaseName  := 'BASEDADOS';
Try
  //
  iCodLancFinanc:=0;
  iPlnCodigo:=0;
  //
  If iNumLanc  = 0 then
  Begin
     AlteraStatusOrcamento(iCodAnterior,'A');
     qry.Close;
     qry.SQL.text :='SELECT ' +
                    ' L.DEBCRE, L.PLNCODIGO,R.CODLANCFINANC, L.VALOR, L.VALOROUTRAMOEDA, ' +
                    ' L.NUMLANCTO, L.OPERACAO, L.HISTORICOCOMPL, R.CODPORTFORMA, R.NUMLOTE, ' +
                    ' R.NUMCHQBORDERO, L.CODALTERADOR ' +
                    'FROM LANCTODOCUM L,RECBTOPAGTO R '+
                    ' WHERE L.CODDOCUMENTO = '+InttoStr(iCodAnterior)+
                    ' AND L.CODDOCUMENTO = R.CODDOCUMENTO(+)'+
                    ' AND L.NUMLANCTO = R.NUMLANCTO(+) AND L.ESTORNO IS NULL';
     qry.Open;
  end
  else
  Begin
     qry.Close;
     qry.SQL.text :='SELECT ' +
                    ' L.DEBCRE, L.PLNCODIGO,R.CODLANCFINANC, L.VALOR, L.VALOROUTRAMOEDA, ' +
                    ' L.NUMLANCTO, L.OPERACAO, L.HISTORICOCOMPL, R.CODPORTFORMA, R.NUMLOTE, ' +
                    ' R.NUMCHQBORDERO, L.CODALTERADOR ' +
                    ' FROM LANCTODOCUM L,RECBTOPAGTO R ' +
                    ' WHERE L.CODDOCUMENTO = '+InttoStr(iCodAnterior)+
                    ' AND L.NUMLANCTO = '+InttoStr(iNumLanc)+
                    ' AND L.CODDOCUMENTO = R.CODDOCUMENTO(+)'+
                    ' AND L.NUMLANCTO = R.NUMLANCTO(+) AND L.ESTORNO IS NULL';
     qry.Open;
  end;

  qry.First;
  while not qry.Eof do
  Begin
     if qry.FieldByName('CODLANCFINANC').AsInteger <> 0 then
     Begin
        //
        qryFinanc.Close;
        qryFinanc.SQL.text :='SELECT CODLANCFINANC,PLNCODIGO,IDMODULO,HISTPADFINAN,MOECODIGO, ' +
                             ' IDUSUARIOINCLUSAO,CODPORTADOR,VALORLANCFINAN,NUMCHQBORDERO, ' +
                             ' DATALANCFINAN,DATACONCILIACAO,ENTRADASAIDA,HISTORICO, ' +
                             ' STATUSCONCILIA,VALOROUTRAMOEDA,IDPESSOA,CODLANCTRANSF ' +
                             ' FROM MOVIMFINANC WHERE CODLANCFINANC = '+qry.FieldByName('CODLANCFINANC').AsString;
        qryFinanc.Open;

        If qryFinanc.FieldByName('ENTRADASAIDA').AsString = 'E' then
           sEntradaSaida:='S'
        else
           sEntradaSaida:='E';

        LancFinanc.LancaFinanceiro(qryContabil,Sistema.IdModulo,qryFinanc.FieldByName('HISTPADFINAN').AsInteger,qryFinanc.FieldByName('MOECODIGO').AsInteger,
                        Sistema.IdUsuario,qryFinanc.FieldByName('CODPORTADOR').AsInteger,Sistema.IdEmpresa,
                        qryFinanc.FieldByName('VALORLANCFINAN').AsFloat,qryFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat,qryFinanc.FieldByName('NUMCHQBORDERO').AsString,
                        sDataEstorno,qryFinanc.FieldByName('DATACONCILIACAO').AsString,sEntradaSaida,
                        'ESTORNO '+qryFinanc.FieldByName('HISTORICO').AsString,qryFinanc.FieldByName('STATUSCONCILIA').AsString,iCodLancFinanc,iPlnCodigo,0);
        if iCodLancFinanc = -1 then
        Begin
           iCodDocumento:=-1;
           exit;
        end;
        qryFinanc1.Close;
        qryFinanc1.SQL.text :='SELECT IDPESSOA,CODLANCFINANC,UNIDNEGOC,CODTIPRECDES, ' +
                              'RECPAG,CODCENTRORESPON,MOECODIGO,VALOR,VALOROUTRAMOEDA, IDPROGRAMA, IDPLANOPREV, IDPATRO, CODTIPDOC ' +
                              ' FROM RATEIOFINANC WHERE CODLANCFINANC = '+qry.FieldByName('CODLANCFINANC').AsString;
        qryFinanc1.Open;
        qryFinanc1.First;
        While (not qryFinanc1.EOF) do
        Begin
           LancFinanc.LancaRateioFinanc(qryFinanc1.FieldByName('UNIDNEGOC').AsInteger,qryFinanc1.FieldByName('MOECODIGO').AsInteger,Sistema.IdEmpresa,qryFinanc.FieldByName('CODPORTADOR').AsInteger,
                 (qryFinanc1.FieldByName('VALOR').AsFloat*(-1)),(qryFinanc1.FieldByName('VALOROUTRAMOEDA').AsFloat*(-1)),qryFinanc1.FieldByName('CODTIPRECDES').AsString,
                 qryFinanc1.FieldByName('RECPAG').AsString,qryFinanc1.FieldByName('CODCENTRORESPON').AsString,sDataEstorno,iCodLancFinanc,'',
                 qryFinanc1.FieldByName('IDPROGRAMA').AsFloat, qryFinanc1.FieldByName('IDPATRO').AsFloat, qryFinanc1.FieldByName('IDPLANOPREV').AsFloat, qryFinanc1.FieldByName('CODTIPDOC').AsFloat );
           if iCodLancFinanc = -1 then
           Begin
              iCodDocumento:=-1;
              exit;
           end;
           qryFinanc1.Next;
        end;
     end;
     if qry.FieldByName('PLNCODIGO').AsInteger <> 0 then
     Begin
        //
        iPlnCodigoOri :=qry.FieldByName('PLNCODIGO').AsInteger;
        iEmpresaProp:=Sistema.IdEmpresa;
        if iPlnCodigoOri <> 0 then
        Begin
           //Exclui/Estorno contab
           liRetFuncao:=TestaPeriodo(fMostraMsgContab,'BaseDados',sDataEstorno,IntToStr(Sistema.IdModulo),liExercicio,
                                     liPeriodo,iEmpresaProp, fMsgContab);
           if liRetFuncao <> 0 then
           Begin
              iCodDocumento:=-1;
              exit;
           end;

           iPlnCodigo := EstornaLanc(fMostraMsgContab,iPlncodigoOri,'BASEDADOS',sDataEstorno,liExercicio,liPeriodo, iEmpresaProp,IntegraBack.MascaraPlano);
           Case iPlnCodigo Of
           -1:
           Begin
             iCodDocumento:=-1;
             exit;
           End;
           -2: iPlnCodigo := iPlncodigoOri;
           end;

        end;
     end;

     If qry.FieldByName('DEBCRE').AsString = 'D' then
        sDebCre:='C'
     else
        sDebCre:='D';

     iNumLancto:= GerarNumLancto(qry1,iCodAnterior);

     if iNumLancto <= 0 then
     Begin
        iCodDocumento:=-1;
        exit;
     end;

     if iPlnCodigo > 0 then
        iPlnCodigoP:=iPlnCodigo
     else
        iPlnCodigoP:=-1;

     CriarLanctoDoc(qry1,iCodAnterior,iNumLancto,qry.FieldByName('CODALTERADOR').AsInteger,iPlnCodigoP,
                    sDataEstorno,qry.FieldByName('VALOR').AsFloat, qry.FieldByName('VALOROUTRAMOEDA').AsFloat,
                    qry.FieldByName('NUMLANCTO').AsInteger,sDebCre,qry.FieldByName('OPERACAO').AsString,
                    'ESTORNO '+qry.FieldByName('HISTORICOCOMPL').AsString,Sistema.idUsuario, False, -1, '');

     if qry.FieldByName('CODPORTFORMA').AsInteger <> 0 then
     Begin
        if iCodLancFinanc = 0 then
           iCodLancFinanc := -1;
        iNumLote:=qry.FieldByName('NUMLOTE').AsInteger;
        if iNumLote = 0 then
           iNumLote:= -1;
        RecbToPagto.Inserir(qry1,iCodAnterior,iNumLancto,Sistema.idUsuario,
                         iCodLancFinanc,qry.FieldByName('CODPORTFORMA').AsInteger,iNumLote,qry.FieldByName('NUMCHQBORDERO').AsString,
                         sDataEstorno,sDataEstorno);
     end;
     //Atualiza Estorno no Lancamento Anterior
     sSql := 'UPDATE LANCTODOCUM SET ESTORNO = '+IntToStr(iNumLancto)+
             ' WHERE CODDOCUMENTO = '+IntToStr(iCodAnterior)+
             ' AND NUMLANCTO = '+qry.FieldByName('NUMLANCTO').AsString;
     qry1.close;
     qry1.SQL.Text := sSQL;
     qry1.ExecSQL;
     qry1.Close;
     qry.Next;
  end;

  baixa_documento(qry1,iCodAnterior);

Finally
  qry.Free;
  qry1.Free;
  qryContabil.Free;
  qryFinanc.Free;
  qryFinanc1.Free;
End;

end;

Procedure TRecbtoPagto.Excluir(qry:TwwQuery;iCodDocumento,iNumLancto:integer);
Begin
  If Qry.Active Then Qry.Close;
  Qry.SQL.Text := 'DELETE FROM RECBTOPAGTO WHERE CODDOCUMENTO = '+InttoStr(iCodDocumento)+
                  ' AND NUMLANCTO = '+InttoStr(iNumLancto);
  Qry.ExecSQL;
end;

Procedure TDocumento.Cancelabaixa_adiantamento(qry: TwwQuery;icodocumento,iNumLancto:integer);
Var sDebCre, sSql: String;
begin
    sSql := 'UPDATE DOCUMENTO SET STATUS = ''0'', OPERACAO = ''14'' WHERE CODDOCUMENTO = ' + InttoStr(icodocumento) +  ' AND OPERACAO = ''15''';
    If Not ExecutarQuery(qry,sSql) Then
       Raise EdataBaseError.Create('Erro ao cancelar baixa do adiantamento ' + IntToStr(icodocumento));

    If IntegraBack.RecPag = 'R' Then
      sDebCre := 'D'
    Else
      sDebCre := 'C';

    sSql := 'UPDATE LANCTODOCUM SET OPERACAO = ''14'', PLNCODIGO = NULL ,DEBCRE = ''' + sDebCre + ''' WHERE CODDOCUMENTO = '+ InttoStr(icodocumento) + ' AND OPERACAO = ''15''';

    If Not ExecutarQuery(qry,sSQL) Then
       Raise EdataBaseError.Create('Erro ao alterar lancamento de cancelamento de baixa para o adiantamento ' + IntToStr(icodocumento));

    sSql := 'Delete From RECBTOPAGTO Where CodDocumento = '+IntToStr(icodocumento)+
            ' and NumLancto = '+IntToStr(iNumLancto);
    If Not ExecutarQuery(qry,sSql) Then
       Raise EdataBaseError.Create('Erro ao excluir recebimento para o adiantamento ' + IntToStr(icodocumento));   
end;

Procedure TDocumento.LiberaEmissaoLote(qry: TwwQuery;iNumLote:integer;bExcluiLote:Boolean);
Var sSql: String;
begin
 If bExcluiLote Then
 Begin
   sSql := 'DELETE LOTEXDOCUM WHERE NUMLOTE = '+ IntToStr(inumlote);
   If Not ExecutarQuery(Qry,sSql) Then
      Raise EdataBaseError.Create('Erro ao excluir documentos do lote ' + IntToStr(iNumLote) + ' para serem reemitidos');

   sSql := 'DELETE LOTEPAGTO WHERE NUMLOTE = '+ IntToStr(inumlote);
   If Not ExecutarQuery(Qry,sSql) Then
      Raise EdataBaseError.Create('Erro ao excluir lote ' + IntToStr(iNumLote));
 End
 Else
 Begin
   sSql := 'UPDATE LOTEPAGTO SET FLAGCANCEL = NULL, FLAGEMISSAO = NULL WHERE NUMLOTE = '+ IntToStr(inumlote);
   If Not ExecutarQuery(Qry,sSql) Then
      Raise EdataBaseError.Create('Erro ao liberar documentos do lote ' + IntToStr(iNumLote) + ' para serem reemitidos ');

   sSql := 'UPDATE LOTEXDOCUM SET FLGBAIXA = NULL WHERE NUMLOTE = '+ IntToStr(inumlote);
   If Not ExecutarQuery(Qry,sSql) Then
      Raise EdataBaseError.Create('Erro ao liberar o lote ' + IntToStr(iNumLote) + ' para reemissão');
 End;

End;

Procedure TDocumento.RegularizaAdto(iCodDocDoc,iCodDocAdto:LongInt;sDataRegu,sDocumDoc,sDocumAdto,sNomeCliFor:String;rValor:Real);
Var sDebCre :String;
    iPlnCodigoP, iNumLancto :LongInt;
    qryAuxFuncao:TwwQuery;
Begin
  qryAuxFuncao :=TwwQuery.Create(Application);
  Try
     qryAuxFuncao.DatabaseName  := 'BASEDADOS';

     //Criar Adiantamento no Documento
     iNumLancto := GerarNumLancto(nil,iCodDocDoc);

     iPlnCodigoP := 0;

     if IntegraBack.RecPag = 'R' then
        sDebCre:='C'
     else
        sDebCre:='D';

     CriarLanctoDoc(qryAuxFuncao,iCodDocDoc,iNumLancto,-1,iPlnCodigoP,
     sDataRegu,rValor,0,-1,sDebCre,'17','',Sistema.IdUsuario, True, -1, '');

     //Criar Regularição no Adiantamento
     iNumLancto := GerarNumLancto(nil,iCodDocAdto);

     if (iNumLancto <= 0) Or (iPlnCodigoP < 0) then Abort;

     if IntegraBack.RecPag = 'R' then
        sDebCre:='D'
     else
        sDebCre:='C';

     CriarLanctoDoc(qryAuxFuncao,iCodDocAdto,iNumLancto,-1,iPlnCodigoP,
                    sDataRegu,rValor,0,-1,sDebCre,'16','',Sistema.IdUsuario, True, -1, '');
  Finally
     qryAuxFuncao.Close;
     qryAuxFuncao.Free;
  end;
end;


Procedure TDocumento.LancaRateioContab(qry: TwwQuery;
        iCodDocumento,CodAlterador: LongInt;    Var PlnCodigo: LongInt;
        DataLancto: String; Valor,ValorOutraMoeda : Real;
        DebCre,sOperacao,HistoricoCompl: String;
        iCodPortForma: LongInt; sNumChqBord: String);
Var
   sCodCentroCusto, sPlaconta, sConverte, sCliDocCompl,
   sMens,sDocCodCentroCusto, sDocPlaconta, sDocCodSubConta, sDocCompl, sHisto1C,sHisto2C,
   sHisto3C,sHisto4C,sHisto5C,sHistoricoC,sHisto1D,sHisto2D,
   sHisto3D,sHisto4D,sHisto5D,sHistoricoD,sHistorico, sCCustD, sContaD, sCCustC, sContaC,
   sSubContaC, sSubContaD, sSubContaAltPag: String;
   liExercicio,liPeriodo,liEmpresa, liUnidNegPag, liUnidNegD, liUnidNegC, liUnidNegDoc: LongInt;
   bJuntad, bJuntac, bRateiaD, bRateiaC, bLancaRateioAlterador:Boolean;
   X: Integer;
   liPlanoPrevD, liPatroD, liPlanoPrevC, liPatroC: LongInt;
   rValorD, rValorC, rValorOMD, rValorOMC : Double;
   sCodCentroCustoAlterador, sContaAlterador: String;
   QryBuscaContaAlt:TwwQuery;
Begin
   QryBuscaContaAlt := TwwQuery.Create(nil);
   Try
      QryBuscaContaAlt.DataBaseName := 'BaseDados';

      With Qry Do
      Begin
          bJuntad    := True;
          bJuntac    := True;
          //Verifica Rateio Para Contabilizar Proporcionalmente
          bLancaRateioAlterador := False;
          BuscaRateio(Qry, iCodDocumento, Valor, ValorOutraMoeda, CodAlterador, bLancaRateioAlterador);
          if Sistema.UsaPlanoPatro then
             bLancaRateioAlterador := True;
          liUnidNegPag    := 0;
          sSubContaAltPag := '';
          sHistorico      := '';
          sHistoricoD     := '';
          sHistoricoC     := '';
          sHisto1D        := '';
          sHisto2D        := '';
          sHisto3D        := '';
          sHisto4D        := '';
          sHisto5D        := '';
          sHisto1C        := '';
          sHisto2C        := '';
          sHisto3C        := '';
          sHisto4C        := '';
          sHisto5C        := '';


          //Busca Parâmetros Contábeis do Documento
          If Not FazQuery(Qry,'SELECT D.NODOCUMENTO, D.COMPLDOCUMENTO, D.CODSUBCONTA, ' +
                          'D.PLACONTA,D.CODCENTROCUSTO, P.RAZAOSOCIAL, L.HISTORICOCOMPL, D.UNIDNEGOC FROM DOCUMENTO D, ' +
                          'PESSOA P, LANCTODOCUM L WHERE (D.CODDOCUMENTO = ' + IntToStr(iCodDocumento) +
                          ') AND (D.IDFORCLI = P.IDPESSOA) AND (D.CODDOCUMENTO = L.CODDOCUMENTO) AND (D.OPERACAO = L.OPERACAO)') Then Abort;

          sDocCodCentroCusto  := Qry.FieldByName('CODCENTROCUSTO').AsString;
          sDocPlaconta        := Qry.FieldByName('PLACONTA').AsString;
          HistoricoCompl      := Trim(HistoricoCompl) + Trim(Qry.FieldByName('HISTORICOCOMPL').AsString);
          liUnidNegDoc        := Qry.FieldByName('UNIDNEGOC').AsInteger;

          if Qry.FieldByName('CODSUBCONTA').IsNull Then
             sDocCodSubConta := ''
          Else
             sDocCodSubConta     := Qry.FieldByName('CODSUBCONTA').AsString;

          sDocCompl           := Qry.FieldByName('NODOCUMENTO').AsString + ' ' +
                                 Qry.FieldByName('COMPLDOCUMENTO').AsString;

          sCliDocCompl        := sDocCompl + ' ' + Qry.FieldByName('RAZAOSOCIAL').AsString;

          if (Trim(sOperacao) = '4') or (Trim(sOperacao) = '16') or (Trim(sOperacao) = '17') Then //Contabiliza Alteradores e regularização de adiantamento
          Begin
             //Busca Parâmetros Contábeis do Alterador
             FazQuery(Qry,'SELECT CODCENTROCUSTO, PLACONTA, DESCRICAO, CONVERTE, CODSUBCONTA ' +
             'FROM TIPOALTERADOR WHERE CODALTERADOR = ' + IntToStr(CodAlterador));
             sCodCentroCusto := Qry.FieldByName('CODCENTROCUSTO').AsString;
             sPlaconta       := Qry.FieldByName('PLACONTA').AsString;
             sConverte       := Qry.FieldByName('CONVERTE').AsString;
             sHistorico      := Qry.FieldByName('DESCRICAO').AsString;

             If Trim(sOperacao) = '4' Then
             Begin
               sHistoricoD     := sHistorico + ' Doc. ' + trim(sCliDocCompl) + ' ' + trim(HistoricoCompl);
               sHistoricoC     := sHistoricoD;
             End
             Else
             Begin
                sHistoricoD     := 'Regularização de adiantamento doc. ' + sCliDocCompl;
                sHistoricoC     := sHistoricoD;
             End;

             //Testa a obrigatoriedade da subconta para a conta do alterador caso
             //a mesma não esteja preenchida no cadastro do alterador
             If (Qry.FieldByName('CODSUBCONTA').IsNull) And (Trim(sOperacao) = '4') Then
             Begin
                With DtmCmBackDocumento Do
                Begin
                   With QryTestaSubConta Do
                   Begin
                      If Active Then Close;
                      If Not Prepared then Prepare;
                      ParambyName('PLANO').AsFloat := IntegraBack.Plano;
                      ParambyName('PLACONTA').AsString := Espaco(sPlaconta,18);
                      Open;
                   End;

                   If QryTestaSubContaPLASUBCONTA.AsString = 'S' Then
                   Begin
                      With QryBuscaSubcDocumento Do
                      Begin
                         If Active Then Close;
                         If Not Prepared then Prepare;
                         ParambyName('CODDOCUMENTO').AsFloat := iCodDocumento;
                         Open;
                      End;
                         sSubContaAltPag :=  QryBuscaSubcDocumentoCODSUBCONTA.AsString;
                   End
                   eLSE
                      sSubContaAltPag := '';

                   If QryTestaSubConta.Active Then QryTestaSubConta.Close;
                   If QryBuscaSubcDocumento.Active Then QryBuscaSubcDocumento.Close;
                End;
             End
             Else
               sSubContaAltPag := Qry.FieldByName('CODSUBCONTA').AsString;
             //Fim da Alteração da SubConta;

             liUnidNegPag    := 0;
          End;
          // Fin tratanento para alterador
          if (Trim(sOperacao) = '5') Or (Trim(sOperacao) = '15') Then //Contabiliza Baixa
          Begin
             //Busca Parâmetros Contábeis do Banco
             FazQuery(Qry,'SELECT F.DESCRICAO, P.PLACONTA, P.CODCENTROCUSTO, P.CODSUBCONTA, P.UNIDNEGOC, P.DESCFINAN FROM ' +
                          ' PORTADORFORMA P, FORMARECPAG F WHERE ' +
                          ' (P.CODFORMA = F.CODFORMA) AND (P.CODPORTFORMA = ' +
                          IntToStr(iCodPortForma) + ')');

             sCodCentroCusto := Qry.FieldByName('CODCENTROCUSTO').AsString;

             If fContabaixa <> '' Then
                sPlaconta := fContabaixa
             Else
                sPlaconta := Qry.FieldByName('PLACONTA').AsString;

             sConverte       := 'N';

             If fSubContaBaixa <> 0 Then
                sSubContaAltPag := IntToStr(fSubContaBaixa)
             Else
                sSubContaAltPag := Qry.FieldByName('CODSUBCONTA').AsString;

             liUnidNegPag    := Qry.FieldByName('UNIDNEGOC').AsInteger;

             If Qry.FieldByName('DESCFINAN').IsNull Then
             Begin
                If IntegraBack.EstornaDocumento Then
                   sHistorico      := 'Estorno ' + Qry.FieldByName('DESCRICAO').AsString+ ' Nº ' + sNumChqBord
                Else
                   sHistorico      := Qry.FieldByName('DESCRICAO').AsString+ ' Nº ' + sNumChqBord;
             End
             Else
             Begin
                If IntegraBack.EstornaDocumento Then
                   sHistorico      := 'Estorno ' + Qry.FieldByName('DESCFINAN').AsString + ' Nº ' + sNumChqBord
                Else
                   sHistorico      := Qry.FieldByName('DESCFINAN').AsString + ' Nº ' + sNumChqBord;
             End;

             sDocCompl       := sNumChqBord;

             //Monta Histórico de Acordo Com o DebCre e seta se os lançamentos serão na
             //Feitos na Mesma planilha ou não
             If DebCre = 'C' Then
             begin
                 sHistoricoD:=sHistorico;
                 sHistoricoC:=sHistorico + ' Ref. Recebimento Doc. ' + trim(sCliDocCompl) + ' ' + trim(HistoricoCompl);
                 bJuntad    := True;
                 bJuntac    := False;
             End
             Else
             begin
                 sHistoricoC:=sHistorico;
                 sHistoricoD:=sHistorico + ' Ref. Pagamento Doc. ' + trim(sCliDocCompl) + ' ' + trim(HistoricoCompl);
                 bJuntac    := True;
                 bJuntad    := False;
             end;
          End;

          If DebCre = 'C' Then
          Begin
            sCCustD    := sCodCentroCusto;
            sContaD    := sPlaconta;
            sSubContaD := sSubContaAltPag;
            sCCustC    := sDocCodCentroCusto;
            sContaC    := sDocPlaconta;
            sSubContaC := sDocCodSubConta;
          End
          Else
          Begin
            sCCustC    := sCodCentroCusto;
            sContaC    := sPlaconta;
            sSubContaC := sSubContaAltPag;
            sCCustD    := sDocCodCentroCusto;
            sContaD    := sDocPlaconta;
            sSubContaD := sDocCodSubConta;
          End;


          FuncaoGeral.ArrumaHistorico(sHistoricoD,sHisto1D,sHisto2D,sHisto3D,sHisto4D,sHisto5D);

          FuncaoGeral.ArrumaHistorico(sHistoricoC,sHisto1C,sHisto2C,sHisto3C,sHisto4C,sHisto5C);

          liEmpresa := Sistema.IdEmpresa;

          If TestaPeriodo(fMostraMsgContab,'BaseDados',DataLancto,IntToStr(Sistema.IdModulo),
                       liExercicio,liPeriodo,liEmpresa,fMsgContab) <> 0 Then Raise EdataBaseError.Create(fMsgContab);

          rValorD   := 0;
          rValorC   := 0;
          rValorOMD := 0;
          rValorOMC := 0;
          For X:=0 To FNumRateio Do
          Begin
             if (Trim(sOperacao) = '5') Or (Trim(sOperacao) = '15') Then //Contabiliza Baixa
             Begin
                If DebCre = 'C' Then
                Begin
                  if (liUnidNegPag <> 0) And
                     ((FRateioUnid[X].IdPlanoPrev <= 0) And (FRateioUnid[X].IdPatrocinadora <= 0)) then
                  begin
                     liUnidNegD := liUnidNegPag;
                     rValorD    := rValorD   + FRateioUnid[X].rValor;
                     rValorOMD  := rValorOMD + FRateioUnid[X].rValorOM;
                     liPlanoPrevD := -1;
                     liPatroD := -1;
                     bRateiaD   := False;
                  end
                  else
                  begin
                     if (liUnidNegPag <> 0) Then
                        liUnidNegD := liUnidNegPag
                     Else
                        liUnidNegD := FRateioUnid[X].CodUnid;
                        
                     rValorD    := FRateioUnid[X].rValor;
                     rValorOMD  := FRateioUnid[X].rValorOM;
                     liPlanoPrevD := FRateioUnid[X].IdPlanoPrev;
                     liPatroD := FRateioUnid[X].IdPatrocinadora;
                     bRateiaD   := True;
                  end;

                  if (liUnidNegDoc <> 0) And
                     ((FRateioUnid[X].IdPlanoPrev <= 0) And (FRateioUnid[X].IdPatrocinadora <= 0)) Then
                  begin
                     liUnidNegC := liUnidNegDoc;
                     rValorC    := rValorC   + FRateioUnid[X].rValor;
                     rValorOMC  := rValorOMC + FRateioUnid[X].rValorOM;
                     liPlanoPrevC := -1;
                     liPatroC := -1;
                     bRateiaC   := False;
                  end
                  else
                  begin
                     if (liUnidNegDoc <> 0) Then
                        liUnidNegC := liUnidNegDoc
                     Else
                        liUnidNegC := FRateioUnid[X].CodUnid;

                     rValorC    := FRateioUnid[X].rValor;
                     rValorOMC  := FRateioUnid[X].rValorOM;
                     liPlanoPrevC := FRateioUnid[X].IdPlanoPrev;
                     liPatroC := FRateioUnid[X].IdPatrocinadora;
                     bRateiaC   := True;
                  end;
                End
                Else
                Begin
                  if (liUnidNegPag <> 0) And
                     ((FRateioUnid[X].IdPlanoPrev <= 0) And (FRateioUnid[X].IdPatrocinadora <= 0)) then
                  begin
                     liUnidNegC := liUnidNegPag;
                     rValorC    := rValorC   + FRateioUnid[X].rValor;
                     rValorOMC  := rValorOMC + FRateioUnid[X].rValorOM;
                     liPlanoPrevC := -1;
                     liPatroC := -1;
                     bRateiaC   := False;
                  end
                  else
                  begin
                     if (liUnidNegPag <> 0) Then
                        liUnidNegC := liUnidNegPag
                     Else
                        liUnidNegC := FRateioUnid[X].CodUnid;
                     rValorC    := FRateioUnid[X].rValor;
                     rValorOMC  := FRateioUnid[X].rValorOM;
                     liPlanoPrevC := FRateioUnid[X].IdPlanoPrev;
                     liPatroC := FRateioUnid[X].IdPatrocinadora;
                     bRateiaC   := True;
                  end;

                  if (liUnidNegDoc <> 0) And
                     ((FRateioUnid[X].IdPlanoPrev <= 0) And (FRateioUnid[X].IdPatrocinadora <= 0)) Then
                  begin
                     liUnidNegD := liUnidNegDoc;
                     rValorD    := rValorD   + FRateioUnid[X].rValor;
                     rValorOMD  := rValorOMD + FRateioUnid[X].rValorOM;
                     liPlanoPrevD := -1;
                     liPatroD := -1;
                     bRateiaD   := False;
                  end
                  else
                  begin
                     if (liUnidNegDoc <> 0) Then
                        liUnidNegD := liUnidNegDoc
                     Else
                        liUnidNegD := FRateioUnid[X].CodUnid;

                     rValorD    := FRateioUnid[X].rValor;
                     rValorOMD  := FRateioUnid[X].rValorOM;
                     liPlanoPrevD := FRateioUnid[X].IdPlanoPrev;
                     liPatroD := FRateioUnid[X].IdPatrocinadora;
                     bRateiaD   := True;
                  end;
                End;
             End
             Else
             Begin //Alterador e Regularização de Adiantamento
                  if ((liUnidNegDoc <> 0) Or (fUnidNegocioLancto > 0)) and
                     (not bLancaRateioAlterador) Then
                  Begin
                     If fUnidNegocioLancto > 0 Then
                        liUnidNegD := fUnidNegocioLancto
                     Else
                        liUnidNegD := liUnidNegDoc;

                     If fUnidNegocioLancto > 0 Then
                        liUnidNegC := fUnidNegocioLancto
                     Else
                        liUnidNegC := liUnidNegDoc;

                     rValorD    := rValorD   + FRateioUnid[X].rValor;
                     rValorOMD  := rValorOMD + FRateioUnid[X].rValorOM;
                     rValorC    := rValorC   + FRateioUnid[X].rValor;
                     rValorOMC  := rValorOMC + FRateioUnid[X].rValorOM;

                     liPlanoPrevD := FRateioUnid[X].IdPlanoPrev;
                     liPatroD := FRateioUnid[X].IdPatrocinadora;
                     liPlanoPrevC := FRateioUnid[X].IdPlanoPrev;
                     liPatroC := FRateioUnid[X].IdPatrocinadora;


                     bRateiaD   := False;
                     bRateiaC   := False;
                  End
                  else
                  Begin
                     liUnidNegD := FRateioUnid[X].CodUnid;
                     liUnidNegC := FRateioUnid[X].CodUnid;
                     rValorD    := FRateioUnid[X].rValor;
                     rValorOMD  := FRateioUnid[X].rValorOM;
                     rValorC    := FRateioUnid[X].rValor;
                     rValorOMC  := FRateioUnid[X].rValorOM;
                     liPlanoPrevD := FRateioUnid[X].IdPlanoPrev;
                     liPatroD := FRateioUnid[X].IdPatrocinadora;
                     liPlanoPrevC := FRateioUnid[X].IdPlanoPrev;
                     liPatroC := FRateioUnid[X].IdPatrocinadora;
                     bRateiaD   := True;
                     bRateiaC   := True;
                  End;
             End;

             //Lança Rateio de Alteradores
             If bLancaRateioAlterador And (Trim(sOperacao) = '4') Then
             Begin
                QryBuscaContaAlt.Close;
                QryBuscaContaAlt.Sql.Text :=
                   'SELECT PLACONTA FROM ALTXCCXPRGXCONTA WHERE CODALTERADOR = ' + IntToStr(CodAlterador) +
                   ' AND RTRIM(CODCENTROCUSTO) = RTRIM(''' + Trim(FRateioUnid[X].CodCentroCusto) + ''') ' +
                   ' AND IDEMPRESA = ' + IntToStr(Sistema.idEmpresa) +
                   ' AND DECODE(IDPROGRAMA,NULL,0,IDPROGRAMA) = ' + IntToStr(FRateioUnid[X].IdPrograma);
                QryBuscaContaAlt.Open;

                If Not QryBuscaContaAlt.IsEmpty Then
                Begin
                   sContaAlterador := QryBuscaContaAlt.Fields[0].AsString;
                   //Coloquei esse código dentro do If
                   If Trim(FRateioUnid[X].CodCentroCusto) = '' Then
                      sCodCentroCustoAlterador := sCodCentroCusto
                   Else
                      sCodCentroCustoAlterador := FRateioUnid[X].CodCentroCusto;
                End
                Else
                Begin
                   sCodCentroCustoAlterador := sCodCentroCusto;
                   sContaAlterador := sPlaconta;
                End;

                QryBuscaContaAlt.Close;

                If DebCre = 'C' Then
                Begin
                  //Dados do Alterador, Busca na tabela aranha, caso não tenha contabiliza normalmente
                  sCCustD    := sCodCentroCustoAlterador; //sCodCentroCusto
                  sContaD    := sContaAlterador; //sPlaconta
                  sSubContaD := sSubContaAltPag;
                  //
                  sCCustC    := sDocCodCentroCusto;
                  sContaC    := sDocPlaconta;
                  sSubContaC := sDocCodSubConta;
                End
                Else
                Begin
                  //Dados do Alterador, Busca na tabela aranha, caso não tenha contabiliza normalmente
                  sCCustC    := sCodCentroCustoAlterador; //sCodCentroCusto
                  sContaC    := sContaAlterador; //sPlaconta
                  sSubContaC := sSubContaAltPag;
                  //
                  sCCustD    := sDocCodCentroCusto;
                  sContaD    := sDocPlaconta;
                  sSubContaD := sDocCodSubConta;
                End;
             End;
             //
             If (((Trim(sOperacao) = '4') or (Trim(sOperacao) = '5') or (Trim(sOperacao) = '15')) or (DebCre = 'D'))
                and ((bRateiaD) or ((not bRateiaD) and (X = FNumRateio))) Then
                PlnCodigo := LANCACONTAB(fMostraMsgContab,'BASEDADOS', DATALANCTO, IntToStr(Sistema.IdModulo), '0',
                'D','','','','','','','','','','',
                sDocCompl,
                sHisto1d,
                sHisto2d,
                sHisto3d,
                sHisto4d,
                sHisto5d,
                '03',
                sCCustD,
                sContaD,
                '',
                '',
                liExercicio,
                liPeriodo,
                liEmpresa,
                Sistema.IdUsuario,
                IntegraBack.Plano,
                rValorD,
                0,0,0,0,0,0,0,0,IntToStr(liUnidNegD),bJuntad,
                rValoromD, 0,
                ssubcontaD,'','','', PlnCodigo,fMsgContab,IntegraBack.MascaraPlano,True,0, liPlanoPrevD, liPatroD, Sistema.UsaPlanoPatro);
                //
             If (((Trim(sOperacao) = '4') or (Trim(sOperacao) = '5') or (Trim(sOperacao) = '15')) or (DebCre = 'C'))
                and ((bRateiaC) or ((not bRateiaC) and (X = FNumRateio))) Then

                PlnCodigo := LANCACONTAB(fMostraMsgContab,'BASEDADOS', DATALANCTO, IntToStr(Sistema.IdModulo), '1',
                'C','','','','','','','','','','',
                sDocCompl,
                sHisto1c,
                sHisto2c,
                sHisto3c,
                sHisto4c,
                sHisto5c,
                '03',
                '',
                '',
                sCCustC,
                sContaC,
                liExercicio,
                liPeriodo,
                liEmpresa,
                Sistema.IdUsuario,
                IntegraBack.Plano,
                rValorC,
                0,0,0,0,0,0,0,0,IntToStr(liUnidNegC),bJuntac,
                rValoromC, 0,
                '', ssubcontaC,'','', PlnCodigo,fMsgContab,IntegraBack.MascaraPlano,True,0,liPlanoPrevC,liPatroC,Sistema.UsaPlanoPatro);
          End;
      End;
      QryBuscaContaAlt.Free;
   Except
      QryBuscaContaAlt.Free;
      Raise;
   End;
End;

Procedure TDocumento.BuscaRateio(Qry: TwwQuery; iCodDocumento: LongInt; ValorLanc,ValorLancom: Double; CodAlterador :LongInt; Var bLancaRateioAlterador :Boolean);
Var
   rVerificaTot, rSaldo, rValTot, rVerificaTotOm: Double;
   sNumFatura, sOperacao: String;

   Function ExisteTabelaAranhaAlterador(CodAlterador :LongInt) :Boolean;
   Begin
      With TwwQuery.Create(nil) Do
      Begin
         DataBaseName := 'BaseDados';
         Sql.Text := 'SELECT COUNT(IDALTXCCXPRGXCONTA) FROM ALTXCCXPRGXCONTA WHERE CODALTERADOR = ' + IntToStr(CodAlterador);
         Open;
         Result := (Fields[0].AsInteger > 0);
      End;
   End;

Begin
   bLancaRateioAlterador := ((CodAlterador > 0) And (ExisteTabelaAranhaAlterador(CodAlterador)));

   FazQuery(Qry,'SELECT OPERACAO FROM DOCUMENTO WHERE CODDOCUMENTO =  ' + IntToStr(iCodDocumento));
   sOperacao := Trim(qry.fieldbyname('OPERACAO').AsString);

   {**
     Inclusão do IDPLANOPREV, IDPATRO na query de contabilização de alteradores e
     da baixa.
   **}

   If (sOperacao = '3') Or (sOperacao = '13') Then
   Begin
      FazQuery(Qry,'SELECT NUMFATURA FROM DOCUMENTO WHERE CODDOCUMENTO =  ' + IntToStr(iCodDocumento));
      sNumFatura := qry.fieldbyname('NUMFATURA').AsString;

      FazQuery(Qry,'SELECT SUM(R.VALOR) AS VALTOT ' +
                   'FROM DOCUMENTO D, RATEIODOCUM R ' +
                   'WHERE (D.NUMFATURA =  ' + sNumFatura + ') AND ' +
                   '      (D.OPERACAO NOT IN (''3'',''13'')) AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
      rValTot:=Qry.fieldbyname('VALTOT').AsFloat;

      If bLancaRateioAlterador Then
        FazQuery(Qry,'SELECT R.UNIDNEGOC, R.CODCENTROCUSTO, R.IDPROGRAMA, R.IDPLANOPREV, R.IDPATRO, SUM(R.VALOR) AS VALUNID ' +
                     'FROM DOCUMENTO D, RATEIODOCUM R ' +
                     'WHERE (D.NUMFATURA =  ' + sNumFatura + ') AND ' +
                     '      (D.OPERACAO NOT IN (''3'',''13'')) AND (D.CODDOCUMENTO = R.CODDOCUMENTO) GROUP BY R.UNIDNEGOC, R.CODCENTROCUSTO, R.IDPROGRAMA, R.IDPLANOPREV, R.IDPATRO')
      Else
        FazQuery(Qry,'SELECT R.UNIDNEGOC, R.IDPLANOPREV, R.IDPATRO, SUM(R.VALOR) AS VALUNID ' +
                     'FROM DOCUMENTO D, RATEIODOCUM R ' +
                     'WHERE (D.NUMFATURA =  ' + sNumFatura + ') AND ' +
                     '      (D.OPERACAO NOT IN (''3'',''13'')) AND (D.CODDOCUMENTO = R.CODDOCUMENTO) GROUP BY R.UNIDNEGOC, R.IDPLANOPREV, R.IDPATRO');
   End
   Else
   Begin
      FazQuery(Qry,'SELECT SUM(VALOR) AS VALTOT ' +
      ' FROM RATEIODOCUM WHERE CODDOCUMENTO =  ' + IntToStr(iCodDocumento));
      rValTot:=qry.fieldbyname('VALTOT').AsFloat;

      If bLancaRateioAlterador Then
        FazQuery(Qry,'SELECT UNIDNEGOC, CODCENTROCUSTO, IDPROGRAMA, IDPLANOPREV, IDPATRO, SUM(VALOR) AS VALUNID ' +
        ' FROM RATEIODOCUM WHERE CODDOCUMENTO =  ' + IntToStr(iCodDocumento) +
        ' GROUP BY UNIDNEGOC, CODCENTROCUSTO, IDPROGRAMA, IDPLANOPREV, IDPATRO ')
      Else
        FazQuery(Qry,'SELECT UNIDNEGOC, IDPLANOPREV, IDPATRO, SUM(VALOR) AS VALUNID ' +
        ' FROM RATEIODOCUM WHERE CODDOCUMENTO =  ' + IntToStr(iCodDocumento) +
        ' GROUP BY UNIDNEGOC, IDPLANOPREV, IDPATRO');
   End;

   FNumRateio     := 0;
   rVerificaTot   := 0;
   rVerificaTotOm := 0;

   while not Qry.eof do
   begin
     If rValTot = 0 Then
     Begin
       FRateioUnid[FNumRateio].CodUnid := Qry.FieldByName('UNIDNEGOC').AsInteger;
       FRateioUnid[FNumRateio].rValor  := StrToFloat(FormatFloat('#0.00',0));
       FRateioUnid[FNumRateio].rValorOm:= StrToFloat(FormatFloat('#0.00',0));

       If bLancaRateioAlterador Then
       Begin
         FRateioUnid[FNumRateio].CodCentroCusto := Trim(Qry.FieldByName('CODCENTROCUSTO').AsString);
         FRateioUnid[FNumRateio].IdPrograma := Qry.FieldByName('IDPROGRAMA').AsInteger;
       End
       Else
       Begin
         FRateioUnid[FNumRateio].CodCentroCusto := '';
         FRateioUnid[FNumRateio].IdPrograma := 0;
       End;

       rVerificaTot  := rVerificaTot   + FRateioUnid[FNumRateio].rValor;
       rVerificaTotOm:= rVerificaTotOm + FRateioUnid[FNumRateio].rValorOm;
     End
     Else
     Begin
       FRateioUnid[FNumRateio].CodUnid := Qry.FieldByName('UNIDNEGOC').AsInteger;
       FRateioUnid[FNumRateio].rValor  := StrToFloat(FormatFloat('#0.00',(ValorLanc * Qry.FieldByName('VALUNID').AsFloat)/rValTot));
       FRateioUnid[FNumRateio].rValorOm:= StrToFloat(FormatFloat('#0.00',(ValorLancOM * Qry.FieldByName('VALUNID').AsFloat)/rValTot));

       If bLancaRateioAlterador Then
       Begin
         FRateioUnid[FNumRateio].CodCentroCusto := Trim(Qry.FieldByName('CODCENTROCUSTO').AsString);
         FRateioUnid[FNumRateio].IdPrograma := Qry.FieldByName('IDPROGRAMA').AsInteger;
       End
       Else
       Begin
         FRateioUnid[FNumRateio].CodCentroCusto := '';
         FRateioUnid[FNumRateio].IdPrograma := 0;
       End;


       rVerificaTot  := rVerificaTot   + FRateioUnid[FNumRateio].rValor;
       rVerificaTotOm:= rVerificaTotOm + FRateioUnid[FNumRateio].rValorOm;
     End;

     {**
       Inclusão do IDPLANOPREV, IDPATRO na query de contabilização de alteradores e
       da baixa. 
     **}
     If Qry.FieldByName('IDPLANOPREV').AsInteger = 0 Then
        FRateioUnid[FNumRateio].IdPlanoPrev := -1
     Else
        FRateioUnid[FNumRateio].IdPlanoPrev := Qry.FieldByName('IDPLANOPREV').AsInteger;
        

     If Qry.FieldByName('IDPATRO').AsInteger = 0 Then
        FRateioUnid[FNumRateio].IdPatrocinadora := -1
     Else
        FRateioUnid[FNumRateio].IdPatrocinadora := Qry.FieldByName('IDPATRO').AsInteger;

     Inc(FNumRateio);
     Qry.Next;
   end;

   Dec(FNumRateio);
   rSaldo                            := ValorLanc - rVerificaTot;
   FRateioUnid[FNumRateio].rValor    := FRateioUnid[FNumRateio].rValor + rSaldo;
   rSaldo                            := ValorLancOm - rVerificaTotOm;
   FRateioUnid[FNumRateio].rValorOm  := FRateioUnid[FNumRateio].rValorOm + rSaldo;
End;

Function TDocumento.EstornaExcluiContab(iPlanilha: LongInt; sDataLancto: String; Var bIndicaEstorno: Boolean; bExcluiPlanilha:Boolean):Boolean;
Var
   liExercicio,liPeriodo, liEmpresa: Integer;
   sData: String;
   dData: TDateTime;
Begin
   bIndicaEstorno := False;
   Result := True;
   liExercicio := 0;
   liPeriodo := 0;
   liEmpresa := Sistema.IdEmpresa;

   If TestaPeriodo(fMostraMsgContab,'BASEDADOS',DateToStr(Date),IntToStr(Sistema.IdModulo),
      liExercicio, liPeriodo,liEmpresa,fMsgContab) <> 0 Then
      Begin
         sData := DateToStr(Date);
         If InputQuery('Data para Estorno:','Estorno Contábil',sData) Then
         Begin
            Try
              dData := StrToDate(sData);
              bIndicaEstorno := True;
              Result := (EstornaLanc(fMostraMsgContab,iPlanilha, 'BaseDados', DateToStr(dData), liExercicio,
                          liPeriodo,Sistema.IdEmpresa,IntegraBack.MascaraPlano) <> 0);
            Except
               ShowMessage('Data Inválida');
               Result := False;
            End;
         End
         Else
            Result := False;
      End
   Else
     if iPlanilha <> 0 Then
      if ExcluiLanc(fMostraMsgContab,iPlanilha,'BASEDADOS', IntToStr(Sistema.idModulo), IntegraBack.Plano, liEmpresa, Sistema.idUsuario, bExcluiPlanilha,0,IntegraBack.MascaraPlano) <> 0 then
         Result := False;
End;

(** TSaldo ********************************************************************)

procedure Tsaldo.GetSaldoDoc(icoddoc:integer;sDataLanc:string;sRecPag:string;
                        var rSaldo,rSaldoOutraMoeda:real);
var
  qryLancamento : TwwQuery;
Begin
qryLancamento:=TwwQuery.Create(Application);
Try
 rSaldo:=0;
 rSaldoOutraMoeda:=0;

 With qryLancamento Do
 Begin
      DataBaseName:= 'BaseDados';
      If (sDataLanc <> '') Then
         SQL.Text := ' SELECT LANC.CODDOCUMENTO,LANC.VALOR,LANC.VALOROUTRAMOEDA,LANC.DEBCRE ' +                      ' FROM LANCTODOCUM LANC, DOCUMENTO DOC   ' +
                      ' WHERE DOC.CODDOCUMENTO = '+ IntToStr(icoddoc) +
                      ' AND LANC.DATALANCTO <= TO_DATE(''' + sDataLanc + ''',''dd/mm/yyyy'') ' +
                      ' AND DOC.CODDOCUMENTO = LANC.CODDOCUMENTO'
      Else
          SQL.Text := ' SELECT LANC.CODDOCUMENTO,LANC.VALOR,LANC.VALOROUTRAMOEDA,LANC.DEBCRE ' +
                      ' FROM LANCTODOCUM LANC, DOCUMENTO DOC   ' +
                      ' WHERE DOC.CODDOCUMENTO = '+ IntToStr(icoddoc) +
                      ' AND DOC.CODDOCUMENTO = LANC.CODDOCUMENTO';
      Open;
      First;

 while not eof do
       begin
           if ((FieldByName('DEBCRE').Asstring='D') and (sRECPAG = 'R')) or ((FieldByName('DEBCRE').Asstring='C') and (sRECPAG = 'P')) then
              begin
                  rSaldo:=rSaldo+FieldByName('VALOR').AsFloat;
                  if FieldByName('VALOROUTRAMOEDA').AsFloat <> 0 then
                     rSaldoOutraMoeda:=rSaldoOutraMoeda+FieldByName('VALOROUTRAMOEDA').AsFloat;
              end
           else
              begin
                  rSaldo:=rSaldo-FieldByName('VALOR').AsFloat;
                  if FieldByName('VALOROUTRAMOEDA').AsFloat <> 0 then
                     rSaldoOutraMoeda:=rSaldoOutraMoeda-FieldByName('VALOROUTRAMOEDA').AsFloat;
              end;
           Next;
       end;
 End;

 If IsFloatZero(rSaldo) Then
    rSaldo := 0;

 If IsFloatZero(rSaldoOutraMoeda) Then
    rSaldoOutraMoeda := 0;
Finally
 qryLancamento.Free;
End;

End;

(******************************************************************************)

function TSaldo.GetSaldoLote(inumlote:integer): Double;
begin
   If FazQuery(DtmbaseDados.Qry,'SELECT SUM(LX.VALOR)AS VALORTOTAL  ' +
                                     ' FROM LOTEXDOCUM LX, LOTEPAGTO LP ' +
                                     ' WHERE (LX.NUMLOTE = ' + IntToStr(inumlote) + ') AND (LP.FLAGCANCEL IS NULL) AND ' +
                                     '       (LX.FLGBAIXA IS NULL) AND (LX.NUMLOTE = LP.NUMLOTE)') Then
     result := DtmbaseDados.Qry.FieldByName('VALORTOTAL').Asfloat
   Else
     Raise EdataBaseError.Create('Não foi possível calcular o saldo do lote');
end;

(******************************************************************************)

function TDocumento.GetNumLote(iCodDocumento:integer;Var iCodPOrtForma,iNumLote: LongInt):Boolean;
begin
   If FazQuery(DtmbaseDados.Qry,'SELECT LX.NUMLOTE, LP.CODPORTFORMA ' +
                                     ' FROM LOTEXDOCUM LX, LOTEPAGTO LP ' +
                                     ' WHERE (LX.CODDOCUMENTO = ' + IntToStr(iCodDocumento) + ') AND (LP.FLAGCANCEL IS NULL) AND ' +
                                     '       (LX.FLGBAIXA IS NULL) AND (LX.NUMLOTE = LP.NUMLOTE)') Then
   Begin
     iCodPOrtForma := DtmbaseDados.Qry.FieldByName('CODPORTFORMA').AsInteger;
     iNumLote      := DtmbaseDados.Qry.FieldByName('NUMLOTE').AsInteger;
     Result        := True;
   End
   Else
   Begin
     iCodPOrtForma := -1;
     iNumLote      := -1;
     Result        := False;
   End;
end;

(******************************************************************************)

Function TSaldo.GetValorLote(INumLote:Integer;bFormataResult:Boolean):String;
Var
   sSql: String;
   rValorTotal: Real;
Begin
   sSql := 'SELECT SUM(VALOR) FROM LOTEXDOCUM WHERE NUMLOTE = '+ IntToStr(inumlote);
   If FazQuery(DtmBaseDados.Qry,sSql) Then
      rValorTotal := DtmBaseDados.Qry.Fields[0].AsFloat
   Else
      rValorTotal := 0;

   If bFormataResult Then
      Result := Trim(FloatToStrF(rValorTotal,ffNumber,17,2))
   Else
      Result := FloatToStr(rValorTotal);
End;

(* TRateio *******************************************************************)

function TRateio.Inserir(iCodDocumento: LongInt; CodTipRecDes, RecPag,CodCentroRespon: String;
         IdPessoa: LongInt; Valor,ValorOutraMoeda: Real; IdUsuarioInclusao,UnidNegoc,IdReservaOrcamen: LongInt;
         sCodCentroCusto: String; IdPatro, IdPrograma, IdPlanoPrev :Real):Double;
var IdProcessoRad : Double;
begin
  With DtmCmBackDocumento.QryInsertRateio Do
  Begin
     If (Trim(CodTipRecDes) = '') Then
        Raise EDataBaseError.Create('Tipo de Desembolso\Recebimento não informado.');

     If (Trim(sCodCentroCusto) = '') And (IntegraBack.ObrigaCC) Then
        Raise EDataBaseError.Create('Centro de Custo não informado.');

     IdProcessoRad := 0;
     if (Documento.ProcessoAutLote <> 0) and
        (RecPag = 'P') then
     begin
        Rad := TRad.Create;
        Try
           DtmCmBackDocumento.qryTestaRateioRad.Close;
           DtmCmBackDocumento.qryTestaRateioRad.ParamByName('IDPESSOA').AsFloat     := idPessoa;
           DtmCmBackDocumento.qryTestaRateioRad.ParamByName('CODDOCUMENTO').AsFloat := iCodDocumento;
           If (CodCentroRespon = '') Or (CodCentroRespon = '-1') Or (CodCentroRespon = '0') Then
              DtmCmBackDocumento.qryTestaRateioRad.ParamByName('CODCENTRORESPON').AsString := '9999999999'
           else
              DtmCmBackDocumento.qryTestaRateioRad.ParamByName('CODCENTRORESPON').AsString := Espaco(CodCentroRespon,10);
           DtmCmBackDocumento.qryTestaRateioRad.Open;
           if DtmCmBackDocumento.qryTestaRateioRad.IsEmpty then begin
              Rad.TipoProcesso    := Documento.ProcessoAutLote;
              Rad.Valor           := Valor;
              Rad.IdPessoa        := IdPessoa;
              If (CodCentroRespon = '') Or (CodCentroRespon = '-1') Or (CodCentroRespon = '0') Then
                 Rad.CodCentroRespon := '9999999999'
              else
                 Rad.CodCentroRespon := CodCentroRespon;
              IdProcessoRad       := Rad.IniciarProcesso;
           end else begin
              IdProcessoRad :=DtmCmBackDocumento.qryTestaRateioRad.FieldByName('IDPROCESSO').AsFloat;
              if IdProcessoRad <> 0 then begin
                 DtmCmBackDocumento.updValorProcessoRad.Close;
                 DtmCmBackDocumento.updValorProcessoRad.ParamByName('VALOR').AsFloat      := Valor;
                 DtmCmBackDocumento.updValorProcessoRad.ParamByName('IDPROCESSO').AsFloat := IdProcessoRad;
                 DtmCmBackDocumento.updValorProcessoRad.ExecSQL;
              end;
           end;
           Rad.Free;
        except
           Rad.Free;
           Raise;
        end;
     end;

     If Active Then Close;
     If Not Prepared Then Prepare;

     ParamByname('CODDOCUMENTO').AsFloat := iCodDocumento;
     ParamByname('CODTIPRECDES').AsString := CodTipRecDes;
     ParamByname('RECPAG').AsString := RecPag;
     if IdProcessoRad = 0 Then
        ParamByname('IDPROCESSO').Clear
     Else
        ParamByname('IDPROCESSO').AsFloat := IdProcessoRad;

     If (CodCentroRespon = '') Or (CodCentroRespon = '-1') Or (CodCentroRespon = '0') Then
        ParamByname('CODCENTRORESPON').AsString := '9999999999'
     Else
        ParamByname('CODCENTRORESPON').AsString := CodCentroRespon;


     ParamByname('IDPESSOA').AsFloat := idPessoa;
     ParamByname('VALOR').AsFloat := Valor;
     ParamByname('IDRATEIODOCUM').AsFloat := LeUltRegistro(nil,'RATEIODOCUM');
     ParamByname('IDUSUARIOINCLUSAO').AsFloat := IdUsuarioInclusao;
     ParamByname('UNIDNEGOC').AsFloat := UnidNegoc;

     if ValorOutraMoeda = 0 Then
        ParamByname('VALOROUTRAMOEDA').Clear
     Else
        ParamByname('VALOROUTRAMOEDA').AsFloat := ValorOutraMoeda;

     If IdReservaOrcamen > 0  Then
        ParamByname('IDRESERVAORCAMEN').AsFloat := IdReservaOrcamen
     Else
        ParamByname('IDRESERVAORCAMEN').Clear;

     If Trim(sCodCentroCusto) <> '' Then
     Begin
        ParamByname('CODCENTROCUSTO').AsString := sCodCentroCusto;
        ParamByName('IDEMPRESA').AsFloat := Sistema.IdEmpresa;
     End
     Else
     Begin
        ParamByname('CODCENTROCUSTO').Clear;
        ParamByName('IDEMPRESA').Clear;
     End;

     If IdPatro > 0  Then
        ParamByname('IDPATRO').AsFloat := IdPatro
     Else
        ParamByname('IDPATRO').Clear;

     If IdPrograma > 0  Then
        ParamByname('IDPROGRAMA').AsFloat := IdPrograma
     Else
        ParamByname('IDPROGRAMA').Clear;

     If IdPlanoPrev > 0  Then
        ParamByname('IDPLANOPREV').AsFloat := IdPlanoPrev
     Else
        ParamByname('IDPLANOPREV').Clear;

     ExecSQL;
     Result := ParamByname('IDRATEIODOCUM').AsFloat;
  end;
end;

(******************************************************************************)

procedure TRateio.Alterar(iCodDocumento: LongInt; CodTipRecDes,RecPag, CodCentroRespon: String;
      IdPessoa, CodUnidNegoc: LongInt; Valor,ValorOutraMoeda: Real; sCodCentroCusto: String;
      IdRateioDocum, IdUsuarioInclusao, IdReservaOrcamen :LongInt; UnidNegoc :Real;
      IdPatro, IdPrograma, IdPlanoPrev :Real);
begin
  If (Trim(CodTipRecDes) = '') Then
     Raise EDataBaseError.Create('Tipo de Desembolso\Recebimento não informado.');

  If (Trim(sCodCentroCusto) = '') And (IntegraBack.ObrigaCC) Then
     Raise EDataBaseError.Create('Centro de Custo não informado.');


  With DtmCmBackDocumento.QryUpdRateio Do
  Begin
     If Active Then Close;
     If Not Prepared Then Prepare;

     ParamByname('CODDOCUMENTO').AsFloat := iCodDocumento;
     ParamByname('CODTIPRECDES').AsString := CodTipRecDes;
     ParamByname('RECPAG').AsString := RecPag;

     If (CodCentroRespon = '') Or (CodCentroRespon = '-1') Or (CodCentroRespon = '0') Then
        ParamByname('CODCENTRORESPON').AsString := '9999999999'
     Else
        ParamByname('CODCENTRORESPON').AsString := CodCentroRespon;

     ParamByname('IDPESSOA').AsFloat := idPessoa;
     ParamByname('VALOR').AsFloat := Valor;
     ParamByname('IDRATEIODOCUM').AsFloat := IdRateioDocum;
     ParamByname('IDUSUARIOINCLUSAO').AsFloat := IdUsuarioInclusao;
     ParamByname('UNIDNEGOC').AsFloat := UnidNegoc;

     if ValorOutraMoeda = 0 Then
        ParamByname('VALOROUTRAMOEDA').Clear
     Else
        ParamByname('VALOROUTRAMOEDA').AsFloat := ValorOutraMoeda;

     If IdReservaOrcamen > 0 Then
        ParamByname('IDRESERVAORCAMEN').AsFloat := IdReservaOrcamen
     Else
        ParamByname('IDRESERVAORCAMEN').Clear;

     If Trim(sCodCentroCusto) <> '' Then
     Begin
        ParamByname('IDEMPRESA').AsFloat := Sistema.IdEmpresa;
        ParamByname('CODCENTROCUSTO').AsString := sCodCentroCusto;
     End
     Else
     Begin
        ParamByname('CODCENTROCUSTO').Clear;
        ParamByname('IDEMPRESA').Clear;
     End;

     If IdPatro > 0  Then
        ParamByname('IDPATRO').AsFloat := IdPatro
     Else
        ParamByname('IDPATRO').Clear;

     If IdPrograma > 0  Then
        ParamByname('IDPROGRAMA').AsFloat := IdPrograma
     Else
        ParamByname('IDPROGRAMA').Clear;

     If IdPlanoPrev > 0  Then
        ParamByname('IDPLANOPREV').AsFloat := IdPlanoPrev
     Else
        ParamByname('IDPLANOPREV').Clear;

     ExecSQL;
  End;
end;

(******************************************************************************)

procedure TRateio.Excluir(iCodDocumento: LongInt;CodTipRecDes, RecPag: String; IdRateioDocum :LongInt);
begin
  With DtmCmBackDocumento Do
  Begin
    if IdRateioDocum > 0 Then
      Begin
         If QryDelRateio.Active Then QryDelRateio.Close;
         If Not QryDelRateio.Prepared Then QryDelRateio.Prepare;
         QryDelRateio.ParamByName('IDRATEIODOCUM').AsFloat := IdRateioDocum;
         QryDelRateio.ExecSql;
      End
    Else
    Begin
       If (CodTipRecDes = '') Or (RecPag = '') Then
       Begin
          If QryDelRateioDoc.Active Then QryDelRateioDoc.Close;
          If Not QryDelRateioDoc.Prepared Then QryDelRateioDoc.Prepare;
          QryDelRateioDoc.ParamByName('CODDOCUMENTO').AsFloat := iCodDocumento;
          QryDelRateioDoc.ExecSql;
       End
       Else
       Begin
          If QryDelRateioDocRecDes.Active Then QryDelRateioDocRecDes.Close;
          If Not QryDelRateioDocRecDes.Prepared Then QryDelRateioDocRecDes.Prepare;
          QryDelRateioDocRecDes.ParamByName('CODDOCUMENTO').AsFloat := iCodDocumento;
          QryDelRateioDocRecDes.ParamByName('CODTIPRECDES').AsString := CodTipRecDes;
          QryDelRateioDocRecDes.ParamByName('RECPAG').AsString := RecPag;
          QryDelRateioDocRecDes.ExecSql;
       End;
    End;
  End;
end;

(* TIntBanco ******************************************************************)

Constructor TIntBanco.Create;
Begin
  Inherited Create;
  FDeletaMensagens := True;
  FCodigosGrupo := TstringList.Create;
End;

Destructor TIntBanco.Destroy;
Begin
  FCodigosGrupo.Free;
  Inherited Destroy;
End;

Function TIntBanco.GetCodGrupoCnab(iCodDocumento:LongInt):LongInt;
Begin
  If FazQuery(DtmBaseDados.Qry,'SELECT CODGRUPOCNAB FROM DOCUMENTO WHERE CODDOCUMENTO = ' +
                               IntToStr(iCodDocumento)) Then
     Result := DtmBaseDados.Qry.Fields[0].AsInteger
  Else
     Result := -1;
End;

Function TIntBanco.AgrupaDocCnab(Qry:TwwQuery; bInTransaction, bAbreQry,
bFechaQry, bAlteraEmisBloq: Boolean; sCamposParaGrupo: Array of String):Boolean;
Var iSeqGrupo, iNumCampos, X    : Integer;
    lValoresGrupo               : TStringList;
    bExisteCampo, bCamposIguais,
    bExistePortFotma            : Boolean;
    FieldGrupoDoc               :TField;
    sGrupoDoc                   :String;
Begin
   FCodigosGrupo.Clear;

   If bAbreQry Then Qry.Open;

   iNumCampos := High(sCamposParaGrupo);

   lValoresGrupo := TStringList.Create;

   bExisteCampo := True;

   For X:=0 To iNumCampos Do
   Begin
       bExisteCampo := (Qry.FindField(sCamposParaGrupo[X]) <> nil);
       If Not bExisteCampo Then Break;
   End;

   If (Qry.FindField('CODDOCUMENTO') = nil) Or (Not bExisteCampo) Then
      Result := False
   Else
   Begin

      bExistePortFotma := (Qry.FindField('CODPORTFORMA') <> nil);

      If Not bInTransaction Then StartTransacao;

      Qry.First;

      iSeqGrupo := 0;

      bCamposIguais := True;

      For X:=0 To iNumCampos Do
          lValoresGrupo.Add('');

      While Not Qry.Eof Do
      Begin
         For X:=0 To iNumCampos Do
         Begin
             bCamposIguais := (lValoresGrupo[x] = Qry.FieldByName(sCamposParaGrupo[X]).AsString);
             If Not bCamposIguais Then Break;
         End;

         If Not bCamposIguais Then
         Begin
            iSeqGrupo     := LeultRegistro(nil,'GRUPOCNAB');
            bCamposIguais := True;
            FCodigosGrupo.Add (IntToStr(iSeqGrupo));
         End;

         FieldGrupoDoc := Qry.FindField('GRUPODOC');

         If FieldGrupoDoc <> nil Then
            sGrupoDoc := Trim(FieldGrupoDoc.AsString)
         Else
            sGrupoDoc := '';

         If (bAlteraEmisBloq) And (bExistePortFotma) And
            (Not Qry.FindField('CODPORTFORMA').IsNull) Then
         Begin
            If Not ExecutarQuery(DtmBaseDados.qry,'UPDATE DOCUMENTO SET CODGRUPOCNAB = ' + IntToStr(iSeqGrupo) + ', EMISBLOQ = ''N'', GRUPODOC = ''' + sGrupoDoc + ''' ' +
                                                  ' WHERE CODDOCUMENTO = ' + Qry.FieldByName('CODDOCUMENTO').AsString) Then
               Raise EdataBaseError.Create('Erro ao marcar documento ' + Qry.FieldByName('CODDOCUMENTO').AsString + ' como agrupado');
         End
         Else
            If Not ExecutarQuery(DtmBaseDados.qry,'UPDATE DOCUMENTO SET CODGRUPOCNAB = ' + IntToStr(iSeqGrupo) +  ', GRUPODOC = ''' + sGrupoDoc + ''' ' +
                                                 ' WHERE CODDOCUMENTO = ' + Qry.FieldByName('CODDOCUMENTO').AsString) Then
                   Raise EdataBaseError.Create('Erro ao marcar documento ' + Qry.FieldByName('CODDOCUMENTO').AsString + ' como agrupado');

         For X:=0 To iNumCampos Do
             lValoresGrupo[x] := Qry.FieldByName(sCamposParaGrupo[X]).AsString;

         Qry.Next;
      End;

      If Not bInTransaction Then CommitTransacao;

      Result := True;
   End;

   lValoresGrupo.Free;

   If bFechaQry Then Qry.Close;
End;

(******************************************************************************)

Function TIntBanco.SetaMensagensCNAB(iCodDocumento,ICodGrupo:Integer;
sMensagens: Array of String):Boolean;
Var sSql: String;
    X,iMax: Integer;
    aMensagens:Array [0..8] of String;
    binTransacao : boolean;   // Edilaine - SOL 188755 / KTN 1784317
Begin
  If (iCodDocumento = -1) And (iCodGrupo = -1) Then
      Result := False
  Else
  Begin
    try  // Edilaine - SOL 188755 / KTN 1784317

       binTransacao := dtmBaseDados.dbBaseDados.inTransaction;  // Edilaine - SOL 188755 / KTN 1784317

       // Edilaine - SOL 188755 / KTN 1784317
       if not bInTransacao then
          StartTransacao;
       // Edilaine - SOL 188755 / KTN 1784317 - fim

       If FDeletaMensagens Then
       Begin
         If (iCodDocumento <> -1) And (iCodGrupo <> -1) Then
             sSql := 'DELETE FROM MENSAGENSCNAB WHERE CODDOCUMENTO = '
                     + IntToStr(iCodDocumento) + ' AND CODGRUPOCNAB = '
                     + IntToStr(iCodGrupo)
         Else
            If (iCodDocumento <> -1) Then
                sSql := 'DELETE FROM MENSAGENSCNAB WHERE CODDOCUMENTO = '
                     + IntToStr(iCodDocumento)
            Else
                sSql := 'DELETE FROM MENSAGENSCNAB WHERE CODGRUPOCNAB = '
                     + IntToStr(iCodGrupo);

         If Not ExecutarQuery(DtmBaseDados.Qry,sSQl) Then
            Raise EdataBaseError.Create('Erro ao deletar mensagens para o documento' + IntToStr(iCodDocumento));
       End;

       iMax := High(sMensagens);

       If iMax > 8 Then iMax := 8;

       For X:=0 To iMax Do
           aMensagens[x] := Copy(sMensagens[x],1,69);

       sSql := ' INSERT INTO MENSAGENSCNAB (IDMENSAGENSCNAB, CODDOCUMENTO, CODGRUPOCNAB, ' +
          ' MENSAGEM1, MENSAGEM2, MENSAGEM3, MENSAGEM4, MENSAGEM5, ' +
          ' MENSAGEM6, MENSAGEM7, MENSAGEM8, MENSAGEM9) VALUES (' +
          IntToStr(LeUltRegistro(nil,'MENSAGENSCNAB'));

       if iCodDocumento = -1 then
          sSql := sSql + ', NULL'
       else
          sSql := sSql + ', ' + IntToStr(iCodDocumento);

       if ICodGrupo = -1 then
          sSql := sSql + ', NULL'
       else
          sSql := sSql + ', ' + IntToStr(ICodGrupo);

       For X:=0 To iMax Do
           sSql := sSql + ', ''' + aMensagens[X] + '''';

       sSql := sSql + ')';

       Result := ExecutarQuery(DtmBaseDados.Qry,sSQl);

       // Edilaine - SOL 188755 / KTN 1784317
       if Not bInTransacao Then
          CommitTransacao;
       // Edilaine - SOL 188755 / KTN 1784317 - fim

    except
       // Edilaine - SOL 188755 / KTN 1784317
       if Not bInTransacao Then
          RollBackTransacao;
       // Edilaine - SOL 188755 / KTN 1784317 - fim
    end;

  End;
End;

(******************************************************************************)

Function TDocumento.AutorizaDataVencimento(DataVencto: TDateTime; sRecPag: String): Boolean;
Var
   iNumDias, iModulo: Integer;
   Qry,QryAutoriza: TwwQuery;
Begin
   Result := True;

   If sRecPag = 'P' Then
      iModulo := 3
   Else
      iModulo := 4;

   Qry    := TwwQuery.Create(Application);
   QryAutoriza := TwwQuery.Create(Application);
   Qry.DataBaseName := 'BaseDados';
   QryAutoriza.DataBaseName := 'BaseDados';

   If FazQuery(Qry,'SELECT NUMDIASVENCTO FROM PARAMCAP WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ' AND RECPAG = ''' + sRecPag + '''') Then
   Begin
      If (Not Qry.FieldByName('NUMDIASVENCTO').IsNull) And
         (Qry.FieldByName('NUMDIASVENCTO').AsInteger <> 0) Then
      Begin
          iNumDias := Qry.FieldByName('NUMDIASVENCTO').AsInteger;
          If FazQuery(Qry,'SELECT OPERFUNC.IDOPERFUNC ' +
                          'FROM OBJETO, FROBFNOP, FORM, OPERFUNC ' +
                          'WHERE (FROBFNOP.IDFORM = FORM.IDFORM ) AND ' +
                          '(OPERFUNC.IDMODULO = ' + IntToStr(iModulo) + ') AND ' +
                          '(FROBFNOP.IDOPERFUNC = OPERFUNC.IDOPERFUNC) AND ' +
                          '(OBJETO.IDOBJETO = FROBFNOP.IDOBJETO) AND ' +
                          '(UPPER(OBJETO.NOMEOBJETO) = UPPER(''LblMesmaData''))') Then
          Begin
             with QryAutoriza do
             begin
                  Close;
                  Sql.Text := 'SELECT AUTORIZA.IDOPERFUNC FROM AUTORIZA ' +
                  ' WHERE (AUTORIZA.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa)  + ') AND ' +
                  ' (AUTORIZA.IDOPERFUNC = ' + Qry.FieldByName('IDOPERFUNC').AsString + ') AND ' +
                  ' ((AUTORIZA.IdEspAcesso = ' + IntToStr(Sistema.IdEspAcesso) + ') OR ' +
                  ' (AUTORIZA.IDESPACESSO IN ' +
                  ' (SELECT GRUPOACESSO.IDESPACESSO FROM GRUPOACESSO, GRUPOUSU ' +
                  ' WHERE GRUPOUSU.IDUSUARIO = ' + IntToStr(Sistema.IdUsuario)+ ' AND ' +
                  ' GRUPOACESSO.IDGRUPO = GRUPOUSU.IDGRUPO))) ';
                  Open;

                  If IsEmpty Then
                     Result := Not (DataVencto <= Date + (iNumDias - 1))
                  Else
                     Result := True;
             End;
          End;
      End;
   End;

   If Not Result Then
      MsgDlg('Usuário sem privilégio de lançar\alterar documento com data de vencimento indicada','Erro',mtWarning,[mbOk],0);

   Qry.Close;
   QryAutoriza.Close;
   Qry.Free;
   QryAutoriza.Free;
End;

(******************************************************************************)

function TDocumento.AjustaDataFloat(dData: TDateTime; iFloat: Integer) :TDateTime;
Begin
   If IntegraBack.RecPag = 'R' Then
   Begin
      dData := dData + iFloat;

      if DayOfWeek(dData) = 1 then
         dData:=dData+1;

      if DayOfWeek(dData) = 7 then
         dData:=dData+2;
   End
   Else
   Begin
      dData := dData - iFloat;

      if DayOfWeek(dData) = 1 then
         dData:=dData-2;

      if DayOfWeek(dData) = 7 then
         dData:=dData-1;
   End;

   Result := dData;
End;

Function TDocumento.BuscaContaContabil(IdPrograma :LongInt; TipRecDes, CentroCusto :String):String;
Begin
   With DtmCmBackDocumento Do
   Begin
     If QryBuscaConta.Active Then QryBuscaConta.Close;
     If QryBuscaContaTrd.Active Then QryBuscaContaTrd.Close;

     If IdPrograma <= 0 Then
        QryBuscaConta.Sql[10] := '  IDPROGRAMA IS NULL '
     Else
        QryBuscaConta.Sql[10] := '  IDPROGRAMA = ' + IntToStr(IdPrograma);

     If Not QryBuscaConta.Prepared Then QryBuscaConta.Prepare;
     QryBuscaConta.ParamByName('CODTIPRECDES').AsString   := TipRecDes;
     QryBuscaConta.ParamByName('RECPAG').AsString         := IntegraBack.RecPag;
     QryBuscaConta.ParamByName('IDPESSOA').AsInteger      := Sistema.IdEmpresa;
     QryBuscaConta.ParamByName('CODCENTROCUSTO').AsString := CentroCusto;
     QryBuscaConta.ParamByName('IDEMPRESA').AsFloat       := Sistema.IdEmpresa;

     QryBuscaConta.Open;

     If Not QryBuscaConta.IsEmpty Then
        Result := QryBuscaContaPLACONTA.AsString
     Else
     Begin
        If Not QryBuscaContaTrd.Prepared Then QryBuscaContaTrd.Prepare;
        QryBuscaContaTrd.ParamByName('CODTIPRECDES').AsString   := TipRecDes;
        QryBuscaContaTrd.ParamByName('RECPAG').AsString         := IntegraBack.RecPag;
        QryBuscaContaTrd.ParamByName('IDPESSOA').AsInteger      := Sistema.IdEmpresa;
        QryBuscaContaTrd.Open;

        If Not QryBuscaContaTrd.IsEmpty Then
           Result := QryBuscaContaTrdPLACONTA.AsString
        Else
           Result := '';
     End;

     If QryBuscaConta.Active Then QryBuscaConta.Close;
     If QryBuscaContaTrd.Active Then QryBuscaContaTrd.Close;
   End;
End;

Procedure TDocumento.AlteraStatusOrcamento(iCodDocumento:LongInt; sStatus:Char);
Begin
  //Volta o Status do Compromisso Orcamentário
  With DtmCmBackDocumento Do
  Begin
     If QryResOrcamen.Active Then QryResOrcamen.Close;
     if Not QryResOrcamen.Prepared Then QryResOrcamen.Prepare;
     QryResOrcamen.ParamByName('CODDOCUMENTO').AsFloat := iCodDocumento;
     QryResOrcamen.Open;
     QryResOrcamen.First;

     While Not QryResOrcamen.Eof do
     Begin
        QryUpdResOrcamen.ParamByName('FLGRESERVA').AsString := sStatus;
        QryUpdResOrcamen.ParamByName('VLRCOMPROMISSO').AsFloat := QryResOrcamenVLRRESORCAMEN.AsFloat;
        QryUpdResOrcamen.ParamByName('IDRESERVAORCAMEN').AsFloat := QryResOrcamenIDRESERVAORCAMEN.AsFloat;
        QryUpdResOrcamen.ExecSql;

        QryResOrcamen.Next;
     End;

     QryResOrcamen.Close;
  End;
End;

Procedure TDocumento.GravaValorCompromisso(idRateioDocum:LongInt;rValor:Double);
Begin
  With DtmCmBackDocumento.QryUpdValorCompromisso Do
  Begin
     ParamByName('VLRRESORCAMEN').AsFloat := rValor;
     ParamByName('IDRATEIODOCUM').AsFloat :=idRateioDocum;
     ExecSql;
  End;
End;


procedure TDocumento.SetProcessoAutLote(const Value: LongInt);
begin
  FProcessoAutLote := Value;
end;

procedure TDocumento.SetDataDisponibilidade(const Value: TDateTime);
begin
  FDataDisponibilidade := Value;

  if Value <> 0 then
    LancFinanc.TestaDispFinanc( Sistema.IdEmpresa, Sistema.IdUsuario, fDataDisponibilidade);
end;


//Gera um processo RAD para o documento passado como parâmetro
function TDocumento.GeraRAD(iCodDocumento: Integer): boolean;
var
  bGeraRAD, EmiteLancaBaixa : boolean;
  RecPag, Status, Operacao : string;
  CodTipDoc : integer;
  iIdTipoProcesso, iIdProcesso : integer;
  _Saldo, _SaldoOutraMoeda : real;
  SaldoLocal : TSaldo;
begin

  Result := False;
  with DtmCmBackDocumento do
  begin

    //Verifica se o TotalPrev usa RAD. Se não usa, sai da rotina.
    qryUsaRAD.Close;
    qryUsaRAD.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
    qryUsaRAD.Open;
    bGeraRAD := ( qryUsaRAD.FieldByName('FLGRAD').asString = 'S' );
    qryUsaRAD.Close;
    if not bGeraRAD then exit;

    //Verifica se existe tipo de processo para o lançamento de documento. Se /
    //não existe, sai da rotina
    iIdTipoProcesso := 0;
    QryGetTipoProcesso.Close;
    QryGetTipoProcesso.ParamByName('IDREFERENCIA').AsInteger := 27;
    QryGetTipoProcesso.Open;
    if not QryGetTipoProcesso.IsEmpty then
      iIdTipoProcesso := QryGetTipoProcesso.FieldByName('IDTIPOPROCESSO').AsInteger;
    QryGetTipoProcesso.Close;
    if iIdTipoProcesso <= 0 then exit;

    //Recupera os dados do documento
    qryDocumento.Close;
    qryDocumento.ParamByName('CODDOCUMENTO').AsInteger := iCodDocumento;
    qryDocumento.Open;

    //Se não encontra o documento, sai da rotina
    if qryDocumento.IsEmpty then exit;

    //Verifica se o documento é a pagar ou a receber
    RecPag := qryDocumento.FieldByName('RECPAG').AsString;

    //Se o documento não é a pagar, sai da rotina
    if RecPag <> 'P' then exit;

    //Verifica se emite cheque para lançamento de baixa simultânea
    QryRecuperaParamIntegra.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
    QryRecuperaParamIntegra.ParamByName('RECPAG').AsString    := RecPag;
    QryRecuperaParamIntegra.Open;
    EmiteLancaBaixa := ( QryRecuperaParamIntegra.FieldByName('FLGEMITELANCBAIX').AsString = 'S' );
    QryRecuperaParamIntegra.Close;

    //Recupera status, operação e código do tipo do documento
    Status    := qryDocumento.FieldByName('STATUS').AsString;
    Operacao  := qryDocumento.FieldByName('OPERACAO').AsString;
    CodTipDoc := qryDocumento.FieldByName('CODTIPDOC').AsInteger;

    //Se emite cheque...
    if EmiteLancaBaixa then
    begin

      //Gera RAD nas seguintes condições...
      bGeraRAD := ( ( ( ( Status = '0' ) or ( Status = '1' ) or ( Status = '' ) ) and
         ( ( Operacao = '2') or ( Operacao = '3') or ( Operacao = '14' ) ) ) or
         ( ( Status = '2') and ( Status = '10' ) ) );

      qryTipoDocRecPag.Close;
      if bGeraRAD then
      begin
        qryTipoDocRecPag.SQL.Text :=
         ' SELECT CODTIPDOC FROM TIPODOCRECPAG a ' +
         ' WHERE a.RECPAG =   ' + QuotedStr( Recpag ) +
         ' and CODTIPDOC = ' + FloatToStr( CodTipDoc ) +
         ' and not exists ( select 1 from UsuarioxTpdocto b where recpag = ' + QuotedStr( Recpag ) +
         ' and b.idusuario = ' + FloatToStr( Sistema.IdUsuario ) + ') '
         + ' union ' +
         ' SELECT CODTIPDOC FROM TIPODOCRECPAG a ' +
         ' WHERE a.RECPAG = ' + QuotedStr( Recpag ) +
         ' and CODTIPDOC = ' + FloatToStr( CodTipDoc ) +
         ' and exists ( select 1 from UsuarioxTpdocto b where recpag = ' + QuotedStr( Recpag ) +
         ' and a.codtipdoc = b.codtipdoc and b.idusuario = ' + FloatToStr( Sistema.IdUsuario ) + ') ';
        qryTipoDocRecPag.Open;
        bGeraRAD := qryTipoDocRecPag.RecordCount > 0 ;
      end;

    end
    else
    begin

      //Gera RAD nas seguintes condições...
      bGeraRAD := ( ( Status = '0' ) or ( Status = '1' ) or ( Status = '' ) ) and
         ( ( Operacao = '2') or ( Operacao = '3') or ( Operacao = '14' ) );

      if bGeraRAD then
      begin
        qryTipoDocRecPag.SQL.Text :=
         ' SELECT CODTIPDOC FROM TIPODOCRECPAG a ' +
         ' WHERE a.RECPAG =   ' + QuotedStr( Recpag ) +
         ' and CODTIPDOC = ' + FloatToStr( CodTipDoc ) +
         ' and not exists ( select 1 from UsuarioxTpdocto b where recpag = ' + QuotedStr( Recpag ) +
         ' and b.idusuario = ' + FloatToStr( Sistema.IdUsuario ) + ') '
         + ' union ' +
         ' SELECT CODTIPDOC FROM TIPODOCRECPAG a ' +
         ' WHERE a.RECPAG = ' + QuotedStr( Recpag ) +
         ' and CODTIPDOC = ' + FloatToStr( CodTipDoc ) +
         ' and exists ( select 1 from UsuarioxTpdocto b where recpag = ' + QuotedStr( Recpag ) +
         ' and a.codtipdoc = b.codtipdoc and b.idusuario = ' + FloatToStr( Sistema.IdUsuario )+ ')';
        qryTipoDocRecPag.Open;
        bGeraRAD := qryTipoDocRecPag.RecordCount > 0 ;
      end;

    end;

    qryTipoDocRecPag.Close;

    qryTipoDocRecPag.sql.Text := ' SELECT FLGNAOGERARAD FROM TIPODOCRECPAG WHERE RECPAG = '+ QuotedStr( Recpag ) +
                                  ' AND CODTIPDOC = ' + FloatToStr( CodTipDoc );
    qryTipoDocRecPag.Open;
    bGeraRAD := qryTipoDocRecPag.fieldByName('FLGNAOGERARAD').asString <> 'S';

    if bGeraRAD then
    begin

      //Cria o objeto RAD em memória
      Rad := TRad.Create;
      Try

        //Recupera o saldo do documento
        Saldo := TSaldo.Create;
        try
          Saldo.GetSaldoDoc( iCodDocumento, '', RecPag, _Saldo, _SaldoOutraMoeda );
        finally
          Saldo.Free;
        end;

        //Prepara o RAD
        Rad.TipoProcesso := iIdTipoProcesso;
        Rad.IdEmpresa    := Sistema.Idempresa;
        Rad.IdPessoa     := Sistema.Idempresa;
        Rad.OBS          := 'Documento Nº: ' + qryDocumento.FieldByName('NODOCUMENTO').AsString;
        Rad.Valor        := _Saldo;
        Rad.CodTipDoc    := qryDocumento.FieldByName('CODTIPDOC').asInteger; 

        //Insere o novo processo
        iIdProcesso := Rad.IniciarProcesso;
        if iIdProcesso < 0 then
          raise Exception.Create('Não foi possível gerar o processo RAD.');

        //Atualiza, no documento, o número do processo
        qryAtuRADDoc.Close;
        qryAtuRADDoc.SQL.Text :=
         ' update DOCUMENTO set IDPROCESSO = ' + IntToStr( iIdProcesso ) +
         ' where  CODDOCUMENTO = ' + IntToStr( iCodDocumento );
        qryAtuRADDoc.ExecSQL;

        qryDocumento.Close;

        Result := True;

      finally
        Rad.Free;
      end;
    end;
  end;

end; {GeraRAD}


//Cancela o processo RAD do documento passado como parâmetro
function TDocumento.CancelaRAD(iCodDocumento: Integer): boolean;
var
  IdProcesso : extended;
begin
  Result := False;
  with DtmCmBackDocumento do
  begin
    //Recupera os dados do documento
    qryDocumento.Close;
    qryDocumento.ParamByName('CODDOCUMENTO').AsInteger := iCodDocumento;
    qryDocumento.Open;

    if not qryDocumento.IsEmpty then
      IdProcesso := qryDocumento.FieldByName('IDPROCESSO').AsFloat
    else
      IdProcesso := 0;

    if IdProcesso > 0 then
    begin
      qryExcluirRAD.Close;
      qryExcluirRAD.ParamByName('IDPROCESSO').AsFloat := IdProcesso;
      qryExcluirRAD.ExecSQL;

      qryDocumento.Close;

      Result := True;
    end;
  end;
end; {CancelaRAD}

end.
