{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
//***************************************************************************************
//Rotina.............: ListContaContabDesemb
//N. SIG.............: 99500
//Data da Alteração..: 20/04/2020
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Criação de método para recuperação conta contábil associada a 
//					   desembolso.
//***************************************************************************************
//Rotina.............: ListPortadorForma
//N. SIG.............: 80588
//Data da Alteração..: 28/02/2020
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Melhoria sobre o procedimento de conciliação de tarifa.
//***************************************************************************************
//Rotina.............: ListPortadorForma
//N. SIG.............: 46651
//Data da Alteração..: 17/01/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de rotina de tratamento para tarifas bancárias. 
//***************************************************************************************
Rotina......: ListCentroCusto, ListCentroRespon, ListTipoRDFaltantesFluxo
Nº SOL......: 136203
Nº KINTANA..: 813205
Data........: 16/06/2014
Responsável.: Edilaine Ferraresi
Descrição...: Nova funcionalidade para Fluxo de Caixa
-----------------------------------------------------------------------------------------
//N. Sol..........: 204706
//N. Kintana......: 1979976
//Data............: 11/04/2013
//Responsável.....: Marcio Sanches Spinosa SOL 204706 Kintana 1979976
//Descrição.......: Carregar portadores somente ativos quando for inserção.
//**********************************************************************************
Rotina ......: recuperaAtividadePerd, carregaAtividade e ListUnidNegocio
SOL..........: 163982
Kintana......: 1404974
Data.........: 23/09/2011
Responsável..: Vinicius Eduardo Nascimento Maciel
Descrição....: Foi adicionado os procedimentos recuperaAtividadePerd e
               carregaAtividade para retornar as atividades que estiverem
               destivadas. Foi modificado o procedimento ListUnidNegocio para
               retornar apenas as atividades ativas.
--------------------------------------------------------------------------------}

unit uCtrlListTercFinanc;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     uCtrlContaContabil;




type
   TCtrlListTercFinanc = Class(TCmControlObject)

   private
      CtrlContaContabil: TCtrlContaContabil;
    function carregaAtividade(sCodAtividade: String): OleVariant;


   public
      function recuperaAtividadePerd(sCodAtividade: String): String;
      constructor Create; override;
      destructor Destroy; override;

      function ListUnidNegocio(rIDPessoa, rUnidNegocio: Double; sUNeTipo,sUNeCodigo: String): OleVariant;
      function ListUnidNegxFluxo(rIDPessoa: Double; sFluxo: String): OleVariant;
      function ListUnidNegxFluxoComp(rIDPessoa: Double; sFluxo1,sFluxo2: String): OleVariant;

      function ListTipoRD(rIDPessoa: Double; sRecPag, sAnaSint: String): OleVariant;
      function ListTipoRDFaltantesFluxo(rIDPessoa: Double; bVerificacao: Boolean; iIdFluxoCaixa: integer;
                                        bAtivos : boolean = false; bAnaliticos : boolean = false): OleVariant;  // edilaine - SOL 136203 / KTN 813205
      function ListTipoRDxCResponFinanc(rIDPessoa: Double; sCodCentroRespon,
                                        sEntradaSaida: String;
                                        iIdFluxoCaixa: integer = -1;
                                        const bEliminaRecDesSemFluxo: Boolean = false): OleVariant;

      function ListCentroRespon(rIDPessoa: Double; sAnaSint,sAtivo,
                                sCodCentroRespon: String; IPlanoCR: Integer ): OleVariant; overload;
      function ListCentroResponxUsuario(rIDPessoa, rIDUsuario: Double; IPlanoCR: Integer ): OleVariant;

      function ListCentroResponxUsuarioAtivos(rIDPessoa, rIDUsuario: Double): OleVariant;

      function ListCentroResponxFluxo(rIDPessoa: Double; sFluxo: String;IPlanoCR : integer): OleVariant;
      function ListCentroResponxFluxoComp(rIDPessoa: Double; sFluxo1,sFluxo2: String;IPlanoCR : integer): OleVariant;

      function ListCentroCusto(rIDPessoa: Double; sStatus,sAtivo: String; IPlanoCC : integer): OleVariant;  overload;
      function ListCentroCustoxConta(rIDPessoa, rPlano: Double;sPlaConta: String; IPlanoCC: Integer): OleVariant;   //
      function ListCentroCustoxFluxo(rIDPessoa: Double; sFluxo: String; IPlanoCC, IPlanoCR: Integer): OleVariant;
      function ListCentroCustoxFluxoComp(rIDPessoa: Double; sFluxo1,sFluxo2: String;IPlanoCC, IPlanoCR: Integer): OleVariant;
      function ListSubConta(rIDPessoa, rPlano: Double;sPlaConta: String): OleVariant;

      function ListTipoDoc(sRecPag: String): OleVariant;
      function ListTipDocXCompFluxoDisp: OleVariant;
      function ListTipDocFaltantesFluxo(rIDPessoa: Double; iIdFluxoCaixa: integer): OleVariant;

      function ListAlteradores(rIDPessoa: Double; sRecPag,sAcresDecres,sConverte: String): OleVariant;

      function ListParamCAP(rIDPessoa: Double; sRecPag: String): OleVariant;

      function ListParamContab(rIDPessoa: Double): OleVariant;

      function ListPortadorConta(rIDPessoa, rCodPortador: Double;
               pIsAtivo : string = ''): OleVariant; //Marcio Sanches Spinosa SOL 204706 Kintana 1979976
      
      function ListParamGlobal(rIDPessoa: Double): OleVariant;

      function ListPrograma: OleVariant;
      
      function ListPatrocinador: OleVariant;
      
      function ListPlanoPrev: OleVariant;
      
      function ListMoeda(rMoeCodigo: Double; bSoMoedaAtiva: Boolean): OleVariant;
      
      function ListModulo(rIDModulo: Double): OleVariant;
      
      function ListExercicio(rIDPessoa: Double): OleVariant;

      function ListPeriodo(rIDPessoa, rExercicio: Double): OleVariant;

      function ListaTipoRecDesxCRespFromFluxo(iIdPessoa: integer; sCodCentroRespon: string; iIdFluxoCaixa : integer = 0; iCodLinhaFluxo: integer = 0): OleVariant;

      function ListTipoAgre(sRecPag: String): OleVariant;

      function ListCentroCusto(bSoDiretoria : boolean) : OleVariant; overload;   // edilaine - SOL 136203 / KTN 813205
      function ListCentroRespon : OleVariant; overload;                          // edilaine - SOL 136203 / KTN 813205

      function ListPortadorForma(pTipoConvenio: Integer = 0): OleVariant; //Cássio Rovaroto - SIG nº 46651
      function ListContaContabDesemb(pCodTipRecDes, pRecPag: string): string; // Cássio Rovaroto - SIG nº 99500
   protected

      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;


   end;





implementation
{ TCtrlListTercFinanc }




constructor TCtrlListTercFinanc.Create;
begin
   inherited;
   CtrlContaContabil:=TCtrlContaContabil.Create;   
end;




destructor TCtrlListTercFinanc.Destroy;
begin
   CtrlContaContabil.Free;
   inherited;
end;




procedure TCtrlListTercFinanc.AfterInitialize;
begin
   inherited;
   CtrlContaContabil.InitializeAs(Self);
end;




procedure TCtrlListTercFinanc.DoChangeDataBase;
begin
   inherited;
end;



function TCtrlListTercFinanc.ListUnidNegocio(rIDPessoa,
  rUnidNegocio: Double; sUNeTipo,sUNeCodigo: String): OleVariant;
var
   sSql    : String;
   sFiltro : String;
begin
   sSql:='SELECT UNIDNEGOC, NOME, UNECODIGO, UNETIPO, IDPESSOA '+
         'FROM UNIDNEGOCIO ';

   sFiltro:='';
   if (rIDPessoa<>0) then
      sFiltro:='WHERE (IDPESSOA = '+FloatToStr(rIDPessoa)+') ';

   if (rUnidNegocio<>0) then
    if (sFiltro='') then
       sFiltro:='WHERE (UNIDNEGOC = '+FloatToStr(rUnidNegocio)+') '
    else
       sFiltro:=sFiltro+'AND (UNIDNEGOC = '+FloatToStr(rUnidNegocio)+') ';

   if Trim(sUNeTipo)<>'' then
    if (sFiltro='') then
       sFiltro:='WHERE (UNETIPO = '''+Trim(sUNeTipo)+''') '
    else
       sFiltro:=sFiltro+'AND (UNETIPO = '''+Trim(sUNeTipo)+''') ';

   if Trim(sUNeCodigo)<>'' then
    if (sFiltro='') then
       sFiltro:='WHERE (UNECODIGO = '''+Trim(sUNeCodigo)+''') '
    else
       sFiltro:=sFiltro+'AND (UNECODIGO = '''+Trim(sUNeCodigo)+''') ';

    //VINICIUS MACIEL - SOL 163982 KTN 1404974
    if (sFiltro='') then
       sFiltro:='WHERE (ATIVO = '+QuotedStr('S')+ ' )'
    else
       sFiltro:=sFiltro+' AND (ATIVO = '+QuotedStr('S')+ ' )';
    //VINICIUS MACIEL - SOL 163982 KTN 1404974 - FIM


   sSql:=sSql+sFiltro+' ORDER BY NOME ';

   Result:=GetDataPacket(sSql);
end;




function TCtrlListTercFinanc.ListUnidNegxFluxo(rIDPessoa: Double;
  sFluxo: String): OleVariant;
begin
   Result:=GetDataPacket('SELECT Distinct '+
                         '   U.UnidNegoc, '+
                         '   U.Nome '+
                         'FROM '+sFluxo+' F,'+
                         '   UnidNegocio U '+
                         'WHERE (F.UnidNegoc=U.UnidNegoc) AND '+
                         '      (U.IDPessoa = '+FloatToStr(rIDPessoa)+') '+
                         'ORDER BY U.Nome');
end;




function TCtrlListTercFinanc.ListUnidNegxFluxoComp(rIDPessoa: Double;
  sFluxo1, sFluxo2: String): OleVariant;
begin
   Result:=GetDataPacket(' SELECT Distinct '+
                         '    U.UnidNegoc, '+
                         '    U.Nome '+
                         ' FROM '+sFluxo1+' F,'+
                         '    UnidNegocio U '+
                         ' WHERE (F.UnidNegoc=U.UnidNegoc) AND '+
                         '       (U.IDPessoa = '+FloatToStr(rIDPessoa)+') '+
                         'UNION '+
                         ' SELECT Distinct '+
                         '    U.UnidNegoc, '+
                         '    U.Nome '+
                         ' FROM '+sFluxo2+' F,'+
                         '    UnidNegocio U '+
                         ' WHERE (F.UnidNegoc=U.UnidNegoc) AND '+
                         '       (U.IDPessoa = '+FloatToStr(rIDPessoa)+') '+
                         'ORDER BY Nome');
end;



function TCtrlListTercFinanc.ListTipoRD(rIDPessoa: Double; sRecPag, sAnaSint: String): OleVariant;
var
   sSql    : String;
   sFiltro : String;
begin
   sSql:='SELECT CODTIPRECDES, DESCRICAO, RECPAG '+
         'FROM TIPORECEBDESEMB ';

   sFiltro:='';
   if (rIDPessoa<>0) then
      sFiltro:='WHERE (IDPESSOA = '+FloatToStr(rIDPessoa)+') ';

   if (sRecPag<>'') then
      if (sFiltro='') then
         sFiltro:='WHERE (RECPAG = '''+sRecPag+''') '
      else
         sFiltro:=sFiltro+'AND (RECPAG = '''+sRecPag+''') ';

   if (sAnaSint<>'') then
      if (sFiltro='') then
         sFiltro:='WHERE (ANASINT = '''+sAnaSint+''') '
      else
         sFiltro:=sFiltro+'AND (ANASINT = '''+sAnaSint+''') ';

   if sFiltro <> '' then
     sFiltro := sFiltro + ' AND ATIVO = ''S'' ';

   sSql:=sSql+sFiltro+' ORDER BY DESCRICAO ';

   Result:=GetDataPacket(sSql);
end;




function TCtrlListTercFinanc.ListTipoRDFaltantesFluxo(rIDPessoa: Double; bVerificacao: Boolean; iIdFluxoCaixa: integer;
                                                      bAtivos : boolean = false; bAnaliticos : boolean = false): OleVariant;
var
   sSql    : String;
   sFiltro : String;
begin
   sSql:='SELECT ';
         if bVerificacao then
            sSql:=sSql+'   TRD.CODTIPRECDES AS CODIGO, '
         else
            sSql:=sSql+'   TRD.CODTIPRECDES, ';

   sSql:=sSql+'   TRD.DESCRICAO, '+
         '   TRD.RECPAG, '+
         '   TRD.ANASINT, '+
         '   ''N'' AS SELECIONADO '+
         'FROM '+
         '   TIPORECEBDESEMB TRD ';
   sFiltro:='WHERE '+
         '   NOT EXISTS(SELECT '+
         '                 C.CODLINHAFLUXO '+
         '              FROM '+
         '                 CompFluxo C '+
         '              WHERE '+
         '                (C.IDFLUXOCAIXA = ' + IntToStr(iIdFluxoCaixa) + ') AND ' +
         '                ((RTrim(C.CODTIPRECDES)=SubStr(RTrim(TRD.CODTIPRECDES),1, '+
         '                                                     Length(RTrim(C.CODTIPRECDES)))) OR '+
         '                 (RTrim(TRD.CODTIPRECDES)=SubStr(RTrim(C.CODTIPRECDES),1, '+
         '                                              Length(RTrim(TRD.CODTIPRECDES))))) AND '+
         '                 (C.RECPAG = TRD.RECPAG) AND (C.IDPESSOA = '+FloatToStr(rIDPessoa)+')) ';

         
   if (rIDPessoa<>0) then
      sFiltro:=sFiltro+'   AND (TRD.IDPESSOA = '+FloatToStr(rIDPessoa)+') ';

   // edilaine - SOL 136203 / KTN 813205 - inicio
   if (bAtivos) then
      sFiltro:=sFiltro+'   AND (TRD.ATIVO = ''S'' ) ';
   if (bAnaliticos) then
      sFiltro:=sFiltro+'   AND (TRD.ANASINT = ''A'' ) ';
   // edilaine - SOL 136203 / KTN 813205 - fim

   sSql:= sSql + sFiltro + ' ORDER BY RECPAG,1 ';

   Result:=GetDataPacket(sSql);
end;




function TCtrlListTercFinanc.ListTipoRDxCResponFinanc(rIDPessoa: Double;
                                       sCodCentroRespon, sEntradaSaida: String;
                                       iIdFluxoCaixa: integer;
                                       const bEliminaRecDesSemFluxo: Boolean): OleVariant;
var
   sSql : String;
   CdsTipRecDes: TClientDataSet;
begin
   try
      CdsTipRecDes := TClientDataSet.Create(nil);
      
      sSql:='SELECT '+
            '   TRD.CODTIPRECDES, ' +
            '   TRD.RECPAG, ' +
            '   TRD.DESCRICAO, ' +
            '   RTRIM(TRD.CODTIPRECDES)||''-''||TRD.RECPAG AS CODTIPRECDESAUX, ' +
            '   TRD.PLACONTA ' +
            'FROM ' +
            '   TIPORECEBDESEMB TRD ' +
            'WHERE ' +
            '   (TRD.ATIVO = ''S'') AND '+
            '   (TRD.ANASINT = ''A'') AND '+
            '   (TRD.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
            '   ((TRD.CODTIPRECDES IN (SELECT CODTIPRECDES '+
            '                          FROM TRDXCRESPON '+
            '                          WHERE (CODCENTRORESPON = '''+Trim(sCodCentroRespon)+''') AND '+
            '                                (IDPESSOA='+FloatToStr(rIDPessoa)+') AND '+
            '                                (RECPAG=TRD.RECPAG)))     OR '+
            '    NOT EXISTS(SELECT * '+
            '               FROM TRDXCRESPON '+
            '               WHERE (CODCENTRORESPON = '''+Trim(sCodCentroRespon)+''') AND '+
            '                     (IDPESSOA='+FloatToStr(rIDPessoa)+'))) ' +
            'ORDER BY TRD.RECPAG ';

            if (sEntradaSaida = 'E') or (sEntradaSaida = 'R') then
               sSql := sSql + ' DESC, TRD.DESCRICAO'
            else
               sSql := sSql + ' ,TRD.DESCRICAO';

            CdsTipRecDes.Data := GetDataPacket(sSql);


            if bEliminaRecDesSemFluxo then
            begin
               // Faz com que se já existir um RecDes "pai" no cadastro do fluxo,
               //descartar os lançamentos "filhos" que estão sem relacionamento direto (1 = 1)
               sSql := 'SELECT CP.CODTIPRECDES, CP.RECPAG ' +
                        'FROM COMPFLUXO CP ' +
                        'WHERE ' +
                        '  (CP.IDPESSOA     = ' + FloatToStr(rIDPessoa)   + ') AND ' +
                        '  (CP.CODTIPRECDES IS NOT NULL) ';

                        if iIdFluxoCaixa <> -1 then
                           sSql := sSql +  ' AND (CP.IDFLUXOCAIXA = ' + IntToStr(iIdFluxoCaixa) + ')';

                        sSql := sSql + 'ORDER BY CP.CODTIPRECDES';

               _Cds.Data := GetDataPacket(sSql);
               while not _Cds.Eof do
               begin
                  CdsTipRecDes.Filtered := false;
                  CdsTipRecDes.Filter   := 'CODTIPRECDES LIKE ' + QuotedStr(_Cds.FieldByName('CODTIPRECDES').AsString + '%') +
                                               ' AND RECPAG = ' + QuotedStr(_Cds.FieldByName('RECPAG').AsString);
                  CdsTipRecDes.Filtered := true;

                  while not CdsTipRecDes.Eof do
                     CdsTipRecDes.Delete;

                  _Cds.Next;
               end;
            end;

      CdsTipRecDes.Filtered := false;
      Result := CdsTipRecDes.Data;

   finally
      FreeAndNil(CdsTipRecDes);
   end;
end;




function TCtrlListTercFinanc.ListCentroRespon(rIDPessoa: Double; sAnaSint,
                                             sAtivo,sCodCentroRespon: String; iPlanoCR:Integer): OleVariant;
var
   sSql    : String;
   sFiltro : String;
begin
     sSql:='SELECT CODCENTRORESPON, CODEXTERNO, NOME,  '+
           '       SUBSTR(CODEXTERNO,1,2) AS DIRETORIA '+          // edilaine - SOL 136203 / KTN 813205
           'FROM CENTRESPON  WHERE ( IDPLANCRESPON = '+InttoStr(iPlanoCR)+ ') ';

   sFiltro:='';
   if (rIDPessoa<>0) then
      sFiltro:='AND (IDPESSOA = '+FloatToStr(rIDPessoa)+') ' ;

   if (sAnaSint<>'') then
      else
         sFiltro:=sFiltro+'AND (ANALITICOSINTET = '''+sAnaSint+''') ';

   if (sAtivo<>'') then
      if (sFiltro='') then
         sFiltro:='AND ((ATIVO = '''+sAtivo+''') OR (ATIVO IS NULL))'
      else
         sFiltro:=sFiltro+'AND ((ATIVO = '''+sAtivo+''') OR (ATIVO IS NULL))';

   if (sCodCentroRespon<>'') then
      if (sFiltro='') then
          sFiltro:='AND (CODCENTRORESPON = '''+sCodCentroRespon+''') '
      else
          sFiltro:=sFiltro+'AND (CODCENTRORESPON = '''+sCodCentroRespon+''') ';

   sSql:=sSql+sFiltro+' ORDER BY NOME ';

   Result:=GetDataPacket(sSql);
end;




function TCtrlListTercFinanc.ListCentroResponxUsuario(rIDPessoa,
  rIDUsuario: Double; IPlanoCR: Integer): OleVariant;
var
   sSql    : String;
begin
   sSql:='SELECT DISTINCT  CR.CODCENTRORESPON, CR.CODEXTERNO, CR.NOME '+
         'FROM CENTRESPON CR,PESSOAXCRESP PCR  '+
         'WHERE '+
         '   (CR.IDPESSOA='+FloatToStr(rIDPessoa)+') AND '+
         '   (CR.CODCENTRORESPON <> ''9999999999'') AND '+
         '   (CR.ANALITICOSINTET = ''A'') AND '+
         '   (CR.IDPLANCRESPON = '+InttoStr(iPlanoCR)+ ') AND '+
         '   (((PCR.IDPESSOA=CR.IDPESSOA) AND '+
         '     (PCR.CODCENTRORESPON=CR.CODCENTRORESPON) AND '+
         '     (PCR.IDPESSOAACESSO = '+FloatToStr(rIDUsuario)+')) OR '+
         '    (NOT EXISTS(SELECT * FROM PESSOAXCRESP PCR2 '+
         '                WHERE (PCR2.IDPESSOAACESSO = '+FloatToStr(rIDUsuario)+') AND '+
         '                      (PCR2.IDPESSOA = '+FloatToStr(rIDPessoa)+')))) '+
         'ORDER BY NOME';
   Result:=GetDataPacket(sSql);
end;




function TCtrlListTercFinanc.ListCentroResponxFluxo(rIDPessoa: Double;
  sFluxo: String; IPlanoCR : integer): OleVariant;
var
   sSql    : String;
begin
   sSql:='SELECT Distinct '+
         '   C.CodCentroRespon, '+
         '   C.CodExterno, '+
         '   C.Nome, '+
         '   C.AnaliticoSintet '+
         'FROM '+sFluxo+' F, '+
         '   CentRespon C '+
         'WHERE (F.CodCentroRespon=C.CodCentroRespon) AND '+
         '      (F.CodCentroRespon<>''9999999999'') AND '+
         '      (F.IDPessoa = '+FloatToStr(rIDPessoa)+') AND '+
         '      (F.IDPessoa = C.IDPessoa) AND '+
        '      (C.IDPLANCRESPON = '+InttoStr(iPlanoCR)+ ')  '+

        'ORDER BY C.Nome';
   Result:=GetDataPacket(sSql);
end;




function TCtrlListTercFinanc.ListCentroResponxFluxoComp(rIDPessoa: Double;
  sFluxo1, sFluxo2: String; IPlanoCR : Integer): OleVariant;
var
   sSql    : String;
begin
   sSql:=' SELECT Distinct '+
         '    C.CodCentroRespon, '+
         '    C.CodExterno, ' +
         '    C.Nome, '+
         '    C.AnaliticoSintet '+
         ' FROM '+sFluxo1+' F, '+
         '    CentRespon C '+
         ' WHERE (F.CodCentroRespon=C.CodCentroRespon) AND '+
         '       (F.CodCentroRespon<>''9999999999'') AND '+
         '       (F.IDPessoa = '+FloatToStr(rIDPessoa)+') AND '+
         '       (F.IDPessoa = C.IDPessoa) AND '+
         '      (C.IDPLANCRESPON = '+InttoStr(iPlanoCR)+ ')  '+
         'UNION '+
         ' SELECT Distinct '+
         '    C.CodCentroRespon, '+
         '    C.CodExterno, ' +
         '    C.Nome, '+
         '    C.AnaliticoSintet '+
         ' FROM '+sFluxo2+' F, '+
         '    CentRespon C '+
         ' WHERE (F.CodCentroRespon=C.CodCentroRespon) AND '+
         '       (F.CodCentroRespon<>''9999999999'') AND '+
         '       (F.IDPessoa = '+FloatToStr(rIDPessoa)+') AND '+
         '       (F.IDPessoa = C.IDPessoa) AND  '+
         '      (C.IDPLANCRESPON = '+InttoStr(iPlanoCR)+') '+
         'ORDER BY Nome';
   Result:=GetDataPacket(sSql);
end;




function TCtrlListTercFinanc.ListCentroCusto(rIDPessoa: Double; sStatus,sAtivo: String; IPlanoCC:Integer): OleVariant;
var
   sSql    : String;
   sFiltro : String;
begin
     sSql:='SELECT CODCENTROCUSTO, CODEXTERNO, NOME '+
           'FROM CENTCUST  WHERE   ' +
           '(IDPLANCENTCUST =  ' +InttoStr(IPlanoCC)+') ' ;


   sFiltro:='';
   if (rIDPessoa<>0) then
      sFiltro:='AND (IDEMPRESA = '+FloatToStr(rIDPessoa)+') ';

   if (sStatus<>'') then
      if (sFiltro='') then
         sFiltro:='AND (STATUSGRUPOCDC = '''+sStatus+''') '
      else
         sFiltro:=sFiltro+'AND (STATUSGRUPOCDC = '''+sStatus+''') ';

   if (sAtivo<>'') then
      if (sFiltro='') then
         sFiltro:='AND ((ATIVO = '''+sAtivo+''') OR (ATIVO IS NULL))'
      else
         sFiltro:=sFiltro+'AND ((ATIVO = '''+sAtivo+''') OR (ATIVO IS NULL))';

   sSql:=sSql+sFiltro+' ORDER BY NOME ';

   Result:=GetDataPacket(sSql);
end;




function TCtrlListTercFinanc.ListCentroCustoxConta(rIDPessoa, rPlano: Double;
  sPlaConta: String; iPlanoCC: Integer): OleVariant;
var
   sSql    : String;
begin
   sSql:=' SELECT '+
         '    C.CODCENTROCUSTO, '+
         '    C.CODEXTERNO, ' +
         '    C.NOME, '+
         '    C.STATUSGRUPOCDC '+
         ' FROM '+
         '    CENTCUST C, '+
         '    PLANCENTCUST PC ' +
         ' WHERE '+
         '    (C.IDEMPRESA ='+FloatToStr(rIDPessoa)+') AND '+
         '    (C.STATUSGRUPOCDC=''A'') AND '+
         '    (C.IDPLANCENTCUST = '+InttoStr(iPlanoCC)+ ') AND '+
         '    (C.ATIVO=''S'') AND '+
         '    (NOT EXISTS (SELECT 1 '+
         '                 FROM CONTASxCC U '+
         '                 WHERE (U.PLACONTA = '''+Trim(sPlaConta)+ ''') AND '+
         '                       (U.PLANO = '+ FloatToStr(rPlano)+') AND '+
         '                       (U.IDEMPRESA = '+FloatToStr(rIDPessoa)+'))) '+
         'UNION '+
         ' SELECT '+
         '    C.CODCENTROCUSTO, '+
         '    C.CODEXTERNO, ' +
         '    C.NOME, '+
         '    C.STATUSGRUPOCDC '+
         ' FROM '+
         '    CENTCUST C, '+
         '    CONTASxCC CC, '+
         '    PLANCENTCUST PC '+
         ' WHERE '+
         '    (CC.PLANO = '+ FloatToStr(rPlano)+') AND '+
         '    (CC.PLACONTA = '''+Trim(sPlaConta)+ ''') AND '+
         '    (C.IDEMPRESA ='+FloatToStr(rIDPessoa)+') AND '+
         '    (C.STATUSGRUPOCDC=''A'') AND '+
         '    (C.ATIVO=''S'') AND '+
         '    (C.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND '+
         '    (C.IDEMPRESA = CC.IDEMPRESA) AND '+
         '    (C.IDPLANCENTCUST = '+InttoStr(iPlanoCC)+ ')'+
         'ORDER BY CODCENTROCUSTO';

   Result:=GetDataPacket(sSql);
end;




function TCtrlListTercFinanc.ListCentroCustoxFluxo(rIDPessoa: Double;
  sFluxo: String; IPlanoCC, IPLanoCR: Integer): OleVariant;
var
   sSql    : String;
begin
   sSql:='SELECT Distinct '+
         '   C.CodCentroCusto, '+
         '   C.CodExterno, '+
         '   C.Nome '+
         'FROM '+sFluxo+' F, '+
         '   CENTCUST C '+
         'WHERE (F.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '      (C.IDEMPRESA = F.IDPESSOA) AND '+
         '      (F.CODCENTROCUSTO=C.CODCENTROCUSTO) AND  '+
         '      (C.IDPLANCENTCUST = '+InttoStr(iPlanoCC)+ ') ' +
         'ORDER BY C.Nome';

   Result:=GetDataPacket(sSql);
end;




function TCtrlListTercFinanc.ListCentroCustoxFluxoComp(rIDPessoa: Double;
  sFluxo1, sFluxo2: String; IPLanoCC, IPlanoCR: Integer): OleVariant;
var
   sSql    : String;
begin
   sSql:=' SELECT Distinct '+
         '    C.CodCentroCusto, '+
         '   C.CodExterno, '+
         '    C.Nome '+
         ' FROM '+sFluxo1+' F, '+
         '    CENTCUST C '+
         ' WHERE (F.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '       (C.IDEMPRESA = F.IDPESSOA) AND '+
         '       (F.CODCENTROCUSTO=C.CODCENTROCUSTO) AND  '+
         '       (C.IDPLANCENTCUST = '+InttoStr(iPlanoCC)+ ') ' +
         'UNION '+
         ' SELECT Distinct '+
         '    C.CodCentroCusto, '+
         '   C.CodExterno, '+
         '    C.Nome '+
         ' FROM '+sFluxo2+' F, '+
         '    CENTCUST C '+
         ' WHERE (F.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '       (C.IDEMPRESA = F.IDPESSOA) AND '+
         '       (F.CODCENTROCUSTO=C.CODCENTROCUSTO) AND '+
         '       (C.IDPLANCENTCUST = '+InttoStr(iPlanoCC)+ ') ' +
         'ORDER BY Nome';

   Result:=GetDataPacket(sSql);
end;




function TCtrlListTercFinanc.ListSubConta(rIDPessoa, rPlano: Double; sPlaConta: String): OleVariant;
begin
   Result:=CtrlContaContabil.ListContasxSC(rPlano,rIDPessoa,0,sPlaConta,toNome);
end;




function TCtrlListTercFinanc.ListTipDocXCompFluxoDisp: OleVariant;
var
   sSql    : String;
begin
   sSql:='SELECT '+
         '   TD.CODTIPDOC, '+
         '   TD.DESCRICAO, '+
         '   TD.RECPAG '+
         'FROM '+
         '   TIPODOCRECPAG TD '+
         'WHERE '+
         '   NOT Exists(SELECT CF.CODTIPDOC '+
         '              FROM COMPFLUXO CF '+
         '              WHERE (CF.CODTIPDOC=TD.CODTIPDOC) AND '+
         '                    (TD.CODTIPDOC IS NOT NULL)) ';
   Result:=GetDataPacket(sSql);
end;




function TCtrlListTercFinanc.ListTipDocFaltantesFluxo(rIDPessoa: Double; iIdFluxoCaixa: integer): OleVariant;
var
   sSql    : String;
begin
   sSql:='SELECT '+#13+
         '   TO_CHAR(TD.CODTIPDOC) AS CODIGO, '+#13+
         '   TD.DESCRICAO, '+#13+
         '   TD.RECPAG, '+#13+
         '   ''N'' AS SELECIONADO '+#13+
         'FROM '+#13+
         '   TIPODOCRECPAG TD '+#13+
         'WHERE '+#13+
         '   NOT EXISTS(SELECT '+#13+
         '                 C.CODLINHAFLUXO '+#13+
         '              FROM '+#13+
         '                 CompFluxo C '+#13+
         '              WHERE '+#13+
         '                 (C.IDFLUXOCAIXA = ' + IntToStr(iIdFluxoCaixa) + ') AND ' + 
         '                 (C.CODTIPDOC    = TD.CODTIPDOC) AND (C.RECPAG=TD.RECPAG) AND '+#13+
         '                 (C.IDPESSOA     = '+FloatToStr(rIDPessoa)+')) '+#13+
         'ORDER BY TD.RECPAG ';

   Result:=GetDataPacket(sSql);
end;




function TCtrlListTercFinanc.ListTipoDoc(sRecPag: String): OleVariant;
var
   sSql    : String;
begin
   sSql:='SELECT '+
         '   TD.CODTIPDOC, '+
         '   TD.DESCRICAO, '+
         '   TD.RECPAG '+
         'FROM '+
         '   TIPODOCRECPAG TD ';

   if (sRecPag<>'') then sSql:=sSql+'WHERE (RECPAG='''+sRecPag+''') ';
   sSql:=sSql+'ORDER BY DESCRICAO';
   Result:=GetDataPacket(sSql);
end;



function TCtrlListTercFinanc.ListAlteradores(rIDPessoa: Double; sRecPag,sAcresDecres,sConverte: String): OleVariant;
var
   sSql    : String;
   sFiltro : String;
begin
   sSql:='SELECT '+
         '   CODALTERADOR, '+
         '   DESCRICAO, '+
         '   RECPAG, '+
         '   CONVERTE '+
         'FROM TIPOALTERADOR ';

   sFiltro:='';
   if (rIDPessoa<>0) then
      sFiltro:='WHERE  (IDPESSOA = '+FloatToStr(rIDPessoa)+') ';

   if (sRecPag<>'') then
      if (sFiltro='') then
         sFiltro:='WHERE  (RECPAG = '''+sRecPag+''') '
      else
         sFiltro:=sFiltro+' AND (RECPAG = '''+sRecPag+''') ';

   if (sAcresDecres<>'') then
      if (sFiltro='') then
         sFiltro:='WHERE  (ACRESDECRES = '''+sAcresDecres+''') '
      else
         sFiltro:=sFiltro+' AND (ACRESDECRES = '''+sAcresDecres+''') ';

   if (sConverte<>'') then
      if (sFiltro='') then
         sFiltro:='WHERE  (CONVERTE = '''+sConverte+''') '
      else
         sFiltro:=sFiltro+' AND (CONVERTE = '''+sConverte+''') ';

   sSql:=sSql+sFiltro+'ORDER BY DESCRICAO ';

   Result:=GetDataPacket(sSql);
end;




function TCtrlListTercFinanc.ListParamCAP(rIDPessoa: Double;
  sRecPag: String): OleVariant;
var
   sSql : String;
   sFiltro : String;
begin
   sSql:='SELECT '+
         '   MASCARADESEMB, RECPAG '+
         'FROM PARAMCAP ';
   sFiltro:='WHERE (IDPESSOA = '+FloatToStr(rIDPessoa)+') ';

   if (sRecPag<>'') then
      sFiltro:=sFiltro+'      (RECPAG = '''+sRecPag+''') ';

   sSql:=sSql+sFiltro;

   Result:=GetDataPacket(sSql);
end;



function TCtrlListTercFinanc.ListPortadorConta(rIDPessoa,
                                               rCodPortador: Double;
                                               pIsAtivo : string = ''): OleVariant;//Marcio Sanches Spinosa SOL 204706 Kintana 1979976
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   PC.*, '+
         '   BC.NUMBANCO '+
         'FROM '+
         '   PORTADORCONTA PC, '+
         '   BANCO BC '+
         'WHERE '+
         '   (PC.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '   (PC.IDBANCO = BC.IDPESSOA(+)) ';

   if (rCodPortador<>0) then
      sSql:=sSql+'   AND (PC.CODPORTADOR = '+FloatToStr(rCodPortador)+') ';

//Marcio Sanches Spinosa SOL 204706 Kintana 1979976 - Inicio
   if (pIsAtivo <> '') then
      Ssql := ssql + ' AND PC.FLGSTATUS = ''A'' ';
//Marcio Sanches Spinosa SOL 204706 Kintana 1979976 - Fim

   sSql:=sSql+'ORDER BY PC.DESCRICAO';
   Result:=GetDataPacket(sSql);
end;



function TCtrlListTercFinanc.ListParamGlobal(rIDPessoa: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT USACRESPON,USAABC,UNIDNEGOC,CODCENTRORESPON,MOEDACORRENTE '+
         'FROM PARAMGLOBAL '+
         'WHERE (IDPESSOA = '+FloatToStr(rIDPessoa)+') ';
   Result:=GetDataPacket(sSql);
end;



function TCtrlListTercFinanc.ListParamContab(rIDPessoa: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT PACESTORNA '+
         'FROM PARAMCONTAB '+
         'WHERE (IDPESSOA = '+FloatToStr(rIDPessoa)+') ';
   Result:=GetDataPacket(sSql);
end;




function TCtrlListTercFinanc.ListPatrocinador: OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT PT.IDPESSOA, P.NOME AS RAZAOSOCIAL '+
         'FROM PESSOA P, PATRO PT '+
         'WHERE (P.IDPESSOA = PT.IDPESSOA) '+
         'ORDER BY RAZAOSOCIAL ';
   Result:=GetDataPacket(sSql);
end;




function TCtrlListTercFinanc.ListPlanoPrev: OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT IDPLANOPREV, NOME '+
         'FROM PLANPREVCONTABIL '+
         'WHERE NVL(ATIVO, ''S'') = ''S'' '+
         'ORDER BY NOME ';
   Result:=GetDataPacket(sSql);
end;





function TCtrlListTercFinanc.ListPrograma: OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT IDPROGRAMA, DESCPROGRAMA '+
         'FROM PROGRAMA '+
         'ORDER BY DESCPROGRAMA ';
   Result:=GetDataPacket(sSql);
end;




function TCtrlListTercFinanc.ListMoeda(rMoeCodigo: Double; bSoMoedaAtiva: Boolean): OleVariant;
var
   sSql    : String;
   sFiltro : String;
begin
   sSql:='SELECT * '+
         'FROM MOEDA ';

   sFiltro:='';
   if (rMoeCodigo<>0) then
       sFiltro:='WHERE (MOECODIGO = '+FloatToStr(rMoeCodigo)+') ';

   if bSoMoedaAtiva then
      if (sFiltro='') then
         sFiltro:='WHERE (MOEINATIVO <> ''I'') '
      else
         sFiltro:=sFiltro+' AND (MOEINATIVO <> ''I'') ';

   sSql:=sSql+sFiltro+' ORDER BY MOEDESC ';

   Result:=GetDataPacket(sSql);
end;




function TCtrlListTercFinanc.ListModulo(rIDModulo: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT * FROM MODULO WHERE (IDMODULO = '+FloatToStr(rIDModulo)+') ';
   Result:=GetDataPacket(sSql);
end;




function TCtrlListTercFinanc.ListExercicio(rIDPessoa: Double): OleVariant;
begin
   Result:=GetDataPacket('SELECT DISTINCT EXERCICIO '+
                         'FROM PERIODOORCAMEN '+
                         'WHERE (IDPESSOA = '+FloatToStr(rIDPessoa)+') '+
                         'ORDER BY EXERCICIO');
end;




function TCtrlListTercFinanc.ListPeriodo(rIDPessoa, rExercicio: Double): OleVariant;
begin
   Result:=GetDataPacket('SELECT PERIODO, NOMEPERIODO '+
                         'FROM PERIODOORCAMEN '+
                         'WHERE (IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
                         '      (EXERCICIO = '+FloatToStr(rExercicio)+') '+
                         'ORDER BY PERIODO');
end;



function TCtrlListTercFinanc.ListCentroResponxUsuarioAtivos(rIDPessoa, rIDUsuario: Double): OleVariant;
var
   sSql    : String;
begin
   sSql:='SELECT DISTINCT CR.CODCENTRORESPON, CR.CODEXTERNO, CR.NOME '+
         'FROM CENTRESPON CR,PESSOAXCRESP PCR '+
         'WHERE '+
         '   (CR.IDPESSOA='+FloatToStr(rIDPessoa)+') AND '+
         '   (CR.CODCENTRORESPON <> ''9999999999'') AND '+
         '   (CR.ANALITICOSINTET = ''A'') AND '+
         '   (((PCR.IDPESSOA=CR.IDPESSOA) AND '+
         '     (PCR.CODCENTRORESPON=CR.CODCENTRORESPON) AND '+
         '     (PCR.IDPESSOAACESSO = '+FloatToStr(rIDUsuario)+')) OR '+
         '    (NOT EXISTS(SELECT * FROM PESSOAXCRESP PCR2 '+
         '                WHERE (PCR2.IDPESSOAACESSO = '+FloatToStr(rIDUsuario)+') AND '+
         '                      (PCR2.IDPESSOA = '+FloatToStr(rIDPessoa)+')))) '+
         ' AND ( CR.ATIVO = ''S'' ) ' +
         'ORDER BY NOME';
   Result:=GetDataPacket(sSql);
end;




function TCtrlListTercFinanc.ListTipoAgre(sRecPag: String): OleVariant;
begin
   Result := GetDataPacket('SELECT CODTIPOCUSTAGREG, DESCCUSTAGREG FROM TIPOAGRE WHERE RECPAG = ' + QuotedStr(sRecPag));
end;




function TCtrlListTercFinanc.ListaTipoRecDesxCRespFromFluxo(iIdPessoa: integer; sCodCentroRespon: string;
                                                            iIdFluxoCaixa: integer; iCodLinhaFluxo: integer): OleVariant;
var
   sSQL: string;
begin
   sSQL := 'SELECT ' +
           '   CF.CODLINHAFLUXO, ' +
           
           '   TRD.CODTIPRECDES, ' +
           '   TRD.DESCRICAO, ' +
           '   TRD.RECPAG, ' +
           '   TRD.PLACONTA ' +

           'FROM ' +
           '   TIPORECEBDESEMB TRD, ' +
           '   COMPFLUXO CF ' +
           'WHERE ' +
           '   (SUBSTR(TRIM(TRD.CODTIPRECDES),1,LENGTH(CF.CODTIPRECDES)) LIKE TRIM(CF.CODTIPRECDES) || ''%'' )  AND ' +
           '   (TRD.RECPAG       = CF.RECPAG) AND ';

           if iCodLinhaFluxo <> 0 then
              sSQL := sSQL + '   (CF.CODLINHAFLUXO = ' + IntToStr(iCodLinhaFluxo) + ') AND ';

           if iIdFluxoCaixa <> 0 then
              sSQL := sSQL + '   (CF.IDFLUXOCAIXA  = ' + IntToStr(iIdFluxoCaixa)  + ') AND ';

           sSQL := sSQL +
           '   (TRD.ATIVO        = ''S'') AND ' +
           '   (TRD.ANASINT      = ''A'') AND ' +
           '    EXISTS (SELECT CODTIPRECDES ' +
           '            FROM TRDXCRESPON ' +
           '            WHERE (CODCENTRORESPON = ' + QuotedStr(sCodCentroRespon) + ') AND ' +
           '                  (IDPESSOA        = ' + IntToStr(iIdPessoa) + ') AND ' +
           '                  (RECPAG          = TRD.RECPAG)) ' +
           'ORDER BY ' +
           '   TRD.RECPAG, TRD.DESCRICAO ';

   Result := GetDataPacket(sSQL);
end;

//Vinicius Maciel - SOL 163982 KTN 1404974
function TCtrlListTercFinanc.recuperaAtividadePerd(sCodAtividade : String) : String;
var
    CdsAux : TClientDataSet;
begin
    CdsAux := TClientDataSet.create(nil);
    CdsAux.Data := carregaAtividade(sCodAtividade);
    Result := CdsAux.FieldByName('Nome').asString;
    CdsAux.Free;
end;


function TCtrlListTercFinanc.carregaAtividade(sCodAtividade : String) :OleVariant;
var
    sSQl : String;
begin
    sSQL := 'SELECT NOME FROM UNIDNEGOCIO WHERE UNIDNEGOC = '+sCodAtividade;
    result := GetDataPacket(sSQL);
end;

//Vinicius Maciel - SOL 163982 KTN 1404974 - Fim


function TCtrlListTercFinanc.ListCentroCusto(bSoDiretoria : boolean) : OleVariant;
var
  sSQL : string;
begin
  sSql := 'SELECT CODCENTROCUSTO, CODEXTERNO, NOME,    '+
          '       SUBSTR(CODEXTERNO,1,2) AS DIRETORIA  '+
          '  FROM CENTCUST                             '+
          ' WHERE ((ATIVO = ''S'') OR (ATIVO IS NULL)) ';

  if bSoDiretoria then
     sSQL := sSQL +
          '   AND LENGTH(TRIM(CODEXTERNO)) = 2      '+
          '   AND STATUSGRUPOCDC = ''S''            ';

  if (not bSoDiretoria) then
     sSQL := sSQL +
          '   AND STATUSGRUPOCDC <> ''S'' ';

  sSql := sSql + ' ORDER BY NOME ';

  Result := GetDataPacket(sSql);
end;


function TCtrlListTercFinanc.ListCentroRespon: OleVariant;
var
  sSQL : string;
begin
  sSql := 'SELECT CODCENTRORESPON, CODEXTERNO, NOME,   '+
          '       SUBSTR(CODEXTERNO,1,2) AS DIRETORIA  '+
          '  FROM CENTRESPON                           '+
          ' WHERE ((ATIVO = ''S'') OR (ATIVO IS NULL)) ';

  sSql := sSql + ' ORDER BY NOME ';

  Result := GetDataPacket(sSql);
end;

function TCtrlListTercFinanc.ListPortadorForma(
  pTipoConvenio: Integer): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT CODPORTFORMA,                                              ' +#13#10+
          '       RECPAG,                                                    ' +#13#10+
          '       DECODE(RECPAG, ''P'', ''Débito'', ''Crédito'') AS TIPOCONV, ' +#13#10+
          '       DESCRICAO,                                                 ' +#13#10+
           '      NUMEMPRESABANCO                                            ' +#13#10+
          '  FROM PORTADORFORMA                                              ' +#13#10+
          ' WHERE NVL(FLGATIVO, ''S'') = ''S''                               ';
  if pTipoConvenio = 1 then
    sSQL := sSQL + '   AND FLGARQUIVO = ''S''';
  sSQL := sSQL + ' ORDER BY DESCRICAO                                        ';
    
  Result := GetDataPacket(sSQL);
end;
function TCtrlListTercFinanc.ListContaContabDesemb(
  pCodTipRecDes, pRecPag: string): string;
var
  sSQL: string;
  _cds: TClientDataSet;
begin
  _cds := TClientDataSet.Create(nil);
  try
    sSQL := 'SELECT NVL(PLACONTA, '' '') AS PLACONTA           ' +#13+
            '  FROM TIPORECEBDESEMB                            ' +#13+
            ' WHERE RECPAG = ' + QuotedStr(pRecPag)              +#13+ 
            '   AND CODTIPRECDES = ' + QuotedStr(pCodTipRecDes);
    _cds.Data := GetDataPacket(sSQL);

    Result := _cds.FieldByName('PLACONTA').asString;
  finally
    FreeAndNil(_cds);
  end;
end;

end.
