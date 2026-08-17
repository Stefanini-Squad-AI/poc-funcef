unit rCAFConsDeprec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, 
  FCmReport, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, uCMfileUtils,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport, uCmSqlParams,
  DBClient, uCMClientDataSet, ppStrtch, ppMemo, IvDictio, IvMulti,
  uCtrlPadroes, uDiasUteis;

type
  TRptCAFConsDeprec = class(TFrmCmReport)
    sqlConsDeprec: TCMSqlParams;
    sqlBens: TCMSqlParams;
    cdsBens: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    cdsParamCaf: TCMClientDataSet;
    sqlAcrescimos: TCMSqlParams;
    cdsAcrescimos: TCMClientDataSet;
    sqlVerUltFec: TCMSqlParams;
    cdsVerUltFec: TCMClientDataSet;
    rpConsDeprec: TppReport;
    ppHeaderBand10: TppHeaderBand;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    rpMovPatGrpLine1: TppLine;
    ppDetailBand10: TppDetailBand;
    rbdbeClasse: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText54: TppDBText;
    ppFooterBand10: TppFooterBand;
    ppLine20: TppLine;
    ppLabel81: TppLabel;
    ppCalc19: TppSystemVariable;
    ppCalc20: TppSystemVariable;
    ppConsDeprec: TppBDEPipeline;
    dsConsDeprec: TwwDataSource;
    ppDBText6: TppDBText;
    ppLabel2: TppLabel;
    sqlReavaliacoes: TCMSqlParams;
    cdsReavaliacoes: TCMClientDataSet;
    cdsConsDeprec: TCMClientDataSet;
    ppLabel7: TppLabel;
    ppLine19: TppLine;
    ppDBText2: TppDBText;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppDBMemo1: TppDBMemo;
    sqlDepAntBens: TCMSqlParams;
    cdsDepAntBens: TCMClientDataSet;
    sqlDepAntReav: TCMSqlParams;
    cdsDepAntReav: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    DiasUteis : TDiasUteis;
    function ProximaDataFechamento(dDataUltDep : TDateTime) : tDateTime;
    function Fator(dDataIniDep, dDataUltDep : tDateTime) : Extended;

  public
    iMoedaOficial : Integer;
    bInvestImob : Boolean;
  end;

var
  RptCAFConsDeprec: TRptCAFConsDeprec;

implementation

{$R *.DFM}

procedure TRptCAFConsDeprec.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   CmpRptCM.ParamValues[0].LookupSettings.SQL.Text := ' SELECT G.CLASSE, G.NOME, G.IDGRUPO '+
                                                      ' FROM GRUPO G, ' +
                                                      '      PLANOGRUPO PG ' +
                                                      ' WHERE PG.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      '   AND G.TIPO = ''A'' ' +
                                                      '   AND PG.IDGRUPO = G.IDGRUPO ' +
                                                      ' ORDER BY G.CLASSE ';
end;

procedure TRptCAFConsDeprec.CrmRptCMBeforePrint(Sender: TObject);
var
   fFator, fTaxa,
   fDepLanc, fValDepLanc    : Extended;
   iFlgDeprec               : Integer;
   dDataUltDep, dDataIniDep : TDateTime;

begin
   DiasUteis := TDiasUteis.Create;
   DiasUteis.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Application.ProcessMessages;
   try
      inherited;
      sqlParamCaf.Prepare;
      sqlParamCaf.ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlParamCaf.Open;
      iMoedaOficial := cdsParamCAF.FieldByName('MOEDAOFICIAL').AsInteger;
      bInvestImob := copy(cdsParamCAF.FieldByName('SISTEMAS').AsString, 4, 1) = '1';
      //----------------------------------------------------------------------------------
      cdsConsDeprec.Close;
      sqlConsDeprec.Open;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[0].AsInteger <> 0 then
      begin
         sqlBens.SQL.Strings[14] := ' AND B.IDGRUPO = ' + IntToStr(CmpRptCM.ParamValues[0].AsInteger);
         sqlReavaliacoes.SQL.Strings[14] := ' AND B.IDGRUPO = ' + IntToStr(CmpRptCM.ParamValues[0].AsInteger);
         sqlAcrescimos.SQL.Strings[14] := ' AND B.IDGRUPO = ' + IntToStr(CmpRptCM.ParamValues[0].AsInteger);
      end else
      begin
         sqlBens.SQL.Strings[14] := ' ';
         sqlReavaliacoes.SQL.Strings[14] := ' ';
         sqlAcrescimos.SQL.Strings[14] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[1].AsInteger = 0 then
      begin
         sqlBens.SQL.Strings[15] := ' AND G.FLGIMOVEL = 0 ';
         sqlReavaliacoes.SQL.Strings[15] := ' AND G.FLGIMOVEL = 0 ';
         sqlAcrescimos.SQL.Strings[15] := ' AND G.FLGIMOVEL = 0 ';
         ppLabel7.Caption := 'IMOBILIZADO';
      end else
      if CmpRptCM.ParamValues[1].AsInteger = 1 then
      begin
         sqlBens.SQL.Strings[15] := ' AND G.FLGIMOVEL = 1 ';
         sqlReavaliacoes.SQL.Strings[15] := ' AND G.FLGIMOVEL = 1 ';
         sqlAcrescimos.SQL.Strings[15] := ' AND G.FLGIMOVEL = 1 ';
         ppLabel7.Caption := 'INVESTIMENTOS IMOBILIÁRIOS';
      end else
      begin
         sqlBens.SQL.Strings[15] := ' ';
         sqlReavaliacoes.SQL.Strings[15] := ' ';
         sqlAcrescimos.SQL.Strings[15] := ' ';
         ppLabel7.Caption := ' ';
      end;
      //----------------------------------------------------------------------------------
      // Filtragem pela qualificação da depreciação
      // 0 - Todos
      // 1 - Não Depreciáveis
      // 2 - Parcialmente Depreciados
      // 3 - Totalmente Depreciados
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[2].AsInteger = 1 then
      begin
         sqlBens.SQL.Strings[16] := ' AND BD.TAXADEP = 0';
         sqlReavaliacoes.SQL.Strings[16] := ' AND RD.TAXADEP = 0';
         sqlAcrescimos.SQL.Strings[16] := ' AND AD.TAXADEP = 0';
      end else
      begin
         sqlBens.SQL.Strings[16] := ' ';
         sqlReavaliacoes.SQL.Strings[16] := ' ';
         sqlAcrescimos.SQL.Strings[16] := ' ';
      end;
      //----------------------------------------------------------------------------------
      sqlBens.Prepare;
      sqlReavaliacoes.Prepare;
      sqlAcrescimos.Prepare;
      case CmpRptCM.ParamValues[2].AsInteger of
         0: begin
               sqlBens.ParamByName('PDEPREC').AsInteger    := 0;
               sqlBens.ParamByName('PNOTDEPREC').AsInteger := 1;
               sqlReavaliacoes.ParamByName('PDEPREC').AsInteger    := 0;
               sqlReavaliacoes.ParamByName('PNOTDEPREC').AsInteger := 1;
               sqlAcrescimos.ParamByName('PDEPREC').AsInteger    := 0;
               sqlAcrescimos.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
         1: begin
               sqlBens.ParamByName('PDEPREC').AsInteger    := 0;
               sqlBens.ParamByName('PNOTDEPREC').AsInteger := 1;
               sqlReavaliacoes.ParamByName('PDEPREC').AsInteger    := 0;
               sqlReavaliacoes.ParamByName('PNOTDEPREC').AsInteger := 1;
               sqlAcrescimos.ParamByName('PDEPREC').AsInteger    := 0;
               sqlAcrescimos.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
         2: begin
               sqlBens.ParamByName('PDEPREC').AsInteger    := 0;
               sqlBens.ParamByName('PNOTDEPREC').AsInteger := 0;
               sqlReavaliacoes.ParamByName('PDEPREC').AsInteger    := 0;
               sqlReavaliacoes.ParamByName('PNOTDEPREC').AsInteger := 0;
               sqlAcrescimos.ParamByName('PDEPREC').AsInteger    := 0;
               sqlAcrescimos.ParamByName('PNOTDEPREC').AsInteger := 0;
            end;
         3: begin
               sqlBens.ParamByName('PDEPREC').AsInteger    := 1;
               sqlBens.ParamByName('PNOTDEPREC').AsInteger := 1;
               sqlReavaliacoes.ParamByName('PDEPREC').AsInteger    := 1;
               sqlReavaliacoes.ParamByName('PNOTDEPREC').AsInteger := 1;
               sqlAcrescimos.ParamByName('PDEPREC').AsInteger    := 1;
               sqlAcrescimos.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
      else  begin
               sqlBens.ParamByName('PDEPREC').AsInteger    := 0;
               sqlBens.ParamByName('PNOTDEPREC').AsInteger := 1;
               sqlReavaliacoes.ParamByName('PDEPREC').AsInteger    := 0;
               sqlReavaliacoes.ParamByName('PNOTDEPREC').AsInteger := 1;
               sqlAcrescimos.ParamByName('PDEPREC').AsInteger    := 0;
               sqlAcrescimos.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
      end;
      //----------------------------------------------------------------------------------
      // Verifica a Tabela BEM
      //----------------------------------------------------------------------------------
      sqlBens.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlBens.ParamByName('MOECODIGO').AsInteger := iMoedaOficial;
      sqlBens.ParamByName('IDTAXADEP').AsInteger := 1;                           // Brasil
      sqlBens.Open;
      //----------------------------------------------------------------------------------
      while not cdsBens.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Captura o Saldo Inicial de Depreciação não gerado pelo CAF
         //-------------------------------------------------------------------------------
         cdsDepAntBens.Close;
         sqlDepAntBens.Prepare;
         sqlDepAntBens.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
         sqlDepAntBens.ParamByName('IDBEM').AsFloat := cdsBens.FieldByName('IDBEM').AsFloat;
         sqlDepAntBens.ParamByName('MOECODIGO').AsInteger := iMoedaOficial;
         sqlDepAntBens.ParamByName('IDTAXADEP').AsInteger := 1;                  // Brasil
         sqlDepAntBens.Open;
         if cdsDepAntBens.IsEmpty then
            fValDepLanc := 0
         else
            fValDepLanc := cdsDepAntBens.FieldByName('DEPLANCINI').AsFloat;
         //-------------------------------------------------------------------------------
         // Cálculo da Depreciação Acumulada Mês a Mês
         //-------------------------------------------------------------------------------
         iFlgDeprec  := 0;
         dDataUltDep := cdsBens.FieldByName('DATAINICIODEP').AsDateTime;
         dDataIniDep := cdsBens.FieldByName('DATAINICIODEP').AsDateTime;
         while (dDataUltDep <= cdsBens.FieldByName('DATAULTDEP').AsDateTime) and (iFlgDeprec = 0) do
         begin
            fFator   := Fator(dDataIniDep, dDataUltDep);
            fTaxa    := ((cdsBens.FieldByName('TAXADEP').AsFloat / 100) * fFator);
            fDepLanc := (fTaxa * (cdsBens.FieldByName('VALORG').AsFloat + cdsBens.FieldByName('CMBEM').AsFloat));
            if abs(fDepLanc) >= 0.01 then
               fDepLanc := strtofloat(FormatFloat('#0.00',((fDepLanc * 100) / 100)));
            //----------------------------------------------------------------------------
            // Ajusta qdo estiver totalmente depreciado
            //----------------------------------------------------------------------------
            if (abs(fValDepLanc + fDepLanc) - abs(cdsBens.FieldByName('VALORG').AsFloat + cdsBens.FieldByName('CMBEM').AsFloat)) > 0 then
            begin
               fDepLanc := (cdsBens.FieldByName('VALORG').AsFloat + cdsBens.FieldByName('CMBEM').AsFloat) - fValDepLanc;
               if abs(fDepLanc) >= 0.01 then
                  fDepLanc := strtofloat(FormatFloat('#0.00',((fDepLanc * 100) / 100)));
               iFlgDeprec := 1;
            end;
            //----------------------------------------------------------------------------
            // Acumulado
            //----------------------------------------------------------------------------
            fValDepLanc := fValDepLanc + fDepLanc;
            //----------------------------------------------------------------------------
            // Acumulado
            //----------------------------------------------------------------------------
            dDataIniDep := dDataUltDep;
            dDataUltDep := ProximaDataFechamento(dDataUltDep);
         end;
         //-------------------------------------------------------------------------------
         // Registra no relatório
         //-------------------------------------------------------------------------------
         if abs(fValDepLanc - (cdsBens.FieldByName('DEPLANC').AsFloat + cdsBens.FieldByName('CMDEP').AsFloat)) >= 0.01 then
         begin
            cdsConsDeprec.Append;
            cdsConsDeprec.FieldByName('TIPO').AsString := ' ';
            cdsConsDeprec.FieldByName('PLACA').AsFloat := cdsBens.FieldByName('PLACA').AsFloat;
            cdsConsDeprec.FieldByName('DESBEM').AsString := cdsBens.FieldByName('DESBEM').AsString;
            cdsConsDeprec.FieldByName('DATAINIDEP').AsDateTime := cdsBens.FieldByName('DATAINICIODEP').AsDateTime;
            cdsConsDeprec.FieldByName('DATAULTDEP').AsDateTime := cdsBens.FieldByName('DATAULTDEP').AsDateTime;
            cdsConsDeprec.FieldByName('TAXADEP').AsFloat := cdsBens.FieldByName('TAXADEP').AsFloat;
            cdsConsDeprec.FieldByName('VALCUSTO').AsCurrency := cdsBens.FieldByName('VALORG').AsFloat + cdsBens.FieldByName('CMBEM').AsFloat;
            cdsConsDeprec.FieldByName('VALDEPREC').AsCurrency := cdsBens.FieldByName('DEPLANC').AsFloat + cdsBens.FieldByName('CMDEP').AsFloat;
            cdsConsDeprec.FieldByName('VALDEPCALC').AsCurrency := fValDepLanc;
            cdsConsDeprec.Post;
         end;
         //-------------------------------------------------------------------------------
         // Processar as reavaliações do bem
         //-------------------------------------------------------------------------------
         cdsReavaliacoes.Close;
         sqlReavaliacoes.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
         sqlReavaliacoes.ParamByName('IDBEM').AsFloat := cdsBens.FieldByName('IDBEM').AsFloat;
         sqlReavaliacoes.ParamByName('MOECODIGO').AsInteger := iMoedaOficial;
         sqlReavaliacoes.ParamByName('IDTAXADEP').AsInteger := 1;                // Brasil
         sqlReavaliacoes.Open;
         while not cdsReavaliacoes.EOF do
         begin
            //----------------------------------------------------------------------------
            // Captura o Saldo Inicial de Depreciação não gerado pelo CAF
            //----------------------------------------------------------------------------
            cdsDepAntReav.Close;
            sqlDepAntReav.Prepare;
            sqlDepAntReav.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
            sqlDepAntReav.ParamByName('IDBEM').AsFloat := cdsBens.FieldByName('IDBEM').AsFloat;
            sqlDepAntReav.ParamByName('IDREAVALACRESC').AsFloat := cdsBens.FieldByName('IDREAVALIACAO').AsFloat;
            sqlDepAntReav.ParamByName('MOECODIGO').AsInteger := iMoedaOficial;
            sqlDepAntReav.ParamByName('IDTAXADEP').AsInteger := 1;               // Brasil
            sqlDepAntReav.Open;
            if cdsDepAntReav.IsEmpty then
               fValDepLanc := 0
            else
               fValDepLanc := cdsDepAntBens.FieldByName('DEPLANCINI').AsFloat;
            //----------------------------------------------------------------------------
            // Cálculo da Depreciação Acumulada Mês a Mês
            //----------------------------------------------------------------------------
            iFlgDeprec  := 0;
            dDataUltDep := cdsReavaliacoes.FieldByName('DATAREAVALIACAO').AsDateTime;
            dDataIniDep := cdsReavaliacoes.FieldByName('DATAREAVALIACAO').AsDateTime;
            while (dDataUltDep <= cdsReavaliacoes.FieldByName('DATAULTDEP').AsDateTime) and (iFlgDeprec = 0) do
            begin
               fFator   := Fator(dDataIniDep, dDataUltDep);
               fTaxa    := ((cdsReavaliacoes.FieldByName('TAXADEP').AsFloat / 100) * fFator);
               fDepLanc := (fTaxa * (cdsReavaliacoes.FieldByName('VALORG').AsFloat + cdsReavaliacoes.FieldByName('CMBEM').AsFloat));
               if abs(fDepLanc) >= 0.01 then
                  fDepLanc := strtofloat(FormatFloat('#0.00',((fDepLanc * 100) / 100)));
               //-------------------------------------------------------------------------
               // Ajusta qdo estiver totalmente depreciado
               //-------------------------------------------------------------------------
               if (abs(fValDepLanc + fDepLanc) - abs(cdsReavaliacoes.FieldByName('VALORG').AsFloat + cdsReavaliacoes.FieldByName('CMBEM').AsFloat)) > 0 then
               begin
                  fDepLanc := (cdsReavaliacoes.FieldByName('VALORG').AsFloat + cdsReavaliacoes.FieldByName('CMBEM').AsFloat) - fValDepLanc;
                  if abs(fDepLanc) >= 0.01 then
                     fDepLanc := strtofloat(FormatFloat('#0.00',((fDepLanc * 100) / 100)));
                  iFlgDeprec := 1;
               end;
               //-------------------------------------------------------------------------
               // Acumulado
               //-------------------------------------------------------------------------
               fValDepLanc := fValDepLanc + fDepLanc;
               //-------------------------------------------------------------------------
               // Proximo
               //-------------------------------------------------------------------------
               dDataIniDep := dDataUltDep;
               dDataUltDep := ProximaDataFechamento(dDataUltDep);
            end;
            //----------------------------------------------------------------------------
            // Registra no relatório
            //----------------------------------------------------------------------------
            if abs(fValDepLanc - (cdsReavaliacoes.FieldByName('DEPLANC').AsFloat + cdsReavaliacoes.FieldByName('CMDEP').AsFloat)) >= 0.01 then
            begin
               cdsConsDeprec.Append;
               cdsConsDeprec.FieldByName('TIPO').AsString          := 'Reavaliação';
               cdsConsDeprec.FieldByName('PLACA').AsFloat          := cdsReavaliacoes.FieldByName('PLACA').AsFloat;
               cdsConsDeprec.FieldByName('DESBEM').AsString        := cdsReavaliacoes.FieldByName('DESBEM').AsString;
               cdsConsDeprec.FieldByName('DATAINIDEP').AsDateTime  := cdsReavaliacoes.FieldByName('DATAREAVALIACAO').AsDateTime;
               cdsConsDeprec.FieldByName('DATAULTDEP').AsDateTime  := cdsReavaliacoes.FieldByName('DATAULTDEP').AsDateTime;
               cdsConsDeprec.FieldByName('TAXADEP').AsFloat        := cdsReavaliacoes.FieldByName('TAXADEP').AsFloat;
               cdsConsDeprec.FieldByName('VALCUSTO').AsCurrency    := cdsReavaliacoes.FieldByName('VALORG').AsFloat + cdsReavaliacoes.FieldByName('CMBEM').AsFloat;
               cdsConsDeprec.FieldByName('VALDEPREC').AsCurrency   := cdsReavaliacoes.FieldByName('DEPLANC').AsFloat + cdsReavaliacoes.FieldByName('CMDEP').AsFloat;
               cdsConsDeprec.FieldByName('VALDEPCALC').AsCurrency  := fValDepLanc;
               cdsConsDeprec.Post;
            end;
            //----------------------------------------------------------------------------
            cdsReavaliacoes.Next;
         end;
         //-------------------------------------------------------------------------------
         // Processar as acréscimos do bem
         //-------------------------------------------------------------------------------
         cdsAcrescimos.Close;
         sqlAcrescimos.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
         sqlAcrescimos.ParamByName('IDBEM').AsFloat := cdsBens.FieldByName('IDBEM').AsFloat;
         sqlAcrescimos.ParamByName('MOECODIGO').AsInteger := iMoedaOficial;
         sqlAcrescimos.ParamByName('IDTAXADEP').AsInteger := 1;                  // Brasil
         sqlAcrescimos.Open;
         while not cdsAcrescimos.EOF do
         begin
            //----------------------------------------------------------------------------
            // Captura o Saldo Inicial de Depreciação não gerado pelo CAF
            //----------------------------------------------------------------------------
            fValDepLanc := 0;
            //----------------------------------------------------------------------------
            // Cálculo da Depreciação Acumulada Mês a Mês
            //----------------------------------------------------------------------------
            iFlgDeprec  := 0;
            dDataUltDep := cdsAcrescimos.FieldByName('DATAACRESCIMO').AsDateTime;
            dDataIniDep := cdsAcrescimos.FieldByName('DATAACRESCIMO').AsDateTime;
            while (dDataUltDep <= cdsAcrescimos.FieldByName('DATAULTDEP').AsDateTime) and (iFlgDeprec = 0) do
            begin
               fFator   := Fator(dDataIniDep, dDataUltDep);
               fTaxa    := ((cdsAcrescimos.FieldByName('TAXADEP').AsFloat / 100) * fFator);
               fDepLanc := (fTaxa * (cdsAcrescimos.FieldByName('VALORG').AsFloat + cdsAcrescimos.FieldByName('CMBEM').AsFloat));
               if abs(fDepLanc) >= 0.01 then
                  fDepLanc := strtofloat(FormatFloat('#0.00',((fDepLanc * 100) / 100)));
               //-------------------------------------------------------------------------
               // Ajusta qdo estiver totalmente depreciado
               //-------------------------------------------------------------------------
               if (abs(fValDepLanc + fDepLanc) - abs(cdsAcrescimos.FieldByName('VALORG').AsFloat + cdsAcrescimos.FieldByName('CMBEM').AsFloat)) > 0 then
               begin
                  fDepLanc := (cdsAcrescimos.FieldByName('VALORG').AsFloat + cdsAcrescimos.FieldByName('CMBEM').AsFloat) - fValDepLanc;
                  if abs(fDepLanc) >= 0.01 then
                     fDepLanc := strtofloat(FormatFloat('#0.00',((fDepLanc * 100) / 100)));
                  iFlgDeprec := 1;
               end;
               //-------------------------------------------------------------------------
               // Acumulado
               //-------------------------------------------------------------------------
               fValDepLanc := fValDepLanc + fDepLanc;
               //-------------------------------------------------------------------------
               // Proximo
               //-------------------------------------------------------------------------
               dDataIniDep := dDataUltDep;
               dDataUltDep := ProximaDataFechamento(dDataUltDep);
            end;
            //----------------------------------------------------------------------------
            // Registra no relatório
            //----------------------------------------------------------------------------
            if abs(fValDepLanc - (cdsAcrescimos.FieldByName('DEPLANC').AsFloat + cdsAcrescimos.FieldByName('CMDEP').AsFloat)) >= 0.01 then
            begin
               cdsConsDeprec.Append;
               cdsConsDeprec.FieldByName('TIPO').AsString          := 'Acréscimo';
               cdsConsDeprec.FieldByName('PLACA').AsFloat          := cdsAcrescimos.FieldByName('PLACA').AsFloat;
               cdsConsDeprec.FieldByName('DESBEM').AsString        := cdsAcrescimos.FieldByName('DESBEM').AsString;
               cdsConsDeprec.FieldByName('DATAINIDEP').AsDateTime  := cdsAcrescimos.FieldByName('DATAACRESCIMO').AsDateTime;
               cdsConsDeprec.FieldByName('DATAULTDEP').AsDateTime  := cdsAcrescimos.FieldByName('DATAULTDEP').AsDateTime;
               cdsConsDeprec.FieldByName('TAXADEP').AsFloat        := cdsAcrescimos.FieldByName('TAXADEP').AsFloat;
               cdsConsDeprec.FieldByName('VALCUSTO').AsCurrency    := cdsAcrescimos.FieldByName('VALORG').AsFloat + cdsAcrescimos.FieldByName('CMBEM').AsFloat;
               cdsConsDeprec.FieldByName('VALDEPREC').AsCurrency   := cdsAcrescimos.FieldByName('DEPLANC').AsFloat + cdsAcrescimos.FieldByName('CMDEP').AsFloat;
               cdsConsDeprec.FieldByName('VALDEPCALC').AsCurrency  := fValDepLanc;
               cdsConsDeprec.Post;
            end;
            //----------------------------------------------------------------------------
            cdsAcrescimos.Next;
         end;
         //-------------------------------------------------------------------------------
         cdsBens.Next;
      end;
      cdsBens.Close;
      DiasUteis.Free;
   except
      On E : Exception do
      begin
         DiasUteis.Free;
         CMDebugToFile('Erro no Relatório CONSISTENCIA DA DEPRECIAÇÃO ACUMULADA!' + #13 + #10 +
                       'Causa : ' + E.Message);
      end;
   end;
end;

function TRptCAFConsDeprec.ProximaDataFechamento(dDataUltDep : TDateTime) : tDateTime;
Var
   iAno, iMes, iDia,
   iAnoFim, iMesFim, iDiaFim : Word;
   dDataUltMov : TDateTime;

begin
   dDataUltMov := dDataUltDep;
   //-------------------------------------------------------------------------------------
   // Calculo Anual
   //-------------------------------------------------------------------------------------
   if cdsParamCAF.FieldByName('FLGTIPOCALC').AsString = 'A' then
   begin
      DecodeDate(dDataUltMov, iAno, iMes, iDia);
      iAnoFim := iAno + 1;
      iMesFim := 12;
      iDiaFim := 31;
   end else
   //-------------------------------------------------------------------------------------
   // Calculo Mensal
   //-------------------------------------------------------------------------------------
   if cdsParamCAF.FieldByName('FLGTIPOCALC').AsString = 'M' then
   begin
      DecodeDate(dDataUltMov + 28, iAno, iMes, iDia);
      DecodeDate(DiasUteis.UltDiaMes(iAno, iMes), iAnoFim, iMesFim, iDiaFim);
   end else
   //-------------------------------------------------------------------------------------
   // Calculo Diário
   //-------------------------------------------------------------------------------------
   if cdsParamCAF.FieldByName('FLGTIPOCALC').AsString = 'D' then
   begin
      DecodeDate(dDataUltMov + 1, iAnoFim, iMesFim, iDiaFim);
   end;
   //-------------------------------------------------------------------------------------
   Result := EncodeDate(iAnoFim, iMesFim, iDiaFim);
end;

function TRptCAFConsDeprec.Fator(dDataIniDep, dDataUltDep : TDateTime) : Extended;
var
   iMesIni,iAnoIni,iDiaIni,
   iMesFim,iAnoFim,iDiaFim,
   iDia,iMes,iAno,
   iNDias, iDayInc            : Word;
   sAnoIni,sAnoFim            : string;
   dDataInit                  : tDate;
   iMesInit,iAnoInit,iDiaInit : Word;
   rTotDia, rTotDiaAno        : Extended;

begin
   if dDataUltDep = dDataIniDep then
      iDayInc := 1
   else
      iDayInc := 0;
   //-------------------------------------------------------------------------------------
   DecodeDate(dDataIniDep, iAnoIni, iMesIni, iDiaIni);
   DecodeDate(dDataUltDep, iAnoFim, iMesFim, iDiaFim);
   //-------------------------------------------------------------------------------------
   //--- Calculo Anual
   //-------------------------------------------------------------------------------------
   if cdsParamCAF.FieldByName('FLGTIPOCALC').AsString = 'A' then
   begin
      if dDataUltDep = dDataIniDep then
      begin
         Result := 0;
      end else
      begin
         sAnoIni    := '01/01/' + inttostr(iAnoIni);
         sAnoFim    := '31/12/' + inttostr(iAnoIni);
         rTotDia    := (dDataUltDep - dDataIniDep) + iDayInc;
         rTotDiaAno := (strtodate(sAnoFim) - strtodate(sAnoIni)) + iDayInc;
         Result     := (rTotDia / rTotDiaAno);
      end;
   end else
   //-------------------------------------------------------------------------------------
   //--- Calculo Mensal
   //-------------------------------------------------------------------------------------
   if cdsParamCAF.FieldByName('FLGTIPOCALC').AsString = 'M' then
   begin
      iNDias := round((dDataUltDep - dDataIniDep)) + iDayInc;
      if dDataUltDep = dDataIniDep then
      begin
         Result := 0;
      end else
      //----------------------------------------------------------------------------------
      begin
         if (iMesIni = iMesFim) and (iDiaIni > 01) then
         begin
            DecodeDate(DiasUteis.UltDiaMes(iAnoFim,iMesFim),iAno,iMes,iDia);
            Result := (1 / 12 / iDia) * iNDias;
         end else
         //-------------------------------------------------------------------------------
         begin
            dDataInit := (dDataUltDep - 31);
            DecodeDate(dDataInit,iAnoInit,iMesInit,iDiaInit);
            DecodeDate(DiasUteis.UltDiaMes(iAnoInit,iMesInit),iAnoInit,iMesInit,iDiaInit);
            dDataInit := EncodeDate(iAnoInit,iMesInit,iDiaInit);
            //----------------------------------------------------------------------------
            if (dDataInit = dDataIniDep) or
               ((iMesIni = iMesFim) and (iDiaIni = 01)) then
               Result := (1 / 12)
            else
               Result := (1 / 12) * (iNDias / 30.4375);
         end;
      end;
   end else
   //-------------------------------------------------------------------------------------
   //--- Calculo Diário
   //-------------------------------------------------------------------------------------
   begin
      if dDataUltDep = dDataIniDep then
      begin
         Result := 0;
      end else
      begin
         iNDias := round(dDataUltDep - dDataIniDep) + iDayInc;
         Result := iNDias / 365.25;
      end;
   end;
end;

procedure TRptCAFConsDeprec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Application.ProcessMessages;
end;

end.
