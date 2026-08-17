unit uCtrlRptDemonstrativo;
{-------------------------------------------------------------------------------
   Data      : 09/11/2007
   Autor     : André Tavares
   Pendência : 26772
   Rotina    : ProcessaDemoModelo1, ProcessaDemoModelo2, ProcessaDemoModelo3,
               ProcessaDemoModelo4, ProcessaDemoModelo5, ProcessaDemoModelo6,
               ProcessaDemoModelo7
   Descrição : implementação dos filtros idplanoprev e idpatro conforme o cadastro de elementos do demonstrativo
{-------------------------------------------------------------------------------
   Data      : 05/07/2007
   Autor     : Marcus Oliveira
   Pendência : 23016
   Rotina    : várias
   Descrição : adicionar na query campos Plano e Patro.
{-------------------------------------------------------------------------------
   Data      : 21/12/2006
   Autor     : Marcus Oliveira
   Pendência : 23353
   Rotina    : ProcessaDemoModelo7
   Descrição : alterar o codcentrocusto para codexterno
{-------------------------------------------------------------------------------
   Data      : 21/12/2006
   Autor     : Marcus Oliveira
   Pendência : 23352
   Rotina    : ProcessaDemoModelo6
   Descrição : alterar o codcentrocusto para codexterno
{-------------------------------------------------------------------------------
   Data      : 20/12/2006
   Autor     : Marcus Oliveira
   Pendência : 23351
   Rotina    : ProcessaDemoModelo5
   Descrição : alterar o codcentrocusto para codexterno
{-------------------------------------------------------------------------------
   Data      : 20/12/2006
   Autor     : Marcus Oliveira
   Pendência : 23350
   Rotina    : ProcessaDemoModelo4
   Descrição : alterar o codcentrocusto para codexterno
{-------------------------------------------------------------------------------
   Data      : 19/12/2006
   Autor     : Marcus Oliveira
   Pendência : 23349
   Rotina    : ProcessaDemoModelo3
   Descrição : alterar o codcentrocusto para codexterno
{-------------------------------------------------------------------------------
   Data      : 15/12/2006
   Autor     : Marcus Oliveira
   Pendência : 23347
   Rotina    : ProcessaDemoModelo1
   Descrição : alterar o codcentrocusto para codexterno
{-------------------------------------------------------------------------------
   Data      : 14/12/2006
   Autor     : Marcus Oliveira
   Pendência : 23348
   Rotina    : ProcessaDemoModelo2
   Descrição : alterar o codcentrocusto para codexterno
{-------------------------------------------------------------------------------
   Data      : 13/12/2006
   Autor     : Rodolpho da Silva
   Pendência : 23578
   Rodtina   : ProcessaModelo03
   Descrição : Incluir na rotina método para atender as CONDIÇÕES do somatório
-------------------------------------------------------------------------------
   Data      : 22/11/2005
   Autor     : Rodolpho da Silva
   Pendência : 20809
   Descrição : Ao marcar a opção "Desconsiderar o Encerramento das Contas de
               Resultado" o sistema não está trazendo os lançamentos das contas
               contábeis do exercício anterior.
-------------------------------------------------------------------------------}

interface

Uses DB, uDataBase, uModulo,uDbPeriodo, uCmControlObject, dbclient,Forms, sysutils,
     FCmReport,uSistema,ppDBPipe,ppDBBDE,ppVar,Graphics,uCtrlDemColuna,
     ppBands,uCtrlContab,pptypes, ppDB,provider,
     ppCtrls,uCMSqlParams, uCMTypes;


  Type
    TCtrlRptDemonstrativo = Class(TCmControlObject)
    private
       Contab  :TCtrlContab;
       CtrlDemColuna :TCtrlDemColuna;
       FcdsDemonstrativo : TClientDataSet;
       FcdsDemoLayoutTipo: TClientDataSet;
       cdsSaldo          : TClientDataSet;
       cdsSaldoAnt       : TClientDataSet;
       cdsMovimentacao   : TClientDataSet;
       cdsTitulos        :TClientDataSet;

       sSqlCompConta,
       sNomePatro, sNomePlano : String;

       procedure SetCdsDemonstrativo(const Value: TClientDataSet);
       procedure SetCdsDemoLayoutTipo(const Value: TClientDataSet);

       procedure ListaPlanoPatro(iPlano, iPatro: integer);

       function FazFormula(dValor1, dValor2: double; sTipo, sCondicao:string; dValor3: double; bApenasCompara: boolean = false):double;

       Function ListaCompConta(Idemo :Integer) : OleVariant;
       Function ListaLinhaxColuna(idemo,iNumCol,iLinha: Integer) : OleVariant;
       Function ListaLinhasxColunas(idemo,iElem: Integer): OleVariant;
       Function ListaCompSomatorio(iDemo :Integer):OleVariant;
       Function ListaCdsBalPatr(iDemo,Posicao :Integer) :OleVariant;
       Function ListaCdsElemBalPatr(iDemo,iElem :Integer) :OleVariant;
       Function ListaNomeAtivProj(dEmpresa:Double;sAtivProj :string):OleVariant;
       Function ListaDadosPeriodo(dEmpresa:Double;iExercicio,iPeriodo:integer):OleVariant;
       Function ListaNomeCCusto(dEmpresa:Double;sCCusto :string):OleVariant;

    protected
       procedure DoChangeDataBase; Override;
       procedure AfterInitialize;override;

    public
       Constructor Create; Override;
       Destructor Destroy; Override;
       property cdsDemonstrativo: TClientDataSet Read FcdsDemonstrativo Write SetcdsDemonstrativo;
       property cdsDemoLayoutTipo: TClientDataSet Read FcdsDemoLayoutTipo Write SetcdsDemoLayoutTipo;

       {Esta função tem o objetivo de processar o relatorio demonstrativo 1 }
      function ProcessaDemoModelo1(iDemo,iPlano,iExercicio,iPeriodo:Integer;sTipoOperResult,sNatureza,sCCustoIni,
                      sAtivProjSel,sAtivProj,sMoeda,sDataFimAtu,sDataFimAnt,sNomePer,sNomeDemo,sNomeMoeda:string;dEmpresa:Double;
                       bDesconResult,bSoMovim,bUltPeriodo,bZerados,bGeraTxt:Boolean): Boolean;

       {Esta função tem o objetivo de processar o relatorio demonstrativo 2 }
      function ProcessaDemoModelo2(iDemo, iPlano,iExercicio,iPeriodoIni,iPeriodoFim: Integer; sTipoOperResult, sNatureza, sCCustoIni,
                                    sAtivProj, sCodMoedaReal,sCodMoedaOrc, sPerDataIni,sNomePer1,sNomePer2,sNomeDemo,
                                    sNomeMoedaReal,sNomeMoedaOrc,sAtivMarca: string;  dEmpresa: Double; bDesconResult,
                                    bZerados,bGeraTxt: Boolean): Boolean;

       {Esta função tem o objetivo de processar o relatorio demonstrativo 2 }
      function ProcessaDemoModelo2_Anal(iDemo, iPlano,iExercicio,iPeriodoIni,iPeriodoFim: Integer; sTipoOperResult, sNatureza, sCCustoIni,
                                    sAtivProj, sCodMoedaReal,sCodMoedaOrc, sPerDataIni,sNomePer1,sNomePer2,sNomeDemo,
                                    sNomeMoedaReal,sNomeMoedaOrc,sAtivMarca: string;  dEmpresa: Double; bDesconResult,
                                    bZerados,bGeraTxt: Boolean): Boolean;

       {Esta função tem o objetivo de processar o relatorio demonstrativo 3 }
       function ProcessaDemoModelo3(iDemo, iPlano,iExercicio,iPeriodoIni,iPeriodoFim: Integer; sTipoOperResult, sNatureza, sCCustoIni,
                                    sAtivProj, sCodMoedaReal,sCodMoedaOrc, sPerDataIni,sAtivSel: string;
                                    dEmpresa: Double; bDesconResult, bZerados: Boolean): Boolean;

       {Esta função tem o objetivo de processar o relatorio demonstrativo 4 }
       function ProcessaDemoModelo4(iDemo, iPlano,iExercicio,iPeriodoIni,iPeriodoFim, iValores: Integer; sNatureza, sCCustoIni,
                                    sAtivProj, sCodMoeda,sDataIni,sDataFim, sPerDataFim,sPlano,sPatro,sFormato,sAtivSel: string;
                                    dEmpresa: Double; bZerados,bNegativo,bAcumulado: Boolean): Boolean;

       {Esta função tem o objetivo de processar o relatorio demonstrativo 5 }
       function ProcessaDemoModelo5(iDemo,iExercicio,iPerIni,iPerFim,iPlano :Integer;
                                    dEmpresa :Double;sNatureza,sTipoOperResult,sCCustoIni,
                                    sAtivProj,sAtivProjSel,sCodMoeda,sPerDataFim:string;
                                    bDesconResult,bZerados:Boolean): Boolean;

       {Esta função tem o objetivo de processar o relatorio demonstrativo 6 }
       function ProcessaDemoModelo6(iDemo,iPlano,iExercicio,iPeriodoIni,iPeriodoFim:integer;
                                    dEmpresa:Double;sCCusto,sAtivProj,sCodMoeda,sDataFim,
                                    sPacTipoResult,sNatureza:string;bZerados,bDesconsidera:Boolean): Boolean;


       {Esta função tem o objetivo de processar o relatorio demonstrativo 2 }
      function ProcessaDemoModelo7(iDemo, iPlano,iExercicio,iPeriodoIni,iPeriodoFim: Integer; sTipoOperResult, sNatureza, sCCustoIni,
                                    sAtivProj, sCodMoedaReal,sCodMoedaOrc, sPerDataIni,sNomePer1,sNomePer2,sNomeDemo,
                                    sNomeMoedaReal,sNomeMoedaOrc,sAtivMarca: string;  dEmpresa: Double; bDesconResult,
                                    bZerados,bGeraTxt: Boolean): Boolean;

       {Demonstrativo modelo normal}
       function MontaSqlDemoNormal(iDemo,iPlano,iExercicio,iPeriodoIni,iPeriodoFim:Integer;
                                      sNatureza,sCCustoIni,sAtivProj,sTipoOperResult,
                                      sDataIni,sCodMoedaReal,sCodMoedaOrc,sPlanoPrev,sPatro,sAtivSel:string;
                                      dEmpresa:Double;bDivide,bDesconResult,bMenosOrcado:Boolean) :Boolean;



       {Demonstrativo modelo balanco patrimonial }
       function MontaSqlDemoBalPatr(iDemo,iPlano,iExercicio,iPeriodoIni,
                         iPeriodoFim:Integer;dEmpresa:Double;sNatureza,sCCustoIni,sAtivProj,
                         sPlano,sPatro,sCodMoedaReal,sCodMoedaOrc,sPerDataAtu,sAtivSel:string;
                         bDivide:Boolean) :Boolean;

       {Demonstrativo modelo colunado }
       function MontaSqlDemoColunado(iDemo,iPlano,iExercicio,iPeriodoIni,
                   iPeriodoFim,iValores:integer;sNatureza,sPatro,sPlano,
                   sCodMoedaReal,sAtivProj,sCCustoIni,sAtivSel:string;dEmpresa:Double;bNegativo, bDivide:Boolean):Boolean;

       {Demonstrativo modelo colunado mensal}

       function MontaSqlDemoColMes(iDemo,iExercicio,iPeriodoIni,iPeriodoFim:Integer;dEmpresa:Double;
                                    sNatureza,sCCustoIni,sAtivProj,sDataFimAtu,sPlano,
                                    sPatro,sCodMoedaReal,sCodMoedaOrc,sAtivSel:string;bDivide:boolean):Boolean;

       {Esta função faz mudanças na banda detalhe}
       procedure EspecificaParametros(FormDemo:TForm; sTipoEle,sNegrito:String; bndDetalheDemo : TppDetailBand);

       {Gera Arquivo TXT Modelo1}
       procedure GeraTxt_Demo1(iExer,Idemo:Integer;sNomePeriodo,sNomeDemo,sNomeMoeda:String);

       {Gera Arquivo TXT Modelo2}
       procedure GeraTxt_Demo2(iExer:Integer;sNomePeriodo1,sNomePeriodo2,sNomeDemo,sNomeMoedaReal,sNomeMoedaOrc:String);


       function RetornaTipoOperResult(iIdPessoa: integer) : string;
       function ListaDemonstrativoSPC(iIdPessoa: integer; bPadraoSPC: boolean = false): OleVariant;
       function ListaExercicio(iIdPessoa: integer): OleVariant;
       function ListaPeriodo(iIdPessoa,iExercicio: integer): OleVariant;
       function ListaPlano: OleVariant;
       function ListaPatro: OleVariant;
       function PegaDataExercicio(iIdPessoa,iExercicio: integer; bDataInicial: boolean = false): TDateTime;
       function ListaDadosDemonstrativoSPC(iIdDemonstrativo: integer): OleVariant;
       function ListaLogoFundacao(iIdEmpresa: integer): OleVariant;

    protected

    End;


implementation

uses UMensErro, uString,uData, uFuncaoGeral,FSM_FxLib;

constructor TCtrlRptDemonstrativo.Create;
begin
  inherited;
  Contab          := TCtrlContab.Create;
  CtrlDemColuna   := TCtrlDemColuna.Create;
  cdsSaldo        := TClientDataSet.Create(nil);
  cdsSaldoAnt     := TClientDataSet.Create(nil);
  cdsMovimentacao := TClientDataSet.Create(nil);
  cdsTitulos      := TClientDataSet.Create(nil);

  FcdsDemonstrativo := TClientDataSet.Create(nil);
  FcdsDemoLayoutTipo:= TClientDataSet.Create(nil);

end;

destructor TCtrlRptDemonstrativo.Destroy;
begin

  inherited;
  Contab.Free;
  CtrlDemColuna.free;
  cdsSaldo.free;
  cdsSaldoAnt.free;
  cdsMovimentacao.free;
  cdsTitulos.free;
  FcdsDemonstrativo.Free;
  FcdsDemoLayoutTipo.free;



end;

procedure TCtrlRptDemonstrativo.EspecificaParametros(FormDemo:TForm;sTipoEle,sNegrito:String; bndDetalheDemo : TppDetailBand);
var x : Integer;
begin
   for x := 0 to FormDemo.ComponentCount-1 do begin
      if (FormDemo.Components[x] is tppDbText) and (tppDbText(FormDemo.Components[x]).Band = bndDetalheDemo) then begin

         If tppBdePipeline(tppDbText(FormDemo.Components[x]).DataPipeline).DataSource.DataSet.FieldByName(tppDbText(FormDemo.Components[x]).DataField).DataType = ftFloat Then begin
            tppDbText(FormDemo.Components[x]).BlankWhenZero :=False;
            if sTipoEle = 'T' then
               tppDbText(FormDemo.Components[x]).BlankWhenZero :=True;
         End;

         tppDbText(FormDemo.Components[x]).Font.Style    :=[];
         if sNegrito = 'S' then
            tppDbText(FormDemo.Components[x]).Font.Style :=[fsBold];
      end;
   end;

end;


procedure TCtrlRptDemonstrativo.DoChangeDataBase;
begin
  inherited;

end;

Function TCtrlRptDemonstrativo.ListaCompConta(iDemo :Integer) :OleVariant;
begin

   sSqlCompConta := 'SELECT C.CODSUBCONTA,C.CODCENTROCUSTO,C.IDEMPRESA, E.FLGACUMULADO, '+
                    '       C.UNIDNEGOC, C.PLACONTA,C.PLANO,C.IDPATRO, C.IDPLANOPREV, CC.CODEXTERNO   '+
                    'FROM  COMPOELEMDEM C, ELEMDEMONSTRATIVO E, CENTCUST CC  '+
                    'WHERE '+
                    '   (C.IDELEMDEMONSTRAT = ' + IntToStr(iDemo) + ') AND ' +
                    '   (E.ELETIPOELEM = ''C'')  AND ' +
                    '   (C.IDELEMDEMONSTRAT = E.IDELEMDEMONSTRAT) AND ' +
                    '   (C.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) ';

    Result := GetDataPacket(sSqlCompConta);

end;

Function TCtrlRptDemonstrativo.ListaCompSomatorio(iDemo :Integer) :OleVariant;
var
  sSql :string;
begin

       sSql := 'SELECT C.ELEMENTODEM, C.FLGOPERACAO,C.ELEVALORCOND, C.ELECONDICAO '+
               'FROM COMPOELEMDEM C, ELEMDEMONSTRATIVO E '+
               'WHERE '+
               '  (C.IDELEMDEMONSTRAT = '+IntToStr(iDemo)+ ') AND  '+
               '  (E.ELETIPOELEM = ''S'') AND '+
               '  (C.IDELEMDEMONSTRAT = E.IDELEMDEMONSTRAT)';

    Result := GetDataPacket(sSql);


end;


function TCtrlRptDemonstrativo.ProcessaDemoModelo1(iDemo,iPlano,iExercicio,iPeriodo:Integer;sTipoOperResult,sNatureza,sCCustoIni,
                      sAtivProjSel,sAtivProj,sMoeda,sDataFimAtu,sDataFimAnt,sNomePer,sNomeDemo,sNomeMoeda:string;dEmpresa:Double;
                      bDesconResult,bSoMovim,bUltPeriodo,bZerados,bGeraTxt:Boolean): Boolean;
var
  iLinha,x,iNumCalc :Integer;
  sSalto,sSql,sOper :string;
  cdsCompConta      :TClientDataSet;
  cdsLancResultado  :TClientDataSet;
  cdsSaldos         :TClientDataSet;
  cdsCompSomatorio  :TClientDataSet;
  bEntrou,bCalc     :Boolean;
  dValAtu :Double;
  dValAnt :Double;
  dValorResult,dCotacaoAtu,dCotacaoAnt :Double;
  bmSavePlace : TBookmark;


begin

   Result := True;
   cdsCompConta     := TClientDataSet.Create(nil);
   cdsLancResultado := TClientDataSet.Create(nil);
   cdsSaldos        := TClientDataSet.Create(nil);
   cdsCompSomatorio := TClientDataSet.Create(nil);

   With TCMSqlParams.Create(nil) Do
   Try

      Try

         SQL.Clear;
         SQL.Add('SELECT                                                              ');
         SQL.Add('   (0) AS ANOATU, (0) AS ANOANT, (0) AS DIFERENCA, (''N'') AS CALCU,');
         SQL.Add('   (0) AS ANOATUSN, (0) AS ANOANTSN, ('' '') AS SALTA,              ');
         SQL.Add('   E.ELEDESCELEM, E.FLGINDENTACAO, E.FLGTIPOLINHA, E.ELEORDEMLINHA, ');
         SQL.Add('   E.IDELEMDEMONSTRAT,E.ELETIPOELEM,E.FLGSALTAPAGINA,E.FLGMONETARIA,');
         SQL.Add('   E.FLGTRACO,E.FLGNEGRITO,E.FLGNATUREZA,E.FLGTIPONEGATIVO,         ');
         SQL.Add('   E.FLGDECIMAIS                                                    ');
         SQL.Add('FROM                                                                ');
         SQL.Add('   ELEMDEMONSTRATIVO E                                              ');
         SQL.Add('WHERE                                                               ');
         SQL.Add('    (E.IDDEMONSTRATIVO =:IDDEMONSTRATIVO)                           ');
         SQL.Add('ORDER BY                                                            ');
         SQL.Add('    E.ELEORDEMLINHA                                                 ');

         Prepare;

         ParamByName('IDDEMONSTRATIVO').asInteger := iDemo;

         FcdsDemonstrativo.Data := Data;

         FcdsDemonstrativo.First;

         //zera o acumulador de salto de pagina
         iLinha := 0;
         sSalto := 'N';

         while not FcdsDemonstrativo.EOF do
         begin

            FcdsDemonstrativo.Edit;

            if sSalto = 'S' then begin
               inc(iLinha);
               sSalto := 'N';
            end;

            if FcdsDemonstrativo.FieldByName('FLGSALTAPAGINA').asString = 'S' then
            begin
               sSalto := 'S';
            end;

            FcdsDemonstrativo.FieldByName('SALTA').asString := IntToStr(iLinha);

            cdsCompConta.Data := ListaCompConta(FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').asInteger);
            sSql := sSqlCompConta;

            if not cdsCompConta.IsEmpty then
            begin
               dValAtu := 0;
               dValAnt := 0;

               cdsCompConta.First;
               while not cdsCompConta.EOF do
               begin
                  //Ano Atual
                  dValorResult := 0;

                  if (bDesconResult) and (sTipoOperResult <> '') then begin
                     if sNatureza = 'C' then begin
                        sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';
                     end else begin
                        sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';
                     end;
                     sSql := sSql + 'FROM PLANILHA P, LANCAMENTO L, CENTCUST CC                                            ';
                     sSql := sSql + 'WHERE     (L.PLACONTA LIKE '''+cdsCompConta.FieldByName('PLACONTA').AsString+'%'+''')           ';
                     sSql := sSql + '      AND (L.PLANO = '+IntToStr(iPlano)+')                   ';
                     sSql := sSql + '      AND (P.IDPESSOA = '+FloatToStr(dEmpresa)+')              ';
                     sSql := sSql + '      AND (L.TIPCODIGO = '''+sTipoOperResult+''')            ';
                     sSql := sSql + '      AND (P.PEREXERCICIO = '+IntToStr(iExercicio)+')         ';
                     if bSoMovim then
                        sSql := sSql + '      AND (P.PERNUMERO  = '+IntToStr(iPeriodo)+')                             '
                     else
                        sSql := sSql + '      AND (P.PERNUMERO  <= '+IntToStr(iPeriodo)+')                             ';
                     sSql := sSql + '      AND (P.PLNCODIGO = L.PLNCODIGO) ';
                     sSql := sSql + '      AND (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) ) ';

                     if not cdsCompConta.FieldByName('CODEXTERNO').isNull then begin
                        sSql := sSql + '   AND (CC.CODEXTERNO LIKE '''+cdsCompConta.FieldByName('CODEXTERNO').AsString+'%'') ';
                        sSql := sSql + '   AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                     end;

                     if sCCustoIni <> '' then begin
                        sSql := sSql + ' AND (RTRIM(CC.CODEXTERNO) LIKE '''+sCCustoIni+'%'')';
                        sSql := sSql + ' AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                     end;

                     if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                        sSql := sSql + '   AND (L.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                        sSql := sSql + '   AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                     end;
                     if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                        sSql := sSql + ' AND (L.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                        sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                     end;

                     if trim(sAtivProjSel) <> '' then begin
                        sSql := sSql + ' AND  (L.UNIDNEGOC IN (' + trim(sAtivProjSel) + ')) ';
                     end;
                     if sAtivProj <> '' then begin
                        sSql := sSql + ' AND (L.UNIDNEGOC = '+ sAtivProj +')';
                        sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                     end;

                     if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                     begin
                       sSql := sSql + ' AND (L.IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                     end;

                     if not cdsCompConta.fieldByName('IDPATRO').isNull then
                     begin
                       sSql := sSql + ' AND (L.IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                     end;

                     cdsLancResultado.Data := GetDataPacket(sSql);
                     if not cdsLancResultado.IsEmpty then
                     begin
                       dValorResult := cdsLancResultado.FieldByName('SALDO').AsFloat;
                     end;
                  end;

                  if sNatureza = 'C' then begin
                     sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(PLSCREDITOCOR,NULL,0,PLSCREDITOCOR) -               ';
                     sSql := sSql + '           DECODE(PLSDEBITOCORRENTE,NULL,0,PLSDEBITOCORRENTE)) AS SALDO         ';
                  end else begin
                     sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(PLSDEBITOCORRENTE,NULL,0,PLSDEBITOCORRENTE) -       ';
                     sSql := sSql + '           DECODE(PLSCREDITOCOR,NULL,0,PLSCREDITOCOR)) AS SALDO       ';
                  end;
                  sSql := sSql + 'FROM PLANOSALDO PS, CENTCUST CC                                                          ';
                  sSql := sSql + 'WHERE (PS.PLACONTA = '''+cdsCompConta.FieldByName('PLACONTA').AsString+''')           ';
                  sSql := sSql + '      AND (PS.PLANO = '+IntToStr(iPlano)+')                             ';
                  sSql := sSql + '      AND (PS.IDPESSOA = '+FloatToStr(dEmpresa)+')                             ';
                  sSql := sSql + '      AND (PS.PEREXERCICIO = '+IntToStr(iExercicio)+')                           ';
                  if bSoMovim then begin
                     sSql := sSql + '      AND (PS.PERNUMERO  = '+IntToStr(iPeriodo)+')                             ';
                  end else begin
                     sSql := sSql + '      AND ((PS.PERNUMERO  <= '+IntToStr(iPeriodo)+')                             ';
                     sSql := sSql + '      OR   (PS.PERNUMERO  IS NULL))                                                   ';
                  end;

                  if not cdsCompConta.FieldByName('CODEXTERNO').isNull then begin
                     sSql := sSql + '   AND (CC.CODEXTERNO LIKE '''+cdsCompConta.FieldByName('CODEXTERNO').AsString+'%'') ';
                  end;

                  sSql := sSql + '  AND (PS.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) ) ';

                  if sCCustoIni <> '' then begin
                     sSql := sSql + ' AND (RTRIM(CC.CODCENTROCUSTO) LIKE '''+sCCustoIni+'%'')';
                     sSql := sSql + ' AND (PS.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                  end;

                  if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                     sSql := sSql + '   AND (UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                  end;
                  if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                     sSql := sSql + '   AND (CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                  end;

                  if trim(sAtivProjSel) <> '' then begin
                     sSql := sSql + ' AND  (UNIDNEGOC IN (' + trim(sAtivProjSel) + ')) ';
                  end;
                  if sAtivProj <> '' then begin
                     sSql := sSql + ' AND (UNIDNEGOC = '+sAtivProj+')';
                  end;

                  if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                  begin
                    sSql := sSql + ' AND (IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                  end;

                  if not cdsCompConta.fieldByName('IDPATRO').isNull then
                  begin
                    sSql := sSql + ' AND (IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                  end;

                  cdsSaldos.Data := GetDataPacket(sSql);
                  if not cdsSaldos.isEmpty then
                  begin
                     //FazUPdate do Ano Atual
                     dValAtu := dValAtu+(cdsSaldos.FieldByName('SALDO').AsFloat-dValorResult);
                  end;

                  //Ano Anterior
                  dValorResult := 0;
                  if (bDesconResult) and (sTipoOperResult <> '') then begin
                     if sNatureza = 'C' then begin
                        sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';
                     end else begin
                        sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';
                     end;
                     sSql := sSql + 'FROM PLANILHA P, LANCAMENTO L, CENTCUST CC                             ';
                     sSql := sSql + 'WHERE     (L.PLACONTA LIKE '''+cdsCompConta.FieldByName('PLACONTA').AsString+'%'+''')           ';
                     sSql := sSql + '      AND (L.PLANO = '+IntToStr(iPlano)+')                                ';
                     sSql := sSql + '      AND (P.IDPESSOA = '+FloatToStr(dEmpresa)+')                             ';
                     sSql := sSql + '      AND (L.TIPCODIGO = '''+sTipoOperResult+''')            ';
                     sSql := sSql + '      AND (P.PEREXERCICIO = '+IntToStr(iExercicio -1)+')     ';
                     if bSoMovim then begin
                        sSql := sSql + '      AND (P.PERNUMERO  = '+IntToStr(iPeriodo)+')         ';
                     end else begin
                        if not bUltPeriodo then
                           sSql := sSql + '      AND (P.PERNUMERO  <= '+IntToStr(iPeriodo)+')                             ';
                     end;
                     sSql := sSql + '      AND (P.PLNCODIGO = L.PLNCODIGO) ';
                     if not cdsCompConta.FieldByName('CODEXTERNO').isNull then begin
                        sSql := sSql + '   AND (CC.CODEXTERNO LIKE '''+cdsCompConta.FieldByName('CODEXTERNO').AsString+'%'') ';
                        sSql := sSql + '   AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                     end;

                     sSql := sSql + '  AND (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) ) ';


                     if sCCustoIni <> '' then begin
                        sSql := sSql + ' AND (RTRIM(CC.CODEXTERNO) LIKE '''+sCCustoIni+'%'')';
                        sSql := sSql + ' AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                     end;

                     if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                        sSql := sSql + '   AND (L.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                        sSql := sSql + '   AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                     end;
                     if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                        sSql := sSql + ' AND (L.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                        sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                     end;

                     if trim(sAtivProjSel) <> '' then begin
                        sSql := sSql + ' AND  (L.UNIDNEGOC IN (' + trim(sAtivProjSel) + ')) ';
                     end;
                     if sAtivProj <> '' then begin
                        sSql := sSql + ' AND (L.UNIDNEGOC = '+sAtivProj+')';
                        sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                     end;


                     if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                     begin
                       sSql := sSql + ' AND (L.IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                     end;

                     if not cdsCompConta.fieldByName('IDPATRO').isNull then
                     begin
                       sSql := sSql + ' AND (L.IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                     end;

                     cdsLancResultado.Data := GetDataPacket(sSql);
                     if not cdsLancResultado.IsEmpty then
                     begin
                       dValorResult := cdsLancResultado.FieldByName('SALDO').AsFloat;
                     end;
                  end;

                  if sNatureza = 'C' then begin
                     sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(PLSCREDITOCOR,NULL,0,PLSCREDITOCOR) -               ';
                     sSql := sSql + '           DECODE(PLSDEBITOCORRENTE,NULL,0,PLSDEBITOCORRENTE)) AS SALDO         ';
                  end else begin
                     sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(PLSDEBITOCORRENTE,NULL,0,PLSDEBITOCORRENTE) -                 ';
                     sSql := sSql + '           DECODE(PLSCREDITOCOR,NULL,0,PLSCREDITOCOR)) AS SALDO       ';
                  end;
                  sSql := sSql + 'FROM PLANOSALDO PS, CENTCUST CC                                                         ';
                  sSql := sSql + 'WHERE (PS.PLACONTA = '''+cdsCompConta.FieldByName('PLACONTA').AsString+''')           ';
                  sSql := sSql + '      AND (PS.PLANO = '+IntToStr(iPlano)+')                             ';
                  sSql := sSql + '      AND (PS.IDPESSOA = '+FloatToStr(dEmpresa)+')                             ';
                  sSql := sSql + '      AND (PS.PEREXERCICIO = '+IntToStr(iExercicio -1)+')     ';

                  if bSoMovim then begin
                     sSql := sSql + '      AND (PS.PERNUMERO  = '+IntToStr(iPeriodo)+')                             ';
                  end else begin
                     if not bUltPeriodo then begin
                        sSql := sSql + '      AND ((PS.PERNUMERO  <= '+IntToStr(iPeriodo)+')                             ';
                        sSql := sSql + '      OR   (PS.PERNUMERO  IS NULL))                                                   ';
                     end;
                  end;


                  sSql := sSql + '  AND (PS.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) ) ';


                  if sCCustoIni <> '' then begin
                     sSql := sSql + ' AND (RTRIM(CC.CODEXTERNO) LIKE '''+sCCustoIni+'%'')';
                     sSql := sSql + ' AND (PS.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                  end;

                  if not cdsCompConta.FieldByName('CODEXTERNO').isNull then begin
                       sSql := sSql + '   AND (CC.CODEXTERNO LIKE '''+cdsCompConta.FieldByName('CODEXTERNO').AsString+'%'') ';
                  end;

                  if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                     sSql := sSql + '   AND (PS.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                  end;

                  if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                     sSql := sSql + '   AND (PS.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                  end;

                  if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                  begin
                    sSql := sSql + ' AND (IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                  end;

                  if not cdsCompConta.fieldByName('IDPATRO').isNull then
                  begin
                    sSql := sSql + ' AND (IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                  end;


                  if trim(sAtivProjSel) <> '' then begin
                     sSql := sSql + ' AND  (PS.UNIDNEGOC IN (' + trim(sAtivProjSel) + ')) ';
                  end;

                  if sAtivProj <> '' then begin
                     sSql := sSql + ' AND (PS.UNIDNEGOC = '+sAtivProj+')';
                  end;
                  cdsSaldos.Data := GetDataPacket(sSql);
                  if not cdsSaldos.isEmpty then
                  begin
                     //FazUPdate do Ano Atual
                     dValAnt := dValAnt+(cdsSaldos.FieldByName('SALDO').AsFloat-dValorResult);
                  end;

                  cdsCompConta.Next;
               end;

               if (sMoeda <> '') and (FcdsDemonstrativo.FieldByName('FLGMONETARIA').AsString = 'S') then
               begin
                  dCotacaoAtu := Contab.TestaCotacaoMoeda(StrToFloat(sMoeda),StrToDate(sDataFimAtu),false);
                  dCotacaoAnt := Contab.TestaCotacaoMoeda(StrToFloat(sMoeda),StrToDate(sDataFimAnt),false);

                  dValAtu := dValAtu/dCotacaoAtu;
                  dValAnt := dValAnt/dCotacaoAnt;
               end;
               FcdsDemonstrativo.Edit;
               FcdsDemonstrativo.FieldByName('ANOATU').AsFloat    := dValAtu;
               FcdsDemonstrativo.FieldByName('ANOANT').AsFloat    := dValAnt;
               if (FcdsDemonstrativo.FieldByName('FLGTIPONEGATIVO').AsString <> 'N') then
               begin
                  FcdsDemonstrativo.FieldByName('ANOATUSN').AsFloat  := dValAtu;
                  FcdsDemonstrativo.FieldByName('ANOANTSN').AsFloat  := dValAnt;
               end else begin
                  if Modulo.TestaNatureza(sNatureza, FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString,dValAtu) then begin
                     FcdsDemonstrativo.FieldByName('ANOATUSN').AsFloat  := Abs(dValAtu)* (-1);
                  end else begin
                     FcdsDemonstrativo.FieldByName('ANOATUSN').AsFloat  := Abs(dValAtu);
                  end;
                  if Modulo.TestaNatureza(sNatureza,FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString,dValAnt) then begin
                     FcdsDemonstrativo.FieldByName('ANOANTSN').AsFloat  := Abs(dValAnt)* (-1);
                  end else begin
                     FcdsDemonstrativo.FieldByName('ANOANTSN').AsFloat  := Abs(dValAnt);
                  end;
               end;
               FcdsDemonstrativo.FieldByName('DIFERENCA').AsFloat := (dValAtu - dValAnt);
               FcdsDemonstrativo.FieldByName('CALCU').AsString    := 'S';
               FcdsDemonstrativo.Post;
            end;
            FcdsDemonstrativo.Next;
         end;

         x:=1;
         iNumCalc := 0;
         While x = 1 do
         begin
            bEntrou := False;
            FcdsDemonstrativo.First;
            bmSavePlace := FcdsDemonstrativo.GetBookmark;
            While not FcdsDemonstrativo.EOF do
            begin
               if FcdsDemonstrativo.FieldByName('CALCU').AsString <> 'S' then
               begin
                  bEntrou := True;

                  cdsCompSomatorio.Data := ListaCompSomatorio(FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').asInteger);

                  bCalc   := True;
                  dValAtu := 0;
                  dValAnt := 0;

                  // Salvar Ponteiro
                  bmSavePlace := FcdsDemonstrativo.GetBookmark;
                  cdsCompSomatorio.First;
                  While not cdsCompSomatorio.EOF do
                  begin
                     FcdsDemonstrativo.First;
                     While not FcdsDemonstrativo.EOF do
                     begin
                        if cdsCompSomatorio.FieldByName('ELEMENTODEM').AsInteger =
                           FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').AsInteger then
                        begin

                           //Verificaçao do tipo de operação para cálculo da fórmula
                           sOper := cdsCompSomatorio.FieldByName('FLGOPERACAO').asString;
                           if FcdsDemonstrativo.FieldByName('CALCU').AsString = 'S' then
                           begin
                              case sOPer[1] of
                                 'S' : begin
                                          dValAtu := dValAtu + FcdsDemonstrativo.FieldByName('ANOATU').AsFloat;
                                          dValAnt := dValAnt + FcdsDemonstrativo.FieldByName('ANOANT').AsFloat;
                                       end;
                                 'U' : begin
                                          dValAtu := dValAtu - FcdsDemonstrativo.FieldByName('ANOATU').AsFloat;
                                          dValAnt := dValAnt - FcdsDemonstrativo.FieldByName('ANOANT').AsFloat;
                                       end;
                                 'M' : begin
                                          dValAtu := dValAtu * FcdsDemonstrativo.FieldByName('ANOATU').AsFloat;
                                          dValAnt := dValAnt * FcdsDemonstrativo.FieldByName('ANOANT').AsFloat;
                                       end;
                                 'D' : begin
                                          if FcdsDemonstrativo.FieldByName('ANOATU').asFloat <> 0 then begin
                                             dValAtu := dValAtu / FcdsDemonstrativo.FieldByName('ANOATU').AsFloat;
                                          end else begin
                                             dValAtu := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('ANOANT').asFloat <> 0 then begin
                                             dValAnt := dValAnt / FcdsDemonstrativo.FieldByName('ANOANT').AsFloat;
                                          end else begin
                                             dValAnt := 0;
                                          end;
                                       end;
                                 'P' : begin
                                          if FcdsDemonstrativo.FieldByName('ANOATU').asFloat <> 0 then begin
                                             dValAtu := (dValAtu / FcdsDemonstrativo.FieldByName('ANOATU').AsFloat) * 100;
                                          end else begin
                                             dValAtu := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('ANOANT').asFloat <> 0 then begin
                                             dValAnt := (dValAnt / FcdsDemonstrativo.FieldByName('ANOANT').AsFloat) * 100;
                                          end else begin
                                             dValAnt := 0;
                                          end;
                                       end;
                              end;

                              if Trim(CdsCompSomatorio.FieldByName('ELECONDICAO').AsString) <> '' then
                              begin
                                 dValAtu := FazFormula(dValAtu,0,CdsCompSomatorio.FieldByName('FLGOPERACAO').AsString,
                                                                       CdsCompSomatorio.FieldByName('ELECONDICAO').AsString,
                                                                       CdsCompSomatorio.FieldByName('ELEVALORCOND').AsFloat,
                                                                       true);
                                 dValAnt := FazFormula(dValAnt,0,CdsCompSomatorio.FieldByName('FLGOPERACAO').AsString,
                                                                       CdsCompSomatorio.FieldByName('ELECONDICAO').AsString,
                                                                       CdsCompSomatorio.FieldByName('ELEVALORCOND').AsFloat,
                                                                       true);
                              end;

                           end else begin
                              bCalc := False;
                              Break;
                           end;
                        end;
                        FcdsDemonstrativo.Next;
                     end;
                     cdsCompSomatorio.Next;
                  end;
                  // Ponterar Query
                  FcdsDemonstrativo.GotoBookmark(bmSavePlace);
                  if bCalc then
                  begin
                     Inc(iNumCalc);
                     FcdsDemonstrativo.Edit;
                     FcdsDemonstrativo.FieldByName('ANOATU').AsFloat    := dValAtu;
                     FcdsDemonstrativo.FieldByName('ANOANT').AsFloat    := dValAnt;
                     if (FcdsDemonstrativo.FieldByName('FLGTIPONEGATIVO').AsString <> 'N') then
                     begin
                        FcdsDemonstrativo.FieldByName('ANOATUSN').AsFloat  := dValAtu;
                        FcdsDemonstrativo.FieldByName('ANOANTSN').AsFloat  := dValAnt;
                     end else begin
                        if Modulo.TestaNatureza(sNatureza,FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString,dValAtu) then
                        begin
                           FcdsDemonstrativo.FieldByName('ANOATUSN').AsFloat  := Abs(dValAtu)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('ANOATUSN').AsFloat  := Abs(dValAtu);
                        end;
                        if Modulo.TestaNatureza(sNatureza,FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString,dValAnt) then
                        begin
                           FcdsDemonstrativo.FieldByName('ANOANTSN').AsFloat  := Abs(dValAnt)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('ANOANTSN').AsFloat  := Abs(dValAnt);
                        end;
                     end;
                     FcdsDemonstrativo.FieldByName('DIFERENCA').AsFloat := (dValAtu - dValAnt);
                     FcdsDemonstrativo.FieldByName('CALCU').AsString    := 'S';
                     FcdsDemonstrativo.Post;
                  end;
               end;
               FcdsDemonstrativo.Next;
            end;
            FcdsDemonstrativo.FreeBookmark(bmSavePlace);
            if not bEntrou then
               Break;
            if iNumCalc = 0 then
            begin
               Break;
               Abort;
            end;
         end;

         // Exclui todas as linhas zeradas
         if not bZerados then
         begin
            FcdsDemonstrativo.First;
            while not FcdsDemonstrativo.EOF do
            begin
               if FcdsDemonstrativo.FieldByName('ANOATU').asFloat + FcdsDemonstrativo.FieldByName('ANOANT').asFloat = 0 then
               begin
                  if FcdsDemonstrativo.FieldByName('ELETIPOELEM').AsString <> 'T' then
                     FcdsDemonstrativo.Delete
                  else
                    FcdsDemonstrativo.Next;
               end else
               begin
                  FcdsDemonstrativo.Next;
               end;
            end;
         end;

         // Gera o arquivo teto
         if bGeraTxt then
            GeraTxt_Demo1(iExercicio,iDemo,sNomePer,sNomeDemo,sNomeMoeda) ;



      Except
        Result := false;
      End;

   Finally
     cdsCompConta.Free;
     cdsCompSomatorio.free;
     cdsLancResultado.Free;
     cdsSaldos.Free;
     Free;
   End;
end;

procedure TCtrlRptDemonstrativo.AfterInitialize;
begin
  inherited;
  Contab.initializeas(self);
  CtrlDemColuna.initializeas(self);
end;


procedure TCtrlRptDemonstrativo.SetcdsDemonstrativo(
  const Value: TClientDataSet);
begin
   FcdsDemonstrativo := Value;

end;

procedure TCtrlRptDemonstrativo.GeraTxt_Demo1(iExer,iDemo:Integer;sNomePeriodo,sNomeDemo,sNomeMoeda:String);
var sNomeArquivo, sLinha: string;
    iTamanho: integer;
    ArquivoTexto : TextFile;
begin
   sNomeArquivo := 'DEM01_' + IntToStr(iDemo) + '_'+ FormatDateTime('yyyymmdd', date) + '.TXT';

   //Cria Um Novo Arquivo ou Sobrescreve um já existente
   AssignFile(ArquivoTexto, sNomeArquivo);
   ReWrite(Arquivotexto);

   //Gera o Cabeçalho do arquivo texto
   sLinha := 'Exercicio: ' + IntToStr(iExer) + '    Periodo : ' + sNomePeriodo +'    Demonstrativo: '+sNomeDemo+'    Moeda : '+sNomeMoeda;
   WriteLn(ArquivoTexto, sLinha);
   WriteLn(ArquivoTexto, ' ');
   //
   //Gera o Segundo Cabeçalho do arquivo texto
   sLinha := '';
   sLinha   := sLinha + FuncaoGeral.AE('NOME DA LINHA',40);
   //
   sLinha   := sLinha + FuncaoGeral.AD('EXERCÍCIO ATUAL',20);
   sLinha   := sLinha + FuncaoGeral.AD('EXERCÍCIO ANTERIOR',20);
   sLinha   := sLinha + FuncaoGeral.AD('DIFERENÇA',20);
   WriteLn(ArquivoTexto, sLinha);

   with cdsDemonstrativo do
   begin
      First;
      while not eof do
      begin
         sLinha := '';

         //Concatena o Nome da Conta
         iTamanho := length(FieldByName('ELEDESCELEM').asString);
         sLinha := sLinha + FieldByName('ELEDESCELEM').asString + FuncaoGeral.spc(40-iTamanho);

         //Concatena os Valores
         sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('ANOATUSN').AsFloat), 20);
         sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('ANOANTSN').AsFloat), 20);
         sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('DIFERENCA').AsFloat), 20);
         WriteLn(ArquivoTexto, sLinha);
         Next;
      end;
      First;
   end;
   CloseFile(ArquivoTexto);

end;

procedure TCtrlRptDemonstrativo.GeraTxt_Demo2(iExer:Integer;sNomePeriodo1,sNomePeriodo2,sNomeDemo,sNomeMoedaReal,sNomeMoedaOrc:String);
var sNomeArquivo, sLinha: string;
    iTamanho: integer;
    ArquivoTexto : TextFile;
begin
   sNomeArquivo := 'DEM02_' +IntToStr(iExer)+'_'+ FormatDateTime('yyyymmdd', date) + '.TXT';

   //Cria Um Novo Arquivo ou Sobrescreve um já existente
   AssignFile(ArquivoTexto, sNomeArquivo);
   ReWrite(Arquivotexto);

   //Gera o Cabeçalho do arquivo texto
   sLinha := 'Exercicio: ' + IntToStr(iExer) + '    Periodo Inicial: ' + sNomePeriodo1 + '    Periodo Final: ' + sNomePeriodo2+'    Demonstrativo: '+sNomeDemo+'    Moeda Realizado: '+sNomeMoedaReal+'    Moeda Orçado: '+sNomeMoedaOrc;
   WriteLn(ArquivoTexto, sLinha);
   WriteLn(ArquivoTexto, ' ');

   //Gera o Segundo Cabeçalho do arquivo texto
   sLinha := '';
   sLinha   := sLinha + FuncaoGeral.AE('NOME DA LINHA',40);
   //
   sLinha   := sLinha + FuncaoGeral.AD('ORÇADO MÊS ANO ATU.',20);
   sLinha   := sLinha + FuncaoGeral.AD('REAL. MÊS ANO ATU.',20);
   sLinha   := sLinha + FuncaoGeral.AD('REAL. MÊS ANO ANT.',20);
   sLinha   := sLinha + FuncaoGeral.AD('ORÇADO ACUM.ANO ATU.',20);
   sLinha   := sLinha + FuncaoGeral.AD('REAL. ACUM. ANO ATU.',20);
   sLinha   := sLinha + FuncaoGeral.AD('REAL. ACUM. ANO ANT.',20);
   //
   sLinha   := sLinha + FuncaoGeral.AD('ORÇ.MÊS ANO ATU. SN',20);
   sLinha   := sLinha + FuncaoGeral.AD('REA.MÊS ANO ATU.SN',20);
   sLinha   := sLinha + FuncaoGeral.AD('REA.MÊS ANO ANT.SN',20);
   sLinha   := sLinha + FuncaoGeral.AD('ORÇ.ACUM.ANO ATU.SN',20);
   sLinha   := sLinha + FuncaoGeral.AD('REA.ACUM.ANO ATU.SN',20);
   sLinha   := sLinha + FuncaoGeral.AD('REA.ACUM.ANO ANT.SN',20);
   //
   sLinha   := sLinha + FuncaoGeral.AD('AP ORÇ.MÊS ANO ATU.',20);
   sLinha   := sLinha + FuncaoGeral.AD('AP REA.MÊS ANO ATU.',20);
   sLinha   := sLinha + FuncaoGeral.AD('AP REA.MÊS ANO ANT.',20);
   sLinha   := sLinha + FuncaoGeral.AD('AP ORÇ.ACUM.ANO ATU.',20);
   sLinha   := sLinha + FuncaoGeral.AD('AP REL.ACUM.ANO ATU.',20);
   sLinha   := sLinha + FuncaoGeral.AD('AP REA.ACUM.ANO ANT.',20);
   //
   sLinha   := sLinha + FuncaoGeral.AD('AV ORÇ.MÊS ANO ATU.',20);
   sLinha   := sLinha + FuncaoGeral.AD('AV REA.MÊS ANO ATU.',20);
   sLinha   := sLinha + FuncaoGeral.AD('AV REA.MÊS ANO ANT.',20);
   sLinha   := sLinha + FuncaoGeral.AD('AV ORÇ.ACUM.ANO ATU.',20);
   sLinha   := sLinha + FuncaoGeral.AD('AV REL.ACUM.ANO ATU.',20);
   sLinha   := sLinha + FuncaoGeral.AD('AV REA.ACUM.ANO ANT.',20);
   WriteLn(ArquivoTexto, sLinha);
   with cdsDemonstrativo do begin
      First;
      while not eof do begin
         sLinha := '';
         //Concatena o Nome da Conta
         iTamanho := length(FieldByName('ELEDESCELEM').asString);
         sLinha := sLinha + FieldByName('ELEDESCELEM').asString + FuncaoGeral.spc(40-iTamanho);
         //Concatena os Valores
         sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('ORCMES').AsFloat), 20);
         sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('REALMES').AsFloat), 20);
         sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('MESANT').AsFloat), 20);
         sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('ORCANO').AsFloat), 20);
         sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('REALANO').AsFloat), 20);
         sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('ANOANT').AsFloat), 20);
         sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('ORCMESSN').AsFloat), 20);
         sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('REALMESSN').AsFloat), 20);
         sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('MESANTSN').AsFloat), 20);
         sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('ORCANOSN').AsFloat), 20);
         sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('REALANOSN').AsFloat), 20);
         sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('ANOANTSN').AsFloat), 20);
         sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('PERORCMES').AsFloat), 20);
         sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('PERREALMES').AsFloat), 20);
         sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('PERMESANT').AsFloat), 20);
         sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('PERORCANO').AsFloat), 20);
         sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('PERREALANO').AsFloat), 20);
         sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('PERANOANT').AsFloat), 20);
         sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('PERORCMES1').AsFloat), 20);
         sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('PERREALMES1').AsFloat), 20);
         sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('PERMESANT1').AsFloat), 20);
         sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('PERORCANO1').AsFloat), 20);
         sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('PERREALANO1').AsFloat), 20);
         sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('PERANOANT1').AsFloat), 20);
         WriteLn(ArquivoTexto, sLinha);
         Next;
      end;
      First;
   end;
   CloseFile(ArquivoTexto);

end;

function TCtrlRptDemonstrativo.ProcessaDemoModelo2(iDemo, iPlano,iExercicio,
  iPeriodoIni,iPeriodoFim: Integer; sTipoOperResult, sNatureza, sCCustoIni,
  sAtivProj, sCodMoedaReal,sCodMoedaOrc, sPerDataIni, sNomePer1,sNomePer2,sNomeDemo,
  sNomeMoedaReal,sNomeMoedaOrc,sAtivMarca: string;  dEmpresa: Double; bDesconResult,
  bZerados,bGeraTxt: Boolean): Boolean;
var
  iElem100 :LongInt;
  iLinha,x,iNumCalc :Integer;
  sSalto,sSql,sOper,sDataRef:string;
  cdsCompConta     :TClientDataSet;
  cdsLancResultado :TClientDataSet;
  cdsSaldos        :TClientDataSet;
  cdsCompSomatorio :TClientDataSet;
  cdsPeriodoSaldo  :TClientDataSet;
  bEntrou,bCalc    :Boolean;
  dValAtu :Extended;
  dValAnt :Extended;
  dValReaMes, dValOrcMes, dValReaAno,dValOrcAno,dValAntMes, dValAntAno :Extended;
  dValorResult,dCotacaoAtu,dCotacaoAnt,dValorRea,dValorOrc :Extended;
  bmSavePlace : TBookmark;
begin

   Result := True;
   cdsCompConta     := TClientDataSet.Create(nil);
   cdsLancResultado := TClientDataSet.Create(nil);
   cdsSaldos        := TClientDataSet.Create(nil);
   cdsCompSomatorio := TClientDataSet.Create(nil);
   cdsPeriodoSaldo  := TClientDataSet.Create(nil);


   With TCMSqlParams.Create(nil) Do
   Try

      Try

         SQL.Clear;
         SQL.Add('SELECT                                                              ');
         SQL.Add('    (0) AS ORCMES, (0) AS REALMES, (0) AS MESANT,                   ');
         SQL.Add('    (0) AS ORCANO, (0) AS REALANO, (0) AS ANOANT,                   ');
         SQL.Add('    (0) AS ORCMESSN, (0) AS REALMESSN, (0) AS MESANTSN,             ');
         SQL.Add('    (0) AS ORCANOSN, (0) AS REALANOSN, (0) AS ANOANTSN,             ');
         SQL.Add('    (0) AS PERORCMES, (0) AS PERREALMES, (0) AS PERMESANT,          ');
         SQL.Add('    (0) AS PERORCANO, (0) AS PERREALANO, (0) AS PERANOANT,          ');
         SQL.Add('    (0) AS PERORCMES1, (0) AS PERREALMES1, (0) AS PERMESANT1,       ');
         SQL.Add('    (0) AS PERORCANO1, (0) AS PERREALANO1, (0) AS PERANOANT1,       ');
         SQL.Add('    (''N'') AS CALCU, ('' '') AS SALTA, E.IDELEMANAVERTICAL,        ');
         SQL.Add('   E.ELEDESCELEM, E.FLGINDENTACAO, E.FLGTIPOLINHA, E.ELEORDEMLINHA, ');
         SQL.Add('   E.IDELEMDEMONSTRAT,E.ELETIPOELEM,E.FLGSALTAPAGINA,E.FLGMONETARIA,');
         SQL.Add('   E.FLGTRACO,E.FLGNEGRITO,E.FLGNATUREZA,E.FLGTIPONEGATIVO,         ');
         SQL.Add('   E.FLGDECIMAIS, E.IDELEMANAVERT1                                  ');
         SQL.Add('FROM                                                                ');
         SQL.Add('   ELEMDEMONSTRATIVO E                                              ');
         SQL.Add('WHERE                                                               ');
         SQL.Add('    (E.IDDEMONSTRATIVO =:IDDEMONSTRATIVO)                           ');
         SQL.Add('ORDER BY                                                            ');
         SQL.Add('    E.ELEORDEMLINHA                                                 ');

         Prepare;
         ParamByName('IDDEMONSTRATIVO').asInteger := iDemo;
         FcdsDemonstrativo.Data := Data;

         //zera o acumulador de salto de pagina
         iLinha := 0;
         sSalto := 'N';

         FcdsDemonstrativo.First;
         while not FcdsDemonstrativo.EOF do begin

            if sSalto = 'S' then begin
               inc(iLinha);
               sSalto := 'N';
            end;

            if FcdsDemonstrativo.FieldByName('FLGSALTAPAGINA').asString = 'S' then begin
               sSalto := 'S';
            end;

            FcdsDemonstrativo.Edit;
            FcdsDemonstrativo.FieldByName('SALTA').asString := IntToStr(iLinha);

            cdsCompConta.Data := ListaCompConta(FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').asInteger);
            sSql := sSqlCompConta;

            dValReaMes := 0;
            dValOrcMes := 0;
            dValReaAno := 0;
            dValOrcAno := 0;
            dValAntMes := 0;
            dValAntAno := 0;
            //
            if not cdsCompConta.IsEmpty then begin
               cdsCompConta.First;
               While not cdsCompConta.EOF do begin
                  //Ano Atual
                  if sNatureza = 'C' then begin
                     sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR) -               ';
                     sSql := sSql + '           DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE)) AS SALDO,        ';
                     sSql := sSql + '       SUM(DECODE(S.PLSORCADOCREDITO,NULL,0,S.PLSORCADOCREDITO) -               ';
                     sSql := sSql + '           DECODE(S.PLSORCADODEBITO,NULL,0,S.PLSORCADODEBITO)) AS SALDOORC,     ';
                  end else begin
                     sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE) -                 ';
                     sSql := sSql + '           DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR)) AS SALDO,      ';
                     sSql := sSql + '       SUM(DECODE(S.PLSORCADODEBITO,NULL,0,S.PLSORCADODEBITO) -               ';
                     sSql := sSql + '           DECODE(S.PLSORCADOCREDITO,NULL,0,S.PLSORCADOCREDITO)) AS SALDOORC,     ';
                  end;
                  sSql := sSql + 'S.PERNUMERO, P.PERDATFIM                                                      ';
                  sSql := sSql + 'FROM PLANOSALDO S, PERIODO P, CENTCUST CC                                                  ';
                  sSql := sSql + 'WHERE (S.PLACONTA = '''+cdsCompConta.FieldByName('PLACONTA').AsString+''')    ';
                  sSql := sSql + '      AND (S.PLANO = '+IntToStr(iPlano)+')                                    ';
                  sSql := sSql + '      AND (S.IDPESSOA = '+FloatToStr(dEmpresa)+')                             ';
                  sSql := sSql + '      AND (S.PEREXERCICIO = '+IntToStr(iExercicio)+')                         ';
                  sSql := sSql + '      AND ((S.PERNUMERO  <= '+IntToStr(iPeriodoFim)+')                        ';
                  sSql := sSql + '      OR  (S.PERNUMERO  IS NULL))                                            ';
                  sSql := sSql + '      AND (S.PERNUMERO = P.PERNUMERO(+)                ) ';
                  sSql := sSql + '      AND (S.PEREXERCICIO = P.PEREXERCICIO(+)          ) ';
                  sSql := sSql + '      AND (S.IDPESSOA = P.IDPESSOA(+)                  ) ';
                  if not cdsCompConta.FieldByName('CODEXTERNO').isNull then begin
                    sSql := sSql + '   AND (CC.CODEXTERNO LIKE '''+cdsCompConta.FieldByName('CODEXTERNO').AsString+'%'') ';
                  end;

                  if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                     sSql := sSql + '   AND (S.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                  end;
                  if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                     sSql := sSql + '   AND (S.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                  end;

                  sSql := sSql + ' AND (S.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) ) ';

                  if sCCustoIni <> '' then begin
                     sSql := sSql + ' AND (RTRIM(CC.CODEXTERNO) LIKE '''+sCCustoIni+'%'')';
                     sSql := sSql + ' AND (S.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                  end;

                  if trim(sAtivMarca) <> '' then begin
                     sSql := sSql + ' AND  (S.UNIDNEGOC IN (' + trim(sAtivMarca) + ')) ';
                  end;
                  if sAtivProj <> '' then begin
                     sSql := sSql + ' AND (S.UNIDNEGOC = '+sAtivProj+')';
                  end;

                  if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                  begin
                    sSql := sSql + ' AND (S.IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                  end;

                  if not cdsCompConta.fieldByName('IDPATRO').isNull then
                  begin
                    sSql := sSql + ' AND (S.IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                  end;

                  sSql := sSql + '   GROUP BY S.PERNUMERO,P.PERDATFIM  ';

                  cdsSaldos.Data := GetDataPacket(sSql);

                  if not cdsSaldos.IsEmpty then begin
                     //FazUPdate do Ano Atual
                     cdsSaldos.First;
                     While not cdsSaldos.EOF do begin
                        dValorResult := 0;
                        if (bDesconResult) and (sTipoOperResult <> '') then begin
                           if sNatureza = 'C' then begin
                              sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';
                           end else begin
                              sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';
                           end;
                           sSql := sSql + 'FROM PLANILHA P, LANCAMENTO L, CENTCUST CC                              ';
                           sSql := sSql + 'WHERE     (L.PLACONTA LIKE '''+cdsCompConta.FieldByName('PLACONTA').AsString+'%'+''')           ';
                           sSql := sSql + '      AND (L.PLANO = '+IntToStr(iPlano)+')                                ';
                           sSql := sSql + '      AND (P.IDPESSOA = '+FloatToStr(dEmpresa)+')                             ';
                           sSql := sSql + '      AND (L.TIPCODIGO = '''+sTipoOperResult+''')            ';
                           if cdsSaldos.FieldByName('PERNUMERO').IsNull then begin
                              sSql := sSql + '      AND (P.PEREXERCICIO = '+IntToStr(iExercicio)+')     ';
                              sSql := sSql + '      AND (P.PERNUMERO  IS NULL)                          ';
                           end else begin
                              cdsPeriodoSaldo.Data := ListaDadosPeriodo(dEmpresa,iExercicio ,cdsSaldos.FieldByName('PERNUMERO').AsInteger);
                              sSql := sSql + '      AND (P.PLNDATDIA >= TO_DATE('''+cdsPeriodoSaldo.FieldByName('PERDATINI').AsString+''',''DD/MM/YYYY'')) ';
                              sSql := sSql + '      AND (P.PLNDATDIA <= TO_DATE('''+cdsPeriodoSaldo.FieldByName('PERDATFIM').AsString+''',''DD/MM/YYYY'')) ';
                           end;
                           sSql := sSql + '      AND (P.PLNCODIGO = L.PLNCODIGO) ';

                           if not cdsCompConta.FieldByName('CODEXTERNO').isNull then begin
                              sSql := sSql + '   AND (CC.CODEXTERNO LIKE '''+cdsCompConta.FieldByName('CODEXTERNO').AsString+'%'') ';
                              sSql := sSql + '   AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                           end;

                           if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                              sSql := sSql + '   AND (L.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                              sSql := sSql + '   AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;
                           if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                              sSql := sSql + ' AND (L.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                              sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;
                           sSql := sSql + ' AND (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) ';

                           if sCCustoIni <> '' then begin
                              sSql := sSql + ' AND (RTRIM(CC.CODEXTERNO) LIKE '''+sCCustoIni+'%'')';
                              sSql := sSql + ' AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                           end;

                           if trim(sAtivMarca) <> '' then begin
                              sSql := sSql + ' AND  (L.UNIDNEGOC IN (' + trim(sAtivMarca) + ')) ';
                           end;
                           if sAtivProj <> '' then begin
                              sSql := sSql + ' AND (L.UNIDNEGOC = '+sAtivProj+')';
                              sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;

                           if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                           begin
                             sSql := sSql + ' AND (L.IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                           end;

                           if not cdsCompConta.fieldByName('IDPATRO').isNull then
                           begin
                             sSql := sSql + ' AND (L.IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                           end;

                           cdsLancResultado.Data := GetDataPacket(sSql);
                           if not cdsLancResultado.IsEmpty then
                           begin
                             dValorResult := cdsLancResultado.FieldByName('SALDO').AsFloat;
                           end;
                        end;

                        dValorRea  := cdsSaldos.FieldByName('SALDO').AsFloat - dValorResult;
                        dValorOrc  := cdsSaldos.FieldByName('SALDOORC').AsFloat;
                        if (sCodMoedaReal <> '') and (FcdsDemonstrativo.FieldByName('FLGMONETARIA').AsString = 'S') then begin
                           if cdsSaldos.FieldByName('PERDATFIM').isNull then begin
                              sDataRef := sPerDataIni;
                           end else begin
                              sDataRef := cdsSaldos.FieldByName('PERDATFIM').AsString;
                           end;
                           dCotacaoAtu := Contab.TestaCotacaoMoeda(StrToInt(sCodMoedaReal),
                                          StrToDate(sDataRef),False);
                           if dCotacaoAtu <> 0 then begin
                              dValorRea:= dValorRea/dCotacaoAtu;
                           end else begin
                              dValorRea:= 0;
                           end;
                        end;
                        if (sCodMoedaOrc <> '') and (FcdsDemonstrativo.FieldByName('FLGMONETARIA').AsString = 'S') then begin
                           if cdsSaldos.FieldByName('PERDATFIM').isNull then begin
                              sDataRef := sPerDataIni;
                           end else begin
                              sDataRef := cdsSaldos.FieldByName('PERDATFIM').AsString;
                           end;
                           dCotacaoAtu := Contab.TestaCotacaoMoeda(StrToInt(sCodMoedaOrc),
                                          StrToDate(sDataRef),False);
                           if dCotacaoAtu <> 0 then begin
                              dValorOrc:= dValorOrc/dCotacaoAtu;
                           end else begin
                              dValorOrc:= 0;
                           end;
                        end;
                        if (cdsSaldos.FieldByName('PERNUMERO').AsInteger >= iPeriodoIni) and
                           (cdsSaldos.FieldByName('PERNUMERO').AsInteger <= iPeriodoFim) then begin
                           dValReaMes := dValReaMes + dValorRea;
                           dValOrcMes := dValOrcMes + dValorOrc;
                        end;
                        dValReaAno := dValReaAno + dValorRea;
                        dValOrcAno := dValOrcAno + dValorOrc;
                        cdsSaldos.Next;
                     end;
                  end;
                  //
                  //Ano Anterior
                  if sNatureza = 'C' then begin
                     sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR) -               ';
                     sSql := sSql + '           DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE)) AS SALDO,        ';
                  end else begin
                     sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE) -                 ';
                     sSql := sSql + '           DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR)) AS SALDO,      ';
                  end;
                  sSql := sSql + 'S.PERNUMERO, P.PERDATFIM                                                           ';
                  sSql := sSql + 'FROM PLANOSALDO S, PERIODO P, CENTCUST CC                                 ';
                  sSql := sSql + 'WHERE (S.PLACONTA = '''+cdsCompConta.FieldByName('PLACONTA').AsString+''')           ';
                  sSql := sSql + '      AND (S.PLANO = '+IntToStr(iPlano)+')                             ';
                  sSql := sSql + '      AND (S.IDPESSOA = '+FloatToStr(dEmpresa)+')                      ';
                  sSql := sSql + '      AND (S.PEREXERCICIO = '+IntToStr(iExercicio -1)+')               ';
                  sSql := sSql + '      AND ((S.PERNUMERO  <= '+IntToStr(iPeriodoFim)+')                 ';
                  sSql := sSql + '      OR   (S.PERNUMERO  IS NULL))                                     ';
                  sSql := sSql + '      AND (S.PERNUMERO = P.PERNUMERO(+)                ) ';
                  sSql := sSql + '      AND (S.PEREXERCICIO = P.PEREXERCICIO(+)          ) ';
                  sSql := sSql + '      AND (S.IDPESSOA = P.IDPESSOA(+)                  ) ';


                  if not cdsCompConta.FieldByName('CODEXTERNO').isNull then begin
                     sSql := sSql + '   AND (CC.CODEXTERNO LIKE '''+cdsCompConta.FieldByName('CODEXTERNO').AsString+'%'') ';
                  end;

                  if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                     sSql := sSql + '   AND (S.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                  end;
                  if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                     sSql := sSql + '   AND (S.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                  end;

                  sSql := sSql + ' AND (S.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) ';

                  if sCCustoIni <> '' then begin
                     sSql := sSql + ' AND (RTRIM(CC.CODEXTERNO) LIKE '''+sCCustoIni+'%'')';
                     sSql := sSql + ' AND (S.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                  end;

                  if trim(sAtivMarca) <> '' then begin
                     sSql := sSql + ' AND  (S.UNIDNEGOC IN (' + trim(sAtivMarca) + ')) ';
                  end;
                  if sAtivProj <> '' then begin
                     sSql := sSql + ' AND (S.UNIDNEGOC = '+sAtivProj+')';
                  end;

                  if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                  begin
                    sSql := sSql + ' AND (S.IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                  end;

                  if not cdsCompConta.fieldByName('IDPATRO').isNull then
                  begin
                    sSql := sSql + ' AND (S.IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                  end;

                  sSql := sSql + '   GROUP BY S.PERNUMERO,P.PERDATFIM ';

                  cdsSaldos.Data := GetDataPacket(sSql);

                  if not cdsSaldos.IsEmpty then begin
                     //FazUPdate do Ano Atual
                     cdsSaldos.First;
                     While not cdsSaldos.EOF do begin
                        dValorResult := 0;
                        if (bDesconResult) and (sTipoOperResult <> '') then begin
                           if sNatureza = 'C' then begin
                              sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';
                           end else begin
                              sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';
                           end;
                           sSql := sSql + 'FROM PLANILHA P, LANCAMENTO L, CENTCUST CC                                               ';
                           sSql := sSql + 'WHERE     (L.PLACONTA LIKE '''+cdsCompConta.FieldByName('PLACONTA').AsString+'%'+''')           ';
                           sSql := sSql + '      AND (L.PLANO = '+IntToStr(iPlano)+')                                ';
                           sSql := sSql + '      AND (P.IDPESSOA = '+FloatToStr(dEmpresa)+')                             ';
                           sSql := sSql + '      AND (L.TIPCODIGO = '''+sTipoOperResult+''')            ';
                           if cdsSaldos.FieldByName('PERNUMERO').IsNull then begin
                              sSql := sSql + '      AND (P.PEREXERCICIO = '+IntToStr(iExercicio -1)+') ';
                              sSql := sSql + '      AND (P.PERNUMERO  IS NULL)                                                 ';
                           end else begin
                              cdsPeriodoSaldo.Data := ListaDadosPeriodo(dEmpresa,(iExercicio -1),cdsSaldos.FieldByName('PERNUMERO').AsInteger);
                              sSql := sSql + '      AND (P.PLNDATDIA >= TO_DATE('''+cdsPeriodoSaldo.FieldByName('PERDATINI').AsString+''',''DD/MM/YYYY'')) ';
                              sSql := sSql + '      AND (P.PLNDATDIA <= TO_DATE('''+cdsPeriodoSaldo.FieldByName('PERDATFIM').AsString+''',''DD/MM/YYYY'')) ';
                           end;
                           sSql := sSql + '      AND (P.PLNCODIGO = L.PLNCODIGO) ';

                           if not cdsCompConta.FieldByName('CODCENTROCUSTO').isNull then begin
                              sSql := sSql + '   AND (L.CODCENTROCUSTO LIKE '''+cdsCompConta.FieldByName('CODCENTROCUSTO').AsString+'%'') ';
                              sSql := sSql + '   AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                           end;

                           if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                              sSql := sSql + '   AND (L.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                              sSql := sSql + '   AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;
                           if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                              sSql := sSql + ' AND (L.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                              sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;


                          sSql := sSql + ' AND (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) ';

                          if sCCustoIni <> '' then begin
                             sSql := sSql + ' AND (RTRIM(CC.CODEXTERNO) LIKE '''+sCCustoIni+'%'')';
                             sSql := sSql + ' AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                          end;


                           if trim(sAtivMarca) <> '' then begin
                              sSql := sSql + ' AND  (L.UNIDNEGOC IN (' + trim(sAtivMarca) + ')) ';
                           end;
                           if sAtivProj <> '' then begin
                              sSql := sSql + ' AND (L.UNIDNEGOC = '+sAtivProj+')';
                              sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;

                           if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                           begin
                             sSql := sSql + ' AND (L.IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                           end;

                           if not cdsCompConta.fieldByName('IDPATRO').isNull then
                           begin
                             sSql := sSql + ' AND (L.IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                           end;

                           cdsLancResultado.Data := GetDataPacket(sSql);
                           if not cdsLancResultado.IsEmpty then
                           begin
                             dValorResult := cdsLancResultado.FieldByName('SALDO').AsFloat;
                           end;
                        end;
                        dValorRea  := cdsSaldos.FieldByName('SALDO').AsFloat - dValorResult;
                        if (sCodMoedaReal <> '') and (FcdsDemonstrativo.FieldByName('FLGMONETARIA').AsString = 'S') then begin
                           if cdsSaldos.FieldByName('PERDATFIM').isNull then begin
                              sDataRef := sPerDataIni;
                           end else begin
                              sDataRef := cdsSaldos.FieldByName('PERDATFIM').AsString;
                           end;
                           dCotacaoAtu := Contab.TestaCotacaoMoeda(StrToInt(sCodMoedaOrc),
                                          StrToDate(sDataRef),False);
                           if dCotacaoAtu <> 0 then begin
                              dValorRea:= dValorRea/dCotacaoAtu;
                           end else begin
                              dValorRea:= 0;
                           end;
                        end;
                        if (cdsSaldos.FieldByName('PERNUMERO').AsInteger >= iPeriodoIni) and
                           (cdsSaldos.FieldByName('PERNUMERO').AsInteger <= iPeriodoFim) then begin
                           dValAntMes := dValAntMes + dValorRea;
                        end;
                        dValAntAno := dValAntAno + dValorRea;
                        cdsSaldos.Next;
                     end;
                  end;
                  cdsCompConta.Next;
               end;
               FcdsDemonstrativo.Edit;
               FcdsDemonstrativo.FieldByName('ORCMES').AsFloat    := dValOrcMes;
               FcdsDemonstrativo.FieldByName('ORCANO').AsFloat    := dValOrcAno;
               FcdsDemonstrativo.FieldByName('REALMES').AsFloat   := dValReaMes;
               FcdsDemonstrativo.FieldByName('REALANO').AsFloat   := dValReaAno;
               FcdsDemonstrativo.FieldByName('MESANT').AsFloat    := dValAntMes;
               FcdsDemonstrativo.FieldByName('ANOANT').AsFloat    := dValAntAno;

               if (FcdsDemonstrativo.FieldByName('FLGTIPONEGATIVO').AsString <> 'N') then begin
                  FcdsDemonstrativo.FieldByName('ORCMESSN').AsFloat    := dValOrcMes;
                  FcdsDemonstrativo.FieldByName('ORCANOSN').AsFloat    := dValOrcAno;
                  FcdsDemonstrativo.FieldByName('REALMESSN').AsFloat   := dValReaMes;
                  FcdsDemonstrativo.FieldByName('REALANOSN').AsFloat   := dValReaAno;
                  FcdsDemonstrativo.FieldByName('MESANTSN').AsFloat    := dValAntMes;
                  FcdsDemonstrativo.FieldByName('ANOANTSN').AsFloat    := dValAntAno;
               end else begin
                  if Modulo.TestaNatureza(sNatureza, FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValOrcMes) then begin
                     FcdsDemonstrativo.FieldByName('ORCMESSN').AsFloat := Abs(dValOrcMes)* (-1);
                  end else begin
                     FcdsDemonstrativo.FieldByName('ORCMESSN').AsFloat := Abs(dValOrcMes);
                  end;

                  if Modulo.TestaNatureza(sNatureza,FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValOrcAno) then begin
                     FcdsDemonstrativo.FieldByName('ORCANOSN').AsFloat := Abs(dValOrcAno)* (-1);
                  end else begin
                     FcdsDemonstrativo.FieldByName('ORCANOSN').AsFloat := Abs(dValOrcAno);
                  end;

                  if Modulo.TestaNatureza(sNatureza,FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValReaMes) then begin
                     FcdsDemonstrativo.FieldByName('REALMESSN').AsFloat := Abs(dValReaMes)* (-1);
                  end else begin
                     FcdsDemonstrativo.FieldByName('REALMESSN').AsFloat := Abs(dValReaMes);
                  end;

                  if Modulo.TestaNatureza(sNatureza, FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValReaAno) then begin
                     FcdsDemonstrativo.FieldByName('REALANOSN').AsFloat := Abs(dValReaAno)* (-1);
                  end else begin
                     FcdsDemonstrativo.FieldByName('REALANOSN').AsFloat := Abs(dValReaAno);
                  end;

                  if Modulo.TestaNatureza(sNatureza,FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValAntMes) then begin
                     FcdsDemonstrativo.FieldByName('MESANTSN').AsFloat := Abs(dValAntMes)* (-1);
                  end else begin
                     FcdsDemonstrativo.FieldByName('MESANTSN').AsFloat := Abs(dValAntMes);
                  end;

                  if Modulo.TestaNatureza(sNatureza, FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValAntAno) then begin
                     FcdsDemonstrativo.FieldByName('ANOANTSN').AsFloat := Abs(dValAntAno)* (-1);
                  end else begin
                     FcdsDemonstrativo.FieldByName('ANOANTSN').AsFloat := Abs(dValAntAno);
                  end;
               end;
               FcdsDemonstrativo.FieldByName('CALCU').AsString    := 'S';
               FcdsDemonstrativo.Post;
            end;
            FcdsDemonstrativo.Next;
         end;
         x:=1;
         iNumCalc:=0;
         While x = 1 do begin
            bEntrou:=False;
            FcdsDemonstrativo.First;
            bmSavePlace := FcdsDemonstrativo.GetBookmark;
            While not FcdsDemonstrativo.EOF do begin
               sSql := FcdsDemonstrativo.FieldByName('CALCU').AsString+'/'+FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').AsString;
               if FcdsDemonstrativo.FieldByName('CALCU').AsString <> 'S' then begin
                  bEntrou:=True;

                  cdsCompSomatorio.Data := ListaCompSomatorio(FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').asInteger);

                  bCalc  :=True;
                  dValReaMes := 0;
                  dValOrcMes := 0;
                  dValReaAno := 0;
                  dValOrcAno := 0;
                  dValAntMes := 0;
                  dValAntAno := 0;
                  // Salvar Ponteiro
                  bmSavePlace := FcdsDemonstrativo.GetBookmark;
                  cdsCompSomatorio.First;
                  While not cdsCompSomatorio.EOF do begin
                     FcdsDemonstrativo.First;
                     While not FcdsDemonstrativo.EOF do begin
                        if cdsCompSomatorio.FieldByName('ELEMENTODEM').AsInteger = FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').AsInteger then begin
                           //Verificaçao do tipo de operação para cálculo da fórmula
                           sOper := cdsCompSomatorio.FieldByName('FLGOPERACAO').asString;
                           if FcdsDemonstrativo.FieldByName('CALCU').AsString = 'S' then begin
                              case sOPer[1] of
                                 'S' : begin
                                          dValReaMes := dValReaMes + FcdsDemonstrativo.FieldByName('REALMES').AsFloat;
                                          dValOrcMes := dValOrcMes + FcdsDemonstrativo.FieldByName('ORCMES').AsFloat;
                                          dValReaAno := dValReaAno + FcdsDemonstrativo.FieldByName('REALANO').AsFloat;
                                          dValOrcAno := dValOrcAno + FcdsDemonstrativo.FieldByName('ORCANO').AsFloat;
                                          dValAntMes := dValAntMes + FcdsDemonstrativo.FieldByName('MESANT').AsFloat;
                                          dValAntAno := dValAntAno + FcdsDemonstrativo.FieldByName('ANOANT').AsFloat;
                                       end;
                                 'U' : begin
                                          dValReaMes := dValReaMes - FcdsDemonstrativo.FieldByName('REALMES').AsFloat;
                                          dValOrcMes := dValOrcMes - FcdsDemonstrativo.FieldByName('ORCMES').AsFloat;
                                          dValReaAno := dValReaAno - FcdsDemonstrativo.FieldByName('REALANO').AsFloat;
                                          dValOrcAno := dValOrcAno - FcdsDemonstrativo.FieldByName('ORCANO').AsFloat;
                                          dValAntMes := dValAntMes - FcdsDemonstrativo.FieldByName('MESANT').AsFloat;
                                          dValAntAno := dValAntAno - FcdsDemonstrativo.FieldByName('ANOANT').AsFloat;
                                       end;
                                 'M' : begin
                                          dValReaMes := dValReaMes * FcdsDemonstrativo.FieldByName('REALMES').AsFloat;
                                          dValOrcMes := dValOrcMes * FcdsDemonstrativo.FieldByName('ORCMES').AsFloat;
                                          dValReaAno := dValReaAno * FcdsDemonstrativo.FieldByName('REALANO').AsFloat;
                                          dValOrcAno := dValOrcAno * FcdsDemonstrativo.FieldByName('ORCANO').AsFloat;
                                          dValAntMes := dValAntMes * FcdsDemonstrativo.FieldByName('MESANT').AsFloat;
                                          dValAntAno := dValAntAno * FcdsDemonstrativo.FieldByName('ANOANT').AsFloat;
                                       end;
                                 'D' : begin
                                          if FcdsDemonstrativo.FieldByName('REALMES').asFloat <> 0 then begin
                                             dValReaMes := dValReaMes / FcdsDemonstrativo.FieldByName('REALMES').AsFloat;
                                          end else begin
                                             dValReaMes := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('ORCMES').asFloat <> 0 then begin
                                             dValOrcMes := dValOrcMes / FcdsDemonstrativo.FieldByName('ORCMES').AsFloat;
                                          end else begin
                                             dValOrcMes := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('REALANO').asFloat <> 0 then begin
                                             dValReaAno := dValReaAno / FcdsDemonstrativo.FieldByName('REALANO').AsFloat;
                                          end else begin
                                             dValReaAno := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('ORCANO').asFloat <> 0 then begin
                                             dValOrcAno := dValOrcAno / FcdsDemonstrativo.FieldByName('ORCANO').AsFloat;
                                          end else begin
                                             dValOrcAno := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('ANOANT').asFloat <> 0 then begin
                                             dValAntAno := dValAntAno / FcdsDemonstrativo.FieldByName('ANOANT').AsFloat;
                                          end else begin
                                             dValAntAno := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('MESANT').asFloat <> 0 then begin
                                             dValAntMes := dValAntMes / FcdsDemonstrativo.FieldByName('MESANT').AsFloat;
                                          end else begin
                                             dValAntMEs := 0;
                                          end;
                                       end;
                                 'P' : begin
                                          if FcdsDemonstrativo.FieldByName('REALMES').asFloat <> 0 then begin
                                             dValReaMes := (dValReaMes / FcdsDemonstrativo.FieldByName('REALMES').AsFloat) * 100;
                                          end else begin
                                             dValReaMes := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('ORCMES').asFloat <> 0 then begin
                                             dValOrcMes := (dValOrcMes / FcdsDemonstrativo.FieldByName('ORCMES').AsFloat) * 100;
                                          end else begin
                                             dValOrcMes := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('REALANO').asFloat <> 0 then begin
                                             dValReaAno := (dValReaAno / FcdsDemonstrativo.FieldByName('REALANO').AsFloat) * 100;
                                          end else begin
                                             dValReaAno := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('ORCANO').asFloat <> 0 then begin
                                             dValOrcAno := (dValOrcAno / FcdsDemonstrativo.FieldByName('ORCANO').AsFloat) * 100;
                                          end else begin
                                             dValOrcAno := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('ANOANT').asFloat <> 0 then begin
                                             dValAntAno := (dValAntAno / FcdsDemonstrativo.FieldByName('ANOANT').AsFloat) * 100;
                                          end else begin
                                             dValAntAno := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('MESANT').asFloat <> 0 then begin
                                             dValAntMes := (dValAntMes / FcdsDemonstrativo.FieldByName('MESANT').AsFloat) * 100;
                                          end else begin
                                             dValAntMEs := 0;
                                          end;
                                       end;
                              end;
                           end else begin
                              bCalc:=False;
                              Break;
                           end;
                        end;
                        FcdsDemonstrativo.Next;
                     end;
                     cdsCompSomatorio.Next;
                  end;
                  FcdsDemonstrativo.GotoBookmark(bmSavePlace);
                  if bCalc then begin
                     Inc(iNumCalc);
                     FcdsDemonstrativo.Edit;
                     FcdsDemonstrativo.FieldByName('ORCMES').AsFloat    := dValOrcMes;
                     FcdsDemonstrativo.FieldByName('ORCANO').AsFloat    := dValOrcAno;
                     FcdsDemonstrativo.FieldByName('REALMES').AsFloat   := dValReaMes;
                     FcdsDemonstrativo.FieldByName('REALANO').AsFloat   := dValReaAno;
                     FcdsDemonstrativo.FieldByName('MESANT').AsFloat    := dValAntMes;
                     FcdsDemonstrativo.FieldByName('ANOANT').AsFloat    := dValAntAno;

                     if (FcdsDemonstrativo.FieldByName('FLGTIPONEGATIVO').AsString <> 'N') then begin
                        FcdsDemonstrativo.FieldByName('ORCMESSN').AsFloat    := dValOrcMes;
                        FcdsDemonstrativo.FieldByName('ORCANOSN').AsFloat    := dValOrcAno;
                        FcdsDemonstrativo.FieldByName('REALMESSN').AsFloat   := dValReaMes;
                        FcdsDemonstrativo.FieldByName('REALANOSN').AsFloat   := dValReaAno;
                        FcdsDemonstrativo.FieldByName('MESANTSN').AsFloat    := dValAntMes;
                        FcdsDemonstrativo.FieldByName('ANOANTSN').AsFloat    := dValAntAno;
                     end else begin
                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValOrcMes) then begin
                           FcdsDemonstrativo.FieldByName('ORCMESSN').AsFloat := Abs(dValOrcMes)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('ORCMESSN').AsFloat := Abs(dValOrcMes);
                        end;
                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValOrcAno) then begin
                           FcdsDemonstrativo.FieldByName('ORCANOSN').AsFloat := Abs(dValOrcAno)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('ORCANOSN').AsFloat := Abs(dValOrcAno);
                        end;

                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValReaMes) then begin
                           FcdsDemonstrativo.FieldByName('REALMESSN').AsFloat := Abs(dValReaMes)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('REALMESSN').AsFloat := Abs(dValReaMes);
                        end;
                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValReaAno) then begin
                           FcdsDemonstrativo.FieldByName('REALANOSN').AsFloat := Abs(dValReaAno)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('REALANOSN').AsFloat := Abs(dValReaAno);
                        end;

                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValAntMes) then begin
                           FcdsDemonstrativo.FieldByName('MESANTSN').AsFloat := Abs(dValAntMes)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('MESANTSN').AsFloat := Abs(dValAntMes);
                        end;
                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValAntAno) then begin
                           FcdsDemonstrativo.FieldByName('ANOANTSN').AsFloat := Abs(dValAntAno)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('ANOANTSN').AsFloat := Abs(dValAntAno);
                        end;
                     end;

                     FcdsDemonstrativo.FieldByName('CALCU').AsString := 'S';
                     FcdsDemonstrativo.Post;
                  end;
               end;
               FcdsDemonstrativo.Next;
            end;
            FcdsDemonstrativo.FreeBookmark(bmSavePlace);
            if not bEntrou then Break;
            if iNumCalc = 0 then begin
               Break;
               Abort;
            end;
         end;
         //Calcula Percentuais
         FcdsDemonstrativo.First;
         bmSavePlace := FcdsDemonstrativo.GetBookmark;
         While not FcdsDemonstrativo.EOF do begin
            If not FcdsDemonstrativo.FieldByName('IDELEMANAVERTICAL').isNull then begin
               iElem100   := FcdsDemonstrativo.FieldByName('IDELEMANAVERTICAL').AsInteger;
               dValReaMes := 0;
               dValOrcMes := 0;
               dValReaAno := 0;
               dValOrcAno := 0;
               dValAntMes := 0;
               dValAntAno := 0;
               // Salvar Ponteiro
               bmSavePlace := FcdsDemonstrativo.GetBookmark;
               FcdsDemonstrativo.First;
               While not FcdsDemonstrativo.EOF do begin
                  if (iElem100 = FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').AsInteger) then begin
                     dValReaMes := FcdsDemonstrativo.FieldByName('REALMES').AsFloat;
                     dValOrcMes := FcdsDemonstrativo.FieldByName('ORCMES').AsFloat;
                     dValReaAno := FcdsDemonstrativo.FieldByName('REALANO').AsFloat;
                     dValOrcAno := FcdsDemonstrativo.FieldByName('ORCANO').AsFloat;
                     dValAntMes := FcdsDemonstrativo.FieldByName('MESANT').AsFloat;
                     dValAntAno := FcdsDemonstrativo.FieldByName('ANOANT').AsFloat;
                     Break;
                  end;
                  FcdsDemonstrativo.Next;
               end;
               // Ponterar cds
               FcdsDemonstrativo.GotoBookmark(bmSavePlace);
               FcdsDemonstrativo.Edit;
               if dValOrcMes <> 0 then FcdsDemonstrativo.FieldByName('PERORCMES').AsFloat := FcdsDemonstrativo.FieldByName('ORCMES').AsFloat/dValOrcMes*100;
               if dValOrcAno <> 0 then FcdsDemonstrativo.FieldByName('PERORCANO').AsFloat := FcdsDemonstrativo.FieldByName('ORCANO').AsFloat/dValOrcAno*100;
               if dValReaMes <> 0 then FcdsDemonstrativo.FieldByName('PERREALMES').AsFloat:= FcdsDemonstrativo.FieldByName('REALMES').AsFloat/dValReaMes*100;
               if dValReaAno <> 0 then FcdsDemonstrativo.FieldByName('PERREALANO').AsFloat:= FcdsDemonstrativo.FieldByName('REALANO').AsFloat/dValReaAno*100;
               if dValAntMes <> 0 then FcdsDemonstrativo.FieldByName('PERMESANT').AsFloat := FcdsDemonstrativo.FieldByName('MESANT').AsFloat/dValAntMes*100;
               if dValAntAno <> 0 then FcdsDemonstrativo.FieldByName('PERANOANT').AsFloat := FcdsDemonstrativo.FieldByName('ANOANT').AsFloat/dValAntAno*100;
               FcdsDemonstrativo.Post;
            end;
            If not FcdsDemonstrativo.FieldByName('IDELEMANAVERT1').isNull then begin
               iElem100   := FcdsDemonstrativo.FieldByName('IDELEMANAVERT1').AsInteger;
               dValReaMes := 0;
               dValOrcMes := 0;
               dValReaAno := 0;
               dValOrcAno := 0;
               dValAntMes := 0;
               dValAntAno := 0;
               // Salvar Ponteiro
               bmSavePlace := FcdsDemonstrativo.GetBookmark;
               FcdsDemonstrativo.First;
               While not EOF do begin
                  if (iElem100 = FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').AsInteger) then begin
                     dValReaMes := FcdsDemonstrativo.FieldByName('REALMES').AsFloat;
                     dValOrcMes := FcdsDemonstrativo.FieldByName('ORCMES').AsFloat;
                     dValReaAno := FcdsDemonstrativo.FieldByName('REALANO').AsFloat;
                     dValOrcAno := FcdsDemonstrativo.FieldByName('ORCANO').AsFloat;
                     dValAntMes := FcdsDemonstrativo.FieldByName('MESANT').AsFloat;
                     dValAntAno := FcdsDemonstrativo.FieldByName('ANOANT').AsFloat;
                     Break;
                  end;
                  FcdsDemonstrativo.Next;
               end;
               // Ponterar cds
               FcdsDemonstrativo.GotoBookmark(bmSavePlace);
               FcdsDemonstrativo.Edit;
               if dValOrcMes <> 0 then FcdsDemonstrativo.FieldByName('PERORCMES1').AsFloat := FcdsDemonstrativo.FieldByName('ORCMES').AsFloat/dValOrcMes;
               if dValOrcAno <> 0 then FcdsDemonstrativo.FieldByName('PERORCANO1').AsFloat := FcdsDemonstrativo.FieldByName('ORCANO').AsFloat/dValOrcAno;
               if dValReaMes <> 0 then FcdsDemonstrativo.FieldByName('PERREALMES1').AsFloat:= FcdsDemonstrativo.FieldByName('REALMES').AsFloat/dValReaMes;
               if dValReaAno <> 0 then FcdsDemonstrativo.FieldByName('PERREALANO1').AsFloat:= FcdsDemonstrativo.FieldByName('REALANO').AsFloat/dValReaAno;
               if dValAntMes <> 0 then FcdsDemonstrativo.FieldByName('PERMESANT1').AsFloat := FcdsDemonstrativo.FieldByName('MESANT').AsFloat/dValAntMes;
               if dValAntAno <> 0 then FcdsDemonstrativo.FieldByName('PERANOANT1').AsFloat := FcdsDemonstrativo.FieldByName('ANOANT').AsFloat/dValAntAno;
               FcdsDemonstrativo.Post;
            end;
            FcdsDemonstrativo.Next;
         end;

         if not bZerados then
         begin
            FcdsDemonstrativo.First;
            while not FcdsDemonstrativo.EOF do
            begin

               if FcdsDemonstrativo.FieldByName('ORCMES').asFloat + FcdsDemonstrativo.FieldByName('REALMES').asFloat +
                  FcdsDemonstrativo.FieldByName('MESANT').asFloat + FcdsDemonstrativo.FieldByName('ORCANO').asFloat +
                  FcdsDemonstrativo.FieldByName('REALANO').asFloat + FcdsDemonstrativo.FieldByName('ANOANT').asFloat = 0 then
               begin
                    if FcdsDemonstrativo.FieldByName('ELETIPOELEM').AsString <> 'T' then
                       FcdsDemonstrativo.Delete
                    else
                      FcdsDemonstrativo.Next;
               end else
               begin
                  FcdsDemonstrativo.Next;
               end;
            end;
         end;

         FcdsDemonstrativo.FreeBookmark(bmSavePlace);

         if bGeraTxt then
            GeraTxt_Demo2(iExercicio,sNomePer1,sNomePer2,sNomeDemo,sNomeMoedaReal,sNomeMoedaOrc) ;


      Except
        Result := false;
      End;

   Finally
     cdsCompConta.Free;
     cdsCompSomatorio.free;
     cdsLancResultado.free;
     cdsPeriodoSaldo.free;
     cdsSaldos.free;
     Free;
   End;

end;

function TCtrlRptDemonstrativo.ProcessaDemoModelo7(iDemo, iPlano,iExercicio,
  iPeriodoIni,iPeriodoFim: Integer; sTipoOperResult, sNatureza, sCCustoIni,
  sAtivProj, sCodMoedaReal,sCodMoedaOrc, sPerDataIni, sNomePer1,sNomePer2,sNomeDemo,
  sNomeMoedaReal,sNomeMoedaOrc,sAtivMarca: string;  dEmpresa: Double; bDesconResult,
  bZerados,bGeraTxt: Boolean): Boolean;
var
  iElem100 :LongInt;
  iLinha,x,iNumCalc :Integer;
  sSalto,sSql,sOper,sDataRef:string;
  cdsCompConta     :TClientDataSet;
  cdsLancResultado :TClientDataSet;
  cdsSaldos        :TClientDataSet;
  cdsCompSomatorio :TClientDataSet;
  cdsPeriodoSaldo  :TClientDataSet;
  bEntrou,bCalc    :Boolean;
  dValAtu :Double;
  dValAnt :Double;
  dValReaMes, dValOrcMes, dValReaAno,dValOrcAno,dValAntMes, dValAntAno :Double;
  dValorResult,dCotacaoAtu,dCotacaoAnt,dValorRea,dValorOrc :Double;
  bmSavePlace : TBookmark;
begin

   Result := True;
   cdsCompConta     := TClientDataSet.Create(nil);
   cdsLancResultado := TClientDataSet.Create(nil);
   cdsSaldos        := TClientDataSet.Create(nil);
   cdsCompSomatorio := TClientDataSet.Create(nil);
   cdsPeriodoSaldo  := TClientDataSet.Create(nil);


   With TCMSqlParams.Create(nil) Do
   Try

      Try

         SQL.Clear;
         SQL.Add('SELECT                                                              ');
         SQL.Add('    (0) AS ORCMES, (0) AS REALMES, (0) AS MESANT,                   ');
         SQL.Add('    (0) AS ORCANO, (0) AS REALANO, (0) AS ANOANT,                   ');
         SQL.Add('    (0) AS ORCMESSN, (0) AS REALMESSN, (0) AS MESANTSN,             ');
         SQL.Add('    (0) AS ORCANOSN, (0) AS REALANOSN, (0) AS ANOANTSN,             ');
         SQL.Add('    (0) AS PERORCMES, (0) AS PERREALMES, (0) AS PERMESANT,          ');
         SQL.Add('    (0) AS PERORCANO, (0) AS PERREALANO, (0) AS PERANOANT,          ');
         SQL.Add('    (0) AS PERORCMES1, (0) AS PERREALMES1, (0) AS PERMESANT1,       ');
         SQL.Add('    (0) AS PERORCANO1, (0) AS PERREALANO1, (0) AS PERANOANT1,       ');
         SQL.Add('    (''N'') AS CALCU, ('' '') AS SALTA, E.IDELEMANAVERTICAL,        ');
         SQL.Add('   E.ELEDESCELEM, E.FLGINDENTACAO, E.FLGTIPOLINHA, E.ELEORDEMLINHA, ');
         SQL.Add('   E.IDELEMDEMONSTRAT,E.ELETIPOELEM,E.FLGSALTAPAGINA,E.FLGMONETARIA,');
         SQL.Add('   E.FLGTRACO,E.FLGNEGRITO,E.FLGNATUREZA,E.FLGTIPONEGATIVO,         ');
         SQL.Add('   E.FLGDECIMAIS, E.IDELEMANAVERT1                                  ');
         SQL.Add('FROM                                                                ');
         SQL.Add('   ELEMDEMONSTRATIVO E                                              ');
         SQL.Add('WHERE                                                               ');
         SQL.Add('    (E.IDDEMONSTRATIVO =:IDDEMONSTRATIVO)                           ');
         SQL.Add('ORDER BY                                                            ');
         SQL.Add('    E.ELEORDEMLINHA                                                 ');

         Prepare;
         ParamByName('IDDEMONSTRATIVO').asInteger := iDemo;
         FcdsDemonstrativo.Data := Data;

         //zera o acumulador de salto de pagina
         iLinha := 0;
         sSalto := 'N';

         FcdsDemonstrativo.First;
         while not FcdsDemonstrativo.EOF do begin

            if sSalto = 'S' then begin
               inc(iLinha);
               sSalto := 'N';
            end;

            if FcdsDemonstrativo.FieldByName('FLGSALTAPAGINA').asString = 'S' then begin
               sSalto := 'S';
            end;

            FcdsDemonstrativo.Edit;
            FcdsDemonstrativo.FieldByName('SALTA').asString := IntToStr(iLinha);

            cdsCompConta.Data := ListaCompConta(FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').asInteger);
            sSql := sSqlCompConta;

            dValReaMes := 0;
            dValOrcMes := 0;
            dValReaAno := 0;
            dValOrcAno := 0;
            dValAntMes := 0;
            dValAntAno := 0;
            //
            if not cdsCompConta.IsEmpty then begin
               cdsCompConta.First;
               While not cdsCompConta.EOF do begin
                  //Ano Atual
                  if sNatureza = 'C' then begin
                     sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR) -               ';
                     sSql := sSql + '           DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE)) AS SALDO,        ';
                     sSql := sSql + '       SUM(DECODE(S.PLSORCADOCREDITO,NULL,0,S.PLSORCADOCREDITO) -               ';
                     sSql := sSql + '           DECODE(S.PLSORCADODEBITO,NULL,0,S.PLSORCADODEBITO)) AS SALDOORC,     ';
                  end else begin
                     sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE) -                 ';
                     sSql := sSql + '           DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR)) AS SALDO,      ';
                     sSql := sSql + '       SUM(DECODE(S.PLSORCADODEBITO,NULL,0,S.PLSORCADODEBITO) -               ';
                     sSql := sSql + '           DECODE(S.PLSORCADOCREDITO,NULL,0,S.PLSORCADOCREDITO)) AS SALDOORC,     ';
                  end;
                  sSql := sSql + 'S.PERNUMERO, P.PERDATFIM                                                      ';
                  sSql := sSql + 'FROM PLANOSALDO S, PERIODO P, CENTCUST CC                                     ';
                  sSql := sSql + 'WHERE (S.PLACONTA = '''+cdsCompConta.FieldByName('PLACONTA').AsString+''')    ';
                  sSql := sSql + '      AND (S.PLANO = '+IntToStr(iPlano)+')                                    ';
                  sSql := sSql + '      AND (S.IDPESSOA = '+FloatToStr(dEmpresa)+')                             ';
                  sSql := sSql + '      AND (S.PEREXERCICIO = '+IntToStr(iExercicio)+')                         ';
                  sSql := sSql + '      AND ((S.PERNUMERO  <= '+IntToStr(iPeriodoFim)+')                        ';
                  sSql := sSql + '      OR  (S.PERNUMERO  IS NULL))                                            ';
                  sSql := sSql + '      AND (S.PERNUMERO = P.PERNUMERO(+)                ) ';
                  sSql := sSql + '      AND (S.PEREXERCICIO = P.PEREXERCICIO(+)          ) ';
                  sSql := sSql + '      AND (S.IDPESSOA = P.IDPESSOA(+)                  ) ';


                  if not cdsCompConta.FieldByName('CODEXTERNO').isNull then begin
                     sSql := sSql + '   AND (CC.CODEXTERNO LIKE '''+cdsCompConta.FieldByName('CODEXTERNO').AsString+'%'') ';
                  end;

                  if sCCustoIni <> '' then begin
                     sSql := sSql + ' AND (RTRIM(CC.CODEXTERNO) LIKE '''+sCCustoIni+'%'')';
                     sSql := sSql + ' AND (S.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                  end;

                  sSql := sSql + ' AND (S.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) ) ';

                  if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                     sSql := sSql + '   AND (S.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                  end;
                  if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                     sSql := sSql + '   AND (S.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                  end;

                  if trim(sAtivMarca) <> '' then begin
                     sSql := sSql + ' AND  (S.UNIDNEGOC IN (' + trim(sAtivMarca) + ')) ';
                  end;
                  if sAtivProj <> '' then begin
                     sSql := sSql + ' AND (S.UNIDNEGOC = '+sAtivProj+')';
                  end;

                  if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                  begin
                    sSql := sSql + ' AND (S.IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                  end;

                  if not cdsCompConta.fieldByName('IDPATRO').isNull then
                  begin
                    sSql := sSql + ' AND (S.IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                  end;

                  sSql := sSql + '   GROUP BY S.PERNUMERO,P.PERDATFIM  ';

                  cdsSaldos.Data := GetDataPacket(sSql);

                  if not cdsSaldos.IsEmpty then begin
                     //FazUPdate do Ano Atual
                     cdsSaldos.First;
                     While not cdsSaldos.EOF do begin
                        dValorResult := 0;
                        if (bDesconResult) and (sTipoOperResult <> '') then begin
                           if sNatureza = 'C' then begin
                              sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';
                           end else begin
                              sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';
                           end;
                           sSql := sSql + 'FROM PLANILHA P, LANCAMENTO L, CENTCUST CC                                           ';
                           sSql := sSql + 'WHERE     (L.PLACONTA LIKE '''+cdsCompConta.FieldByName('PLACONTA').AsString+'%'+''')           ';
                           sSql := sSql + '      AND (L.PLANO = '+IntToStr(iPlano)+')                                ';
                           sSql := sSql + '      AND (P.IDPESSOA = '+FloatToStr(dEmpresa)+')                             ';
                           sSql := sSql + '      AND (L.TIPCODIGO = '''+sTipoOperResult+''')            ';
                           if cdsSaldos.FieldByName('PERNUMERO').IsNull then begin
                              sSql := sSql + '      AND (P.PEREXERCICIO = '+IntToStr(iExercicio)+')     ';
                              sSql := sSql + '      AND (P.PERNUMERO  IS NULL)                          ';
                           end else begin
                              cdsPeriodoSaldo.Data := ListaDadosPeriodo(dEmpresa,iExercicio ,cdsSaldos.FieldByName('PERNUMERO').AsInteger);
                              sSql := sSql + '      AND (P.PLNDATDIA >= TO_DATE('''+cdsPeriodoSaldo.FieldByName('PERDATINI').AsString+''',''DD/MM/YYYY'')) ';
                              sSql := sSql + '      AND (P.PLNDATDIA <= TO_DATE('''+cdsPeriodoSaldo.FieldByName('PERDATFIM').AsString+''',''DD/MM/YYYY'')) ';
                           end;
                           sSql := sSql + '      AND (P.PLNCODIGO = L.PLNCODIGO) ';


                           if not cdsCompConta.FieldByName('CODEXTERNO').isNull then begin
                              sSql := sSql + '   AND (CC.CODEXTERNO LIKE '''+cdsCompConta.FieldByName('CODEXTERNO').AsString+'%'') ';
                              sSql := sSql + '   AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                           end;

                           if sCCustoIni <> '' then begin
                              sSql := sSql + ' AND (RTRIM(CC.CODEXTERNO) LIKE '''+sCCustoIni+'%'')';
                              sSql := sSql + ' AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                           end;

                           sSql := sSql + ' AND (P.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) ) ';

                           if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                              sSql := sSql + '   AND (L.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                              sSql := sSql + '   AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;
                           if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                              sSql := sSql + ' AND (L.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                              sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;

                           if trim(sAtivMarca) <> '' then begin
                              sSql := sSql + ' AND  (L.UNIDNEGOC IN (' + trim(sAtivMarca) + ')) ';
                           end;
                           if sAtivProj <> '' then begin
                              sSql := sSql + ' AND (L.UNIDNEGOC = '+sAtivProj+')';
                              sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;

                           if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                           begin
                             sSql := sSql + ' AND (L.IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                           end;

                           if not cdsCompConta.fieldByName('IDPATRO').isNull then
                           begin
                             sSql := sSql + ' AND (L.IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                           end;

                           cdsLancResultado.Data := GetDataPacket(sSql);
                           if not cdsLancResultado.IsEmpty then
                           begin
                             dValorResult := cdsLancResultado.FieldByName('SALDO').AsFloat;
                           end;
                        end;

                        dValorRea  := cdsSaldos.FieldByName('SALDO').AsFloat - dValorResult;
                        dValorOrc  := cdsSaldos.FieldByName('SALDOORC').AsFloat;
                        if (sCodMoedaReal <> '') and (FcdsDemonstrativo.FieldByName('FLGMONETARIA').AsString = 'S') then begin
                           if cdsSaldos.FieldByName('PERDATFIM').isNull then begin
                              sDataRef := sPerDataIni;
                           end else begin
                              sDataRef := cdsSaldos.FieldByName('PERDATFIM').AsString;
                           end;
                           dCotacaoAtu := Contab.TestaCotacaoMoeda(StrToInt(sCodMoedaReal),
                                          StrToDate(sDataRef),False);
                           if dCotacaoAtu <> 0 then begin
                              dValorRea:= dValorRea/dCotacaoAtu;
                           end else begin
                              dValorRea:= 0;
                           end;
                        end;
                        if (sCodMoedaOrc <> '') and (FcdsDemonstrativo.FieldByName('FLGMONETARIA').AsString = 'S') then begin
                           if cdsSaldos.FieldByName('PERDATFIM').isNull then begin
                              sDataRef := sPerDataIni;
                           end else begin
                              sDataRef := cdsSaldos.FieldByName('PERDATFIM').AsString;
                           end;
                           dCotacaoAtu := Contab.TestaCotacaoMoeda(StrToInt(sCodMoedaOrc),
                                          StrToDate(sDataRef),False);
                           if dCotacaoAtu <> 0 then begin
                              dValorOrc:= dValorOrc/dCotacaoAtu;
                           end else begin
                              dValorOrc:= 0;
                           end;
                        end;
                        if (cdsSaldos.FieldByName('PERNUMERO').AsInteger >= iPeriodoIni) and
                           (cdsSaldos.FieldByName('PERNUMERO').AsInteger <= iPeriodoFim) then begin
                           dValReaMes := dValReaMes + dValorRea;
                           dValOrcMes := dValOrcMes + dValorOrc;
                        end;
                        dValReaAno := dValReaAno + dValorRea;
                        dValOrcAno := dValOrcAno + dValorOrc;
                        cdsSaldos.Next;
                     end;
                  end;
                  //
                  //Ano Anterior
                  if sNatureza = 'C' then begin
                     sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR) -               ';
                     sSql := sSql + '           DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE)) AS SALDO,        ';
                  end else begin
                     sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE) -                 ';
                     sSql := sSql + '           DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR)) AS SALDO,      ';
                  end;
                  sSql := sSql + 'S.PERNUMERO, P.PERDATFIM                                                           ';
                  sSql := sSql + 'FROM PLANOSALDO S, PERIODO P, CENTCUST CC                                          ';
                  sSql := sSql + 'WHERE (S.PLACONTA = '''+cdsCompConta.FieldByName('PLACONTA').AsString+''')           ';
                  sSql := sSql + '      AND (S.PLANO = '+IntToStr(iPlano)+')                             ';
                  sSql := sSql + '      AND (S.IDPESSOA = '+FloatToStr(dEmpresa)+')                      ';
                  sSql := sSql + '      AND (S.PEREXERCICIO = '+IntToStr(iExercicio -1)+')               ';
                  sSql := sSql + '      AND ((S.PERNUMERO  <= '+IntToStr(iPeriodoFim)+')                             ';
                  sSql := sSql + '      OR   (S.PERNUMERO  IS NULL))                                                   ';
                  sSql := sSql + '      AND (S.PERNUMERO = P.PERNUMERO(+)                ) ';
                  sSql := sSql + '      AND (S.PEREXERCICIO = P.PEREXERCICIO(+)          ) ';
                  sSql := sSql + '      AND (S.IDPESSOA = P.IDPESSOA(+)                  ) ';

                  if not cdsCompConta.FieldByName('CODEXTERNO').isNull then begin
                     sSql := sSql + '   AND (CC.CODEXTERNO LIKE '''+cdsCompConta.FieldByName('CODCENTROCUSTO').AsString+'%'') ';
                  end;

                  if sCCustoIni <> '' then begin
                     sSql := sSql + ' AND (RTRIM(CC.CODEXTERNO) LIKE '''+sCCustoIni+'%'')';
                     sSql := sSql + ' AND (S.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                  end;

                  sSql := sSql + ' AND (S.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) ) ';

                  if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                     sSql := sSql + '   AND (S.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                  end;
                  if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                     sSql := sSql + '   AND (S.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                  end;

                  if trim(sAtivMarca) <> '' then begin
                     sSql := sSql + ' AND  (S.UNIDNEGOC IN (' + trim(sAtivMarca) + ')) ';
                  end;
                  if sAtivProj <> '' then begin
                     sSql := sSql + ' AND (S.UNIDNEGOC = '+sAtivProj+')';
                  end;


                  if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                  begin
                    sSql := sSql + ' AND (S.IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                  end;

                  if not cdsCompConta.fieldByName('IDPATRO').isNull then
                  begin
                    sSql := sSql + ' AND (S.IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                  end;


                  sSql := sSql + '   GROUP BY S.PERNUMERO,P.PERDATFIM ';

                  cdsSaldos.Data := GetDataPacket(sSql);

                  if not cdsSaldos.IsEmpty then begin
                     //FazUPdate do Ano Atual
                     cdsSaldos.First;
                     While not cdsSaldos.EOF do begin
                        dValorResult := 0;
                        if (bDesconResult) and (sTipoOperResult <> '') then begin
                           if sNatureza = 'C' then begin
                              sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';
                           end else begin
                              sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';
                           end;
                           sSql := sSql + 'FROM PLANILHA P, LANCAMENTO L, CENTCUST CC                                                      ';
                           sSql := sSql + 'WHERE     (L.PLACONTA LIKE '''+cdsCompConta.FieldByName('PLACONTA').AsString+'%'+''')           ';
                           sSql := sSql + '      AND (L.PLANO = '+IntToStr(iPlano)+')                                ';
                           sSql := sSql + '      AND (P.IDPESSOA = '+FloatToStr(dEmpresa)+')                             ';
                           sSql := sSql + '      AND (L.TIPCODIGO = '''+sTipoOperResult+''')            ';
                           if cdsSaldos.FieldByName('PERNUMERO').IsNull then begin
                              sSql := sSql + '      AND (P.PEREXERCICIO = '+IntToStr(iExercicio -1)+') ';
                              sSql := sSql + '      AND (P.PERNUMERO  IS NULL)                                                 ';
                           end else begin
                              cdsPeriodoSaldo.Data := ListaDadosPeriodo(dEmpresa,(iExercicio -1),cdsSaldos.FieldByName('PERNUMERO').AsInteger);
                              sSql := sSql + '      AND (P.PLNDATDIA >= TO_DATE('''+cdsPeriodoSaldo.FieldByName('PERDATINI').AsString+''',''DD/MM/YYYY'')) ';
                              sSql := sSql + '      AND (P.PLNDATDIA <= TO_DATE('''+cdsPeriodoSaldo.FieldByName('PERDATFIM').AsString+''',''DD/MM/YYYY'')) ';
                           end;

                           sSql := sSql + '      AND (P.PLNCODIGO = L.PLNCODIGO) ';

                           if not cdsCompConta.FieldByName('CODEXTERNO').isNull then begin
                              sSql := sSql + '   AND (CC.CODEXTERNO LIKE '''+cdsCompConta.FieldByName('CODEXTERNO').AsString+'%'') ';
                              sSql := sSql + '   AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                           end;

                           if sCCustoIni <> '' then begin
                              sSql := sSql + ' AND (RTRIM(CC.CODEXTERNO) LIKE '''+sCCustoIni+'%'')';
                              sSql := sSql + ' AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                           end;

                           sSql := sSql + ' AND (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) ) ';

                           if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                              sSql := sSql + '   AND (L.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                              sSql := sSql + '   AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;
                           if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                              sSql := sSql + ' AND (L.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                              sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;

                           if trim(sAtivMarca) <> '' then begin
                              sSql := sSql + ' AND  (L.UNIDNEGOC IN (' + trim(sAtivMarca) + ')) ';
                           end;
                           if sAtivProj <> '' then begin
                              sSql := sSql + ' AND (L.UNIDNEGOC = '+sAtivProj+')';
                              sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;


                           if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                           begin
                             sSql := sSql + ' AND (L.IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                           end;

                           if not cdsCompConta.fieldByName('IDPATRO').isNull then
                           begin
                             sSql := sSql + ' AND (L.IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                           end;


                           cdsLancResultado.Data := GetDataPacket(sSql);
                           if not cdsLancResultado.IsEmpty then
                           begin
                             dValorResult := cdsLancResultado.FieldByName('SALDO').AsFloat;
                           end;
                        end;
                        dValorRea  := cdsSaldos.FieldByName('SALDO').AsFloat - dValorResult;
                        if (sCodMoedaReal <> '') and (FcdsDemonstrativo.FieldByName('FLGMONETARIA').AsString = 'S') then begin
                           if cdsSaldos.FieldByName('PERDATFIM').isNull then begin
                              sDataRef := sPerDataIni;
                           end else begin
                              sDataRef := cdsSaldos.FieldByName('PERDATFIM').AsString;
                           end;
                           dCotacaoAtu := Contab.TestaCotacaoMoeda(StrToInt(sCodMoedaOrc),
                                          StrToDate(sDataRef),False);
                           if dCotacaoAtu <> 0 then begin
                              dValorRea:= dValorRea/dCotacaoAtu;
                           end else begin
                              dValorRea:= 0;
                           end;
                        end;
                        if (cdsSaldos.FieldByName('PERNUMERO').AsInteger >= iPeriodoIni) and
                           (cdsSaldos.FieldByName('PERNUMERO').AsInteger <= iPeriodoFim) then begin
                           dValAntMes := dValAntMes + dValorRea;
                        end;
                        dValAntAno := dValAntAno + dValorRea;
                        cdsSaldos.Next;
                     end;
                  end;
                  cdsCompConta.Next;
               end;
               FcdsDemonstrativo.Edit;
               FcdsDemonstrativo.FieldByName('ORCMES').AsFloat    := dValOrcMes;
               FcdsDemonstrativo.FieldByName('ORCANO').AsFloat    := dValOrcAno;
               FcdsDemonstrativo.FieldByName('REALMES').AsFloat   := dValReaMes;
               FcdsDemonstrativo.FieldByName('REALANO').AsFloat   := dValReaAno;
               FcdsDemonstrativo.FieldByName('MESANT').AsFloat    := dValAntMes;
               FcdsDemonstrativo.FieldByName('ANOANT').AsFloat    := dValAntAno;

               if (FcdsDemonstrativo.FieldByName('FLGTIPONEGATIVO').AsString <> 'N') then begin
                  FcdsDemonstrativo.FieldByName('ORCMESSN').AsFloat    := dValOrcMes;
                  FcdsDemonstrativo.FieldByName('ORCANOSN').AsFloat    := dValOrcAno;
                  FcdsDemonstrativo.FieldByName('REALMESSN').AsFloat   := dValReaMes;
                  FcdsDemonstrativo.FieldByName('REALANOSN').AsFloat   := dValReaAno;
                  FcdsDemonstrativo.FieldByName('MESANTSN').AsFloat    := dValAntMes;
                  FcdsDemonstrativo.FieldByName('ANOANTSN').AsFloat    := dValAntAno;
               end else begin
                  if Modulo.TestaNatureza(sNatureza, FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValOrcMes) then begin
                     FcdsDemonstrativo.FieldByName('ORCMESSN').AsFloat := Abs(dValOrcMes)* (-1);
                  end else begin
                     FcdsDemonstrativo.FieldByName('ORCMESSN').AsFloat := Abs(dValOrcMes);
                  end;

                  if Modulo.TestaNatureza(sNatureza,FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValOrcAno) then begin
                     FcdsDemonstrativo.FieldByName('ORCANOSN').AsFloat := Abs(dValOrcAno)* (-1);
                  end else begin
                     FcdsDemonstrativo.FieldByName('ORCANOSN').AsFloat := Abs(dValOrcAno);
                  end;

                  if Modulo.TestaNatureza(sNatureza,FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValReaMes) then begin
                     FcdsDemonstrativo.FieldByName('REALMESSN').AsFloat := Abs(dValReaMes)* (-1);
                  end else begin
                     FcdsDemonstrativo.FieldByName('REALMESSN').AsFloat := Abs(dValReaMes);
                  end;

                  if Modulo.TestaNatureza(sNatureza, FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValReaAno) then begin
                     FcdsDemonstrativo.FieldByName('REALANOSN').AsFloat := Abs(dValReaAno)* (-1);
                  end else begin
                     FcdsDemonstrativo.FieldByName('REALANOSN').AsFloat := Abs(dValReaAno);
                  end;

                  if Modulo.TestaNatureza(sNatureza,FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValAntMes) then begin
                     FcdsDemonstrativo.FieldByName('MESANTSN').AsFloat := Abs(dValAntMes)* (-1);
                  end else begin
                     FcdsDemonstrativo.FieldByName('MESANTSN').AsFloat := Abs(dValAntMes);
                  end;

                  if Modulo.TestaNatureza(sNatureza, FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValAntAno) then begin
                     FcdsDemonstrativo.FieldByName('ANOANTSN').AsFloat := Abs(dValAntAno)* (-1);
                  end else begin
                     FcdsDemonstrativo.FieldByName('ANOANTSN').AsFloat := Abs(dValAntAno);
                  end;
               end;
               FcdsDemonstrativo.FieldByName('CALCU').AsString    := 'S';
               FcdsDemonstrativo.Post;
            end;
            FcdsDemonstrativo.Next;
         end;
         x:=1;
         iNumCalc:=0;
         While x = 1 do begin
            bEntrou:=False;
            FcdsDemonstrativo.First;
            bmSavePlace := FcdsDemonstrativo.GetBookmark;
            While not FcdsDemonstrativo.EOF do begin
               sSql := FcdsDemonstrativo.FieldByName('CALCU').AsString+'/'+FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').AsString;
               if FcdsDemonstrativo.FieldByName('CALCU').AsString <> 'S' then begin
                  bEntrou:=True;

                  cdsCompSomatorio.Data := ListaCompSomatorio(FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').asInteger);

                  bCalc  :=True;
                  dValReaMes := 0;
                  dValOrcMes := 0;
                  dValReaAno := 0;
                  dValOrcAno := 0;
                  dValAntMes := 0;
                  dValAntAno := 0;
                  // Salvar Ponteiro
                  bmSavePlace := FcdsDemonstrativo.GetBookmark;
                  cdsCompSomatorio.First;
                  While not cdsCompSomatorio.EOF do begin
                     FcdsDemonstrativo.First;
                     While not FcdsDemonstrativo.EOF do begin
                        if cdsCompSomatorio.FieldByName('ELEMENTODEM').AsInteger = FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').AsInteger then begin
                           //Verificaçao do tipo de operação para cálculo da fórmula
                           sOper := cdsCompSomatorio.FieldByName('FLGOPERACAO').asString;
                           if FcdsDemonstrativo.FieldByName('CALCU').AsString = 'S' then begin
                              case sOPer[1] of
                                 'S' : begin
                                          dValReaMes := dValReaMes + FcdsDemonstrativo.FieldByName('REALMES').AsFloat;
                                          dValOrcMes := dValOrcMes + FcdsDemonstrativo.FieldByName('ORCMES').AsFloat;
                                          dValReaAno := dValReaAno + FcdsDemonstrativo.FieldByName('REALANO').AsFloat;
                                          dValOrcAno := dValOrcAno + FcdsDemonstrativo.FieldByName('ORCANO').AsFloat;
                                          dValAntMes := dValAntMes + FcdsDemonstrativo.FieldByName('MESANT').AsFloat;
                                          dValAntAno := dValAntAno + FcdsDemonstrativo.FieldByName('ANOANT').AsFloat;
                                       end;
                                 'U' : begin
                                          dValReaMes := dValReaMes - FcdsDemonstrativo.FieldByName('REALMES').AsFloat;
                                          dValOrcMes := dValOrcMes - FcdsDemonstrativo.FieldByName('ORCMES').AsFloat;
                                          dValReaAno := dValReaAno - FcdsDemonstrativo.FieldByName('REALANO').AsFloat;
                                          dValOrcAno := dValOrcAno - FcdsDemonstrativo.FieldByName('ORCANO').AsFloat;
                                          dValAntMes := dValAntMes - FcdsDemonstrativo.FieldByName('MESANT').AsFloat;
                                          dValAntAno := dValAntAno - FcdsDemonstrativo.FieldByName('ANOANT').AsFloat;
                                       end;
                                 'M' : begin
                                          dValReaMes := dValReaMes * FcdsDemonstrativo.FieldByName('REALMES').AsFloat;
                                          dValOrcMes := dValOrcMes * FcdsDemonstrativo.FieldByName('ORCMES').AsFloat;
                                          dValReaAno := dValReaAno * FcdsDemonstrativo.FieldByName('REALANO').AsFloat;
                                          dValOrcAno := dValOrcAno * FcdsDemonstrativo.FieldByName('ORCANO').AsFloat;
                                          dValAntMes := dValAntMes * FcdsDemonstrativo.FieldByName('MESANT').AsFloat;
                                          dValAntAno := dValAntAno * FcdsDemonstrativo.FieldByName('ANOANT').AsFloat;
                                       end;
                                 'D' : begin
                                          if FcdsDemonstrativo.FieldByName('REALMES').asFloat <> 0 then begin
                                             dValReaMes := dValReaMes / FcdsDemonstrativo.FieldByName('REALMES').AsFloat;
                                          end else begin
                                             dValReaMes := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('ORCMES').asFloat <> 0 then begin
                                             dValOrcMes := dValOrcMes / FcdsDemonstrativo.FieldByName('ORCMES').AsFloat;
                                          end else begin
                                             dValOrcMes := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('REALANO').asFloat <> 0 then begin
                                             dValReaAno := dValReaAno / FcdsDemonstrativo.FieldByName('REALANO').AsFloat;
                                          end else begin
                                             dValReaAno := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('ORCANO').asFloat <> 0 then begin
                                             dValOrcAno := dValOrcAno / FcdsDemonstrativo.FieldByName('ORCANO').AsFloat;
                                          end else begin
                                             dValOrcAno := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('ANOANT').asFloat <> 0 then begin
                                             dValAntAno := dValAntAno / FcdsDemonstrativo.FieldByName('ANOANT').AsFloat;
                                          end else begin
                                             dValAntAno := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('MESANT').asFloat <> 0 then begin
                                             dValAntMes := dValAntMes / FcdsDemonstrativo.FieldByName('MESANT').AsFloat;
                                          end else begin
                                             dValAntMEs := 0;
                                          end;
                                       end;
                                 'P' : begin
                                          if FcdsDemonstrativo.FieldByName('REALMES').asFloat <> 0 then begin
                                             dValReaMes := (dValReaMes / FcdsDemonstrativo.FieldByName('REALMES').AsFloat) * 100;
                                          end else begin
                                             dValReaMes := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('ORCMES').asFloat <> 0 then begin
                                             dValOrcMes := (dValOrcMes / FcdsDemonstrativo.FieldByName('ORCMES').AsFloat) * 100;
                                          end else begin
                                             dValOrcMes := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('REALANO').asFloat <> 0 then begin
                                             dValReaAno := (dValReaAno / FcdsDemonstrativo.FieldByName('REALANO').AsFloat) * 100;
                                          end else begin
                                             dValReaAno := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('ORCANO').asFloat <> 0 then begin
                                             dValOrcAno := (dValOrcAno / FcdsDemonstrativo.FieldByName('ORCANO').AsFloat) * 100;
                                          end else begin
                                             dValOrcAno := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('ANOANT').asFloat <> 0 then begin
                                             dValAntAno := (dValAntAno / FcdsDemonstrativo.FieldByName('ANOANT').AsFloat) * 100;
                                          end else begin
                                             dValAntAno := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('MESANT').asFloat <> 0 then begin
                                             dValAntMes := (dValAntMes / FcdsDemonstrativo.FieldByName('MESANT').AsFloat) * 100;
                                          end else begin
                                             dValAntMEs := 0;
                                          end;
                                       end;
                              end;
                           end else begin
                              bCalc:=False;
                              Break;
                           end;
                        end;
                        FcdsDemonstrativo.Next;
                     end;
                     cdsCompSomatorio.Next;
                  end;
                  FcdsDemonstrativo.GotoBookmark(bmSavePlace);
                  if bCalc then begin
                     Inc(iNumCalc);
                     FcdsDemonstrativo.Edit;
                     FcdsDemonstrativo.FieldByName('ORCMES').AsFloat    := dValOrcMes;
                     FcdsDemonstrativo.FieldByName('ORCANO').AsFloat    := dValOrcAno;
                     FcdsDemonstrativo.FieldByName('REALMES').AsFloat   := dValReaMes;
                     FcdsDemonstrativo.FieldByName('REALANO').AsFloat   := dValReaAno;
                     FcdsDemonstrativo.FieldByName('MESANT').AsFloat    := dValAntMes;
                     FcdsDemonstrativo.FieldByName('ANOANT').AsFloat    := dValAntAno;

                     if (FcdsDemonstrativo.FieldByName('FLGTIPONEGATIVO').AsString <> 'N') then begin
                        FcdsDemonstrativo.FieldByName('ORCMESSN').AsFloat    := dValOrcMes;
                        FcdsDemonstrativo.FieldByName('ORCANOSN').AsFloat    := dValOrcAno;
                        FcdsDemonstrativo.FieldByName('REALMESSN').AsFloat   := dValReaMes;
                        FcdsDemonstrativo.FieldByName('REALANOSN').AsFloat   := dValReaAno;
                        FcdsDemonstrativo.FieldByName('MESANTSN').AsFloat    := dValAntMes;
                        FcdsDemonstrativo.FieldByName('ANOANTSN').AsFloat    := dValAntAno;
                     end else begin
                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValOrcMes) then begin
                           FcdsDemonstrativo.FieldByName('ORCMESSN').AsFloat := Abs(dValOrcMes)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('ORCMESSN').AsFloat := Abs(dValOrcMes);
                        end;
                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValOrcAno) then begin
                           FcdsDemonstrativo.FieldByName('ORCANOSN').AsFloat := Abs(dValOrcAno)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('ORCANOSN').AsFloat := Abs(dValOrcAno);
                        end;

                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValReaMes) then begin
                           FcdsDemonstrativo.FieldByName('REALMESSN').AsFloat := Abs(dValReaMes)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('REALMESSN').AsFloat := Abs(dValReaMes);
                        end;
                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValReaAno) then begin
                           FcdsDemonstrativo.FieldByName('REALANOSN').AsFloat := Abs(dValReaAno)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('REALANOSN').AsFloat := Abs(dValReaAno);
                        end;

                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValAntMes) then begin
                           FcdsDemonstrativo.FieldByName('MESANTSN').AsFloat := Abs(dValAntMes)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('MESANTSN').AsFloat := Abs(dValAntMes);
                        end;
                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValAntAno) then begin
                           FcdsDemonstrativo.FieldByName('ANOANTSN').AsFloat := Abs(dValAntAno)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('ANOANTSN').AsFloat := Abs(dValAntAno);
                        end;
                     end;

                     FcdsDemonstrativo.FieldByName('CALCU').AsString := 'S';
                     FcdsDemonstrativo.Post;
                  end;
               end;
               FcdsDemonstrativo.Next;
            end;
            FcdsDemonstrativo.FreeBookmark(bmSavePlace);
            if not bEntrou then Break;
            if iNumCalc = 0 then begin
               Break;
               Abort;
            end;
         end;
         //Calcula Percentuais
         FcdsDemonstrativo.First;
         bmSavePlace := FcdsDemonstrativo.GetBookmark;
         While not FcdsDemonstrativo.EOF do begin
            If not FcdsDemonstrativo.FieldByName('IDELEMANAVERTICAL').isNull then begin
               iElem100   := FcdsDemonstrativo.FieldByName('IDELEMANAVERTICAL').AsInteger;
               dValReaMes := 0;
               dValOrcMes := 0;
               dValReaAno := 0;
               dValOrcAno := 0;
               dValAntMes := 0;
               dValAntAno := 0;
               // Salvar Ponteiro
               bmSavePlace := FcdsDemonstrativo.GetBookmark;
               FcdsDemonstrativo.First;
               While not FcdsDemonstrativo.EOF do begin
                  if (iElem100 = FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').AsInteger) then begin
                     dValReaMes := FcdsDemonstrativo.FieldByName('REALMES').AsFloat;
                     dValOrcMes := FcdsDemonstrativo.FieldByName('ORCMES').AsFloat;
                     dValReaAno := FcdsDemonstrativo.FieldByName('REALANO').AsFloat;
                     dValOrcAno := FcdsDemonstrativo.FieldByName('ORCANO').AsFloat;
                     dValAntMes := FcdsDemonstrativo.FieldByName('MESANT').AsFloat;
                     dValAntAno := FcdsDemonstrativo.FieldByName('ANOANT').AsFloat;
                     Break;
                  end;
                  FcdsDemonstrativo.Next;
               end;
               // Ponterar cds
               FcdsDemonstrativo.GotoBookmark(bmSavePlace);
               FcdsDemonstrativo.Edit;
               if dValOrcMes <> 0 then FcdsDemonstrativo.FieldByName('PERORCMES').AsFloat := FcdsDemonstrativo.FieldByName('ORCMES').AsFloat/dValOrcMes*100;
               if dValOrcAno <> 0 then FcdsDemonstrativo.FieldByName('PERORCANO').AsFloat := FcdsDemonstrativo.FieldByName('ORCANO').AsFloat/dValOrcAno*100;
               if dValReaMes <> 0 then FcdsDemonstrativo.FieldByName('PERREALMES').AsFloat:= FcdsDemonstrativo.FieldByName('REALMES').AsFloat/dValReaMes*100;
               if dValReaAno <> 0 then FcdsDemonstrativo.FieldByName('PERREALANO').AsFloat:= FcdsDemonstrativo.FieldByName('REALANO').AsFloat/dValReaAno*100;
               if dValAntMes <> 0 then FcdsDemonstrativo.FieldByName('PERMESANT').AsFloat := FcdsDemonstrativo.FieldByName('MESANT').AsFloat/dValAntMes*100;
               if dValAntAno <> 0 then FcdsDemonstrativo.FieldByName('PERANOANT').AsFloat := FcdsDemonstrativo.FieldByName('ANOANT').AsFloat/dValAntAno*100;
               FcdsDemonstrativo.Post;
            end;
            If not FcdsDemonstrativo.FieldByName('IDELEMANAVERT1').isNull then begin
               iElem100   := FcdsDemonstrativo.FieldByName('IDELEMANAVERT1').AsInteger;
               dValReaMes := 0;
               dValOrcMes := 0;
               dValReaAno := 0;
               dValOrcAno := 0;
               dValAntMes := 0;
               dValAntAno := 0;
               // Salvar Ponteiro
               bmSavePlace := FcdsDemonstrativo.GetBookmark;
               FcdsDemonstrativo.First;
               While not EOF do begin
                  if (iElem100 = FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').AsInteger) then begin
                     dValReaMes := FcdsDemonstrativo.FieldByName('REALMES').AsFloat;
                     dValOrcMes := FcdsDemonstrativo.FieldByName('ORCMES').AsFloat;
                     dValReaAno := FcdsDemonstrativo.FieldByName('REALANO').AsFloat;
                     dValOrcAno := FcdsDemonstrativo.FieldByName('ORCANO').AsFloat;
                     dValAntMes := FcdsDemonstrativo.FieldByName('MESANT').AsFloat;
                     dValAntAno := FcdsDemonstrativo.FieldByName('ANOANT').AsFloat;
                     Break;
                  end;
                  FcdsDemonstrativo.Next;
               end;
               // Ponterar cds
               FcdsDemonstrativo.GotoBookmark(bmSavePlace);
               FcdsDemonstrativo.Edit;
               if dValOrcMes <> 0 then FcdsDemonstrativo.FieldByName('PERORCMES1').AsFloat := FcdsDemonstrativo.FieldByName('ORCMES').AsFloat/dValOrcMes;
               if dValOrcAno <> 0 then FcdsDemonstrativo.FieldByName('PERORCANO1').AsFloat := FcdsDemonstrativo.FieldByName('ORCANO').AsFloat/dValOrcAno;
               if dValReaMes <> 0 then FcdsDemonstrativo.FieldByName('PERREALMES1').AsFloat:= FcdsDemonstrativo.FieldByName('REALMES').AsFloat/dValReaMes;
               if dValReaAno <> 0 then FcdsDemonstrativo.FieldByName('PERREALANO1').AsFloat:= FcdsDemonstrativo.FieldByName('REALANO').AsFloat/dValReaAno;
               if dValAntMes <> 0 then FcdsDemonstrativo.FieldByName('PERMESANT1').AsFloat := FcdsDemonstrativo.FieldByName('MESANT').AsFloat/dValAntMes;
               if dValAntAno <> 0 then FcdsDemonstrativo.FieldByName('PERANOANT1').AsFloat := FcdsDemonstrativo.FieldByName('ANOANT').AsFloat/dValAntAno;
               FcdsDemonstrativo.Post;
            end;
            FcdsDemonstrativo.Next;
         end;

         if not bZerados then
         begin
            FcdsDemonstrativo.First;
            while not FcdsDemonstrativo.EOF do
            begin

               if FcdsDemonstrativo.FieldByName('ORCMES').asFloat + FcdsDemonstrativo.FieldByName('REALMES').asFloat +
                  FcdsDemonstrativo.FieldByName('MESANT').asFloat + FcdsDemonstrativo.FieldByName('ORCANO').asFloat +
                  FcdsDemonstrativo.FieldByName('REALANO').asFloat + FcdsDemonstrativo.FieldByName('ANOANT').asFloat = 0 then
               begin
                    if FcdsDemonstrativo.FieldByName('ELETIPOELEM').AsString <> 'T' then
                       FcdsDemonstrativo.Delete
                    else
                      FcdsDemonstrativo.Next;
               end else
               begin
                  FcdsDemonstrativo.Next;
               end;
            end;
         end;

         FcdsDemonstrativo.FreeBookmark(bmSavePlace);

         if bGeraTxt then
            GeraTxt_Demo2(iExercicio,sNomePer1,sNomePer2,sNomeDemo,sNomeMoedaReal,sNomeMoedaOrc) ;


      Except
        Result := false;
      End;

   Finally
     cdsCompConta.Free;
     cdsCompSomatorio.free;
     cdsLancResultado.free;
     cdsPeriodoSaldo.free;
     cdsSaldos.free;
     Free;
   End;

end;


function TCtrlRptDemonstrativo.ProcessaDemoModelo3(iDemo, iPlano,
  iExercicio, iPeriodoIni, iPeriodoFim: Integer; sTipoOperResult,
  sNatureza, sCCustoIni, sAtivProj, sCodMoedaReal, sCodMoedaOrc,
  sPerDataIni,sAtivSel: string; dEmpresa: Double;
  bDesconResult, bZerados: Boolean): Boolean;

var scCusto, sOper, sDataRef,sSql, sSalto : string;
    dCotacaoAtu : Double;
    dValorResult, dValorRea, dValorOrc, dValReaMes, dValAntMes, dValOrcMes : Double;
    dValReaAno, dValAntAno, dValOrcAno : Double;
    bCalc, bEntrou : Boolean;
    iNumCalc, x, iLinha : Integer;
    iElem100 : LongInt;
    bmSavePlace : TBookmark;
    cdsCompConta     :TClientDataSet;
    cdsLancResultado :TClientDataSet;
    cdsSaldos        :TClientDataSet;
    cdsCompSomatorio :TClientDataSet;
    cdsPeriodoSaldo  :TClientDataSet;
begin
   Result := True;
   cdsCompConta     := TClientDataSet.Create(nil);
   cdsLancResultado := TClientDataSet.Create(nil);
   cdsSaldos        := TClientDataSet.Create(nil);
   cdsCompSomatorio := TClientDataSet.Create(nil);
   cdsPeriodoSaldo  := TClientDataSet.Create(nil);

   With TCMSqlParams.Create(nil) Do
   Try

      Try
         // Monta a qry para formar o demonstrativo cadastrado
         SQL.Clear;
         SQL.Add('SELECT                                                              ');
         SQL.Add('    (0) AS ORCMES, (0) AS REALMES, (0) AS MESANT,                   ');
         SQL.Add('    (0) AS ORCANO, (0) AS REALANO, (0) AS ANOANT,                   ');
         SQL.Add('    (0) AS ORCMESSN, (0) AS REALMESSN, (0) AS MESANTSN,             ');
         SQL.Add('    (0) AS ORCANOSN, (0) AS REALANOSN, (0) AS ANOANTSN,             ');
         SQL.Add('    (0) AS PERORCMES, (0) AS PERREALMES, (0) AS PERMESANT,          ');
         SQL.Add('    (0) AS PERORCANO, (0) AS PERREALANO, (0) AS PERANOANT,          ');
         SQL.Add('    (''N'') AS CALCU,E.IDELEMANAVERTICAL, ('' '') AS SALTA,         ');
         SQL.Add('   E.ELEDESCELEM, E.FLGINDENTACAO, E.FLGTIPOLINHA, E.ELEORDEMLINHA, ');
         SQL.Add('   E.IDELEMDEMONSTRAT,E.ELETIPOELEM,E.FLGSALTAPAGINA,E.FLGMONETARIA,');
         SQL.Add('   E.FLGTRACO,E.FLGNEGRITO,E.FLGNATUREZA,E.FLGTIPONEGATIVO,         ');
         SQL.Add('   E.FLGDECIMAIS                                                    ');
         SQL.Add('FROM                                                                ');
         SQL.Add('   ELEMDEMONSTRATIVO E                                              ');
         SQL.Add('WHERE                                                               ');
         SQL.Add('    (E.IDDEMONSTRATIVO =:IDDEMONSTRATIVO)                           ');
         SQL.Add('ORDER BY                                                            ');
         SQL.Add('    E.ELEORDEMLINHA                                                 ');

         Prepare;

         ParamByName('IDDEMONSTRATIVO').asInteger := iDemo;

         FcdsDemonstrativo.Data := Data;

         FcdsDemonstrativo.First;

         //zera o acumulador de salto de pagina
         iLinha := 0;
         sSalto := 'N';

         // Percorre todo o demonstrativo, inserindo o saldo contábil
         //-------------------------------------------------------------------------------         
         FcdsDemonstrativo.First;
         while not FcdsDemonstrativo.EOF do
         begin
            if sSalto = 'S' then
            begin
               inc(iLinha);
               sSalto := 'N';
            end;

            if FcdsDemonstrativo.FieldByName('FLGSALTAPAGINA').asString = 'S' then
            begin
               sSalto := 'S';
            end;

            FcdsDemonstrativo.Edit;
            FcdsDemonstrativo.FieldByName('SALTA').asString := IntTOStr(iLinha);

            // Pega a composição do elemento em foco, carregando toda a sua parametrização e
            //retorna o SQL para a variável, pois será usado posteriormente
            cdsCompConta.Data := ListaCompConta(FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').asInteger);
            sSql              := sSqlCompConta;

            dValReaMes := 0;
            dValOrcMes := 0;
            dValReaAno := 0;
            dValOrcAno := 0;
            dValAntMes := 0;
            dValAntAno := 0;

            // Varre o cds da composição do elemento em foco (se exitir),
            //buscando o seu saldo
            if not cdsCompConta.IsEmpty then
            begin
               cdsCompConta.First;
               While not cdsCompConta.EOF do
               begin
                  //Monta o saldo do Ano Atual, de acordo com a parametrização
                  //da composição do elemento em foco (FcdsDemonstrativo);
                  if sNatureza = 'C' then
                  begin
                     sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR) -               ';
                     sSql := sSql + '           DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE)) AS SALDO,        ';
                     sSql := sSql + '       SUM(DECODE(S.PLSORCADOCREDITO,NULL,0,S.PLSORCADOCREDITO) -               ';
                     sSql := sSql + '           DECODE(S.PLSORCADODEBITO,NULL,0,S.PLSORCADODEBITO)) AS SALDOORC,     ';
                  end
                  else
                  begin
                     sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE) -                 ';
                     sSql := sSql + '           DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR)) AS SALDO,      ';
                     sSql := sSql + '       SUM(DECODE(S.PLSORCADODEBITO,NULL,0,S.PLSORCADODEBITO) -               ';
                     sSql := sSql + '           DECODE(S.PLSORCADOCREDITO,NULL,0,S.PLSORCADOCREDITO)) AS SALDOORC,     ';
                  end;

                  sSql := sSql + 'S.PERNUMERO, P.PERDATFIM                                                           ';
                  sSql := sSql + 'FROM PLANOSALDO S, PERIODO P, CENTCUST CC                                             ';
                  sSql := sSql + 'WHERE (S.PLACONTA = '''+cdsCompConta.FieldByName('PLACONTA').AsString+''')           ';
                  sSql := sSql + '      AND (S.PLANO = '+IntToStr(iPlano)+')                             ';
                  sSql := sSql + '      AND (S.IDPESSOA = '+FloatToStr(dEmpresa)+')                             ';
                  sSql := sSql + '      AND (S.PEREXERCICIO = '+IntToStr(iExercicio)+')                           ';
                  sSql := sSql + '      AND ((S.PERNUMERO  <= '+IntToStr(iPeriodoFim)+')                             ';
                  sSql := sSql + '      OR   (S.PERNUMERO  IS NULL))                                                   ';
                  sSql := sSql + '      AND (S.PERNUMERO = P.PERNUMERO(+)                ) ';
                  sSql := sSql + '      AND (S.PEREXERCICIO = P.PEREXERCICIO(+)          ) ';
                  sSql := sSql + '      AND (S.IDPESSOA = P.IDPESSOA(+)                  ) ';

                  if not cdsCompConta.FieldByName('CODEXTERNO').isNull then begin
                        sSql := sSql + '   AND (CC.CODEXTERNO LIKE '''+cdsCompConta.FieldByName('CODEXTERNO').AsString+'%'') ';
                        sSql := sSql + '   AND (S.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                     end;

                  if sCCustoIni <> '' then begin
                     sSql := sSql + ' AND (RTRIM(CC.CODEXTERNO) LIKE '''+sCCustoIni+'%'')';
                     sSql := sSql + ' AND (S.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                  end;

                  sSql := sSql + ' AND (S.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) ) ';


                  if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                     sSql := sSql + '   AND (S.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                  end;
                  if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                     sSql := sSql + '   AND (S.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                  end;

                  if trim(sAtivSel) <> '' then begin
                     sSql := sSql + ' AND  (S.UNIDNEGOC IN (' + trim(sAtivSel) + ')) ';
                  end;
                  if sAtivProj <> '' then begin
                     sSql := sSql + ' AND (S.UNIDNEGOC = '+sAtivProj+')';
                  end;


                  if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                  begin
                    sSql := sSql + ' AND (S.IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                  end;

                  if not cdsCompConta.fieldByName('IDPATRO').isNull then
                  begin
                    sSql := sSql + ' AND (S.IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                  end;

                  sSql := sSql + '   GROUP BY S.PERNUMERO,P.PERDATFIM  ';

                  cdsSaldos.Data := GetDataPacket(sSql);


                  if not cdsSaldos.IsEmpty then
                  begin
                     //===================================================================
                     //FazUPdate do Ano Atual, atribuindo o seu
                     //resultado as variáveis dValReaAno, dValorRea e dValOrcAno
                     //===================================================================
                     cdsSaldos.First;
                     While not cdsSaldos.EOF do
                     begin
                        dValorResult := 0;
                        if (bDesconResult) and (sTipoOperResult <> '') then
                        begin
                           if sNatureza = 'C' then
                              sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  '
                           else
                              sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';

                           sSql := sSql + 'FROM PLANILHA P, LANCAMENTO L, CENTCUST CC           ';
                           sSql := sSql + 'WHERE     (L.PLACONTA LIKE '''+cdsCompConta.FieldByName('PLACONTA').AsString+'%'+''')           ';
                           sSql := sSql + '      AND (L.PLANO = '+IntToStr(iPlano)+')                                ';
                           sSql := sSql + '      AND (P.IDPESSOA = '+FloatToStr(dEmpresa)+')                             ';
                           sSql := sSql + '      AND (L.TIPCODIGO = '''+sTipoOperResult+''')            ';

                           if not cdsCompConta.FieldByName('CODEXTERNO').isNull then begin
                              sSql := sSql + '   AND (CC.CODEXTERNO LIKE '''+cdsCompConta.FieldByName('CODEXTERNO').AsString+'%'') ';
                              sSql := sSql + '   AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                           end;

                           if sCCustoIni <> '' then begin
                              sSql := sSql + ' AND (RTRIM(CC.CODEXTERNO) LIKE '''+sCCustoIni+'%'')';
                              sSql := sSql + ' AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                           end;

                           sSql := sSql + ' AND (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) ) ';

                           if cdsSaldos.FieldByName('PERNUMERO').IsNull then
                           begin
                              sSql := sSql + '      AND (P.PEREXERCICIO = '+IntToStr(iExercicio)+')                       ';
                              sSql := sSql + '      AND (P.PERNUMERO  IS NULL)                                                 ';
                           end
                           else
                           begin
                              cdsPeriodoSaldo.Data := ListaDadosPeriodo(dEmpresa,iExercicio,cdsSaldos.FieldByName('PERNUMERO').AsInteger);
                              sSql := sSql + '      AND (P.PLNDATDIA >= TO_DATE('''+cdsPeriodoSaldo.FieldByName('PERDATINI').AsString+''',''DD/MM/YYYY'')) ';
                              sSql := sSql + '      AND (P.PLNDATDIA <= TO_DATE('''+cdsPeriodoSaldo.FieldByName('PERDATFIM').AsString+''',''DD/MM/YYYY'')) ';
                           end;

                           sSql := sSql + '      AND (P.PLNCODIGO = L.PLNCODIGO) ';

                           if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                              sSql := sSql + '   AND (L.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                              sSql := sSql + '   AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;
                           if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                              sSql := sSql + ' AND (L.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                              sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;

                           if trim(sAtivSel) <> '' then begin
                              sSql := sSql + ' AND  (L.UNIDNEGOC IN (' + trim(sAtivSel) + ')) ';
                           end;
                           if sAtivProj <> '' then begin
                              sSql := sSql + ' AND (L.UNIDNEGOC = '+sAtivProj+')';
                              sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;


                           if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                           begin
                             sSql := sSql + ' AND (L.IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                           end;

                           if not cdsCompConta.fieldByName('IDPATRO').isNull then
                           begin
                             sSql := sSql + ' AND (L.IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                           end;


                           cdsLancResultado.Data := GetDataPacket(sSql);
                           if not cdsLancResultado.IsEmpty then
                           begin
                             dValorResult := cdsLancResultado.FieldByName('SALDO').AsFloat;
                           end;
                        end;

                        dValorRea := cdsSaldos.FieldByName('SALDO').AsFloat - dValorResult;
                        dValorOrc := cdsSaldos.FieldByName('SALDOORC').AsFloat;

                        if (sCodMoedaReal <> '') and (FcdsDemonstrativo.FieldByName('FLGMONETARIA').AsString = 'S') then
                        begin
                           if cdsSaldos.FieldByName('PERDATFIM').isNull then
                              sDataRef := sPerDataIni
                           else
                              sDataRef:=cdsSaldos.FieldByName('PERDATFIM').AsString;

                           dCotacaoAtu := Contab.TestaCotacaoMoeda(StrToInt(sCodMoedaReal),
                                                                   StrToDate(sDataRef),false);
                           if dCotacaoAtu <> 0 then
                              dValorRea:= dValorRea/dCotacaoAtu
                           else
                              dValorRea:= 0;
                        end;

                        if (sCodMoedaOrc <> '') and (FcdsDemonstrativo.FieldByName('FLGMONETARIA').AsString = 'S') then begin
                           if cdsSaldos.FieldByName('PERDATFIM').isNull then begin
                              sDataRef := sPerDataIni;
                           end else begin
                              sDataRef :=cdsSaldos.FieldByName('PERDATFIM').AsString;
                           end;
                           dCotacaoAtu := Contab.TestaCotacaoMoeda(StrToInt(sCodMoedaOrc),
                                                                    StrToDate(sDataRef),false);
                           if dCotacaoAtu <> 0 then begin
                              dValorOrc:= dValorOrc/dCotacaoAtu;
                           end else begin
                              dValorOrc:= 0;
                           end;
                        end;
                        if (cdsSaldos.FieldByName('PERNUMERO').AsInteger >= iPeriodoIni) and
                           (cdsSaldos.FieldByName('PERNUMERO').AsInteger <= iPeriodoFim) then begin
                           dValReaMes := dValReaMes + dValorRea;
                           dValOrcMes := dValOrcMes + dValorOrc;
                        end;
                        dValReaAno := dValReaAno + dValorRea;
                        dValOrcAno := dValOrcAno + dValorOrc;
                        cdsSaldos.Next;
                     end;
                  end;
                  //===============   Fim processo ano atual =============================



                  
                  //======================================================================
                  //FazUPdate do Ano Anterior, atribuindo o seu
                  //resultado as variáveis dValAntAno, dValorRea e dValAntMes
                  //======================================================================
                  if sNatureza = 'C' then begin
                     sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR) -               ';
                     sSql := sSql + '           DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE)) AS SALDO,        ';
                  end else begin
                     sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE) -                 ';
                     sSql := sSql + '           DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR)) AS SALDO,      ';
                  end;
                  sSql := sSql + 'S.PERNUMERO, P.PERDATFIM                                                           ';
                  sSql := sSql + 'FROM PLANOSALDO S, PERIODO P, CENTCUST CC       ';
                  sSql := sSql + 'WHERE (S.PLACONTA = '''+cdsCompConta.FieldByName('PLACONTA').AsString+''')           ';
                  sSql := sSql + '      AND (S.PLANO = '+IntToStr(iPlano)+')                             ';
                  sSql := sSql + '      AND (S.IDPESSOA = '+FloatToStr(dEmpresa)+')                             ';
                  sSql := sSql + '      AND (S.PEREXERCICIO = '+IntToStr(iExercicio -1)+')     ';
                  sSql := sSql + '      AND ((S.PERNUMERO  <= '+IntToStr(iPeriodoFim)+')                             ';
                  sSql := sSql + '      OR   (S.PERNUMERO  IS NULL))                                                   ';
                  sSql := sSql + '      AND (S.PERNUMERO = P.PERNUMERO(+)                ) ';
                  sSql := sSql + '      AND (S.PEREXERCICIO = P.PEREXERCICIO(+)          ) ';
                  sSql := sSql + '      AND (S.IDPESSOA = P.IDPESSOA(+)                  ) ';


                  if not cdsCompConta.FieldByName('CODEXTERNO').isNull then begin
                     sSql := sSql + '   AND (CC.CODEXTERNO LIKE '''+cdsCompConta.FieldByName('CODEXTERNO').AsString+'%'') ';
                  end;

                  if sCCustoIni <> '' then begin
                     sSql := sSql + ' AND (RTRIM(CC.CODEXTERNO) LIKE '''+sCCustoIni+'%'')';
                     sSql := sSql + ' AND (S.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                  end;

                  sSql := sSql + ' AND (S.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) ) ';


                  if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                     sSql := sSql + '   AND (S.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                  end;
                  if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                     sSql := sSql + '   AND (S.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                  end;

                  if trim(sAtivSel) <> '' then begin
                     sSql := sSql + ' AND  (S.UNIDNEGOC IN (' + trim(sAtivSel) + ')) ';
                  end;
                  if sAtivProj <> '' then begin
                     sSql := sSql + ' AND (S.UNIDNEGOC = '+sAtivProj+')';
                  end;


                  if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                  begin
                    sSql := sSql + ' AND (S.IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                  end;

                  if not cdsCompConta.fieldByName('IDPATRO').isNull then
                  begin
                    sSql := sSql + ' AND (S.IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                  end;

                  sSql := sSql + '   GROUP BY S.PERNUMERO,P.PERDATFIM ';

                  cdsSaldos.Data := GetDataPacket(sSql);

                  if not cdsSaldos.IsEmpty then
                  begin
                     cdsSaldos.First;
                     While not cdsSaldos.EOF do begin
                        dValorResult := 0;
                        if (bDesconResult) and (sTipoOperResult <> '') then begin
                           if sNatureza = 'C' then begin
                              sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';
                           end else begin
                              sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';
                           end;
                           sSql := sSql + 'FROM PLANILHA P, LANCAMENTO L, CENTCUST CC    ';
                           sSql := sSql + 'WHERE     (L.PLACONTA LIKE '''+cdsCompConta.FieldByName('PLACONTA').AsString+'%'+''')           ';
                           sSql := sSql + '      AND (L.PLANO = '+IntToStr(iPlano)+')                                ';
                           sSql := sSql + '      AND (P.IDPESSOA = '+FloatToStr(dEmpresa)+')                             ';
                           sSql := sSql + '      AND (L.TIPCODIGO = '''+sTipoOperResult+''')            ';


                           if not cdsCompConta.FieldByName('CODEXTERNO').isNull then begin
                              sSql := sSql + '   AND (CC.CODEXTERNO LIKE '''+cdsCompConta.FieldByName('CODEXTERNO').AsString+'%'') ';
                              sSql := sSql + '   AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                           end;

                           if sCCustoIni <> '' then begin
                              sSql := sSql + ' AND (RTRIM(CC.CODEXTERNO) LIKE '''+sCCustoIni+'%'')';
                              sSql := sSql + ' AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                           end;

                           sSql := sSql + ' AND (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) ) ';


                           if cdsSaldos.FieldByName('PERNUMERO').IsNull then begin
                              sSql := sSql + '      AND (P.PEREXERCICIO = '+IntToStr(iExercicio -1)+') ';
                              sSql := sSql + '      AND (P.PERNUMERO  IS NULL)                                                 ';
                           end else begin
                              cdsPeriodoSaldo.Data := ListaDadosPeriodo(dEmpresa,(iExercicio -1),cdsSaldos.FieldByName('PERNUMERO').AsInteger);
                              sSql := sSql + '      AND (P.PLNDATDIA >= TO_DATE('''+cdsPeriodoSaldo.FieldByName('PERDATINI').AsString+''',''DD/MM/YYYY'')) ';
                              sSql := sSql + '      AND (P.PLNDATDIA <= TO_DATE('''+cdsPeriodoSaldo.FieldByName('PERDATFIM').AsString+''',''DD/MM/YYYY'')) ';
                           end;
                           sSql := sSql + '      AND (P.PLNCODIGO = L.PLNCODIGO) ';

                           if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                              sSql := sSql + '   AND (L.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                              sSql := sSql + '   AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;
                           if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                              sSql := sSql + ' AND (L.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                              sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;
                           if trim(sAtivSel) <> '' then begin
                              sSql := sSql + ' AND  (L.UNIDNEGOC IN (' + trim(sAtivSel) + ')) ';
                           end;
                           if sAtivProj <> '' then begin
                              sSql := sSql + ' AND (L.UNIDNEGOC = '+sAtivProj+')';
                              sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;

                           if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                           begin
                             sSql := sSql + ' AND (L.IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                           end;

                           if not cdsCompConta.fieldByName('IDPATRO').isNull then
                           begin
                             sSql := sSql + ' AND (L.IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                           end;

                           cdsLancResultado.Data := GetDataPacket(sSql);
                           if not cdsLancResultado.IsEmpty then
                           begin
                             dValorResult := cdsLancResultado.FieldByName('SALDO').AsFloat;
                           end;
                        end;
                        dValorRea  := cdsSaldos.FieldByName('SALDO').AsFloat-dValorResult;
                        if (sCodMoedaReal <> '') and (FcdsDemonstrativo.FieldByName('FLGMONETARIA').AsString = 'S') then begin
                           if cdsSaldos.FieldByName('PERDATFIM').isNull then begin
                              sDataRef := sPerDataIni;
                           end else begin
                              sDataRef := cdsSaldos.FieldByName('PERDATFIM').AsString;
                           end;
                           dCotacaoAtu := Contab.TestaCotacaoMoeda(StrToInt(sCodMoedaReal),StrToDate(sDataRef),False);
                           if dCotacaoAtu <> 0 then begin
                              dValorRea:= dValorRea/dCotacaoAtu;
                           end else begin
                              dValorRea:= 0;
                           end;
                        end;
                        if (cdsSaldos.FieldByName('PERNUMERO').AsInteger >= iPeriodoIni) and
                           (cdsSaldos.FieldByName('PERNUMERO').AsInteger <= iPeriodoFim) then begin
                           dValAntMes := dValAntMes + dValorRea;
                        end;
                        dValAntAno := dValAntAno + dValorRea;
                        cdsSaldos.Next;
                     end;
                  end;
                  //===============   Fim processo ano anterior ==========================

                  cdsCompConta.Next;
               end;


               // Após ter buscado os respectivos saldos, insere os mesmos no Cds
               FcdsDemonstrativo.Edit;
               FcdsDemonstrativo.FieldByName('ORCMES').AsFloat    := dValOrcMes;
               FcdsDemonstrativo.FieldByName('ORCANO').AsFloat    := dValOrcAno;
               FcdsDemonstrativo.FieldByName('REALMES').AsFloat   := dValReaMes;
               FcdsDemonstrativo.FieldByName('REALANO').AsFloat   := dValReaAno;
               FcdsDemonstrativo.FieldByName('MESANT').AsFloat    := dValAntMes;
               FcdsDemonstrativo.FieldByName('ANOANT').AsFloat    := dValAntAno;

               if (FcdsDemonstrativo.FieldByName('FLGTIPONEGATIVO').AsString <> 'N') then
               begin
                  FcdsDemonstrativo.FieldByName('ORCMESSN').AsFloat    := dValOrcMes;
                  FcdsDemonstrativo.FieldByName('ORCANOSN').AsFloat    := dValOrcAno;
                  FcdsDemonstrativo.FieldByName('REALMESSN').AsFloat   := dValReaMes;
                  FcdsDemonstrativo.FieldByName('REALANOSN').AsFloat   := dValReaAno;
                  FcdsDemonstrativo.FieldByName('MESANTSN').AsFloat    := dValAntMes;
                  FcdsDemonstrativo.FieldByName('ANOANTSN').AsFloat    := dValAntAno;
               end
               else
               begin
                  if Modulo.TestaNatureza(sNatureza,FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValOrcMes) then
                     FcdsDemonstrativo.FieldByName('ORCMESSN').AsFloat := Abs(dValOrcMes)* (-1)
                  else
                     FcdsDemonstrativo.FieldByName('ORCMESSN').AsFloat := Abs(dValOrcMes);

                  if Modulo.TestaNatureza(sNatureza,FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValOrcAno) then begin
                     FcdsDemonstrativo.FieldByName('ORCANOSN').AsFloat := Abs(dValOrcAno)* (-1);
                  end else begin
                     FcdsDemonstrativo.FieldByName('ORCANOSN').AsFloat := Abs(dValOrcAno);
                  end;
                  if Modulo.TestaNatureza(sNatureza,FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValReaMes) then begin
                     FcdsDemonstrativo.FieldByName('REALMESSN').AsFloat := Abs(dValReaMes)* (-1);
                  end else begin
                     FcdsDemonstrativo.FieldByName('REALMESSN').AsFloat := Abs(dValReaMes);
                  end;
                  if Modulo.TestaNatureza(sNatureza,FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValReaAno) then begin
                     FcdsDemonstrativo.FieldByName('REALANOSN').AsFloat := Abs(dValReaAno)* (-1);
                  end else begin
                     FcdsDemonstrativo.FieldByName('REALANOSN').AsFloat := Abs(dValReaAno);
                  end;
                  if Modulo.TestaNatureza(sNatureza,FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValAntMes) then begin
                     FcdsDemonstrativo.FieldByName('MESANTSN').AsFloat := Abs(dValAntMes)* (-1);
                  end else begin
                     FcdsDemonstrativo.FieldByName('MESANTSN').AsFloat := Abs(dValAntMes);
                  end;
                  if Modulo.TestaNatureza(sNatureza,FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValAntAno) then begin
                     FcdsDemonstrativo.FieldByName('ANOANTSN').AsFloat := Abs(dValAntAno)* (-1);
                  end else begin
                     FcdsDemonstrativo.FieldByName('ANOANTSN').AsFloat := Abs(dValAntAno);
                  end;
               end;

               FcdsDemonstrativo.FieldByName('CALCU').AsString    := 'S';
               FcdsDemonstrativo.Post;
            end;
            FcdsDemonstrativo.Next;
         end;
         // Fim do loop do FcdsDemonstrativo, após o mesmo já está
         //editado com os valores do saldo
         //-------------------------------------------------------------------------------


         // Este loop tem por objetivo resultar valores que não é possível obter no método
         //acimam, como por exemplo, uma composição de um elemento ser através de um
         //resultado de outra linha, percentual, etc...
         x := 1;
         iNumCalc := 0;
         While x = 1 do
         begin
            // Salva o ponto inicial e percorre o cds principal
            bEntrou := False;
            FcdsDemonstrativo.First;
            bmSavePlace := FcdsDemonstrativo.GetBookmark;
            While not FcdsDemonstrativo.EOF do
            begin
               if FcdsDemonstrativo.FieldByName('CALCU').AsString <> 'S' then
               begin
                  bEntrou := True;
                  // Obtem as composições do elemento em foco, somente aquelas
                  //cujo a parametrização do elemento esteja apontada para somatório (S)
                  cdsCompSomatorio.Data := ListaCompSomatorio(FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').asInteger);
                  //
                  bCalc      := True;
                  dValReaMes := 0;
                  dValOrcMes := 0;
                  dValReaAno := 0;
                  dValOrcAno := 0;
                  dValAntMes := 0;
                  dValAntAno := 0;
                  // Salvar Ponteiro
                  bmSavePlace := FcdsDemonstrativo.GetBookmark;
                  cdsCompSomatorio.First;
                  While not cdsCompSomatorio.EOF do
                  begin
                     FcdsDemonstrativo.First;
                     While not FcdsDemonstrativo.EOF do begin
                        if cdsCompSomatorio.FieldByName('ELEMENTODEM').AsInteger =
                           FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').AsInteger then begin
                           //Verificaçao do tipo de operação para cálculo da fórmula
                           sOper := cdsCompSomatorio.FieldByName('FLGOPERACAO').asString;

                           if FcdsDemonstrativo.FieldByName('CALCU').AsString = 'S' then
                           begin
                              case sOPer[1] of
                                 'S' : begin
                                          dValReaMes := dValReaMes + FcdsDemonstrativo.FieldByName('REALMES').AsFloat;
                                          dValOrcMes := dValOrcMes + FcdsDemonstrativo.FieldByName('ORCMES').AsFloat;
                                          dValReaAno := dValReaAno + FcdsDemonstrativo.FieldByName('REALANO').AsFloat;
                                          dValOrcAno := dValOrcAno + FcdsDemonstrativo.FieldByName('ORCANO').AsFloat;
                                          dValAntMes := dValAntMes + FcdsDemonstrativo.FieldByName('MESANT').AsFloat;
                                          dValAntAno := dValAntAno + FcdsDemonstrativo.FieldByName('ANOANT').AsFloat;
                                       end;
                                 'U' : begin
                                          dValReaMes := dValReaMes - FcdsDemonstrativo.FieldByName('REALMES').AsFloat;
                                          dValOrcMes := dValOrcMes - FcdsDemonstrativo.FieldByName('ORCMES').AsFloat;
                                          dValReaAno := dValReaAno - FcdsDemonstrativo.FieldByName('REALANO').AsFloat;
                                          dValOrcAno := dValOrcAno - FcdsDemonstrativo.FieldByName('ORCANO').AsFloat;
                                          dValAntMes := dValAntMes - FcdsDemonstrativo.FieldByName('MESANT').AsFloat;
                                          dValAntAno := dValAntAno - FcdsDemonstrativo.FieldByName('ANOANT').AsFloat;
                                       end;
                                 'M' : begin
                                          dValReaMes := dValReaMes * FcdsDemonstrativo.FieldByName('REALMES').AsFloat;
                                          dValOrcMes := dValOrcMes * FcdsDemonstrativo.FieldByName('ORCMES').AsFloat;
                                          dValReaAno := dValReaAno * FcdsDemonstrativo.FieldByName('REALANO').AsFloat;
                                          dValOrcAno := dValOrcAno * FcdsDemonstrativo.FieldByName('ORCANO').AsFloat;
                                          dValAntMes := dValAntMes * FcdsDemonstrativo.FieldByName('MESANT').AsFloat;
                                          dValAntAno := dValAntAno * FcdsDemonstrativo.FieldByName('ANOANT').AsFloat;
                                       end;
                                 'D' : begin
                                          if FcdsDemonstrativo.FieldByName('REALMES').asFloat <> 0 then begin
                                             dValReaMes := dValReaMes / FcdsDemonstrativo.FieldByName('REALMES').AsFloat;
                                          end else begin
                                             dValReaMes := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('ORCMES').asFloat <> 0 then begin
                                             dValOrcMes := dValOrcMes / FcdsDemonstrativo.FieldByName('ORCMES').AsFloat;
                                          end else begin
                                             dValOrcMes := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('REALANO').asFloat <> 0 then begin
                                             dValReaAno := dValReaAno / FcdsDemonstrativo.FieldByName('REALANO').AsFloat;
                                          end else begin
                                             dValReaAno := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('ORCANO').asFloat <> 0 then begin
                                             dValOrcAno := dValOrcAno / FcdsDemonstrativo.FieldByName('ORCANO').AsFloat;
                                          end else begin
                                             dValOrcAno := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('ANOANT').asFloat <> 0 then begin
                                             dValAntAno := dValAntAno / FcdsDemonstrativo.FieldByName('ANOANT').AsFloat;
                                          end else begin
                                             dValAntAno := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('MESANT').asFloat <> 0 then begin
                                             dValAntMes := dValAntMes / FcdsDemonstrativo.FieldByName('MESANT').AsFloat;
                                          end else begin
                                             dValAntMEs := 0;
                                          end;
                                       end;
                                 'P' : begin
                                          if FcdsDemonstrativo.FieldByName('REALMES').asFloat <> 0 then begin
                                             dValReaMes := (dValReaMes / FcdsDemonstrativo.FieldByName('REALMES').AsFloat) * 100;
                                          end else begin
                                             dValReaMes := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('ORCMES').asFloat <> 0 then begin
                                             dValOrcMes := (dValOrcMes / FcdsDemonstrativo.FieldByName('ORCMES').AsFloat) * 100;
                                          end else begin
                                             dValOrcMes := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('REALANO').asFloat <> 0 then begin
                                             dValReaAno := (dValReaAno / FcdsDemonstrativo.FieldByName('REALANO').AsFloat) * 100;
                                          end else begin
                                             dValReaAno := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('ORCANO').asFloat <> 0 then begin
                                             dValOrcAno := (dValOrcAno / FcdsDemonstrativo.FieldByName('ORCANO').AsFloat) * 100;
                                          end else begin
                                             dValOrcAno := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('ANOANT').asFloat <> 0 then begin
                                             dValAntAno := (dValAntAno / FcdsDemonstrativo.FieldByName('ANOANT').AsFloat) * 100;
                                          end else begin
                                             dValAntAno := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('MESANT').asFloat <> 0 then begin
                                             dValAntMes := (dValAntMes / FcdsDemonstrativo.FieldByName('MESANT').AsFloat) * 100;
                                          end else begin
                                             dValAntMEs := 0;
                                          end;
                                       end;
                              end;
                              // Faz atender a condição do somatório, caso a mesma exista
                              if Trim(CdsCompSomatorio.FieldByName('ELECONDICAO').AsString) <> '' then
                              begin
                                 dValReaMes := FazFormula(dValReaMes,0,CdsCompSomatorio.FieldByName('FLGOPERACAO').AsString,
                                                                       CdsCompSomatorio.FieldByName('ELECONDICAO').AsString,
                                                                       CdsCompSomatorio.FieldByName('ELEVALORCOND').AsFloat,
                                                                       true);
                                 dValOrcMes := FazFormula(dValOrcMes,0,CdsCompSomatorio.FieldByName('FLGOPERACAO').AsString,
                                                                       CdsCompSomatorio.FieldByName('ELECONDICAO').AsString,
                                                                       CdsCompSomatorio.FieldByName('ELEVALORCOND').AsFloat,
                                                                       true);
                                 dValReaAno := FazFormula(dValReaAno,0,CdsCompSomatorio.FieldByName('FLGOPERACAO').AsString,
                                                                       CdsCompSomatorio.FieldByName('ELECONDICAO').AsString,
                                                                       CdsCompSomatorio.FieldByName('ELEVALORCOND').AsFloat,
                                                                       true);
                                 dValOrcAno := FazFormula(dValOrcAno,0,CdsCompSomatorio.FieldByName('FLGOPERACAO').AsString,
                                                                       CdsCompSomatorio.FieldByName('ELECONDICAO').AsString,
                                                                       CdsCompSomatorio.FieldByName('ELEVALORCOND').AsFloat,
                                                                       true);
                                 dValAntMes := FazFormula(dValAntMes,0,CdsCompSomatorio.FieldByName('FLGOPERACAO').AsString,
                                                                       CdsCompSomatorio.FieldByName('ELECONDICAO').AsString,
                                                                       CdsCompSomatorio.FieldByName('ELEVALORCOND').AsFloat,
                                                                       true);
                                 dValAntAno := FazFormula(dValAntAno,0,CdsCompSomatorio.FieldByName('FLGOPERACAO').AsString,
                                                                       CdsCompSomatorio.FieldByName('ELECONDICAO').AsString,
                                                                       CdsCompSomatorio.FieldByName('ELEVALORCOND').AsFloat,
                                                                       true);
                              end;

                           end else begin
                              bCalc:=False;
                              Break;
                           end;
                        end;
                        FcdsDemonstrativo.Next;
                     end;
                     cdsCompSomatorio.Next;
                  end;
                  // Ponterar CDS
                  FcdsDemonstrativo.GotoBookmark(bmSavePlace);
                  if bCalc then begin
                     Inc(iNumCalc);
                     FcdsDemonstrativo.Edit;
                     FcdsDemonstrativo.FieldByName('ORCMES').AsFloat    := dValOrcMes;
                     FcdsDemonstrativo.FieldByName('ORCANO').AsFloat    := dValOrcAno;
                     FcdsDemonstrativo.FieldByName('REALMES').AsFloat   := dValReaMes;
                     FcdsDemonstrativo.FieldByName('REALANO').AsFloat   := dValReaAno;
                     FcdsDemonstrativo.FieldByName('MESANT').AsFloat    := dValAntMes;
                     FcdsDemonstrativo.FieldByName('ANOANT').AsFloat    := dValAntAno;

                     if (FcdsDemonstrativo.FieldByName('FLGTIPONEGATIVO').AsString <> 'N') then begin
                        FcdsDemonstrativo.FieldByName('ORCMESSN').AsFloat    := dValOrcMes;
                        FcdsDemonstrativo.FieldByName('ORCANOSN').AsFloat    := dValOrcAno;
                        FcdsDemonstrativo.FieldByName('REALMESSN').AsFloat   := dValReaMes;
                        FcdsDemonstrativo.FieldByName('REALANOSN').AsFloat   := dValReaAno;
                        FcdsDemonstrativo.FieldByName('MESANTSN').AsFloat    := dValAntMes;
                        FcdsDemonstrativo.FieldByName('ANOANTSN').AsFloat    := dValAntAno;
                     end else begin
                        if Modulo.TestaNatureza(sNatureza, FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValOrcMes) then begin
                           FcdsDemonstrativo.FieldByName('ORCMESSN').AsFloat := Abs(dValOrcMes)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('ORCMESSN').AsFloat := Abs(dValOrcMes);
                        end;
                        if Modulo.TestaNatureza(sNatureza, FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValOrcAno) then begin
                           FcdsDemonstrativo.FieldByName('ORCANOSN').AsFloat := Abs(dValOrcAno)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('ORCANOSN').AsFloat := Abs(dValOrcAno);
                        end;

                        if Modulo.TestaNatureza(sNatureza, FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValReaMes) then begin
                           FcdsDemonstrativo.FieldByName('REALMESSN').AsFloat := Abs(dValReaMes)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('REALMESSN').AsFloat := Abs(dValReaMes);
                        end;
                        if Modulo.TestaNatureza(sNatureza,FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValReaAno) then begin
                           FcdsDemonstrativo.FieldByName('REALANOSN').AsFloat := Abs(dValReaAno)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('REALANOSN').AsFloat := Abs(dValReaAno);
                        end;

                        if Modulo.TestaNatureza(sNatureza,FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValAntMes) then begin
                           FcdsDemonstrativo.FieldByName('MESANTSN').AsFloat := Abs(dValAntMes)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('MESANTSN').AsFloat := Abs(dValAntMes);
                        end;
                        if Modulo.TestaNatureza(sNatureza, FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValAntAno) then begin
                           FcdsDemonstrativo.FieldByName('ANOANTSN').AsFloat := Abs(dValAntAno)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('ANOANTSN').AsFloat := Abs(dValAntAno);
                        end;
                     end;

                     FcdsDemonstrativo.FieldByName('CALCU').AsString    := 'S';
                     FcdsDemonstrativo.Post;
                  end;
               end;
               FcdsDemonstrativo.Next;
            end;
            FcdsDemonstrativo.FreeBookmark(bmSavePlace);
            if not bEntrou then Break;
            if iNumCalc = 0 then begin
               Break;
               Abort;
            end;
         end;
         //Calcula Percentuais
         FcdsDemonstrativo.First;
         bmSavePlace := FcdsDemonstrativo.GetBookmark;
         While not FcdsDemonstrativo.EOF do begin
            If not FcdsDemonstrativo.FieldByName('IDELEMANAVERTICAL').isNull then begin
               iElem100   := FcdsDemonstrativo.FieldByName('IDELEMANAVERTICAL').AsInteger;
               dValReaMes := 0;
               dValOrcMes := 0;
               dValReaAno := 0;
               dValOrcAno := 0;
               dValAntMes := 0;
               dValAntAno := 0;
               // Salvar Ponteiro
               bmSavePlace := FcdsDemonstrativo.GetBookmark;
               FcdsDemonstrativo.First;
               While not FcdsDemonstrativo.EOF do begin
                  if (iElem100 = FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').AsInteger) then begin
                     dValReaMes := FcdsDemonstrativo.FieldByName('REALMES').AsFloat;
                     dValOrcMes := FcdsDemonstrativo.FieldByName('ORCMES').AsFloat;
                     dValReaAno := FcdsDemonstrativo.FieldByName('REALANO').AsFloat;
                     dValOrcAno := FcdsDemonstrativo.FieldByName('ORCANO').AsFloat;
                     dValAntMes := FcdsDemonstrativo.FieldByName('MESANT').AsFloat;
                     dValAntAno := FcdsDemonstrativo.FieldByName('ANOANT').AsFloat;
                     Break;
                  end;
                  FcdsDemonstrativo.Next;
               end;
               // Ponterar Query
               FcdsDemonstrativo.GotoBookmark(bmSavePlace);
               FcdsDemonstrativo.Edit;
               if dValOrcMes <> 0 then FcdsDemonstrativo.FieldByName('PERORCMES').AsFloat := FcdsDemonstrativo.FieldByName('ORCMES').AsFloat/dValOrcMes*100;
               if dValOrcAno <> 0 then FcdsDemonstrativo.FieldByName('PERORCANO').AsFloat := FcdsDemonstrativo.FieldByName('ORCANO').AsFloat/dValOrcAno*100;
               if dValReaMes <> 0 then FcdsDemonstrativo.FieldByName('PERREALMES').AsFloat:= FcdsDemonstrativo.FieldByName('REALMES').AsFloat/dValReaMes*100;
               if dValReaAno <> 0 then FcdsDemonstrativo.FieldByName('PERREALANO').AsFloat:= FcdsDemonstrativo.FieldByName('REALANO').AsFloat/dValReaAno*100;
               if dValAntMes <> 0 then FcdsDemonstrativo.FieldByName('PERMESANT').AsFloat := FcdsDemonstrativo.FieldByName('MESANT').AsFloat/dValAntMes*100;
               if dValAntAno <> 0 then FcdsDemonstrativo.FieldByName('PERANOANT').AsFloat := FcdsDemonstrativo.FieldByName('ANOANT').AsFloat/dValAntAno*100;
               FcdsDemonstrativo.Post;
            end;
            FcdsDemonstrativo.Next;
         end;
         FcdsDemonstrativo.FreeBookmark(bmSavePlace);

         if not bZerados then
         begin
            FcdsDemonstrativo.First;
            while not FcdsDemonstrativo.EOF do
            begin
               if FcdsDemonstrativo.FieldByName('ORCMES').asFloat  + FcdsDemonstrativo.FieldByName('REALMES').asFloat +
                  FcdsDemonstrativo.FieldByName('MESANT').asFloat  + FcdsDemonstrativo.FieldByName('ORCANO').asFloat +
                  FcdsDemonstrativo.FieldByName('REALANO').asFloat + FcdsDemonstrativo.FieldByName('ANOANT').asFloat = 0 then
               begin
                  if FcdsDemonstrativo.FieldByName('ELETIPOELEM').AsString <> 'T' then
                     FcdsDemonstrativo.Delete
                  else
                    FcdsDemonstrativo.Next;
               end else
               begin
                  FcdsDemonstrativo.Next;
               end;
           end;
         end;

      Except
        Result := false;
      End;

   Finally
     cdsCompConta.Free;
     cdsCompSomatorio.free;
     cdsLancResultado.free;
     cdsPeriodoSaldo.free;
     cdsSaldos.free;
     Free;
   End;

end;

function TCtrlRptDemonstrativo.ProcessaDemoModelo4(iDemo, iPlano,iExercicio,iPeriodoIni,iPeriodoFim, iValores: Integer; sNatureza, sCCustoIni,
           sAtivProj, sCodMoeda,sDataIni,sDataFim, sPerDataFim,sPlano,sPatro,sFormato,sAtivSel: string;
           dEmpresa: Double; bZerados,bNegativo,bAcumulado: Boolean): Boolean;


var sPassaS, sPassaD, scCusto, sOper, sSql,
   sColuna, sColunaSN, sColunaDef, sCalcu, sCalcu1, sColuna1 : string;

  dCotacaoAtu, dValAtu, dPrimeiro, dUltimo : Double;
  bCalc, bEntrou : Boolean;
  iNumCalc, x, i, iMax : Integer;
  bmSavePlace : TBookmark;
  cdsCompConta      :TClientDataSet;
  cdsLancResultado  :TClientDataSet;
  cdsCompSomatorio  :TClientDataSet;
  cdsPeriodoSaldo   :TClientDataSet;
  cdsLinhaxColuna   :TClientDataSet;
  cdsLinhasxColunas :TClientDataSet;
  cdsColunas        :TClientDataSet;
  cdsSaldos         :TClientDataSet;

begin
   Result := True;
   cdsCompConta       := TClientDataSet.Create(nil);
   cdsLancResultado   := TClientDataSet.Create(nil);
   cdsCompSomatorio   := TClientDataSet.Create(nil);
   cdsPeriodoSaldo    := TClientDataSet.Create(nil);
   cdsLinhaxColuna    := TClientDataSet.Create(nil);
   cdsLinhasxColunas  := TClientDataSet.Create(nil);
   cdsColunas         := TClientDataSet.Create(nil);
   cdsSaldos          := TClientDataSet.Create(nil);

   With TCMSqlParams.Create(nil) Do
   Try

      Try

         SQL.Clear;
         SQL.Add('SELECT                                                              ');
         SQL.Add('   (0) AS COL1, (0) AS COL2, (0) AS COL3, (0) AS COL4, (0) AS COL5,    ');
         SQL.Add('   (0) AS COL6, (0) AS COL7, (0) AS COL8, (0) AS COL9,                 ');
         SQL.Add('   (''                    -'') AS COL1DEF, (''                    -'') AS COL2DEF, (''                    -'') AS COL3DEF, (''                    -'') AS COL4DEF, (''                    -'') AS COL5DEF, ');
         SQL.Add('   (''                    -'') AS COL6DEF, (''                    -'') AS COL7DEF, (''                    -'') AS COL8DEF, (''                    -'') AS COL9DEF,                                         ');
         SQL.Add('   (''N'') AS CALCU1, (''N'') AS CALCU2, (''N'') AS CALCU3,            ');
         SQL.Add('   (''N'') AS CALCU4, (''N'') AS CALCU5, (''N'') AS CALCU6,            ');
         SQL.Add('   (''N'') AS CALCU7, (''N'') AS CALCU8, (''N'') AS CALCU9,            ');
         SQL.Add('   (0) AS COLPERC, (0) AS COL1SN,                                      ');
         SQL.Add('   (0) AS COL2SN, (0) AS COL3SN, (0) AS COL4SN, (0) AS COL5SN,         ');
         SQL.Add('   (0) AS COL6SN, (0) AS COL7SN, (0) AS COL8SN, (0) AS COL9SN,         ');
         SQL.Add('   L.NOMELINHA, L.IDLINHA, L.ORDEMLINHA, L.FLGNATUREZA, L.FLGMONETARIA,');
         SQL.Add('   L.FLGPASSATRACO, ''N'' AS QUEBRADUPLO, ''N'' AS QUEBRASIMPLES       ');
         SQL.Add('FROM                                                                   ');
         SQL.Add('   DEMLINHA L                                                          ');
         SQL.Add('WHERE                                                                  ');
         SQL.Add('   (L.IDDEMONSTRATIVO =:IDDEMONSTRATIVO)                               ');
         SQL.Add('ORDER BY                                                               ');
         SQL.Add('    L.ORDEMLINHA                                                       ');

         Prepare;

         ParamByName('IDDEMONSTRATIVO').asInteger := iDemo;

         FcdsDemonstrativo.Data := Data;

         FcdsDemonstrativo.First;

         bCalc := True;

         cdsColunas.Data := CtrlDemColuna.ListDemColunas(iDemo,0);
         iMax := cdsColunas.RecordCount;

         FcdsDemonstrativo.First;
         while not FcdsDemonstrativo.EOF do begin
            FcdsDemonstrativo.edit;
            i:=1;

            dPrimeiro := 0;
            dUltimo   := 0;
            cdsColunas.First;
            while not cdsColunas.eof do begin
               //
               bEntrou   := False;
               dValAtu   := 0;

               sColuna   := 'COL' + IntToStr(i);
               sCalcu    := 'CALCU' + IntToStr(i);
               sColunaSN := 'COL' + IntToStr(i)+'SN';
               sColunaDef:= 'COL' + IntToStr(i)+'DEF';

               cdsLinhaxColuna.Data := ListaLinhaxColuna(cdsColunas.FieldByName('IDDEMONSTRATIVO').AsInteger,
                                                         cdsColunas.FieldByName('NUMCOLUNA').AsInteger,
                                                         FcdsDemonstrativo.FieldByName('IDLINHA').AsInteger);

               if not cdsLinhaxColuna.IsEmpty then begin
                  cdsCompConta.Data := ListaCompConta(cdsLinhaxColuna.FieldByName('IDELEMDEMONSTRAT').asInteger);
                  cdsCompConta.First;
                  while not cdsCompConta.EOF do begin
                     bEntrou:=True;
                     //Ano Atual
                     if sDataIni <> '' then begin
                        if (iValores = 0) and (cdsCompConta.FieldByName('FLGACUMULADO').asString <> 'S') then begin
                           if sNatureza = 'C' then begin
                              sSql :=        'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS SALDO         ';
                           end else begin
                              sSql :=        'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,L.LACVALOR*-1)) AS SALDO         ';
                           end;
                           sSql := sSql + 'FROM PLANILHA P, LANCAMENTO L, CENTCUST CC                                          ';
                           sSql := sSql + 'WHERE (L.PLACONTA LIKE '''+cdsCompConta.FieldByName('PLACONTA').AsString+'%'')     ';
                           sSql := sSql + '      AND (L.PLANO = '+IntToStr(iPlano)+')                              ';
                           sSql := sSql + '      AND (P.IDPESSOA = '+FloatToStr(dEmpresa)+ ')                           ';
                           sSql := sSql + '      AND (P.PLNEFETIVADO = ''S'')                                                 ';
                           sSql := sSql + '      AND (P.PLNCODIGO = L.PLNCODIGO)                                              ';
                           sSql := sSql + '      AND (P.PEREXERCICIO = '+IntToStr(iExercicio)+ ')                         ';
                           sSql := sSql + '      AND (P.PLNDATDIA >= TO_DATE('''+sDataIni+''',''DD/MM/YYYY''))        ';
                           sSql := sSql + '      AND (P.PLNDATDIA <= TO_DATE('''+sDataFim+''',''DD/MM/YYYY''))        ';


                           if not cdsCompConta.FieldByName('CODEXTERNO').isNull then begin
                              sSql := sSql + '   AND (CC.CODEXTERNO RLIKE '''+cdsCompConta.FieldByName('CODEXTERNO').AsString+'%'') ';
                           end;

                           if sCCustoIni <> '' then begin
                              sSql := sSql + ' AND (RTRIM(CC.CODEXTERNO) LIKE '''+sCCustoIni+'%'')';
                              sSql := sSql + ' AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                           end;

                           sSql := sSql + ' AND (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) ) ';

                           if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                              sSql := sSql + '   AND (L.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                           end;
                           if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                              sSql := sSql + '   AND (L.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                           end;

                           if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                           begin
                             sSql := sSql + ' AND (L.IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                           end;

                           if not cdsCompConta.fieldByName('IDPATRO').isNull then
                           begin
                             sSql := sSql + ' AND (L.IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                           end;

                           if trim(sAtivSel) <> '' then begin
                              sSql := sSql + ' AND  (L.UNIDNEGOC IN (' + trim(sAtivSel) + ')) ';
                           end;
                           if trim(sAtivProj) <> '' then begin
                              sSql := sSql + ' AND (L.UNIDNEGOC = '+sAtivProj+')';
                           end;
                           if trim(sPlano) <> '' then begin
                              sSql := sSql + ' AND (L.IDPLANOPREV = '+sPlano+')';
                           end;
                           if trim(sPatro) <> '' then begin
                              sSql := sSql + ' AND (L.IDPATRO = '+sPatro+')';
                           end;
                        end else begin
                           sSql :='SELECT SUM(U.SALDO) AS SALDO FROM ((         ';
                           if sNatureza = 'C' then begin
                              sSql := sSql + 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS SALDO         ';
                           end else begin
                              sSql := sSql + 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,L.LACVALOR*-1)) AS SALDO         ';
                           end;
                           sSql := sSql + 'FROM PLANILHA P, LANCAMENTO L, CENTCUST CC                                       ';
                           sSql := sSql + 'WHERE (L.PLACONTA LIKE '''+cdsCompConta.FieldByName('PLACONTA').AsString+'%'')     ';
                           sSql := sSql + '      AND (L.PLANO = '+IntToStr(iPlano)+')                              ';
                           sSql := sSql + '      AND (P.IDPESSOA = '+FloatToStr(dEmpresa)+')                           ';
                           sSql := sSql + '      AND (P.PEREXERCICIO = '+IntToStr(iExercicio)+')                         ';
                           sSql := sSql + '      AND (P.PLNEFETIVADO = ''S'')                                                 ';
                           sSql := sSql + '      AND (P.PLNCODIGO = L.PLNCODIGO)                                              ';
                           if bAcumulado then
                              sSql := sSql + '      AND (P.PLNDATDIA < TO_DATE('''+sDataIni+''',''DD/MM/YYYY''))     '
                           else
                              sSql := sSql + '      AND (P.PLNDATDIA <= TO_DATE('''+sDataFim+''',''DD/MM/YYYY''))    ';

                           if not cdsCompConta.FieldByName('CODEXTERNO').isNull then begin
                              sSql := sSql + '   AND (CC.CODEXTERNO RLIKE '''+cdsCompConta.FieldByName('CODEXTERNO').AsString+'%'') ';
                           end;

                           if sCCustoIni <> '' then begin
                              sSql := sSql + ' AND (RTRIM(CC.CODEXTERNO) LIKE '''+sCCustoIni+'%'')';
                              sSql := sSql + ' AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                           end;

                           sSql := sSql + ' AND (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) ) ';


                           if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                              sSql := sSql + '   AND (L.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                           end;
                           if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                              sSql := sSql + '   AND (L.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                           end;


                           if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                           begin
                             sSql := sSql + ' AND (L.IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                           end;

                           if not cdsCompConta.fieldByName('IDPATRO').isNull then
                           begin
                             sSql := sSql + ' AND (L.IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                           end;


                           if trim(sAtivSel) <> '' then begin
                              sSql := sSql + ' AND  (L.UNIDNEGOC IN (' + trim(sAtivSel) + ')) ';
                           end;
                           if trim(sAtivProj) <> '' then begin
                              sSql := sSql + ' AND (L.UNIDNEGOC = '+sAtivProj+')';
                           end;
                           if trim(sPlano) <> '' then begin
                              sSql := sSql + ' AND (L.IDPLANOPREV = '+sPlano+')';
                           end;
                           if trim(sPatro) <> '' then begin
                              sSql := sSql + ' AND (L.IDPATRO = '+sPatro+')';
                           end;
                           sSql := sSql + ') UNION ALL (';
                           if sNatureza = 'C' then begin
                              sSql := sSql + 'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(PLSCREDITOCOR,NULL,0,PLSCREDITOCOR) -               ';
                              sSql := sSql + '           DECODE(PLSDEBITOCORRENTE,NULL,0,PLSDEBITOCORRENTE)) AS SALDO         ';
                           end else begin
                              sSql := sSql + 'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(PLSDEBITOCORRENTE,NULL,0,PLSDEBITOCORRENTE) -                 ';
                              sSql := sSql + '           DECODE(PLSCREDITOCOR,NULL,0,PLSCREDITOCOR)) AS SALDO       ';
                           end;
                           sSql := sSql + 'FROM PLANOSALDO PS, CENTCUST CC                                          ';
                           sSql := sSql + 'WHERE (PS.PLACONTA = '''+cdsCompConta.FieldByName('PLACONTA').AsString+''')           ';
                           sSql := sSql + '      AND (PS.PLANO = '+IntToStr(iPlano)+')                                ';
                           sSql := sSql + '      AND (PS.IDPESSOA = '+FloatToStr(dEmpresa)+')                         ';
                           sSql := sSql + '      AND (PS.PEREXERCICIO = '+IntToStr(iExercicio)+ ')                    ';
                           sSql := sSql + '      AND (PS.PERNUMERO IS NULL)                              ';

                           if not cdsCompConta.FieldByName('CODEXTERNO').isNull then begin
                              sSql := sSql + '   AND (CC.CODEXTERNO LIKE '''+cdsCompConta.FieldByName('CODEXTERNO').AsString+'%'') ';
                           end;

                           IF sCCustoIni <> '' then begin
                              sSql := sSql + ' AND (RTRIM(CC.CODEXTERNO) LIKE '''+sCCustoIni+'%'')';
                              sSql := sSql + ' AND (PS.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                           end;

                            sSql := sSql + ' AND (PS.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) ) ';


                           if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                              sSql := sSql + '   AND (PS.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                           end;
                           if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                              sSql := sSql + '   AND (PS.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                           end;

                           if trim(sAtivSel) <> '' then begin
                              sSql := sSql + ' AND  (PS.UNIDNEGOC IN (' + trim(sAtivSel) + ')) ';
                           end;
                           if trim(sAtivProj) <> '' then begin
                              sSql := sSql + ' AND (PS.UNIDNEGOC = '+sAtivProj+')';
                           end;


                           if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                           begin
                             sSql := sSql + ' AND (PS.IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                           end;

                           if not cdsCompConta.fieldByName('IDPATRO').isNull then
                           begin
                             sSql := sSql + ' AND (PS.IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                           end;

                           if trim(sPlano) <> '' then begin
                              sSql := sSql + ' AND (PS.IDPLANOPREV = '+sPlano+')';
                           end;
                           if trim(sPatro) <> '' then begin
                              sSql := sSql + ' AND (PS.IDPATRO = '+sPatro+')';
                           end;

                           sSql := sSql + ')) U ';
                        end;
                     end else begin
                        if sNatureza = 'C' then begin
                           sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(PLSCREDITOCOR,NULL,0,PLSCREDITOCOR) -               ';
                           sSql := sSql + '           DECODE(PLSDEBITOCORRENTE,NULL,0,PLSDEBITOCORRENTE)) AS SALDO         ';
                        end else begin
                           sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(PLSDEBITOCORRENTE,NULL,0,PLSDEBITOCORRENTE) -                 ';
                           sSql := sSql + '           DECODE(PLSCREDITOCOR,NULL,0,PLSCREDITOCOR)) AS SALDO       ';
                        end;
                        sSql := sSql + 'FROM PLANOSALDO PS, CENTCUST CC                                          ';
                        sSql := sSql + 'WHERE (PLACONTA = '''+cdsCompConta.FieldByName('PLACONTA').AsString+''')           ';
                        sSql := sSql + '      AND (PLANO = '+IntToStr(iPlano)+')                                ';
                        sSql := sSql + '      AND (IDPESSOA = '+FloatToStr(dEmpresa)+')                             ';
                        sSql := sSql + '      AND (PEREXERCICIO = '+IntToStr(iExercicio)+')                           ';
                        if (iValores = 0) and (cdsCompConta.FieldByName('FLGACUMULADO').asString <> 'S') then begin
                           sSql := sSql + '      AND (PERNUMERO BETWEEN '+IntToStr(iPeriodoIni)+' AND '+IntToStr(iPeriodoFim)+')                               ';
                        end else begin
                           if bAcumulado then
                              sSql := sSql + '      AND ((PERNUMERO  < '+IntToStr(iPeriodoFim)+') OR (PERNUMERO IS NULL))     '
                           else
                              sSql := sSql + '      AND ((PERNUMERO  <= '+IntToStr(iPeriodoFim)+') OR (PERNUMERO IS NULL))     ';
                        end;

                        if not cdsCompConta.FieldByName('CODEXTERNO').isNull then begin
                           sSql := sSql + '   AND (CC.CODEXTERNO LIKE '''+cdsCompConta.FieldByName('CODEXTERNO').AsString+'%'') ';
                        end;

                        if sCCustoIni <> '' then begin
                           sSql := sSql + ' AND (RTRIM(CC.CODEXTERNO) LIKE '''+sCCustoIni+'%'')';
                           sSql := sSql + ' AND (PS.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                        end;

                        sSql := sSql + ' AND (PS.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) ) ';

                        if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                           sSql := sSql + '   AND (PS.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                        end;
                        if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                           sSql := sSql + '   AND (PS.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                        end;

                        if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                        begin
                          sSql := sSql + ' AND (L.IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                        end;

                        if not cdsCompConta.fieldByName('IDPATRO').isNull then
                        begin
                          sSql := sSql + ' AND (L.IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                        end;

                        if trim(sAtivSel) <> '' then begin
                           sSql := sSql + ' AND  (PS.UNIDNEGOC IN (' + trim(sAtivSel) + ')) ';
                        end;
                        if trim(sAtivProj) <> '' then begin
                           sSql := sSql + ' AND (PS.UNIDNEGOC = '+sAtivProj+')';
                        end;
                        if trim(sPlano) <> '' then begin
                           sSql := sSql + ' AND (PS.IDPLANOPREV = '+sPlano+')';
                        end;
                        if trim(sPatro) <> '' then begin
                           sSql := sSql + ' AND (PS.IDPATRO = '+sPatro+')';
                        end;
                     end;
                     cdsSaldos.Data := GetDataPacket(sSql);
                     if not cdsSaldos.IsEmpty then begin
                        if not cdsSaldos.FieldByName('SALDO').isNull then
                           dValAtu := dValAtu  + cdsSaldos.FieldByName('SALDO').AsFloat;
                     end;
                     cdsCompConta.Next;
                  end;
                  if (sCodMoeda <> '') and (FcdsDemonstrativo.FieldByName('FLGMONETARIA').AsString = 'S') then begin
                     dCotacaoAtu := Contab.TestaCotacaoMoeda(StrToInt(sCodMoeda),StrToDate(sPerDataFim),false);
                     if dCotacaoAtu <> 0 then begin
                        dValAtu := dValAtu/dCotacaoAtu;
                     end;
                  end;
                  if bEntrou then begin
                     FcdsDemonstrativo.Edit;
                     FcdsDemonstrativo.FieldByName(sColuna).AsFloat    := dValAtu;
                     if i = 1 then begin
                        dPrimeiro := dValAtu;
                     end;
                     if i = iMax then begin
                        dUltimo := dValAtu;
                     end;
                     FcdsDemonstrativo.FieldByName(sCalcu).AsString    := 'S';
                     if bNegativo then begin
                        FcdsDemonstrativo.FieldByName(sColunaSN).AsFloat    := dValAtu;
                     end else begin
                        if Modulo.TestaNatureza(sNatureza,FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString,dValAtu) then begin
                           FcdsDemonstrativo.FieldByName(sColunaSN).AsFloat  := Abs(dValAtu)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName(sColunaSN).AsFloat  := Abs(dValAtu);
                        end;
                     end;
                     FcdsDemonstrativo.FieldByName(sColunaDef).AsString  := FormatFloat(sFormato,FcdsDemonstrativo.FieldByName(sColunaSN).AsFloat);
                     FcdsDemonstrativo.Post;
                  end;
               end else begin
                  FcdsDemonstrativo.Edit;
                  FcdsDemonstrativo.FieldByName(sCalcu).AsString     := 'S';
                  FcdsDemonstrativo.FieldByName(sColuna).AsFloat     := 0;
                  FcdsDemonstrativo.FieldByName(sColunaSN).AsFloat   := 0;
                  FcdsDemonstrativo.FieldByName(sColunaDef).AsString := '-';
                  FcdsDemonstrativo.Post;
               end;
               cdsColunas.Next;
               inc(i);
            end;
            FcdsDemonstrativo.Edit;
            if dPrimeiro <> 0 then begin
               FcdsDemonstrativo.FieldByName('COLPERC').asFloat := ((dUltimo / dPrimeiro) * 100);
            end else begin
               FcdsDemonstrativo.FieldByName('COLPERC').asFloat := 0;
            end;
            FcdsDemonstrativo.Post;
            FcdsDemonstrativo.Next;
         end;
         //
         x:=1;
         iNumCalc:=0;
         while x = 1 do begin
            bEntrou:=False;

            FcdsDemonstrativo.First;

            while not FcdsDemonstrativo.EOF do begin
               i:=1;

               dPrimeiro   := 0;
               dUltimo     := 0;

               cdsColunas.First;
               while not cdsColunas.eof do begin
                  dValAtu     := 0;
                  sColuna     := 'COL' + IntToStr(i);
                  sCalcu      := 'CALCU' + IntToStr(i);
                  sColunaSN   := 'COL' + IntToStr(i)+'SN';
                  sColunaDef  := 'COL' + IntToStr(i)+'DEF';
                  bmSavePlace := FcdsDemonstrativo.GetBookmark;

                  if FcdsDemonstrativo.FieldByName(sCalcu).AsString <> 'S' then begin
                     bEntrou:=True;

                     cdsLinhaxColuna.Data := ListaLinhaxColuna(cdsColunas.FieldByName('IDDEMONSTRATIVO').AsInteger,
                                                         cdsColunas.FieldByName('NUMCOLUNA').AsInteger,
                                                         FcdsDemonstrativo.FieldByName('IDLINHA').AsInteger);


                     if not cdsLinhaxColuna.IsEmpty then begin

                        cdsCompSomatorio.Data := ListaCompSomatorio(cdsLinhaxColuna.FieldByName('IDELEMDEMONSTRAT').asInteger);

                        bCalc     := True;

                        cdsCompSomatorio.First;
                        while not cdsCompSomatorio.EOF do begin

                           //Verificaçao do tipo de operação para cálculo da fórmula
                           sOper := cdsCompSomatorio.FieldByName('FLGOPERACAO').asString;

                           cdsLinhasxColunas.Data := ListaLinhasxColunas(cdsColunas.FieldByName('IDDEMONSTRATIVO').AsInteger,cdsCompSomatorio.FieldByName('ELEMENTODEM').AsInteger);

                           sColuna1 := 'COL' + IntToStr(cdsLinhasxColunas.FieldByName('NUMCOLUNA').AsInteger);
                           sCalcu1  := 'CALCU' + IntToStr(cdsLinhasxColunas.FieldByName('NUMCOLUNA').AsInteger);

                           FcdsDemonstrativo.First;
                           while not FcdsDemonstrativo.EOF do begin
                              if cdsLinhasxColunas.FieldByName('IDLINHA').AsInteger = FcdsDemonstrativo.FieldByName('IDLINHA').AsInteger then begin
                                 if FcdsDemonstrativo.FieldByName(sCalcu1).AsString = 'S' then begin
                                    case sOPer[1] of
                                       'S' : begin
                                                dValAtu := dValAtu + FcdsDemonstrativo.FieldByName(sColuna1).AsFloat;
                                             end;
                                       'U' : begin
                                                dValAtu := dValAtu - FcdsDemonstrativo.FieldByName(sColuna1).AsFloat;
                                             end;
                                       'M' : begin
                                                dValAtu := dValAtu * FcdsDemonstrativo.FieldByName(sColuna1).AsFloat;
                                             end;
                                       'D' : begin
                                                if FcdsDemonstrativo.FieldByName(sColuna1).asFloat <> 0 then begin
                                                   dValAtu := dValAtu / FcdsDemonstrativo.FieldByName(sColuna1).AsFloat;
                                                end else begin
                                                   dValAtu := 0;
                                                end;
                                             end;
                                       'P' : begin
                                                if FcdsDemonstrativo.FieldByName(sColuna1).asFloat <> 0 then begin
                                                   dValAtu := (dValAtu / FcdsDemonstrativo.FieldByName(sColuna1).AsFloat) * 100;
                                                end else begin
                                                   dValAtu := 0;
                                                end;
                                             end;
                                    end;
                                 end else begin
                                    bCalc:=False;
                                    Break;
                                 end;
                              end;
                              FcdsDemonstrativo.Next;
                           end;
                           cdsCompSomatorio.Next;
                        end;
                     end else begin
                        FcdsDemonstrativo.Edit;
                        FcdsDemonstrativo.FieldByName(sCalcu).AsString     := 'S';
                        FcdsDemonstrativo.FieldByName(sColuna).AsFloat     := 0;
                        FcdsDemonstrativo.FieldByName(sColunaSN).AsFloat   := 0;
                        FcdsDemonstrativo.FieldByName(sColunaDef).AsString := '-';
                        FcdsDemonstrativo.Post;
                     end;
                     FcdsDemonstrativo.GotoBookmark(bmSavePlace);
                     if bCalc then begin
                        Inc(iNumCalc);
                        FcdsDemonstrativo.Edit;
                        FcdsDemonstrativo.FieldByName(sColuna).AsFloat := dValAtu;
                        FcdsDemonstrativo.FieldByName(sCalcu).AsString := 'S';
                        if bNegativo then begin
                           FcdsDemonstrativo.FieldByName(sColunaSN).AsFloat    := dValAtu;
                        end else begin
                           if Modulo.TestaNatureza(sNatureza, FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString,dValAtu) then begin
                              FcdsDemonstrativo.FieldByName(sColunaSN).AsFloat  := Abs(dValAtu)* (-1);
                           end else begin
                              FcdsDemonstrativo.FieldByName(sColunaSN).AsFloat  := Abs(dValAtu);
                           end;
                        end;
                        FcdsDemonstrativo.FieldByName(sColunaDef).AsString  := FormatFloat(sFormato,FcdsDemonstrativo.FieldByName(sColunaSN).AsFloat);
                        FcdsDemonstrativo.Post;
                     end else begin
                        break;
                     end;
                  end;
                  if i = 1 then begin
                     dPrimeiro := FcdsDemonstrativo.FieldByName(sColuna).AsFloat;
                  end;
                  if i = iMax then begin
                     dUltimo   := FcdsDemonstrativo.FieldByName(sColuna).AsFloat;
                  end;
                  inc(i);
                  cdsColunas.Next;
               end;
               if bCalc then begin
                  FcdsDemonstrativo.Edit;
                  if dPrimeiro <> 0 then begin
                     FcdsDemonstrativo.FieldByName('COLPERC').asFloat := ((dUltimo / dPrimeiro) * 100);
                  end else begin
                     FcdsDemonstrativo.FieldByName('COLPERC').asFloat := 0;
                  end;
                  FcdsDemonstrativo.Post;
               end;
               FcdsDemonstrativo.Next;
            end;
            if not bEntrou then Break;
            if iNumCalc = 0 then begin
               Break;
               Abort;
            end;
         end;
         sPassaS := 'N';
         sPassaD := 'N';
         FcdsDemonstrativo.first;
         while not FcdsDemonstrativo.eof do begin
            if (FcdsDemonstrativo.FieldByName('FLGPASSATRACO').AsString = 'S') then begin
               if sPassaS = 'N' then
                  sPassaS := 'S'
               else
                  sPassaS := 'N';
            end;
            if (FcdsDemonstrativo.FieldByName('FLGPASSATRACO').AsString = 'D') then begin
               if sPassaD = 'N' then
                  sPassaD := 'S'
               else
                  sPassaD := 'N';
            end;
            FcdsDemonstrativo.Edit;
            FcdsDemonstrativo.FieldByName('QUEBRASIMPLES').AsString := sPassaS;
            FcdsDemonstrativo.FieldByName('QUEBRADUPLO').AsString   := sPassaD;
            FcdsDemonstrativo.Post;
            FcdsDemonstrativo.next;
         end;

         if not bZerados then
         begin
            FcdsDemonstrativo.First;
            while not FcdsDemonstrativo.EOF do
            begin
               if FcdsDemonstrativo.FieldByName('COL1').asFloat + FcdsDemonstrativo.FieldByName('COL2').asFloat +
                  FcdsDemonstrativo.FieldByName('COL3').asFloat + FcdsDemonstrativo.FieldByName('COL4').asFloat +
                  FcdsDemonstrativo.FieldByName('COL5').asFloat + FcdsDemonstrativo.FieldByName('COL6').asFloat +
                  FcdsDemonstrativo.FieldByName('COL7').asFloat + FcdsDemonstrativo.FieldByName('COL8').asFloat +
                  FcdsDemonstrativo.FieldByName('COL9').asFloat = 0 then
               begin
                  if FcdsDemonstrativo.FieldByName('ELETIPOELEM').AsString <> 'T' then
                     FcdsDemonstrativo.Delete
                  else
                    FcdsDemonstrativo.Next;
               end else
               begin
                  FcdsDemonstrativo.Next;
               end;
            end;
         end;
      Except
        Result := false;
      End;

   Finally
     cdsCompConta.Free;
     cdsCompSomatorio.free;
     cdsPeriodoSaldo.free;
     cdsSaldos.Free;
     cdsLinhasxColunas.free;
     cdsLinhaxColuna.free;
     Free;
   End;

end;

function TCtrlRptDemonstrativo.ListaLinhaxColuna(idemo,iNumCol,iLinha: Integer): OleVariant;
var
  sSql :string;
begin
    sSql := 'SELECT IDELEMDEMONSTRAT '+
            'FROM DEMCOLXLIN '+
            'WHERE '+
            '   (IDDEMONSTRATIVO = '+ IntToStr(iDemo) + ') AND ' +
            '   (NUMCOLUNA       = '+ IntToStr(iNumCol) + ') AND '+
            '   (IDLINHA         = '+ IntToStr(iLinha) + ') ';


    result := GetDataPacket(sSql);
end;

function TCtrlRptDemonstrativo.ListaLinhasxColunas(idemo,iElem: Integer): OleVariant;
var
  sSql :string;
begin
    sSql := 'SELECT  IDLINHA, NUMCOLUNA '+
            'FROM DEMCOLXLIN '+
            'WHERE ' +
            '      (IDDEMONSTRATIVO  = ' +IntToStr(iDemo) + ') AND '+
            '      (IDELEMDEMONSTRAT = ' +IntToStr(iElem) + ') ';


    result := GetDataPacket(sSql);
end;


function TCtrlRptDemonstrativo.ProcessaDemoModelo5(iDemo,iExercicio,iPerIni,iPerFim,iPlano :Integer;
                             dEmpresa :Double;sNatureza,sTipoOperResult,sCCustoIni,
                             sAtivProj,sAtivProjSel,sCodMoeda,sPerDataFim:string;
                             bDesconResult,bZerados:Boolean): Boolean;

var sOper, sSql, sFieldMes, sSalto : string;
    dValorResult, dCotacaoAtu, dValAtu, dValAtu1, dValAtu2, dValAtu3, dValAtu4, dValAtu5, dValAtu6,
    dValAtu7, dValAtu8, dValAtu9, dValAtu10, dValAtu11, dValAtu12  : Double;
    bCalc, bEntrou : Boolean;
    iNumCalc, x,  iPerAtu, iLinha : Integer;
    bmSavePlace : TBookmark;
  cdsCompConta      :TClientDataSet;
  cdsLancResultado  :TClientDataSet;
  cdsCompSomatorio  :TClientDataSet;
  cdsPeriodoSaldo   :TClientDataSet;
  cdsSaldos         :TClientDataSet;

begin
   Result := True;
   cdsCompConta       := TClientDataSet.Create(nil);
   cdsLancResultado   := TClientDataSet.Create(nil);
   cdsCompSomatorio   := TClientDataSet.Create(nil);
   cdsPeriodoSaldo    := TClientDataSet.Create(nil);
   cdsSaldos          := TClientDataSet.Create(nil);

   With TCMSqlParams.Create(nil) Do
   Try

      Try

         SQL.Clear;
         SQL.Add('SELECT                                                              ');
         SQL.Add('   (0) AS JANS, (0) AS FEVS, (0) AS MARS, (0) AS ABRS, (0) AS MAIS, (0) AS JUNS, ');
         SQL.Add('   (0) AS JULS, (0) AS AGOS, (0) AS SEBS, (0) AS OUTS, (0) AS NOVS, (0) AS DEZS, ');
         SQL.Add('   (0) AS JAN, (0) AS FEV, (0) AS MAR, (0) AS ABR, (0) AS MAI, (0) AS JUN,       ');
         SQL.Add('   (0) AS JUL, (0) AS AGO, (0) AS SEB, (0) AS OUT, (0) AS NOV, (0) AS DEZ,       ');
         SQL.Add('   (0) AS TOT, (''N'') AS CALCU, ('' '') AS SALTA,                                           ');
         SQL.Add('   E.ELEDESCELEM, E.FLGINDENTACAO, E.FLGTIPOLINHA, E.ELEORDEMLINHA,              ');
         SQL.Add('   E.IDELEMDEMONSTRAT,E.ELETIPOELEM,E.FLGSALTAPAGINA,E.FLGMONETARIA,             ');
         SQL.Add('   E.FLGTRACO,E.FLGNEGRITO,E.FLGNATUREZA,E.FLGTIPONEGATIVO, E.FLGDECIMAIS        ');
         SQL.Add('FROM                                                                             ');
         SQL.Add('   ELEMDEMONSTRATIVO E                                                           ');
         SQL.Add('WHERE                                                                            ');
         SQL.Add('    (E.IDDEMONSTRATIVO =:IDDEMONSTRATIVO)                                        ');
         SQL.Add('ORDER BY                                                                         ');
         SQL.Add('    E.ELEORDEMLINHA                                                              ');

         Prepare;

         ParamByName('IDDEMONSTRATIVO').asInteger := iDemo;

         FcdsDemonstrativo.Data := Data;

         FcdsDemonstrativo.First;


         //zera o acumulador de salto de pagina
         iLinha := 0;
         sSalto := 'N';
         while not FcdsDemonstrativo.EOF do begin

            if sSalto = 'S' then begin
               inc(iLinha);
               sSalto := 'N';
            end;

            if FcdsDemonstrativo.FieldByName('FLGSALTAPAGINA').asString = 'S' then begin
               sSalto := 'S';
            end;

            FcdsDemonstrativo.Edit;
            FcdsDemonstrativo.FieldByName('SALTA').asString := IntTOStr(iLinha);

            cdsCompConta.Data := ListaCompConta(FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').asInteger);
            sSql := sSqlCompConta;


            if not cdsCompConta.IsEmpty then
            begin
               for iPerAtu := iPerIni to iPerFim do
               begin
                  dValAtu:=0;
                  cdsCompConta.First;
                  while not cdsCompConta.EOF do
                  begin
                     //
                     //Ano Atual
                     dValorResult := 0;
                     if (bDesconResult) and (sTipoOperResult <> '') then begin
                        if sNatureza = 'C' then begin
                           sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';
                        end else begin
                           sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';
                        end;
                        sSql := sSql + 'FROM PLANILHA P, LANCAMENTO L , CENTCUST CC                                                     ';
                        sSql := sSql + 'WHERE     (L.PLACONTA LIKE '''+cdsCompConta.FieldByName('PLACONTA').AsString+'%'+''')           ';
                        sSql := sSql + '      AND (L.PLANO = '+IntToStr(iPlano)+')                              ';
                        sSql := sSql + '      AND (P.IDPESSOA = '+FloatToStr(dEmpresa)+')                             ';
                        sSql := sSql + '      AND (L.TIPCODIGO = '''+sTipoOperResult+''')            ';
                        sSql := sSql + '      AND (P.PEREXERCICIO = '+IntToStr(iExercicio)+')                        ';
                        sSql := sSql + '      AND (P.PERNUMERO  = '+IntToStr(iPerAtu)+')                             ';
                        sSql := sSql + '      AND (P.PLNCODIGO = L.PLNCODIGO) ';

                        if not cdsCompConta.FieldByName('CODEXTERNO').isNull then begin
                           sSql := sSql + '   AND (CC.CODEXTERNO LIKE '''+cdsCompConta.FieldByName('CODEXTERNO').AsString+'%'') ';
                           sSql := sSql + '   AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                        end;

                        sSql := sSql + ' AND (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) ) ';



                        if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                           sSql := sSql + '   AND (L.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                           sSql := sSql + '   AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                        end;
                        if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                           sSql := sSql + ' AND (L.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                           sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                        end;

                        if trim(sAtivProjSel) <> '' then begin
                           sSql := sSql + ' AND  (L.UNIDNEGOC IN (' + trim(sAtivProjSel) + ')) ';
                        end;
                        if sAtivProj <> '' then begin
                           sSql := sSql + ' AND (L.UNIDNEGOC = '+sAtivProj+')';
                           sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                        end;


                        if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                        begin
                          sSql := sSql + ' AND (L.IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                        end;

                        if not cdsCompConta.fieldByName('IDPATRO').isNull then
                        begin
                          sSql := sSql + ' AND (L.IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                        end;


                        cdsLancResultado.Data := GetDataPacket(sSql);
                        if not cdsLancResultado.IsEmpty then
                        begin
                          dValorResult := cdsLancResultado.FieldByName('SALDO').AsFloat;
                        end;
                     end;
                     //
                     if sNatureza = 'C' then begin
                        sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(PLSCREDITOCOR,NULL,0,PLSCREDITOCOR) -               ';
                        sSql := sSql + '           DECODE(PLSDEBITOCORRENTE,NULL,0,PLSDEBITOCORRENTE)) AS SALDO         ';
                     end else
                     begin
                        sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(PLSDEBITOCORRENTE,NULL,0,PLSDEBITOCORRENTE) -                 ';
                        sSql := sSql + '           DECODE(PLSCREDITOCOR,NULL,0,PLSCREDITOCOR)) AS SALDO       ';
                     end;
                     sSql := sSql + 'FROM PLANOSALDO PS, CENTCUST CC                                                        ';
                     sSql := sSql + 'WHERE (PS.PLACONTA = '''+cdsCompConta.FieldByName('PLACONTA').AsString+''')           ';
                     sSql := sSql + '      AND (PS.PLANO = '+IntToStr(iPlano)+')                                ';
                     sSql := sSql + '      AND (PS.IDPESSOA = '+FloatToStr(dEmpresa)+')                             ';
                     sSql := sSql + '      AND (PS.PEREXERCICIO = '+IntToStr(iExercicio)+')                           ';
                     sSql := sSql + '      AND (PS.PERNUMERO  = '+ IntToStr(iPerAtu) +')                                  ';

                     if not cdsCompConta.FieldByName('CODEXTERNO').isNull then
                     begin
                        sSql := sSql + '   AND (CC.CODEXTERNO LIKE '''+cdsCompConta.FieldByName('CODEXTERNO').AsString+'%'') ';
                     end;

                     if sCCustoIni <> '' then
                     begin
                       sSql := sSql + ' AND (RTRIM(CC.CODEXTERNO) LIKE '''+sCCustoIni+'%'')';
                       sSql := sSql + ' AND (PS.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                     end;

                     sSql := sSql + ' AND (PS.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) ) ';

                     if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then
                     begin
                        sSql := sSql + '   AND (UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                     end;
                     if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then
                     begin
                        sSql := sSql + '   AND (CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                     end;

                     if trim(sAtivProjSel) <> '' then begin
                        sSql := sSql + ' AND  (UNIDNEGOC IN (' + trim(sAtivProjSel) + ')) ';
                     end;
                     if sAtivProj <> '' then
                     begin
                       sSql := sSql + ' AND (UNIDNEGOC = '+sAtivProj+')';
                     end;

                     if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                     begin
                       sSql := sSql + ' AND (L.IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                     end;

                     if not cdsCompConta.fieldByName('IDPATRO').isNull then
                     begin
                       sSql := sSql + ' AND (L.IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                     end;

                     cdsSaldos.Data := GetDataPacket(sSql);
                     if not cdsSaldos.isEmpty then
                     begin
                        dValAtu := dValAtu+cdsSaldos.FieldByName('SALDO').AsFloat-dValorResult;
                     end;
                     cdsCompConta.Next;
                  end;

                  if (sCodMoeda <> '') and (FcdsDemonstrativo.FieldByName('FLGMONETARIA').AsString = 'S') then begin
                     dCotacaoAtu := Contab.TestaCotacaoMoeda(StrToInt(sCodMoeda),StrToDate(sPerDataFim),False);
                     dValAtu := dValAtu/dCotacaoAtu;
                  end;

                  case iPerAtu of
                     1:  sFieldMes := 'JAN';
                     2:  sFieldMes := 'FEV';
                     3:  sFieldMes := 'MAR';
                     4:  sFieldMes := 'ABR';
                     5:  sFieldMes := 'MAI';
                     6:  sFieldMes := 'JUN';
                     7:  sFieldMes := 'JUL';
                     8:  sFieldMes := 'AGO';
                     9:  sFieldMes := 'SEB';
                     10: sFieldMes := 'OUT';
                     11: sFieldMes := 'NOV';
                     12: sFieldMes := 'DEZ';
                  end;

                  FcdsDemonstrativo.FieldByName(sFieldMes + 'S').AsFloat := dValAtu;

                  if (FcdsDemonstrativo.FieldByName('FLGTIPONEGATIVO').AsString <> 'N') then begin
                     FcdsDemonstrativo.FieldByName(sFieldMes).AsFloat := dValAtu;
                  end else begin
                     if Modulo.TestaNatureza(sNatureza,
                        FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValAtu) then begin
                        FcdsDemonstrativo.FieldByName(sFieldMes).AsFloat  := Abs(dValAtu)* (-1);
                     end else begin
                        FcdsDemonstrativo.FieldByName(sFieldMes).AsFloat  := Abs(dValAtu);
                     end;
                  end;
               end;
               FcdsDemonstrativo.FieldByName('CALCU').AsString := 'S';
            end;
            FcdsDemonstrativo.Post;
            FcdsDemonstrativo.Next;
         end;

         x:=1;
         iNumCalc:=0;
         while x = 1 do begin
            bEntrou:=False;
            FcdsDemonstrativo.First;
            bmSavePlace := FcdsDemonstrativo.GetBookmark;

            while not FcdsDemonstrativo.EOF do begin

               if FcdsDemonstrativo.FieldByName('CALCU').AsString <> 'S' then begin
                  bEntrou:=True;

                  cdsCompSomatorio.Data := ListaCompSomatorio(FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').asInteger);

                  bCalc     := True;
                  dValAtu1  := 0;
                  dValAtu2  := 0;
                  dValAtu3  := 0;
                  dValAtu4  := 0;
                  dValAtu5  := 0;
                  dValAtu6  := 0;
                  dValAtu7  := 0;
                  dValAtu8  := 0;
                  dValAtu9  := 0;
                  dValAtu10 := 0;
                  dValAtu11 := 0;
                  dValAtu12 := 0;

                  // Salvar Ponteiro
                  bmSavePlace := FcdsDemonstrativo.GetBookmark;
                  cdsCompSomatorio.First;
                  while not cdsCompSomatorio.EOF do begin
                     //Verificaçao do tipo de operação para cálculo da fórmula
                     sOper := cdsCompSomatorio.FieldByName('FLGOPERACAO').asString;

                     FcdsDemonstrativo.First;
                     while not FcdsDemonstrativo.EOF do begin
                        if cdsCompSomatorio.FieldByName('ELEMENTODEM').AsInteger =
                           FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').AsInteger then begin
                           if FcdsDemonstrativo.FieldByName('CALCU').AsString = 'S' then begin
                              case sOPer[1] of
                                 'S' : begin
                                          dValAtu1  := dValAtu1  + FcdsDemonstrativo.FieldByName('JANS').AsFloat;
                                          dValAtu2  := dValAtu2  + FcdsDemonstrativo.FieldByName('FEVS').AsFloat;
                                          dValAtu3  := dValAtu3  + FcdsDemonstrativo.FieldByName('MARS').AsFloat;
                                          dValAtu4  := dValAtu4  + FcdsDemonstrativo.FieldByName('ABRS').AsFloat;
                                          dValAtu5  := dValAtu5  + FcdsDemonstrativo.FieldByName('MAIS').AsFloat;
                                          dValAtu6  := dValAtu6  + FcdsDemonstrativo.FieldByName('JUNS').AsFloat;
                                          dValAtu7  := dValAtu7  + FcdsDemonstrativo.FieldByName('JULS').AsFloat;
                                          dValAtu8  := dValAtu8  + FcdsDemonstrativo.FieldByName('AGOS').AsFloat;
                                          dValAtu9  := dValAtu9  + FcdsDemonstrativo.FieldByName('SEBS').AsFloat;
                                          dValAtu10 := dValAtu10 + FcdsDemonstrativo.FieldByName('OUTS').AsFloat;
                                          dValAtu11 := dValAtu11 + FcdsDemonstrativo.FieldByName('NOVS').AsFloat;
                                          dValAtu12 := dValAtu12 + FcdsDemonstrativo.FieldByName('DEZS').AsFloat;
                                       end;
                                 'U' : begin
                                          dValAtu1  := dValAtu1  - FcdsDemonstrativo.FieldByName('JANS').AsFloat;
                                          dValAtu2  := dValAtu2  - FcdsDemonstrativo.FieldByName('FEVS').AsFloat;
                                          dValAtu3  := dValAtu3  - FcdsDemonstrativo.FieldByName('MARS').AsFloat;
                                          dValAtu4  := dValAtu4  - FcdsDemonstrativo.FieldByName('ABRS').AsFloat;
                                          dValAtu5  := dValAtu5  - FcdsDemonstrativo.FieldByName('MAIS').AsFloat;
                                          dValAtu6  := dValAtu6  - FcdsDemonstrativo.FieldByName('JUNS').AsFloat;
                                          dValAtu7  := dValAtu7  - FcdsDemonstrativo.FieldByName('JULS').AsFloat;
                                          dValAtu8  := dValAtu8  - FcdsDemonstrativo.FieldByName('AGOS').AsFloat;
                                          dValAtu9  := dValAtu9  - FcdsDemonstrativo.FieldByName('SEBS').AsFloat;
                                          dValAtu10 := dValAtu10 - FcdsDemonstrativo.FieldByName('OUTS').AsFloat;
                                          dValAtu11 := dValAtu11 - FcdsDemonstrativo.FieldByName('NOVS').AsFloat;
                                          dValAtu12 := dValAtu12 - FcdsDemonstrativo.FieldByName('DEZS').AsFloat;
                                       end;
                                 'M' : begin
                                          dValAtu1  := dValAtu1  * FcdsDemonstrativo.FieldByName('JANS').AsFloat;
                                          dValAtu2  := dValAtu2  * FcdsDemonstrativo.FieldByName('FEVS').AsFloat;
                                          dValAtu3  := dValAtu3  * FcdsDemonstrativo.FieldByName('MARS').AsFloat;
                                          dValAtu4  := dValAtu4  * FcdsDemonstrativo.FieldByName('ABRS').AsFloat;
                                          dValAtu5  := dValAtu5  * FcdsDemonstrativo.FieldByName('MAIS').AsFloat;
                                          dValAtu6  := dValAtu6  * FcdsDemonstrativo.FieldByName('JUNS').AsFloat;
                                          dValAtu7  := dValAtu7  * FcdsDemonstrativo.FieldByName('JULS').AsFloat;
                                          dValAtu8  := dValAtu8  * FcdsDemonstrativo.FieldByName('AGOS').AsFloat;
                                          dValAtu9  := dValAtu9  * FcdsDemonstrativo.FieldByName('SEBS').AsFloat;
                                          dValAtu10 := dValAtu10 * FcdsDemonstrativo.FieldByName('OUTS').AsFloat;
                                          dValAtu11 := dValAtu11 * FcdsDemonstrativo.FieldByName('NOVS').AsFloat;
                                          dValAtu12 := dValAtu12 * FcdsDemonstrativo.FieldByName('DEZS').AsFloat;
                                       end;
                                 'D' : begin
                                          if FcdsDemonstrativo.FieldByName('JANS').asFloat <> 0 then begin
                                             dValAtu1 := dValAtu1 / FcdsDemonstrativo.FieldByName('JANS').AsFloat;
                                          end else begin
                                             dValAtu1 := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('FEVS').asFloat <> 0 then begin
                                             dValAtu2 := dValAtu2 / FcdsDemonstrativo.FieldByName('FEVS').AsFloat;
                                          end else begin
                                             dValAtu2 := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('MARS').asFloat <> 0 then begin
                                             dValAtu3 := dValAtu3 / FcdsDemonstrativo.FieldByName('MARS').AsFloat;
                                          end else begin
                                             dValAtu3 := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('ABRS').asFloat <> 0 then begin
                                             dValAtu4 := dValAtu4 / FcdsDemonstrativo.FieldByName('ABRS').AsFloat;
                                          end else begin
                                             dValAtu4 := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('MAIS').asFloat <> 0 then begin
                                             dValAtu5 := dValAtu5 / FcdsDemonstrativo.FieldByName('MAIS').AsFloat;
                                          end else begin
                                             dValAtu5 := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('JUNS').asFloat <> 0 then begin
                                             dValAtu6 := dValAtu6 / FcdsDemonstrativo.FieldByName('JUNS').AsFloat;
                                          end else begin
                                             dValAtu6 := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('JULS').asFloat <> 0 then begin
                                             dValAtu7 := dValAtu7 / FcdsDemonstrativo.FieldByName('JULS').AsFloat;
                                          end else begin
                                             dValAtu7 := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('AGOS').asFloat <> 0 then begin
                                             dValAtu8 := dValAtu8 / FcdsDemonstrativo.FieldByName('AGOS').AsFloat;
                                          end else begin
                                             dValAtu8 := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('SEBS').asFloat <> 0 then begin
                                             dValAtu9 := dValAtu9 / FcdsDemonstrativo.FieldByName('SEBS').AsFloat;
                                          end else begin
                                             dValAtu9 := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('OUTS').asFloat <> 0 then begin
                                             dValAtu10 := dValAtu10 / FcdsDemonstrativo.FieldByName('OUTS').AsFloat;
                                          end else begin
                                             dValAtu10 := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('NOVS').asFloat <> 0 then begin
                                             dValAtu11 := dValAtu11 / FcdsDemonstrativo.FieldByName('NOVS').AsFloat;
                                          end else begin
                                             dValAtu11 := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('DEZS').asFloat <> 0 then begin
                                             dValAtu12 := dValAtu12 / FcdsDemonstrativo.FieldByName('DEZS').AsFloat;
                                          end else begin
                                             dValAtu12 := 0;
                                          end;
                                       end;
                                 'P' : begin
                                          if FcdsDemonstrativo.FieldByName('JANS').asFloat <> 0 then begin
                                             dValAtu1 := (dValAtu1 / FcdsDemonstrativo.FieldByName('JANS').AsFloat) * 100;
                                          end else begin
                                             dValAtu1 := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('FEVS').asFloat <> 0 then begin
                                             dValAtu2 := (dValAtu2 / FcdsDemonstrativo.FieldByName('FEVS').AsFloat) * 100;
                                          end else begin
                                             dValAtu2 := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('MARS').asFloat <> 0 then begin
                                             dValAtu3 := (dValAtu3 / FcdsDemonstrativo.FieldByName('MARS').AsFloat) * 100;
                                          end else begin
                                             dValAtu3 := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('ABRS').asFloat <> 0 then begin
                                             dValAtu4 := (dValAtu4 / FcdsDemonstrativo.FieldByName('ABRS').AsFloat) * 100;
                                          end else begin
                                             dValAtu4 := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('MAIS').asFloat <> 0 then begin
                                             dValAtu5 := (dValAtu5 / FcdsDemonstrativo.FieldByName('MAIS').AsFloat) * 100;
                                          end else begin
                                             dValAtu5 := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('JUNS').asFloat <> 0 then begin
                                             dValAtu6 := (dValAtu6 / FcdsDemonstrativo.FieldByName('JUNS').AsFloat) * 100;
                                          end else begin
                                             dValAtu6 := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('JULS').asFloat <> 0 then begin
                                             dValAtu7 := (dValAtu7 / FcdsDemonstrativo.FieldByName('JULS').AsFloat) * 100;
                                          end else begin
                                             dValAtu7 := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('AGOS').asFloat <> 0 then begin
                                             dValAtu8 := (dValAtu8 / FcdsDemonstrativo.FieldByName('AGOS').AsFloat) * 100;
                                          end else begin
                                             dValAtu8 := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('SEBS').asFloat <> 0 then begin
                                             dValAtu9 := (dValAtu9 / FcdsDemonstrativo.FieldByName('SEBS').AsFloat) * 100;
                                          end else begin
                                             dValAtu9 := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('OUTS').asFloat <> 0 then begin
                                             dValAtu10 := (dValAtu10 / FcdsDemonstrativo.FieldByName('OUTS').AsFloat) * 100;
                                          end else begin
                                             dValAtu10 := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('NOVS').asFloat <> 0 then begin
                                             dValAtu11 := (dValAtu11 / FcdsDemonstrativo.FieldByName('NOVS').AsFloat) * 100;
                                          end else begin
                                             dValAtu11 := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('DEZS').asFloat <> 0 then begin
                                             dValAtu12 := (dValAtu12 / FcdsDemonstrativo.FieldByName('DEZS').AsFloat) * 100;
                                          end else begin
                                             dValAtu12 := 0;
                                          end;
                                       end;
                              end;
                           end else begin
                              bCalc:=False;
                              Break;
                           end;
                        end;
                        FcdsDemonstrativo.Next;
                     end;
                     cdsCompSomatorio.Next;
                  end;
                  // Ponterar CDS
                  FcdsDemonstrativo.GotoBookmark(bmSavePlace);
                  if bCalc then begin
                     Inc(iNumCalc);
                     FcdsDemonstrativo.Edit;
                     FcdsDemonstrativo.FieldByName('JANS').AsFloat := dValAtu1;
                     FcdsDemonstrativo.FieldByName('FEVS').AsFloat := dValAtu2;
                     FcdsDemonstrativo.FieldByName('MARS').AsFloat := dValAtu3;
                     FcdsDemonstrativo.FieldByName('ABRS').AsFloat := dValAtu4;
                     FcdsDemonstrativo.FieldByName('MAIS').AsFloat := dValAtu5;
                     FcdsDemonstrativo.FieldByName('JUNS').AsFloat := dValAtu6;
                     FcdsDemonstrativo.FieldByName('JULS').AsFloat := dValAtu7;
                     FcdsDemonstrativo.FieldByName('AGOS').AsFloat := dValAtu8;
                     FcdsDemonstrativo.FieldByName('SEBS').AsFloat := dValAtu9;
                     FcdsDemonstrativo.FieldByName('OUTS').AsFloat := dValAtu10;
                     FcdsDemonstrativo.FieldByName('NOVS').AsFloat := dValAtu11;
                     FcdsDemonstrativo.FieldByName('DEZS').AsFloat := dValAtu12;

                     if (FcdsDemonstrativo.FieldByName('FLGTIPONEGATIVO').AsString <> 'N') then begin
                        FcdsDemonstrativo.FieldByName('JAN').AsFloat := dValAtu1;
                        FcdsDemonstrativo.FieldByName('FEV').AsFloat := dValAtu2;
                        FcdsDemonstrativo.FieldByName('MAR').AsFloat := dValAtu3;
                        FcdsDemonstrativo.FieldByName('ABR').AsFloat := dValAtu4;
                        FcdsDemonstrativo.FieldByName('MAI').AsFloat := dValAtu5;
                        FcdsDemonstrativo.FieldByName('JUN').AsFloat := dValAtu6;
                        FcdsDemonstrativo.FieldByName('JUL').AsFloat := dValAtu7;
                        FcdsDemonstrativo.FieldByName('AGO').AsFloat := dValAtu8;
                        FcdsDemonstrativo.FieldByName('SEB').AsFloat := dValAtu9;
                        FcdsDemonstrativo.FieldByName('OUT').AsFloat := dValAtu10;
                        FcdsDemonstrativo.FieldByName('NOV').AsFloat := dValAtu11;
                        FcdsDemonstrativo.FieldByName('DEZ').AsFloat := dValAtu12;
                     end else begin
                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValAtu1) then begin
                           FcdsDemonstrativo.FieldByName('JAN').AsFloat := Abs(dValAtu1)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('JAN').AsFloat := Abs(dValAtu1);
                        end;
                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValAtu2) then begin
                           FcdsDemonstrativo.FieldByName('FEV').AsFloat := Abs(dValAtu2)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('FEV').AsFloat := Abs(dValAtu2);
                        end;
                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValAtu3) then begin
                           FcdsDemonstrativo.FieldByName('MAR').AsFloat := Abs(dValAtu3)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('MAR').AsFloat := Abs(dValAtu3);
                        end;
                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValAtu4) then begin
                           FcdsDemonstrativo.FieldByName('ABR').AsFloat := Abs(dValAtu4)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('ABR').AsFloat := Abs(dValAtu4);
                        end;
                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValAtu5) then begin
                           FcdsDemonstrativo.FieldByName('MAI').AsFloat := Abs(dValAtu5)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('MAI').AsFloat := Abs(dValAtu5);
                        end;
                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValAtu6) then begin
                           FcdsDemonstrativo.FieldByName('JUN').AsFloat := Abs(dValAtu6)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('JUN').AsFloat := Abs(dValAtu6);
                        end;
                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValAtu7) then begin
                           FcdsDemonstrativo.FieldByName('JUL').AsFloat := Abs(dValAtu7)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('JUL').AsFloat := Abs(dValAtu7);
                        end;
                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValAtu8) then begin
                           FcdsDemonstrativo.FieldByName('AGO').AsFloat := Abs(dValAtu8)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('AGO').AsFloat := Abs(dValAtu8);
                        end;
                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValAtu9) then begin
                           FcdsDemonstrativo.FieldByName('SEB').AsFloat := Abs(dValAtu9)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('SEB').AsFloat := Abs(dValAtu9);
                        end;
                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValAtu10) then begin
                           FcdsDemonstrativo.FieldByName('OUT').AsFloat := Abs(dValAtu10)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('OUT').AsFloat := Abs(dValAtu10);
                        end;
                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValAtu11) then begin
                           FcdsDemonstrativo.FieldByName('NOV').AsFloat := Abs(dValAtu11)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('NOV').AsFloat := Abs(dValAtu11);
                        end;
                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValAtu12) then begin
                           FcdsDemonstrativo.FieldByName('DEZ').AsFloat := Abs(dValAtu12)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('DEZ').AsFloat := Abs(dValAtu12);
                        end;
                     end;
                     FcdsDemonstrativo.FieldByName('CALCU').AsString    := 'S';
                     FcdsDemonstrativo.Post;
                  end;
               end;
               FcdsDemonstrativo.Next;
            end;
            FcdsDemonstrativo.FreeBookmark(bmSavePlace);
            if not bEntrou then Break;
            if iNumCalc = 0 then begin
               Break;
               Abort;
            end;
         end;

         if not bZerados then
         begin
            FcdsDemonstrativo.First;
            while not FcdsDemonstrativo.EOF do
            begin
               if FcdsDemonstrativo.FieldByName('JAN').asFloat + FcdsDemonstrativo.FieldByName('FEV').asFloat +
                  FcdsDemonstrativo.FieldByName('MAR').asFloat + FcdsDemonstrativo.FieldByName('ABR').asFloat +
                  FcdsDemonstrativo.FieldByName('MAI').asFloat + FcdsDemonstrativo.FieldByName('JUN').asFloat +
                  FcdsDemonstrativo.FieldByName('JUL').asFloat + FcdsDemonstrativo.FieldByName('AGO').asFloat +
                  FcdsDemonstrativo.FieldByName('SEB').asFloat + FcdsDemonstrativo.FieldByName('OUT').asFloat +
                  FcdsDemonstrativo.FieldByName('NOV').asFloat + FcdsDemonstrativo.FieldByName('DEZ').asFloat = 0 then
                begin
                  if FcdsDemonstrativo.FieldByName('ELETIPOELEM').AsString <> 'T' then
                     FcdsDemonstrativo.Delete
                  else
                    FcdsDemonstrativo.Next;
               end else
               begin
                  FcdsDemonstrativo.Next;
               end;
            end;
         end;

         //simula o onclacfield
         FcdsDemonstrativo.First;
         while not FcdsDemonstrativo.eof do
         begin
            FcdsDemonstrativo.edit;

            FcdsDemonstrativo.FieldByName('TOT').asFloat := FcdsDemonstrativo.FieldByName('JANS').asFloat + FcdsDemonstrativo.FieldByName('FEVS').asFloat  +
                                          FcdsDemonstrativo.FieldByName('MARS').asFloat + FcdsDemonstrativo.FieldByName('ABRS').asFloat  +
                                          FcdsDemonstrativo.FieldByName('MAIS').asFloat + FcdsDemonstrativo.FieldByName('JUNS').asFloat  +
                                          FcdsDemonstrativo.FieldByName('JULS').asFloat + FcdsDemonstrativo.FieldByName('AGOS').asFloat  +
                                          FcdsDemonstrativo.FieldByName('SEBS').asFloat + FcdsDemonstrativo.FieldByName('OUTS').asFloat  +
                                          FcdsDemonstrativo.FieldByName('NOVS').asFloat + FcdsDemonstrativo.FieldByName('DEZS').asFloat ;
           FcdsDemonstrativo.post;
           FcdsDemonstrativo.next;
         end;

      Except
        Result := false;
      End;

   Finally
     cdsLancResultado.Free;
     cdsCompConta.Free;
     cdsCompSomatorio.free;
     cdsPeriodoSaldo.free;
     cdsSaldos.Free;
     Free;
   End;


end;


function TCtrlRptDemonstrativo.ProcessaDemoModelo6(iDemo,iPlano,iExercicio,iPeriodoIni,iPeriodoFim:integer;
                                    dEmpresa:Double;sCCusto,sAtivProj,sCodMoeda,sDataFim,
                                    sPacTipoResult,sNatureza:string;bZerados,bDesconsidera:Boolean): Boolean;

var
    sSalto, sOper, sCond,sSql : string;

    dValDeb, dValCre, dValSaldo, dValSaldoAnt,dValorResult,dCotacaoAtu : Double;

    bCalc, bEntrou : Boolean;
    iNumCalc, x, iLinha : Integer;
    bmSavePlace : TBookmark;

    cdsCompConta     :TClientDataSet;
    cdsCompSomatorio :TClientDataSet;
    cdsSaldoAtu      :TClientDataSet;
    cdsSaldoAnt      :TClientDataSet;
    cdsSaldoMov      :TClientDataSet;
    cdsLancResultado :TClientDataSet;


begin
   Result := True;
   cdsCompConta     := TClientDataSet.Create(nil);
   cdsCompSomatorio := TClientDataSet.Create(nil);
   cdsSaldoAtu      := TClientDataSet.Create(nil);
   cdsSaldoAnt      := TClientDataSet.Create(nil);
   cdsSaldoMov      := TClientDataSet.Create(nil);
   cdsLancResultado := TClientDataSet.Create(nil);

   //Faz a query

   With TCMSqlParams.Create(nil) Do
   Try

      Try

         SQL.Clear;
         SQL.Add('SELECT                                                              ');
         SQL.Add('    (0) AS DEB, (0) AS CRE, (0) AS SALDO, (0) AS SALDOANT,          ');
         SQL.Add('    (0) AS DEBSN, (0) AS CRESN, (0) AS SALDOSN, (0) AS SALDOANTSN,  ');
         SQL.Add('    ('' '') AS SALDODEBCRE, ('' '') AS SALDOANTDEBCRE,              ');
         SQL.Add('    (''N'') AS CALCU, ('' '') AS SALTA, E.IDELEMANAVERTICAL,        ');
         SQL.Add('   E.ELEDESCELEM, E.FLGINDENTACAO, E.FLGTIPOLINHA, E.ELEORDEMLINHA, ');
         SQL.Add('   E.IDELEMDEMONSTRAT,E.ELETIPOELEM,E.FLGSALTAPAGINA,E.FLGMONETARIA,');
         SQL.Add('   E.FLGTRACO,E.FLGNEGRITO,E.FLGNATUREZA,E.FLGTIPONEGATIVO,         ');
         SQL.Add('   E.FLGDECIMAIS                                                    ');
         SQL.Add('FROM                                                                ');
         SQL.Add('   ELEMDEMONSTRATIVO E                                              ');
         SQL.Add('WHERE                                                               ');
         SQL.Add('    (E.IDDEMONSTRATIVO =:IDDEMONSTRATIVO)                           ');
         SQL.Add('ORDER BY                                                            ');
         SQL.Add('    E.ELEORDEMLINHA                                                 ');

         Prepare;
         ParamByName('IDDEMONSTRATIVO').asInteger := iDemo;
         FcdsDemonstrativo.Data := Data;

        //zera o acumulador de salto de pagina
        iLinha := 0;
        sSalto := 'N';

        FcdsDemonstrativo.First;
        while not FcdsDemonstrativo.EOF do
        begin

           if sSalto = 'S' then
           begin
              inc(iLinha);
              sSalto := 'N';
           end;

           if FcdsDemonstrativo.FieldByName('FLGSALTAPAGINA').asString = 'S' then
              sSalto := 'S';

           FcdsDemonstrativo.Edit;
           FcdsDemonstrativo.FieldByName('SALTA').asString := IntToStr(iLinha);
           //
           cdsCompConta.Data := ListaCompConta(FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').asInteger);
           //
           sSql := sSqlCompConta;
           //
           if not cdsCompConta.IsEmpty then
           begin
              dValDeb      := 0;
              dValCre      := 0;
              dValSaldoAnt := 0;
              dValSaldo    := 0;

              cdsCompConta.First;
              while not cdsCompConta.EOF do
              begin
                 //=============================================================
                 // Monta sql do Saldo Atual e trata o desconsidera o resul. do
                 // exercicio
                 //=============================================================
                 dValorResult := 0;

                 if (bDesconsidera) and (sPacTipoResult <> '') then
                 begin
                    if sNatureza = 'C' then
                       sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  '
                    else
                       sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';

                    sSql := sSql + 'FROM PLANILHA P, LANCAMENTO L, CENTCUST CC                                              ';
                    sSql := sSql + 'WHERE     (L.PLACONTA LIKE '''+Trim(cdsCompConta.FieldByName('PLACONTA').AsString)+'%'+''')           ';
                    sSql := sSql + '      AND (L.PLANO = '+IntToStr(iPlano)+')                   ';
                    sSql := sSql + '      AND (P.IDPESSOA = '+FloatToStr(dEmpresa)+')              ';
                    sSql := sSql + '      AND (L.TIPCODIGO = '''+sPacTipoResult+''')            ';
                    sSql := sSql + '      AND (P.PEREXERCICIO = '+IntToStr(iExercicio)+')         ';
                    sSql := sSql + '      AND (P.PERNUMERO  <= '+IntToStr(iPeriodoIni)+')           ';
                    sSql := sSql + '      AND (P.PLNCODIGO = L.PLNCODIGO) ';

                    if not cdsCompConta.FieldByName('CODEXTERNO').isNull then
                    begin
                       sSql := sSql + '   AND (CC.CODEXTERNO LIKE '''+Trim(cdsCompConta.FieldByName('CODEXTERNO').AsString)+'%'') ';
                       sSql := sSql + '   AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                    end;


                    if sCCusto <> '' then
                    begin
                       sSql := sSql + ' AND (RTRIM(CC.CODEXTERNO) LIKE '''+Trim(sCCusto)+'%'')';
                       sSql := sSql + ' AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                    end;

                    sSql := sSql + ' AND (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) ) ';


                    if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then
                    begin
                       sSql := sSql + '   AND (L.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                       sSql := sSql + '   AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                    end;
                    if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then
                    begin
                       sSql := sSql + ' AND (L.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                       sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                    end;

                    if sAtivProj <> '' then
                    begin
                      sSql := sSql + ' AND (L.UNIDNEGOC = '+ sAtivProj +')';
                      sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                    end;

                    if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                    begin
                      sSql := sSql + ' AND (L.IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                    end;

                    if not cdsCompConta.fieldByName('IDPATRO').isNull then
                    begin
                      sSql := sSql + ' AND (L.IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                    end;

                     cdsLancResultado.Data := GetDataPacket(sSql);
                     if not cdsLancResultado.IsEmpty then
                     begin
                       dValorResult := cdsLancResultado.FieldByName('SALDO').AsFloat;
                     end;
                  end;
                 // Saldo atual
                 sSql := 'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(PLSDEBITOCORRENTE,NULL,0,PLSDEBITOCORRENTE) -                 ';
                 sSql := sSql + '           DECODE(PLSCREDITOCOR,NULL,0,PLSCREDITOCOR)) AS SALDO       ';
                 sSql := sSql + 'FROM PLANOSALDO PS, CENTCUST CC                                                       ';
                 sSql := sSql + 'WHERE (PS.PLACONTA = '''+cdsCompConta.FieldByName('PLACONTA').AsString+''')  ';
                 sSql := sSql + '      AND (PS.PLANO = '+IntToStr(iPlano)+')                                  ';
                 sSql := sSql + '      AND (PS.IDPESSOA = '+FloatToStr(dEmpresa)+')                           ';
                 sSql := sSql + '      AND (PS.PEREXERCICIO = '+IntToStr(iExercicio)+')                       ';
                 sSql := sSql + '      AND ((PS.PERNUMERO  <= '+IntToStr(iPeriodoIni)+')                         ';
                 sSql := sSql + '      OR   (PS.PERNUMERO  IS NULL))                                          ';


                 if not cdsCompConta.FieldByName('CODEXTERNO').isNull then
                    sSql := sSql + '   AND (CC.CODEXTERNO LIKE '''+Trim(cdsCompConta.FieldByName('CODEXTERNO').AsString)+'%'') ';

                 if sCCusto <> '' then
                 begin
                    sSql := sSql + ' AND (RTRIM(CC.CODEXTERNO) LIKE '''+Trim(sCCusto)+'%'')';
                    sSql := sSql + ' AND (PS.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                 end;

                 sSql := sSql + ' AND (PS.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) ) ';


                 if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then
                    sSql := sSql + '   AND (PS.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';

                 if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then
                    sSql := sSql + '   AND (PS.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';


                 if sAtivProj <> '' then
                    sSql := sSql + ' AND (PS.UNIDNEGOC = '+sAtivProj+')';

                 if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                 begin
                   sSql := sSql + ' AND (PS.IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                 end;

                 if not cdsCompConta.fieldByName('IDPATRO').isNull then
                 begin
                   sSql := sSql + ' AND (PS.IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                 end;

                 cdsSaldoAtu.Data := GetDataPacket(sSql);
                 if not cdsSaldoAtu.IsEmpty then
                 begin
                    dValSaldo := dValSaldo + cdsSaldoAtu.FieldByName('SALDO').AsFloat - dValorResult;
                 end;

                 //============================================================
                 // Monta sql do saldo Anterior  e verifica o desconsidera resultado
                 // do exercicio
                 //============================================================
                 dValorResult := 0;
                 if (bDesconsidera) and (sPacTipoResult <> '') then
                 begin
                    if sNatureza = 'C' then begin
                        sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';
                    end else begin
                        sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';
                    end;
                    sSql := sSql + 'FROM PLANILHA P, LANCAMENTO L, CENTCUST CC                                                       ';
                    sSql := sSql + 'WHERE     (L.PLACONTA LIKE '''+Trim(cdsCompConta.FieldByName('PLACONTA').AsString)+'%'+''')           ';
                    sSql := sSql + '      AND (L.PLANO = '+IntToStr(iPlano)+')                                ';
                    sSql := sSql + '      AND (P.IDPESSOA = '+FloatToStr(dEmpresa)+')                             ';
                    sSql := sSql + '      AND (L.TIPCODIGO = '''+sPacTipoResult+''')            ';
                    sSql := sSql + '      AND (P.PEREXERCICIO = '+IntToStr(iExercicio -1)+')     ';
                    sSql := sSql + '      AND (P.PERNUMERO  <= '+IntToStr(iPeriodoIni)+')                             ';
                    sSql := sSql + '      AND (P.PLNCODIGO = L.PLNCODIGO) ';


                     if not cdsCompConta.FieldByName('CODEXTERNO').isNull then
                    begin
                       sSql := sSql + '   AND (CC.CODEXTERNO LIKE '''+Trim(cdsCompConta.FieldByName('CODEXTERNO').AsString)+'%'') ';
                       sSql := sSql + '   AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                    end;

                    if sCCusto <> '' then
                    begin
                       sSql := sSql + ' AND (RTRIM(CC.CODEXTERNO) LIKE '''+Trim(sCCusto)+'%'')';
                       sSql := sSql + ' AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                    end;

                    sSql := sSql + ' AND (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) ) ';

                    if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then
                    begin
                       sSql := sSql + '   AND (L.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                       sSql := sSql + '   AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                    end;
                    if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then
                    begin
                       sSql := sSql + ' AND (L.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                       sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                    end;

                    if sAtivProj <> '' then
                    begin
                       sSql := sSql + ' AND (L.UNIDNEGOC = '+sAtivProj+')';
                       sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                    end;

                    if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                    begin
                      sSql := sSql + ' AND (L.IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                    end;

                    if not cdsCompConta.fieldByName('IDPATRO').isNull then
                    begin
                      sSql := sSql + ' AND (L.IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                    end;

                    cdsLancResultado.Data := GetDataPacket(sSql);
                    if not cdsLancResultado.IsEmpty then
                    begin
                      dValorResult := cdsLancResultado.FieldByName('SALDO').AsFloat;
                    end;
                 end;

                 sSql :=  'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(PLSDEBITOCORRENTE,NULL,0,PLSDEBITOCORRENTE) -                 ';
                 sSql := sSql + '           DECODE(PLSCREDITOCOR,NULL,0,PLSCREDITOCOR)) AS SALDOANT       ';
                 sSql := sSql + 'FROM PLANOSALDO PS, CENTCUST CC                                          ';
                 sSql := sSql + 'WHERE (PS.PLACONTA = '''+cdsCompConta.FieldByName('PLACONTA').AsString+''') ';
                 sSql := sSql + '      AND (PS.PLANO = '+IntToStr(iPlano)+')                ';
                 sSql := sSql + '      AND (PS.IDPESSOA = '+FloatToStr(dEmpresa)+')         ';
                 sSql := sSql + '      AND (PS.PEREXERCICIO = '+IntToStr(iExercicio)+')     ';
                 sSql := sSql + '      AND ((PS.PERNUMERO  < '+IntToStr(iPeriodoIni) +') ';
                 sSql := sSql + '      OR   (PS.PERNUMERO  IS NULL))                         ';

                 if not cdsCompConta.FieldByName('CODEXTERNO').isNull then
                    sSql := sSql + '   AND (CC.CODEXTERNO LIKE '''+Trim(cdsCompConta.FieldByName('CODEXTERNO').AsString)+'%'') ';

                 if sCCusto <> '' then
                 begin
                    sSql := sSql + ' AND (RTRIM(CC.CODEXTERNO) LIKE '''+Trim(sCCusto)+'%'')';
                    sSql := sSql + ' AND (PS.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                 end;

                 sSql := sSql + ' AND (PS.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) ) ';


                 if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then
                    sSql := sSql + '   AND (PS.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';

                 if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then
                    sSql := sSql + '   AND (PS.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';

                 if sAtivProj <> '' then
                    sSql := sSql + ' AND (PS.UNIDNEGOC = '+sAtivProj+')';

                    
                 if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                 begin
                   sSql := sSql + ' AND (PS.IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                 end;

                 if not cdsCompConta.fieldByName('IDPATRO').isNull then
                 begin
                   sSql := sSql + ' AND (PS.IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                 end;

                 cdsSaldoAnt.Data := GetDataPacket(sSql);

                 if not cdsSaldoAnt.IsEmpty then
                 begin
                    dValSaldoAnt := dValSaldoAnt + cdsSaldoAnt.FieldByName('SALDOANT').AsFloat - dValorResult;
                 end;

                 //=============================================================
                 //Monta sql Movimentação e trata o desconsidera o  resultado
                 // do exercicio
                 //=============================================================
                 dValorResult := 0;
                 if (bDesconsidera) and (sPacTipoResult <> '') then
                 begin
                    if sNatureza = 'C' then begin
                        sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';
                    end else begin
                        sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';
                    end;
                    sSql := sSql + 'FROM PLANILHA P, LANCAMENTO L, CENTCUST CC                                                       ';
                    sSql := sSql + 'WHERE     (L.PLACONTA LIKE '''+Trim(cdsCompConta.FieldByName('PLACONTA').AsString)+'%'+''')           ';
                    sSql := sSql + '      AND (L.PLANO = '+IntToStr(iPlano)+')                                ';
                    sSql := sSql + '      AND (P.IDPESSOA = '+FloatToStr(dEmpresa)+')           ';
                    sSql := sSql + '      AND (L.TIPCODIGO = '''+sPacTipoResult+''')            ';
                    sSql := sSql + '      AND (P.PEREXERCICIO = '+IntToStr(iExercicio -1)+')     ';
                    sSql := sSql + '      AND (P.PERNUMERO  <= '+IntToStr(iPeriodoIni)+')                             ';
                    sSql := sSql + '      AND (P.PLNCODIGO = L.PLNCODIGO) ';

                    if not cdsCompConta.FieldByName('CODEXTERNO').isNull then
                    begin
                       sSql := sSql + '   AND (CC.CODEXTERNO LIKE '''+Trim(cdsCompConta.FieldByName('CODEXTERNO').AsString)+'%'') ';
                       sSql := sSql + '   AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                    end;


                    if sCCusto <> '' then
                    begin
                       sSql := sSql + ' AND (RTRIM(CC.CODEXTERNO) LIKE '''+Trim(sCCusto)+'%'')';
                       sSql := sSql + ' AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                    end;

                    sSql := sSql + ' AND (PS.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) ) ';

                    if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then
                    begin
                       sSql := sSql + '   AND (L.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                       sSql := sSql + '   AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                    end;
                    if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then
                    begin
                       sSql := sSql + ' AND (L.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                       sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                    end;

                    if sAtivProj <> '' then
                    begin
                       sSql := sSql + ' AND (L.UNIDNEGOC = '+sAtivProj+')';
                       sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                    end;

                    if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                    begin
                      sSql := sSql + ' AND (L.IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                    end;

                    if not cdsCompConta.fieldByName('IDPATRO').isNull then
                    begin
                      sSql := sSql + ' AND (L.IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                    end;

                    cdsLancResultado.Data := GetDataPacket(sSql);
                    if not cdsLancResultado.IsEmpty then
                    begin
                      dValorResult := cdsLancResultado.FieldByName('SALDO').AsFloat;
                    end;
                 end;

                 // Movimentacao
                 sSql := 'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(PLSDEBITOCORRENTE) AS DEB,   ';
                 sSql := sSql + '   SUM(PLSCREDITOCOR) AS CRE                            ';
                 sSql := sSql + 'FROM PLANOSALDO PS, CENTCUST CC                                               ';
                 sSql := sSql + 'WHERE (PS.PLACONTA = '''+cdsCompConta.FieldByName('PLACONTA').AsString+''')  ';
                 sSql := sSql + '      AND (PS.PLANO = '+IntToStr(iPlano)+')                             ';
                 sSql := sSql + '      AND (PS.IDPESSOA = '+FloatToStr(dEmpresa)+')                           ';
                 sSql := sSql + '      AND (PS.PEREXERCICIO = '+IntToStr(iExercicio)+')     ';
                 sSql := sSql + '      AND (PS.PERNUMERO BETWEEN '+IntToStr(iPeriodoIni) +' AND '+ IntToStr(iPeriodoFim)+') ';

                 if not cdsCompConta.FieldByName('CODEXTERNO').isNull then
                    sSql := sSql + '   AND (CC.CODEXTERNO LIKE '''+Trim(cdsCompConta.FieldByName('CODEXTERNO').AsString)+'%'') ';

                 if sCCusto <> '' then
                 begin
                    sSql := sSql + ' AND (RTRIM(CC.CODEXTERNO) LIKE '''+Trim(sCCusto)+'%'')';
                    sSql := sSql + ' AND (PS.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                 end;

                 sSql := sSql + ' AND (PS.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) ) ';

                 if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then
                    sSql := sSql + '   AND (PS.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';

                 if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then
                    sSql := sSql + '   AND (PS.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';

                 if sAtivProj <> '' then
                 begin
                    sSql := sSql + ' AND (PS.UNIDNEGOC = '+sAtivProj+')';
                 end;


                 if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                 begin
                   sSql := sSql + ' AND (PS.IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                 end;

                 if not cdsCompConta.fieldByName('IDPATRO').isNull then
                 begin
                   sSql := sSql + ' AND (PS.IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                 end;

                 cdsSaldoMov.Data := GetDataPacket(sSql);

                 if not cdsSaldoMov.IsEmpty then
                 begin
                    //FazUPdate do Ano Anterior
                    dValDeb := dValDeb + cdsSaldoMov.FieldByName('DEB').AsFloat - dValorResult;
                    dValCre := dValCre + cdsSaldoMov.FieldByName('CRE').AsFloat - dValorResult;
                 end;

                 cdsCompConta.Next;
              end;


              if (sCodMoeda <> '') and (FcdsDemonstrativo.FieldByName('FLGMONETARIA').AsString = 'S') then
              begin

                 dCotacaoAtu := Contab.TestaCotacaoMoeda(StrToInt(sCodMoeda),StrToDate(sDataFim),False);

                 dValDeb      := (dValDeb/dCotacaoAtu);
                 dValCre      := (dValCre/dCotacaoAtu);
                 dValSaldoAnt := (dValSaldoAnt/dCotacaoAtu);
                 dValSaldo    := (dValSaldo/dCotacaoAtu);

              end;
              FcdsDemonstrativo.Edit;
              FcdsDemonstrativo.FieldByName('DEB').AsFloat      := dValDeb;
              FcdsDemonstrativo.FieldByName('CRE').AsFloat      := dValCre;
              FcdsDemonstrativo.FieldByName('SALDO').AsFloat    := dValSaldo;
              FcdsDemonstrativo.FieldByName('SALDOANT').AsFloat := dValSaldoAnt;

              FcdsDemonstrativo.FieldByName('DEBSN').AsFloat      := Abs(dValDeb);
              FcdsDemonstrativo.FieldByName('CRESN').AsFloat      := Abs(dValCre);
              FcdsDemonstrativo.FieldByName('SALDOSN').AsFloat    := Abs(dValSaldo);
              FcdsDemonstrativo.FieldByName('SALDOANTSN').AsFloat := Abs(dValSaldoAnt);

              if dValSaldoAnt < 0 then
                 FcdsDemonstrativo.FieldByName('SALDOANTDEBCRE').asString := 'C'
              else
                 FcdsDemonstrativo.FieldByName('SALDOANTDEBCRE').asString := 'D';

              if dValSaldo < 0 then
                 FcdsDemonstrativo.FieldByName('SALDODEBCRE').asString := 'C'
              else
                 FcdsDemonstrativo.FieldByName('SALDODEBCRE').asString := 'D';

              FcdsDemonstrativo.FieldByName('CALCU').AsString    := 'S';
              FcdsDemonstrativo.Post;
           end; //
           FcdsDemonstrativo.Next;
        end; //

        x := 1;
        iNumCalc:=0;
        While x = 1 do
        begin
           bEntrou:=False;
           FcdsDemonstrativo.First;
           bmSavePlace := FcdsDemonstrativo.GetBookmark;
           While not FcdsDemonstrativo.EOF do
           begin
              if FcdsDemonstrativo.FieldByName('CALCU').AsString <> 'S' then
              begin
                 bEntrou:=True;

                 cdsCompSomatorio.Data := ListaCompSomatorio(FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').asInteger);

                 bCalc        := True;
                 dValDeb      := 0;
                 dValCre      := 0;
                 dValSaldoAnt := 0;
                 dValSaldo    := 0;

                 // Salvar Ponteiro
                 bmSavePlace := FcdsDemonstrativo.GetBookmark;
                 cdsCompSomatorio.First;
                 While not cdsCompSomatorio.EOF do
                 begin
                    FcdsDemonstrativo.First;
                    While not FcdsDemonstrativo.EOF do
                    begin
                       if cdsCompSomatorio.FieldByName('ELEMENTODEM').AsInteger =
                          FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').AsInteger then
                       begin

                          //Verificaçao do tipo de operação para cálculo da fórmula
                          sOper := cdsCompSomatorio.FieldByName('FLGOPERACAO').asString;

                          if FcdsDemonstrativo.FieldByName('CALCU').AsString = 'S' then
                          begin
                             case sOPer[1] of

                                'S' : begin
                                         dValSaldo    := (dValSaldo + FcdsDemonstrativo.FieldByName('SALDO').AsFloat);
                                         dValSaldoAnt := (dValSaldoAnt + FcdsDemonstrativo.FieldByName('SALDOANT').AsFloat);
                                         dValDeb      := (dValDeb + FcdsDemonstrativo.FieldByName('DEB').AsFloat);
                                         dValCre      := (dValCre + FcdsDemonstrativo.FieldByName('CRE').AsFloat);
                                      end;

                                'U' : begin
                                         dValSaldo    := (dValSaldo - FcdsDemonstrativo.FieldByName('SALDO').AsFloat);
                                         dValSaldoAnt := (dValSaldoAnt - FcdsDemonstrativo.FieldByName('SALDOANT').AsFloat);
                                         dValDeb      := (dValDeb - FcdsDemonstrativo.FieldByName('DEB').AsFloat);
                                         dValCre      := (dValCre - FcdsDemonstrativo.FieldByName('CRE').AsFloat);
                                      end;

                                'M' : begin
                                         dValSaldo    := (dValSaldo    * FcdsDemonstrativo.FieldByName('SALDO').AsFloat);
                                         dValSaldoAnt := (dValSaldoAnt * FcdsDemonstrativo.FieldByName('SALDOANT').AsFloat);
                                         dValDeb      := (dValDeb      * FcdsDemonstrativo.FieldByName('DEB').AsFloat);
                                         dValCre      := (dValCre      * FcdsDemonstrativo.FieldByName('CRE').AsFloat);
                                      end;

                                'D' : begin
                                         if FcdsDemonstrativo.FieldByName('SALDO').asFloat <> 0 then
                                            dValSaldo := (dValSaldo / FcdsDemonstrativo.FieldByName('SALDO').AsFloat)
                                         else
                                            dValSaldo := 0;
                                         //-------------------------------------
                                         if FcdsDemonstrativo.FieldByName('SALDOANT').asFloat <> 0 then
                                            dValSaldoAnt := (dValSaldoAnt * FcdsDemonstrativo.FieldByName('SALDOANT').AsFloat)
                                         else
                                            dValSaldoAnt := 0;
                                         //-------------------------------------
                                         if FcdsDemonstrativo.FieldByName('DEB').asFloat <> 0 then
                                            dValDeb := (dValDeb * FcdsDemonstrativo.FieldByName('DEB').AsFloat)
                                         else
                                            dValDeb := 0;
                                         //-------------------------------------
                                         if FcdsDemonstrativo.FieldByName('CRE').asFloat <> 0 then
                                            dValCre := (dValCre * FcdsDemonstrativo.FieldByName('CRE').AsFloat)
                                         else
                                            dValCre := 0;
                                         //-------------------------------------
                                      end;

                                'P' : begin
                                         if FcdsDemonstrativo.FieldByName('SALDO').asFloat <> 0 then
                                            dValSaldo := (dValSaldo / FcdsDemonstrativo.FieldByName('SALDO').AsFloat) * 100
                                         else
                                            dValSaldo := 0;
                                         //-------------------------------------
                                         if FcdsDemonstrativo.FieldByName('SALDOANT').asFloat <> 0 then
                                            dValSaldoAnt := (dValSaldoAnt / FcdsDemonstrativo.FieldByName('SALDOANT').AsFloat) * 100
                                         else
                                            dValSaldoAnt := 0;
                                         //-------------------------------------
                                         if FcdsDemonstrativo.FieldByName('DEB').asFloat <> 0 then
                                            dValDeb := (dValDeb / FcdsDemonstrativo.FieldByName('DEB').AsFloat) * 100
                                         else
                                            dValDeb := 0;
                                         //-------------------------------------
                                         if FcdsDemonstrativo.FieldByName('CRE').asFloat <> 0 then
                                            dValCre := (dValCre / FcdsDemonstrativo.FieldByName('CRE').AsFloat) * 100
                                         else
                                            dValCre := 0;
                                      end;
                             end;
                          end else
                          begin
                             bCalc:=False;
                             Break;
                          end;
                       end;
                       FcdsDemonstrativo.Next;
                    end;
                    cdsCompSomatorio.Next;
                 end;

                 // Ponterar Query
                 FcdsDemonstrativo.GotoBookmark(bmSavePlace);
                 if bCalc then
                 begin
                    Inc(iNumCalc);
                    FcdsDemonstrativo.Edit;

                    FcdsDemonstrativo.FieldByName('DEB').AsFloat      := dValDeb;
                    FcdsDemonstrativo.FieldByName('CRE').AsFloat      := dValCre;
                    FcdsDemonstrativo.FieldByName('SALDO').AsFloat    := dValSaldo;
                    FcdsDemonstrativo.FieldByName('SALDOANT').AsFloat := dValSaldoAnt;

                    FcdsDemonstrativo.FieldByName('DEBSN').AsFloat      := Abs(dValDeb);
                    FcdsDemonstrativo.FieldByName('CRESN').AsFloat      := Abs(dValCre);
                    FcdsDemonstrativo.FieldByName('SALDOSN').AsFloat    := Abs(dValSaldo);
                    FcdsDemonstrativo.FieldByName('SALDOANTSN').AsFloat := Abs(dValSaldoAnt);

                    if dValSaldoAnt < 0 then
                       FcdsDemonstrativo.FieldByName('SALDOANTDEBCRE').asString := 'C'
                    else
                       FcdsDemonstrativo.FieldByName('SALDOANTDEBCRE').asString := 'D';

                    if dValSaldo < 0 then
                       FcdsDemonstrativo.FieldByName('SALDODEBCRE').asString := 'C'
                    else
                       FcdsDemonstrativo.FieldByName('SALDODEBCRE').asString := 'D';

                    FcdsDemonstrativo.FieldByName('CALCU').AsString    := 'S';
                    FcdsDemonstrativo.Post;
                 end;
              end;
              FcdsDemonstrativo.Next;
           end;

           FcdsDemonstrativo.FreeBookmark(bmSavePlace);
           if not bEntrou then Break;
           if iNumCalc = 0 then
           begin
              Break;
              Abort;
           end;
        end;

        if not bZerados then
        begin
           FcdsDemonstrativo.First;
           while not FcdsDemonstrativo.EOF do
           begin
              if (FcdsDemonstrativo.FieldByName('DEB').asFloat  + FcdsDemonstrativo.FieldByName('CRE').asFloat +
                 FcdsDemonstrativo.FieldByName('SALDO').asFloat + FcdsDemonstrativo.FieldByName('SALDOANT').asFloat) = 0 then
                 FcdsDemonstrativo.Delete
              else
                 FcdsDemonstrativo.Next;
           end;
        end;

      Except
        Result := false;
      End;

   Finally
      cdsCompConta.free;
      cdsCompSomatorio.free;
      cdsSaldoAtu.free;
      cdsSaldoAnt.free;
      cdsSaldoMov.free;
      cdsLancResultado.free;
      Free;
   End;


end;


function TCtrlRptDemonstrativo.FazFormula(dValor1, dValor2: double; sTipo,
                              sCondicao: string; dValor3: double; bApenasCompara: boolean): double;
begin
   if bApenasCompara then
      Result := dValor1
   else
      case sTipo[1] of
         'S' : result := dValor1 + dValor2;
         'U' : result := dValor1 - dValor2;
         'M' : result := dValor1 * dValor2;
         'D' : if dValor2 <> 0 then
                  result := dValor1 / dValor2
               else
                  result := 0;
         'P' : if dValor2 <> 0 then
                  result := (dValor1 / dValor2) * 100
               else
                  result := 0;
         else result := 0;
      end;

   if sCondicao <> '' then begin
      if sCondicao = '>=' then
         if not (result >= dValor3) then result := 0;
      if sCondicao = '<=' then
         if not (result <= dValor3) then result := 0;
      if sCondicao = '>' then
         if not (result > dValor3) then result := 0;
      if sCondicao = '<' then
         if not (result < dValor3) then result := 0;
      if sCondicao = '=' then
         if not (result = dValor3) then result := 0;
      if sCondicao = '<>' then
         if not (result <> dValor3) then result := 0;
   end;

end;


procedure TCtrlRptDemonstrativo.SetCdsDemoLayoutTipo(
  const Value: TClientDataSet);
begin

     FcdsDemoLayoutTipo := Value;

end;

function TCtrlRptDemonstrativo.MontaSqlDemoBalPatr(iDemo,iPlano,iExercicio,iPeriodoIni,
                         iPeriodoFim:Integer;dEmpresa:Double;sNatureza,sCCustoIni,sAtivProj,
                         sPlano,sPatro,sCodMoedaReal,sCodMoedaOrc,sPerDataAtu,sAtivSel:string;
                         bDivide:Boolean) :Boolean;

var sSql, sColuna, sNumLin, sField, sFieldEAN : string;
    dValAtu, dValEAN, dCotacaoAtu : Double;
    j, iDiv : Integer;

   cdsSaldos      :TClientDataSet;
   cdsCompConta   :TClientDataSet;
   cdsBalPatr     :TClientDataSet;
   cdsElemBalPatr :TClientDataSet;

   sNomePer1,sNomePer2,sNomeCCusto,sNomeAtivProj,sDataFim :string;


begin
   cdsSaldos      := TClientDataSet.Create(nil);
   cdsCompConta   := TClientDataSet.Create(nil);
   cdsBalPatr     := TClientDataSet.Create(nil);
   cdsElemBalPatr := TClientDataSet.Create(nil);

   if bDivide then
      iDiv := 1000
   else
      iDiv := 1;

   With TCMSqlParams.Create(nil) Do
   Try

      Try

         SQL.Clear;
         SQL.Add('SELECT                                                                                ');
         SQL.Add('   (''                               '') as PATRO,       ');
         SQL.Add('   (''                               '') as PLANO,       ');

         SQL.Add('   (0) AS Pos01Col1Valor, (''                                                  '') AS Pos01Col1Descr, ');
         SQL.Add('   (0) AS Pos02Col1Valor, (''                                                  '') AS Pos02Col1Descr, ');
         SQL.Add('   (0) AS Pos03Col1Valor, (''                                                  '') AS Pos03Col1Descr, ');
         SQL.Add('   (0) AS Pos04Col1Valor, (''                                                  '') AS Pos04Col1Descr, ');
         SQL.Add('   (0) AS Pos05Col1Valor, (''                                                  '') AS Pos05Col1Descr, ');
         SQL.Add('   (0) AS Pos06Col1Valor, (''                                                  '') AS Pos06Col1Descr, ');
         SQL.Add('   (0) AS Pos07Col1Valor, (''                                                  '') AS Pos07Col1Descr, ');
         SQL.Add('   (0) AS Pos08Col1Valor, (''                                                  '') AS Pos08Col1Descr, ');
         SQL.Add('   (0) AS Pos09Col1Valor, (''                                                  '') AS Pos09Col1Descr, ');
         SQL.Add('   (0) AS Pos10Col1Valor, (''                                                  '') AS Pos10Col1Descr, ');
         SQL.Add('   (0) AS Pos11Col1Valor, (''                                                  '') AS Pos11Col1Descr, ');
         SQL.Add('   (0) AS Pos12Col1Valor, (''                                                  '') AS Pos12Col1Descr, ');
         SQL.Add('   (0) AS Pos13Col1Valor, (''                                                  '') AS Pos13Col1Descr, ');
         SQL.Add('   (0) AS Pos14Col1Valor, (''                                                  '') AS Pos14Col1Descr, ');
         SQL.Add('   (0) AS Pos15Col1Valor, (''                                                  '') AS Pos15Col1Descr, ');
         SQL.Add('   (0) AS Pos16Col1Valor, (''                                                  '') AS Pos16Col1Descr, ');
         SQL.Add('   (0) AS Pos17Col1Valor, (''                                                  '') AS Pos17Col1Descr, ');
         SQL.Add('   (0) AS Pos18Col1Valor, (''                                                  '') AS Pos18Col1Descr, ');
         SQL.Add('   (0) AS Pos19Col1Valor, (''                                                  '') AS Pos19Col1Descr, ');
         SQL.Add('   (0) AS Pos20Col1Valor, (''                                                  '') AS Pos20Col1Descr, ');
         SQL.Add('   (0) AS Pos21Col1Valor, (''                                                  '') AS Pos21Col1Descr, ');
         SQL.Add('   (0) AS Pos22Col1Valor, (''                                                  '') AS Pos22Col1Descr, ');
         SQL.Add('   (0) AS Pos23Col1Valor, (''                                                  '') AS Pos23Col1Descr, ');
         SQL.Add('   (0) AS Pos24Col1Valor, (''                                                  '') AS Pos24Col1Descr, ');
         SQL.Add('   (0) AS Pos25Col1Valor, (''                                                  '') AS Pos25Col1Descr, ');
         SQL.Add('   (0) AS Pos26Col1Valor, (''                                                  '') AS Pos26Col1Descr, ');
         SQL.Add('   (0) AS Pos27Col1Valor, (''                                                  '') AS Pos27Col1Descr, ');
         SQL.Add('   (0) AS Pos28Col1Valor, (''                                                  '') AS Pos28Col1Descr, ');
         SQL.Add('   (0) AS Pos29Col1Valor, (''                                                  '') AS Pos29Col1Descr, ');
         SQL.Add('   (0) AS Pos30Col1Valor, (''                                                  '') AS Pos30Col1Descr, ');
         SQL.Add('   (0) AS Pos01Col2Valor, (''                                                  '') AS Pos01Col2Descr, ');
         SQL.Add('   (0) AS Pos02Col2Valor, (''                                                  '') AS Pos02Col2Descr, ');
         SQL.Add('   (0) AS Pos03Col2Valor, (''                                                  '') AS Pos03Col2Descr, ');
         SQL.Add('   (0) AS Pos04Col2Valor, (''                                                  '') AS Pos04Col2Descr, ');
         SQL.Add('   (0) AS Pos05Col2Valor, (''                                                  '') AS Pos05Col2Descr, ');
         SQL.Add('   (0) AS Pos06Col2Valor, (''                                                  '') AS Pos06Col2Descr, ');
         SQL.Add('   (0) AS Pos07Col2Valor, (''                                                  '') AS Pos07Col2Descr, ');
         SQL.Add('   (0) AS Pos08Col2Valor, (''                                                  '') AS Pos08Col2Descr, ');
         SQL.Add('   (0) AS Pos09Col2Valor, (''                                                  '') AS Pos09Col2Descr, ');
         SQL.Add('   (0) AS Pos10Col2Valor, (''                                                  '') AS Pos10Col2Descr, ');
         SQL.Add('   (0) AS Pos11Col2Valor, (''                                                  '') AS Pos11Col2Descr, ');
         SQL.Add('   (0) AS Pos12Col2Valor, (''                                                  '') AS Pos12Col2Descr, ');
         SQL.Add('   (0) AS Pos13Col2Valor, (''                                                  '') AS Pos13Col2Descr, ');
         SQL.Add('   (0) AS Pos14Col2Valor, (''                                                  '') AS Pos14Col2Descr, ');
         SQL.Add('   (0) AS Pos15Col2Valor, (''                                                  '') AS Pos15Col2Descr, ');
         SQL.Add('   (0) AS Pos16Col2Valor, (''                                                  '') AS Pos16Col2Descr, ');
         SQL.Add('   (0) AS Pos17Col2Valor, (''                                                  '') AS Pos17Col2Descr, ');
         SQL.Add('   (0) AS Pos18Col2Valor, (''                                                  '') AS Pos18Col2Descr, ');
         SQL.Add('   (0) AS Pos19Col2Valor, (''                                                  '') AS Pos19Col2Descr, ');
         SQL.Add('   (0) AS Pos20Col2Valor, (''                                                  '') AS Pos20Col2Descr, ');
         SQL.Add('   (0) AS Pos21Col2Valor, (''                                                  '') AS Pos21Col2Descr, ');
         SQL.Add('   (0) AS Pos22Col2Valor, (''                                                  '') AS Pos22Col2Descr, ');
         SQL.Add('   (0) AS Pos23Col2Valor, (''                                                  '') AS Pos23Col2Descr, ');
         SQL.Add('   (0) AS Pos24Col2Valor, (''                                                  '') AS Pos24Col2Descr, ');
         SQL.Add('   (0) AS Pos25Col2Valor, (''                                                  '') AS Pos25Col2Descr, ');
         SQL.Add('   (0) AS Pos26Col2Valor, (''                                                  '') AS Pos26Col2Descr, ');
         SQL.Add('   (0) AS Pos27Col2Valor, (''                                                  '') AS Pos27Col2Descr, ');
         SQL.Add('   (0) AS Pos28Col2Valor, (''                                                  '') AS Pos28Col2Descr, ');
         SQL.Add('   (0) AS Pos29Col2Valor, (''                                                  '') AS Pos29Col2Descr, ');
         SQL.Add('   (0) AS Pos30Col2Valor, (''                                                  '') AS Pos30Col2Descr, ');
         SQL.Add('   (0) AS Pos31Col1Valor, (''                                                  '') AS Pos31Col1Descr, ');
         SQL.Add('   (0) AS Pos32Col1Valor, (''                                                  '') AS Pos32Col1Descr, ');
         SQL.Add('   (0) AS Pos33Col1Valor, (''                                                  '') AS Pos33Col1Descr, ');
         SQL.Add('   (0) AS Pos34Col1Valor, (''                                                  '') AS Pos34Col1Descr, ');
         SQL.Add('   (0) AS Pos35Col1Valor, (''                                                  '') AS Pos35Col1Descr, ');
         SQL.Add('   (0) AS Pos36Col1Valor, (''                                                  '') AS Pos36Col1Descr, ');
         SQL.Add('   (0) AS Pos37Col1Valor, (''                                                  '') AS Pos37Col1Descr, ');
         SQL.Add('   (0) AS Pos38Col1Valor, (''                                                  '') AS Pos38Col1Descr, ');
         SQL.Add('   (0) AS Pos39Col1Valor, (''                                                  '') AS Pos39Col1Descr, ');
         SQL.Add('   (0) AS Pos40Col1Valor, (''                                                  '') AS Pos40Col1Descr, ');
         SQL.Add('   (0) AS Pos31Col2Valor, (''                                                  '') AS Pos31Col2Descr, ');
         SQL.Add('   (0) AS Pos32Col2Valor, (''                                                  '') AS Pos32Col2Descr, ');
         SQL.Add('   (0) AS Pos33Col2Valor, (''                                                  '') AS Pos33Col2Descr, ');
         SQL.Add('   (0) AS Pos34Col2Valor, (''                                                  '') AS Pos34Col2Descr, ');
         SQL.Add('   (0) AS Pos35Col2Valor, (''                                                  '') AS Pos35Col2Descr, ');
         SQL.Add('   (0) AS Pos36Col2Valor, (''                                                  '') AS Pos36Col2Descr, ');
         SQL.Add('   (0) AS Pos37Col2Valor, (''                                                  '') AS Pos37Col2Descr, ');
         SQL.Add('   (0) AS Pos38Col2Valor, (''                                                  '') AS Pos38Col2Descr, ');
         SQL.Add('   (0) AS Pos39Col2Valor, (''                                                  '') AS Pos39Col2Descr, ');
         SQL.Add('   (0) AS Pos40Col2Valor, (''                                                  '') AS Pos40Col2Descr, ');
         SQL.Add('   (0) AS Pos01Col1SalEANT, (0) AS Pos02Col1SalEANT, (0) AS Pos03Col1SalEANT, (0) AS Pos04Col1SalEANT,');
         SQL.Add('   (0) AS Pos05Col1SalEANT, (0) AS Pos06Col1SalEANT, (0) AS Pos07Col1SalEANT, (0) AS Pos08Col1SalEANT,');
         SQL.Add('   (0) AS Pos09Col1SalEANT, (0) AS Pos10Col1SalEANT, (0) AS Pos11Col1SalEANT, (0) AS Pos12Col1SalEANT,');
         SQL.Add('   (0) AS Pos13Col1SalEANT, (0) AS Pos14Col1SalEANT, (0) AS Pos15Col1SalEANT, (0) AS Pos16Col1SalEANT,');
         SQL.Add('   (0) AS Pos17Col1SalEANT, (0) AS Pos18Col1SalEANT, (0) AS Pos19Col1SalEANT, (0) AS Pos20Col1SalEANT,');
         SQL.Add('   (0) AS Pos21Col1SalEANT, (0) AS Pos22Col1SalEANT, (0) AS Pos23Col1SalEANT, (0) AS Pos24Col1SalEANT,');
         SQL.Add('   (0) AS Pos25Col1SalEANT, (0) AS Pos26Col1SalEANT, (0) AS Pos27Col1SalEANT, (0) AS Pos28Col1SalEANT,');
         SQL.Add('   (0) AS Pos29Col1SalEANT, (0) AS Pos30Col1SalEANT, ');
         SQL.Add('   (0) AS Pos01Col2SalEANT, (0) AS Pos02Col2SalEANT, (0) AS Pos03Col2SalEANT, (0) AS Pos04Col2SalEANT,');
         SQL.Add('   (0) AS Pos05Col2SalEANT, (0) AS Pos06Col2SalEANT, (0) AS Pos07Col2SalEANT, (0) AS Pos08Col2SalEANT,');
         SQL.Add('   (0) AS Pos09Col2SalEANT, (0) AS Pos10Col2SalEANT, (0) AS Pos11Col2SalEANT, (0) AS Pos12Col2SalEANT,');
         SQL.Add('   (0) AS Pos13Col2SalEANT, (0) AS Pos14Col2SalEANT, (0) AS Pos15Col2SalEANT, (0) AS Pos16Col2SalEANT,');
         SQL.Add('   (0) AS Pos17Col2SalEANT, (0) AS Pos18Col2SalEANT, (0) AS Pos19Col2SalEANT, (0) AS Pos20Col2SalEANT,');
         SQL.Add('   (0) AS Pos21Col2SalEANT, (0) AS Pos22Col2SalEANT, (0) AS Pos23Col2SalEANT, (0) AS Pos24Col2SalEANT,');
         SQL.Add('   (0) AS Pos25Col2SalEANT, (0) AS Pos26Col2SalEANT, (0) AS Pos27Col2SalEANT, (0) AS Pos28Col2SalEANT,');
         SQL.Add('   (0) AS Pos29Col2SalEANT, (0) AS Pos30Col2SalEANT, ');
         SQL.Add('   (0) AS Pos31Col1SalEANT, (0) AS Pos32Col1SalEANT, (0) AS Pos33Col1SalEANT, (0) AS Pos34Col1SalEANT,');
         SQL.Add('   (0) AS Pos35Col1SalEANT, (0) AS Pos36Col1SalEANT, (0) AS Pos37Col1SalEANT, (0) AS Pos38Col1SalEANT,');
         SQL.Add('   (0) AS Pos39Col1SalEANT, (0) AS Pos40Col1SalEANT, ');
         SQL.Add('   (0) AS Pos31Col2SalEANT, (0) AS Pos32Col2SalEANT, (0) AS Pos33Col2SalEANT, (0) AS Pos34Col2SalEANT,');
         SQL.Add('   (0) AS Pos35Col2SalEANT, (0) AS Pos36Col2SalEANT, (0) AS Pos37Col2SalEANT, (0) AS Pos38Col2SalEANT,');
         SQL.Add('   (0) AS Pos39Col2SalEANT, (0) AS Pos40Col2SalEANT, ');
         SQL.Add('   (''          '') AS CCusto, (''          '') AS AtivProj, (''         '') AS DATAULTDIA,           ');
         SQL.Add('   (''               '') AS PERIODOINI, (''               '') AS PERIODOFIM, (''    '') AS EXERCICIO, ');

         SQL.Add('   (''    '') AS EXERCICIOANT ');

         SQL.Add('FROM                                                                                                  ');
         SQL.Add('   PESSOA WHERE IDPESSOA=:IDPESSOA                                                                    ');

         Prepare;
         ParamByName('IDPESSOA').asFloat := dEmpresa;
         FcdsDemoLayoutTipo.Data := Data;
         FcdsDemoLayoutTipo.First;
         FcdsDemoLayoutTipo.Edit;

         // pega o nome do periodo inicial e o final
         cdsTitulos.Data := ListaDadosPeriodo(dEmpresa,iExercicio,iPeriodoIni);
         sNomePer1 := cdsTitulos.FieldByName('PERNOME').asString;

         cdsTitulos.Data := ListaDadosPeriodo(dEmpresa,iExercicio,iPeriodoFim);
         sNomePer2 := cdsTitulos.FieldByName('PERNOME').asString;
         sDataFim  := cdsTitulos.FieldByName('PERDATFIM').asString;

         // pega nome da Atividade e projeto se tiver
         if sAtivProj <> '' then
         begin
           cdsTitulos.Data := ListaNomeAtivProj(dEmpresa,sAtivProj);
           sNomeAtivProj := cdsTitulos.FieldByName('NOME').asString;
         end else
           sNomeAtivProj := '';

         // pega nome do centro de custo se tiver
         if sCCustoIni <> '' then
         begin
           cdsTitulos.Data := ListaNomeCCusto(dEmpresa,sCCustoIni);
           sNomeCCusto := cdsTitulos.FieldByName('NOME').asString;
         end else
           sNomeCCusto := '';

         ListaPlanoPatro(StrToInt( sPlano ), StrToInt( sPatro ) );
         FcdsDemoLayoutTipo.FieldByName('Plano').asString := sNomePlano;
         FcdsDemoLayoutTipo.FieldByName('Patro').asString := sNomePatro;

         for j:= 1 to 80 do begin

            //pega o Elemento do Demonstrativo da Posição
            cdsBalPatr.Data := ListaCdsBalPatr(iDemo,j);


            if not cdsBalPatr.isEmpty then begin

               //Pega os dados do elemento
               cdsElemBalPatr.Data := ListaCdsElemBalPatr(iDemo,cdsBalPatr.FieldByName('IDELEMDEMONSTRAT').asInteger);

               cdsCompConta.Data := ListaCompConta(cdsBalPatr.FieldByName('IDELEMDEMONSTRAT').asInteger);

               //
               if not cdsCompConta.IsEmpty then begin
                  dValAtu:=0;
                  dValEAN := 0;
                  cdsCompConta.First;
                  while not cdsCompConta.EOF do begin
                     //Ano Atual
                     if sNatureza = 'C' then begin
                        sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(PLSCREDITOCOR,NULL,0,PLSCREDITOCOR) -               ';
                        sSql := sSql + '           DECODE(PLSDEBITOCORRENTE,NULL,0,PLSDEBITOCORRENTE)) AS SALDO        ';
                     end else begin
                        sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(PLSDEBITOCORRENTE,NULL,0,PLSDEBITOCORRENTE) -                 ';
                        sSql := sSql + '           DECODE(PLSCREDITOCOR,NULL,0,PLSCREDITOCOR)) AS SALDO       ';
                     end;
                     sSql := sSql + 'FROM PLANOSALDO                                                                    ';
                     sSql := sSql + 'WHERE (PLACONTA = '''+cdsCompConta.FieldByName('PLACONTA').AsString+''')           ';
                     sSql := sSql + '      AND (PLANO = '+IntToStr(iPlano)+')                                ';
                     sSql := sSql + '      AND (IDPESSOA = '+FloatToStr(dEmpresa)+')                             ';
                     sSql := sSql + '      AND (PEREXERCICIO = '+IntToStr(iExercicio)+')                           ';

                     //  Aqui é necessário pegar sempre o primeiro período (Janeiro)
                     sSql := sSql + '      AND ((PERNUMERO BETWEEN 1 AND '+ IntToStr(iPeriodoFim) +') OR PERNUMERO IS NULL)  ';

                     if not cdsCompConta.FieldByName('CODCENTROCUSTO').isNull then begin
                        sSql := sSql + '   AND (CODCENTROCUSTO LIKE '''+cdsCompConta.FieldByName('CODCENTROCUSTO').AsString+'%'') ';
                     end;
                     if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                        sSql := sSql + '   AND (UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                     end;
                     if not cdsCompConta.FieldByName('IDPATRO').isNull then begin
                        sSql := sSql + '   AND (IDPATRO = '+cdsCompConta.FieldByName('IDPATRO').AsString+') ';
                     end;
                     if not cdsCompConta.FieldByName('IDPLANOPREV').isNull then begin
                        sSql := sSql + '   AND (IDPLANOPREV = '+cdsCompConta.FieldByName('IDPLANOPREV').AsString+') ';
                     end;
                     if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                        sSql := sSql + '   AND (CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                     end;
                     if sCCustoIni <> '' then begin
                        sSql := sSql + ' AND (RTRIM(CODCENTROCUSTO) LIKE '''+sCCustoIni+'%'')';
                        sSql := sSql + ' AND (IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                     end;
                     if trim(sAtivSel) <> '' then begin
                        sSql := sSql + ' AND  (UNIDNEGOC IN (' + trim(sAtivSel) + ')) ';
                     end;
                     if sAtivProj <> '' then begin
                        sSql := sSql + ' AND (UNIDNEGOC = '+sAtivProj+')';
                     end;


                     if sPlano <> '' then begin
                        sSql := sSql + ' AND (IDPLANOPREV IN (' + sPlano + '))';
                     end;
                     if sPatro <> '' then begin
                        sSql := sSql + ' AND (IDPATRO IN (' + sPatro + '))';
                     end;


                     cdsSaldos.Data := GetDataPacket(sSql);
                     if not cdsSaldos.isEmpty then
                     begin
                        dValAtu := dValAtu + cdsSaldos.FieldByName('SALDO').AsFloat;
                     end;


                     //Ano Anterior
                     if sNatureza = 'C' then begin
                        sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(PLSCREDITOCOR,NULL,0,PLSCREDITOCOR) -               ';
                        sSql := sSql + '           DECODE(PLSDEBITOCORRENTE,NULL,0,PLSDEBITOCORRENTE)) AS SALDO        ';
                     end else begin
                        sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(PLSDEBITOCORRENTE,NULL,0,PLSDEBITOCORRENTE) -                 ';
                        sSql := sSql + '           DECODE(PLSCREDITOCOR,NULL,0,PLSCREDITOCOR)) AS SALDO       ';
                     end;
                     sSql := sSql + 'FROM PLANOSALDO                                                                    ';
                     sSql := sSql + 'WHERE (PLACONTA = '''+cdsCompConta.FieldByName('PLACONTA').AsString+''')           ';
                     sSql := sSql + '      AND (PLANO = '+IntToStr(iPlano)+')                                ';
                     sSql := sSql + '      AND (IDPESSOA = '+FloatToStr(dEmpresa)+')                             ';
                     sSql := sSql + '      AND (PEREXERCICIO = '+ IntToStr(iExercicio -1)+ ')                           ';

                     sSql := sSql + '      AND ((PERNUMERO BETWEEN 1 AND '+ IntToStr(iPeriodoFim) +') OR PERNUMERO IS NULL)  ';

                     if not cdsCompConta.FieldByName('CODCENTROCUSTO').isNull then begin
                        sSql := sSql + '   AND (CODCENTROCUSTO LIKE '''+cdsCompConta.FieldByName('CODCENTROCUSTO').AsString+'%'') ';
                     end;
                     if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                        sSql := sSql + '   AND (UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                     end;
                     if not cdsCompConta.FieldByName('IDPATRO').isNull then begin
                        sSql := sSql + '   AND (IDPATRO = '+cdsCompConta.FieldByName('IDPATRO').AsString+') ';
                     end;
                     if not cdsCompConta.FieldByName('IDPLANOPREV').isNull then begin
                        sSql := sSql + '   AND (IDPLANOPREV = '+cdsCompConta.FieldByName('IDPLANOPREV').AsString+') ';
                     end;
                     if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                        sSql := sSql + '   AND (CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                     end;
                     if sCCustoIni <> '' then begin
                        sSql := sSql + ' AND (RTRIM(CODCENTROCUSTO) LIKE '''+sCCustoIni+'%'')';
                        sSql := sSql + ' AND (IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                     end;
                     if trim(sAtivSel) <> '' then begin
                        sSql := sSql + ' AND  (UNIDNEGOC IN (' + trim(sAtivSel) + ')) ';
                     end;
                     if sAtivProj <> '' then begin
                        sSql := sSql + ' AND (UNIDNEGOC = '+ sAtivProj +')';
                     end;

                     if sPlano <> '' then begin
                        sSql := sSql + ' AND (IDPLANOPREV IN (' + sPlano + '))';
                     end;
                     if sPatro <> '' then begin
                        sSql := sSql + ' AND (IDPATRO IN (' + sPatro + '))';
                     end;


                     cdsSaldos.Data := GetDataPacket(sSql);
                     if not cdsSaldos.isEmpty then
                     begin
                        dValEAN := dValEAN + cdsSaldos.FieldByName('SALDO').AsFloat;
                     end;

                     cdsCompConta.Next;
                  end;

                  if (sCodMoedaReal <> '') and (FcdsDemoLayoutTipo.FieldByName('FlagMonetaria').AsString = 'S') then begin
                     dCotacaoAtu := Contab.TestaCotacaoMoeda(StrToInt(sCodMoedaReal),StrToDate(sPerDataAtu),false);

                     dValAtu := dValAtu/dCotacaoAtu;
                     dValEAN := dValEAN/dCotacaoAtu;
                  end;

                  if j <= 40 then begin
                     sColuna := '1';
                     if j < 10 then begin
                        sNumLin := '0' + IntToStr(j);
                     end else begin
                        sNumLin := IntToStr(j);
                     end;
                  end else begin
                     sColuna := '2';
                     if (j - 40) < 10 then begin
                        sNumLin := '0' + IntToStr(j - 40);
                     end else begin
                        sNumLin := IntToStr(j - 40);
                     end;
                  end;

                  sField    := 'Pos' + sNumLin + 'Col' + sColuna + 'Valor';
                  sFieldEAN := 'Pos' + sNumLin + 'Col' + sColuna + 'SalEANT';
                  FcdsDemoLayoutTipo.FieldByName('Pos' + sNumLin + 'Col' + sColuna + 'Descr').asString := cdsBalPatr.FieldByName('EBPDESCRICAO').asString;

                  if (cdsElemBalPatr.FieldByName('FLGTIPONEGATIVO').AsString <> 'N') then begin
                     FcdsDemoLayoutTipo.FieldByName(sField).AsFloat := dValAtu/iDiv;
                     FcdsDemoLayoutTipo.FieldByName(sFieldEAN).AsFloat := dValEAN/iDiv;
                  end else begin
                     if Modulo.TestaNatureza(sNatureza,  cdsElemBalPatr.FieldByName('FLGNATUREZA').AsString, dValAtu) then begin
                        FcdsDemoLayoutTipo.FieldByName(sField).AsFloat    := Abs(dValAtu/iDiv)* (-1);
                        FcdsDemoLayoutTipo.FieldByName(sFieldEAN).AsFloat := Abs(dValEAN/iDiv)* (-1);
                     end else begin
                        FcdsDemoLayoutTipo.FieldByName(sField).AsFloat     := Abs(dValAtu/iDiv);
                        FcdsDemoLayoutTipo.FieldByName(sFieldEAN).AsFloat  := Abs(dValEAN/iDiv);
                     end;
                  end;
               end;
            end;
         end;
         If FcdsDemoLayoutTipo.State = dsBrowse then FcdsDemoLayoutTipo.Edit;
         FcdsDemoLayoutTipo.FieldByName('PeriodoIni').asString   := sNomePer1;
         FcdsDemoLayoutTipo.FieldByName('PeriodoFim').asString   := sNomePer2;
         FcdsDemoLayoutTipo.FieldByName('Exercicio').asString    := IntToStr(iExercicio);

         FcdsDemoLayoutTipo.FieldByName('EXERCICIOANT').asString := IntToStr(iExercicio - 1);

         FcdsDemoLayoutTipo.FieldByName('DataUltDia').asString   := sDataFim;
         FcdsDemoLayoutTipo.FieldByName('CCusto').asString       := sNomeCCusto;
         FcdsDemoLayoutTipo.FieldByName('AtivProj').asString     := sNomeAtivProj;
         FcdsDemoLayoutTipo.Post;
         Result := True;
      Except
         Result := false;
      End;

   Finally
     cdsSaldos.free;
     cdsCompConta.free;
     cdsBalPatr.free;
     cdsElemBalPatr.free;
     Free;
   End;

end;


function TCtrlRptDemonstrativo.MontaSqlDemoColMes(iDemo,iExercicio,iPeriodoIni,iPeriodoFim:Integer;dEmpresa:Double;
                                    sNatureza,sCCustoIni,sAtivProj,sDataFimAtu,
                                    sPlano,sPatro,sCodMoedaReal,sCodMoedaOrc,sAtivSel:string;
                                    bDivide:boolean):Boolean;

var sSalto, sInt1, sInt2, sInt3, sCond, sOper, sSql, sFieldMes, sFieldOrc, sEspacos : string;
    dvalorCond, dCotacaoAtu, dvalAtu, dvalAtu1, dvalAtu2, dvalAtu3, dvalAtu4, dvalAtu5, dvalAtu6,
    dvalAtu7, dvalAtu8, dvalAtu9, dvalAtu10, dvalAtu11, dvalAtu12  : Double;
    dvalOrcAtu, dvalOrcAtu1, dvalOrcAtu2, dvalOrcAtu3, dvalOrcAtu4, dvalOrcAtu5, dvalOrcAtu6,
    dvalOrcAtu7, dvalOrcAtu8, dvalOrcAtu9, dvalOrcAtu10, dvalOrcAtu11, dvalOrcAtu12 : Double;
    bCalc, bEntrou : Boolean;
    i, iDiv, iNumCalc, x,  iPerAtu, iLinha, iLinhaSalto, iLinha1, iLinha2, iLinha3 : Integer;
    bmSavePlace : TBookmark;

    cdsCompConta      :TClientDataSet;
    cdsSaldos         :TClientDataSet;
    cdsCompSomatorio  :TClientDataSet;

    sNomePer1,sNomePer2,sNomeCCusto,sNomeAtivProj,sDataFim :string;

begin

   Result := True;
   cdsCompConta     := TClientDataSet.Create(nil);
   cdsSaldos        := TClientDataSet.Create(nil);
   cdsCompSomatorio := TClientDataSet.Create(nil);

   if bDivide then
      iDiv := 1000
   else
      iDiv := 1;

   With TCMSqlParams.Create(nil) Do
   Try

      Try

         SQL.Clear;
         SQL.Add('SELECT                                                                                ');
         SQL.Add('   (''                               '') as PATRO,       ');
         SQL.Add('   (''                               '') as PLANO,       ');

         SQL.Add('   (0) AS M01_Janeiro, (0) AS M02_Fevereiro, (0) AS M03_Marco, (0) AS M04_Abril,      ');
         SQL.Add('   (0) AS M05_Maio, (0) AS M06_Junho, (0) AS M07_Julho, (0) AS M08_Agosto,            ');
         SQL.Add('   (0) AS M09_Setembro, (0) AS M10_Outubro, (0) AS M11_Novembro, (0) AS M12_Dezembro, ');
         SQL.Add('   (0) AS O01_Janeiro, (0) AS O02_Fevereiro, (0) AS O03_Marco, (0) AS O04_Abril,      ');
         SQL.Add('   (0) AS O05_Maio, (0) AS O06_Junho, (0) AS O07_Julho, (0) AS O08_Agosto,            ');
         SQL.Add('   (0) AS O09_Setembro, (0) AS O10_Outubro, (0) AS O11_Novembro, (0) AS O12_Dezembro, ');
         SQL.Add('   (0) AS M01_JaneiroS, (0) AS M02_FevereiroS, (0) AS M03_MarcoS, (0) AS M04_AbrilS,      ');
         SQL.Add('   (0) AS M05_MaioS, (0) AS M06_JunhoS, (0) AS M07_JulhoS, (0) AS M08_AgostoS,            ');
         SQL.Add('   (0) AS M09_SetembroS, (0) AS M10_OutubroS, (0) AS M11_NovembroS, (0) AS M12_DezembroS, ');
         SQL.Add('   (0) AS O01_JaneiroS, (0) AS O02_FevereiroS, (0) AS O03_MarcoS, (0) AS O04_AbrilS,      ');
         SQL.Add('   (0) AS O05_MaioS, (0) AS O06_JunhoS, (0) AS O07_JulhoS, (0) AS O08_AgostoS,            ');
         SQL.Add('   (0) AS O09_SetembroS, (0) AS O10_OutubroS, (0) AS O11_NovembroS, (0) AS O12_DezembroS, ');
         SQL.Add('   (0) AS SomatorioLinha, (''N'') AS FlagCalcInterna, (''          '') AS CCusto, (''          '') AS AtivProj,   ');
         SQL.Add('   (0) AS SomatLinhaOrc, (''         '') AS DATAULTDIA,                               ');
         SQL.Add('   (''                                                                              '') AS NomeElementoInd, ');
         SQL.Add('   E.ELEDESCELEM AS NomeElemento, E.ELEORDEMLINHA AS OrdemElemento,                   ');
         SQL.Add('   E.IDELEMDEMONSTRAT AS CodigoElemento, E.ELETIPOELEM AS TipoElemento,               ');
         SQL.Add('   E.FLGNATUREZA AS NaturezaElemento, E.FLGINDENTACAO AS Indentacao,                  ');
         SQL.Add('   E.FLGMONETARIA AS FlagMonetaria, E.FLGTIPONEGATIVO AS FlagTipoNegativo,            ');
         SQL.Add('   E.ELECODIGO AS Codigo, ('' '') AS SaltaPag, ('' '') AS Linha1,                     ');
         SQL.Add('   ('' '') AS Linha2, ('' '') AS Linha3,  E.ELEORDEMLINHA,                                              ');
         SQL.Add('   E.FLGSALTAPAGINA AS FlagInterna1, E.FLGTIPOLINHA AS FlagInterna2,                       ');
         SQL.Add('   (''               '') AS PERIODOINI, (''               '') AS PERIODOFIM, (''    '') AS EXERCICIO, ');
         SQL.Add('   E.FLGACUMULADO ');
         SQL.Add('FROM                                                                                  ');
         SQL.Add('   ELEMDEMONSTRATIVO E                                                                ');
         SQL.Add('WHERE                                                                                 ');
         SQL.Add('    (E.IDDEMONSTRATIVO =:IDDEMONSTRATIVO)                                             ');
         SQL.Add('ORDER BY                                                                              ');
         SQL.Add('    E.ELEORDEMLINHA                                                                   ');

         Prepare;
         ParamByName('IDDEMONSTRATIVO').asInteger := iDemo;
         FcdsDemoLayoutTipo.Data := Data;

         FcdsDemoLayoutTipo.First;

         // pega o nome do periodo inicial e o final
         cdsTitulos.Data := ListaDadosPeriodo(dEmpresa,iExercicio,iPeriodoIni);
         sNomePer1 := cdsTitulos.FieldByName('PERNOME').asString;

         cdsTitulos.Data := ListaDadosPeriodo(dEmpresa,iExercicio,iPeriodoFim);
         sNomePer2 := cdsTitulos.FieldByName('PERNOME').asString;
         sDataFim  := cdsTitulos.FieldByName('PERDATFIM').asString;

         // pega nome da Atividade e projeto se tiver
         if sAtivProj <> '' then
         begin
           cdsTitulos.Data := ListaNomeAtivProj(dEmpresa,sAtivProj);
           sNomeAtivProj := cdsTitulos.FieldByName('NOME').asString;
         end else
           sNomeAtivProj := '';

         // pega nome do centro de custo se tiver
         if sCCustoIni <> '' then
         begin
           cdsTitulos.Data := ListaNomeCCusto(dEmpresa,sCCustoIni);
           sNomeCCusto := cdsTitulos.FieldByName('NOME').asString;
         end else
           sNomeCCusto := '';


         //zera o acumulador de salto de pagina
         iLinhaSalto := 0;
         iLinha1     := 0;
         iLinha2     := 0;
         iLinha3     := 0;

         sSalto  := 'N';
         sInt1   := 'N';
         sInt2   := 'N';
         sInt3   := 'N';

         while not FcdsDemoLayoutTipo.EOF do begin

            FcdsDemoLayoutTipo.Edit;

            ListaPlanoPatro(StrToInt( sPlano ), StrToInt( sPatro ) );
            FcdsDemoLayoutTipo.FieldByName('Plano').asString := sNomePlano;
            FcdsDemoLayoutTipo.FieldByName('Patro').asString := sNomePatro;


            //Configura os Saltos de página
            if sSalto = 'S' then begin
               inc(iLinhaSalto);
               sSalto := 'N';
            end;
            if FcdsDemoLayoutTipo.FieldByName('FLAGINTERNA1').asString = 'S' then begin
               sSalto := 'S';
            end;
            FcdsDemoLayoutTipo.FieldByName('SALTAPAG').asString := IntToStr(iLinhaSalto);

            //Configura as linhas do relatório
            if sInt1 = 'E' then begin
               inc(iLinha1);
               sInt1 := 'N';
            end;
            if FcdsDemoLayoutTipo.FieldByName('FLAGINTERNA2').asString = 'E' then begin
               sInt1 := 'E';
            end;
            FcdsDemoLayoutTipo.FieldByName('LINHA1').asString := IntTOStr(iLinha1);

            //Configura as linhas do relatório
            if sInt2 = 'F' then begin
               inc(iLinha2);
               sInt2 := 'N';
            end;
            if FcdsDemoLayoutTipo.FieldByName('FLAGINTERNA2').asString = 'F' then begin
               sInt2 := 'F';
            end;
            FcdsDemoLayoutTipo.FieldByName('LINHA2').asString := IntToStr(iLinha2);

            //Configura as linhas do relatório
            if sInt3 = 'G' then begin
               inc(iLinha3);
               sInt3 := 'N';
            end;
            if FcdsDemoLayoutTipo.FieldByName('FLAGINTERNA2').asString = 'G' then begin
               sInt3 := 'G';
            end;
            FcdsDemoLayoutTipo.FieldByName('LINHA3').asString := IntToStr(iLinha3);

            cdsCompConta.Data := ListaCompConta(FcdsDemoLayoutTipo.FieldByName('CodigoElemento').asInteger);

            if not cdsCompConta.IsEmpty then begin
               for iPerAtu := iPeriodoIni to iPeriodoFim do begin
                  dvalAtu    :=0;
                  dvalOrcAtu :=0;
                  cdsCompConta.First;
                  while not cdsCompConta.EOF do begin
                     //Ano Atual
                     if sNatureza = 'C' then begin
                        sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(PLSCREDITOCOR,NULL,0,PLSCREDITOCOR) -               ';
                        sSql := sSql + '           DECODE(PLSDEBITOCORRENTE,NULL,0,PLSDEBITOCORRENTE)) AS SALDO,        ';
                        sSql := sSql + '       SUM(DECODE(PLSORCADOCREDITO,NULL,0,PLSORCADOCREDITO) -               ';
                        sSql := sSql + '           DECODE(PLSORCADODEBITO,NULL,0,PLSORCADODEBITO)) AS SALDOORC         ';
                     end else begin
                        sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(PLSDEBITOCORRENTE,NULL,0,PLSDEBITOCORRENTE) -                 ';
                        sSql := sSql + '           DECODE(PLSCREDITOCOR,NULL,0,PLSCREDITOCOR)) AS SALDO,       ';
                        sSql := sSql + '       SUM(DECODE(PLSORCADODEBITO,NULL,0,PLSORCADODEBITO) -               ';
                        sSql := sSql + '           DECODE(PLSORCADOCREDITO,NULL,0,PLSORCADOCREDITO)) AS SALDOORC         ';
                     end;
                     sSql := sSql + 'FROM PLANOSALDO                                                                    ';
                     sSql := sSql + 'WHERE (PLACONTA = '''+cdsCompConta.FieldByName('PLACONTA').AsString+''')           ';
                     sSql := sSql + '      AND (PLANO = '+IntToStr(Modulo.iPlano)+')                                ';
                     sSql := sSql + '      AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')                             ';
                     sSql := sSql + '      AND (PEREXERCICIO = '+IntToStr(iExercicio)+')                           ';
                     if FcdsDemoLayoutTipo.FieldByName('FLGACUMULADO').asString = 'S' then
                        sSql := sSql + '      AND ((PERNUMERO IS NULL) OR (PERNUMERO  <= '+ IntToStr(iPerAtu) +'))'
                     else
                        sSql := sSql + '      AND (PERNUMERO  = '+ IntToStr(iPerAtu) +')                               ';
                     if not cdsCompConta.FieldByName('CODCENTROCUSTO').isNull then begin
                        sSql := sSql + '   AND (CODCENTROCUSTO LIKE '''+cdsCompConta.FieldByName('CODCENTROCUSTO').AsString+'%'') ';
                     end;
                     if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                        sSql := sSql + '   AND (UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                     end;
                     if not cdsCompConta.FieldByName('IDPATRO').isNull then begin
                        sSql := sSql + '   AND (IDPATRO = '+cdsCompConta.FieldByName('IDPATRO').AsString+') ';
                     end;
                     if not cdsCompConta.FieldByName('IDPLANOPREV').isNull then begin
                        sSql := sSql + '   AND (IDPLANOPREV = '+cdsCompConta.FieldByName('IDPLANOPREV').AsString+') ';
                     end;
                     if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                        sSql := sSql + '   AND (CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                     end;
                     if sCCustoIni <> '' then begin
                        sSql := sSql + ' AND (RTRIM(CODCENTROCUSTO) LIKE '''+sCCustoIni+'%'')';
                        sSql := sSql + ' AND (IDEMPRESA = '+IntToStr(sistema.idEmpresa)+')';
                     end;
                     if trim(sAtivSel) <> '' then begin
                        sSql := sSql + ' AND  (UNIDNEGOC IN (' + trim(sAtivSel) + ')) ';
                     end;
                     if sAtivProj <> '' then begin
                        sSql := sSql + ' AND (UNIDNEGOC = '+sAtivProj+')';
                     end;
                     if sPlano <> '' then begin
                        sSql := sSql + ' AND (IDPLANOPREV = '+sPlano+')';
                     end;
                     if sPatro <> '' then begin
                        sSql := sSql + ' AND (IDPATRO = '+sPatro+')';
                     end;

                     cdsSaldos.Data := GetDataPacket(sSql);
                     if not cdsSaldos.isEmpty then
                     begin
                        dvalAtu   := dvalAtu    +cdsSaldos.FieldByName('SALDO').AsFloat;
                        dvalOrcAtu:= dvalOrcAtu +cdsSaldos.FieldByName('SALDOORC').AsFloat;
                     end;
                     cdsCompConta.Next;
                  end;

                  if (sCodMoedaReal <> '') and (FcdsDemoLayoutTipo.FieldByName('FlagMonetaria').AsString = 'S') then begin
                     dCotacaoAtu := Contab.TestaCotacaoMoeda(StrToInt(sCodMoedaReal), StrToDate(sDataFimAtu),false);
                     dvalAtu := dvalAtu/dCotacaoAtu;
                  end;

                  if (sCodMoedaOrc <> '') and (FcdsDemoLayoutTipo.FieldByName('FlagMonetaria').AsString = 'S') then begin
                     dCotacaoAtu := Contab.TestaCotacaoMoeda(StrToInt(sCodMoedaOrc),StrToDate(sDataFimAtu),false);
                     dvalOrcAtu := dvalOrcAtu/dCotacaoAtu;
                  end;

                  case iPerAtu of
                     1:  sFieldMes := 'M01_Janeiro';
                     2:  sFieldMes := 'M02_Fevereiro';
                     3:  sFieldMes := 'M03_Marco';
                     4:  sFieldMes := 'M04_Abril';
                     5:  sFieldMes := 'M05_Maio';
                     6:  sFieldMes := 'M06_Junho';
                     7:  sFieldMes := 'M07_Julho';
                     8:  sFieldMes := 'M08_Agosto';
                     9:  sFieldMes := 'M09_Setembro';
                     10: sFieldMes := 'M10_Outubro';
                     11: sFieldMes := 'M11_Novembro';
                     12: sFieldMes := 'M12_Dezembro';
                  end;

                  case iPerAtu of
                     1:  sFieldOrc := 'O01_Janeiro';
                     2:  sFieldOrc := 'O02_Fevereiro';
                     3:  sFieldOrc := 'O03_Marco';
                     4:  sFieldOrc := 'O04_Abril';
                     5:  sFieldOrc := 'O05_Maio';
                     6:  sFieldOrc := 'O06_Junho';
                     7:  sFieldOrc := 'O07_Julho';
                     8:  sFieldOrc := 'O08_Agosto';
                     9:  sFieldOrc := 'O09_Setembro';
                     10: sFieldOrc := 'O10_Outubro';
                     11: sFieldOrc := 'O11_Novembro';
                     12: sFieldOrc := 'O12_Dezembro';
                  end;

                  sFieldMes := sFieldMes + 'S';
                  sFieldOrc := sFieldOrc + 'S';
                  FcdsDemoLayoutTipo.FieldByName(sFieldMes).AsFloat := dvalAtu/iDiv;
                  FcdsDemoLayoutTipo.FieldByName(sFieldOrc).AsFloat := dvalOrcAtu/iDiv;
                  if FcdsDemoLayoutTipo.FieldByName('FLGACUMULADO').asString = 'S' then begin
                     FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').asFloat := FcdsDemoLayoutTipo.FieldByName(sFieldMes + 'S').AsFloat;
                     FcdsDemoLayoutTipo.FieldByName('SomatLinhaOrc').asFloat  := FcdsDemoLayoutTipo.FieldByName(sFieldOrc + 'S').AsFloat;
                  end;

                  if (FcdsDemoLayoutTipo.FieldByName('FLAGTIPONEGATIVO').AsString <> 'N') then begin
                     FcdsDemoLayoutTipo.FieldByName(sFieldMes).AsFloat := dvalAtu/iDiv;
                  end else begin
                     if Modulo.TestaNatureza(sNatureza,FcdsDemoLayoutTipo.FieldByName('NATUREZAELEMENTO').AsString, dvalAtu) then begin
                        FcdsDemoLayoutTipo.FieldByName(sFieldMes).AsFloat  := Abs(dvalAtu/iDiv)* (-1);
                     end else begin
                        FcdsDemoLayoutTipo.FieldByName(sFieldMes).AsFloat  := Abs(dvalAtu/iDiv);
                     end;
                  end;
                  //
                  if (FcdsDemoLayoutTipo.FieldByName('FLAGTIPONEGATIVO').AsString <> 'N') then begin
                     FcdsDemoLayoutTipo.FieldByName(sFieldOrc).AsFloat := dvalOrcAtu/iDiv;
                  end else begin
                     if Modulo.TestaNatureza(sNatureza, FcdsDemoLayoutTipo.FieldByName('NATUREZAELEMENTO').AsString, dvalOrcAtu) then begin
                        FcdsDemoLayoutTipo.FieldByName(sFieldOrc).AsFloat  := Abs(dvalOrcAtu/iDiv)* (-1);
                     end else begin
                        FcdsDemoLayoutTipo.FieldByName(sFieldOrc).AsFloat  := Abs(dvalOrcAtu/iDiv);
                     end;
                  end;
               end;
               FcdsDemoLayoutTipo.FieldByName('FlagCalcInterna').AsString := 'S';
               if FcdsDemoLayoutTipo.FieldByName('FLGACUMULADO').asString = 'S' then begin
                  case iPeriodoFim of
                     1:  sFieldMes := 'M01_Janeiro';
                     2:  sFieldMes := 'M02_Fevereiro';
                     3:  sFieldMes := 'M03_Marco';
                     4:  sFieldMes := 'M04_Abril';
                     5:  sFieldMes := 'M05_Maio';
                     6:  sFieldMes := 'M06_Junho';
                     7:  sFieldMes := 'M07_Julho';
                     8:  sFieldMes := 'M08_Agosto';
                     9:  sFieldMes := 'M09_Setembro';
                     10: sFieldMes := 'M10_Outubro';
                     11: sFieldMes := 'M11_Novembro';
                     12: sFieldMes := 'M12_Dezembro';
                  end;
                  case iPeriodoFim of
                     1:  sFieldOrc := 'O01_Janeiro';
                     2:  sFieldOrc := 'O02_Fevereiro';
                     3:  sFieldOrc := 'O03_Marco';
                     4:  sFieldOrc := 'O04_Abril';
                     5:  sFieldOrc := 'O05_Maio';
                     6:  sFieldOrc := 'O06_Junho';
                     7:  sFieldOrc := 'O07_Julho';
                     8:  sFieldOrc := 'O08_Agosto';
                     9:  sFieldOrc := 'O09_Setembro';
                     10: sFieldOrc := 'O10_Outubro';
                     11: sFieldOrc := 'O11_Novembro';
                     12: sFieldOrc := 'O12_Dezembro';
                  end;
                  FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').asFloat:= FcdsDemoLayoutTipo.FieldByName(sFieldMes + 'S').AsFloat;
                  FcdsDemoLayoutTipo.FieldByName('SomatLinhaOrc').asFloat := FcdsDemoLayoutTipo.FieldByName(sFieldOrc + 'S').AsFloat;
               end else begin
                  FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').asFloat := FcdsDemoLayoutTipo.FieldByName('M01_JaneiroS').asFloat + FcdsDemoLayoutTipo.FieldByName('M02_FevereiroS').asFloat +
                                               FcdsDemoLayoutTipo.FieldByName('M03_MarcoS').asFloat    + FcdsDemoLayoutTipo.FieldByName('M04_AbrilS').asFloat +
                                               FcdsDemoLayoutTipo.FieldByName('M05_MaioS').asFloat     + FcdsDemoLayoutTipo.FieldByName('M06_JunhoS').asFloat +
                                               FcdsDemoLayoutTipo.FieldByName('M07_JulhoS').asFloat    + FcdsDemoLayoutTipo.FieldByName('M08_AgostoS').asFloat +
                                               FcdsDemoLayoutTipo.FieldByName('M09_SetembroS').asFloat + FcdsDemoLayoutTipo.FieldByName('M10_OutubroS').asFloat +
                                               FcdsDemoLayoutTipo.FieldByName('M11_NovembroS').asFloat + FcdsDemoLayoutTipo.FieldByName('M12_DezembroS').asFloat;

                  FcdsDemoLayoutTipo.FieldByName('SomatLinhaOrc').asFloat := FcdsDemoLayoutTipo.FieldByName('O01_JaneiroS').asFloat + FcdsDemoLayoutTipo.FieldByName('O02_FevereiroS').asFloat +
                                               FcdsDemoLayoutTipo.FieldByName('O03_MarcoS').asFloat    + FcdsDemoLayoutTipo.FieldByName('O04_AbrilS').asFloat +
                                               FcdsDemoLayoutTipo.FieldByName('O05_MaioS').asFloat     + FcdsDemoLayoutTipo.FieldByName('O06_JunhoS').asFloat +
                                               FcdsDemoLayoutTipo.FieldByName('O07_JulhoS').asFloat    + FcdsDemoLayoutTipo.FieldByName('O08_AgostoS').asFloat +
                                               FcdsDemoLayoutTipo.FieldByName('O09_SetembroS').asFloat + FcdsDemoLayoutTipo.FieldByName('O10_OutubroS').asFloat +
                                               FcdsDemoLayoutTipo.FieldByName('O11_NovembroS').asFloat + FcdsDemoLayoutTipo.FieldByName('O12_DezembroS').asFloat;
               end;
               if (FcdsDemoLayoutTipo.FieldByName('FLAGTIPONEGATIVO').AsString <> 'N') then begin
                  FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').AsFloat := FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').asFloat;
                  FcdsDemoLayoutTipo.FieldByName('SomatLinhaOrc').asFloat  := FcdsDemoLayoutTipo.FieldByName('SomatLinhaOrc').asFloat;
               end else begin
                  if Modulo.TestaNatureza(sNatureza, FcdsDemoLayoutTipo.FieldByName('NATUREZAELEMENTO').AsString, FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').AsFloat) then begin
                     FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').AsFloat := Abs(FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').AsFloat)* (-1);
                  end else begin
                     FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').AsFloat := Abs(FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').AsFloat);
                  end;
                  if Modulo.TestaNatureza(sNatureza,FcdsDemoLayoutTipo.FieldByName('NATUREZAELEMENTO').AsString, FcdsDemoLayoutTipo.FieldByName('SomatLinhaOrc').AsFloat) then begin
                     FcdsDemoLayoutTipo.FieldByName('SomatLinhaOrc').AsFloat := Abs(FcdsDemoLayoutTipo.FieldByName('SomatLinhaOrc').AsFloat)* (-1);
                  end else begin
                     FcdsDemoLayoutTipo.FieldByName('SomatLinhaOrc').AsFloat := Abs(FcdsDemoLayoutTipo.FieldByName('SomatLinhaOrc').AsFloat);
                  end;
               end;
            end;
            sEspacos := '';
            for i := 1 to ((StrToInt(FcdsDemoLayoutTipo.FieldByName('Indentacao').asString) - 1) * 4) do begin
               sEspacos := sEspacos + ' ';
            end;
            FcdsDemoLayoutTipo.FieldByName('NomeElementoInd').AsString := sEspacos + FcdsDemoLayoutTipo.FieldByName('NomeElemento').AsString;
            FcdsDemoLayoutTipo.FieldByName('PeriodoIni').asString := sNomePer1;
            FcdsDemoLayoutTipo.FieldByName('PeriodoFim').asString := sNomePer2;
            FcdsDemoLayoutTipo.FieldByName('Exercicio').asString  := IntToStr(iExercicio);
            FcdsDemoLayoutTipo.FieldByName('DataUltDia').asString := sDataFim;
            FcdsDemoLayoutTipo.FieldByName('CCusto').asString     := sNomeCCusto;
            FcdsDemoLayoutTipo.FieldByName('AtivProj').asString   := sNomeAtivProj;
            FcdsDemoLayoutTipo.Post;
            FcdsDemoLayoutTipo.Next;
         end;


         x:=1;
         iNumCalc:=0;
         while x = 1 do begin
            bEntrou:=False;
            FcdsDemoLayoutTipo.First;
            bmSavePlace := FcdsDemoLayoutTipo.GetBookmark;

            while not FcdsDemoLayoutTipo.EOF do begin

               if FcdsDemoLayoutTipo.FieldByName('FlagCalcInterna').AsString <> 'S' then begin
                  bEntrou:=True;

                  cdsCompSomatorio.Data := ListaCompSomatorio(FcdsDemoLayoutTipo.FieldByName('CodigoElemento').asInteger);

                  bCalc     := True;
                  dvalAtu1  := 0;
                  dvalAtu2  := 0;
                  dvalAtu3  := 0;
                  dvalAtu4  := 0;
                  dvalAtu5  := 0;
                  dvalAtu6  := 0;
                  dvalAtu7  := 0;
                  dvalAtu8  := 0;
                  dvalAtu9  := 0;
                  dvalAtu10 := 0;
                  dvalAtu11 := 0;
                  dvalAtu12 := 0;

                  dvalOrcAtu1  := 0;
                  dvalOrcAtu2  := 0;
                  dvalOrcAtu3  := 0;
                  dvalOrcAtu4  := 0;
                  dvalOrcAtu5  := 0;
                  dvalOrcAtu6  := 0;
                  dvalOrcAtu7  := 0;
                  dvalOrcAtu8  := 0;
                  dvalOrcAtu9  := 0;
                  dvalOrcAtu10 := 0;
                  dvalOrcAtu11 := 0;
                  dvalOrcAtu12 := 0;

                  // Salvar Ponteiro
                  bmSavePlace := FcdsDemoLayoutTipo.GetBookmark;
                  cdsCompSomatorio.First;
                  while not cdsCompSomatorio.EOF do begin
                     //Verificaçao do tipo de operação para cálculo da fórmula
                     sOper := cdsCompSomatorio.FieldByName('FLGOPERACAO').asString;

                     //Verifica se ha condicional e processa ela
                     if cdsCompSomatorio.FieldByName('ELECONDICAO').isNull then begin
                        sCond := '';
                        dvalorCond := 0;
                     end else begin
                        sCond := cdsCompSomatorio.FieldByName('ELECONDICAO').asString;
                        dvalorCond := cdsCompSomatorio.FieldByName('ELEVALORCOND').asFloat;
                     end;

                     FcdsDemoLayoutTipo.First;
                     while not FcdsDemoLayoutTipo.EOF do begin
                        if cdsCompSomatorio.FieldByName('ELEMENTODEM').AsInteger =
                           FcdsDemoLayoutTipo.FieldByName('CodigoElemento').AsInteger then begin
                           if FcdsDemoLayoutTipo.FieldByName('FlagCalcInterna').AsString = 'S' then begin
                              dvalAtu1 := FazFormula(dvalAtu1, FcdsDemoLayoutTipo.FieldByName('M01_JaneiroS').AsFloat, sOper, sCond, dvalorCond);
                              dvalAtu2 := FazFormula(dvalAtu2, FcdsDemoLayoutTipo.FieldByName('M02_FevereiroS').AsFloat, sOper, sCond, dvalorCond);
                              dvalAtu3 := FazFormula(dvalAtu3, FcdsDemoLayoutTipo.FieldByName('M03_MarcoS').AsFloat, sOper, sCond, dvalorCond);
                              dvalAtu4 := FazFormula(dvalAtu4, FcdsDemoLayoutTipo.FieldByName('M04_AbrilS').AsFloat, sOper, sCond, dvalorCond);
                              dvalAtu5 := FazFormula(dvalAtu5, FcdsDemoLayoutTipo.FieldByName('M05_MaioS').AsFloat, sOper, sCond, dvalorCond);
                              dvalAtu6 := FazFormula(dvalAtu6, FcdsDemoLayoutTipo.FieldByName('M06_JunhoS').AsFloat, sOper, sCond, dvalorCond);
                              dvalAtu7 := FazFormula(dvalAtu7, FcdsDemoLayoutTipo.FieldByName('M07_JulhoS').AsFloat, sOper, sCond, dvalorCond);
                              dvalAtu8 := FazFormula(dvalAtu8, FcdsDemoLayoutTipo.FieldByName('M08_AgostoS').AsFloat, sOper, sCond, dvalorCond);
                              dvalAtu9 := FazFormula(dvalAtu9, FcdsDemoLayoutTipo.FieldByName('M09_SetembroS').AsFloat, sOper, sCond, dvalorCond);
                              dvalAtu10:= FazFormula(dvalAtu10, FcdsDemoLayoutTipo.FieldByName('M10_OutubroS').AsFloat, sOper, sCond, dvalorCond);
                              dvalAtu11:= FazFormula(dvalAtu11, FcdsDemoLayoutTipo.FieldByName('M11_NovembroS').AsFloat, sOper, sCond, dvalorCond);
                              dvalAtu12:= FazFormula(dvalAtu12, FcdsDemoLayoutTipo.FieldByName('M12_DezembroS').AsFloat, sOper, sCond, dvalorCond);

                              dvalOrcAtu1 := FazFormula(dvalOrcAtu1, FcdsDemoLayoutTipo.FieldByName('O01_JaneiroS').AsFloat, sOper, sCond, dvalorCond);
                              dvalOrcAtu2 := FazFormula(dvalOrcAtu2, FcdsDemoLayoutTipo.FieldByName('O02_FevereiroS').AsFloat, sOper, sCond, dvalorCond);
                              dvalOrcAtu3 := FazFormula(dvalOrcAtu3, FcdsDemoLayoutTipo.FieldByName('O03_MarcoS').AsFloat, sOper, sCond, dvalorCond);
                              dvalOrcAtu4 := FazFormula(dvalOrcAtu4, FcdsDemoLayoutTipo.FieldByName('O04_AbrilS').AsFloat, sOper, sCond, dvalorCond);
                              dvalOrcAtu5 := FazFormula(dvalOrcAtu5, FcdsDemoLayoutTipo.FieldByName('O05_MaioS').AsFloat, sOper, sCond, dvalorCond);
                              dvalOrcAtu6 := FazFormula(dvalOrcAtu6, FcdsDemoLayoutTipo.FieldByName('O06_JunhoS').AsFloat, sOper, sCond, dvalorCond);
                              dvalOrcAtu7 := FazFormula(dvalOrcAtu7, FcdsDemoLayoutTipo.FieldByName('O07_JulhoS').AsFloat, sOper, sCond, dvalorCond);
                              dvalOrcAtu8 := FazFormula(dvalOrcAtu8, FcdsDemoLayoutTipo.FieldByName('O08_AgostoS').AsFloat, sOper, sCond, dvalorCond);
                              dvalOrcAtu9 := FazFormula(dvalOrcAtu9, FcdsDemoLayoutTipo.FieldByName('O09_SetembroS').AsFloat, sOper, sCond, dvalorCond);
                              dvalOrcAtu10:= FazFormula(dvalOrcAtu10, FcdsDemoLayoutTipo.FieldByName('O10_OutubroS').AsFloat, sOper, sCond, dvalorCond);
                              dvalOrcAtu11:= FazFormula(dvalOrcAtu11, FcdsDemoLayoutTipo.FieldByName('O11_NovembroS').AsFloat, sOper, sCond, dvalorCond);
                              dvalOrcAtu12:= FazFormula(dvalOrcAtu12, FcdsDemoLayoutTipo.FieldByName('O12_DezembroS').AsFloat, sOper, sCond, dvalorCond);

                           end else begin
                              bCalc:=False;
                              Break;
                           end;
                        end;
                        FcdsDemoLayoutTipo.Next;
                     end;
                     cdsCompSomatorio.Next;
                  end;
                  // Ponterar Query
                  FcdsDemoLayoutTipo.GotoBookmark(bmSavePlace);
                  if bCalc then begin
                     Inc(iNumCalc);
                     FcdsDemoLayoutTipo.Edit;

                     FcdsDemoLayoutTipo.FieldByName('M01_JaneiroS').AsFloat   := dvalAtu1;
                     FcdsDemoLayoutTipo.FieldByName('M02_FevereiroS').AsFloat := dvalAtu2;
                     FcdsDemoLayoutTipo.FieldByName('M03_MarcoS').AsFloat     := dvalAtu3;
                     FcdsDemoLayoutTipo.FieldByName('M04_AbrilS').AsFloat     := dvalAtu4;
                     FcdsDemoLayoutTipo.FieldByName('M05_MaioS').AsFloat      := dvalAtu5;
                     FcdsDemoLayoutTipo.FieldByName('M06_JunhoS').AsFloat     := dvalAtu6;
                     FcdsDemoLayoutTipo.FieldByName('M07_JulhoS').AsFloat     := dvalAtu7;
                     FcdsDemoLayoutTipo.FieldByName('M08_AgostoS').AsFloat    := dvalAtu8;
                     FcdsDemoLayoutTipo.FieldByName('M09_SetembroS').AsFloat  := dvalAtu9;
                     FcdsDemoLayoutTipo.FieldByName('M10_OutubroS').AsFloat   := dvalAtu10;
                     FcdsDemoLayoutTipo.FieldByName('M11_NovembroS').AsFloat  := dvalAtu11;
                     FcdsDemoLayoutTipo.FieldByName('M12_DezembroS').AsFloat  := dvalAtu12;

                     FcdsDemoLayoutTipo.FieldByName('O01_JaneiroS').AsFloat   := dvalOrcAtu1;
                     FcdsDemoLayoutTipo.FieldByName('O02_FevereiroS').AsFloat := dvalOrcAtu2;
                     FcdsDemoLayoutTipo.FieldByName('O03_MarcoS').AsFloat     := dvalOrcAtu3;
                     FcdsDemoLayoutTipo.FieldByName('O04_AbrilS').AsFloat     := dvalOrcAtu4;
                     FcdsDemoLayoutTipo.FieldByName('O05_MaioS').AsFloat      := dvalOrcAtu5;
                     FcdsDemoLayoutTipo.FieldByName('O06_JunhoS').AsFloat     := dvalOrcAtu6;
                     FcdsDemoLayoutTipo.FieldByName('O07_JulhoS').AsFloat     := dvalOrcAtu7;
                     FcdsDemoLayoutTipo.FieldByName('O08_AgostoS').AsFloat    := dvalOrcAtu8;
                     FcdsDemoLayoutTipo.FieldByName('O09_SetembroS').AsFloat  := dvalOrcAtu9;
                     FcdsDemoLayoutTipo.FieldByName('O10_OutubroS').AsFloat   := dvalOrcAtu10;
                     FcdsDemoLayoutTipo.FieldByName('O11_NovembroS').AsFloat  := dvalOrcAtu11;
                     FcdsDemoLayoutTipo.FieldByName('O12_DezembroS').AsFloat  := dvalOrcAtu12;

                     if (FcdsDemoLayoutTipo.FieldByName('FlagTipoNegativo').AsString <> 'N') then begin
                        FcdsDemoLayoutTipo.FieldByName('M01_Janeiro').AsFloat   := dvalAtu1;
                        FcdsDemoLayoutTipo.FieldByName('M02_Fevereiro').AsFloat := dvalAtu2;
                        FcdsDemoLayoutTipo.FieldByName('M03_Marco').AsFloat     := dvalAtu3;
                        FcdsDemoLayoutTipo.FieldByName('M04_Abril').AsFloat     := dvalAtu4;
                        FcdsDemoLayoutTipo.FieldByName('M05_Maio').AsFloat      := dvalAtu5;
                        FcdsDemoLayoutTipo.FieldByName('M06_Junho').AsFloat     := dvalAtu6;
                        FcdsDemoLayoutTipo.FieldByName('M07_Julho').AsFloat     := dvalAtu7;
                        FcdsDemoLayoutTipo.FieldByName('M08_Agosto').AsFloat    := dvalAtu8;
                        FcdsDemoLayoutTipo.FieldByName('M09_Setembro').AsFloat  := dvalAtu9;
                        FcdsDemoLayoutTipo.FieldByName('M10_Outubro').AsFloat   := dvalAtu10;
                        FcdsDemoLayoutTipo.FieldByName('M11_Novembro').AsFloat  := dvalAtu11;
                        FcdsDemoLayoutTipo.FieldByName('M12_Dezembro').AsFloat  := dvalAtu12;

                        FcdsDemoLayoutTipo.FieldByName('O01_Janeiro').AsFloat   := dvalOrcAtu1;
                        FcdsDemoLayoutTipo.FieldByName('O02_Fevereiro').AsFloat := dvalOrcAtu2;
                        FcdsDemoLayoutTipo.FieldByName('O03_Marco').AsFloat     := dvalOrcAtu3;
                        FcdsDemoLayoutTipo.FieldByName('O04_Abril').AsFloat     := dvalOrcAtu4;
                        FcdsDemoLayoutTipo.FieldByName('O05_Maio').AsFloat      := dvalOrcAtu5;
                        FcdsDemoLayoutTipo.FieldByName('O06_Junho').AsFloat     := dvalOrcAtu6;
                        FcdsDemoLayoutTipo.FieldByName('O07_Julho').AsFloat     := dvalOrcAtu7;
                        FcdsDemoLayoutTipo.FieldByName('O08_Agosto').AsFloat    := dvalOrcAtu8;
                        FcdsDemoLayoutTipo.FieldByName('O09_Setembro').AsFloat  := dvalOrcAtu9;
                        FcdsDemoLayoutTipo.FieldByName('O10_Outubro').AsFloat   := dvalOrcAtu10;
                        FcdsDemoLayoutTipo.FieldByName('O11_Novembro').AsFloat  := dvalOrcAtu11;
                        FcdsDemoLayoutTipo.FieldByName('O12_Dezembro').AsFloat  := dvalOrcAtu12;
                     end else begin
                        if Modulo.TestaNatureza(sNatureza, FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString, dvalAtu1) then begin
                           FcdsDemoLayoutTipo.FieldByName('M01_Janeiro').AsFloat := (Abs(dvalAtu1)* (-1));
                           FcdsDemoLayoutTipo.FieldByName('O01_Janeiro').AsFloat := (Abs(dvalOrcAtu1)* (-1));
                        end else begin
                           FcdsDemoLayoutTipo.FieldByName('M01_Janeiro').AsFloat := Abs(dvalAtu1);
                           FcdsDemoLayoutTipo.FieldByName('O01_Janeiro').AsFloat := Abs(dvalOrcAtu1);
                        end;
                        if Modulo.TestaNatureza(sNatureza, FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString, dvalAtu2) then begin
                           FcdsDemoLayoutTipo.FieldByName('M02_Fevereiro').AsFloat := (Abs(dvalAtu2)* (-1));
                           FcdsDemoLayoutTipo.FieldByName('O02_Fevereiro').AsFloat := (Abs(dvalOrcAtu2)* (-1));
                        end else begin
                           FcdsDemoLayoutTipo.FieldByName('M02_Fevereiro').AsFloat := Abs(dvalAtu2);
                           FcdsDemoLayoutTipo.FieldByName('O02_Fevereiro').AsFloat := Abs(dvalOrcAtu2);
                        end;
                        if Modulo.TestaNatureza(sNatureza, FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString, dvalAtu3) then begin
                           FcdsDemoLayoutTipo.FieldByName('M03_Marco').AsFloat := (Abs(dvalAtu3)* (-1));
                           FcdsDemoLayoutTipo.FieldByName('O03_Marco').AsFloat := (Abs(dvalOrcAtu3)* (-1));
                        end else begin
                           FcdsDemoLayoutTipo.FieldByName('M03_Marco').AsFloat := Abs(dvalAtu3);
                           FcdsDemoLayoutTipo.FieldByName('O03_Marco').AsFloat := Abs(dvalOrcAtu3);
                        end;
                        if Modulo.TestaNatureza(sNatureza, FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString, dvalAtu4) then begin
                           FcdsDemoLayoutTipo.FieldByName('M04_Abril').AsFloat := (Abs(dvalAtu4)* (-1));
                           FcdsDemoLayoutTipo.FieldByName('O04_Abril').AsFloat := (Abs(dvalOrcAtu4)* (-1));
                        end else begin
                           FcdsDemoLayoutTipo.FieldByName('M04_Abril').AsFloat := Abs(dvalAtu4);
                           FcdsDemoLayoutTipo.FieldByName('O04_Abril').AsFloat := Abs(dvalOrcAtu4);
                        end;
                        if Modulo.TestaNatureza(sNatureza, FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString, dvalAtu5) then begin
                           FcdsDemoLayoutTipo.FieldByName('M05_Maio').AsFloat := (Abs(dvalAtu5)* (-1));
                           FcdsDemoLayoutTipo.FieldByName('O05_Maio').AsFloat := (Abs(dvalOrcAtu5)* (-1));
                        end else begin
                           FcdsDemoLayoutTipo.FieldByName('M05_Maio').AsFloat := Abs(dvalAtu5);
                           FcdsDemoLayoutTipo.FieldByName('O05_Maio').AsFloat := Abs(dvalOrcAtu5);
                        end;
                        if Modulo.TestaNatureza(sNatureza, FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString, dvalAtu6) then begin
                           FcdsDemoLayoutTipo.FieldByName('M06_Junho').AsFloat := (Abs(dvalAtu6)* (-1));
                           FcdsDemoLayoutTipo.FieldByName('O06_Junho').AsFloat := (Abs(dvalOrcAtu6)* (-1));
                        end else begin
                           FcdsDemoLayoutTipo.FieldByName('M06_Junho').AsFloat := Abs(dvalAtu6);
                           FcdsDemoLayoutTipo.FieldByName('O06_Junho').AsFloat := Abs(dvalOrcAtu6);
                        end;
                        if Modulo.TestaNatureza(sNatureza, FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString, dvalAtu7) then begin
                           FcdsDemoLayoutTipo.FieldByName('M07_Julho').AsFloat := (Abs(dvalAtu7)* (-1));
                           FcdsDemoLayoutTipo.FieldByName('O07_Julho').AsFloat := (Abs(dvalOrcAtu7)* (-1));
                        end else begin
                           FcdsDemoLayoutTipo.FieldByName('M07_Julho').AsFloat := Abs(dvalAtu7);
                           FcdsDemoLayoutTipo.FieldByName('O07_Julho').AsFloat := Abs(dvalOrcAtu7);
                        end;
                        if Modulo.TestaNatureza(sNatureza, FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString, dvalAtu8) then begin
                           FcdsDemoLayoutTipo.FieldByName('M08_Agosto').AsFloat := (Abs(dvalAtu8)* (-1));
                           FcdsDemoLayoutTipo.FieldByName('O08_Agosto').AsFloat := (Abs(dvalOrcAtu8)* (-1));
                        end else begin
                           FcdsDemoLayoutTipo.FieldByName('M08_Agosto').AsFloat := Abs(dvalAtu8);
                           FcdsDemoLayoutTipo.FieldByName('O08_Agosto').AsFloat := Abs(dvalOrcAtu8);
                        end;
                        if Modulo.TestaNatureza(sNatureza, FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString, dvalAtu9) then begin
                           FcdsDemoLayoutTipo.FieldByName('M09_Setembro').AsFloat := (Abs(dvalAtu9)* (-1));
                           FcdsDemoLayoutTipo.FieldByName('O09_Setembro').AsFloat := (Abs(dvalOrcAtu9)* (-1));
                        end else begin
                           FcdsDemoLayoutTipo.FieldByName('M09_Setembro').AsFloat := Abs(dvalAtu9);
                           FcdsDemoLayoutTipo.FieldByName('O09_Setembro').AsFloat := Abs(dvalOrcAtu9);
                        end;
                        if Modulo.TestaNatureza(sNatureza, FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString, dvalAtu10) then begin
                           FcdsDemoLayoutTipo.FieldByName('M10_Outubro').AsFloat := (Abs(dvalAtu10)* (-1));
                           FcdsDemoLayoutTipo.FieldByName('O10_Outubro').AsFloat := (Abs(dvalOrcAtu10)* (-1));
                        end else begin
                           FcdsDemoLayoutTipo.FieldByName('M10_Outubro').AsFloat := Abs(dvalAtu10);
                           FcdsDemoLayoutTipo.FieldByName('O10_Outubro').AsFloat := Abs(dvalOrcAtu10);
                        end;
                        if Modulo.TestaNatureza(sNatureza, FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString, dvalAtu11) then begin
                           FcdsDemoLayoutTipo.FieldByName('M11_Novembro').AsFloat := (Abs(dvalAtu11)* (-1));
                           FcdsDemoLayoutTipo.FieldByName('O11_Novembro').AsFloat := (Abs(dvalOrcAtu11)* (-1));
                        end else begin
                           FcdsDemoLayoutTipo.FieldByName('M11_Novembro').AsFloat := Abs(dvalAtu11);
                           FcdsDemoLayoutTipo.FieldByName('O11_Novembro').AsFloat := Abs(dvalOrcAtu11);
                        end;
                        if Modulo.TestaNatureza(sNatureza, FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString, dvalAtu12) then begin
                           FcdsDemoLayoutTipo.FieldByName('M12_Dezembro').AsFloat := (Abs(dvalAtu12)* (-1));
                           FcdsDemoLayoutTipo.FieldByName('O12_Dezembro').AsFloat := (Abs(dvalOrcAtu12)* (-1));
                        end else begin
                           FcdsDemoLayoutTipo.FieldByName('M12_Dezembro').AsFloat := Abs(dvalAtu12);
                           FcdsDemoLayoutTipo.FieldByName('O12_Dezembro').AsFloat := Abs(dvalOrcAtu12);
                        end;
                     end;
                     FcdsDemoLayoutTipo.FieldByName('FlagCalcInterna').AsString    := 'S';
                     FcdsDemoLayoutTipo.FieldByName('NomeElementoInd').AsString := sEspacos + FcdsDemoLayoutTipo.FieldByName('NomeElemento').AsString;
                     if FcdsDemoLayoutTipo.FieldByName('FLGACUMULADO').asString = 'S' then begin
                        FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').asFloat := FcdsDemoLayoutTipo.FieldByName(sFieldMes + 'S').AsFloat;
                        FcdsDemoLayoutTipo.FieldByName('SomatLinhaOrc').asFloat  := FcdsDemoLayoutTipo.FieldByName(sFieldOrc + 'S').AsFloat;
                     end else begin
                        FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').asFloat := FcdsDemoLayoutTipo.FieldByName('M01_JaneiroS').asFloat + FcdsDemoLayoutTipo.FieldByName('M02_FevereiroS').asFloat +
                                                     FcdsDemoLayoutTipo.FieldByName('M03_MarcoS').asFloat + FcdsDemoLayoutTipo.FieldByName('M04_AbrilS').asFloat +
                                                     FcdsDemoLayoutTipo.FieldByName('M05_MaioS').asFloat + FcdsDemoLayoutTipo.FieldByName('M06_JunhoS').asFloat +
                                                     FcdsDemoLayoutTipo.FieldByName('M07_JulhoS').asFloat + FcdsDemoLayoutTipo.FieldByName('M08_AgostoS').asFloat +
                                                     FcdsDemoLayoutTipo.FieldByName('M09_SetembroS').asFloat + FcdsDemoLayoutTipo.FieldByName('M10_OutubroS').asFloat +
                                                     FcdsDemoLayoutTipo.FieldByName('M11_NovembroS').asFloat+ FcdsDemoLayoutTipo.FieldByName('M12_DezembroS').asFloat;

                        FcdsDemoLayoutTipo.FieldByName('SomatLinhaOrc').asFloat := FcdsDemoLayoutTipo.FieldByName('O01_JaneiroS').asFloat + FcdsDemoLayoutTipo.FieldByName('O02_FevereiroS').asFloat +
                                                     FcdsDemoLayoutTipo.FieldByName('O03_MarcoS').asFloat + FcdsDemoLayoutTipo.FieldByName('O04_AbrilS').asFloat +
                                                     FcdsDemoLayoutTipo.FieldByName('O05_MaioS').asFloat + FcdsDemoLayoutTipo.FieldByName('O06_JunhoS').asFloat +
                                                     FcdsDemoLayoutTipo.FieldByName('O07_JulhoS').asFloat + FcdsDemoLayoutTipo.FieldByName('O08_AgostoS').asFloat +
                                                     FcdsDemoLayoutTipo.FieldByName('O09_SetembroS').asFloat + FcdsDemoLayoutTipo.FieldByName('O10_OutubroS').asFloat +
                                                     FcdsDemoLayoutTipo.FieldByName('O11_NovembroS').asFloat+ FcdsDemoLayoutTipo.FieldByName('O12_DezembroS').asFloat;
                     end;
                     if (FcdsDemoLayoutTipo.FieldByName('FLAGTIPONEGATIVO').AsString <> 'N') then begin
                        FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').AsFloat := FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').asFloat;
                        FcdsDemoLayoutTipo.FieldByName('SomatLinhaOrc').asFloat  := FcdsDemoLayoutTipo.FieldByName('SomatLinhaOrc').asFloat;
                     end else begin
                        if Modulo.TestaNatureza(sNatureza,FcdsDemoLayoutTipo.FieldByName('NATUREZAELEMENTO').AsString, FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').AsFloat) then begin
                           FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').AsFloat := Abs(FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').AsFloat)* (-1);
                        end else begin
                           FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').AsFloat := Abs(FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').AsFloat);
                        end;
                        if Modulo.TestaNatureza(sNatureza, FcdsDemoLayoutTipo.FieldByName('NATUREZAELEMENTO').AsString, FcdsDemoLayoutTipo.FieldByName('SomatLinhaOrc').AsFloat) then begin
                           FcdsDemoLayoutTipo.FieldByName('SomatLinhaOrc').AsFloat := Abs(FcdsDemoLayoutTipo.FieldByName('SomatLinhaOrc').AsFloat)* (-1);
                        end else begin
                           FcdsDemoLayoutTipo.FieldByName('SomatLinhaOrc').AsFloat := Abs(FcdsDemoLayoutTipo.FieldByName('SomatLinhaOrc').AsFloat);
                        end;
                     end;
                     FcdsDemoLayoutTipo.Post;
                  end;
               end;

               If FcdsDemoLayoutTipo.State = dsBrowse then FcdsDemoLayoutTipo.Edit;
               sEspacos := '';
               for i := 1 to ((StrToInt(FcdsDemoLayoutTipo.FieldByName('Indentacao').asString) - 1) * 4) do begin
                  sEspacos := sEspacos + ' ';
               end;
               FcdsDemoLayoutTipo.FieldByName('NomeElementoInd').AsString := sEspacos + FcdsDemoLayoutTipo.FieldByName('NomeElemento').AsString;
               FcdsDemoLayoutTipo.FieldByName('PeriodoIni').asString := sNomePer1;
               FcdsDemoLayoutTipo.FieldByName('PeriodoFim').asString := sNomePer2;
               FcdsDemoLayoutTipo.FieldByName('Exercicio').asString  := IntToStr(iExercicio);
               FcdsDemoLayoutTipo.FieldByName('DataUltDia').asString := sDataFimAtu;
               FcdsDemoLayoutTipo.FieldByName('CCusto').asString     := sNomeCCusto;
               FcdsDemoLayoutTipo.FieldByName('AtivProj').asString   := sNomeAtivProj;
               FcdsDemoLayoutTipo.Post;
               FcdsDemoLayoutTipo.Next;
            end;
            FcdsDemoLayoutTipo.FreeBookmark(bmSavePlace);
            if not bEntrou then Break;
            if iNumCalc = 0 then begin
               Break;
               Abort;
            end;
         end;

         FcdsDemoLayoutTipo.First;
         while not FcdsDemoLayoutTipo.EOF do begin
            if FcdsDemoLayoutTipo.FieldByName('FLAGINTERNA2').asString = 'X' then begin
               FcdsDemoLayoutTipo.Delete;
            end else begin
               FcdsDemoLayoutTipo.Next;
            end;
         end;

      Except
         Result := false;
      End;

   Finally
     cdsCompConta.free;
     cdsSaldos.free;
     cdsCompSomatorio.free;
     Free;
   End;

end;

function TCtrlRptDemonstrativo.MontaSqlDemoColunado(iDemo,iPlano,iExercicio,iPeriodoIni,
                   iPeriodoFim,iValores:integer;sNatureza,sPatro,sPlano,
                   sCodMoedaReal,sAtivProj,sCCustoIni,sAtivSel:string;dEmpresa:Double;bNegativo, bDivide:Boolean):Boolean;

var sTracoDuplo, sTracoSimples, sCond, sOper, sSql, sColuna, sCalcu, sCalcu1, sColuna1 : string;
    dValorCond, dCotacaoAtu, dValAtu, dPrimeiro, dUltimo : Double;
    bCalc, bEntrou : Boolean;
    iDiv, iNumCalc, x, i, iMax : Integer;
    bmSavePlace : TBookmark;
    cdsColunas   : TClientDataSet;
    cdsCompConta    :TClientDataSet;
    cdsLinhaxColuna :TClientDataSet;
    cdsLinhasxColunas :TClientDataSet;
    cdsCompSomatorio  :TClientDataSet;
    cdsSaldos         :TClientDataSet;

    sNomePerIni,sNomePerFim,sNomeCCusto,sNomeAtivProj,sPerDataFim :string;

begin
   Result := True;
   cdsColunas       := TClientDataSet.Create(nil);
   cdsCompConta     := TClientDataSet.Create(nil);
   cdsLinhaxColuna  := TClientDataSet.Create(nil);
   cdsCompSomatorio := TClientDataSet.Create(nil);
   cdsLinhasxColunas := TClientDataSet.Create(nil);
   cdsSaldos         := TClientDataSet.Create(nil);

   if bDivide then
      iDiv := 1000
   else
      iDiv := 1;


   With TCMSqlParams.Create(nil) Do
   Try

      Try

         SQL.Clear;
         SQL.Add('SELECT                                                                 ');
         SQL.Add('   (''                               '') as PATRO,       ');
         SQL.Add('   (''                               '') as PLANO,       ');

         SQL.Add('   (0) AS Coluna1, (0) AS Coluna2, (0) AS Coluna3, (0) AS Coluna4,     ');
         SQL.Add('   (0) AS Coluna5, (0) AS Coluna6, (0) AS Coluna7, (0) AS Coluna8,     ');
         SQL.Add('   (0) AS Coluna9, (0) AS Coluna10, (0) AS Coluna11, (0) AS Coluna12,  ');
         SQL.Add('   (0) AS PercEntrePrim_Ult, (0) AS SomatorioLinha,                    ');
         SQL.Add('   (''                 -   '') AS Coluna1S, (''                 -   '') AS Coluna2S,  (''                 -   '') AS Coluna3S,  (''                 -   '') AS Coluna4S, ');
         SQL.Add('   (''                 -   '') AS Coluna5S, (''                 -   '') AS Coluna6S,  (''                 -   '') AS Coluna7S,  (''                 -   '') AS Coluna8S, ');
         SQL.Add('   (''                 -   '') AS Coluna9S, (''                 -   '') AS Coluna10S, (''                 -   '') AS Coluna11S, (''                 -   '') AS Coluna12S,');
         SQL.Add('   (''                 -   '') AS PercEntrePrim_UltS, (''                 -   '') AS SomatorioLinhaS,          ');
         SQL.Add('   (''N'') AS FlagCalcInterna1, (''N'') AS FlagCalcInterna2,           ');
         SQL.Add('   (''N'') AS FlagCalcInterna3, (''N'') AS FlagCalcInterna4,           ');
         SQL.Add('   (''N'') AS FlagCalcInterna5, (''N'') AS FlagCalcInterna6,           ');
         SQL.Add('   (''N'') AS FlagCalcInterna7, (''N'') AS FlagCalcInterna8,           ');
         SQL.Add('   (''N'') AS FlagCalcInterna9, (''N'') AS FlagCalcInterna10,          ');
         SQL.Add('   (''N'') AS FlagCalcInterna11, (''N'') AS FlagCalcInterna12,         ');
         SQL.Add('   L.NOMELINHA AS NomeLinha, L.IDLINHA AS CodigoLinha, (''         '') AS DATAULTDIA,         ');
         SQL.Add('   L.ORDEMLINHA AS OrdemLinha, L.FLGNATUREZA AS NaturezaElemento,         ');
         SQL.Add('   ''N'' AS FlagTipoNegativo,  L.FLGPASSATRACO, (''N'') AS FLGTRACOSIMPLES, (''N'') AS FLGTRACODUPLO, ');
         SQL.Add('   L.FLGMONETARIA AS FlagMonetaria, (''          '') AS CCusto, (''          '') AS AtivProj,         ');
         SQL.Add('   (''               '') AS PERIODOINI, (''               '') AS PERIODOFIM, (''    '') AS EXERCICIO  ');
         SQL.Add('FROM                                                                   ');
         SQL.Add('   DEMLINHA L                                                          ');
         SQL.Add('WHERE                                                                  ');
         SQL.Add('   (L.IDDEMONSTRATIVO =:IDDEMONSTRATIVO)                               ');
         SQL.Add('ORDER BY                                                               ');
         SQL.Add('    L.ORDEMLINHA                                                       ');

         Prepare;
         ParamByName('IDDEMONSTRATIVO').asInteger := iDemo;
         FcdsDemoLayoutTipo.Data := Data;

         FcdsDemoLayoutTipo.First;

         // pega o nome do periodo inicial e o final
         cdsTitulos.Data := ListaDadosPeriodo(dEmpresa,iExercicio,iPeriodoIni);
         sNomePerIni := cdsTitulos.FieldByName('PERNOME').asString;

         cdsTitulos.Data := ListaDadosPeriodo(dEmpresa,iExercicio,iPeriodoFim);
         sNomePerFim := cdsTitulos.FieldByName('PERNOME').asString;
         sPerDataFim := cdsTitulos.FieldByName('PERDATFIM').asString;

         // pega nome da Atividade e projeto se tiver
         if sAtivProj <> '' then
         begin
           cdsTitulos.Data := ListaNomeAtivProj(dEmpresa,sAtivProj);
           sNomeAtivProj := cdsTitulos.FieldByName('NOME').asString;
         end else
           sNomeAtivProj := '';

         // pega nome do centro de custo se tiver
         if sCCustoIni <> '' then
         begin
           cdsTitulos.Data := ListaNomeCCusto(dEmpresa,sCCustoIni);
           sNomeCCusto := cdsTitulos.FieldByName('NOME').asString;
         end else
           sNomeCCusto := '';


         dValAtu := 0;
         bCalc   := True;

         cdsColunas.Data := CtrlDemColuna.ListDemColunas(iDemo,0);

         iMax := cdsColunas.RecordCount;

         sTracoSimples := 'N';
         sTracoDuplo   := 'N';
         FcdsDemoLayoutTipo.First;
         while not FcdsDemoLayoutTipo.EOF do begin
            FcdsDemoLayoutTipo.edit;

            ListaPlanoPatro(StrToInt( sPlano ), StrToInt( sPatro ) );
            FcdsDemoLayoutTipo.FieldByName('Plano').asString := sNomePlano;
            FcdsDemoLayoutTipo.FieldByName('Patro').asString := sNomePatro;

            if FcdsDemoLayoutTipo.FieldByName('FLGPASSATRACO').AsString = 'S' then
               if sTracoSimples = 'S' then sTracoSimples := 'N' else sTracoSimples := 'S';
            if FcdsDemoLayoutTipo.FieldByName('FLGPASSATRACO').AsString = 'D' then
               if sTracoDuplo = 'S' then sTracoDuplo := 'N' else sTracoDuplo := 'S';
            //
            FcdsDemoLayoutTipo.FieldByName('FLGTRACOSIMPLES').AsString := sTracoSimples;
            FcdsDemoLayoutTipo.FieldByName('FLGTRACODUPLO').AsString   := sTracoDuplo;

            i:=1;

            dPrimeiro := 0;
            dUltimo   := 0;
            dValAtu   := 0;
            cdsColunas.First;
            while not cdsColunas.eof do begin

               sColuna   := 'Coluna' + IntToStr(i);
               sCalcu    := 'FlagCalcInterna' + IntToStr(i);

               cdsLinhaxColuna.Data := ListaLinhaxColuna(cdsColunas.FieldByName('IDDEMONSTRATIVO').AsInteger,
                                                         cdsColunas.FieldByName('NUMCOLUNA').AsInteger,
                                                         FcdsDemoLayoutTipo.FieldByName('CodigoLinha').AsInteger);

               if not cdsLinhaxColuna.IsEmpty then begin
                  dValAtu := 0;

                  cdsCompConta.Data := ListaCompConta(cdsLinhaxColuna.FieldByName('IDELEMDEMONSTRAT').asInteger);

                  bEntrou:=False;

                  cdsCompConta.First;
                  while not cdsCompConta.EOF do begin
                     bEntrou:=True;
                     //Ano Atual
                     if sNatureza= 'C' then begin
                        sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(PLSCREDITOCOR,NULL,0,PLSCREDITOCOR) -               ';
                        sSql := sSql + '           DECODE(PLSDEBITOCORRENTE,NULL,0,PLSDEBITOCORRENTE)) AS SALDO         ';
                     end else begin
                        sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(PLSDEBITOCORRENTE,NULL,0,PLSDEBITOCORRENTE) -                 ';
                        sSql := sSql + '           DECODE(PLSCREDITOCOR,NULL,0,PLSCREDITOCOR)) AS SALDO       ';
                     end;
                     sSql := sSql + 'FROM PLANOSALDO                                                                    ';
                     sSql := sSql + 'WHERE (PLACONTA = '''+cdsCompConta.FieldByName('PLACONTA').AsString+''')           ';
                     sSql := sSql + '      AND (PLANO = '+IntToStr(iPlano)+')                                ';
                     sSql := sSql + '      AND (IDPESSOA = '+FloatToStr(dEmpresa)+')                         ';
                     sSql := sSql + '      AND (PEREXERCICIO = '+IntToStr(iExercicio)+')                     ';
                     if iValores = 0 then begin
                        sSql := sSql + '      AND (PERNUMERO BETWEEN '+IntToStr(iPeriodoIni)+' AND '+IntToStr(iPeriodoFim)+')                               ';
                     end else begin
                        sSql := sSql + '      AND ((PERNUMERO  <= '+IntToStr(iPeriodoFim)+') OR (PERNUMERO IS NULL))     ';
                     end;
                     if not cdsCompConta.FieldByName('CODCENTROCUSTO').isNull then begin
                        sSql := sSql + '   AND (CODCENTROCUSTO LIKE '''+cdsCompConta.FieldByName('CODCENTROCUSTO').AsString+'%'') ';
                     end;
                     if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                        sSql := sSql + '   AND (UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                     end;
                     if not cdsCompConta.FieldByName('IDPATRO').isNull then begin
                        sSql := sSql + '   AND (IDPATRO = '+cdsCompConta.FieldByName('IDPATRO').AsString+') ';
                     end;
                     if not cdsCompConta.FieldByName('IDPLANOPREV').isNull then begin
                        sSql := sSql + '   AND (IDPLANOPREV = '+cdsCompConta.FieldByName('IDPLANOPREV').AsString+') ';
                     end;
                     if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                        sSql := sSql + '   AND (CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                     end;
                     if sCCustoIni <> '' then begin
                        sSql := sSql + ' AND (RTRIM(CODCENTROCUSTO) LIKE '''+sCCustoIni+'%'')';
                        sSql := sSql + ' AND (IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                     end;
                     if trim(sAtivSel) <> '' then begin
                        sSql := sSql + ' AND  (UNIDNEGOC IN (' + trim(sAtivSel) + ')) ';
                     end;
                     if sAtivProj <> '' then begin
                        sSql := sSql + ' AND (UNIDNEGOC = '+sAtivProj+')';
                     end;
                     if sPlano <> '' then begin
                        sSql := sSql + ' AND (IDPLANOPREV = '+sPlano+')';
                     end;
                     if sPatro <> '' then begin
                        sSql := sSql + ' AND (IDPATRO = '+sPatro+')';
                     end;

                     cdsSaldos.Data := GetDataPacket(sSql);
                     if not cdsSaldos.isEmpty then
                     begin
                        //FazUPdate do Ano Atual
                        dValAtu := dValAtu + cdsSaldos.FieldByName('SALDO').AsFloat;
                     end;
                     cdsCompConta.Next;
                  end;
                  if (sCodMoedaReal <> '') and (FcdsDemoLayoutTipo.FieldByName('FlagMonetaria').AsString = 'S') then begin
                     dCotacaoAtu := Contab.TestaCotacaoMoeda(StrToInt(sCodMoedaReal), StrToDate(sPerDataFim),false);
                     if dCotacaoAtu <> 0 then begin
                        dValAtu:=dValAtu/dCotacaoAtu;
                     end;
                  end;
                  if bEntrou then begin
                     FcdsDemoLayoutTipo.Edit;
                     FcdsDemoLayoutTipo.FieldByName(sColuna).AsFloat      := dValAtu/iDiv;
                     FcdsDemoLayoutTipo.FieldByName(sColuna+'S').AsString := FormatFloat('#,0.00;(#,0.00)',dValAtu/iDiv);
                     if i = 1 then begin
                        dPrimeiro := dValAtu;
                     end;
                     if i = iMax then begin
                        dUltimo := dValAtu;
                     end;
                     FcdsDemoLayoutTipo.FieldByName(sCalcu).AsString    := 'S';
                     if bNegativo then begin
                        FcdsDemoLayoutTipo.FieldByName(sColuna).AsFloat    := dValAtu/iDiv;
                        FcdsDemoLayoutTipo.FieldByName(sColuna+'S').AsString := FormatFloat('#,0.00;(#,0.00)',dValAtu/iDiv);
                     end else begin
                        if ((sNatureza= 'C') and
                           (FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString = 'C') and
                           (dValAtu < 0)) or
                           ((sNatureza= 'D') and
                           (FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString = 'D') and
                           (dValAtu < 0)) or
                           ((sNatureza= 'C') and
                           (FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString = 'D') and
                           (dValAtu > 0)) or
                           ((sNatureza= 'D') and
                           (FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString = 'C') and
                          (dValAtu > 0)) then begin
                           FcdsDemoLayoutTipo.FieldByName(sColuna).AsFloat  := (Abs(dValAtu)* (-1))/iDiv;
                           FcdsDemoLayoutTipo.FieldByName(sColuna+'S').AsString := FormatFloat('#,0.00;(#,0.00)',(Abs(dValAtu)* (-1))/iDiv);
                        end else begin
                           FcdsDemoLayoutTipo.FieldByName(sColuna).AsFloat  := Abs(dValAtu)/iDiv;
                           FcdsDemoLayoutTipo.FieldByName(sColuna+'S').AsString := FormatFloat('#,0.00;(#,0.00)',Abs(dValAtu)/iDiv);
                        end;
                     end;
                     FcdsDemoLayoutTipo.Post;
                  end;
               end;
               cdsColunas.Next;
               inc(i);
            end;
            FcdsDemoLayoutTipo.Edit;
            if dPrimeiro <> 0 then begin
               FcdsDemoLayoutTipo.FieldByName('PercEntrePrim_Ult').asFloat := ((dUltimo / dPrimeiro) * 100);
            end else begin
               FcdsDemoLayoutTipo.FieldByName('PercEntrePrim_Ult').asFloat := 0;
            end;
            FcdsDemoLayoutTipo.FieldByName('PercEntrePrim_UltS').AsString := FormatFloat('#,0.00;(#,0.00)',FcdsDemoLayoutTipo.FieldByName('PercEntrePrim_Ult').AsFloat);
            FcdsDemoLayoutTipo.FieldByName('PeriodoIni').asString := sNomePerIni;
            FcdsDemoLayoutTipo.FieldByName('PeriodoFim').asString := sNomePerFim;
            FcdsDemoLayoutTipo.FieldByName('Exercicio').asString  := IntToStr(iExercicio);
            FcdsDemoLayoutTipo.FieldByName('DataUltDia').asString := sPerDataFim;
            FcdsDemoLayoutTipo.FieldByName('CCusto').asString     := sNomeCCusto;
            FcdsDemoLayoutTipo.FieldByName('AtivProj').asString   := sNomeAtivProj;

            FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').asFloat := FcdsDemoLayoutTipo.FieldByName('Coluna1').asFloat + FcdsDemoLayoutTipo.FieldByName('Coluna2').asFloat +
                                               FcdsDemoLayoutTipo.FieldByName('Coluna3').asFloat + FcdsDemoLayoutTipo.FieldByName('Coluna4').asFloat +
                                               FcdsDemoLayoutTipo.FieldByName('Coluna5').asFloat + FcdsDemoLayoutTipo.FieldByName('Coluna6').asFloat +
                                               FcdsDemoLayoutTipo.FieldByName('Coluna7').asFloat + FcdsDemoLayoutTipo.FieldByName('Coluna8').asFloat +
                                               FcdsDemoLayoutTipo.FieldByName('Coluna9').asFloat + FcdsDemoLayoutTipo.FieldByName('Coluna10').asFloat +
                                               FcdsDemoLayoutTipo.FieldByName('Coluna11').asFloat+ FcdsDemoLayoutTipo.FieldByName('Coluna12').asFloat;

            if (FcdsDemoLayoutTipo.FieldByName('FLAGTIPONEGATIVO').AsString <> 'N') then begin
               FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').AsFloat := FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').asFloat;
            end else begin
               if Modulo.TestaNatureza(sNatureza,
                  FcdsDemoLayoutTipo.FieldByName('NATUREZAELEMENTO').AsString, FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').AsFloat) then begin
                  FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').AsFloat := Abs(FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').AsFloat)* (-1);
               end else begin
                  FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').AsFloat := Abs(FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').AsFloat);
               end;
            end;
            FcdsDemoLayoutTipo.FieldByName('SomatorioLinhaS').AsString := FormatFloat('#,0.00;(#,0.00)',FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').AsFloat);
            FcdsDemoLayoutTipo.Post;
            FcdsDemoLayoutTipo.Next;
         end;
         x:=1;
         iNumCalc:=0;
         while x = 1 do begin
            bEntrou:=False;

            FcdsDemoLayoutTipo.First;

            while not FcdsDemoLayoutTipo.EOF do begin
               i:=1;

               dPrimeiro   := 0;
               dUltimo     := 0;
               cdsColunas.First;
               while not cdsColunas.eof do begin
                  sColuna   := 'Coluna' + IntToStr(i);
                  sCalcu    := 'FlagCalcInterna' + IntToStr(i);
                  bmSavePlace := FcdsDemoLayoutTipo.GetBookmark;

                  if FcdsDemoLayoutTipo.FieldByName(sCalcu).AsString <> 'S' then begin
                     bEntrou:=True;

                     cdsLinhaxColuna.Data := ListaLinhaxColuna(cdsColunas.FieldByName('IDDEMONSTRATIVO').AsInteger,
                                                         cdsColunas.FieldByName('NUMCOLUNA').AsInteger,
                                                         FcdsDemoLayoutTipo.FieldByName('CodigoLinha').AsInteger);

                     if not cdsLinhaxColuna.IsEmpty then begin
                        dValAtu:=0;

                        cdsCompSomatorio.Data := ListaCompSomatorio(cdsLinhaxColuna.FieldByName('IDELEMDEMONSTRAT').asInteger);

                        bCalc     := True;

                        cdsCompSomatorio.First;
                        while not cdsCompSomatorio.EOF do begin

                           //Verificaçao do tipo de operação para cálculo da fórmula
                           sOper := cdsCompSomatorio.FieldByName('FLGOPERACAO').asString;

                           //Verifica se ha condicional e processa ela
                           if cdsCompSomatorio.FieldByName('ELECONDICAO').isNull then begin
                              sCond := '';
                              dValorCond := 0;
                           end else begin
                              sCond := cdsCompSomatorio.FieldByName('ELECONDICAO').asString;
                              dValorCond := cdsCompSomatorio.FieldByName('ELEVALORCOND').asFloat;
                           end;

                           cdsLinhasxColunas.Data := ListaLinhasxColunas(cdsColunas.FieldByName('IDDEMONSTRATIVO').AsInteger,cdsCompSomatorio.FieldByName('ELEMENTODEM').AsInteger);

                           sColuna1 := 'Coluna' + IntToStr(cdsLinhasxColunas.FieldByName('NUMCOLUNA').AsInteger);
                           sCalcu1  := 'FlagCalcInterna' + IntToStr(cdsLinhasxColunas.FieldByName('NUMCOLUNA').AsInteger);

                           FcdsDemoLayoutTipo.First;
                           while not FcdsDemoLayoutTipo.EOF do begin

                              if cdsLinhasxColunas.FieldByName('IDLINHA').AsInteger = FcdsDemoLayoutTipo.FieldByName('CodigoLinha').AsInteger then begin
                                 if FcdsDemoLayoutTipo.FieldByName(sCalcu1).AsString = 'S' then begin
                                    dValAtu := FazFormula(dValAtu, FcdsDemoLayoutTipo.FieldByName(sColuna1).AsFloat, sOper, sCond, dValorCond);
                                 end else begin
                                    bCalc:=False;
                                    Break;
                                 end;
                              end;
                              FcdsDemoLayoutTipo.Next;
                           end;
                           cdsCompSomatorio.Next;
                        end;
                     end;
                     FcdsDemoLayoutTipo.GotoBookmark(bmSavePlace);
                     if bCalc then begin
                        Inc(iNumCalc);
                        FcdsDemoLayoutTipo.Edit;
                        FcdsDemoLayoutTipo.FieldByName(sColuna).AsFloat := dValAtu/iDiv;
                        FcdsDemoLayoutTipo.FieldByName(sCalcu).AsString := 'S';
                        FcdsDemoLayoutTipo.FieldByName(sColuna+'S').AsString := FormatFloat('#,0.00;(#,0.00)',dValAtu/iDiv);
                        if bNegativo then begin
                           FcdsDemoLayoutTipo.FieldByName(sColuna).AsFloat    := dValAtu/iDiv;
                           FcdsDemoLayoutTipo.FieldByName(sColuna+'S').AsString := FormatFloat('#,0.00;(#,0.00)',dValAtu/iDiv);
                        end else begin
                           if ((sNatureza= 'C') and
                              (FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString = 'C') and
                              (dValAtu < 0)) or
                              ((sNatureza= 'D') and
                              (FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString = 'D') and
                              (dValAtu < 0)) or
                              ((sNatureza= 'C') and
                              (FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString = 'D') and
                              (dValAtu > 0)) or
                              ((sNatureza= 'D') and
                              (FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString = 'C') and
                             (dValAtu > 0)) then begin
                              FcdsDemoLayoutTipo.FieldByName(sColuna).AsFloat  := (Abs(dValAtu)* (-1))/iDiv;
                              FcdsDemoLayoutTipo.FieldByName(sColuna+'S').AsString := FormatFloat('#,0.00;(#,0.00)',(Abs(dValAtu)* (-1))/iDiv);
                           end else begin
                              FcdsDemoLayoutTipo.FieldByName(sColuna).AsFloat  := Abs(dValAtu)/iDiv;
                              FcdsDemoLayoutTipo.FieldByName(sColuna+'S').AsString := FormatFloat('#,0.00;(#,0.00)',Abs(dValAtu)/iDiv);
                           end;
                        end;
                        FcdsDemoLayoutTipo.Post;
                     end else begin
                        break;
                     end;
                  end;
                  if i = 1 then begin
                     dPrimeiro := FcdsDemoLayoutTipo.FieldByName(sColuna).AsFloat;
                  end;
                  if i = iMax then begin
                     dUltimo   := FcdsDemoLayoutTipo.FieldByName(sColuna).AsFloat;
                  end;
                  inc(i);
                  cdsColunas.Next;
               end;
               if bCalc then begin
                  FcdsDemoLayoutTipo.Edit;
                  if dPrimeiro <> 0 then begin
                     FcdsDemoLayoutTipo.FieldByName('PercEntrePrim_Ult').asFloat := ((dUltimo / dPrimeiro) * 100);
                  end else begin
                     FcdsDemoLayoutTipo.FieldByName('PercEntrePrim_Ult').asFloat := 0;
                  end;
                  FcdsDemoLayoutTipo.FieldByName('PercEntrePrim_UltS').AsString := FormatFloat('#,0.00;(#,0.00)',FcdsDemoLayoutTipo.FieldByName('PercEntrePrim_Ult').AsFloat);
                  FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').asFloat := FcdsDemoLayoutTipo.FieldByName('Coluna1').asFloat + FcdsDemoLayoutTipo.FieldByName('Coluna2').asFloat +
                                                           FcdsDemoLayoutTipo.FieldByName('Coluna3').asFloat + FcdsDemoLayoutTipo.FieldByName('Coluna4').asFloat +
                                                           FcdsDemoLayoutTipo.FieldByName('Coluna5').asFloat + FcdsDemoLayoutTipo.FieldByName('Coluna6').asFloat +
                                                           FcdsDemoLayoutTipo.FieldByName('Coluna7').asFloat + FcdsDemoLayoutTipo.FieldByName('Coluna8').asFloat +
                                                           FcdsDemoLayoutTipo.FieldByName('Coluna9').asFloat + FcdsDemoLayoutTipo.FieldByName('Coluna10').asFloat +
                                                           FcdsDemoLayoutTipo.FieldByName('Coluna11').asFloat+ FcdsDemoLayoutTipo.FieldByName('Coluna12').asFloat;
                  if (FcdsDemoLayoutTipo.FieldByName('FLAGTIPONEGATIVO').AsString <> 'N') then begin
                     FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').AsFloat := FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').asFloat;
                  end else begin
                     if Modulo.TestaNatureza(sNatureza,
                        FcdsDemoLayoutTipo.FieldByName('NATUREZAELEMENTO').AsString, FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').AsFloat) then begin
                        FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').AsFloat := Abs(FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').AsFloat)* (-1);
                     end else begin
                        FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').AsFloat := Abs(FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').AsFloat);
                     end;
                  end;
                  FcdsDemoLayoutTipo.FieldByName('SomatorioLinhaS').AsString := FormatFloat('#,0.00;(#,0.00)',FcdsDemoLayoutTipo.FieldByName('SomatorioLinha').AsFloat);
                  FcdsDemoLayoutTipo.Post;
               end;
               If FcdsDemoLayoutTipo.State = dsBrowse then FcdsDemoLayoutTipo.Edit;
               FcdsDemoLayoutTipo.FieldByName('PeriodoIni').asString := sNomePerIni;
               FcdsDemoLayoutTipo.FieldByName('PeriodoFim').asString := sNomePerFim;
               FcdsDemoLayoutTipo.FieldByName('Exercicio').asString  := IntToStr(iExercicio);
               FcdsDemoLayoutTipo.FieldByName('DataUltDia').asString := sPerDataFim;
               FcdsDemoLayoutTipo.FieldByName('CCusto').asString     := sNomeCCusto;
               FcdsDemoLayoutTipo.FieldByName('AtivProj').asString   := sNomeAtivProj;
               FcdsDemoLayoutTipo.Next;
            end;
            if not bEntrou then Break;
            if iNumCalc = 0 then begin
               Break;
               Abort;
            end;
         end;
      Except
         Result := false;
      End;

   Finally
     cdsColunas.free;
     cdsCompConta.free;
     cdsLinhaxColuna.free;
     cdsCompSomatorio.free;
     cdsLinhasxColunas.free;
     cdsSaldos.free;
     Free;
   End;

end;


function TCtrlRptDemonstrativo.MontaSqlDemoNormal(iDemo,iPlano,iExercicio,iPeriodoIni,iPeriodoFim:Integer;
                                      sNatureza,sCCustoIni,sAtivProj,sTipoOperResult,
                                      sDataIni,sCodMoedaReal,sCodMoedaOrc,sPlanoPrev,sPatro,sAtivSel:string;
                                      dEmpresa:Double;bDivide,bDesconResult,bMenosOrcado:Boolean) :Boolean;

var sSalto, sInt1, sInt2, sInt3, sSql, sCond, sOper, sDataRef, sEspacos : string;
    dValorResultD, dValorResultC, dValorResult, dCotacaoAtu, dCotacaoAnt : Double;

    dValorCond, dValorRea, dValorOrc, dValReaMes, dValAntMes, dValOrcMes : Double;
    dValReaAno, dValAntAno, dValOrcAno, dValMesAnt : Double;
    dValDeb, dValCre, dValMov, dValSaldoIni : Double;

    bCalc, bEntrou : Boolean;
    iDiv, iNumCalc, x, iLinha, i, iLinhaSalto, iLinha1, iLinha2, iLinha3 : Integer;
    iElem100 : LongInt;
    bmSavePlace : TBookmark;

    cdsSaldos        :TClientDataSet;
    cdsCompConta     :TClientDataSet;
    cdsLancResultado :TClientDataSet;
    cdsCompSomatorio :TClientDataSet;
    cdsPeriodoSaldo  :TClientDataSet;
    sNomePerIni,sNomePerFim,sNomeCCusto,sNomeAtivProj,sPerDataFim :string;

begin
   result := True;
   cdsCompConta     := TClientDataSet.Create(nil);
   cdsSaldos        := TClientDataSet.Create(nil);
   cdsLancResultado := TClientDataSet.Create(nil);
   cdsCompSomatorio := TClientDataSet.Create(nil);
   cdsPeriodoSaldo  := TClientDataSet.Create(nil);

   With TCMSqlParams.Create(nil) Do
   Try

      Try

         SQL.Clear;
         SQL.Add('SELECT                                                                        ');
         SQL.Add('   (''                               '') as PATRO,       ');
         SQL.Add('   (''                               '') as PLANO,       ');

         SQL.Add('   (0) AS SaldoRealPerEAT, (0) AS SaldoOrcPerEAT,                             ');
         SQL.Add('   (0) AS SaldoRealAcumEAT, (0) AS SaldoOrcAcumEAT,                           ');
         SQL.Add('   (0) AS SaldoRealPerEAN, (0) AS SaldoRealAcumEAN,                           ');
         SQL.Add('   (0) AS SaldoReaPerAntEAT,                                                  ');
         SQL.Add('   (0) AS SaldRealPerEATS, (0) AS SaldOrcPerEATS,                             ');
         SQL.Add('   (0) AS SaldRealAcumEATS, (0) AS SaldOrcAcumEATS,                           ');
         SQL.Add('   (0) AS SaldRealPerEANS, (0) AS SaldRealAcumEANS,                           ');
         SQL.Add('   (0) AS SaldReaPerAntEATS,                                                  ');
         SQL.Add('   (0) AS DifOrcRealPerEAT,                                                   ');
         SQL.Add('   (0) AS AV_RealPerEAT, (0) AS AV_OrcPerEAT, (0) AS AH_OrcRealPerEAT,        ');
         SQL.Add('   (0) AS DifOrcRealAcumEAT,                                                  ');
         SQL.Add('   (0) AS AV_RealAcumEAT, (0) AS AV_OrcAcumEAT, (0) AS AH_OrcRealAcumEAT,     ');
         SQL.Add('   (0) AS DifExAtuAntPer, (0) AS AV_RealPerEAN,  E.ELEORDEMLINHA,             ');
         SQL.Add('   (0) AS AH_ExAtuAntPer, (0) AS DifExAtuAntAcum,  E.FLGMONETARIA,            ');
         SQL.Add('   (0) AS AV_RealAcumEAN, (0) AS AH_ExAtuAntAcum,                             ');
         SQL.Add('   (0) AS DifPerAtuAntEAT, (0) AS AV_RealPerAntEAT, (0) AS AH_PerAtuAntEAT,   ');
         SQL.Add('   (0) AS SaldoIniEAT, (0) AS TotalDebPerEAT, (0) AS TotalCrePerEAT,          ');
         SQL.Add('   (0) AS MovPerEAT, (''N'') AS FlagCalcInterna, E.FLGTIPONEGATIVO AS FlagTipoNegativo, ');
         SQL.Add('   (''                                                                              '') AS NomeElementoInd, ');
         SQL.Add('   E.ELEDESCELEM AS NomeElemento, E.ELEORDEMLINHA AS OrdemElemento,           ');
         SQL.Add('   E.IDELEMDEMONSTRAT AS CodigoElemento, E.ELETIPOELEM AS TipoElemento,       ');
         SQL.Add('   E.FLGNATUREZA AS NaturezaElemento, E.FLGINDENTACAO AS Indentacao,          ');
         SQL.Add('   E.FLGMONETARIA AS FlagMonetaria, E.IDELEMANAVERTICAL AS ElemAnaliseVert,   ');
         SQL.Add('   E.ELECODIGO AS Codigo, ('' '') AS SaltaPag, ('' '') AS Linha1, (''         '') AS DATAULTDIA,   ');
         SQL.Add('   ('' '') AS Linha2, ('' '') AS Linha3, (''          '') AS CCusto, (''          '') AS AtivProj, ');
         SQL.Add('   E.FLGSALTAPAGINA AS FlagInterna1, E.FLGTIPOLINHA AS FlagInterna2,               ');
         SQL.Add('   (''               '') AS PERIODOINI, (''               '') AS PERIODOFIM, (''    '') AS EXERCICIO,');

         SQL.Add('   (''    '') AS EXERCICIOANT ');

         SQL.Add('FROM                                                                          ');
         SQL.Add('   ELEMDEMONSTRATIVO E                                                        ');
         SQL.Add('WHERE                                                                         ');
         SQL.Add('    (E.IDDEMONSTRATIVO =:IDDEMONSTRATIVO)                                     ');
         SQL.Add('ORDER BY                                                                      ');
         SQL.Add('    E.ELEORDEMLINHA                                                           ');

         Prepare;

         ParamByName('IDDEMONSTRATIVO').asInteger := iDemo;

         FcdsDemoLayoutTipo.Data :=  Data;


         if bDivide then
            iDiv := 1000
         else
            iDiv := 1;

         // pega nome do periodo inicial
         cdsPeriodoSaldo.Data := ListaDadosPeriodo(dEmpresa,iExercicio ,iPeriodoIni);
         sNomePerIni := cdsPeriodoSaldo.FieldByName('PERNOME').asString;

         // pega nome do periodo final
         cdsPeriodoSaldo.Data := ListaDadosPeriodo(dEmpresa,iExercicio ,iPeriodoFim);
         sNomePerFim := cdsPeriodoSaldo.FieldByName('PERNOME').asString;
         sPerDataFim := cdsPeriodoSaldo.FieldByName('PERDATFIM').asString;

         // pega nome da Atividade e projeto se tiver
         if sAtivProj <> '' then
         begin
           cdsTitulos.Data := ListaNomeAtivProj(dEmpresa,sAtivProj);
           sNomeAtivProj := cdsTitulos.FieldByName('NOME').asString;
         end else
           sNomeAtivProj := '';

         // pega nome do centro de custo se tiver
         if sCCustoIni <> '' then
         begin
           cdsTitulos.Data := ListaNomeCCusto(dEmpresa,sCCustoIni);
           sNomeCCusto := cdsTitulos.FieldByName('NOME').asString;
         end else
           sNomeCCusto := '';

         //zera o acumulador de salto de pagina
         iLinhaSalto := 0;
         iLinha1     := 0;
         iLinha2     := 0;
         iLinha3     := 0;

         sSalto  := 'N';
         sInt1   := 'N';
         sInt2   := 'N';
         sInt3   := 'N';

         FcdsDemoLayoutTipo.First;
         while not FcdsDemoLayoutTipo.EOF do begin

            FcdsDemoLayoutTipo.Edit;

            ListaPlanoPatro( iPlano , StrToInt( sPatro ) );
            FcdsDemoLayoutTipo.FieldByName('Plano').asString := sNomePlano;
            FcdsDemoLayoutTipo.FieldByName('Patro').asString := sNomePatro;


            //Configura os Saltos de página
            if sSalto = 'S' then begin
               inc(iLinhaSalto);
               sSalto := 'N';
            end;
            if FcdsDemoLayoutTipo.FieldByName('FLAGINTERNA1').asString = 'S' then begin
               sSalto := 'S';
            end;
            FcdsDemoLayoutTipo.FieldByName('SALTAPAG').asString := IntToStr(iLinhaSalto);

            //Configura as linhas do relatório
            if sInt1 = 'E' then begin
               inc(iLinha1);
               sInt1 := 'N';
            end;
            if FcdsDemoLayoutTipo.FieldByName('FLAGINTERNA2').asString = 'E' then begin
               sInt1 := 'E';
            end;
            FcdsDemoLayoutTipo.FieldByName('LINHA1').asString := IntTOStr(iLinha1);

            //Configura as linhas do relatório
            if sInt2 = 'F' then begin
               inc(iLinha2);
               sInt2 := 'N';
            end;
            if FcdsDemoLayoutTipo.FieldByName('FLAGINTERNA2').asString = 'F' then begin
               sInt2 := 'F';
            end;
            FcdsDemoLayoutTipo.FieldByName('LINHA2').asString := IntTOStr(iLinha2);

            //Configura as linhas do relatório
            if sInt3 = 'G' then begin
               inc(iLinha3);
               sInt3 := 'N';
            end;
            if FcdsDemoLayoutTipo.FieldByName('FLAGINTERNA2').asString = 'G' then begin
               sInt3 := 'G';
            end;
            FcdsDemoLayoutTipo.FieldByName('LINHA3').asString := IntTOStr(iLinha3);

            cdsCompConta.Data := ListaCompConta(FcdsDemoLayoutTipo.FieldByName('CodigoElemento').asInteger);

            dValReaMes := 0;
            dValOrcMes := 0;
            dValReaAno := 0;
            dValOrcAno := 0;
            dValAntMes := 0;
            dValMesAnt := 0;
            dValAntAno := 0;

            dValDeb      := 0;
            dValCre      := 0;
            dValSaldoIni := 0;
            //
            if not cdsCompConta.IsEmpty then begin
               cdsCompConta.First;
               While not cdsCompConta.EOF do begin
                  //Ano Atual Periodo Atual
                  if sNatureza = 'C' then begin
                     sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR) -               ';
                     sSql := sSql + '           DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE)) AS SALDO,        ';
                     sSql := sSql + '       SUM(DECODE(S.PLSORCADOCREDITO,NULL,0,S.PLSORCADOCREDITO) -               ';
                     sSql := sSql + '           DECODE(S.PLSORCADODEBITO,NULL,0,S.PLSORCADODEBITO)) AS SALDOORC,     ';
                  end else begin
                     sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE) -                 ';
                     sSql := sSql + '           DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR)) AS SALDO,      ';
                     sSql := sSql + '       SUM(DECODE(S.PLSORCADODEBITO,NULL,0,S.PLSORCADODEBITO) -               ';
                     sSql := sSql + '           DECODE(S.PLSORCADOCREDITO,NULL,0,S.PLSORCADOCREDITO)) AS SALDOORC,     ';
                  end;
                  sSql := sSql + 'S.PERNUMERO, P.PERDATFIM                                                           ';
                  sSql := sSql + 'FROM PLANOSALDO S, PERIODO P                                                       ';
                  sSql := sSql + 'WHERE (S.PLACONTA = '''+cdsCompConta.FieldByName('PLACONTA').AsString+''')           ';
                  sSql := sSql + '      AND (S.PLANO = '+IntToStr(iPlano)+')                                ';
                  sSql := sSql + '      AND (S.IDPESSOA = '+FloatToStr(dEmpresa)+')                             ';
                  sSql := sSql + '      AND (S.PEREXERCICIO = '+IntToStr(iExercicio)+')                           ';
                  sSql := sSql + '      AND ((S.PERNUMERO  <= '+IntToStr(iPeriodoFim)+')                             ';
                  sSql := sSql + '      OR   (S.PERNUMERO  IS NULL))                                                   ';
                  sSql := sSql + '      AND (S.PERNUMERO = P.PERNUMERO(+)                ) ';
                  sSql := sSql + '      AND (S.PEREXERCICIO = P.PEREXERCICIO(+)          ) ';
                  sSql := sSql + '      AND (S.IDPESSOA = P.IDPESSOA(+)                  ) ';
                  if not cdsCompConta.FieldByName('CODCENTROCUSTO').isNull then begin
                     sSql := sSql + '   AND (S.CODCENTROCUSTO LIKE '''+cdsCompConta.FieldByName('CODCENTROCUSTO').AsString+'%'') ';
                  end;
                  if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                     sSql := sSql + '   AND (S.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                  end;
                  if not cdsCompConta.FieldByName('IDPATRO').isNull then begin
                     sSql := sSql + '   AND (S.IDPATRO = '+cdsCompConta.FieldByName('IDPATRO').AsString+') ';
                  end;
                  if not cdsCompConta.FieldByName('IDPLANOPREV').isNull then begin
                     sSql := sSql + '   AND (S.IDPLANOPREV = '+cdsCompConta.FieldByName('IDPLANOPREV').AsString+') ';
                  end;
                  if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                     sSql := sSql + '   AND (S.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                  end;
                  if sCCustoIni <> '' then begin
                     sSql := sSql + ' AND (RTRIM(S.CODCENTROCUSTO) LIKE '''+sCCustoIni+'%'')';
                     sSql := sSql + ' AND (S.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                  end;
                  if trim(sAtivSel) <> '' then begin
                     sSql := sSql + ' AND  (S.UNIDNEGOC IN (' + trim(sAtivSel) + ')) ';
                  end;
                  if sAtivProj <> '' then begin
                     sSql := sSql + ' AND (S.UNIDNEGOC = '+sAtivProj+')';
                  end;
                  if sPlanoPrev <> '' then begin
                     sSql := sSql + ' AND (IDPLANOPREV IN ( '+sPlanoPrev+'))';
                  end;
                  if sPatro <> '' then begin
                     sSql := sSql + ' AND (IDPATRO IN ('+sPatro+'))';
                  end;
                  sSql := sSql + '   GROUP BY S.PERNUMERO,P.PERDATFIM  ';

                  cdsSaldos.Data := GetDataPacket(sSql);
                  if not cdsSaldos.isEmpty then begin   //FazUPdate do Ano Atual
                     cdsSaldos.First;
                     While not cdsSaldos.EOF do begin
                        dValorResult := 0;
                        if (bDesconResult) and (sTipoOperResult <> '') then begin
                           if sNatureza = 'C' then begin
                              sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';
                           end else begin
                              sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';
                           end;
                           sSql := sSql + 'FROM PLANILHA P, LANCAMENTO L                                                       ';
                           sSql := sSql + 'WHERE     (L.PLACONTA LIKE '''+cdsCompConta.FieldByName('PLACONTA').AsString+'%'+''')           ';
                           sSql := sSql + '      AND (L.PLANO = '+IntToStr(iPlano)+')                                ';
                           sSql := sSql + '      AND (P.IDPESSOA = '+FloatToStr(dEmpresa)+')                         ';
                           sSql := sSql + '      AND (L.TIPCODIGO = '''+sTipoOperResult+''')                         ';
                           if cdsSaldos.FieldByName('PERNUMERO').IsNull then begin
                              sSql := sSql + '      AND (P.PEREXERCICIO = '+IntToStr(iExercicio)+')                  ';
                              sSql := sSql + '      AND (P.PERNUMERO  IS NULL)                                                  ';
                           end else begin

                              cdsPeriodoSaldo.Data := ListaDadosPeriodo(dEmpresa,iExercicio ,cdsSaldos.FieldByName('PERNUMERO').AsInteger);
                              sSql := sSql + '      AND (P.PLNDATDIA >= TO_DATE('''+cdsPeriodoSaldo.FieldByName('PERDATINI').AsString+''',''DD/MM/YYYY'')) ';
                              sSql := sSql + '      AND (P.PLNDATDIA <= TO_DATE('''+cdsPeriodoSaldo.FieldByName('PERDATFIM').AsString+''',''DD/MM/YYYY'')) ';

                           end;
                           sSql := sSql + '      AND (P.PLNCODIGO = L.PLNCODIGO) ';
                           if not cdsCompConta.FieldByName('CODCENTROCUSTO').isNull then begin
                              sSql := sSql + '   AND (L.CODCENTROCUSTO LIKE '''+cdsCompConta.FieldByName('CODCENTROCUSTO').AsString+'%'') ';
                              sSql := sSql + '   AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                           end;
                           if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                              sSql := sSql + '   AND (L.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                              sSql := sSql + '   AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;
                           if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                              sSql := sSql + ' AND (L.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                              sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;
                           if sCCustoIni <> '' then begin
                              sSql := sSql + ' AND (RTRIM(L.CODCENTROCUSTO) LIKE '''+sCCustoIni+'%'')';
                              sSql := sSql + ' AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                           end;
                           if trim(sAtivSel) <> '' then begin
                             sSql := sSql + ' AND  (L.UNIDNEGOC IN (' + trim(sAtivSel) + ')) ';
                          end;
                          if sAtivProj <> '' then begin
                              sSql := sSql + ' AND (L.UNIDNEGOC = '+sAtivProj+')';
                              sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;

                           cdsLancResultado.Data := GetDataPacket(sSql);
                           if not cdsLancResultado.IsEmpty then
                              dValorResult := cdsLancResultado.FieldByName('SALDO').AsFloat;

                        end;
                        dValorRea  := cdsSaldos.FieldByName('SALDO').AsFloat - dValorResult;
                        dValorOrc  := cdsSaldos.FieldByName('SALDOORC').AsFloat;
                        if (sCodMoedaReal <> '') and (FcdsDemoLayoutTipo.FieldByName('FLGMONETARIA').AsString = 'S') then begin
                           if cdsSaldos.FieldByName('PERDATFIM').isNull then begin
                              sDataRef := sDataIni;
                           end else begin
                              sDataRef := cdsSaldos.FieldByName('PERDATFIM').AsString;
                           end;
                           dCotacaoAtu := Contab.TestaCotacaoMoeda(StrToInt(sCodMoedaReal),
                                         StrToDate(sDataRef),false);
                           if dCotacaoAtu <> 0 then begin
                              dValorRea:= dValorRea/dCotacaoAtu;
                           end else begin
                              dValorRea:= 0;
                           end;
                        end;
                        if (sCodMoedaOrc <> '') and (FcdsDemoLayoutTipo.FieldByName('FLGMONETARIA').AsString = 'S') then begin
                           if cdsSaldos.FieldByName('PERDATFIM').isNull then begin
                              sDataRef := sDataIni;
                           end else begin
                              sDataRef := cdsSaldos.FieldByName('PERDATFIM').AsString;
                           end;
                           dCotacaoAtu:= Contab.TestaCotacaoMoeda(StrToInt(sCodMoedaOrc),
                                        StrToDate(sDataRef),false);
                           if dCotacaoAtu <> 0 then begin
                              dValorOrc:= dValorOrc/dCotacaoAtu;
                           end else begin
                              dValorOrc:= 0;
                           end;
                        end;
                        if (cdsSaldos.FieldByName('PERNUMERO').AsInteger >= iPeriodoIni) and
                           (cdsSaldos.FieldByName('PERNUMERO').AsInteger <= iPeriodoFim) then begin
                           dValReaMes := dValReaMes + dValorRea;
                           dValOrcMes := dValOrcMes + dValorOrc;
                        end;
                        dValReaAno := dValReaAno + dValorRea;
                        dValOrcAno := dValOrcAno + dValorOrc;
                        cdsSaldos.Next;
                     end;
                  end;

                  //Ano Atual Periodo Anterior
                  if sNatureza = 'C' then begin
                     sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR) -               ';
                     sSql := sSql + '           DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE)) AS SALDO,        ';
                  end else begin
                     sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE) -                 ';
                     sSql := sSql + '           DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR)) AS SALDO,      ';
                  end;
                  sSql := sSql + 'S.PERNUMERO, P.PERDATFIM                                                           ';
                  sSql := sSql + 'FROM PLANOSALDO S, PERIODO P                                                       ';
                  sSql := sSql + 'WHERE (S.PLACONTA = '''+cdsCompConta.FieldByName('PLACONTA').AsString+''')           ';
                  sSql := sSql + '      AND (S.PLANO = '+IntToStr(iPlano)+')                                ';
                  sSql := sSql + '      AND (S.IDPESSOA = '+FloatToStr(dEmpresa)+')                             ';
                  sSql := sSql + '      AND (S.PEREXERCICIO = '+IntToStr(iExercicio)+')                           ';
                  if (iPeriodoFim - 1) <> 0 then begin
                     sSql := sSql + '      AND ((S.PERNUMERO  <= '+IntToStr(iPeriodoFim - 1) +') ';
                     sSql := sSql + '      OR   (S.PERNUMERO  IS NULL))                                                   ';
                  end else begin
                     sSql := sSql + '      AND (S.PERNUMERO  IS NULL)                                                   ';
                  end;
                  sSql := sSql + '      AND (S.PERNUMERO = P.PERNUMERO(+)                ) ';
                  sSql := sSql + '      AND (S.PEREXERCICIO = P.PEREXERCICIO(+)          ) ';
                  sSql := sSql + '      AND (S.IDPESSOA = P.IDPESSOA(+)                  ) ';
                  if not cdsCompConta.FieldByName('CODCENTROCUSTO').isNull then begin
                     sSql := sSql + '   AND (S.CODCENTROCUSTO LIKE '''+cdsCompConta.FieldByName('CODCENTROCUSTO').AsString+'%'') ';
                  end;
                  if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                     sSql := sSql + '   AND (S.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                  end;
                  if not cdsCompConta.FieldByName('IDPATRO').isNull then begin
                     sSql := sSql + '   AND (S.IDPATRO = '+cdsCompConta.FieldByName('IDPATRO').AsString+') ';
                  end;
                  if not cdsCompConta.FieldByName('IDPLANOPREV').isNull then begin
                     sSql := sSql + '   AND (S.IDPLANOPREV = '+cdsCompConta.FieldByName('IDPLANOPREV').AsString+') ';
                  end;
                  if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                     sSql := sSql + '   AND (S.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                  end;
                  if sCCustoIni <> '' then begin
                     sSql := sSql + ' AND (RTRIM(S.CODCENTROCUSTO) LIKE '''+sCCustoIni+'%'')';
                     sSql := sSql + ' AND (S.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                  end;
                  if trim(sAtivSel) <> '' then begin
                     sSql := sSql + ' AND  (S.UNIDNEGOC IN (' + trim(sAtivSel) + ')) ';
                  end;
                  if sAtivProj <> '' then begin
                     sSql := sSql + ' AND (S.UNIDNEGOC = '+sAtivProj+')';
                  end;
                  if sPlanoPrev <> '' then begin
                     sSql := sSql + ' AND (IDPLANOPREV IN ('+sPlanoPrev+'))';
                  end;
                  if sPatro <> '' then begin
                     sSql := sSql + ' AND (IDPATRO IN ('+sPatro+'))';
                  end;
                  sSql := sSql + '   GROUP BY S.PERNUMERO,P.PERDATFIM  ';

                  cdsSaldos.Data := GetDataPacket(sSql);
                  if not cdsSaldos.isEmpty then begin   //FazUPdate do Ano Anterior
                     cdsSaldos.First;
                     While not cdsSaldos.EOF do begin
                        dValorResult := 0;
                        if (bDesconResult) and (sTipoOperResult <> '') then begin
                           if sNatureza = 'C' then begin
                              sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';
                           end else begin
                              sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';
                           end;
                           sSql := sSql + 'FROM PLANILHA P, LANCAMENTO L                                                       ';
                           sSql := sSql + 'WHERE     (L.PLACONTA LIKE '''+cdsCompConta.FieldByName('PLACONTA').AsString+'%'+''')           ';
                           sSql := sSql + '      AND (L.PLANO = '+IntToStr(iPlano)+')                                ';
                           sSql := sSql + '      AND (P.IDPESSOA = '+FloatToStr(dEmpresa)+')                             ';
                           sSql := sSql + '      AND (L.TIPCODIGO = '''+sTipoOperResult+''')            ';
                           if cdsSaldos.FieldByName('PERNUMERO').IsNull then begin
                              sSql := sSql + '      AND (P.PEREXERCICIO = '+IntToStr(StrToInt(IntToStr(iExercicio)))+')    ';
                              sSql := sSql + '      AND (P.PERNUMERO  IS NULL)                                                 ';
                           end else begin
                              cdsPeriodoSaldo.Data := ListaDadosPeriodo(dEmpresa,iExercicio,cdsSaldos.FieldByName('PERNUMERO').AsInteger);
                              sSql := sSql + '      AND (P.PLNDATDIA >= TO_DATE('''+cdsPeriodoSaldo.FieldByName('PERDATINI').AsString+''',''DD/MM/YYYY'')) ';
                              sSql := sSql + '      AND (P.PLNDATDIA <= TO_DATE('''+cdsPeriodoSaldo.FieldByName('PERDATFIM').AsString+''',''DD/MM/YYYY'')) ';
                           end;
                           sSql := sSql + '      AND (P.PLNCODIGO = L.PLNCODIGO) ';
                           if not cdsCompConta.FieldByName('CODCENTROCUSTO').isNull then begin
                              sSql := sSql + '   AND (L.CODCENTROCUSTO LIKE '''+cdsCompConta.FieldByName('CODCENTROCUSTO').AsString+'%'') ';
                              sSql := sSql + '   AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                           end;
                           if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                              sSql := sSql + '   AND (L.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                              sSql := sSql + '   AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;
                           if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                              sSql := sSql + ' AND (L.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                              sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;
                           if sCCustoIni <> '' then begin
                              sSql := sSql + ' AND (RTRIM(L.CODCENTROCUSTO) LIKE '''+sCCustoIni+'%'')';
                              sSql := sSql + ' AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                           end;
                           if trim(sAtivSel) <> '' then begin
                              sSql := sSql + ' AND  (L.UNIDNEGOC IN (' + trim(sAtivSel) + ')) ';
                           end;
                           if sAtivProj <> '' then begin
                              sSql := sSql + ' AND (L.UNIDNEGOC = '+sAtivProj+')';
                              sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;

                           cdsLancResultado.Data := GetDataPacket(sSql);
                           if not cdsLancResultado.IsEmpty then
                              dValorResult := cdsLancResultado.FieldByName('SALDO').AsFloat;
                        end;
                        dValorRea  := cdsSaldos.FieldByName('SALDO').AsFloat - dValorResult;
                        if (sCodMoedaReal <> '') and (FcdsDemoLayoutTipo.FieldByName('FLGMONETARIA').AsString = 'S') then begin
                           if cdsSaldos.FieldByName('PERDATFIM').isNull then begin
                              sDataRef := sDataIni;
                           end else begin
                              sDataRef := cdsSaldos.FieldByName('PERDATFIM').AsString;
                           end;
                           dCotacaoAtu := Contab.TestaCotacaoMoeda(StrToInt(sCodMoedaReal),
                                        StrToDate(sDataRef),false);
                           if dCotacaoAtu <> 0 then begin
                              dValorRea:= dValorRea/dCotacaoAtu;
                           end else begin
                              dValorRea:= 0;
                           end;
                        end;
                        dValMesAnt := dValMesAnt + dValorRea;
                        cdsSaldos.Next;
                     end;
                  end;
                  //
                  //Ano Anterior
                  if sNatureza = 'C' then begin
                     sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR) -               ';
                     sSql := sSql + '           DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE)) AS SALDO,        ';
                  end else begin
                     sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE) -                 ';
                     sSql := sSql + '           DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR)) AS SALDO,      ';
                  end;
                  sSql := sSql + 'S.PERNUMERO, P.PERDATFIM                                                           ';
                  sSql := sSql + 'FROM PLANOSALDO S, PERIODO P                                                       ';
                  sSql := sSql + 'WHERE (S.PLACONTA = '''+cdsCompConta.FieldByName('PLACONTA').AsString+''')           ';
                  sSql := sSql + '      AND (S.PLANO = '+IntToStr(iPlano)+')                                ';
                  sSql := sSql + '      AND (S.IDPESSOA = '+FloatToStr(dEmpresa)+')                             ';
                  sSql := sSql + '      AND (S.PEREXERCICIO = '+IntToStr(iExercicio-1)+')     ';
                  sSql := sSql + '      AND ((S.PERNUMERO  <= '+IntToStr(iPeriodoFim)+')                             ';
                  sSql := sSql + '      OR   (S.PERNUMERO  IS NULL))                                                   ';
                  sSql := sSql + '      AND (S.PERNUMERO = P.PERNUMERO(+)                ) ';
                  sSql := sSql + '      AND (S.PEREXERCICIO = P.PEREXERCICIO(+)          ) ';
                  sSql := sSql + '      AND (S.IDPESSOA = P.IDPESSOA(+)                  ) ';
                  if not cdsCompConta.FieldByName('CODCENTROCUSTO').isNull then begin
                     sSql := sSql + '   AND (S.CODCENTROCUSTO LIKE '''+cdsCompConta.FieldByName('CODCENTROCUSTO').AsString+'%'') ';
                  end;
                  if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                     sSql := sSql + '   AND (S.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                  end;
                  if not cdsCompConta.FieldByName('IDPATRO').isNull then begin
                     sSql := sSql + '   AND (S.IDPATRO = '+cdsCompConta.FieldByName('IDPATRO').AsString+') ';
                  end;
                  if not cdsCompConta.FieldByName('IDPLANOPREV').isNull then begin
                     sSql := sSql + '   AND (S.IDPLANOPREV = '+cdsCompConta.FieldByName('IDPLANOPREV').AsString+') ';
                  end;
                  if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                     sSql := sSql + '   AND (S.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                  end;
                  if sCCustoIni <> '' then begin
                     sSql := sSql + ' AND (RTRIM(S.CODCENTROCUSTO) LIKE '''+sCCustoIni+'%'')';
                     sSql := sSql + ' AND (S.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                  end;
                  if trim(sAtivSel) <> '' then begin
                     sSql := sSql + ' AND  (S.UNIDNEGOC IN (' + trim(sAtivSel) + ')) ';
                  end;
                  if sAtivProj <> '' then begin
                     sSql := sSql + ' AND (S.UNIDNEGOC = '+sAtivProj+')';
                  end;
                  if sPlanoPrev <> '' then begin
                     sSql := sSql + ' AND (IDPLANOPREV IN ('+ sPlanoPrev + '))';
                  end;
                  if sPatro <> '' then begin
                     sSql := sSql + ' AND (IDPATRO IN ('+sPatro+'))';
                  end;
                  sSql := sSql + '   GROUP BY S.PERNUMERO,P.PERDATFIM ';

                  cdsSaldos.Data := GetDataPacket(sSql);
                  if not cdsSaldos.isEmpty then //FazUPdate do Ano Anterior
                  begin
                     cdsSaldos.First;
                     While not cdsSaldos.EOF do begin
                        dValorResult := 0;
                        if (bDesconResult) and (sTipoOperResult <> '') then begin
                           if sNatureza = 'C' then begin
                              sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';
                           end else begin
                              sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';
                           end;
                           sSql := sSql + 'FROM PLANILHA P, LANCAMENTO L                                                       ';
                           sSql := sSql + 'WHERE     (L.PLACONTA LIKE '''+cdsCompConta.FieldByName('PLACONTA').AsString+'%'+''')           ';
                           sSql := sSql + '      AND (L.PLANO = '+IntToStr(iPlano)+')                                ';
                           sSql := sSql + '      AND (P.IDPESSOA = '+FloatToStr(dEmpresa)+')                             ';
                           sSql := sSql + '      AND (L.TIPCODIGO = '''+sTipoOperResult+''')            ';
                           if cdsSaldos.FieldByName('PERNUMERO').IsNull then begin
                              sSql := sSql + '      AND (P.PEREXERCICIO = '+IntToStr(StrToInt(IntToStr(iExercicio))-1)+')    ';
                              sSql := sSql + '      AND (P.PERNUMERO  IS NULL)                                                 ';
                           end else begin
                              cdsPeriodoSaldo.Data := ListaDadosPeriodo(dEmpresa,(iExercicio-1),cdsSaldos.FieldByName('PERNUMERO').AsInteger);

                              sSql := sSql + '      AND (P.PLNDATDIA >= TO_DATE('''+cdsPeriodoSaldo.FieldByName('PERDATINI').AsString+''',''DD/MM/YYYY'')) ';
                              sSql := sSql + '      AND (P.PLNDATDIA <= TO_DATE('''+cdsPeriodoSaldo.FieldByName('PERDATFIM').AsString+''',''DD/MM/YYYY'')) ';
                           end;
                           sSql := sSql + '      AND (P.PLNCODIGO = L.PLNCODIGO) ';

                           if not cdsCompConta.FieldByName('CODCENTROCUSTO').isNull then begin
                              sSql := sSql + '   AND (L.CODCENTROCUSTO LIKE '''+cdsCompConta.FieldByName('CODCENTROCUSTO').AsString+'%'') ';
                              sSql := sSql + '   AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                           end;
                           if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                              sSql := sSql + '   AND (L.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                              sSql := sSql + '   AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;
                           if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                              sSql := sSql + ' AND (L.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                              sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;
                           if sCCustoIni <> '' then begin
                              sSql := sSql + ' AND (RTRIM(L.CODCENTROCUSTO) LIKE '''+sCCustoIni+'%'')';
                              sSql := sSql + ' AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                           end;
                           if trim(sAtivSel) <> '' then begin
                              sSql := sSql + ' AND  (L.UNIDNEGOC IN (' + trim(sAtivSel) + ')) ';
                           end;
                           if sAtivProj <> '' then begin
                              sSql := sSql + ' AND (L.UNIDNEGOC = '+sAtivProj+')';
                              sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;

                           cdsLancResultado.Data := GetDataPacket(sSql);
                           if not cdsLancResultado.IsEmpty then
                              dValorResult := cdsLancResultado.FieldByName('SALDO').AsFloat;
                        end;
                        dValorRea  := cdsSaldos.FieldByName('SALDO').AsFloat-dValorResult;
                        if (sCodMoedaReal <> '') and (FcdsDemoLayoutTipo.FieldByName('FLGMONETARIA').AsString = 'S') then begin
                           if cdsSaldos.FieldByName('PERDATFIM').isNull then begin
                              sDataRef := sDataIni;
                           end else begin
                              sDataRef := cdsSaldos.FieldByName('PERDATFIM').AsString;
                           end;
                           dCotacaoAtu := Contab.TestaCotacaoMoeda(StrToInt(sCodMoedaReal),
                                          StrToDate(sDataRef),false);
                           if dCotacaoAtu <> 0 then begin
                              dValorRea:= dValorRea/dCotacaoAtu;
                           end else begin
                              dValorRea:= 0;
                           end;
                        end;
                        if (cdsSaldos.FieldByName('PERNUMERO').AsInteger >= iPeriodoIni) and
                           (cdsSaldos.FieldByName('PERNUMERO').AsInteger <= iPeriodoFim) then begin
                           dValAntMes := dValAntMes + dValorRea;
                        end;
                        dValAntAno := dValAntAno + dValorRea;
                        cdsSaldos.Next;
                     end;
                  end;

                  //Movimentação
                  sSql := 'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(PLSDEBITOCORRENTE) AS DEB, SUM(PLSCREDITOCOR) AS CRE                         ';
                  sSql := sSql + 'FROM PLANOSALDO                                                                    ';
                  sSql := sSql + 'WHERE (PLACONTA = '''+cdsCompConta.FieldByName('PLACONTA').AsString+''')           ';
                  sSql := sSql + '      AND (PLANO = '+IntToStr(iPlano)+')                             ';
                  sSql := sSql + '      AND (IDPESSOA = '+FloatToStr(dEmpresa)+')                             ';
                  sSql := sSql + '      AND (PEREXERCICIO = '+IntToStr(iExercicio)+')     ';
                  sSql := sSql + '      AND (PERNUMERO BETWEEN '+IntToStr(iPeriodoIni) +' AND '+ IntToStr(iPeriodoFim)+') ';
                  if not cdsCompConta.FieldByName('CODCENTROCUSTO').isNull then begin
                     sSql := sSql + '   AND (CODCENTROCUSTO LIKE '''+cdsCompConta.FieldByName('CODCENTROCUSTO').AsString+'%'') ';
                  end;
                  if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                     sSql := sSql + '   AND (UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                  end;
                  if not cdsCompConta.FieldByName('IDPATRO').isNull then begin
                     sSql := sSql + '   AND (IDPATRO = '+cdsCompConta.FieldByName('IDPATRO').AsString+') ';
                  end;
                  if not cdsCompConta.FieldByName('IDPLANOPREV').isNull then begin
                     sSql := sSql + '   AND (IDPLANOPREV = '+cdsCompConta.FieldByName('IDPLANOPREV').AsString+') ';
                  end;
                  if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                     sSql := sSql + '   AND (CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                  end;
                  if sCCustoIni <> '' then begin
                     sSql := sSql + ' AND (RTRIM(CODCENTROCUSTO) LIKE '''+sCCustoIni+'%'')';
                     sSql := sSql + ' AND (IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                  end;
                  if trim(sAtivSel) <> '' then begin
                     sSql := sSql + ' AND  (UNIDNEGOC IN (' + trim(sAtivSel) + ')) ';
                  end;
                  if sAtivProj <> '' then begin
                     sSql := sSql + ' AND (UNIDNEGOC = '+sAtivProj+')';
                  end;
                  if sPlanoPrev <> '' then begin
                     sSql := sSql + ' AND (IDPLANOPREV IN ('+sPlanoPrev+'))';
                  end;
                  if sPatro <> '' then begin
                     sSql := sSql + ' AND (IDPATRO IN ('+sPatro+'))';
                  end;

                  cdsSaldos.Data := GetDataPacket(sSql);

                  if not cdsSaldos.IsEmpty then begin
                     dValorResultD := 0;
                     dValorResultC := 0;
                     if (bDesconResult) and (sTipoOperResult <> '') then begin
                        sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,0)) AS DEB,   ';
                        sSql := sSql + ' SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,0)) AS CRED   ';
                        sSql := sSql + 'FROM PLANILHA P, LANCAMENTO L                                                       ';
                        sSql := sSql + 'WHERE     (L.PLACONTA LIKE '''+cdsCompConta.FieldByName('PLACONTA').AsString+'%'+''')           ';
                        sSql := sSql + '      AND (L.PLANO = '+IntToStr(iPlano)+')                                ';
                        sSql := sSql + '      AND (P.IDPESSOA = '+FloatToStr(dEmpresa)+')                             ';
                        sSql := sSql + '      AND (L.TIPCODIGO = '''+sTipoOperResult+''')            ';

                        cdsPeriodoSaldo.Data := ListaDadosPeriodo(dEmpresa,iExercicio ,iPeriodoIni);
                        sSql := sSql + '      AND (P.PLNDATDIA >= TO_DATE('''+cdsPeriodoSaldo.FieldByName('PERDATINI').AsString+''',''DD/MM/YYYY'')) ';

                        cdsPeriodoSaldo.Data := ListaDadosPeriodo(dEmpresa,iExercicio ,iPeriodoFim);
                        sSql := sSql + '      AND (P.PLNDATDIA <= TO_DATE('''+cdsPeriodoSaldo.FieldByName('PERDATFIM').AsString+''',''DD/MM/YYYY'')) ';

                        sSql := sSql + '      AND (P.PLNCODIGO = L.PLNCODIGO) ';
                        if not cdsCompConta.FieldByName('CODCENTROCUSTO').isNull then begin
                           sSql := sSql + '   AND (L.CODCENTROCUSTO LIKE '''+cdsCompConta.FieldByName('CODCENTROCUSTO').AsString+'%'') ';
                           sSql := sSql + '   AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                        end;
                        if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                           sSql := sSql + '   AND (L.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                           sSql := sSql + '   AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                        end;
                        if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                           sSql := sSql + ' AND (L.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                           sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                        end;
                        if sCCustoIni <> '' then begin
                           sSql := sSql + ' AND (RTRIM(L.CODCENTROCUSTO) LIKE '''+sCCustoIni+'%'')';
                           sSql := sSql + ' AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                        end;
                        if trim(sAtivSel) <> '' then begin
                           sSql := sSql + ' AND  (L.UNIDNEGOC IN (' + trim(sAtivSel) + ')) ';
                        end;
                        if sAtivProj <> '' then begin
                           sSql := sSql + ' AND (L.UNIDNEGOC = '+sAtivProj+')';
                           sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                        end;

                        cdsLancResultado.Data := GetDataPacket(sSql);
                        if not cdsLancResultado.IsEmpty then begin
                           dValorResultD := cdsLancResultado.FieldByName('DEB').AsFloat;
                           dValorResultC := cdsLancResultado.FieldByName('CRED').AsFloat;
                        end;
                     end;
                     //FazUPdate da Movimentacao
                     dValDeb := dValDeb + cdsSaldos.FieldByName('DEB').AsFloat - dValorResultD;
                     dValCre := dValCre + cdsSaldos.FieldByName('CRE').AsFloat - dValorResultC;
                  end;

                  //Saldo Inicial
                  if sNatureza = 'C' then begin
                     sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(PLSCREDITOCOR,NULL,0,PLSCREDITOCOR) -               ';
                     sSql := sSql + '           DECODE(PLSDEBITOCORRENTE,NULL,0,PLSDEBITOCORRENTE)) AS SALDO        ';
                  end else begin
                     sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(PLSDEBITOCORRENTE,NULL,0,PLSDEBITOCORRENTE) -                 ';
                     sSql := sSql + '           DECODE(PLSCREDITOCOR,NULL,0,PLSCREDITOCOR)) AS SALDO      ';
                  end;
                  sSql := sSql + 'FROM PLANOSALDO                                                                    ';
                  sSql := sSql + 'WHERE (PLACONTA = '''+cdsCompConta.FieldByName('PLACONTA').AsString+''')           ';
                  sSql := sSql + '      AND (PLANO = '+IntToStr(iPlano)+')                             ';
                  sSql := sSql + '      AND (IDPESSOA = '+FloatToStr(dEmpresa)+')                             ';
                  sSql := sSql + '      AND (PEREXERCICIO = '+IntToStr(iExercicio)+')     ';
                  sSql := sSql + '      AND (PERNUMERO IS NULL) ';
                  if not cdsCompConta.FieldByName('CODCENTROCUSTO').isNull then begin
                     sSql := sSql + '   AND (CODCENTROCUSTO LIKE '''+cdsCompConta.FieldByName('CODCENTROCUSTO').AsString+'%'') ';
                  end;
                  if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                     sSql := sSql + '   AND (UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                  end;
                  if not cdsCompConta.FieldByName('IDPATRO').isNull then begin
                     sSql := sSql + '   AND (IDPATRO = '+cdsCompConta.FieldByName('IDPATRO').AsString+') ';
                  end;
                  if not cdsCompConta.FieldByName('IDPLANOPREV').isNull then begin
                     sSql := sSql + '   AND (IDPLANOPREV = '+cdsCompConta.FieldByName('IDPLANOPREV').AsString+') ';
                  end;
                  if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                     sSql := sSql + '   AND (CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                  end;
                  if sCCustoIni <> '' then begin
                     sSql := sSql + ' AND (RTRIM(CODCENTROCUSTO) LIKE '''+sCCustoIni+'%'')';
                     sSql := sSql + ' AND (IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                  end;
                  if trim(sAtivSel) <> '' then begin
                     sSql := sSql + ' AND  (UNIDNEGOC IN (' + trim(sAtivSel) + ')) ';
                  end;
                  if sAtivProj <> '' then begin
                     sSql := sSql + ' AND (UNIDNEGOC = '+sAtivProj+')';
                  end;
                  if sPlanoPrev <> '' then begin
                     sSql := sSql + ' AND (IDPLANOPREV IN ('+sPlanoPrev+'))';
                  end;
                  if sPatro <> '' then begin
                     sSql := sSql + ' AND (IDPATRO IN ('+sPatro+'))';
                  end;

                  cdsSaldos.Data := GetDataPacket(sSql);
                  if not cdsSaldos.IsEmpty then begin  //FazUPdate do Ano Anterior
                     dValSaldoIni:=dValSaldoIni + cdsSaldos.FieldByName('SALDO').AsFloat;
                  end;

                  cdsCompConta.Next;
               end;

               FcdsDemoLayoutTipo.Edit;
               FcdsDemoLayoutTipo.FieldByName('SaldOrcPerEATS').AsFloat    := dValOrcMes/iDiv;
               FcdsDemoLayoutTipo.FieldByName('SaldOrcAcumEATS').AsFloat   := dValOrcAno/iDiv;
               FcdsDemoLayoutTipo.FieldByName('SaldRealPerEATS').AsFloat   := dValReaMes/iDiv;
               FcdsDemoLayoutTipo.FieldByName('SaldRealAcumEATS').AsFloat  := dValReaAno/iDiv;
               FcdsDemoLayoutTipo.FieldByName('SaldRealPerEANS').AsFloat   := dValAntMes/iDiv;
               FcdsDemoLayoutTipo.FieldByName('SaldRealAcumEANS').AsFloat  := dValAntAno/iDiv;
               FcdsDemoLayoutTipo.FieldByName('SaldReaPerAntEATS').AsFloat := dValMesAnt/iDiv;
               FcdsDemoLayoutTipo.FieldByName('SaldoIniEAT').AsFloat       := dValSaldoIni/iDiv;

               FcdsDemoLayoutTipo.FieldByName('TotalDebPerEAT').AsFloat    := dValDeb/iDiv;
               FcdsDemoLayoutTipo.FieldByName('TotalCrePerEAT').AsFloat    := dValCre/iDiv;
               FcdsDemoLayoutTipo.FieldByName('MovPerEAT').AsFloat         := (dValDeb - dValCre)/iDiv;

               if (FcdsDemoLayoutTipo.FieldByName('FlagTipoNegativo').AsString <> 'N') then begin
                  FcdsDemoLayoutTipo.FieldByName('SaldoOrcPerEAT').AsFloat    := dValOrcMes/iDiv;
                  FcdsDemoLayoutTipo.FieldByName('SaldoOrcAcumEAT').AsFloat   := dValOrcAno/iDiv;
                  FcdsDemoLayoutTipo.FieldByName('SaldoRealPerEAT').AsFloat   := dValReaMes/iDiv;
                  FcdsDemoLayoutTipo.FieldByName('SaldoRealAcumEAT').AsFloat  := dValReaAno/iDiv;
                  FcdsDemoLayoutTipo.FieldByName('SaldoRealPerEAN').AsFloat   := dValAntMes/iDiv;
                  FcdsDemoLayoutTipo.FieldByName('SaldoRealAcumEAN').AsFloat  := dValAntAno/iDiv;
                  FcdsDemoLayoutTipo.FieldByName('SaldoReaPerAntEAT').AsFloat := dValMesAnt/iDiv;
                  FcdsDemoLayoutTipo.FieldByName('SaldoIniEAT').AsFloat       := dValSaldoIni/iDiv;
               end else begin
                  if Modulo.TestaNatureza(sNatureza,
                     FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString, dValOrcMes) then begin
                     FcdsDemoLayoutTipo.FieldByName('SaldoOrcPerEAT').AsFloat := (Abs(dValOrcMes)* (-1))/iDiv;
                  end else begin
                     FcdsDemoLayoutTipo.FieldByName('SaldoOrcPerEAT').AsFloat := Abs(dValOrcMes)/iDiv;
                  end;
                  if Modulo.TestaNatureza(sNatureza,
                     FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString, dValOrcAno) then begin
                     FcdsDemoLayoutTipo.FieldByName('SaldoOrcAcumEAT').AsFloat := (Abs(dValOrcAno)* (-1))/iDiv;
                  end else begin
                     FcdsDemoLayoutTipo.FieldByName('SaldoOrcAcumEAT').AsFloat := Abs(dValOrcAno)/iDiv;
                  end;

                  if Modulo.TestaNatureza(sNatureza,
                     FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString, dValReaMes) then begin
                     FcdsDemoLayoutTipo.FieldByName('SaldoRealPErEAT').AsFloat := (Abs(dValReaMes)* (-1))/iDiv;
                  end else begin
                     FcdsDemoLayoutTipo.FieldByName('SaldoRealPerEAT').AsFloat := Abs(dValReaMes)/iDiv;
                  end;
                  if Modulo.TestaNatureza(sNatureza,
                     FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString, dValReaAno) then begin
                     FcdsDemoLayoutTipo.FieldByName('SaldoRealAcumEAT').AsFloat := (Abs(dValReaAno)* (-1))/iDiv;
                  end else begin
                     FcdsDemoLayoutTipo.FieldByName('SaldoRealAcumEAT').AsFloat := Abs(dValReaAno)/iDiv;
                  end;

                  if Modulo.TestaNatureza(sNatureza,
                     FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString, dValAntMes) then begin
                     FcdsDemoLayoutTipo.FieldByName('SaldoRealPerEAN').AsFloat := (Abs(dValAntMes)* (-1))/iDiv;
                  end else begin
                     FcdsDemoLayoutTipo.FieldByName('SaldoRealPerEAN').AsFloat := Abs(dValAntMes)/iDiv;
                  end;
                  if Modulo.TestaNatureza(sNatureza,
                     FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString, dValAntAno) then begin
                     FcdsDemoLayoutTipo.FieldByName('SaldoRealAcumEAN').AsFloat := (Abs(dValAntAno)* (-1))/iDiv;
                  end else begin
                     FcdsDemoLayoutTipo.FieldByName('SaldoRealAcumEAN').AsFloat := Abs(dValAntAno)/iDiv;
                  end;
                  if Modulo.TestaNatureza(sNatureza,
                     FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString, dValMesAnt) then begin
                     FcdsDemoLayoutTipo.FieldByName('SaldoReaPerAntEAT').AsFloat := (Abs(dValMesAnt)* (-1))/iDiv;
                  end else begin
                     FcdsDemoLayoutTipo.FieldByName('SaldoReaPerAntEAT').AsFloat := Abs(dValMesAnt)/iDiv;
                  end;
                  if Modulo.TestaNatureza(sNatureza,
                     FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString, dValSaldoIni) then begin
                     FcdsDemoLayoutTipo.FieldByName('SaldoIniEAT').AsFloat := (Abs(dValSaldoIni)* (-1))/iDiv;
                  end else begin
                     FcdsDemoLayoutTipo.FieldByName('SaldoIniEAT').AsFloat := Abs(dValSaldoIni)/iDiv;
                  end;
               end;
               FcdsDemoLayoutTipo.FieldByName('FlagCalcInterna').AsString    := 'S';
               FcdsDemoLayoutTipo.Post;
            end;
            If FcdsDemoLayoutTipo.State = dsBrowse then FcdsDemoLayoutTipo.Edit;
            sEspacos := '';
            for i := 1 to ((StrToInt(FcdsDemoLayoutTipo.FieldByName('Indentacao').asString) - 1) * 4) do begin
               sEspacos := sEspacos + ' ';
            end;
            FcdsDemoLayoutTipo.FieldByName('NomeElementoInd').AsString := sEspacos + FcdsDemoLayoutTipo.FieldByName('NomeElemento').AsString;
            FcdsDemoLayoutTipo.FieldByName('PeriodoIni').asString      := sNomePerIni;
            FcdsDemoLayoutTipo.FieldByName('PeriodoFim').asString      := sNomePerFim;
            FcdsDemoLayoutTipo.FieldByName('Exercicio').asString       := IntToStr(iExercicio);

            FcdsDemoLayoutTipo.FieldByName('EXERCICIOANT').asString    := IntToStr(iExercicio - 1);

            FcdsDemoLayoutTipo.FieldByName('DataUltDia').asString      := sPerDataFim;
            FcdsDemoLayoutTipo.FieldByName('CCusto').asString          := sNomeCCusto;
            FcdsDemoLayoutTipo.FieldByName('AtivProj').asString        := sNomeAtivProj;

            FcdsDemoLayoutTipo.Post;
            FcdsDemoLayoutTipo.Next;
         end;


         x:=1;
         iNumCalc:=0;
         While x = 1 do begin
            bEntrou:=False;
            FcdsDemoLayoutTipo.First;
            bmSavePlace := FcdsDemoLayoutTipo.GetBookmark;
            While not FcdsDemoLayoutTipo.EOF do begin
               if FcdsDemoLayoutTipo.FieldByName('FlagCalcInterna').AsString <> 'S' then begin
                  bEntrou:=True;

                  cdsCompSomatorio.Data := ListaCompSomatorio(FcdsDemoLayoutTipo.FieldByName('CodigoElemento').asInteger);

                  bCalc  :=True;
                  dValReaMes := 0;
                  dValOrcMes := 0;
                  dValReaAno := 0;
                  dValOrcAno := 0;
                  dValAntMes := 0;
                  dValAntAno := 0;
                  dValMesAnt := 0;
                  dValSaldoIni := 0;
                  dValDeb      := 0;
                  dValCre      := 0;
                  dValMov      := 0;

                  // Salvar Ponteiro
                  bmSavePlace := FcdsDemoLayoutTipo.GetBookmark;
                  cdsCompSomatorio.First;
                  While not cdsCompSomatorio.EOF do begin
                     FcdsDemoLayoutTipo.First;
                     While not FcdsDemoLayoutTipo.EOF do begin
                        if cdsCompSomatorio.FieldByName('ELEMENTODEM').AsInteger =
                           FcdsDemoLayoutTipo.FieldByName('CodigoElemento').AsInteger then begin

                           //Verificaçao do tipo de operação para cálculo da fórmula
                           sOper := cdsCompSomatorio.FieldByName('FLGOPERACAO').asString;

                           //Verifica se ha condicional e processa ela
                           if cdsCompSomatorio.FieldByName('ELECONDICAO').isNull then begin
                              sCond := '';
                              dValorCond := 0;
                           end else begin
                              sCond := cdsCompSomatorio.FieldByName('ELECONDICAO').asString;
                              dValorCond := cdsCompSomatorio.FieldByName('ELEVALORCOND').asFloat;
                           end;

                           if FcdsDemoLayoutTipo.FieldByName('FlagCalcInterna').AsString = 'S' then begin
                              dValReaMes   := FazFormula(dValReaMes,   FcdsDemoLayoutTipo.FieldByName('SaldRealPerEATS').AsFloat, sOper, sCond, dValorCond);
                              dValOrcMes   := FazFormula(dValOrcMes,   FcdsDemoLayoutTipo.FieldByName('SaldOrcPerEATS').AsFloat, sOper, sCond, dValorCond);
                              dValReaAno   := FazFormula(dValReaAno,   FcdsDemoLayoutTipo.FieldByName('SaldRealAcumEATS').AsFloat, sOper, sCond, dValorCond);
                              dValOrcAno   := FazFormula(dValOrcAno,   FcdsDemoLayoutTipo.FieldByName('SaldOrcAcumEATS').AsFloat, sOper, sCond, dValorCond);
                              dValAntMes   := FazFormula(dValAntMes,   FcdsDemoLayoutTipo.FieldByName('SaldRealPerEANS').AsFloat, sOper, sCond, dValorCond);
                              dValAntAno   := FazFormula(dValAntAno,   FcdsDemoLayoutTipo.FieldByName('SaldRealAcumEANS').AsFloat, sOper, sCond, dValorCond);
                              dValSaldoIni := FazFormula(dValSaldoIni, FcdsDemoLayoutTipo.FieldByName('SaldoIniEAT').AsFloat, sOper, sCond, dValorCond);
                              dValDeb      := FazFormula(dValDeb,      FcdsDemoLayoutTipo.FieldByName('TotalDebPerEAT').AsFloat, sOper, sCond, dValorCond);
                              dValCre      := FazFormula(dValCre,      FcdsDemoLayoutTipo.FieldByName('TotalCrePerEAT').AsFloat, sOper, sCond, dValorCond);
                              dValMov      := FazFormula(dValMov,      FcdsDemoLayoutTipo.FieldByName('MovPerEAT').AsFloat, sOper, sCond, dValorCond);
                           end else begin
                              bCalc:=False;
                              Break;
                           end;
                        end;
                        FcdsDemoLayoutTipo.Next;
                     end;
                     cdsCompSomatorio.Next;
                  end;
                  // Ponterar Query
                  FcdsDemoLayoutTipo.GotoBookmark(bmSavePlace);
                  if bCalc then begin
                     Inc(iNumCalc);
                     FcdsDemoLayoutTipo.Edit;

                     FcdsDemoLayoutTipo.FieldByName('SaldOrcPerEATS').AsFloat    := dValOrcMes;
                     FcdsDemoLayoutTipo.FieldByName('SaldOrcAcumEATS').AsFloat   := dValOrcAno;
                     FcdsDemoLayoutTipo.FieldByName('SaldRealPerEATS').AsFloat   := dValReaMes;
                     FcdsDemoLayoutTipo.FieldByName('SaldRealAcumEATS').AsFloat  := dValReaAno;
                     FcdsDemoLayoutTipo.FieldByName('SaldRealPerEANS').AsFloat   := dValAntMes;
                     FcdsDemoLayoutTipo.FieldByName('SaldRealAcumEANS').AsFloat  := dValAntAno;
                     FcdsDemoLayoutTipo.FieldByName('SaldReaPerAntEATS').AsFloat := dValMesAnt;

                     FcdsDemoLayoutTipo.FieldByName('SaldoIniEAT').AsFloat       := dValSaldoIni;

                     FcdsDemoLayoutTipo.FieldByName('TotalDebPerEAT').AsFloat    := dValDeb;
                     FcdsDemoLayoutTipo.FieldByName('TotalCrePerEAT').AsFloat    := dValCre;
                     FcdsDemoLayoutTipo.FieldByName('MovPerEAT').AsFloat         := (dValDeb - dValCre);

                     if (FcdsDemoLayoutTipo.FieldByName('FlagTipoNegativo').AsString <> 'N') then begin
                        FcdsDemoLayoutTipo.FieldByName('SaldoOrcPerEAT').AsFloat    := dValOrcMes;
                        FcdsDemoLayoutTipo.FieldByName('SaldoOrcAcumEAT').AsFloat   := dValOrcAno;
                        FcdsDemoLayoutTipo.FieldByName('SaldoRealPerEAT').AsFloat   := dValReaMes;
                        FcdsDemoLayoutTipo.FieldByName('SaldoRealAcumEAT').AsFloat  := dValReaAno;
                        FcdsDemoLayoutTipo.FieldByName('SaldoRealPerEAN').AsFloat   := dValAntMes;
                        FcdsDemoLayoutTipo.FieldByName('SaldoRealAcumEAN').AsFloat  := dValAntAno;
                        FcdsDemoLayoutTipo.FieldByName('SaldoIniEAT').AsFloat       := dValSaldoIni;
                        FcdsDemoLayoutTipo.FieldByName('SaldoReaPerAntEAT').AsFloat := dValMesAnt;
                     end else begin
                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString, dValOrcMes) then begin
                           FcdsDemoLayoutTipo.FieldByName('SaldoOrcPerEAT').AsFloat := (Abs(dValOrcMes)* (-1));
                        end else begin
                           FcdsDemoLayoutTipo.FieldByName('SaldoOrcPerEAT').AsFloat := Abs(dValOrcMes);
                        end;
                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString, dValOrcAno) then begin
                           FcdsDemoLayoutTipo.FieldByName('SaldoOrcAcumEAT').AsFloat := (Abs(dValOrcAno)* (-1));
                        end else begin
                           FcdsDemoLayoutTipo.FieldByName('SaldoOrcAcumEAT').AsFloat := Abs(dValOrcAno);
                        end;

                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString, dValReaMes) then begin
                           FcdsDemoLayoutTipo.FieldByName('SaldoRealPErEAT').AsFloat := (Abs(dValReaMes)* (-1));
                        end else begin
                           FcdsDemoLayoutTipo.FieldByName('SaldoRealPerEAT').AsFloat := Abs(dValReaMes);
                        end;
                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString, dValReaAno) then begin
                           FcdsDemoLayoutTipo.FieldByName('SaldoRealAcumEAT').AsFloat := (Abs(dValReaAno)* (-1));
                        end else begin
                           FcdsDemoLayoutTipo.FieldByName('SaldoRealAcumEAT').AsFloat := Abs(dValReaAno);
                        end;

                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString, dValAntMes) then begin
                           FcdsDemoLayoutTipo.FieldByName('SaldoRealPerEAN').AsFloat := (Abs(dValAntMes)* (-1));
                        end else begin
                           FcdsDemoLayoutTipo.FieldByName('SaldoRealPerEAN').AsFloat := Abs(dValAntMes);
                        end;
                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString, dValAntAno) then begin
                           FcdsDemoLayoutTipo.FieldByName('SaldoRealAcumEAN').AsFloat := (Abs(dValAntAno)* (-1));
                        end else begin
                           FcdsDemoLayoutTipo.FieldByName('SaldoRealAcumEAN').AsFloat := Abs(dValAntAno);
                        end;
                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString, dValMesAnt) then begin
                           FcdsDemoLayoutTipo.FieldByName('SaldoReaPerAntEAT').AsFloat := (Abs(dValMesAnt)* (-1));
                        end else begin
                           FcdsDemoLayoutTipo.FieldByName('SaldoReaPerAntEAT').AsFloat := Abs(dValMesAnt);
                        end;
                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemoLayoutTipo.FieldByName('NaturezaElemento').AsString, dValSaldoIni) then begin
                           FcdsDemoLayoutTipo.FieldByName('SaldoIniEAT').AsFloat := (Abs(dValSaldoIni)* (-1));
                        end else begin
                           FcdsDemoLayoutTipo.FieldByName('SaldoIniEAT').AsFloat := Abs(dValSaldoIni);
                        end;
                     end;
                     FcdsDemoLayoutTipo.FieldByName('FlagCalcInterna').AsString    := 'S';
                     FcdsDemoLayoutTipo.Post;
                  end;
               end;
               If FcdsDemoLayoutTipo.State = dsBrowse then FcdsDemoLayoutTipo.Edit;
               sEspacos := '';
               for i := 1 to ((StrToInt(FcdsDemoLayoutTipo.FieldByName('Indentacao').asString) - 1) * 4) do begin
                  sEspacos := sEspacos + ' ';
               end;
               FcdsDemoLayoutTipo.FieldByName('NomeElementoInd').AsString := sEspacos + FcdsDemoLayoutTipo.FieldByName('NomeElemento').AsString;
               FcdsDemoLayoutTipo.FieldByName('PeriodoIni').asString := sNomePerIni;
               FcdsDemoLayoutTipo.FieldByName('PeriodoFim').asString := sNomePerFim;
               FcdsDemoLayoutTipo.FieldByName('Exercicio').asString  := IntToStr(iExercicio);
               FcdsDemoLayoutTipo.FieldByName('DataUltDia').asString := sPerDataFim;
               FcdsDemoLayoutTipo.FieldByName('CCusto').asString     := sNomeCCusto;
               FcdsDemoLayoutTipo.FieldByName('AtivProj').asString   := sNomeAtivProj;
               FcdsDemoLayoutTipo.Post;
               FcdsDemoLayoutTipo.Next;
            end;
            FcdsDemoLayoutTipo.FreeBookmark(bmSavePlace);
            if not bEntrou then Break;
            if iNumCalc = 0 then begin
               Break;
               Abort;
            end;
         end;
         //Calcula Percentuais
         FcdsDemoLayoutTipo.First;
         bmSavePlace := FcdsDemoLayoutTipo.GetBookmark;
         While not FcdsDemoLayoutTipo.EOF do begin
            If not FcdsDemoLayoutTipo.FieldByName('ElemAnaliseVert').isNull then begin
               iElem100   := FcdsDemoLayoutTipo.FieldByName('ElemAnaliseVert').AsInteger;
               dValReaMes := 0;
               dValOrcMes := 0;
               dValReaAno := 0;
               dValOrcAno := 0;
               dValAntMes := 0;
               dValAntAno := 0;
               dValMesAnt := 0;

               // Salvar Ponteiro
               bmSavePlace := FcdsDemoLayoutTipo.GetBookmark;
               FcdsDemoLayoutTipo.First;
               While not FcdsDemoLayoutTipo.EOF do begin
                  if (iElem100 = FcdsDemoLayoutTipo.FieldByName('CodigoElemento').AsInteger) then begin
                     dValReaMes := FcdsDemoLayoutTipo.FieldByName('SaldRealPerEATS').AsFloat;
                     dValOrcMes := FcdsDemoLayoutTipo.FieldByName('SaldOrcPerEATS').AsFloat;
                     dValReaAno := FcdsDemoLayoutTipo.FieldByName('SaldRealAcumEATS').AsFloat;
                     dValOrcAno := FcdsDemoLayoutTipo.FieldByName('SaldOrcAcumEATS').AsFloat;
                     dValAntMes := FcdsDemoLayoutTipo.FieldByName('SaldRealPerEANS').AsFloat;
                     dValAntAno := FcdsDemoLayoutTipo.FieldByName('SaldRealAcumEANS').AsFloat;
                     dValMesAnt := FcdsDemoLayoutTipo.FieldByName('SaldReaPerAntEATS').AsFloat;
                     Break;
                  end;
                  FcdsDemoLayoutTipo.Next;
               end;
               FcdsDemoLayoutTipo.GotoBookmark(bmSavePlace);
               If FcdsDemoLayoutTipo.State = dsBrowse then FcdsDemoLayoutTipo.Edit;
               if dValOrcMes <> 0 then FcdsDemoLayoutTipo.FieldByName('AV_OrcPerEAT').AsFloat     := Abs(FcdsDemoLayoutTipo.FieldByName('SaldOrcPerEATS').AsFloat/dValOrcMes*100);
               if dValOrcAno <> 0 then FcdsDemoLayoutTipo.FieldByName('AV_OrcAcumEAT').AsFloat    := Abs(FcdsDemoLayoutTipo.FieldByName('SaldOrcAcumEATS').AsFloat/dValOrcAno*100);
               if dValReaMes <> 0 then FcdsDemoLayoutTipo.FieldByName('AV_RealPerEAT').AsFloat    := Abs(FcdsDemoLayoutTipo.FieldByName('SaldRealPerEATS').AsFloat/dValReaMes*100);
               if dValReaAno <> 0 then FcdsDemoLayoutTipo.FieldByName('AV_RealAcumEAT').AsFloat   := Abs(FcdsDemoLayoutTipo.FieldByName('SaldRealAcumEATS').AsFloat/dValReaAno*100);
               if dValAntMes <> 0 then FcdsDemoLayoutTipo.FieldByName('AV_RealPerEAN').AsFloat    := Abs(FcdsDemoLayoutTipo.FieldByName('SaldRealPerEANS').AsFloat/dValAntMes*100);
               if dValAntAno <> 0 then FcdsDemoLayoutTipo.FieldByName('AV_RealAcumEAN').AsFloat   := Abs(FcdsDemoLayoutTipo.FieldByName('SaldRealAcumEANS').AsFloat/dValAntAno*100);
               if dValMesAnt <> 0 then FcdsDemoLayoutTipo.FieldByName('AV_RealPerAntEAT').AsFloat := Abs(FcdsDemoLayoutTipo.FieldByName('SaldReaPerAntEATS').AsFloat/dValMesAnt*100);
               FcdsDemoLayoutTipo.Post;
            end;

            //Calula as diferencas  (alterei aqui - if bMenosorcado)
            if FcdsDemoLayoutTipo.State = dsBrowse then FcdsDemoLayoutTipo.Edit;
            if bMenosOrcado then begin
               FcdsDemoLayoutTipo.FieldByName('DifOrcRealPerEAT').AsFloat  := (FcdsDemoLayoutTipo.FieldByName('SaldRealPerEATS').AsFloat  - FcdsDemoLayoutTipo.FieldByName('SaldOrcPerEATS').AsFloat)/iDiv;
               FcdsDemoLayoutTipo.FieldByName('DifOrcRealAcumEAT').AsFloat := (FcdsDemoLayoutTipo.FieldByName('SaldRealAcumEATS').AsFloat - FcdsDemoLayoutTipo.FieldByName('SaldOrcAcumEATS').AsFloat)/iDiv;
            end else begin
               FcdsDemoLayoutTipo.FieldByName('DifOrcRealPerEAT').AsFloat  := (FcdsDemoLayoutTipo.FieldByName('SaldoOrcPerEAT').AsFloat  - FcdsDemoLayoutTipo.FieldByName('SaldoRealPerEAT').AsFloat)/iDiv;
               FcdsDemoLayoutTipo.FieldByName('DifOrcRealAcumEAT').AsFloat := (FcdsDemoLayoutTipo.FieldByName('SaldoOrcAcumEAT').AsFloat - FcdsDemoLayoutTipo.FieldByName('SaldoRealAcumEAT').AsFloat)/iDiv;
            end;
            FcdsDemoLayoutTipo.FieldByName('DifExAtuAntAcum').AsFloat := (FcdsDemoLayoutTipo.FieldByName('SaldRealAcumEATS').AsFloat - FcdsDemoLayoutTipo.FieldByName('SaldRealAcumEANS').AsFloat)/iDiv;
            FcdsDemoLayoutTipo.FieldByName('DifExAtuAntPer').AsFloat  := (FcdsDemoLayoutTipo.FieldByName('SaldRealPerEATS').AsFloat  - FcdsDemoLayoutTipo.FieldByName('SaldRealPerEANS').AsFloat)/iDiv;
            FcdsDemoLayoutTipo.FieldByName('DifPerAtuAntEAT').AsFloat := (FcdsDemoLayoutTipo.FieldByName('SaldRealPerEATS').AsFloat  - FcdsDemoLayoutTipo.FieldByName('SaldReaPerAntEATS').AsFloat)/iDiv;

            //Calula as Análises Horizontais
            if FcdsDemoLayoutTipo.FieldByName('SaldOrcPerEATS').AsFloat <> 0 then begin
               if bMenosOrcado then begin
                   FcdsDemoLayoutTipo.FieldByName('AH_OrcRealPerEAT').AsFloat  := (((FcdsDemoLayoutTipo.FieldByName('SaldRealPerEATS').AsFloat * 100) / FcdsDemoLayoutTipo.FieldByName('SaldOrcPerEATS').AsFloat) - 100);
               end else begin
                   FcdsDemoLayoutTipo.FieldByName('AH_OrcRealPerEAT').AsFloat  := ((FcdsDemoLayoutTipo.FieldByName('SaldOrcPerEATS').AsFloat - FcdsDemoLayoutTipo.FieldByName('SaldRealPerEATS').AsFloat) / FcdsDemoLayoutTipo.FieldByName('SaldOrcPerEATS').AsFloat) * 100;
               end;
            end else begin
               FcdsDemoLayoutTipo.FieldByName('AH_OrcRealPerEAT').AsFloat  := 0;
            end;

            if FcdsDemoLayoutTipo.FieldByName('SaldOrcAcumEATS').AsFloat <> 0 then begin
               if bMenosOrcado then begin
                  FcdsDemoLayoutTipo.FieldByName('AH_OrcRealAcumEAT').AsFloat := (((FcdsDemoLayoutTipo.FieldByName('SaldRealAcumEATS').AsFloat * 100) / FcdsDemoLayoutTipo.FieldByName('SaldOrcAcumEATS').AsFloat) - 100);
               end else begin
                  FcdsDemoLayoutTipo.FieldByName('AH_OrcRealAcumEAT').AsFloat := ((FcdsDemoLayoutTipo.FieldByName('SaldOrcAcumEATS').AsFloat - FcdsDemoLayoutTipo.FieldByName('SaldRealAcumEATS').AsFloat) / FcdsDemoLayoutTipo.FieldByName('SaldOrcAcumEATS').AsFloat) * 100;
               end;
            end else begin
               FcdsDemoLayoutTipo.FieldByName('AH_OrcRealAcumEAT').AsFloat := 0;
            end;

            if FcdsDemoLayoutTipo.FieldByName('SaldRealPerEANS').AsFloat <> 0 then begin
               FcdsDemoLayoutTipo.FieldByName('AH_ExAtuAntPer').AsFloat   := (((FcdsDemoLayoutTipo.FieldByName('SaldRealPerEATS').AsFloat * 100) / FcdsDemoLayoutTipo.FieldByName('SaldRealPerEANS').AsFloat) - 100);
            end else begin
               FcdsDemoLayoutTipo.FieldByName('AH_ExAtuAntPer').AsFloat   := 0;
            end;
            if FcdsDemoLayoutTipo.FieldByName('SaldReaPerAntEATS').AsFloat <> 0 then begin
               FcdsDemoLayoutTipo.FieldByName('AH_PerAtuAntEAT').AsFloat   := (((FcdsDemoLayoutTipo.FieldByName('SaldRealPerEATS').AsFloat * 100) / FcdsDemoLayoutTipo.FieldByName('SaldReaPerAntEATS').AsFloat) - 100);
            end else begin
               FcdsDemoLayoutTipo.FieldByName('AH_PerAtuAntEAT').AsFloat   :=  0;
            end;
            if FcdsDemoLayoutTipo.FieldByName('SaldRealAcumEANS').AsFloat <> 0 then begin
               FcdsDemoLayoutTipo.FieldByName('AH_ExAtuAntAcum').AsFloat   := (((FcdsDemoLayoutTipo.FieldByName('SaldRealAcumEATS').AsFloat * 100) / FcdsDemoLayoutTipo.FieldByName('SaldRealAcumEANS').AsFloat) - 100);
            end else begin
               FcdsDemoLayoutTipo.FieldByName('AH_ExAtuAntAcum').AsFloat   := 0;
            end;
            FcdsDemoLayoutTipo.Next;
         end;
         FcdsDemoLayoutTipo.FreeBookmark(bmSavePlace);

         FcdsDemoLayoutTipo.First;
         while not FcdsDemoLayoutTipo.EOF do begin
            if FcdsDemoLayoutTipo.FieldByName('FLAGINTERNA2').asString = 'X' then begin
               FcdsDemoLayoutTipo.Delete;
            end else begin
               FcdsDemoLayoutTipo.Next;
            end;
         end;

      Except
         Result := false;
      End;

   Finally
     cdsCompConta.free;
     cdsSaldos.free;
     cdsLancResultado.free;
     cdsCompSomatorio.free;
     cdsPeriodoSaldo.free;
     Free;
   End;

end;

Function TCtrlRptDemonstrativo.ListaNomeAtivProj(dEmpresa:Double;sAtivProj :string):OleVariant;
var
  sSql :string;
begin
      sSql := 'SELECT  UNIDNEGOC, NOME ' +
              'FROM UNIDNEGOCIO '+
              'WHERE (IDPESSOA   = ' + FloatToStr(dEmpresa) + ') AND '+
              '      (UNIDNEGOC  = ' + sAtivProj + ') ' +
              'ORDER BY UNIDNEGOC ';

      result := GetDataPacket(sSql);

end;

Function TCtrlRptDemonstrativo.ListaNomeCCusto(dEmpresa:Double;sCCusto :string):OleVariant;
var
  sSql :string;
begin
      sSql := 'SELECT  CODCENTROCUSTO,NOME '+
              'FROM CENTCUST ' +
              'WHERE (IDEMPRESA      = '+ FloatToStr(dEmpresa) + ') AND '+
              '      (CODCENTROCUSTO = ''' + sCCusto + ''') ' +
              'ORDER BY CODCENTROCUSTO ';

      result := GetDataPacket(sSql);

end;

Function TCtrlRptDemonstrativo.ListaDadosPeriodo(dEmpresa:Double;iExercicio,iPeriodo:integer):OleVariant;
var
  sSql :string;
begin
    sSql := 'SELECT ' +
            '   PERNUMERO, PERNOME,PERNOMEOUTLING ,PERDATFIM,PERDATINI ' +
            'FROM ' +
            '   PERIODO ' +
            'WHERE ' +
            '   (IDPESSOA = '+ FloatToStr(dEmpresa) + ') AND ' +
            '   (PEREXERCICIO = '+ IntToStr(iExercicio) + ')  AND ' +
            '   (PERNUMERO = '+ IntToStr(iPeriodo) + ') ' +
            'ORDER BY  ' +
            '   PERNUMERO ';

    result := GetDataPacket(sSql);

end;

function TCtrlRptDemonstrativo.ListaCdsBalPatr(iDemo,Posicao:Integer): OleVariant;
var
  sSql :string;
begin
     sSql :=  'SELECT '+
              '   IDELEMBALPATR,      '+
              '   IDDEMONSTRATIVO,    '+
              '   IDELEMDEMONSTRAT,   '+
              '   ELEPOSICAO,         '+
              '   EBPDESCRICAO        '+
              'FROM                   '+
              '   ELEMBALPATR         '+
              'WHERE                  '+
              '   (IDDEMONSTRATIVO = ' + IntToStr(iDemo) + ') AND '+
              '   (ELEPOSICAO      = ' + IntToStr(Posicao) + ') ';

     result := GetDataPacket(sSql);

end;


function TCtrlRptDemonstrativo.ListaCdsElemBalPatr(iDemo, iElem: Integer): OleVariant;
var
  sSql :string;
begin

    sSql := 'SELECT '+
            '   IDELEMDEMONSTRAT, ELETIPOELEM, ELEORDEMLINHA,    '+
            '   FLGTIPONEGATIVO, FLGNATUREZA,                    '+
            '   FLGMONETARIA, FLGSALTAPAGINA, FLGDECIMAIS        '+
            'FROM                                                '+
            '   ELEMDEMONSTRATIVO                                '+
            'WHERE                                               '+
            '   (IDDEMONSTRATIVO  = '+ IntToStr(iDemo) + ') AND  '+
            '   (IDELEMDEMONSTRAT = '+ IntToStr(iElem) + ')      '+
            'ORDER BY                                            '+
            '   ELEORDEMLINHA ';

     result := GetDataPacket(sSql);

end;

function TCtrlRptDemonstrativo.ProcessaDemoModelo2_Anal(iDemo, iPlano,
  iExercicio, iPeriodoIni, iPeriodoFim: Integer; sTipoOperResult,
  sNatureza, sCCustoIni, sAtivProj, sCodMoedaReal, sCodMoedaOrc,
  sPerDataIni, sNomePer1, sNomePer2, sNomeDemo, sNomeMoedaReal,
  sNomeMoedaOrc, sAtivMarca: string; dEmpresa: Double; bDesconResult,
  bZerados, bGeraTxt: Boolean): Boolean;
var
  iElem100 :LongInt;
  iLinha,x,iNumCalc :Integer;
  sSalto,sSql,sOper,sDataRef:string;
  cdsCompConta     :TClientDataSet;
  cdsLancResultado :TClientDataSet;
  cdsSaldos        :TClientDataSet;
  cdsCompSomatorio :TClientDataSet;
  cdsPeriodoSaldo  :TClientDataSet;
  bEntrou,bCalc    :Boolean;
  dValAtu :Double;
  dValAnt :Double;
  dValReaMes, dValOrcMes, dValReaAno,dValOrcAno,dValAntMes, dValAntAno :Double;
  dValorResult,dCotacaoAtu,dCotacaoAnt,dValorRea,dValorOrc :Double;
  bmSavePlace : TBookmark;
begin

   Result := True;
   cdsCompConta     := TClientDataSet.Create(nil);
   cdsLancResultado := TClientDataSet.Create(nil);
   cdsSaldos        := TClientDataSet.Create(nil);
   cdsCompSomatorio := TClientDataSet.Create(nil);
   cdsPeriodoSaldo  := TClientDataSet.Create(nil);


   With TCMSqlParams.Create(nil) Do
   Try

      Try

         SQL.Clear;
         SQL.Add('SELECT                                                              ');
         SQL.Add('    (0) AS ORCMES, (0) AS REALMES, (0) AS MESANT,                   ');
         SQL.Add('    (0) AS ORCANO, (0) AS REALANO, (0) AS ANOANT,                   ');
         SQL.Add('    (0) AS ORCMESSN, (0) AS REALMESSN, (0) AS MESANTSN,             ');
         SQL.Add('    (0) AS ORCANOSN, (0) AS REALANOSN, (0) AS ANOANTSN,             ');
         SQL.Add('    (0) AS PERORCMES, (0) AS PERREALMES, (0) AS PERMESANT,          ');
         SQL.Add('    (0) AS PERORCANO, (0) AS PERREALANO, (0) AS PERANOANT,          ');
         SQL.Add('    (0) AS PERORCMES1, (0) AS PERREALMES1, (0) AS PERMESANT1,       ');
         SQL.Add('    (0) AS PERORCANO1, (0) AS PERREALANO1, (0) AS PERANOANT1,       ');
         SQL.Add('    (''N'') AS CALCU, ('' '') AS SALTA, E.IDELEMANAVERTICAL,        ');
         SQL.Add('   E.ELEDESCELEM, E.FLGINDENTACAO, E.FLGTIPOLINHA, E.ELEORDEMLINHA, ');
         SQL.Add('   E.IDELEMDEMONSTRAT,E.ELETIPOELEM,E.FLGSALTAPAGINA,E.FLGMONETARIA,');
         SQL.Add('   E.FLGTRACO,E.FLGNEGRITO,E.FLGNATUREZA,E.FLGTIPONEGATIVO,         ');
         SQL.Add('   E.FLGDECIMAIS, E.IDELEMANAVERT1                                  ');
         SQL.Add('FROM                                                                ');
         SQL.Add('   ELEMDEMONSTRATIVO E                                              ');
         SQL.Add('WHERE                                                               ');
         SQL.Add('    (E.IDDEMONSTRATIVO =:IDDEMONSTRATIVO)                           ');
         SQL.Add('ORDER BY                                                            ');
         SQL.Add('    E.ELEORDEMLINHA                                                 ');

         Prepare;
         ParamByName('IDDEMONSTRATIVO').asInteger := iDemo;
         FcdsDemonstrativo.Data := Data;

         //zera o acumulador de salto de pagina
         iLinha := 0;
         sSalto := 'N';

         FcdsDemonstrativo.First;
         while not FcdsDemonstrativo.EOF do
         begin

            if sSalto = 'S' then begin
               inc(iLinha);
               sSalto := 'N';
            end;

            if FcdsDemonstrativo.FieldByName('FLGSALTAPAGINA').asString = 'S' then
            begin
               sSalto := 'S';
            end;

            FcdsDemonstrativo.Edit;
            FcdsDemonstrativo.FieldByName('SALTA').asString := IntToStr(iLinha);

            cdsCompConta.Data := ListaCompConta(FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').asInteger);
            sSql := sSqlCompConta;

            dValReaMes := 0;
            dValOrcMes := 0;
            dValReaAno := 0;
            dValOrcAno := 0;
            dValAntMes := 0;
            dValAntAno := 0;
            //
            if not cdsCompConta.IsEmpty then
            begin
               cdsCompConta.First;
               While not cdsCompConta.EOF do
               begin
                  //Ano Atual
                  if sNatureza = 'C' then begin
                     sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR) -               ';
                     sSql := sSql + '           DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE)) AS SALDO,        ';
                     sSql := sSql + '       SUM(DECODE(S.PLSORCADOCREDITO,NULL,0,S.PLSORCADOCREDITO) -               ';
                     sSql := sSql + '           DECODE(S.PLSORCADODEBITO,NULL,0,S.PLSORCADODEBITO)) AS SALDOORC,     ';
                  end else begin
                     sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE) -                 ';
                     sSql := sSql + '           DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR)) AS SALDO,      ';
                     sSql := sSql + '       SUM(DECODE(S.PLSORCADODEBITO,NULL,0,S.PLSORCADODEBITO) -               ';
                     sSql := sSql + '           DECODE(S.PLSORCADOCREDITO,NULL,0,S.PLSORCADOCREDITO)) AS SALDOORC,     ';
                  end;
                  sSql := sSql + 'S.PERNUMERO, P.PERDATFIM                                                      ';
                  sSql := sSql + 'FROM PLANOSALDO S, PERIODO P                                                  ';
                  sSql := sSql + 'WHERE (S.PLACONTA = '''+cdsCompConta.FieldByName('PLACONTA').AsString+''')    ';
                  sSql := sSql + '      AND (S.PLANO = '+IntToStr(iPlano)+')                                    ';
                  sSql := sSql + '      AND (S.IDPESSOA = '+FloatToStr(dEmpresa)+')                             ';
                  sSql := sSql + '      AND (S.PEREXERCICIO = '+IntToStr(iExercicio)+')                         ';
                  sSql := sSql + '      AND ((S.PERNUMERO  <= '+IntToStr(iPeriodoFim)+')                        ';
                  sSql := sSql + '      OR  (S.PERNUMERO  IS NULL))                                            ';
                  sSql := sSql + '      AND (S.PERNUMERO = P.PERNUMERO(+)                ) ';
                  sSql := sSql + '      AND (S.PEREXERCICIO = P.PEREXERCICIO(+)          ) ';
                  sSql := sSql + '      AND (S.IDPESSOA = P.IDPESSOA(+)                  ) ';
                  if not cdsCompConta.FieldByName('CODCENTROCUSTO').isNull then begin
                     sSql := sSql + '   AND (S.CODCENTROCUSTO LIKE '''+cdsCompConta.FieldByName('CODCENTROCUSTO').AsString+'%'') ';
                  end;
                  if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                     sSql := sSql + '   AND (S.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                  end;
                  if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                     sSql := sSql + '   AND (S.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                  end;
                  if sCCustoIni <> '' then begin
                     sSql := sSql + ' AND (RTRIM(S.CODCENTROCUSTO) LIKE '''+sCCustoIni+'%'')';
                     sSql := sSql + ' AND (S.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                  end;
                  if trim(sAtivMarca) <> '' then begin
                     sSql := sSql + ' AND  (S.UNIDNEGOC IN (' + trim(sAtivMarca) + ')) ';
                  end;
                  if sAtivProj <> '' then begin
                     sSql := sSql + ' AND (S.UNIDNEGOC = '+sAtivProj+')';
                  end;

                  if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                  begin
                    sSql := sSql + ' AND (S.IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                  end;

                  if not cdsCompConta.fieldByName('IDPATRO').isNull then
                  begin
                    sSql := sSql + ' AND (S.IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                  end;

                  sSql := sSql + '   GROUP BY S.PERNUMERO,P.PERDATFIM  ';

                  cdsSaldos.Data := GetDataPacket(sSql);

                  if not cdsSaldos.IsEmpty then begin
                     //FazUPdate do Ano Atual
                     cdsSaldos.First;
                     While not cdsSaldos.EOF do begin
                        dValorResult := 0;
                        if (bDesconResult) and (sTipoOperResult <> '') then begin
                           if sNatureza = 'C' then begin
                              sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';
                           end else begin
                              sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';
                           end;
                           sSql := sSql + 'FROM PLANILHA P, LANCAMENTO L                                                       ';
                           sSql := sSql + 'WHERE     (L.PLACONTA LIKE '''+cdsCompConta.FieldByName('PLACONTA').AsString+'%'+''')           ';
                           sSql := sSql + '      AND (L.PLANO = '+IntToStr(iPlano)+')                                ';
                           sSql := sSql + '      AND (P.IDPESSOA = '+FloatToStr(dEmpresa)+')                             ';
                           sSql := sSql + '      AND (L.TIPCODIGO = '''+sTipoOperResult+''')            ';
                           if cdsSaldos.FieldByName('PERNUMERO').IsNull then begin
                              sSql := sSql + '      AND (P.PEREXERCICIO = '+IntToStr(iExercicio)+')     ';
                              sSql := sSql + '      AND (P.PERNUMERO  IS NULL)                          ';
                           end else begin
                              cdsPeriodoSaldo.Data := ListaDadosPeriodo(dEmpresa,iExercicio ,cdsSaldos.FieldByName('PERNUMERO').AsInteger);
                              sSql := sSql + '      AND (P.PLNDATDIA >= TO_DATE('''+cdsPeriodoSaldo.FieldByName('PERDATINI').AsString+''',''DD/MM/YYYY'')) ';
                              sSql := sSql + '      AND (P.PLNDATDIA <= TO_DATE('''+cdsPeriodoSaldo.FieldByName('PERDATFIM').AsString+''',''DD/MM/YYYY'')) ';
                           end;
                           sSql := sSql + '      AND (P.PLNCODIGO = L.PLNCODIGO) ';
                           if not cdsCompConta.FieldByName('CODCENTROCUSTO').isNull then begin
                              sSql := sSql + '   AND (L.CODCENTROCUSTO LIKE '''+cdsCompConta.FieldByName('CODCENTROCUSTO').AsString+'%'') ';
                              sSql := sSql + '   AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                           end;
                           if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                              sSql := sSql + '   AND (L.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                              sSql := sSql + '   AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;
                           if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                              sSql := sSql + ' AND (L.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                              sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;
                           if sCCustoIni <> '' then begin
                              sSql := sSql + ' AND (RTRIM(L.CODCENTROCUSTO) LIKE '''+sCCustoIni+'%'')';
                              sSql := sSql + ' AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                           end;
                           if trim(sAtivMarca) <> '' then begin
                              sSql := sSql + ' AND  (L.UNIDNEGOC IN (' + trim(sAtivMarca) + ')) ';
                           end;
                           if sAtivProj <> '' then begin
                              sSql := sSql + ' AND (L.UNIDNEGOC = '+sAtivProj+')';
                              sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;


                           if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                           begin
                             sSql := sSql + ' AND (L.IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                           end;

                           if not cdsCompConta.fieldByName('IDPATRO').isNull then
                           begin
                             sSql := sSql + ' AND (L.IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                           end;

                           cdsLancResultado.Data := GetDataPacket(sSql);
                           if not cdsLancResultado.IsEmpty then
                           begin
                             dValorResult := cdsLancResultado.FieldByName('SALDO').AsFloat;
                           end;
                        end;

                        dValorRea  := cdsSaldos.FieldByName('SALDO').AsFloat - dValorResult;
                        dValorOrc  := cdsSaldos.FieldByName('SALDOORC').AsFloat;
                        if (sCodMoedaReal <> '') and (FcdsDemonstrativo.FieldByName('FLGMONETARIA').AsString = 'S') then begin
                           if cdsSaldos.FieldByName('PERDATFIM').isNull then begin
                              sDataRef := sPerDataIni;
                           end else begin
                              sDataRef := cdsSaldos.FieldByName('PERDATFIM').AsString;
                           end;
                           dCotacaoAtu := Contab.TestaCotacaoMoeda(StrToInt(sCodMoedaReal),
                                          StrToDate(sDataRef),False);
                           if dCotacaoAtu <> 0 then begin
                              dValorRea:= dValorRea/dCotacaoAtu;
                           end else begin
                              dValorRea:= 0;
                           end;
                        end;
                        if (sCodMoedaOrc <> '') and (FcdsDemonstrativo.FieldByName('FLGMONETARIA').AsString = 'S') then begin
                           if cdsSaldos.FieldByName('PERDATFIM').isNull then begin
                              sDataRef := sPerDataIni;
                           end else begin
                              sDataRef := cdsSaldos.FieldByName('PERDATFIM').AsString;
                           end;
                           dCotacaoAtu := Contab.TestaCotacaoMoeda(StrToInt(sCodMoedaOrc),
                                          StrToDate(sDataRef),False);
                           if dCotacaoAtu <> 0 then begin
                              dValorOrc:= dValorOrc/dCotacaoAtu;
                           end else begin
                              dValorOrc:= 0;
                           end;
                        end;
                        if (cdsSaldos.FieldByName('PERNUMERO').AsInteger >= iPeriodoIni) and
                           (cdsSaldos.FieldByName('PERNUMERO').AsInteger <= iPeriodoFim) then begin
                           dValReaMes := dValReaMes + dValorRea;
                           dValOrcMes := dValOrcMes + dValorOrc;
                        end;
                        dValReaAno := dValReaAno + dValorRea;
                        dValOrcAno := dValOrcAno + dValorOrc;
                        cdsSaldos.Next;
                     end;
                  end;
                  //
                  //Ano Anterior
                  if sNatureza = 'C' then
                  begin
                     sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR) -               ';
                     sSql := sSql + '           DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE)) AS SALDO,        ';
                  end else begin
                     sSql :=        'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE) -                 ';
                     sSql := sSql + '           DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR)) AS SALDO,      ';
                  end;
                  sSql := sSql + 'S.PERNUMERO, P.PERDATFIM                                                           ';
                  sSql := sSql + 'FROM PLANOSALDO S, PERIODO P                                                       ';
                  sSql := sSql + 'WHERE (S.PLACONTA = '''+cdsCompConta.FieldByName('PLACONTA').AsString+''')           ';
                  sSql := sSql + '      AND (S.PLANO = '+IntToStr(iPlano)+')                             ';
                  sSql := sSql + '      AND (S.IDPESSOA = '+FloatToStr(dEmpresa)+')                      ';
                  sSql := sSql + '      AND (S.PEREXERCICIO = '+IntToStr(iExercicio -1)+')               ';
                  sSql := sSql + '      AND ((S.PERNUMERO  <= '+IntToStr(iPeriodoFim)+')                             ';
                  sSql := sSql + '      OR   (S.PERNUMERO  IS NULL))                                                   ';
                  sSql := sSql + '      AND (S.PERNUMERO = P.PERNUMERO(+)                ) ';
                  sSql := sSql + '      AND (S.PEREXERCICIO = P.PEREXERCICIO(+)          ) ';
                  sSql := sSql + '      AND (S.IDPESSOA = P.IDPESSOA(+)                  ) ';
                  if not cdsCompConta.FieldByName('CODCENTROCUSTO').isNull then begin
                     sSql := sSql + '   AND (S.CODCENTROCUSTO LIKE '''+cdsCompConta.FieldByName('CODCENTROCUSTO').AsString+'%'') ';
                  end;
                  if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                     sSql := sSql + '   AND (S.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                  end;
                  if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                     sSql := sSql + '   AND (S.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                  end;
                  if sCCustoIni <> '' then begin
                     sSql := sSql + ' AND (RTRIM(S.CODCENTROCUSTO) LIKE '''+sCCustoIni+'%'')';
                     sSql := sSql + ' AND (S.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                  end;
                  if trim(sAtivMarca) <> '' then begin
                     sSql := sSql + ' AND  (S.UNIDNEGOC IN (' + trim(sAtivMarca) + ')) ';
                  end;
                  if sAtivProj <> '' then begin
                     sSql := sSql + ' AND (S.UNIDNEGOC = '+sAtivProj+')';
                  end;
                  sSql := sSql + '   GROUP BY S.PERNUMERO,P.PERDATFIM ';

                  if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                  begin
                    sSql := sSql + ' AND (S.IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                  end;

                  if not cdsCompConta.fieldByName('IDPATRO').isNull then
                  begin
                    sSql := sSql + ' AND (S.IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                  end;

                  cdsSaldos.Data := GetDataPacket(sSql);

                  if not cdsSaldos.IsEmpty then begin
                     //FazUPdate do Ano Atual
                     cdsSaldos.First;
                     While not cdsSaldos.EOF do begin
                        dValorResult := 0;
                        if (bDesconResult) and (sTipoOperResult <> '') then begin
                           if sNatureza = 'C' then begin
                              sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';
                           end else begin
                              sSql := 'SELECT /*+ index (LANCAMENTO XIE2LANCAMENTO) */ SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDO  ';
                           end;
                           sSql := sSql + 'FROM PLANILHA P, LANCAMENTO L                                                       ';
                           sSql := sSql + 'WHERE     (L.PLACONTA LIKE '''+cdsCompConta.FieldByName('PLACONTA').AsString+'%'+''')           ';
                           sSql := sSql + '      AND (L.PLANO = '+IntToStr(iPlano)+')                                ';
                           sSql := sSql + '      AND (P.IDPESSOA = '+FloatToStr(dEmpresa)+')                             ';
                           sSql := sSql + '      AND (L.TIPCODIGO = '''+sTipoOperResult+''')            ';
                           if cdsSaldos.FieldByName('PERNUMERO').IsNull then begin
                              sSql := sSql + '      AND (P.PEREXERCICIO = '+IntToStr(iExercicio -1)+') ';
                              sSql := sSql + '      AND (P.PERNUMERO  IS NULL)                                                 ';
                           end else begin
                              cdsPeriodoSaldo.Data := ListaDadosPeriodo(dEmpresa,(iExercicio -1),cdsSaldos.FieldByName('PERNUMERO').AsInteger);
                              sSql := sSql + '      AND (P.PLNDATDIA >= TO_DATE('''+cdsPeriodoSaldo.FieldByName('PERDATINI').AsString+''',''DD/MM/YYYY'')) ';
                              sSql := sSql + '      AND (P.PLNDATDIA <= TO_DATE('''+cdsPeriodoSaldo.FieldByName('PERDATFIM').AsString+''',''DD/MM/YYYY'')) ';
                           end;
                           sSql := sSql + '      AND (P.PLNCODIGO = L.PLNCODIGO) ';
                           if not cdsCompConta.FieldByName('CODCENTROCUSTO').isNull then begin
                              sSql := sSql + '   AND (L.CODCENTROCUSTO LIKE '''+cdsCompConta.FieldByName('CODCENTROCUSTO').AsString+'%'') ';
                              sSql := sSql + '   AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                           end;
                           if not cdsCompConta.FieldByName('UNIDNEGOC').isNull then begin
                              sSql := sSql + '   AND (L.UNIDNEGOC = '+cdsCompConta.FieldByName('UNIDNEGOC').AsString+') ';
                              sSql := sSql + '   AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;
                           if not cdsCompConta.FieldByName('CODSUBCONTA').isNull then begin
                              sSql := sSql + ' AND (L.CODSUBCONTA = '+cdsCompConta.FieldByName('CODSUBCONTA').AsString+') ';
                              sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;
                           if sCCustoIni <> '' then begin
                              sSql := sSql + ' AND (RTRIM(L.CODCENTROCUSTO) LIKE '''+sCCustoIni+'%'')';
                              sSql := sSql + ' AND (L.IDEMPRESA = '+FloatToStr(dEmpresa)+')';
                           end;
                           if trim(sAtivMarca) <> '' then begin
                              sSql := sSql + ' AND  (L.UNIDNEGOC IN (' + trim(sAtivMarca) + ')) ';
                           end;
                           if sAtivProj <> '' then begin
                              sSql := sSql + ' AND (L.UNIDNEGOC = '+sAtivProj+')';
                              sSql := sSql + ' AND (L.IDPESSOA = '+FloatToStr(dEmpresa)+')                     ';
                           end;

                           if not cdsCompConta.fieldByName('IDPLANOPREV').isNull then
                           begin
                             sSql := sSql + ' AND (L.IDPLANOPREV = '+ cdsCompConta.fieldByName('IDPLANOPREV').asString +')';
                           end;

                           if not cdsCompConta.fieldByName('IDPATRO').isNull then
                           begin
                             sSql := sSql + ' AND (L.IDPATRO = '+ cdsCompConta.fieldByName('IDPATRO').asString +')';
                           end;

                           cdsLancResultado.Data := GetDataPacket(sSql);
                           if not cdsLancResultado.IsEmpty then
                           begin
                             dValorResult := cdsLancResultado.FieldByName('SALDO').AsFloat;
                           end;
                        end;
                        dValorRea  := cdsSaldos.FieldByName('SALDO').AsFloat - dValorResult;
                        if (sCodMoedaReal <> '') and (FcdsDemonstrativo.FieldByName('FLGMONETARIA').AsString = 'S') then begin
                           if cdsSaldos.FieldByName('PERDATFIM').isNull then begin
                              sDataRef := sPerDataIni;
                           end else begin
                              sDataRef := cdsSaldos.FieldByName('PERDATFIM').AsString;
                           end;
                           dCotacaoAtu := Contab.TestaCotacaoMoeda(StrToInt(sCodMoedaOrc),
                                          StrToDate(sDataRef),False);
                           if dCotacaoAtu <> 0 then begin
                              dValorRea:= dValorRea/dCotacaoAtu;
                           end else begin
                              dValorRea:= 0;
                           end;
                        end;
                        if (cdsSaldos.FieldByName('PERNUMERO').AsInteger >= iPeriodoIni) and
                           (cdsSaldos.FieldByName('PERNUMERO').AsInteger <= iPeriodoFim) then begin
                           dValAntMes := dValAntMes + dValorRea;
                        end;
                        dValAntAno := dValAntAno + dValorRea;
                        cdsSaldos.Next;
                     end;
                  end;
                  cdsCompConta.Next;
               end;
               FcdsDemonstrativo.Edit;
               FcdsDemonstrativo.FieldByName('ORCMES').AsFloat    := dValOrcMes;
               FcdsDemonstrativo.FieldByName('ORCANO').AsFloat    := dValOrcAno;
               FcdsDemonstrativo.FieldByName('REALMES').AsFloat   := dValReaMes;
               FcdsDemonstrativo.FieldByName('REALANO').AsFloat   := dValReaAno;
               FcdsDemonstrativo.FieldByName('MESANT').AsFloat    := dValAntMes;
               FcdsDemonstrativo.FieldByName('ANOANT').AsFloat    := dValAntAno;

               if (FcdsDemonstrativo.FieldByName('FLGTIPONEGATIVO').AsString <> 'N') then begin
                  FcdsDemonstrativo.FieldByName('ORCMESSN').AsFloat    := dValOrcMes;
                  FcdsDemonstrativo.FieldByName('ORCANOSN').AsFloat    := dValOrcAno;
                  FcdsDemonstrativo.FieldByName('REALMESSN').AsFloat   := dValReaMes;
                  FcdsDemonstrativo.FieldByName('REALANOSN').AsFloat   := dValReaAno;
                  FcdsDemonstrativo.FieldByName('MESANTSN').AsFloat    := dValAntMes;
                  FcdsDemonstrativo.FieldByName('ANOANTSN').AsFloat    := dValAntAno;
               end else begin
                  if Modulo.TestaNatureza(sNatureza, FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValOrcMes) then begin
                     FcdsDemonstrativo.FieldByName('ORCMESSN').AsFloat := Abs(dValOrcMes)* (-1);
                  end else begin
                     FcdsDemonstrativo.FieldByName('ORCMESSN').AsFloat := Abs(dValOrcMes);
                  end;

                  if Modulo.TestaNatureza(sNatureza,FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValOrcAno) then begin
                     FcdsDemonstrativo.FieldByName('ORCANOSN').AsFloat := Abs(dValOrcAno)* (-1);
                  end else begin
                     FcdsDemonstrativo.FieldByName('ORCANOSN').AsFloat := Abs(dValOrcAno);
                  end;

                  if Modulo.TestaNatureza(sNatureza,FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValReaMes) then begin
                     FcdsDemonstrativo.FieldByName('REALMESSN').AsFloat := Abs(dValReaMes)* (-1);
                  end else begin
                     FcdsDemonstrativo.FieldByName('REALMESSN').AsFloat := Abs(dValReaMes);
                  end;

                  if Modulo.TestaNatureza(sNatureza, FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValReaAno) then begin
                     FcdsDemonstrativo.FieldByName('REALANOSN').AsFloat := Abs(dValReaAno)* (-1);
                  end else begin
                     FcdsDemonstrativo.FieldByName('REALANOSN').AsFloat := Abs(dValReaAno);
                  end;

                  if Modulo.TestaNatureza(sNatureza,FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValAntMes) then begin
                     FcdsDemonstrativo.FieldByName('MESANTSN').AsFloat := Abs(dValAntMes)* (-1);
                  end else begin
                     FcdsDemonstrativo.FieldByName('MESANTSN').AsFloat := Abs(dValAntMes);
                  end;

                  if Modulo.TestaNatureza(sNatureza, FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValAntAno) then begin
                     FcdsDemonstrativo.FieldByName('ANOANTSN').AsFloat := Abs(dValAntAno)* (-1);
                  end else begin
                     FcdsDemonstrativo.FieldByName('ANOANTSN').AsFloat := Abs(dValAntAno);
                  end;
               end;
               FcdsDemonstrativo.FieldByName('CALCU').AsString    := 'S';
               FcdsDemonstrativo.Post;
            end;
            FcdsDemonstrativo.Next;
         end;
         x:=1;
         iNumCalc:=0;
         While x = 1 do begin
            bEntrou:=False;
            FcdsDemonstrativo.First;
            bmSavePlace := FcdsDemonstrativo.GetBookmark;
            While not FcdsDemonstrativo.EOF do begin
               sSql := FcdsDemonstrativo.FieldByName('CALCU').AsString+'/'+FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').AsString;
               if FcdsDemonstrativo.FieldByName('CALCU').AsString <> 'S' then begin
                  bEntrou:=True;

                  cdsCompSomatorio.Data := ListaCompSomatorio(FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').asInteger);

                  bCalc  :=True;
                  dValReaMes := 0;
                  dValOrcMes := 0;
                  dValReaAno := 0;
                  dValOrcAno := 0;
                  dValAntMes := 0;
                  dValAntAno := 0;
                  // Salvar Ponteiro
                  bmSavePlace := FcdsDemonstrativo.GetBookmark;
                  cdsCompSomatorio.First;
                  While not cdsCompSomatorio.EOF do begin
                     FcdsDemonstrativo.First;
                     While not FcdsDemonstrativo.EOF do begin
                        if cdsCompSomatorio.FieldByName('ELEMENTODEM').AsInteger = FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').AsInteger then begin
                           //Verificaçao do tipo de operação para cálculo da fórmula
                           sOper := cdsCompSomatorio.FieldByName('FLGOPERACAO').asString;
                           if FcdsDemonstrativo.FieldByName('CALCU').AsString = 'S' then begin
                              case sOPer[1] of
                                 'S' : begin
                                          dValReaMes := dValReaMes + FcdsDemonstrativo.FieldByName('REALMES').AsFloat;
                                          dValOrcMes := dValOrcMes + FcdsDemonstrativo.FieldByName('ORCMES').AsFloat;
                                          dValReaAno := dValReaAno + FcdsDemonstrativo.FieldByName('REALANO').AsFloat;
                                          dValOrcAno := dValOrcAno + FcdsDemonstrativo.FieldByName('ORCANO').AsFloat;
                                          dValAntMes := dValAntMes + FcdsDemonstrativo.FieldByName('MESANT').AsFloat;
                                          dValAntAno := dValAntAno + FcdsDemonstrativo.FieldByName('ANOANT').AsFloat;
                                       end;
                                 'U' : begin
                                          dValReaMes := dValReaMes - FcdsDemonstrativo.FieldByName('REALMES').AsFloat;
                                          dValOrcMes := dValOrcMes - FcdsDemonstrativo.FieldByName('ORCMES').AsFloat;
                                          dValReaAno := dValReaAno - FcdsDemonstrativo.FieldByName('REALANO').AsFloat;
                                          dValOrcAno := dValOrcAno - FcdsDemonstrativo.FieldByName('ORCANO').AsFloat;
                                          dValAntMes := dValAntMes - FcdsDemonstrativo.FieldByName('MESANT').AsFloat;
                                          dValAntAno := dValAntAno - FcdsDemonstrativo.FieldByName('ANOANT').AsFloat;
                                       end;
                                 'M' : begin
                                          dValReaMes := dValReaMes * FcdsDemonstrativo.FieldByName('REALMES').AsFloat;
                                          dValOrcMes := dValOrcMes * FcdsDemonstrativo.FieldByName('ORCMES').AsFloat;
                                          dValReaAno := dValReaAno * FcdsDemonstrativo.FieldByName('REALANO').AsFloat;
                                          dValOrcAno := dValOrcAno * FcdsDemonstrativo.FieldByName('ORCANO').AsFloat;
                                          dValAntMes := dValAntMes * FcdsDemonstrativo.FieldByName('MESANT').AsFloat;
                                          dValAntAno := dValAntAno * FcdsDemonstrativo.FieldByName('ANOANT').AsFloat;
                                       end;
                                 'D' : begin
                                          if FcdsDemonstrativo.FieldByName('REALMES').asFloat <> 0 then begin
                                             dValReaMes := dValReaMes / FcdsDemonstrativo.FieldByName('REALMES').AsFloat;
                                          end else begin
                                             dValReaMes := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('ORCMES').asFloat <> 0 then begin
                                             dValOrcMes := dValOrcMes / FcdsDemonstrativo.FieldByName('ORCMES').AsFloat;
                                          end else begin
                                             dValOrcMes := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('REALANO').asFloat <> 0 then begin
                                             dValReaAno := dValReaAno / FcdsDemonstrativo.FieldByName('REALANO').AsFloat;
                                          end else begin
                                             dValReaAno := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('ORCANO').asFloat <> 0 then begin
                                             dValOrcAno := dValOrcAno / FcdsDemonstrativo.FieldByName('ORCANO').AsFloat;
                                          end else begin
                                             dValOrcAno := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('ANOANT').asFloat <> 0 then begin
                                             dValAntAno := dValAntAno / FcdsDemonstrativo.FieldByName('ANOANT').AsFloat;
                                          end else begin
                                             dValAntAno := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('MESANT').asFloat <> 0 then begin
                                             dValAntMes := dValAntMes / FcdsDemonstrativo.FieldByName('MESANT').AsFloat;
                                          end else begin
                                             dValAntMEs := 0;
                                          end;
                                       end;
                                 'P' : begin
                                          if FcdsDemonstrativo.FieldByName('REALMES').asFloat <> 0 then begin
                                             dValReaMes := (dValReaMes / FcdsDemonstrativo.FieldByName('REALMES').AsFloat) * 100;
                                          end else begin
                                             dValReaMes := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('ORCMES').asFloat <> 0 then begin
                                             dValOrcMes := (dValOrcMes / FcdsDemonstrativo.FieldByName('ORCMES').AsFloat) * 100;
                                          end else begin
                                             dValOrcMes := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('REALANO').asFloat <> 0 then begin
                                             dValReaAno := (dValReaAno / FcdsDemonstrativo.FieldByName('REALANO').AsFloat) * 100;
                                          end else begin
                                             dValReaAno := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('ORCANO').asFloat <> 0 then begin
                                             dValOrcAno := (dValOrcAno / FcdsDemonstrativo.FieldByName('ORCANO').AsFloat) * 100;
                                          end else begin
                                             dValOrcAno := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('ANOANT').asFloat <> 0 then begin
                                             dValAntAno := (dValAntAno / FcdsDemonstrativo.FieldByName('ANOANT').AsFloat) * 100;
                                          end else begin
                                             dValAntAno := 0;
                                          end;
                                          if FcdsDemonstrativo.FieldByName('MESANT').asFloat <> 0 then begin
                                             dValAntMes := (dValAntMes / FcdsDemonstrativo.FieldByName('MESANT').AsFloat) * 100;
                                          end else begin
                                             dValAntMEs := 0;
                                          end;
                                       end;
                              end;
                           end else begin
                              bCalc:=False;
                              Break;
                           end;
                        end;
                        FcdsDemonstrativo.Next;
                     end;
                     cdsCompSomatorio.Next;
                  end;
                  FcdsDemonstrativo.GotoBookmark(bmSavePlace);
                  if bCalc then begin
                     Inc(iNumCalc);
                     FcdsDemonstrativo.Edit;
                     FcdsDemonstrativo.FieldByName('ORCMES').AsFloat    := dValOrcMes;
                     FcdsDemonstrativo.FieldByName('ORCANO').AsFloat    := dValOrcAno;
                     FcdsDemonstrativo.FieldByName('REALMES').AsFloat   := dValReaMes;
                     FcdsDemonstrativo.FieldByName('REALANO').AsFloat   := dValReaAno;
                     FcdsDemonstrativo.FieldByName('MESANT').AsFloat    := dValAntMes;
                     FcdsDemonstrativo.FieldByName('ANOANT').AsFloat    := dValAntAno;

                     if (FcdsDemonstrativo.FieldByName('FLGTIPONEGATIVO').AsString <> 'N') then begin
                        FcdsDemonstrativo.FieldByName('ORCMESSN').AsFloat    := dValOrcMes;
                        FcdsDemonstrativo.FieldByName('ORCANOSN').AsFloat    := dValOrcAno;
                        FcdsDemonstrativo.FieldByName('REALMESSN').AsFloat   := dValReaMes;
                        FcdsDemonstrativo.FieldByName('REALANOSN').AsFloat   := dValReaAno;
                        FcdsDemonstrativo.FieldByName('MESANTSN').AsFloat    := dValAntMes;
                        FcdsDemonstrativo.FieldByName('ANOANTSN').AsFloat    := dValAntAno;
                     end else begin
                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValOrcMes) then begin
                           FcdsDemonstrativo.FieldByName('ORCMESSN').AsFloat := Abs(dValOrcMes)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('ORCMESSN').AsFloat := Abs(dValOrcMes);
                        end;
                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValOrcAno) then begin
                           FcdsDemonstrativo.FieldByName('ORCANOSN').AsFloat := Abs(dValOrcAno)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('ORCANOSN').AsFloat := Abs(dValOrcAno);
                        end;

                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValReaMes) then begin
                           FcdsDemonstrativo.FieldByName('REALMESSN').AsFloat := Abs(dValReaMes)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('REALMESSN').AsFloat := Abs(dValReaMes);
                        end;
                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValReaAno) then begin
                           FcdsDemonstrativo.FieldByName('REALANOSN').AsFloat := Abs(dValReaAno)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('REALANOSN').AsFloat := Abs(dValReaAno);
                        end;

                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValAntMes) then begin
                           FcdsDemonstrativo.FieldByName('MESANTSN').AsFloat := Abs(dValAntMes)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('MESANTSN').AsFloat := Abs(dValAntMes);
                        end;
                        if Modulo.TestaNatureza(sNatureza,
                           FcdsDemonstrativo.FieldByName('FLGNATUREZA').AsString, dValAntAno) then begin
                           FcdsDemonstrativo.FieldByName('ANOANTSN').AsFloat := Abs(dValAntAno)* (-1);
                        end else begin
                           FcdsDemonstrativo.FieldByName('ANOANTSN').AsFloat := Abs(dValAntAno);
                        end;
                     end;

                     FcdsDemonstrativo.FieldByName('CALCU').AsString := 'S';
                     FcdsDemonstrativo.Post;
                  end;
               end;
               FcdsDemonstrativo.Next;
            end;
            FcdsDemonstrativo.FreeBookmark(bmSavePlace);
            if not bEntrou then Break;
            if iNumCalc = 0 then begin
               Break;
               Abort;
            end;
         end;
         //Calcula Percentuais
         FcdsDemonstrativo.First;
         bmSavePlace := FcdsDemonstrativo.GetBookmark;
         While not FcdsDemonstrativo.EOF do begin
            If not FcdsDemonstrativo.FieldByName('IDELEMANAVERTICAL').isNull then begin
               iElem100   := FcdsDemonstrativo.FieldByName('IDELEMANAVERTICAL').AsInteger;
               dValReaMes := 0;
               dValOrcMes := 0;
               dValReaAno := 0;
               dValOrcAno := 0;
               dValAntMes := 0;
               dValAntAno := 0;
               // Salvar Ponteiro
               bmSavePlace := FcdsDemonstrativo.GetBookmark;
               FcdsDemonstrativo.First;
               While not FcdsDemonstrativo.EOF do begin
                  if (iElem100 = FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').AsInteger) then begin
                     dValReaMes := FcdsDemonstrativo.FieldByName('REALMES').AsFloat;
                     dValOrcMes := FcdsDemonstrativo.FieldByName('ORCMES').AsFloat;
                     dValReaAno := FcdsDemonstrativo.FieldByName('REALANO').AsFloat;
                     dValOrcAno := FcdsDemonstrativo.FieldByName('ORCANO').AsFloat;
                     dValAntMes := FcdsDemonstrativo.FieldByName('MESANT').AsFloat;
                     dValAntAno := FcdsDemonstrativo.FieldByName('ANOANT').AsFloat;
                     Break;
                  end;
                  FcdsDemonstrativo.Next;
               end;
               // Ponterar cds
               FcdsDemonstrativo.GotoBookmark(bmSavePlace);
               FcdsDemonstrativo.Edit;
               if dValOrcMes <> 0 then FcdsDemonstrativo.FieldByName('PERORCMES').AsFloat := FcdsDemonstrativo.FieldByName('ORCMES').AsFloat/dValOrcMes*100;
               if dValOrcAno <> 0 then FcdsDemonstrativo.FieldByName('PERORCANO').AsFloat := FcdsDemonstrativo.FieldByName('ORCANO').AsFloat/dValOrcAno*100;
               if dValReaMes <> 0 then FcdsDemonstrativo.FieldByName('PERREALMES').AsFloat:= FcdsDemonstrativo.FieldByName('REALMES').AsFloat/dValReaMes*100;
               if dValReaAno <> 0 then FcdsDemonstrativo.FieldByName('PERREALANO').AsFloat:= FcdsDemonstrativo.FieldByName('REALANO').AsFloat/dValReaAno*100;
               if dValAntMes <> 0 then FcdsDemonstrativo.FieldByName('PERMESANT').AsFloat := FcdsDemonstrativo.FieldByName('MESANT').AsFloat/dValAntMes*100;
               if dValAntAno <> 0 then FcdsDemonstrativo.FieldByName('PERANOANT').AsFloat := FcdsDemonstrativo.FieldByName('ANOANT').AsFloat/dValAntAno*100;
               FcdsDemonstrativo.Post;
            end;
            If not FcdsDemonstrativo.FieldByName('IDELEMANAVERT1').isNull then begin
               iElem100   := FcdsDemonstrativo.FieldByName('IDELEMANAVERT1').AsInteger;
               dValReaMes := 0;
               dValOrcMes := 0;
               dValReaAno := 0;
               dValOrcAno := 0;
               dValAntMes := 0;
               dValAntAno := 0;
               // Salvar Ponteiro
               bmSavePlace := FcdsDemonstrativo.GetBookmark;
               FcdsDemonstrativo.First;
               While not EOF do begin
                  if (iElem100 = FcdsDemonstrativo.FieldByName('IDELEMDEMONSTRAT').AsInteger) then begin
                     dValReaMes := FcdsDemonstrativo.FieldByName('REALMES').AsFloat;
                     dValOrcMes := FcdsDemonstrativo.FieldByName('ORCMES').AsFloat;
                     dValReaAno := FcdsDemonstrativo.FieldByName('REALANO').AsFloat;
                     dValOrcAno := FcdsDemonstrativo.FieldByName('ORCANO').AsFloat;
                     dValAntMes := FcdsDemonstrativo.FieldByName('MESANT').AsFloat;
                     dValAntAno := FcdsDemonstrativo.FieldByName('ANOANT').AsFloat;
                     Break;
                  end;
                  FcdsDemonstrativo.Next;
               end;
               // Ponterar cds
               FcdsDemonstrativo.GotoBookmark(bmSavePlace);
               FcdsDemonstrativo.Edit;
               if dValOrcMes <> 0 then FcdsDemonstrativo.FieldByName('PERORCMES1').AsFloat := FcdsDemonstrativo.FieldByName('ORCMES').AsFloat/dValOrcMes;
               if dValOrcAno <> 0 then FcdsDemonstrativo.FieldByName('PERORCANO1').AsFloat := FcdsDemonstrativo.FieldByName('ORCANO').AsFloat/dValOrcAno;
               if dValReaMes <> 0 then FcdsDemonstrativo.FieldByName('PERREALMES1').AsFloat:= FcdsDemonstrativo.FieldByName('REALMES').AsFloat/dValReaMes;
               if dValReaAno <> 0 then FcdsDemonstrativo.FieldByName('PERREALANO1').AsFloat:= FcdsDemonstrativo.FieldByName('REALANO').AsFloat/dValReaAno;
               if dValAntMes <> 0 then FcdsDemonstrativo.FieldByName('PERMESANT1').AsFloat := FcdsDemonstrativo.FieldByName('MESANT').AsFloat/dValAntMes;
               if dValAntAno <> 0 then FcdsDemonstrativo.FieldByName('PERANOANT1').AsFloat := FcdsDemonstrativo.FieldByName('ANOANT').AsFloat/dValAntAno;
               FcdsDemonstrativo.Post;
            end;
            FcdsDemonstrativo.Next;
         end;

         if not bZerados then
         begin
            FcdsDemonstrativo.First;
            while not FcdsDemonstrativo.EOF do
            begin

               if FcdsDemonstrativo.FieldByName('ORCMES').asFloat + FcdsDemonstrativo.FieldByName('REALMES').asFloat +
                  FcdsDemonstrativo.FieldByName('MESANT').asFloat + FcdsDemonstrativo.FieldByName('ORCANO').asFloat +
                  FcdsDemonstrativo.FieldByName('REALANO').asFloat + FcdsDemonstrativo.FieldByName('ANOANT').asFloat = 0 then
               begin
                    if FcdsDemonstrativo.FieldByName('ELETIPOELEM').AsString <> 'T' then
                       FcdsDemonstrativo.Delete
                    else
                      FcdsDemonstrativo.Next;
               end else
               begin
                  FcdsDemonstrativo.Next;
               end;
            end;
         end;

         FcdsDemonstrativo.FreeBookmark(bmSavePlace);

         if bGeraTxt then
            GeraTxt_Demo2(iExercicio,sNomePer1,sNomePer2,sNomeDemo,sNomeMoedaReal,sNomeMoedaOrc) ;


      Except
        Result := false;
      End;

   Finally
     cdsCompConta.Free;
     cdsCompSomatorio.free;
     cdsLancResultado.free;
     cdsPeriodoSaldo.free;
     cdsSaldos.free;
     Free;
   End;


end;




function TCtrlRptDemonstrativo.RetornaTipoOperResult(iIdPessoa: integer): string;
begin
   _Cds.Data := GetDataPacket('SELECT PACTIPOPERRESULT FROM PARAMCONTAB WHERE IDPESSOA = ' + IntToStr(iIdPessoa));
   Result    := _Cds.FieldbyName('PACTIPOPERRESULT').AsString;
end;




function TCtrlRptDemonstrativo.ListaDemonstrativoSPC(iIdPessoa: integer;
                                                     bPadraoSPC: boolean = false): OleVariant;
var
 sSQL: string;

begin
   sSQL := 'SELECT ' +
           '   IDDEMONSTRATIVO, IDPESSOA, DEMDESCDEMONSTRAT,DEMNATUREZA ' +
           'FROM ' +
           '   DEMONSTRATIVO ' +
           'WHERE ' +
           '   (IDPESSOA = ' + IntToStr(iIdPessoa)+ ') ';

           if bPadraoSPC then
              sSQL := sSQL + ' AND (IDDEMONSTRATIVO < 0) '
           else
              sSQL := sSQL + ' AND (IDDEMONSTRATIVO > 0) ';

           sSQL := sSQL + 'ORDER BY ' +
                          '   DEMDESCDEMONSTRAT ';
   Result := GetDataPacket(sSQL);
end;




function TCtrlRptDemonstrativo.ListaExercicio(
  iIdPessoa: integer): OleVariant;
begin
   Result := GetDataPacket('SELECT DISTINCT ' +
                           '   PEREXERCICIO ' +
                           ' FROM ' +
                           '    PERIODO ' +
                           ' WHERE ' +
                           '    IDPESSOA = ' + IntToStr(iIdPessoa)+ ' ' +
                           ' ORDER BY ' +
                           '    PEREXERCICIO ');

end;




function TCtrlRptDemonstrativo.ListaPeriodo(
  iIdPessoa,iExercicio: integer): OleVariant;
begin
   Result := GetDataPacket(' SELECT ' +
                           '    PERNUMERO, PERNOME ' +
                           ' FROM ' +
                           '    PERIODO ' +
                           ' WHERE ' +
                           '    (IDPESSOA     = ' + IntToStr(iIdPessoa) + ') AND ' +
                           '    (PEREXERCICIO = ' + IntToStr(iExercicio)+ ') ' +
                           ' ORDER BY ' +
                           '    PERNUMERO ');


end;




function TCtrlRptDemonstrativo.ListaPlano: OleVariant;
begin
   Result := GetDataPacket('SELECT ' +
                           '   ''N'' AS SELECIONA, ' +
                           '   IDPLANOPREV, ' +
                           '   NOME ' +
                           'FROM ' +
                           '   PLANPREVCONTABIL ' +
                           'WHERE ' +
                           '   ATIVO = ''S'' ' +
                           'ORDER BY ' +
                           '   NOME ');
end;




function TCtrlRptDemonstrativo.ListaPatro: OleVariant;
begin
   Result := GetDataPacket('  SELECT ' +
                           '   ''N'' AS SELECIONA, ' +
                           '   PPA.NOME, ' +
                           '   PTR.IDPESSOA AS IDPATRO ' +
                           'FROM ' +
                           '   PESSOA PPA, ' +
                           '   PATRO  PTR ' +
                           'WHERE ' +
                           '    PTR.IDPESSOA = PPA.IDPESSOA ' +
                           'ORDER BY ' +
                           '   NOME ');

end;




function TCtrlRptDemonstrativo.PegaDataExercicio(iIdPessoa,
  iExercicio: integer; bDataInicial: boolean = false): TDateTime;

begin
    _Cds.Data := GetDataPacket('SELECT ' +
                               '  PERDATINI, ' +
                               '  PERDATFIM ' +
                               'FROM ' +
                               '   PERIODO ' +
                               'WHERE ' +
                               '   (IDPESSOA = ' + IntToStr(iIdPessoa) + ') AND ' +
                               '   (PEREXERCICIO = ' + IntToStr(iExercicio) + ') ' +
                               'ORDER BY ' +
                               '   PERNUMERO ');
   if bDataInicial then
      Result := _Cds.FieldByName('PERDATINI').AsDateTime
   else
      Result := _Cds.FieldByName('PERDATFIM').AsDateTime;
end;




function TCtrlRptDemonstrativo.ListaDadosDemonstrativoSPC(
  iIdDemonstrativo: integer): OleVariant;
begin
   Result := GetDataPacket(' SELECT ' +
                           '   IDDEMONSTRATIVO, IDPESSOA, DEMDESCDEMONSTRAT, ' +
                           '   DEMNATUREZA,FLGTRACOACIMA,FLGTRACOABAIXO, ' +
                           '   DEMTITULOCOMPL, DEMTITULOCOMPL2 ' +
                           ' FROM ' +
                           '    DEMONSTRATIVO ' +
                           ' WHERE ' +
                           '    (IDDEMONSTRATIVO = ' + IntToStr(iIdDemonstrativo)+ ') ' +
                           ' ORDER BY ' +
                           '    DEMDESCDEMONSTRAT ');
end;




function TCtrlRptDemonstrativo.ListaLogoFundacao(
  iIdEmpresa: integer): OleVariant;
begin
   Result := GetDataPacket('SELECT I.IMAGEM ' +
                           'FROM ' +
                           '   IMAGENS I, ' +
                           '   PESSOA P ' +
                           'WHERE ' +
                           '   (P.IDIMAGEM = I.IDIMAGEM) AND ' +
                           '   (P.IDPESSOA = ' + IntToStr(iIdEmpresa) + ') ');

end;

procedure TCtrlRptDemonstrativo.ListaPlanoPatro(iPlano, iPatro: integer);
var
Patro, Plano: TClientDataSet;

begin

  Plano := TClientDataSet.Create(nil);
  Patro := TClientDataSet.Create(nil);

  Plano.data := GetDataPacket('SELECT ' +
                              '   IDPLANOPREV, ' +
                              '   NOME ' +
                              'FROM ' +
                              '   PLANPREVCONTABIL ' +
                              'WHERE ' +
                              '   ATIVO = ''S'' ' +
                              '   AND IDPLANOPREV = ' + IntToStr(iPlano) );

  if iPlano <> 0 then
     sNomePlano := Plano.fieldbyname('NOME').AsString
  else
     sNomePlano := '';

  Patro.data := GetDataPacket('SELECT ' +
                              '   PPA.NOME, ' +
                              '   PTR.IDPESSOA ' +
                              'FROM ' +
                              '   PESSOA PPA, ' +
                              '   PATRO  PTR ' +
                              'WHERE ' +
                              '   PTR.IDPESSOA = PPA.IDPESSOA ' +
                              '   AND PTR.IDPESSOA = ' + IntToStr(iPatro) );

  if iPatro <> 0 then
     sNomePatro := Patro.fieldbyname('NOME').AsString
  else
     sNomePatro := '';



FreeAndNil(Plano);
FreeAndNil(Patro);

end;

end.
