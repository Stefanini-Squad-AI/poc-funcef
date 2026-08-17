unit rMapaEvolu;
{-------------------------------------------------------------------------------
// 24/05/2007 Passar periodo.
{ Desenvolvedor: Marcus Oliveira
  Data         : 24/05/2007
  Pendência    : 25444
  Descrição    : Corrigido o mês atual que estava vindo errado da planosaldo.
{-------------------------------------------------------------------------------
// Implementações
{ Desenvolvedor: Marcus Oliveira
  Data         : 23/03/2007
  Pendência    : 15355 - alterado o codcentrocusto para codexterno.}
{-------------------------------------------------------------------------------
Autor: Marcus Oliveira
Data : 11/09/06
Pend.: 21041 - Pesquisa por Ano e mês inicial e Ano e mês final num período
máximo de 12 meses

       No Laço While, pega uma conta e no Laço For principal ele pega os meses
       para Cada conta ele pega do mês inicial ao mês final.  Fiz um cálculo 13-X
       para controlar a virada de ano, assim quando chega a zero é o ano seguinte.
       Onde 13 - 12 = 1 Logo é Dezembro.

-------------------------------------------------------------------------------}
{-------------------------------------------------------------------------------
Autor: Andre Tavares - escrito por Alex
Data : 29/10/03
Pend.: 14917 - Inserir o filtro por plano e patro

Corigido a pedido do Alex o saldo das contas por grupo contábil ao invés da
natureza da conta.
Inclui os lables lblPatros e LblPlanos
Sempre será assim para saber o saldo da conta

se Passivo ou Receita
   Saldo = Crédito - Débito
senão
   Saldo = Débito - Crédito
-------------------------------------------------------------------------------}
{-------------------------------------------------------------------------------
Autor: Alex
Data : 30/10/03
Pend.: 15532  Corrigir a fórmula de variação percentual

Solidictado pelo Stenio a pendência está com a REFER ainda

Para calcular o percentual
Percentual = ( Valor Atual - Valor Anterior ) / ABS ( Valor Anterior ) * 100

Para evoluir o valor pelo percentual
SE Valor Anterior < 0
   Valor Atual = Valor Anterior * ( (Percentual*(-1)) / 100 + 1 )
SENÃO
   Valor Atual = Valor Anterior * ( Percentual / 100 + 1 )
-------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCmReport, uCmRptManager, TXComp, CmParamReport, uCmSqlParams, Db,uCtrlRptBalancete,
   DBClient, uCMClientDataSet, ppVar, ppBands, ppStrtch, ppRegion, ppCtrls,
   ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, Wwdatsrc, DBTables,uCtrlContab,uCMfileUtils, TXRB, uCtrlParamIntegra,
  ppModule, daDataModule;

type
   TrptMapaEvolu = class(TFrmCmReport)
      dsMapaEvolu: TwwDataSource;
      pplMapaEvolu: TppBDEPipeline;
      rptMapaEvolu: TppReport;
      ppHeaderBand18: TppHeaderBand;
      LblEmpresa: TppLabel;
      rptMapaEvoluLabel1: TppLabel;
      rptMapaEvoluLabel2: TppLabel;
      rptMapaEvoluLabel3: TppLabel;
    rptMes1: TppLabel;
    rptMes2: TppLabel;
    rptMes3: TppLabel;
    rptMes4: TppLabel;
    rptMes5: TppLabel;
    rptMes6: TppLabel;
    rptMes7: TppLabel;
    rptMes8: TppLabel;
    rptMes9: TppLabel;
    rptMes10: TppLabel;
    rptMes11: TppLabel;
    rptMes12: TppLabel;
      rptMapaEvoluLine2: TppLine;
      rptMapaEvoluLabel18: TppLabel;
      rptMapaEvoluLabel19: TppLabel;
      ppDetailBand13: TppDetailBand;
      ppDBText4: TppDBText;
      rptMapaEvoluDBText1: TppDBText;
      rptMapaEvoluDBText2: TppDBText;
      rptMapaEvoluDBText3: TppDBText;
      rptMapaEvoluLabel16: TppLabel;
      rptMapaEvoluRegion1: TppRegion;
      ppLine45: TppLine;
      rptMapaEvoluDBText7: TppDBText;
      rptMapaEvoluDBText10: TppDBText;
      rptMapaEvoluDBText13: TppDBText;
      rptMapaEvoluDBText16: TppDBText;
      rptMapaEvoluDBText19: TppDBText;
      rptMapaEvoluDBText22: TppDBText;
      rptMapaEvoluDBText25: TppDBText;
      rptMapaEvoluDBText28: TppDBText;
      rptMapaEvoluDBText31: TppDBText;
      rptMapaEvoluDBText34: TppDBText;
      rptMapaEvoluDBText37: TppDBText;
      rptMapaEvoluDBText38: TppDBText;
      rptMapaEvoluDBText39: TppDBText;
      rptMapaEvoluDBText40: TppDBText;
      rptMapaEvoluDBText41: TppDBText;
      rptMapaEvoluDBText42: TppDBText;
      rptMapaEvoluDBText43: TppDBText;
      rptMapaEvoluDBText44: TppDBText;
      rptMapaEvoluDBText45: TppDBText;
      rptMapaEvoluDBText46: TppDBText;
      rptMapaEvoluDBText47: TppDBText;
      rptMapaEvoluDBText48: TppDBText;
      rptMapaEvoluDBText49: TppDBText;
      rptMapaEvoluLabel17: TppLabel;
      rptMapaEvoluDBText4: TppDBText;
      rptMapaEvoluDBText5: TppDBText;
      rptMapaEvoluDBText6: TppDBText;
      rptMapaEvoluDBText8: TppDBText;
      rptMapaEvoluDBText9: TppDBText;
      rptMapaEvoluDBText11: TppDBText;
      rptMapaEvoluDBText12: TppDBText;
      rptMapaEvoluDBText14: TppDBText;
      rptMapaEvoluDBText15: TppDBText;
      rptMapaEvoluDBText17: TppDBText;
      rptMapaEvoluDBText18: TppDBText;
      rptMapaEvoluDBText20: TppDBText;
      rptMapaEvoluDBText21: TppDBText;
      rptMapaEvoluDBText23: TppDBText;
      rptMapaEvoluDBText24: TppDBText;
      rptMapaEvoluDBText26: TppDBText;
      rptMapaEvoluDBText27: TppDBText;
      rptMapaEvoluDBText29: TppDBText;
      rptMapaEvoluDBText30: TppDBText;
      rptMapaEvoluDBText32: TppDBText;
      rptMapaEvoluDBText33: TppDBText;
      rptMapaEvoluDBText35: TppDBText;
      rptMapaEvoluDBText36: TppDBText;
      ppFooterBand18: TppFooterBand;
      lblSistema: TppLabel;
      ppCalc22: TppSystemVariable;
      ppCalc23: TppSystemVariable;
      cdsMapaEvolu: TCMClientDataSet;
      sqlMapaEvolu: TCMSqlParams;
      sqlSaldos: TCMSqlParams;
      cdsSaldos: TCMClientDataSet;
      sqlPeriodoAtu: TCMSqlParams;
      cdsPeriodoAtu: TCMClientDataSet;
      LblPatros: TppLabel;
      LblPlanos: TppLabel;
    RptlblExercicioFim: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    daDataModule1: TdaDataModule;
    ppLine2: TppLine;

      procedure CrmRptCMBeforePrint(Sender: TObject);
      procedure CmpRptCMParamControlExit(Sender: TPainelControles;
        Index: Integer);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
      procedure ppDetailBand13BeforePrint(Sender: TObject);

   private  // Private declarations

      CtrlRptBalancete : TCtrlRptBalancete;

      scCusto, sAtivProj, sMoeda :string;
      CtrlContab       : TCtrlContab;
      iPlano :integer;


   public   // Public declarations

   end;

var
  rptMapaEvolu: TrptMapaEvolu;

implementation
{$R *.DFM}
uses UMensErro, uDatabase, DBaseDados, uSistema, uData, FSM_FxLib, uFuncaoGeral,uModulo;

procedure TrptMapaEvolu.CrmRptCMBeforePrint(Sender: TObject);
var
   sSql, sFieldMes, sAnoMes, rptMeses  : string;
   rCotacaoAtu, rValMes, rValAcu, rValAntA, rValAntM : Double;
   iPerIni, iPerFim, iPerAtu, iAnoIni, iAnoFim, iCalPerIni, iCalPerAtu,iContMes, i,
   iMeses, iAnoAtual, iAnoSeguinte, iAnoTotal, iPerAtuCont, iAnoIniCont: Integer;
   bSair   : Boolean;
   sMesesRelatorio, sMes: array[1..12] of string;

begin
   inherited;

    sMes[1]:= 'Jan';
    sMes[2]:= 'Fev';
    sMes[3]:= 'Mar';
    sMes[4]:= 'Abr';
    sMes[5]:= 'Mai';
    sMes[6]:= 'Jun';
    sMes[7]:= 'Jul';
    sMes[8]:= 'Ago';
    sMes[9]:= 'Set';
    sMes[10]:= 'Out';
    sMes[11]:= 'Nov';
    sMes[12]:= 'Dez';

   try
      try
        if trim(CmpRptCM.ParamValues[10].Asstring) <> '' then
          lblPlanos.Caption := 'Plano Previdenciário: '+ CmpRptCM.ParamValues[10].Asstring
        else
          lblPlanos.Caption := '';

        if trim(CmpRptCM.ParamValues[11].Asstring) <> '' then
          LblPatros.Caption := 'Patrocinadora: '+ CmpRptCM.ParamValues[11].Asstring
        else
          LblPatros.Caption := '';
      except end;

      iPerIni := CmpRptCM.ParamValues[1].AsInteger;
      iPerFim := CmpRptCM.ParamValues[2].AsInteger;
      iAnoIni := CmpRptCM.ParamValues[0].AsInteger;
      iAnoFim := CmpRptCM.ParamValues[12].AsInteger;
      RptlblExercicioFim.Caption  := 'Exercício Final: '+IntToStr(CmpRptCM.ParamValues[2].AsInteger)+'/'+IntToStr(CmpRptCM.ParamValues[12].AsInteger);
      rptMapaEvoluLabel18.Caption := 'Exercício Inicial: '+IntToStr(CmpRptCM.ParamValues[1].AsInteger)+'/'+IntToStr(CmpRptCM.ParamValues[0].AsInteger);
      iPerAtuCont:= 0;
      iAnoIniCont:= 0;

      if iAnoIni = iAnoFim then
      begin
        iMeses:=1;
        for iContMes:= iPerIni to iPerFim do
          begin
            sMesesRelatorio[iMeses] := sMes[iContMes] + '/' + IntToStr(iAnoIni);
            inc(iMeses);
          end;
        end
      else
       //Se forem Anos diferente. O 13 é o seguinte 13 - X = 1, quando for 0 é o ano seguinte, Onde x= 12.
      begin
         iAnoTotal:= (13-iPerIni)+(iPerFim);
         iAnoAtual:=iAnototal-iPerfim+1;
         iAnoseguinte:= iAnoTotal;
         iContMes:=iPerIni;

      for iMeses:=1 to iAnoAtual do
         begin
           sMesesRelatorio[iMeses] := sMes[iContMes] + '/' + IntToStr(iAnoIni);
           inc(iContMes);
         end;

      iContMes:=1;
      for iMeses:=iAnoAtual to iAnoSeguinte do
         begin
           sMesesRelatorio[iMeses] := sMes[iContMes] + '/' + IntToStr(iAnoFim);
           inc(iContMes);
         end;
      end;
          //Preenche os Caption no relatório,
      for iMeses:= high(sMesesRelatorio) downto low(sMesesRelatorio) do
      begin

        case iMeses of
             1:   rptMes1.caption  := sMesesRelatorio[iMeses];
             2:   rptMes2.caption  := sMesesRelatorio[iMeses];
             3:   rptMes3.caption  := sMesesRelatorio[iMeses];
             4:   rptMes4.caption  := sMesesRelatorio[iMeses];
             5:   rptMes5.caption  := sMesesRelatorio[iMeses];
             6:   rptMes6.caption  := sMesesRelatorio[iMeses];
             7:   rptMes7.caption  := sMesesRelatorio[iMeses];
             8:   rptMes8.caption  := sMesesRelatorio[iMeses];
             9:   rptMes9.caption  := sMesesRelatorio[iMeses];
             10:  rptMes10.caption := sMesesRelatorio[iMeses];
             11:  rptMes11.caption := sMesesRelatorio[iMeses];
             12:  rptMes12.caption := sMesesRelatorio[iMeses];
        end;
      end;

      if CmpRptCM.ParamValues[5].AsString = '' then
         rptMapaEvoluLabel19.Caption := 'Centro de Custo: ' + scCusto + '    Ativ.Proj.: ' + sAtivProj
      else
         rptMapaEvoluLabel19.Caption := 'Moeda: '+sMoeda + '   Centro de Custo: ' + scCusto + '    Ativ.Proj.: ' + sAtivProj;

       // pega o plano
       if CtrlContab.SelecionaParametros(CrmRptCM.IdEmpresa) then
          iPlano := CtrlContab.PlanoParam
       else
          iPlano := 0;

       //Faz a query
       with sqlMapaEvolu do
       begin
         Sql.Clear;
         Sql.Add('SELECT                                                                                      ');
         Sql.Add('          PC.PLACONTA, DECODE(PD.PLANOME,NULL,PC.PLANOME,PD.PLANOME) AS PLANOME, PC.PLAGRAU, PC.PLAGRUPO, PC.PLANATUREZA,    ');


         Sql.Add('          (0) AS JANS, (0) AS FEVS, (0) AS MARS, (0) AS ABRS, (0) AS MAIS, (0) AS JUNS,       ');
         Sql.Add('          (0) AS JULS, (0) AS AGOS, (0) AS SEBS, (0) AS OUTS, (0) AS NOVS, (0) AS DEZS,       ');
         Sql.Add('          (0) AS JANM, (0) AS FEVM, (0) AS MARM, (0) AS ABRM, (0) AS MAIM, (0) AS JUNM,       ');
         Sql.Add('          (0) AS JULM, (0) AS AGOM, (0) AS SEBM, (0) AS OUTM, (0) AS NOVM, (0) AS DEZM,       ');
         Sql.Add('          (0) AS JANP, (0) AS FEVP, (0) AS MARP, (0) AS ABRP, (0) AS MAIP, (0) AS JUNP,       ');
         Sql.Add('          (0) AS JULP, (0) AS AGOP, (0) AS SEBP, (0) AS OUTP, (0) AS NOVP, (0) AS DEZP,       ');
         Sql.Add('          (0) AS JANPM, (0) AS FEVPM, (0) AS MARPM, (0) AS ABRPM, (0) AS MAIPM, (0) AS JUNPM, ');
         Sql.Add('          (0) AS JULPM, (0) AS AGOPM, (0) AS SEBPM, (0) AS OUTPM, (0) AS NOVPM, (0) AS DEZPM  ');
         Sql.Add('FROM PLANOCONTA PC,                                       ');

         Sql.Add(CtrlRptBalancete.SelecionaPlanoContaPer(CmpRptCM.ParamValues[1].AsInteger,CmpRptCM.ParamValues[0].AsInteger,CrmRptCM.IdEmpresa)+' PD ');

         Sql.Add('WHERE (PD.PLACONTA(+) = PC.PLACONTA) AND                  ');

         If CmpRptCM.ParamValues[13].AsString <> '' then
            Sql.Add('(PC.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
            [CmpRptCM.ParamValues[13].AsString]), ' ', 18)) + ') AND    ');

         If CmpRptCM.ParamValues[14].AsString <> '' then
         SQL.Add('(PC.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
            [CmpRptCM.ParamValues[14].AsString]), ' ', 18)) + ') AND   ');

         Sql.Add('      (PD.PLANO(+)    = PC.PLANO) AND                     ');
         Sql.Add('      (PC.PLANO       = :PLANO) AND                       ');
         Sql.Add('      (PC.PLAGRAU    <= :PLAGRAU) AND                     ');
         Sql.Add('      (PC.PLAIMPRELATEVOL = ''S'')                        ');
         Sql.Add('ORDER BY PC.PLACONTA                                      ');

         Prepare;
         ParamByName('PLAGRAU').AsInteger := CmpRptCM.ParamValues[6].AsInteger;
         ParamByName('PLANO').asInteger   := iPlano;

         Open;


             if (iPerIni > iPerFim) then
             begin
                iCalPerIni:=13-iPerIni;
                iCalPerAtu:=iCalPerIni+iPerFim;
             end
             else
               iCalPerAtu:=(iPerFim-iPerIni)+1;

               cdsMapaEvolu.First;

               while not(cdsMapaEvolu.EOF) and not(bSair) do
               begin
                  rValAcu := 0;
                  rValMes := 0;

                  iPerAtu:= 1;
                  cdsMapaEvolu.Edit;

               //calculo pra saber quanto falta pro próximo ano.
               iAnoSeguinte:= (13 - CmpRptCM.ParamValues[1].AsInteger);
               iAnoIniCont:= CmpRptCM.ParamValues[0].AsInteger;

                for iPerAtu:=1 to iCalPerAtu do    //Inicio do laço de todos os meses para cada conta
                  begin
                    bSair := False;
                    rValAntA := rValAcu;
                    rValAntM := rValMes;
                    rValMes  := 0;

                    //Se for zero receba os paramentros de ano e mes inicial
                if (iPerAtuCont = 0) then
                   iPerAtuCont:= CmpRptCM.ParamValues[1].AsInteger;

                if (iAnoIniCont = 0) then
                   iAnoIniCont:= CmpRptCM.ParamValues[0].AsInteger;

                if (cdsMapaEvolu.FieldByName('PLAGRUPO').AsString <> 'A') and (cdsMapaEvolu.FieldByName('PLAGRUPO').AsString <> 'P') then
                begin

                   if (cdsMapaEvolu.FieldByName('PLAGRUPO').AsString = 'P') OR
                      (cdsMapaEvolu.FieldByName('PLAGRUPO').AsString = 'R') then
                   begin
                      sSql :=        'SELECT SUM(DECODE(PLSCREDITOCOR,NULL,0,PLSCREDITOCOR) -                    ';
                      sSql := sSql + '           DECODE(PLSDEBITOCORRENTE,NULL,0,PLSDEBITOCORRENTE)) AS SALDO    ';
                   end
                   else
                   begin
                      sSql :=        'SELECT SUM(DECODE(PLSDEBITOCORRENTE,NULL,0,PLSDEBITOCORRENTE) -            ';
                      sSql := sSql + '           DECODE(PLSCREDITOCOR,NULL,0,PLSCREDITOCOR)) AS SALDO            ';
                   end;


                   sSql := sSql + 'FROM PLANOSALDO PS, CENTCUST CC                                                       ';
                   sSql := sSql + 'WHERE (PS.PLACONTA = '''+cdsMapaEvolu.FieldByName('PLACONTA').AsString+''')      ';
                   sSql := sSql + '  AND (PS.IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+')                      ';
                   sSql := sSql + '  AND (PS.PEREXERCICIO = '+IntToStr(CmpRptCM.ParamValues[0].AsInteger)+')     ';


                   sSql := sSql + '  AND (PS.PERNUMERO = ' + IntToStr(iPerAtuCont) + ')  ';

                  if CmpRptCM.ParamValues[4].AsString <> '' then
                   begin
                     sSql := sSql + ' AND (RTRIM(CC.CODEXTERNO) LIKE '''+CmpRptCM.ParamValues[3].AsString+'%'')';
                     sSql := sSql + ' AND (PS.IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+')';
                   end;

                   sSql := sSql + ' AND (PS.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) ';
                   if CmpRptCM.ParamValues[4].AsString <> '' then
                   begin
                     sSql := sSql + ' AND (PS.UNIDNEGOC = '+CmpRptCM.ParamValues[4].AsString+')';
                   end;

                   if CmpRptCM.ParamValues[8].AsString <> '' then
                   begin
                     sSql := sSql + ' AND PS.IDPLANOPREV in (' + CmpRptCM.ParamValues[8].AsString + ')';
                   end;

                   if CmpRptCM.ParamValues[9].AsString <> '' then
                   begin
                     sSql := sSql + ' AND PS.IDPATRO  in (' + CmpRptCM.ParamValues[9].AsString + ')';
                   end;

                   // faz a query de saldo
                   sqlSaldos.SQL.Text := sSql;
                   //inicio - Andre Tavares
                   if not(sqlSaldos.Prepared) then sqlSaldos.Prepare;
                   //fim - Andre Tavares

                   sqlSaldos.Open;

                   If cdsSaldos.IsEmpty then Exit;
                   rValMes := cdsSaldos.FieldByName('SALDO').AsFloat;
                 end;
                if (cdsMapaEvolu.FieldByName('PLAGRUPO').AsString = 'P') OR
                   (cdsMapaEvolu.FieldByName('PLAGRUPO').AsString = 'R')then begin
                   sSql :=        'SELECT SUM(DECODE(PLSCREDITOCOR,NULL,0,PLSCREDITOCOR) -               ';
                   sSql := sSql + '           DECODE(PLSDEBITOCORRENTE,NULL,0,PLSDEBITOCORRENTE)) AS SALDO   ';
                end else begin
                   sSql :=        'SELECT SUM(DECODE(PLSDEBITOCORRENTE,NULL,0,PLSDEBITOCORRENTE) -            ';
                   sSql := sSql + '           DECODE(PLSCREDITOCOR,NULL,0,PLSCREDITOCOR)) AS SALDO       ';
                end;


                sSql := sSql + 'FROM PLANOSALDO PS, CENTCUST CC                                                      ';
                sSql := sSql + 'WHERE (PS.PLACONTA = '''+cdsMapaEvolu.FieldByName('PLACONTA').AsString+''')    ';
                sSql := sSql + '      AND (PS.IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+')                   ';

                // Se for igual a zero é o ano seguinte
                if iAnoSeguinte = 0 then
                   begin
                     inc(iAnoIniCont);
                     iPerAtuCont:=1;
                     iAnoSeguinte:=100; //Isso é pra matar o controle no Ano seguinte
                   end;

                sSql := sSql + '      AND (PS.PEREXERCICIO = '+IntToStr(iAnoIniCont)+')  ';
                sSql := sSql + '      AND ((PS.PERNUMERO  <= '+ IntToStr(iPerAtuCont) +') OR (PERNUMERO IS NULL)) ';

                if CmpRptCM.ParamValues[3].AsString <> '' then
                begin
                   sSql := sSql + ' AND (RTRIM(CC.CODEXTERNO) LIKE '''+CmpRptCM.ParamValues[3].AsString+'%'')';
                   sSql := sSql + ' AND (PS.IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+')';
                end;

                 sSql := sSql + ' AND (PS.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) ';

                if CmpRptCM.ParamValues[4].AsString <> '' then
                begin
                  sSql := sSql + ' AND (PS.UNIDNEGOC = '+CmpRptCM.ParamValues[4].AsString+')';
                end;


                if CmpRptCM.ParamValues[8].AsString <> '' then
                begin
                  sSql := sSql + ' AND PS.IDPLANOPREV in (' + CmpRptCM.ParamValues[8].AsString + ')';
                end;

                if CmpRptCM.ParamValues[9].AsString <> '' then
                begin
                  sSql := sSql + ' AND PS.IDPATRO  in (' + CmpRptCM.ParamValues[9].AsString + ')';
                end;

                sqlSaldos.SQL.Text := sSql;
                //Decrementa o iAnoSeguinte até chegar a zero quando vira o ano.  Logo quando vira o ano é necessário
                //Retornar ao mês de Janeiro, caso não seja virada de ano incrementa o mês normalmente.
                dec(iAnoSeguinte);
                If (iAnoSeguinte = 0) or (iPerAtuCont > 12) then
                   iPerAtuCont := 1
                else
                   inc(iPerAtuCont);

                sqlSaldos.Open;

                if cdsSaldos.IsEmpty then Exit;
                   rValAcu := cdsSaldos.FieldByName('SALDO').AsFloat;


                if (CmpRptCM.ParamValues[5].AsString <> '') then
                begin
                   with sqlPeriodoAtu do
                   begin
                      Prepare;
                      ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
                      ParamByName('PEREXERCICIO').asInteger := CmpRptCM.ParamValues[0].AsInteger;
                      ParamByName('PERNUMERO').asInteger    := iPerAtu;
                      Open;
                   end;
                   rCotacaoAtu := FuncaoGeral.TestaCotacaoMoeda(StrToInt(CmpRptCM.ParamValues[5].AsString),
                                              cdsPeriodoAtu.FieldByName('PERDATFIM').AsString,'N');

                   rValMes := rValMes / rCotacaoAtu;
                   rValAcu := rValAcu / rCotacaoAtu;
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

                cdsMapaEvolu.FieldByName(sFieldMes + 'S').AsFloat := rValAcu;
                cdsMapaEvolu.FieldByName(sFieldMes + 'M').AsFloat := rValMes;

                if (iPerAtu > 1) and (rValAntA <> 0) then
                   cdsMapaEvolu.FieldByName(sFieldMes + 'P').AsFloat := ((rValAcu-rValAntA)/abs(rValAntA)*100)
                else
                   cdsMapaEvolu.FieldByName(sFieldMes + 'P').AsFloat := 0;
                if (iPerAtu > 1) and (rValAntM <> 0) then
                   cdsMapaEvolu.FieldByName(sFieldMes + 'PM').AsFloat := ((rValMes-rValAntM)/abs(rValAntM)*100)
                else
                   cdsMapaEvolu.FieldByName(sFieldMes + 'PM').AsFloat := 0;


             end;

             //O Laço dos Meses termina aqui.  Quando passa desse ponto é uma nova conta. e retorna ao mês inicial
             if not CmpRptCM.ParamValues[7].AsBoolean then
             begin
                if (cdsMapaEvolu.FieldByName('JANS').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('FEVS').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('MARS').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('ABRS').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('MAIS').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('JUNS').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('JULS').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('AGOS').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('SEBS').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('OUTS').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('NOVS').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('DEZS').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('JANM').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('FEVM').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('MARM').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('ABRM').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('MAIM').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('JUNM').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('JULM').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('AGOM').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('SEBM').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('OUTM').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('NOVM').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('DEZM').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('JANP').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('FEVP').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('MARP').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('ABRP').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('MAIP').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('JUNP').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('JULP').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('AGOP').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('SEBP').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('OUTP').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('NOVP').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('DEZP').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('JANPM').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('FEVPM').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('MARPM').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('ABRPM').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('MAIPM').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('JUNPM').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('JULPM').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('AGOPM').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('SEBPM').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('OUTPM').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('NOVPM').AsFloat = 0) and
                   (cdsMapaEvolu.FieldByName('DEZPM').AsFloat = 0) then
                begin
                   cdsMapaEvolu.Next;
                   if cdsMapaEvolu.EOF then
                      bSair := True
                   else
                      cdsMapaEvolu.Prior;

                   cdsMapaEvolu.Delete;
                   iPerAtuCont:=0;

                end
                else
                begin
                   cdsMapaEvolu.Post;
                   cdsMapaEvolu.Next;
                   iPerAtuCont:=0;
                end;
             end
             else
             begin
                cdsMapaEvolu.Post;
                cdsMapaEvolu.Next;
                iPerAtuCont:=0;
             end;
           end;
        // end;
      end;
   except
     On E:Exception Do
     begin
        CMDebugToFile('Erro Relatório Relatório Mapa de Evolução:' + (#13+#10) + E.Message );
     End;
   End;
end;


procedure TrptMapaEvolu.CmpRptCMParamControlExit(Sender: TPainelControles; Index: Integer);
begin
   inherited;
   case Index of
     3: if CmpRptCM.ParamValues[3].AsString <> ''  then
          sCCusto := CmpRptCM.ParamValues[3].AsString + ' - ' + Trim(TPainelControles(Sender).CtrlLookup.Text)
        else scCusto := '<Todos>';

     4: if CmpRptCM.ParamValues[4].AsString <> ''  then
           sAtivProj :=Trim(TPainelControles(Sender).CtrlLookup.Text)
        else sAtivProj := '<Todas>';

     5: if CmpRptCM.ParamValues[5].AsString <> ''  then
        begin
           sMoeda := Trim(TPainelControles(Sender).CtrlLookup.Text);
        end;
   end;
end;



procedure TrptMapaEvolu.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(DtmBaseDados.dbBaseDados,
                        True,
                        Sistema.ConnectionType,
                        Sistema.ConnectionSide,
                        Sistema.AppRemoteServer,
                        True,
                        nil,
                        nil,
                        False
                       );

  CtrlRptBalancete := TCtrlRptBalancete.Create;
  CtrlRptBalancete.Initialize(DtmBaseDados.dbBaseDados,
                              False,
                              Sistema.ConnectionType,
                              Sistema.ConnectionSide,
                              Sistema.AppRemoteServer,
                              True,
                              nil,
                              nil,
                              False
                             );
end;



procedure TrptMapaEvolu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   CtrlContab.Free;
   CtrlRptBalancete.Free;
end;



procedure TrptMapaEvolu.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;

   CmpRptCM.ParamValues[0].LookupSettings.SQL.Text:=
   'SELECT DISTINCT '+
   '   PEREXERCICIO '+
   'FROM '+
   '   PERIODO '+
   'WHERE '+
   '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
   'ORDER BY PEREXERCICIO';

   CmpRptCM.ParamValues[1].LookupSettings.SQL.Text:=
   'SELECT '+
   '    (PEREXERCICIO || ' + QuotedStr(' - ')  + ' || PERNOME) AS PEREXERCNOME, ' +
   '   PERNUMERO, '+
   '   PERNOME, '+
   '   PEREXERCICIO '+
   'FROM '+
   '   PERIODO '+
   'WHERE '+
   '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
   'ORDER BY '+
   '   PEREXERCICIO, '+
   '   PERNUMERO ';

   CmpRptCM.ParamValues[2].LookupSettings.SQL.Text:=
   'SELECT '+
   '    (PEREXERCICIO || ' + QuotedStr(' - ')  + ' || PERNOME) AS PEREXERCNOME, ' +
   '   PERNUMERO, '+
   '   PERNOME, '+
   '   PEREXERCICIO '+
   'FROM '+
   '   PERIODO '+
   'WHERE '+
   '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
   'ORDER BY '+
   '   PEREXERCICIO, '+
   '   PERNUMERO ';

   CmpRptCM.ParamValues[3].LookupSettings.SQL.Text:=
   'SELECT '+
   '   CODCENTROCUSTO, '+
   '   NOME '+
   'FROM '+
   '   CENTCUST '+
   'WHERE '+
   '   (IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
   'ORDER BY NOME';

   CmpRptCM.ParamValues[4].LookupSettings.SQL.Text:=
   'SELECT '+
   '   UNIDNEGOC, '+
   '   NOME, '+
   '   UNECODIGO '+
   'FROM '+
   '   UNIDNEGOCIO '+
   'WHERE '+
   '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
   'ORDER BY NOME';

    //Filtro para conta inicial e final Marcus Oliveira P. 21041 14/09/2006
   CmpRptCM.ParamValues[13].LookupSettings.SQL.Text:=
                                      'SELECT       '+
                                      '   PLACONTA, '+
                                      '   PLANOME   '+
                                      'FROM         '+
                                      '   PLANOCONTA '+
                                      'WHERE         '+
                                      '   (PLANO =   '+ IntToStr(ParamIntegra.Plano) +') '+
                                      'ORDER BY PLACONTA';

   CmpRptCM.ParamValues[14].LookupSettings.SQL.Text:=
                                      'SELECT         '+
                                      '   PLACONTA,   '+
                                      '   PLANOME     '+
                                      'FROM           '+
                                      '   PLANOCONTA  '+
                                      'WHERE          '+
                                      '   (PLANO = '+ IntToStr(ParamIntegra.Plano) +') '+
                                      'ORDER BY PLACONTA';

   CmpRptCM.ParamValues[6].SpinEditSettings.MaxValue := FuncaoGeral.CalcGrauMax(modulo.sMascaraContas);
   CmpRptCM.ParamValues[6].SpinEditSettings.Value    := FuncaoGeral.CalcGrauMax(modulo.sMascaraContas);
end;

procedure TrptMapaEvolu.ppDetailBand13BeforePrint(Sender: TObject);
begin
  inherited;

  if (cdsMapaEvolu.FieldByName('PLAGRUPO').AsString = 'P') or
     (cdsMapaEvolu.FieldByName('PLAGRUPO').AsString = 'A') then
  begin
     rptMapaEvoluRegion1.Visible := false;
     rptMapaEvoluLabel16.Visible := false;
  end
  else
  begin
     rptMapaEvoluRegion1.Visible := true;
     rptMapaEvoluLabel16.Visible := true;
  end;
end;



end.
