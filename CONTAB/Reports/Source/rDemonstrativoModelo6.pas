
unit rDemonstrativoModelo6;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RRelatWeb, uCmRptManager, TXComp, CmParamReport, DBClient, Provider,
  ADODB, Db, DBTables, Wwquery, ppDB, ppBands, ppClass, ppVar, ppCtrls,
  ppPrnabl, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppDBBDE,
  Wwdatsrc, usistema, StdCtrls, pptypes, uCmSqlParams, TXRB;

type
  TrptDemonstrativoModelo6 = class(TRptRelatWeb)
    dsRelatorio: TwwDataSource;
    ppRelatorio: TppBDEPipeline;
    rptDemonstrativoModelo6: TppReport;
    ppHeaderBand20: TppHeaderBand;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel125: TppLabel;
    ppLabel126: TppLabel;
    linAcima: TppLine;
    linAbaixo: TppLine;
    ppLabel129: TppLabel;
    ppLabel131: TppLabel;
    ppDBImage1: TppDBImage;
    txtSaldoAnterior: TppLabel;
    txtDebito: TppLabel;
    txtCredito: TppLabel;
    txtSaldo: TppLabel;
    txtFiltro6: TppLabel;
    bndDetDemo6: TppDetailBand;
    dbtxtNomeDemo6: TppDBText;
    dbtxtSaldoAntDemo6: TppDBText;
    dbtxtDebDemo6: TppDBText;
    dbtxtSaldoDemo6: TppDBText;
    linDemo6: TppLine;
    dbtxtCreDemo6: TppDBText;
    dbtxtDCSaldoAntDemo6: TppDBText;
    dbtxtDCSaldoDemo6: TppDBText;
    rptDemonstrativo6DBText1: TppDBText;
    ppFooterBand21: TppFooterBand;
    ppLine66: TppLine;
    ppLabel132: TppLabel;
    rptDemonstrativo6Label1: TppLabel;
    rptDemonstrativo6Label2: TppLabel;
    ppCalc42: TppSystemVariable;
    rptDemonstrativo6Calc1: TppSystemVariable;
    rptDemonstrativo6Group1: TppGroup;
    rptDemonstrativo6GroupHeaderBand1: TppGroupHeaderBand;
    rptDemonstrativo6GroupFooterBand1: TppGroupFooterBand;
    cdsDTDemonstrativo: TClientDataSet;
    cdsPeriodoInicial: TClientDataSet;
    cdsPeriodoFinal: TClientDataSet;
    cdsMoeda: TClientDataSet;
    cdsCompConta: TClientDataSet;
    cdsSaldo: TClientDataSet;
    cdsSaldoAnt: TClientDataSet;
    cdsMovimentacao: TClientDataSet;
    cdsCompSomatorio: TClientDataSet;
    cdslkDemonstrativo: TClientDataSet;
    Cds: TClientDataSet;
    cdsEmpresa: TClientDataSet;
    Csp: TCMSqlParams;
    cspEmpresa: TCMSqlParams;
    cspDTDemonstrativo: TCMSqlParams;
    cspPeriodoInicial: TCMSqlParams;
    cspPeriodoFinal: TCMSqlParams;
    cspCompSomatorio: TCMSqlParams;
    cspCompConta: TCMSqlParams;
    csplkDemonstrativo: TCMSqlParams;
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);

    function  FazFormula(rValor1, rValor2: double; sTipo, sCondicao:string; rValor3: double):double;

    procedure PreencheParametrosComposicao(cdsTemp : TClientDataSet; 
                                           sTipoQuery, sNatureza, sConta, sCCusto1, sCCusto2: string; iPessoa : Double; iExercicio, iPeriodoIni, iPeriodoFim, iUnidNegoc1, iUnidNegoc2, iSubConta: integer);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure ppHeaderBand20BeforePrint(Sender: TObject);
    procedure bndDetDemo6BeforePrint(Sender: TObject);
    procedure EspecificaParametros(cdsTemp : TClientDataSet; bndDetalheDemo: TppDetailBand);
    procedure CmpRptCMParamControlEnter(Sender: TPainelControles;
      Index: Integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    bIngles          : Boolean;
    iPagIni          : Integer;
    sDataIni         : String;
    sExercicio       : String;
    sPeriodoIni      : String;
    sPeriodoFim      : String;
    sDemonstrativo   : String;
    sCCustoDescricao : String;
    sAtividade       : String;
    sMoeda           : String;

  public
    { Public declarations }
  end;

var
  rptDemonstrativoModelo6: TrptDemonstrativoModelo6;

implementation

Uses uCtrlPadroes;

{$R *.DFM}

procedure TrptDemonstrativoModelo6.CrmRptCMChangeDataBaseName(Sender: TObject; sDataBaseName: String);
Var
 X: Integer; 
begin
  inherited;

  For X:=0 To ComponentCount - 1 Do
     If Components[x] Is TWWQuery Then
     Begin
        If TWWQuery(Components[x]).Active Then TWWQuery(Components[x]).Close;
        TWWQuery(Components[x]).DatabaseName := sDataBaseName;
     End;
end;

procedure TrptDemonstrativoModelo6.CrmRptCMBeforePrint(Sender: TObject);
var sTipoQuery, sConta, sCCusto1, sCCusto2, sDataRef,
    sCCusto, sAtivProj, sSalto, sOper, sCond : string;
    iExercicio, iPeriodoIni, iPeriodoFim, iUnidNegoc1, iUnidNegoc2, iSubConta: integer;
    iPessoa : Double;
    rValDeb, rValCre, rValSaldo, rValSaldoAnt : Double;
    rCotacaoAtu, rValorCond : Double;
    bCalc, bEntrou : Boolean;
    x, iLinha : Integer;
    bmSavePlace : TBookmark;
    _qrySaldo, _qrySaldoAnt, _qryMovimentacao : TwwQuery;
    sSQL : TStringList;
begin
  inherited;
  iPagIni := CmpRptCm.ParamValues[9].AsInteger;
  sExercicio       := CmpRptCm.ParamValues[0].AsString;
  sPeriodoIni      := CmpRptCm.ParamValues[1].AsString;
  sPeriodoFim      := CmpRptCm.ParamValues[2].AsString;
  sDemonstrativo   := CmpRptCm.ParamValues[3].AsString;
  sCCustoDescricao := CmpRptCm.ParamValues[4].AsString;
  sAtividade       := CmpRptCm.ParamValues[5].AsString;
  sMoeda           := CmpRptCm.ParamValues[6].AsString;
// -----------------------------------------------------------------------------
   with cdsEmpresa do
   begin
     cspEmpresa.Prepare;
     cspEmpresa.ParamByName('IDPESSOA').asFloat := CrmRptCM.IdEmpresa;
     cspEmpresa.Open;

     ppLabel45.Caption  := FieldByName('NOMERELAT1').AsString;
     ppLabel125.Caption := FieldByName('NOMERELAT2').AsString;
   end;
// -----------------------------------------------------------------------------
   with cdslkDemonstrativo do
   begin
     csplkDemonstrativo.Prepare;
     csplkDemonstrativo.ParamByName('pIDDEMONSTRATIVO').AsInteger := CmpRptCm.ParamValues[3].AsInteger;
     csplkDemonstrativo.Open;

     ppLabel126.Caption := FieldByName('DEMDESCDEMONSTRAT').AsString;
   end;
// -----------------------------------------------------------------------------
   If cdsMoeda.Active Then cdsMoeda.Close;
   cdsMoeda.Data := Padroes.GetDataPacket('SELECT MOECODIGO,MOEDESC,MOESIGLA FROM MOEDA WHERE MOEINATIVO = ''A'' ORDER BY MOEDESC');
// -----------------------------------------------------------------------------
   with cdsDTDemonstrativo do
   begin
     cspDTDemonstrativo.Prepare;
     cspDTDemonstrativo.ParamByName('IDDEMONSTRATIVO').AsFloat := CmpRptCm.ParamValues[3].AsFloat;
     cspDTDemonstrativo.Open;
     
     { Imprime os títulos }
     if FieldByName('FLGTRACOACIMA').IsNull then
        sLinhaAcima := 'C'
     else
        sLinhaAcima := FieldByName('FLGTRACOACIMA').AsString;
     if FieldByName('FLGTRACOABAIXO').IsNull then
        sLinhaAbaixo:= 'C'
     else
        sLinhaAbaixo:= FieldByName('FLGTRACOABAIXO').AsString;
   end;
// -----------------------------------------------------------------------------
   screen.cursor      := crSQLWait;
   if trim(sCCustoDescricao) <> '' then
     sCCusto := CmpRptCm.ParamValues[4].AsString + ' - ' + sCCustoDescricao
   else
    sCCusto := '<Todos>';

   if trim(sAtividade) <> '' then
      sAtivProj := CmpRptCm.ParamValues[5].AsString
   else
      sAtivProj := '<Todas>';

   if CmpRptCm.ParamValues[8].AsBoolean then
      txtFiltro6.Caption := 'Centro de Custo: ' + sCCusto  + '    Ativ.Proj.: ' + sAtivProj
   else
      txtFiltro6.Caption := '';
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Periodo Inicial e Periodo Final
// -----------------------------------------------------------------------------
   with cspPeriodoInicial do
   begin
     Prepare;
     ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
     ParamByName('PEREXERCICIO').AsInteger := CmpRptCm.ParamValues[0].AsInteger;
     Open;
   end;

   with cspPeriodoFinal do
   begin
     prepare;
     ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
     ParamByName('PEREXERCICIO').AsInteger := CmpRptCm.ParamValues[0].AsInteger;
     Open;
   end;
// -----------------------------------------------------------------------------
   if CmpRptCm.ParamValues[7].AsBoolean then
   begin
     if CmpRptCm.ParamValues[1].AsString = CmpRptCm.ParamValues[2].AsString then
        ppLabel46.Caption := cdsPeriodoInicial.FieldByName('PERNOMEOUTLING').AsString + '/' + CmpRptCm.ParamValues[0].AsString
     else
        ppLabel46.Caption := cdsPeriodoInicial.FieldByName('PERNOMEOUTLING').AsString + '/' + CmpRptCm.ParamValues[0].AsString + ' to ' +
                             cdsPeriodoFinal.FieldByName('PERNOMEOUTLING').AsString + '/' + CmpRptCm.ParamValues[0].AsString;
   end
   else
   begin
     if CmpRptCm.ParamValues[1].AsString = CmpRptCm.ParamValues[2].AsString then
        ppLabel46.Caption := cdsPeriodoInicial.FieldByName('PERNOME').AsString + '/' + CmpRptCm.ParamValues[0].AsString
     else
        ppLabel46.Caption := cdsPeriodoInicial.FieldByName('PERNOME').AsString + '/'+ CmpRptCm.ParamValues[0].AsString + ' a ' +
                             cdsPeriodoFinal.FieldByName('PERNOME').AsString + '/'+ CmpRptCm.ParamValues[0].AsString     ;
   end;
// -----------------------------------------------------------------------------
   if trim(CmpRptCm.ParamValues[6].AsString) = '' then
      ppLabel129.Caption := cdsDTDemonstrativo.FieldByName('DEMTITULOCOMPL').AsString + '  ' + sSiglaMoedaCorr
   else
      ppLabel129.Caption := cdsDTDemonstrativo.FieldByName('DEMTITULOCOMPL').AsString + '  ' + cdsMoeda.FieldByName('MOESIGLA').AsString;
   ppLabel131.Caption := cdsDTDemonstrativo.FieldByName('DEMTITULOCOMPL2').AsString;
// -----------------------------------------------------------------------------

{
   dtmRelatoriosContabil.qryEmpresaProp.Close;
   dtmRelatoriosContabil.qryEmpresaProp.ParamByName('IDPESSOA').asInteger := sistema.idEmpresa;
   dtmRelatoriosContabil.qryEmpresaProp.Open;
}

   With cds do
   begin
     Csp.Prepare;
     Csp.ParamByName('IDDEMONSTRATIVO').AsInteger := cdslkDemonstrativo.FieldByName('IDDEMONSTRATIVO').AsInteger;
     Csp.Open;
     
  // Verifica se o relatório será impresso em Inglês
     bIngles    := CmpRptCm.ParamValues[7].AsBoolean;

  // Zera o acumulador de salto de pagina
     iLinha := 0;
     sSalto := 'N';

     while not EOF do
     begin
       Edit;
       if sSalto = 'S' then
       begin
         inc(iLinha);
         sSalto := 'N';
       end;

       if FieldByName('FLGSALTAPAGINA').asString = 'S' then
         sSalto := 'S';
       FieldByName('SALTA').asString := IntToStr(iLinha);

       { Pega a Composição do Elemento (do Tipo Conta) }

       cspCompConta.Prepare;
       cspCompConta.ParamByName('IELEMDEMONSTRAT').AsInteger := FieldByName('IDELEMDEMONSTRAT').asInteger;
       cspCompConta.Open;

       if not cdsCompConta.IsEmpty then
       begin
         rValDeb      := 0;
         rValCre      := 0;
         rValSaldoAnt := 0;
         rValSaldo    := 0;
         cdsCompConta.First;
         while not cdsCompConta.EOF do
         begin
        // Saldo do Exercicio ATUAL
           sConta      := Espaco(trim(cdsCompConta.FieldByName('PLACONTA').AsString),18);
           iPessoa     := CrmRptCM.IdEmpresa;
           iExercicio  := CmpRptCm.ParamValues[0].AsInteger;
           iPeriodoIni := CmpRptCm.ParamValues[1].AsInteger;
           iPeriodoFim := CmpRptCm.ParamValues[2].AsInteger;

           if cdsCompConta.FieldByName('CODCENTROCUSTO').isNull then
              sCCusto1 := ''
           else
              sCCusto1 := Espaco(trim(cdsCompConta.FieldByName('CODCENTROCUSTO').AsString),10);

           if cdsCompConta.FieldByName('UNIDNEGOC').isNull then
              iUnidNegoc1 := 0
           else
              iUnidNegoc1 := cdsCompConta.FieldByName('UNIDNEGOC').AsInteger;

           if cdsCompConta.FieldByName('CODSUBCONTA').isNull then
              iSubConta := 0
           else
              iSubConta := cdsCompConta.FieldByName('CODSUBCONTA').AsInteger;

           { Centro de Custo }
           if trim(sCCustoDescricao) = '' then
              sCCusto2 := ''
           else
              scCusto2 := espaco(trim(CmpRptCm.ParamValues[4].AsString), 10);

           { Atividade/Projeto }
           if trim(sAtividade) = '' then
              iUnidNegoc2 := 0
           else
              iUnidNegoc2 := CmpRptCm.ParamValues[5].AsInteger;

           PreencheParametrosComposicao(cdsSaldo, 'S', cdsDTDemonstrativo.FieldByName('DEMNATUREZA').AsString,
                                        sConta, sCCusto1, sCCusto2,
                                        iPessoa, iExercicio, iPeriodoIni, iPeriodoFim,
                                        iUnidNegoc1, iUnidNegoc2, iSubConta);
// -----------------------------------------------------------------------------
           cdsSaldo.First;
           if not cdsSaldo.EOF then
           begin
             rValSaldo := rValSaldo + cdsSaldo.FieldByName('SALDO').AsFloat;
             if (sMoeda <> '') and (FieldByName('FLGMONETARIA').AsString = 'S') then
             begin
               if cdsSaldo.FieldByName('PERDATFIM').isNull then
                  sDataRef := sDataIni
               else
                  sDataRef := cdsSaldo.FieldByName('PERDATFIM').AsString;
               rCotacaoAtu := TestaCotacaoMoeda(CmpRptCm.ParamValues[6].AsInteger, sDataRef,'N');
               if rCotacaoAtu <> 0 then
                  rValSaldo := rValSaldo / rCotacaoAtu
               else
                  rValSaldo := 0;
             end;
             cdsSaldo.Next;
           end;
// -----------------------------------------------------------------------------
         { Saldo ANTERIOR }
           iExercicio  := CmpRptCm.ParamValues[0].AsInteger - 1;
           PreencheParametrosComposicao(cdsSaldoAnt, 'A', cdsDTDemonstrativo.FieldByName('DEMNATUREZA').AsString,
                                        sConta, sCCusto1, sCCusto2,
                                        iPessoa, iExercicio, iPeriodoIni, iPeriodoFim,
                                        iUnidNegoc1, iUnidNegoc2, iSubConta);
           cdsSaldoAnt.First;
           if not cdsSaldoAnt.EOF then
           begin
             rValSaldoAnt := cdsSaldoAnt.FieldByName('SALDOANT').AsFloat;
             if (CmpRptCm.ParamValues[6].AsString <> '') and (FieldByName('FLGMONETARIA').AsString = 'S') then
             begin
               sDataRef := sDataIni;
               rCotacaoAtu := TestaCotacaoMoeda(CmpRptCm.ParamValues[6].AsInteger, sDataRef,'N');
               if rCotacaoAtu <> 0 then
                  rValSaldoAnt := rValSaldoAnt / rCotacaoAtu
               else
                  rValSaldoAnt := 0;
             end;
              cdsSaldoAnt.Next;
           end;
// -----------------------------------------------------------------------------
         { Saldo da Movimentação }
           iExercicio       := CmpRptCm.ParamValues[0].AsInteger - 1;
           PreencheParametrosComposicao(cdsMovimentacao,  'M',cdsDTDemonstrativo.FieldByName('DEMNATUREZA').AsString,
                                        sConta, sCCusto1, sCCusto2,
                                        iPessoa, iExercicio, iPeriodoIni, iPeriodoFim,
                                        iUnidNegoc1, iUnidNegoc2, iSubConta);
           cdsMovimentacao.First;
           rValDeb := cdsMovimentacao.FieldByName('DEB').AsFloat;
           rValCre := cdsMovimentacao.FieldByName('CRE').AsFloat;
           if (CmpRptCm.ParamValues[6].AsString <> '') and (FieldByName('FLGMONETARIA').AsString = 'S') then
           begin
             rCotacaoAtu := TestaCotacaoMoeda(CmpRptCm.ParamValues[6].AsInteger, sDataIni,'N');
             if rCotacaoAtu <> 0 then
             begin
               rValDeb := rValDeb / rCotacaoAtu;
               rValCre := rValCre / rCotacaoAtu;
             end
             else
             begin
                rValDeb := 0;
                rValCre := 0;
             end;
           end;
// -----------------------------------------------------------------------------
         { Vai para o próximo elemento da Composição }
           cdsCompConta.Next;
         end;
         Edit;
         FieldByName('DEB').AsFloat        := rValDeb;
         FieldByName('CRE').AsFloat        := rValCre;
         FieldByName('SALDO').AsFloat      := rValSaldo;
         FieldByName('SALDOANT').AsFloat   := rValSaldoAnt;

         FieldByName('DEBSN').AsFloat      := Abs(rValDeb);
         FieldByName('CRESN').AsFloat      := Abs(rValCre);
         FieldByName('SALDOSN').AsFloat    := Abs(rValSaldo);
         FieldByName('SALDOANTSN').AsFloat := Abs(rValSaldoAnt);
         if rValSaldoAnt < 0 then
            FieldByName('SALDOANTDEBCRE').asString := 'C'
         else
           FieldByName('SALDOANTDEBCRE').asString := 'D';

         if rValSaldo < 0 then
            FieldByName('SALDODEBCRE').asString := 'C'
         else
           FieldByName('SALDODEBCRE').asString := 'D';

         FieldByName('CALCU').AsString := 'S';
         Post;
       end;
       Next;
     end;
// -----------------------------------------------------------------------------
  { Pega a Composição do Elemento (do Tipo Somatório) }
     x := 1;
     while x = 1 do
     begin
       bEntrou:=False;
       cds.First;
       bmSavePlace := GetBookmark;
       while not EOF do
       begin
         if FieldByName('CALCU').AsString <> 'S' then
         begin
           bEntrou      := True;
           bCalc        := True;
           rValDeb      := 0;
           rValCre      := 0;
           rValSaldoAnt := 0;
           rValSaldo    := 0;
// -----------------------------------------------------------------------------
           cspCompSomatorio.Prepare;
           cspCompSomatorio.ParamByName('IELEMDEMONSTRAT').asInteger := FieldByName('IDELEMDEMONSTRAT').asInteger;
           cspCompSomatorio.Open;
        // Salvar Ponteiro
           bmSavePlace := GetBookmark;
           while not cdsCompSomatorio.EOF do
           begin
             cds.First;
          // Colocar filtro - falar com Igor
             while not EOF do
             begin
               if cdsCompSomatorio.FieldByName('ELEMENTODEM').AsInteger = FieldByName('IDELEMDEMONSTRAT').AsInteger then
               begin
              // Verificaçao do tipo de operação para cálculo da fórmula
                 sOper := cdsCompSomatorio.FieldByName('FLGOPERACAO').asString;
              // Verificação da condicional
                 if cdsCompSomatorio.FieldByName('ELECONDICAO').isNull then
                 begin
                    sCond := '';
                     rValorCond := 0;
                 end
                 else
                 begin
                   sCond := cdsCompSomatorio.FieldByName('ELECONDICAO').asString;
                    rValorCond := cdsCompSomatorio.FieldByName('ELEVALORCOND').asFloat;
                 end;
              // Faz o Cálculo do Somatório na operação e na Condicional desejadas
                 if FieldByName('CALCU').AsString = 'S' then
                 begin
                   rValDeb      := FazFormula(rValDeb, FieldByName('DEB').AsFloat, sOper, sCond, rValorCond);
                   rValCre      := FazFormula(rValCre, FieldByName('CRE').AsFloat, sOper, sCond, rValorCond);
                   rValSaldo    := FazFormula(rValSaldo, FieldByName('SALDO').AsFloat, sOper, sCond, rValorCond);
                   rValSaldoAnt := FazFormula(rValSaldoAnt, FieldByName('SALDOANT').AsFloat, sOper, sCond, rValorCond);
                 end
                 else
                 begin
                   bCalc:=False;
                   Break;
                 end;
               end;
               Next;
             end;
             cdsCompSomatorio.Next;
           end;
// -----------------------------------------------------------------------------
        // Ponterar Query
           GotoBookmark(bmSavePlace);
           if bCalc then
           begin
             Edit;
             FieldByName('DEB').AsFloat := rValDeb;
             FieldByName('CRE').AsFloat := rValCre;
             FieldByName('SALDO').AsFloat := rValSaldo;
             FieldByName('SALDOANT').AsFloat := rValSaldoAnt;
             FieldByName('DEBSN').AsFloat := Abs(rValDeb);
             FieldByName('CRESN').AsFloat := Abs(rValCre);
             FieldByName('SALDOSN').AsFloat := Abs(rValSaldo);
             FieldByName('SALDOANTSN').AsFloat := Abs(rValSaldoAnt);
             if rValSaldoAnt < 0 then
                FieldByName('SALDOANTDEBCRE').asString := 'C'
             else
                FieldByName('SALDOANTDEBCRE').asString := 'D';
             if rValSaldo < 0 then
                  FieldByName('SALDODEBCRE').asString := 'C'
             else
                  FieldByName('SALDODEBCRE').asString := 'D';
             FieldByName('CALCU').AsString    := 'S';
             Post;
           end;
         end;
         Next;
       end;
       FreeBookmark(bmSavePlace);
       if not bEntrou then Break;
     end;
    screen.cursor := crDefault;
   end;
end;

procedure TrptDemonstrativoModelo6.CmpRptCMBeforeExecute(
  var CanExecute: Boolean);
var sSQL : TStringList;
begin
  inherited;
  sSQL := TStringList.Create;
  with sSQL do
  begin
    Clear;
    Append('SELECT DISTINCT'                    );
    Append('   PEREXERCICIO'                    );
    Append('FROM'                               );
    Append('   PERIODO'                         );
    Append('WHERE'                              );
    Append('   IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa));
    Append('ORDER BY'                           );
    Append('   PEREXERCICIO'                    );
  end;
  { Exercício }
  // -----------------------------------------------------------------
     CmpRptCm.ParamValues[0].LookupSettings.SQL.Assign(sSQL);

  with sSQL do
  begin
    Clear;
    Append('SELECT'                               );
    Append('   UNIDNEGOC, NOME'                   );
    Append('FROM'                                 );
    Append('   UNIDNEGOCIO'                       );
    Append('WHERE'                                );
    Append('   IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa));
    Append('ORDER BY'                             );
    Append('NOME'                                 );
  end;
  { Ativ. Projeto }
// -----------------------------------------------------------------
   CmpRptCm.ParamValues[5].LookupSettings.SQL.Assign(sSQL);

  with sSQL do
  begin
    Clear;
    Append('SELECT DISTINCT PEREXERCICIO, ');
    Append('    (PEREXERCICIO || ' + QuotedStr(' - ')  + ' || PERNOME) AS PEREXERCNOME, ');
    Append('   PERNUMERO,');
    Append('   PERNOME || ''/'' || PEREXERCICIO AS DESCRICAO');
    Append('FROM');
    Append('   PERIODO');
    Append('WHERE');
    Append('   IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa));
    Append('ORDER BY PERNUMERO');
  end;
  { Período Inicial e Período Final }
  // -----------------------------------------------------------------
     CmpRptCm.ParamValues[1].LookupSettings.SQL.Assign(sSQL);
     CmpRptCm.ParamValues[2].LookupSettings.SQL.Assign(sSQL);

  // -----------------------------------------------------------------
  with sSQL do
  begin
    Clear;
    Append('SELECT');
    Append('   IDDEMONSTRATIVO, IDPESSOA, DEMDESCDEMONSTRAT,DEMNATUREZA');
    Append('FROM');
    Append('   DEMONSTRATIVO');
    Append('WHERE');
    Append('   IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa));
    Append('ORDER BY');
    Append('   DEMDESCDEMONSTRAT');
  end;
 // -----------------------------------------------------------------
    CmpRptCm.ParamValues[3].LookupSettings.SQL.Assign(sSQL);
 // -----------------------------------------------------------------
end;


procedure TrptDemonstrativoModelo6.PreencheParametrosComposicao(cdsTemp : TClientDataSet;
                                                                sTipoQuery, sNatureza, sConta, sCCusto1, sCCusto2: string; iPessoa : Double; iExercicio, iPeriodoIni, iPeriodoFim, iUnidNegoc1, iUnidNegoc2, iSubConta: integer);

var sSQL : TStringList;
begin
   sSQL := TStringList.Create;
   Try
     with sSQL do
     begin
      //Concatena o Cabeçalho das Querys
       case sTipoQuery[1] of
        'S':
          begin
            Clear;
            if sNatureza = 'C' then begin
               Add('SELECT SUM(DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR) -                  ');
               Add('           DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)) AS SALDO, ');
               Add('       SUM(DECODE(S.PLSORCADOCREDITO, NULL, 0, S.PLSORCADOCREDITO) -            ');
               Add('           DECODE(S.PLSORCADODEBITO, NULL, 0, S.PLSORCADODEBITO)) AS SALDOORC,  ');
            end
            else
            begin
               Add('SELECT SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) -          ');
               Add('           DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDO,         ');
               Add('       SUM(DECODE(S.PLSORCADODEBITO, NULL, 0, S.PLSORCADODEBITO) -              ');
               Add('           DECODE(S.PLSORCADOCREDITO, NULL, 0, S.PLSORCADOCREDITO)) AS SALDOORC,');
            end;
            Add('       S.PERNUMERO, P.PERDATFIM                                                 ');
            Add('FROM                                                                            ');
            Add('   PLANOSALDO S, PERIODO P                                                      ');
            Add('WHERE                                                                           ');
            Add('   (S.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) + ')  AND                                                  ');
            Add('   (S.PEREXERCICIO = ' + CmpRptCm.ParamValues[0].AsString + ') AND                          ');
            Add('   ((S.PERNUMERO  <= ' + CmpRptCm.ParamValues[1].AsString + ') OR (S.PERNUMERO IS NULL)) AND');
          end; { 'S'}
        'A':
          begin
            Clear;
            if sNatureza = 'C' then begin
               Add('SELECT SUM(DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR) -                  ');
               Add('           DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)) AS SALDOANT');
            end
            else
            begin
               Add('SELECT SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) -       ');
               Add('           DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDOANT    ');
            end;
            Add('FROM                                                                            ');
            Add('   PLANOSALDO S                                                                 ');
            Add('WHERE                                                                           ');
            Add('   (S.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND                    ');
            Add('   (S.PEREXERCICIO = ' + CmpRptCm.ParamValues[0].AsString + ') AND              ');
            Add('   (S.PERNUMERO IS NULL) AND                                                    ');
          end;
        'M':
          begin
            Clear;
            Add('SELECT                                                                          ');
            Add('   SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)) AS DEB,       ');
            Add('   SUM(DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS CRE,               ');
            Add('   SUM(DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR) -                      ');
            Add('       DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)) AS MOV        ');
            Add('FROM                                                                            ');
            Add('   PLANOSALDO S                                                                 ');
            Add('WHERE                                                                           ');
            Add('   (S.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND                    ');
            Add('   (S.PEREXERCICIO = ' + CmpRptCm.ParamValues[0].AsString + ') AND              ');
            Add('   (S.PERNUMERO BETWEEN ' + CmpRptCm.ParamValues[1].AsString + ' AND ' + CmpRptCm.ParamValues[2].AsString + ') AND');
          end;
       end;
{ ------------------------------------------------------------------------------
  Concatena as condições variáveis
  ------------------------------------------------------------------------------ }
       if sCCusto1 <> '' then
       begin
         Add('(S.CODCENTROCUSTO LIKE ' + QuotedStr(trim(sCCusto1)+'%') + ') AND  ' );
         Add('(S.IDEMPRESA = ' + FloatToStr(iPessoa) +  ') AND');
       end;
       if sCCusto2 <> '' then
       begin
         Add('(S.CODCENTROCUSTO LIKE ' + QuotedStr(trim(sCCusto2)+'%') + ') AND  ' );
         Add('(S.IDEMPRESA =' + FloatToStr(iPessoa) +  ') AND' );
       end;
       if iUnidNegoc1 <> 0 then
          Add('(S.UNIDNEGOC = ' + IntToStr(iUnidNegoc1) +  ') AND');
       if iUnidNegoc2 <> 0 then
          Add('(S.UNIDNEGOC =' + IntToStr(iUnidNegoc2) +  ') AND');
       if iSubConta <>   0 then
          Add('(S.CODSUBCONTA = ' + IntToStr(iSubConta) + ') AND');
{ ------------------------------------------------------------------------------
  Concatena o final da TString
  ------------------------------------------------------------------------------ }
       case sTipoQuery[1] of
         'S':
          begin
            Add('   (S.PLACONTA = ' + QuotedStr(sConta) + ') AND                                  ');
            Add('   (P.PERNUMERO(+) = S.PERNUMERO) AND                                           ');
            Add('   (P.PEREXERCICIO(+) = S.PEREXERCICIO) AND                                     ');
            Add('   (P.IDPESSOA(+) = S.IDPESSOA)                                                 ');
            Add('GROUP BY                                                                        ');
            Add('   S.PERNUMERO, P.PERDATFIM                                                     ');
          end;
         'A': Add('   (S.PLACONTA = ' + QuotedStr(sConta) + ')                                    ');
         'M': Add('   (S.PLACONTA = ' + QuotedStr(sConta) + ')                                    ');
       end;

       CdsTemp.Data := Padroes.GetDataPacket(GetText);
     end; { WITH do sSQL }
   finally
     sSQL.Free;
   end;
end;


function TrptDemonstrativoModelo6.FazFormula(rValor1, rValor2: double;
  sTipo, sCondicao: string; rValor3: double): double;
begin
   case sTipo[1] of
      'S' : result := rValor1 + rValor2;
      'U' : result := rValor1 - rValor2;
      'M' : result := rValor1 * rValor2;
      'D' : if rValor2 <> 0 then
               result := rValor1 / rValor2
            else
               result := 0;
      'P' : if rValor2 <> 0 then
               result := (rValor1 / rValor2) * 100
            else
               result := 0;
      else result := 0;
   end;

   if sCondicao <> '' then begin
      if sCondicao = '>=' then
         if not (result >= rValor3) then result := 0;
      if sCondicao = '<=' then
         if not (result <= rValor3) then result := 0;
      if sCondicao = '>' then
         if not (result > rValor3) then result := 0;
      if sCondicao = '<' then
         if not (result < rValor3) then result := 0;
      if sCondicao = '=' then
         if not (result = rValor3) then result := 0;
      if sCondicao = '<>' then
         if not (result <> rValor3) then result := 0;
   end;
end;

procedure TrptDemonstrativoModelo6.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
  case Index of
      0 : sExercicio       := TPainelControles(Sender).CtrlLookup.Text;
      1 : sPeriodoIni      := TPainelControles(Sender).CtrlLookup.Text;
      2 : sPeriodoFim      := TPainelControles(Sender).CtrlLookup.Text;
      3 : sDemonstrativo   := TPainelControles(Sender).CtrlLookup.Text;
      4 : sCCustoDescricao := TPainelControles(Sender).CtrlLookup.Text;
      5 : sAtividade       := TPainelControles(Sender).CtrlLookup.Text;
      6 : sMoeda           := TPainelControles(Sender).CtrlLookup.Text;
   end;

   If Trim(sExercicio) = '' Then sExercicio := '0';   
end;

procedure TrptDemonstrativoModelo6.ppHeaderBand20BeforePrint(Sender: TObject);
begin
  inherited;
   if bIngles then begin
      txtSaldoAnterior.caption := 'Last Balance';
      txtDebito.caption        := 'Debit';
      txtCredito.caption       := 'Credit';
      txtSaldo.caption         := 'Balance';
   end else begin
      txtSaldoAnterior.caption := 'Saldo Anterior';
      txtDebito.caption        := 'Débito';
      txtCredito.caption       := 'Crédito';
      txtSaldo.caption         := 'Saldo Atual';
   end;

   if sLinhaAcima = 'N' then begin
      linAcima.Visible := False;
   end else begin
      linAcima.Visible := True;
      if sLinhaAcima = 'V' then begin
         linAcima.Width := 97367;
         linAcima.Left  := 97102;
      end else begin
         linAcima.Left  := 529;
         if sLinhaAcima = 'T' then begin
            linAcima.Width := 95250;
         end else begin
            linAcima.Width := 194469;
         end;
      end;
   end;
   //
   if sLinhaAbaixo = 'N' then begin
      linAbaixo.Visible := False;
   end else begin
      linAbaixo.Visible := True;
      if sLinhaAbaixo = 'V' then begin
         linAbaixo.Width := 97367;
         linAbaixo.Left  := 97102;
      end else begin
         linAbaixo.Left  := 529;
         if sLinhaAbaixo = 'T' then begin
            linAbaixo.Width := 95250;
         end else begin
            linAbaixo.Width := 194469;
         end;
      end;
   end;
end;

procedure TrptDemonstrativoModelo6.bndDetDemo6BeforePrint(Sender: TObject);
var sFormatoPos, sFormatoNeg : string;
begin
  inherited;
   // imprime as contas indentadas
   dbtxtNomeDemo6.left := (4000 * StrToInt(cds.FieldByName('FLGINDENTACAO').asString));

// EspecificaParametros(qryDemonstrativo6, ,  bndDetDemo6);
   EspecificaParametros(cds, bndDetDemo6);

   // Imprime as linhas separadoras de acordo com o tipo
   linDemo6.Visible   := False;
   linDemo6.Height    := 1852 ;
   bndDetDemo6.Height := 4600;
   //

   if cds.FieldByName('FLGDECIMAIS').asString = 'S' then begin
      sFormatoPos := '#,0.00';
      if cds.FieldByName('FLGTIPONEGATIVO').asString = 'M' then begin
         sFormatoNeg := '-#,0.00';
      end else begin
         sFormatoNeg := '(#,0.00)';
      end;
   end else begin
      sFormatoPos := '#,0';
      if cds.FieldByName('FLGTIPONEGATIVO').asString = 'M' then begin
         sFormatoNeg := '-#,0';
      end else begin
         sFormatoNeg := '(#,0)';
      end;
   end;

   dbtxtSaldoAntDemo6.DisplayFormat := sFormatoPos + ';' + sFormatoNeg;
   dbtxtSaldoDemo6.DisplayFormat    := sFormatoPos + ';' + sFormatoNeg;
   dbtxtDebDemo6.DisplayFormat      := sFormatoPos + ';' + sFormatoNeg;
   dbtxtCreDemo6.DisplayFormat      := sFormatoPos + ';' + sFormatoNeg;

   if cds.FieldByName('FLGTIPOLINHA').asString = 'X' then begin
      bndDetDemo6.visible := false;
   end else begin
      bndDetDemo6.visible := true;
   end;

   if cds.FieldByName('FLGTIPOLINHA').asString = 'N' then begin
      bndDetDemo6.Height := 4600;
   end;

   if cds.FieldByName('FLGTIPOLINHA').asString = 'E' then begin
      bndDetDemo6.Height := 7408;
   end;

   if cds.FieldByName('FLGTIPOLINHA').asString = 'F' then begin
      bndDetDemo6.Height := 7408;
      linDemo6.Visible   := True;
      linDemo6.Style     := lsSingle;
      linDemo6.Weight    := 1;
   end;

   if cds.FieldByName('FLGTIPOLINHA').asString = 'D' then begin
      bndDetDemo6.Height := 7408;
      linDemo6.Visible   := True;
      linDemo6.Style     := lsDouble;
      linDemo6.Weight    := 1;
   end;

   if cds.FieldByName('FLGTIPOLINHA').asString = 'G' then begin
      bndDetDemo6.Height := 7408;
      linDemo6.Visible   := True;
      linDemo6.Style     := lsSingle;
      linDemo6.Weight    := 2;
   end;

   if linDemo6.Visible then begin
      if copy(cds.FieldByName('FLGTRACO').asString,2,1) = 'A' then begin
         linDemo6.Top := 265 ;
      end else begin
         linDemo6.Top := 4600 ;
      end;

      if copy(cds.FieldByName('FLGTRACO').asString,1,1) = 'V' then begin
         linDemo6.Width := 97367;
         linDemo6.Left  := 97631;
      end else begin
         if copy(cds.FieldByName('FLGTRACO').asString,1,1) = 'T' then begin
            linDemo6.Visible := False;
            if cds.FieldByName('FLGNEGRITO').asString = 'S' then begin
               dbtxtNomeDemo6.Font.Style :=[fsBold,fsUnderline];
            end else begin
               dbtxtNomeDemo6.Font.Style :=[fsUnderline];
            end;
         end else begin
            linDemo6.Left  := 794;
            linDemo6.Width := 194734;
         end;
      end;

   end;
end;

procedure TrptDemonstrativoModelo6.EspecificaParametros(cdsTemp : TClientDataSet; bndDetalheDemo: TppDetailBand);
var x : Integer;
begin
   for x:=0 to rptDemonstrativoModelo6.ComponentCount-1 do begin
      if (rptDemonstrativoModelo6.Components[x] is tppDbText) and (tppDbText(rptDemonstrativoModelo6.Components[x]).Band = bndDetalheDemo) then
      begin
         If tppBdePipeline(tppDbText(rptDemonstrativoModelo6.Components[x]).DataPipeline).DataSource.DataSet.FieldByName(tppDbText(rptDemonstrativoModelo6.Components[x]).DataField).DataType = ftFloat Then
         begin
           tppDbText(rptDemonstrativoModelo6.Components[x]).BlankWhenZero :=False;
           if cdsTemp.FieldByName('ELETIPOELEM').asString = 'T' then tppDbText(rptDemonstrativoModelo6.Components[x]).BlankWhenZero :=True;
         End;
         tppDbText(rptDemonstrativoModelo6.Components[x]).Font.Style    := [];
         if cdsTemp.FieldByName('FLGNEGRITO').asString = 'S' then
            tppDbText(rptDemonstrativoModelo6.Components[x]).Font.Style := [fsBold];
      end;
   end;
end;
procedure TrptDemonstrativoModelo6.CmpRptCMParamControlEnter(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
   if (Index = 1) or (Index = 2) then
   Begin
      If TPainelControles(Sender).CdsDisplay.Active Then TPainelControles(Sender).CdsDisplay.Close;
      TPainelControles(Sender).CdsDisplay.Data := Padroes.GetDataPacket(' SELECT PEREXERCICIO, PERNUMERO, (PEREXERCICIO || ' + QuotedStr(' - ')  + ' || PERNOME) AS PEREXERCNOME, PERNOMEOUTLING, PERDATINI, PERDATFIM ' +
                                                                        ' FROM PERIODO ' +
                                                                        ' WHERE (IDPESSOA = ' + floattostr(crmRptCM.IdEmpresa) + ') '+
                                                                        '   AND (PEREXERCICIO = ' + sExercicio + ') '+
                                                                        ' ORDER BY PEREXERCICIO,PERNUMERO ');
   End;
end;

procedure TrptDemonstrativoModelo6.FormCreate(Sender: TObject);
begin
  inherited;
  bIngles := False;
  iPagIni := 1;
  sDataIni := '';
  sExercicio := '0';
  sPeriodoIni := '0';
  sPeriodoFim := '0';
  sDemonstrativo := '0';
  sCCustoDescricao := '';
  sAtividade := '0';
  sMoeda := '0';
end;

end.
