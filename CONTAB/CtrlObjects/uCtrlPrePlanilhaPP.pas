unit uCtrlPrePlanilhaPP;
(*==============================================================================
Analista           : andré tavares
Data               : 02/08/2007
Pendência          : 26452
Métodos Atualizados: ListLancaPrePronta
Descrição          : Faltava o join com a coluna Plano
(*==============================================================================
(*==============================================================================
Analista           : Marcus Oliveira
Data               : 20/12/2006
Pendência          : 24117
Métodos Atualizados: ListLancaPrePronta.
Descrição          : Removido o outer join do HITCODHIST, pois trazia registro vazio.
(*==============================================================================
Analista           : Marcus Oliveira
Data               : 20/12/2006
Pendência          : 23804
Métodos Atualizados: ListLancaPrePronta  e  ListCdsDetalhePP
Descrição          : Permitir que a fundação possa optar por código reduzido, Código
                     da conta contabil e código correspondente. Incluir campos na Grid
(*==============================================================================
Analista           : Rodolpho da Silva
Data               : 02/03/2006
Pendência          : 21657
Métodos Atualizados: ListCdsDetalhePP
Descrição          : Colocar um OUTER JOIN na tabela CENTCUST pelo campo CODCENTROCUSTO
(*==============================================================================
Analista           : Antonio Marcos Fernandes de Souza (amf)
Data               : 21.12.2005
Pendência          : 15326
Métodos Atualizados: ListCdsDetalhePP
(*==============================================================================
Analista : Alex Pereira
Data     : 13/01/2005
Pendência: 18408
Correção na query para: to_date(to_char(sysdate, 'dd/mm/yyyy'), 'dd/mm/yyyy')
{==============================================================================
Analista : André Tavares
Data     : 17/05/2004
Pendência: 16618
Métodos atualizados: ListLancaPrePronta, ListCdsDetalhePP
(*==============================================================================
Analista : Alex Pereira
Data     : 19/01/04
Pendência: 14451 Nova estrutura para segregação
Solução  : Criar a estrutura IDSEGREGACRITER e DATASEGREGACRITER
           no lançamento contábil.

Métodos atualizados: ListLancaPrePronta, FazLancamentos
==============================================================================*)





interface

Uses DB, uDataBase, uCmControlObject, dbclient, sysutils,Provider,
     ComCtrls,CMProcuraMask,CMProcura,DBTables, uCtrlPadroes,
     uDbPrePlanilha,uCtrlPrePlanilha,uCtrlLancamento,
     uCMTypes;
  Type

    TCtrlPrePlanilhaPP = Class(TCtrlPrePlanilha)

    private
       FCodPlanilha    :Double;
       FTotalredDeb    :Double;
       FTotalredCre    :Double;
       Lancamento      :TCtrlLancamento;
       FcdsLancamentos :TClientDataSet;
       FcdsTotalDebCre :TClientDataSet;
       FCodHistVazio   :Boolean;
       FRetornoPlnPlanil:Double;
       Padroes :TCtrlPadroes;
       procedure SetcdsLancamentos(const Value: TClientDataSet);
       procedure SetcdsTotalDebCre(const Value: TClientDataSet);

    protected
        procedure AfterInitialize;override;

    public
        Constructor Create; Override;
        Destructor Destroy; Override;

        Property RetornoPlnPlanil: Double read FRetornoPlnPlanil;

        Property TotalredDeb :Double read FTotalredDeb write FTotalredDeb;
        Property TotalredCre :Double read FTotalredCre write FTotalredCre;

        Property CodPlanilha  :Double read FCodPlanilha write FCodPlanilha;
        Property CodHistVazio :Boolean read FCodHistVazio write FCodHistVazio;
        Property cdsLancamentos  : TClientDataSet read FcdsLancamentos write SetcdsLancamentos;
        Property cdsTotalDebCre : TClientDataSet read FcdsTotalDebCre write SetcdsTotalDebCre;

       {Esta função tem como finalidade procurar os detalhes do cadastro pre-planilha}
       Function ListCdsDetalhePP(dPanCodigo :Double; ordenaNumOrdem : Boolean = false) :OleVariant;

       {Esta função tem como finalidade buscar as planilhas pre-prontas para o cadastro das planilhas pre-planilha}
       Function ListPlanilhasPreProntas(dEmpresa :double) :OleVariant;

       {Esta função tem o objetivo de selecionar os lancamentos de uma planilha pre-pronta}
       Function ListLancaPrePronta(dEmpresa,dPanCod :Double; OrdenaNumOrdem: Boolean = false) :OleVariant;

       {Esta função tem o objetivo de fazer lancamentos do cad.lanc.pre-pronta}
       Function FazLancamentos(dEmpresa :Double;iModulo,iPlano,iUsuario :integer;
                               sDataLanc :string;bJunta,bUsaPlanoPatro:Boolean):Boolean;

       {Esta função tem o objetivo de verificar se todos os historicos são iguais}
       Function TemHistoIguais(dEmpresa:Double;iPanCod:Integer) :Boolean;

       {Esta função tem o objetivo de verificar se todos os documentos estão vazios}
       Function SemNumDocumento(dEmpresa:Double;iPanCod:Integer) :Boolean;

       {Esta procedure tem o objetivo de totalizar os lançamentos}
       procedure TotalizaDebCre;

       {Esta função tem o objetivo de retornar o tipo de conversão}
       Function RetornaTipConv(i:integer):string;

       {Esta função tem o objetivo de retornar o indice do tipo de conversão}
       Function RetornaIndiceTipConv(s:string):integer;
    End;


implementation


constructor TCtrlPrePlanilhaPP.Create;
begin
  inherited;
  Lancamento := TCtrlLancamento.Create;
  cdsTotalDebCre := TClientDataSet.Create(nil);
  CdsLancamentos := TClientDataSet.Create(nil);
  Padroes := TCtrlPadroes.Create;
end;


destructor TCtrlPrePlanilhaPP.Destroy;
begin
   inherited;
   Lancamento.Free;
   cdsTotalDebCre.Free;
   cdsLancamentos.Free;
   Padroes.free;
End;


procedure TCtrlPrePlanilhaPP.TotalizaDebCre;
var
   rValorDeb :double;
   rValorCre :double;

begin
   rValorDeb    := 0;
   rValorCre    := 0;

   FTotalredDeb := 0;
   FTotalredCre := 0;

   CdsTotalDebCre.First;
   While Not CdsTotalDebCre.Eof Do
   Begin
      If  CdsTotalDebCre.FieldByName('PANTIPO').AsString = 'C' Then
      Begin
        rValorCre := rValorCre  + CdsTotalDebCre.FieldByName('VALOR').AsFloat;
        rValorCre := rValorCre  + CdsTotalDebCre.FieldByName('REDOFCRE').AsFloat;
        rValorCre := rValorCre  + CdsTotalDebCre.FieldByName('REDG1CRE').AsFloat;
        rValorCre := rValorCre  + CdsTotalDebCre.FieldByName('REDG2CRE').AsFloat;
        rValorCre := rValorCre  + CdsTotalDebCre.FieldByName('REDG3CRE').AsFloat;
        rValorCre := rValorCre  + CdsTotalDebCre.FieldByName('REDHISTCRE').AsFloat;
      End Else
      If  CdsTotalDebCre.FieldByName('PANTIPO').AsString = 'D' Then
      Begin
        rValorDeb := rValorDeb  + CdsTotalDebCre.FieldByName('VALOR').AsFloat;
        rValorDeb := rValorDeb  + CdsTotalDebCre.FieldByName('REDOFDEB').AsFloat;
        rValorDeb := rValorDeb  + CdsTotalDebCre.FieldByName('REDG1DEB').AsFloat;
        rValorDeb := rValorDeb  + CdsTotalDebCre.FieldByName('REDG2DEB').AsFloat;
        rValorDeb := rValorDeb  + CdsTotalDebCre.FieldByName('REDG3DEB').AsFloat;
        rValorDeb := rValorDeb  + CdsTotalDebCre.FieldByName('REDHISTDEB').AsFloat;
      End;
      CdsTotalDebCre.Next;
   End;

   FTotalredDeb :=  rValorDeb;
   FTotalredCre :=  rValorCre;


end;

function TCtrlPrePlanilhaPP.FazLancamentos(dEmpresa :Double;iModulo,iPlano,iUsuario :integer;
                                           sDataLanc :string;bJunta,bUsaPlanoPatro:Boolean):Boolean;
var
  sMens,sContaC,sCCustC,sContaD,sCCustD, sSql: String;
  dSubContaC,dSubContaD :Double;
  cTipoLanc :Char;
  cdsPlanilhaGerada :TClientDataSet;
  iIdSegregaCriter: integer;
  dDataSegregaCriter: TDateTime;

begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.FazLancamentosPlanilPP(dEmpresa,iModulo,iPlano,iUsuario,sDataLanc,
                                                            bJunta,bUsaPlanoPatro,FRetornoPlnPlanil,FCdsLancamentos.Data);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
         MessageInfo := 'A Planilha no. ' + Connection.AppServer.MessageInfo + ' foi gerada com sucesso.';
   End Else
   Begin
      sMens        := '';
      FCodplanilha := 0;
      sContaC      := '';
      sCCustC      := '';
      dSubContaC   := 0;
      cTipoLanc    := '0';
      sContaD      := '';
      sCCustD      := '';
      dSubContaD   := 0;

      Try
         cdsPlanilhaGerada := TClientDataSet.Create(nil);

         StartTransaction;

         cdsLancamentos.First;
         While not cdsLancamentos.EOF do
         Begin

            If cdsLancamentos.FieldByName('PANTIPO').asString = 'C' Then
            Begin
               sContaC    := cdsLancamentos.FieldByName('PLACONTA').asString;
               sCCustC    := cdsLancamentos.FieldByName('CODCENTROCUSTO').asString;
               dSubContaC := cdsLancamentos.FieldByName('CODSUBCONTA').asFloat;
               cTipoLanc  := '1';
               sContaD    := '';
               sCCustD    := '';
               dSubContaD := 0;
            End Else
            If cdsLancamentos.FieldByName('PANTIPO').asString = 'D' Then
            Begin
               sContaD    := cdsLancamentos.FieldByName('PLACONTA').asString;
               sCCustD    := cdsLancamentos.FieldByName('CODCENTROCUSTO').asString;
               dSubContaD := cdsLancamentos.FieldByName('CODSUBCONTA').asFloat;
               cTipoLanc  := '0';
               sContaC    := '';
               sCCustC    := '';
               dSubContaC := 0;
            End;

            iIdSegregaCriter := -1;
            dDataSegregaCriter := -1;
            if CdsLancamentos.FieldByName('IDSEGREGACRITER').AsInteger > 0 then begin
              iIdSegregaCriter := CdsLancamentos.FieldByName('IDSEGREGACRITER').AsInteger;
              dDataSegregaCriter := CdsLancamentos.FieldByName('DATASEGREGACRITER').AsDateTime;
            end;

            If cdsLancamentos.FieldByName('VALOR').AsFloat <> 0 Then
            Begin
              If not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,
                                                  iUsuario, iPlano,
                                                  cdsLancamentos.FieldByName('UNIDNEGOC').AsFloat,
                                                  dSubContaD,dSubContaC,
                                                  CdsLancamentos.FieldByName('IDPLANOPREV').AsFloat,
                                                  CdsLancamentos.FieldByName('IDPATRO').AsFloat,
                                                  CodPlanilha,0,sDataLanc,
                                                  CdsLancamentos.FieldByName('NUMDOC').AsString,
                                                  CdsLancamentos.FieldByName('HIST1').AsString,
                                                  CdsLancamentos.FieldByName('HIST2').AsString,
                                                  CdsLancamentos.FieldByName('HIST3').AsString,
                                                  CdsLancamentos.FieldByName('HIST4').AsString,
                                                  CdsLancamentos.FieldByName('HIST5').AsString,
                                                  CdsLancamentos.FieldByName('TIPCODIGO').AsString,
                                                  sCCustD,sContaD,sCCustC,sContaC,
                                                  CdsLancamentos.FieldByName('HITCODHIST').AsString,
                                                  cdsLancamentos.FieldByName('VALOR').asFloat,
                                                  bJunta,bUsaPlanoPatro,
                                                  iIdSegregaCriter, dDataSegregaCriter) Then

                Begin
                  Raise Exception.Create(Lancamento.MessageInfo);
                End Else
                Begin
                   CodPlanilha := Lancamento.RetornoPlnCodigo;
                End
            End;
            cdsLancamentos.Next;
         End;
         Result := True;

         sSql := 'SELECT PLNPLANIL FROM PLANILHA ' +
                 'WHERE (PLNCODIGO = ' + FloatToStr(CodPlanilha) + ')';
         cdsPlanilhaGerada.Data := GetDataPacket(sSql);

         FCodPlanilha:= CodPlanilha;
         FRetornoPlnPlanil := cdsPlanilhaGerada.FieldByName('PLNPLANIL').asFloat;
         MessageInfo := 'A Planilha no. ' + FloatToStr(cdsPlanilhaGerada.FieldByName('PLNPLANIL').asFloat) + ' foi gerada com sucesso.';
         If not Padroes.GravaLogOperacoes(dEmpresa,iModulo,iUsuario, 'Planilhas - Pré-Prontas',False) then
            Raise Exception.Create( Padroes.MessageInfo );
         Commit;
      Except
         on E:Exception Do
         Begin
            RollBack;
            FCodPlanilha:= Lancamento.RetornoPlnCodigo;
            Result      := False;
            MessageInfo := E.Message;
         End;
      End;
   End;
end;

function TCtrlPrePlanilhaPP.RetornaIndiceTipConv(s:string):integer;
begin
   if s = '' then begin
      result := -1;
      exit;
   end;

   case s[1] of
      'N' : result := 0;
      'H' : result := 1;
      'D' : result := 2;
      'C' : result := 3;
      'M' : result := 4;
   else
      result := -1;
   end;
end;

function TCtrlPrePlanilhaPP.RetornaTipConv(i:integer):string;
begin
   case i of
      -1 : result := '';
      0  : result := 'N';
      1  : result := 'H';
      2  : result := 'D';
      3  : result := 'C';
      4  : result := 'M';
   end;
end;

function TCtrlPrePlanilhaPP.ListCdsDetalhePP(dPanCodigo :Double; ordenaNumOrdem : Boolean = false) :OleVariant;
var
  sSql :string;

begin

      sSql := 'SELECT ' +
              '    P.IDEMPRESA,         ' +
              '    P.CODCENTROCUSTO,    ' +
              '    P.PLANO,             ' +
              '    P.PLACONTA,          ' +
              '    P.HITCODHIST,        ' +
              '    P.IDPESSOA,          ' +
              '    P.PANCODIGO,         ' +
              '    P.PANNUMLANC,        ' +
              '    P.PANTIPO,           ' +
              '    CT.CODEXTERNO,       ' +
              '    U.NOME AS DESCATIVPADRAO,  '+
              '    CT.NOME AS DESCCCUSTO,     '+
              '    sc.Descricao as DescSegrega, '+
              '    S.NOMESUBCONTA,      ' +
              '    P.IDUSUARIOINCLUSAO, ' +
              '    P.UNIDNEGOC,         ' +
              '    C.PLANOME,           ' +
              '    U.UNECODIGO,         ' +
              '    P.CODSUBCONTA,       ' +
              '    P.NUMDOC,            ' +
              '    P.TIPCODIGO,         ' +
              '    P.IDPLANOPREV,       ' +
              '    P.IDPATRO,           ' +
              '    P.IDSEGREGACRITER,   ' +
              '    P.NUMORDEM,          ' +
              '    PE.NOME AS PATRO,    ' +
              '    PC.NOME AS PLANOPREV, ' +
              '    CT.CODEXTERNO,        ' +
              '    O.TIPDESCRICAO AS DESCTIPOPER, ' +
              '    CT.CODEXTERNO              ' +
              'FROM ' +
              '   PESSOA PE,           ' +
              '   PREDETALHE P,        ' +
              '   SUBCONTA S,          ' +
              '   SEGREGACRITER SC,    ' +
              '   PLANOCONTA C,        ' +
              '   UNIDNEGOCIO U,       ' +
              '   CENTCUST CT,         ' +
              '   PLANPREVCONTABIL PC, ' +
              '   TIPOPER O            ' +
              'WHERE  ' +
              '      (P.PANCODIGO    = ' + FloatToStr(dPanCodigo) + ') ' +
              '  AND (P.IDPATRO = PE.IDPESSOA(+))                      ' +
              '  AND (P.PLACONTA     = C.PLACONTA)                     ' +
              '  AND (P.PLANO        = C.PLANO)                        ' +
              '  AND (U.UNIDNEGOC(+) = P.UNIDNEGOC)                    ' +
              '  AND (U.IDPESSOA(+)  = P.IDPESSOA)                     ' +
              '  AND (P.IDPLANOPREV = PC.IDPLANOPREV (+))              ' +
              '  AND (S.CODSUBCONTA(+) = p.CODSUBCONTA )               ' +
              '  AND (SC.IDSEGREGACRITER(+) = P.IDSEGREGACRITER )      ' +
              '  AND (P.CODCENTROCUSTO = CT.CODCENTROCUSTO(+))         ' +
              '  AND (P.TIPCODIGO = O.TIPCODIGO)                       ' ;


              if ordenaNumOrdem then
                sSql := sSql + ' ORDER BY P.NUMORDEM '
              else
                sSql := sSql + ' ORDER BY P.PLACONTA ';

      Result := GetDataPacket(sSql);

end;


function TCtrlPrePlanilhaPP.ListLancaPrePronta(dEmpresa,dPanCod :Double; OrdenaNumOrdem: Boolean = false) :OleVariant;
var
  sSql :String;
begin
        sSql :=
        'SELECT ' +
                 '  DECODE(MAX(PC.PLAREDUZ),0,NULL,TO_CHAR(MAX(PC.PLAREDUZ))) AS PLAREDUZD,  ' +
                 '  DECODE(MAX(PC.PLAREDUZ),0,NULL,TO_CHAR(MAX(PC.PLAREDUZ))) AS PLAREDUZC,  ' +
                 '  MAX(PC.PLACONTA) AS PLACONTAD,  ' +
                 '  MAX(PC.PLACONTA) AS PLACONTAC,  ' +
                 '  MAX(PC.PLACONCORRESP) AS PLACONCORRESPD,  ' +
                 '  MAX(PC.PLACONCORRESP) AS PLACONCORRESPC,  ' +
                 '  D.PANCODIGO, D.PANNUMLANC, D.CODCENTROCUSTO, D.PLACONTA,'+
                 '  NVL(D.NUMORDEM,0) AS NUMORDEM, ' +
                 '  D.HITCODHIST, D.CODSUBCONTA, D.UNIDNEGOC, D.NUMDOC, D.IDPESSOA,'+
                 '  D.PANTIPO, U.UNECODIGO, D.TIPCODIGO,D.IDPATRO,D.IDPLANOPREV, ' +
                 '  U.NOME,H.HITDESCR1, S.NOMESUBCONTA,' +
                 '  0 as VALOR, '+
                 '  0 as REDOFDEB, ' +
                 '  0 as REDG1DEB, ' +
                 '  0 as REDG2DEB, ' +
                 '  0 as REDG3DEB, ' +
                 '  0 as REDHISTDEB, ' +
                 '  0 as REDOFCRE, ' +
                 '  0 as REDG1CRE, ' +
                 '  0 as REDG2CRE, ' +
                 '  0 as REDG3CRE, ' +
                 '  0 as REDHISTCRE, ' +
                 '  '' '' as CONVOFCRE, ' +
                 '  '' '' as CONVG1CRE, ' +
                 '  '' '' as CONVG2CRE, ' +
                 '  '' '' as CONVG3CRE, ' +
                 '  '' '' as CONVOFDEB, ' +
                 '  '' '' as CONVG1DEB, ' +
                 '  '' '' as CONVG2DEB, ' +
                 '  '' '' as CONVG3DEB, ' +
                 '  ''                                        '' as HIST1, ' +
                 '  ''                                        '' as HIST2, ' +
                 '  ''                                        '' as HIST3, ' +
                 '  ''                                        '' as HIST4, ' +
                 '  ''                                        '' as HIST5, ' +
                 ' D.IDSEGREGACRITER, to_date(to_char(sysdate, ''dd/mm/yyyy''), ''dd/mm/yyyy'') AS DATASEGREGACRITER, D.NUMORDEM ' +
                 'FROM ' +
                 '  PREDETALHE D, UNIDNEGOCIO U, HISTOPADRAO H, SUBCONTA S, PLANOCONTA PC ' +
                 'WHERE ' +
                 '    (D.IDPESSOA       = ' + FloatToStr(dEmpresa) + ') AND '+
                 '    (D.PANCODIGO      = ' + FloatToStr(dPanCod) + ') AND ' +
                 '    (U.UNIDNEGOC(+)   = D.UNIDNEGOC) AND ' +
                 '    (H.HITCODHIST     = D.HITCODHIST) AND '+
                 '    (S.CODSUBCONTA(+) = D.CODSUBCONTA) AND '+
                 '    (U.IDPESSOA(+)    = D.IDPESSOA) AND ' +
                 '    (S.IDPESSOA(+)    = D.IDPESSOA) AND ' +
                 '    (PC.PLACONTA      = D.PLACONTA) ' +
                 '    AND (PC.PLANO     = D.PLANO) ' +
                 'GROUP BY  ' +
                 '  D.PANCODIGO, D.PANNUMLANC, D.CODCENTROCUSTO, D.PLACONTA,  D.NUMORDEM,   D.HITCODHIST, D.CODSUBCONTA,  ' +
                 '  D.UNIDNEGOC, D.NUMDOC, D.IDPESSOA,  D.PANTIPO, U.UNECODIGO, D.TIPCODIGO,D.IDPATRO,D.IDPLANOPREV,  ' +
                 '  U.NOME,H.HITDESCR1, S.NOMESUBCONTA, D.IDSEGREGACRITER, PC.PLAREDUZ  ' ;


                if OrdenaNumOrdem then
                  sSql := sSql + ' ORDER BY D.NUMORDEM '
                else
                  sSql := sSql + ' ORDER BY D.PLACONTA ';

        Result := GetDataPacket(sSql);
end;

function TCtrlPrePlanilhaPP.ListPlanilhasPreProntas(dEmpresa: double): OleVariant;
var
  sSql : string;
begin
     sSql := 'SELECT '  +
             '  PANCODIGO,    ' +
             '  PANDESCRICAO, ' +
             '  PANPROCESSADA ' +
             'FROM ' +
             '  PREPLANILHA ' +
             'WHERE (IDPESSOA = ' + FloatToStr(dEmpresa) + ') AND ' +
             '      (PANIDENTIFICACAO = ''P'') ' +
             'ORDER BY PANDESCRICAO ';

         Result := GetDataPacket(sSql);

end;



procedure TCtrlPrePlanilhaPP.SetcdsLancamentos(const Value: TClientDataSet);
begin
  FcdsLancamentos := Value;
end;

procedure TCtrlPrePlanilhaPP.SetcdsTotalDebCre(const Value: TClientDataSet);
begin
  FcdsTotalDebCre := Value;
end;

function TCtrlPrePlanilhaPP.TemHistoIguais(dEmpresa: Double;iPanCod: Integer): Boolean;
var
  sSql,codhist :string;
  TotRegistro,TotHistorico :double;
begin
     Result := False;

     sSql := ('SELECT HITCODHIST ' +
             'FROM PREDETALHE D ' +
             'WHERE  (D.IDPESSOA  = ' +FloatToStr(dEmpresa)+')  ' +
             '  AND  (D.PANCODIGO = ' +IntToStr(iPanCod)+')');

     _cds.Data := GetDataPacket(sSql);

     If _cds.IsEmpty Then
     Begin
        Result := False;
        Exit;
     End;
     CodHist     := _cds.FieldByName('HITCODHIST').AsString;
     TotRegistro := _cds.RecordCount;

     While not  _cds.Eof do
     Begin
       If _cds.FieldByName('HITCODHIST').asString = '' Then
       Begin
          CodHistVazio := True;
          Break;
       End;
       _cds.Next
     End;


     sSql := ('SELECT HITCODHIST ' +
             'FROM PREDETALHE D ' +
             'WHERE  (D.IDPESSOA   = '+ FloatToStr(dEmpresa)+') ' +
             '  AND  (D.PANCODIGO  = '+ IntToStr(iPanCod)+') ' +
             '  AND  (D.HITCODHIST = '''+ CodHist+''')');

     _cds.Data := GetDataPacket(sSql);

    If _cds.IsEmpty Then
     Begin
       Result := False;
       Exit;
     End;

     TotHistorico := _cds.RecordCount;

   // verifica se todos os codigos de historicos sao iguais
   If TotHistorico = TotRegistro Then
      Result := True;


end;
function TCtrlPrePlanilhaPP.SemNumDocumento(dEmpresa: Double;iPanCod: Integer): Boolean;
var
  sSql :string;
  TotDoc, TotReg :Double;
begin
     Result := False;
     TotDoc := 0;

     sSql := ('SELECT NUMDOC ' +
             'FROM PREDETALHE D ' +
             'WHERE  (D.IDPESSOA  = ' +FloatToStr(dEmpresa)+')  ' +
             '  AND  (D.PANCODIGO = ' +IntToStr(iPanCod)+')');

     _cds.Data := GetDataPacket(sSql);

     TotReg := _cds.RecordCount;

     If _cds.IsEmpty Then
     Begin
        Result := False;
        Exit;
     End;

     While not  _cds.Eof do
     Begin
       If _cds.FieldByName('NUMDOC').asString = '' Then
       Begin
          TotDoc := TotDoc + 1;
       End;
       _cds.Next
     End;

     If TotDoc = TotReg Then
        Result := True;

end;

procedure TCtrlPrePlanilhaPP.AfterInitialize;
begin
  inherited;
  Lancamento.initializeas(self);
  Padroes.initializeas(self);

end;

end.

