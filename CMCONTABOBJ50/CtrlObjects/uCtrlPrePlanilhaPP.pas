unit uCtrlPrePlanilhaPP;

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
     {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};
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
       Function ListCdsDetalhePP(dPanCodigo :Double) :OleVariant;

       {Esta função tem como finalidade buscar as planilhas pre-prontas para o cadastro das
        planilhas pre-planilha}
       Function ListPlanilhasPreProntas(dEmpresa :double) :OleVariant;

       {Esta função tem o objetivo de selecionar os lancamentos de uma planilha pre-pronta}
       Function ListLancaPrePronta(dEmpresa,dPanCod :Double) :OleVariant;

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
  // 19/01/04 Alex 14451
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

            // 19/01/04 Alex 14451
            iIdSegregaCriter := -1;
            dDataSegregaCriter := -1;
            if CdsLancamentos.FieldByName('IDSEGREGACRITER').AsInteger > 0 then begin
              iIdSegregaCriter := CdsLancamentos.FieldByName('IDSEGREGACRITER').AsInteger;
              dDataSegregaCriter := CdsLancamentos.FieldByName('DATASEGREGACRITER').AsDateTime;
            end;
            // fim 19/01/04 Alex 14451

            If cdsLancamentos.FieldByName('VALOR').AsFloat <> 0 Then
            Begin
              //Lancamento.lcTestaConta := False;
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
                                                  // 06/01/04 Alex Nova estrutura de segregação.
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

function TCtrlPrePlanilhaPP.ListCdsDetalhePP(dPanCodigo :Double) :OleVariant;
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
              '    P.IDUSUARIOINCLUSAO, ' +
              '    P.UNIDNEGOC,         ' +
              '    C.PLANOME,           ' +
              '    U.UNECODIGO,         ' +
              '    P.CODSUBCONTA,       ' +
              '    P.NUMDOC,            ' +
              '    P.TIPCODIGO          ' +
              'FROM ' +
              '   PREDETALHE P, ' +
              '   PLANOCONTA C, ' +
              '   UNIDNEGOCIO U ' +
              'WHERE  ' +
              '      (P.PANCODIGO    = ' + FloatToStr(dPanCodigo) + ') ' +
              '  AND (P.PLACONTA     = C.PLACONTA) ' +
              '  AND (P.PLANO        = C.PLANO) ' +
              '  AND (U.UNIDNEGOC(+) = P.UNIDNEGOC) ' +
              '  AND (U.IDPESSOA(+)  = P.IDPESSOA) ' +
              'ORDER BY ' +
              '   P.PLACONTA ';

      Result := GetDataPacket(sSql);

end;


function TCtrlPrePlanilhaPP.ListLancaPrePronta(dEmpresa, dPanCod: Double): OleVariant;
var
  sSql :String;
begin
        sSql :=  'SELECT ' +
                 '  D.PANCODIGO, D.PANNUMLANC, D.CODCENTROCUSTO, D.PLACONTA,'+
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
                 // 09/01/04 Alex 14451
                 '  -1 AS IDSEGREGACRITER, TO_DATE(sysDATE,''DD/MM/YYYY'') AS DATASEGREGACRITER ' +
                 'FROM ' +
                 '  PREDETALHE D, UNIDNEGOCIO U, HISTOPADRAO H, SUBCONTA S ' +
                 'WHERE ' +
                 '    (D.IDPESSOA       = ' + FloatToStr(dEmpresa) + ') AND '+
                 '    (D.PANCODIGO      = ' + FloatToStr(dPanCod) + ') AND ' +
                 '    (U.UNIDNEGOC(+)   = D.UNIDNEGOC) AND ' +
                 '    (H.HITCODHIST(+)  = D.HITCODHIST) AND '+
                 '    (H.IDPESSOA(+)    = D.IDPESSOA) AND '+
                 '    (S.CODSUBCONTA(+) = D.CODSUBCONTA) AND '+
                 '    (U.IDPESSOA(+)  = D.IDPESSOA) AND ' +
                 '    (S.IDPESSOA(+)  = D.IDPESSOA) ' +
                 '    ORDER BY D.PLACONTA';


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

