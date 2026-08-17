unit rCAFParamContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FCmReport, uCmRptManager, TXComp, CmParamReport, ppVar, ppBands,
  ppStrtch, ppMemo, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, DB, Wwdatsrc, DBTables,
  Wwquery, DBClient, uCMClientDataSet, uCmSqlParams,
  uCMfileUtils, uCtrlPadroes, uCMTypes, uCtrlParamCAF, uCtrlCafxContab,
  IvDictio, IvMulti;

type
  TRptCAFParamContab = class(TFrmCmReport)
    dsParamContab: TwwDataSource;
    ppParamContab: TppBDEPipeline;
    rpParamContab: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel4: TppLabel;
    ppLine3: TppLine;
    ppLabel5: TppLabel;
    rpParamContabLabel1: TppLabel;
    rpParamContabLabel2: TppLabel;
    rpParamContabLabel3: TppLabel;
    rpParamContabLabel4: TppLabel;
    rpParamContabLine1: TppLine;
    rpParamContabLabel5: TppLabel;
    ppDetailBand2: TppDetailBand;
    rpParamContabDBText1: TppDBText;
    rpParamContabDBMemo1: TppDBMemo;
    rpParamContabDBMemo2: TppDBMemo;
    rpParamContabDBMemo3: TppDBMemo;
    rpParamContabDBMemo4: TppDBMemo;
    ppFooterBand2: TppFooterBand;
    ppLine4: TppLine;
    ppLabel9: TppLabel;
    ppCalc3: TppSystemVariable;
    ppCalc4: TppSystemVariable;
    cdsParamContab: TCMClientDataSet;
    sqlParamContab: TCMSqlParams;
    cdsParamCAFxContab: TCMClientDataSet;
    sqlParamCAFxContab: TCMSqlParams;
    cdsTipoMovimentacao: TCMClientDataSet;
    sqlTipoMovimentacao: TCMSqlParams;
    cdsBem: TCMClientDataSet;
    sqlBem: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
    ParamCAF : TCtrlParamCAF;
    CafxContab : TCtrlCafxContab;
  public
    { Public declarations }
  end;

var
  RptCAFParamContab: TRptCAFParamContab;

implementation

{$R *.dfm}

procedure TRptCAFParamContab.CrmRptCMBeforePrint(Sender: TObject);
var
   sObrigaCC,
   sNomeConta,
   sObrigaSubConta : String;
   iSubConta, iExercicio, iPeriodo : Integer;

begin
   inherited;
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   CafxContab := TCtrlCafxContab.Create;
   CafxContab.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   try
      try
         Screen.Cursor := crSQLWait;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         ParamCAF.CarregaProp(CrmRptCM.IdEmpresa);
         //-------------------------------------------------------------------------------
         cdsParamContab.Close;
         sqlParamContab.Open;
         //-------------------------------------------------------------------------------
         cdsTipoMovimentacao.Close;
         if CmpRptCM.ParamValues[1].AsInteger = 0 then
         begin
            if CmpRptCM.ParamValues[2].AsInteger = 0 then
            begin
               sqlTipoMovimentacao.SQL.Strings[03] := ' AND IDTIPOMOVIMENTACAO = 01';
               sqlTipoMovimentacao.SQL.Strings[04] := ' ';
               sqlTipoMovimentacao.SQL.Strings[05] := ' ';
            end else
            if CmpRptCM.ParamValues[2].AsInteger = 1 then
            begin
               sqlTipoMovimentacao.SQL.Strings[03] := ' AND (IDTIPOMOVIMENTACAO = 06 OR IDTIPOMOVIMENTACAO = 25 OR IDTIPOMOVIMENTACAO = 24 OR ';
               sqlTipoMovimentacao.SQL.Strings[04] := '      IDTIPOMOVIMENTACAO = 26 OR IDTIPOMOVIMENTACAO = 30 OR IDTIPOMOVIMENTACAO = 31)';
               sqlTipoMovimentacao.SQL.Strings[05] := ' ';
            end else
            if CmpRptCM.ParamValues[2].AsInteger = 2 then
            begin
               sqlTipoMovimentacao.SQL.Strings[03] := ' AND (IDTIPOMOVIMENTACAO = 14 OR IDTIPOMOVIMENTACAO = 15 OR IDTIPOMOVIMENTACAO = 21) ';
               sqlTipoMovimentacao.SQL.Strings[04] := ' ';
               sqlTipoMovimentacao.SQL.Strings[05] := ' ';
            end else
            if CmpRptCM.ParamValues[2].AsInteger = 3 then
            begin
               sqlTipoMovimentacao.SQL.Strings[03] := ' AND IDTIPOMOVIMENTACAO = 08';
               sqlTipoMovimentacao.SQL.Strings[04] := ' ';
               sqlTipoMovimentacao.SQL.Strings[05] := ' ';
            end else
            if CmpRptCM.ParamValues[2].AsInteger = 4 then
            begin
               sqlTipoMovimentacao.SQL.Strings[03] := ' AND IDTIPOMOVIMENTACAO = 09';
               sqlTipoMovimentacao.SQL.Strings[04] := ' ';
               sqlTipoMovimentacao.SQL.Strings[05] := ' ';
            end else
            if CmpRptCM.ParamValues[2].AsInteger = 5 then
            begin
               sqlTipoMovimentacao.SQL.Strings[03] := ' ';
               sqlTipoMovimentacao.SQL.Strings[04] := ' ';
               sqlTipoMovimentacao.SQL.Strings[05] := ' ';
            end;
         end else
         begin
            if CmpRptCM.ParamValues[2].AsInteger = 0 then
            begin
               sqlTipoMovimentacao.SQL.Strings[03] := ' AND IDTIPOMOVIMENTACAO = 01';
               sqlTipoMovimentacao.SQL.Strings[04] := ' ';
               sqlTipoMovimentacao.SQL.Strings[05] := ' ';
            end else
            if CmpRptCM.ParamValues[2].AsInteger = 1 then
            begin
               sqlTipoMovimentacao.SQL.Strings[03] := ' AND (IDTIPOMOVIMENTACAO = 06 OR IDTIPOMOVIMENTACAO = 25 OR IDTIPOMOVIMENTACAO = 24 OR IDTIPOMOVIMENTACAO = 26 OR IDTIPOMOVIMENTACAO = 20 OR ';
               sqlTipoMovimentacao.SQL.Strings[04] := '      IDTIPOMOVIMENTACAO = 28 OR IDTIPOMOVIMENTACAO = 27 OR IDTIPOMOVIMENTACAO = 26 OR IDTIPOMOVIMENTACAO = 37 OR IDTIPOMOVIMENTACAO = 38 OR ';
               sqlTipoMovimentacao.SQL.Strings[05] := '      IDTIPOMOVIMENTACAO = 39 OR IDTIPOMOVIMENTACAO = 40 OR IDTIPOMOVIMENTACAO = 30 OR IDTIPOMOVIMENTACAO = 31)';
            end else
            if CmpRptCM.ParamValues[2].AsInteger = 2 then
            begin
               sqlTipoMovimentacao.SQL.Strings[03] := ' AND (IDTIPOMOVIMENTACAO = 14 OR IDTIPOMOVIMENTACAO = 18 OR IDTIPOMOVIMENTACAO = 35 OR ';
               sqlTipoMovimentacao.SQL.Strings[04] := '      IDTIPOMOVIMENTACAO = 15 OR IDTIPOMOVIMENTACAO = 22 OR IDTIPOMOVIMENTACAO = 34 OR ';
               sqlTipoMovimentacao.SQL.Strings[05] := '      IDTIPOMOVIMENTACAO = 21 OR IDTIPOMOVIMENTACAO = 19 OR IDTIPOMOVIMENTACAO = 36)';
            end else
            if CmpRptCM.ParamValues[2].AsInteger = 3 then
            begin
               sqlTipoMovimentacao.SQL.Strings[03] := ' AND IDTIPOMOVIMENTACAO = 08';
               sqlTipoMovimentacao.SQL.Strings[04] := ' ';
               sqlTipoMovimentacao.SQL.Strings[05] := ' ';
            end else
            if CmpRptCM.ParamValues[2].AsInteger = 4 then
            begin
               sqlTipoMovimentacao.SQL.Strings[03] := ' AND IDTIPOMOVIMENTACAO = 09';
               sqlTipoMovimentacao.SQL.Strings[04] := ' ';
               sqlTipoMovimentacao.SQL.Strings[05] := ' ';
            end else
            if CmpRptCM.ParamValues[2].AsInteger = 5 then
            begin
               sqlTipoMovimentacao.SQL.Strings[03] := ' ';
               sqlTipoMovimentacao.SQL.Strings[04] := ' ';
               sqlTipoMovimentacao.SQL.Strings[05] := ' ';
            end;
         end;
         //-------------------------------------------------------------------------------
         if not CafxContab.VerificaPeriodoContabil(CrmRptCM.IdEmpresa, CmpRptCM.ParamValues[0].AsDateTime,
                                                   iExercicio, iPeriodo) then
            Raise Exception.Create(CafxContab.MessageInfo);
         //-------------------------------------------------------------------------------
         sqlTipoMovimentacao.Open;
         //-------------------------------------------------------------------------------
         sqlBem.Prepare;
         sqlBem.ParamByName('IDPESSOA').asFloat    := CrmRptCM.IdEmpresa;
         sqlBem.ParamByName('DATAMOV').asDateTime  := CmpRptCM.ParamValues[0].AsDateTime;
         sqlBem.ParamByName('FLGIMOVEL').AsInteger := CmpRptCM.ParamValues[1].AsInteger;
         sqlBem.Open;
         //-------------------------------------------------------------------------------
         while not cdsBem.EOF do
         begin
            cdsTipoMovimentacao.First;
            while not cdsTipoMovimentacao.EOF do
            begin
               cdsParamCAFxContab.Close;
               sqlParamCAFxContab.Prepare;
               sqlParamCAFxContab.ParamByName('IDGRUPO').AsFloat := cdsBem.FieldByName('IDGRUPO').AsFloat;
               sqlParamCAFxContab.ParamByName('IDTIPOMOVIMENTACAO').AsFloat := cdsTipoMovimentacao.FieldByName('IDTIPOMOVIMENTACAO').AsFloat;
               sqlParamCAFxContab.ParamByName('PLANO').AsInteger := ParamCAF.PLANOVIGENTE;
               sqlParamCAFxContab.ParamByName('IDPESSOA').AsFloat := cdsBem.FieldByName('IDPESSOA').AsFloat;
               sqlParamCAFxContab.Open;
               if cdsParamCAFxContab.IsEmpty then
               begin
                  cdsParamContab.Append;
                  cdsParamContab.FieldbyName('PLACA').AsFloat := cdsBem.FieldbyName('PLACA').AsFloat;
                  cdsParamContab.FieldbyName('DESBEM').AsString := cdsBem.FieldbyName('DESBEM').AsString;
                  cdsParamContab.FieldByName('GRUPOCONTABIL').AsString := 'O Grupo Contábil ' +
                                                                          trim(cdsBem.FieldByName('DESCGRUPO').AsString) +
                                                                          ' não possui contas contábeis na movimentação ' +
                                                                          cdsTipoMovimentacao.FieldByName('DESCTIPOMOVIMENTACAO').AsString;
                  cdsParamContab.Post;
               end else
               begin
                  while not cdsParamCAFxContab.EOF do
                  begin
                     //-------------------------------------------------------------------
                     // Captura os Flags de verificação de Conta Contábil
                     //-------------------------------------------------------------------
                     if CafxContab.ContaContab.TestaContaContabil(cdsParamCAFxContab.FieldByName('PLANO').AsInteger,
                                                                  cdsParamCAFxContab.FieldByName('IDPESSOA').AsInteger,
                                                                  iPeriodo, iExercicio,
                                                                  cdsParamCAFxContab.FieldByName('PLACONTA').AsString,
                                                                  False, False) then
                     begin
                        sNomeConta := CafxContab.ContaContab.NomeConta;
                        sObrigaCc := CafxContab.ContaContab.ObrigaCentroCusto;
                        sObrigaSubConta := CafxContab.ContaContab.ObrigaSubConta;
                        //----------------------------------------------------------------
                        // Verifica se a conta contábil possui Centro de Custo
                        //----------------------------------------------------------------
                        if sObrigaCC = 'S' then
                        begin
                           if not CafxContab.VerificaContaxCC(cdsParamCAFxContab.FieldByName('PLANO').AsInteger,
                                                              cdsParamCAFxContab.FieldByName('IDPESSOA').AsInteger,
                                                              cdsParamCAFxContab.FieldByName('PLACONTA').AsString,
                                                              cdsBem.FieldByName('CODCENTROCUSTO').AsString) then
                           begin
                              cdsParamContab.Append;
                              cdsParamContab.FieldByName('PLACA').AsFloat          := cdsBem.FieldByName('PLACA').AsFloat;
                              cdsParamContab.FieldByName('DESBEM').AsString        := cdsBem.FieldByName('DESBEM').AsString;
                              cdsParamContab.FieldByName('GRUPOCONTABIL').AsString := trim(cdsBem.FieldByName('DESCGRUPO').AsString) +
                                                                                       ' - Conta ' + cdsBem.FieldByName('PLACONTA').AsString +
                                                                                       ' - [' + cdsBem.FieldByName('TIPOLANCAMENTO').AsString + ']';
                              cdsParamContab.FieldByName('CCUSTO').AsString        :=  'Associe o Centro de Custo ' + trim(cdsBem.FieldByName('CODCENTROCUSTO').AsString) +
                                                                                       ' - ' + cdsBem.FieldByName('NOME').AsString + ' a Conta Contábil.';
                              cdsParamContab.Post;
                           end;
                        end;
                        //----------------------------------------------------------------
                        // Verifica se a conta contábil possui SubConta
                        //----------------------------------------------------------------
                        iSubConta := cdsBem.FieldbyName('CODSUBCONTA').AsInteger;
                        if sObrigaSubConta = 'S' then
                        begin
                           if not CafxContab.ContaContab.TestaContaxSC(cdsBem.FieldByName('PLANO').AsInteger,
                                                                       cdsBem.FieldByName('IDPESSOA').AsInteger,
                                                                       iSubConta,
                                                                       cdsBem.FieldByName('PLACONTA').AsString) then
                           begin
                              if iSubConta <= 0 then
                              begin
                                 cdsParamContab.Append;
                                 cdsParamContab.FieldByName('PLACA').AsFloat          := cdsBem.FieldByName('PLACA').AsFloat;
                                 cdsParamContab.FieldByName('DESBEM').AsString        := cdsBem.FieldByName('DESBEM').AsString;
                                 cdsParamContab.FieldByName('GRUPOCONTABIL').AsString := trim(cdsBem.FieldByName('DESCGRUPO').AsString) +
                                                                                          ' - Conta ' + cdsBem.FieldByName('PLACONTA').AsString +
                                                                                          ' - [' + cdsBem.FieldByName('TIPOLANCAMENTO').AsString + ']';
                                 cdsParamContab.FieldByName('SUBCONTA').AsString      := 'A SubConta é obrigatória e não está cadastrada';
                                 cdsParamContab.Post;
                              end else
                              begin
                                 cdsParamContab.Append;
                                 cdsParamContab.FieldbyName('PLACA').AsFloat          := cdsBem.FieldbyName('PLACA').AsFloat;
                                 cdsParamContab.FieldbyName('DESBEM').AsString        := cdsBem.FieldbyName('DESBEM').AsString;
                                 cdsParamContab.FieldbyName('GRUPOCONTABIL').AsString := trim(cdsBem.FieldbyName('DESCGRUPO').AsString) +
                                                                                          ' - Conta ' + cdsBem.FieldbyName('PLACONTA').AsString +
                                                                                          ' - [' + cdsBem.FieldbyName('TIPOLANCAMENTO').AsString + ']';
                                 cdsParamContab.FieldbyName('SUBCONTA').AsString      := 'Associe a SubConta ' + cdsBem.FieldbyName('CODSUBCONTA').AsString +
                                                                                         ' a Conta Contábil.';
                                 cdsParamContab.Post;
                              end;
                           end;
                        end;
                     end else
                     //-------------------------------------------------------------------
                     // Relata o erro gerado na contabilidade
                     //-------------------------------------------------------------------
                     begin
                        cdsParamContab.Append;
                        cdsParamContab.FieldbyName('PLACA').AsFloat := cdsBem.FieldbyName('PLACA').AsFloat;
                        cdsParamContab.FieldbyName('DESBEM').AsString := cdsBem.FieldbyName('DESBEM').AsString;
                        cdsParamContab.FieldByName('GRUPOCONTABIL').AsString := 'Integração Contábil : ' + CafxContab.ContaContab.MessageInfo;
                        cdsParamContab.Post;
                     end;
                     //-------------------------------------------------------------------
                     cdsParamCAFxContab.Next;
                  end;
               end;
               cdsTipoMovimentacao.Next
            end;
            cdsBem.Next;
         end;
         //-------------------------------------------------------------------------------
         if cdsParamContab.IsEmpty then
         begin
            cdsParamContab.Append;
            cdsParamContab.FieldByName('CCUSTO').AsString := 'Não existem divergencias na Parametrização Contábil dos Bens Selecionados';
            cdsParamContab.Post;
         end;
      except
         On E : Exception do
         begin
            CMDebugToFile('PARAMETRIZAÇÃO CONTÁBIL POR BEM : ' + #13 + E.Message);
         end;
      end;
   finally
      Screen.Cursor := crDefault;
      Application.ProcessMessages;
      ParamCAF.Free;
      CafxContab.Free;
   end;
end;

end.
