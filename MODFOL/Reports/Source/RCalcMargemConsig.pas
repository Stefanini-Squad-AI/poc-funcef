unit RCalcMargemConsig;

//**************************************************************************************
//Nº SOL...........: 192084
//Nº KINTANA.......: 1945985
//Data da Alteração: 13/06/2013
//Responsável......: Felipe A. Santos
//Descrição........: Criação do relatório
//**************************************************************************************

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, Db, DBClient,
  wwclient, ppComm, ppRelatv, ppDB, ppDBPipe, uCmSqlParams, ppProd,
  ppClass, ppReport, ppPrnabl, ppCtrls, ppBands, ppCache,
  ppStrtch, ppMemo, ppSubRpt, ppRichTx, ppVar, uCMClientDataSet, ppDBBDE,
  ppModule, raCodMod, DBTables, Wwquery, uCtrlFuncoesRH;

type
  TrptCalcMargemConsig = class(TFrmCmReport)
    rpCalcMC: TppReport;
    ppCabecalho: TppHeaderBand;
    ppDetalhe: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppTituloFundacao: TppLabel;
    ppSubTitulo: TppLabel;
    ppLabel1: TppLabel;
    ppDirCentCust: TppLabel;
    ppCalcMargem: TppLabel;
    pplblEmpregado: TppLabel;
    pplblMes: TppLabel;
    ppNomeFunc: TppLabel;
    ppMes: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppRubrica: TppLabel;
    ppValor: TppLabel;
    ppModulo: TppLabel;
    ppLine3: TppLine;
    ppDataEmissao: TppLabel;
    ppPaginas: TppSystemVariable;
    pplblPagina: TppLabel;
    ppDBCalcMC: TppBDEPipeline;
    dsCalcMC: TDataSource;
    cdsCalcMC: TCMClientDataSet;
    sqlCalcMC: TCMSqlParams;
    raCodeModule2: TraCodeModule;
    ppNomeRubricas: TppDBText;
    ppVlrRubricas: TppDBText;
    ppGroup1: TppGroup;
    ppGrupoBand: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppFundo: TppShape;
    ppGrupo: TppDBText;
    ppVlrTotal: TppDBText;
    sqlRubValores: TCMSqlParams;
    cdsRubValores: TCMClientDataSet;
    ppSummaryBand1: TppSummaryBand;
    ppShape1: TppShape;
    ppMargemFinal: TppLabel;
    ppVlrMargemFinal: TppLabel;
    dbimgLogo: TppDBImage;
    ppImg: TppBDEPipeline;
    ppField1: TppField;
    ppField2: TppField;
    ppField3: TppField;
    ppField4: TppField;
    dsImg: TDataSource;
    cdsImg: TCMClientDataSet;
    sqlImg: TCMSqlParams;
    procedure rpCalcMCBeforePrint(Sender: TObject);
    procedure ppVlrRubricasPrint(Sender: TObject);
    procedure FormatParametros(sParamName, sOldValue: String; var sNewValue: String);
    procedure ppNomeRubricasPrint(Sender: TObject);
  private
    FParametros: TCmParamReport;
    FVlrMargemFinal: double;
    FVlrMargemPre: double;
    FVlrTotalDeducoes: double;
    FVlrTotalDescFacul: double;
    FVlrBaseCalc: double;
    FVlrTotalRemun: double;
    FTemRubSel : array[1 .. 5] of boolean;
    procedure AtribuiRubValores;

  public
    procedure AbrirQueriesRelat(ListaRubricasSel : array of string);

    property Parametros : TCmParamReport read FParametros write FParametros;
    property VlrTotalRemun : double read FVlrTotalRemun write FVlrTotalRemun;
    property VlrTotalDeducoes : double read FVlrTotalDeducoes write FVlrTotalDeducoes;
    property VlrBaseCalc : double read FVlrBaseCalc  write FVlrBaseCalc;
    property VlrMargemPre : double read FVlrMargemPre write FVlrMargemPre;
    property VlrTotalDescFacul : double read FVlrTotalDescFacul write FVlrTotalDescFacul;
    property VlrMargemFinal: double read FVlrMargemFinal write FVlrMargemFinal;
  end;

var
  rptCalcMargemConsig: TrptCalcMargemConsig;

implementation

{$R *.DFM}

procedure TrptCalcMargemConsig.AbrirQueriesRelat(ListaRubricasSel: array of string);
var
   MesSQL : string;

begin
     MesSQL := Parametros.ParamValues[3].AsString + '/' + Parametros.ParamValues[2].AsString;

     // verifica se tem rubricas selecionadas
     if (ListaRubricasSel[0] <> '') then
         FTemRubSel[1] := True
     else
         FTemRubSel[1] := False;
     if (ListaRubricasSel[1] <> '') then
         FTemRubSel[2] := True
     else
         FTemRubSel[2] := False;
     if (ListaRubricasSel[2] <> '') then
         FTemRubSel[5] := True
     else
         FTemRubSel[5] := False;

     // passando os parametros e abrindo as queries
     sqlRubValores.Prepare;
     sqlRubValores.ParamByName('IDPESSOA').AsString := Parametros.ParamValues[4].AsString;
     sqlRubValores.ParamByName('MES').AsString := QuotedStr(MesSQL);
     sqlRubValores.ParamByName('RUBREMUN').AsString := FU.QuebrarListaFiltro(0,'(RX.CODPROVDESC', ListaRubricasSel[0], 999);
     sqlRubValores.ParamByName('RUBDEDUCAO').AsString := FU.QuebrarListaFiltro(0,'(RX.CODPROVDESC', ListaRubricasSel[1], 999);
     sqlRubValores.ParamByName('RUBDESCFACUL').AsString := FU.QuebrarListaFiltro(0,'(RX.CODPROVDESC', ListaRubricasSel[2], 999);
     sqlRubValores.Open;

     sqlCalcMC.Prepare;
     sqlCalcMC.ParamByName('RUBREMUN').AsString := FU.QuebrarListaFiltro(0,'(RX.CODPROVDESC', ListaRubricasSel[0], 999);
     sqlCalcMC.ParamByName('RUBDEDUCAO').AsString := FU.QuebrarListaFiltro(0,'(RX.CODPROVDESC', ListaRubricasSel[1], 999);
     sqlCalcMC.ParamByName('RUBDESCFACUL').AsString := FU.QuebrarListaFiltro(0,'(RX.CODPROVDESC', ListaRubricasSel[2], 999);
     sqlCalcMC.Open;

     sqlImg.Open;
end;

procedure TrptCalcMargemConsig.rpCalcMCBeforePrint(
  Sender: TObject);
begin
  inherited;
  // zera os valores
   
  VlrTotalRemun := 0;
  VlrTotalDeducoes := 0;
  VlrBaseCalc := 0;
  VlrMargemPre := 0;
  VlrTotalDescFacul := 0;
  VlrMargemFinal := 0;

  // atribui os valores das rubricas e efetuando os calculos
  AtribuiRubValores;

  // labels cabeçalho

  ppNomeFunc.Caption := Parametros.ParamValues[1].AsString;
  ppMes.Caption := StringReplace(Parametros.ParamValues[5].AsString, 'ç', 'Ç',[rfReplaceAll]);

  //labels rodape
  ppDataEmissao.Caption := FormatDateTime('dd/mm/yy hh:nn:ss', Now);

  // labels do sumário
  ppVlrMargemFinal.Caption := FormatFloat('###,###,##0.00', VlrMargemFinal);
end;

procedure TrptCalcMargemConsig.ppVlrRubricasPrint(Sender: TObject);
begin
  inherited;

  // muda a cor se for desconto facultativo
  if cdsCalcMC.FieldByName('CODGRUPO').AsInteger = 5 then
     ppVlrRubricas.Font.Color := clMaroon
  else
     ppVlrRubricas.Font.Color := clNavy;


end;

procedure TrptCalcMargemConsig.AtribuiRubValores;
var
   IdRubrica : string;
   CodGrupo : integer;
   Valor : double;
begin
    if not(CdsRubValores.IsEmpty) then
    begin
        CdsRubValores.First;
        while not(CdsRubValores.Eof) do
        begin
             IdRubrica := CdsRubValores.FieldByName('IDRUBRICA').AsString;
             CodGrupo := CdsRubValores.FieldByName('CODGRUPO').AsInteger;
             Valor := CdsRubValores.FieldByName('VALOR').AsFloat;

             // posiciona o cds de acordo com a rubrica
             cdsCalcMC.Filtered := False;
             cdsCalcMC.Filter := 'IDRUBRICA = ' + QuotedStr(IdRubrica) + ' AND ' +
                                 'CODGRUPO = ' + IntToStr(CodGrupo);
             cdsCalcMC.Filtered := True;
             cdsCalcMC.Edit;
             cdsCalcMC.FieldByName('VALOR').AsFloat := Valor;
             cdsCalcMC.Post;

             Case CodGrupo of
                 // remuneração
                 1: VlrTotalRemun := VlrTotalRemun + Valor;
                 // dedução
                 2: VlrTotalDeducoes := VlrTotalDeducoes + Valor;
                 // Descontos facultivos
                 5: VlrTotalDescFacul := VlrTotalDescFacul + Valor;
             end;

             cdsCalcMC.Filtered := False;
             CdsRubValores.Next;
        end;

        // calculos
        VlrBaseCalc := VlrTotalRemun - VlrTotalDeducoes;
        VlrMargemPre := VlrBaseCalc * 0.3;
        VlrMargemFinal := VlrMargemPre - VlrTotalDescFacul;


        // valor total remuneração
        cdsCalcMC.Locate('CODGRUPO;NOME',VarArrayOf([1,' ']), []);
        cdsCalcMC.Edit;
        cdsCalcMC.FieldByName('VALORTOTAL').AsFloat := VlrTotalRemun;
        cdsCalcMC.Post;
        // valor total dedução
        cdsCalcMC.Locate('CODGRUPO;NOME',VarArrayOf([2,' ']), []);
        cdsCalcMC.Edit;
        cdsCalcMC.FieldByName('VALORTOTAL').AsFloat := VlrTotalDeducoes;
        cdsCalcMC.Post;
        // valor Base calculo (I - II)
        cdsCalcMC.Locate('CODGRUPO;NOME',VarArrayOf([3,' ']), []);
        cdsCalcMC.Edit;
        cdsCalcMC.FieldByName('VALORTOTAL').AsFloat := VlrBaseCalc;
        cdsCalcMC.Post;
        // Valor Margem preliminar (30% de III)
        cdsCalcMC.Locate('CODGRUPO;NOME',VarArrayOf([4,' ']), []);
        cdsCalcMC.Edit;
        cdsCalcMC.FieldByName('VALORTOTAL').AsFloat := VlrMargemPre;
        cdsCalcMC.Post;
        // Valor total descontos facultivos
        cdsCalcMC.Locate('CODGRUPO;NOME',VarArrayOf([5,' ']), []);
        cdsCalcMC.Edit;
        cdsCalcMC.FieldByName('VALORTOTAL').AsFloat := VlrTotalDescFacul;
        cdsCalcMC.Post;
    end;
end;

procedure TrptCalcMargemConsig.FormatParametros(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  sNewValue := sOldValue;
end;

procedure TrptCalcMargemConsig.ppNomeRubricasPrint(Sender: TObject);
var
   codGrupo : integer;
begin
  inherited;
  codGrupo := cdsCalcMC.FieldByName('CODGRUPO').AsInteger;
  { somente avança o cds se o nome for vazio
     e se tem rub selecionada de acordo com o grupo}

  if FTemRubSel[codGrupo] then
  begin
    if cdsCalcMC.FieldByName('NOME').AsString = ' ' then
       cdsCalcMC.Next;
  end;

end;

end.
