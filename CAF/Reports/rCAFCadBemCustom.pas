{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão      : 5.11.01
Pendência   : 28239
Responsável : Daniel Simões
Data        : 20/06/2008
Descrição   : Passa a visualizar os dados do relatório...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit rCAFCadBemCustom;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FCmReport, uCmRptManager, TXComp, CmParamReport, ppProd,
  ppClass, ppReport, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppVar,
  ppStrtch, ppMemo, ppPrnabl, ppComm, ppRelatv, ppCache, DB, Wwdatsrc,
  DBClient, uCMClientDataSet, uCmSqlParams, uCMfileUtils, uCtrlPadroes,
  IvDictio, IvMulti, TXRB;

type
  TRptCAFCadBemCustom = class(TFrmCmReport)
    dsSelBensCustom: TwwDataSource;
    ppSelBensCustom: TppBDEPipeline;
    rpSelBensCustom: TppReport;
    ppHeaderBand7: TppHeaderBand;
    lblTituloRelat: TppLabel;
    ppLine13: TppLine;
    LblEmpresa: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLine15: TppLine;
    ppLabel121: TppLabel;
    ppDetailBand7: TppDetailBand;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppFooterBand7: TppFooterBand;
    ppLine14: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    LblSistema: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    ppLine45: TppLine;
    ppDBCalc7: TppDBCalc;
    ppLabel120: TppLabel;
    ppLine47: TppLine;
    sqlSelBensCustom: TCMSqlParams;
    cdsSelBensCustom: TCMClientDataSet;
    cdsParamCaf: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    cdsSelBensCustom1: TCMClientDataSet;
    sqlSelBensCustom1: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure sqlSelBensCustomFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCAFCadBemCustom: TRptCAFCadBemCustom;

implementation

{$R *.dfm}

procedure TRptCAFCadBemCustom.CrmRptCMBeforePrint(Sender: TObject);
var
   iMoedaOficial : Integer;
   //-------------------------------------------------------------------------------------
   iInd, iNBens, iLBens : Integer;
   sLinha1, sLinha2 : String;
   //-------------------------------------------------------------------------------------
   slBens, slLinhas1, slLinhas2 : TStrings;

begin
   inherited;
   try
      Screen.Cursor := crSQLWait;
      //----------------------------------------------------------------------------------
      with sqlParamCaf do
      begin
         Prepare;
         ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
         Open;
         //-------------------------------------------------------------------------------
         iMoedaOficial := cdsParamCAF.FieldByName('MOEDAOFICIAL').AsInteger;
         Close;
      end;
      //----------------------------------------------------------------------------------
      cdsSelBensCustom.Close;
      sqlSelBensCustom.Open;
      //----------------------------------------------------------------------------------
      slBens := TStringList.Create;
      slLinhas1 := TStringList.Create;
      slLinhas2 := TStringList.Create;
      try
         slBens.Text := CmpRptCM.ParamValues[2].AsString;
         //-------------------------------------------------------------------------------
         // Processa os bens
         //-------------------------------------------------------------------------------
         iInd := 0;
         while (iInd + 1) <= slBens.Count do
         begin
            //----------------------------------------------------------------------------
            // Acumula uma lista de 1000 bens para processamento
            //----------------------------------------------------------------------------
            slLinhas1.Clear;
            slLinhas2.Clear;
            iNBens := 0;
            iLBens := 0;
            while ((iInd + 1) <= slBens.Count) and (inBens <= 1024) do
            begin
               if iNBens = 0 then
               begin
                  sLinha1 := ' AND (B.IDBEM = ' + slBens.Strings[iInd];
                  sLinha2 := ' AND (IDBEM = ' + slBens.Strings[iInd];
                  iLBens := iLBens + 1
               end else
               begin
                  if iLBens = 0 then
                  begin
                     sLinha1 := '      OR B.IDBEM = ' + slBens.Strings[iInd];
                     sLinha2 := '      OR IDBEM = ' + slBens.Strings[iInd];
                  end else
                  begin
                     sLinha1 := sLinha1 + ' OR B.IDBEM = ' + slBens.Strings[iInd];
                     sLinha2 := sLinha2 + ' OR IDBEM = ' + slBens.Strings[iInd];
                  end;
                  iLBens := iLBens + 1
               end;
               //-------------------------------------------------------------------------
               iInd := iInd + 1;
               iNBens := iNBens + 1;
               //-------------------------------------------------------------------------
               if (iLBens > 10) or ((iInd + 1) > slBens.Count) then
               begin
                  slLinhas1.Add(sLinha1);
                  slLinhas2.Add(sLinha2);
                  iLBens := 0;
               end;
            end;
            //----------------------------------------------------------------------------
            if iNBens <> 0 then
            begin
               slLinhas1.Add(') ');
               slLinhas2.Add(') ');
            end;
            //----------------------------------------------------------------------------
            // Registro Parcial
            //----------------------------------------------------------------------------
            sqlSelBensCustom1.SQL.Clear;
            sqlSelBensCustom1.SQL.Add(' SELECT /*+ RULE */ B.IDBEM, B.IDPESSOA, B.PLACA, B.DESBEM, B.DATAULTDEP, B.DATAINICIODEP,  ');
            sqlSelBensCustom1.SQL.Add('        B.NUMSERIE, B.REGISTRO, B.CONTROLE, B.TAXADEP, CC.NOME AS DESCCCUSTO,               ');
            sqlSelBensCustom1.SQL.Add('        L.NOME AS DESCLOCAL, PR.NOME AS NOMERESP, G.NOME AS DESCGRUPO,                      ');
            sqlSelBensCustom1.SQL.Add('        C.DESCCONJUNTO, B.DTAINCLUSAO, NVL(B.VALHISTORICO,0) AS VALHISTORICO,               ');
            sqlSelBensCustom1.SQL.Add('        PF.NOME AS NOMEFORN, B.IDOPCIONAL, CB.DESCRICAO AS DESCCLASSE,                      ');
            sqlSelBensCustom1.SQL.Add('        S.DESCSITUACAO, B.IDNOTA, B.COMPLNOTA,                                              ');
            sqlSelBensCustom1.SQL.Add('        (SB.VALORG + SB.REAVVALORG + SB.ULTREAVVALORG)    AS VALORG0,                       ');
            sqlSelBensCustom1.SQL.Add('        (SB.CMBEM + SB.REAVCMBEM + SB.ULTREAVCMBEM)       AS CMBEM0,                        ');
            sqlSelBensCustom1.SQL.Add('        (SB.DEPLANC + SB.REAVDEPLANC + SB.ULTREAVDEPLANC) AS DEPLANC0,                      ');
            sqlSelBensCustom1.SQL.Add('        (SB.CMDEP + SB.REAVCMDEP + SB.ULTREAVCMDEP)       AS CMDEP0,                        ');
            sqlSelBensCustom1.SQL.Add('        (SB.VALORG + SB.CMBEM - SB.DEPLANC - SB.CMDEP +                                     ');
            sqlSelBensCustom1.SQL.Add('         SB.REAVVALORG + SB.REAVCMBEM -                                                     ');
            sqlSelBensCustom1.SQL.Add('         SB.REAVDEPLANC - SB.REAVCMDEP +                                                    ');
            sqlSelBensCustom1.SQL.Add('         SB.ULTREAVVALORG + SB.ULTREAVCMBEM -                                               ');
            sqlSelBensCustom1.SQL.Add('         SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP)             AS VALCTB0                        ');
            sqlSelBensCustom1.SQL.Add(' FROM BEM         B,                                                                        ');
            sqlSelBensCustom1.SQL.Add('      GRUPO       G,                                                                        ');
            sqlSelBensCustom1.SQL.Add('      CLASSEDEBEM CB,                                                                       ');
            sqlSelBensCustom1.SQL.Add('      CONJUNTO    C,                                                                        ');
            sqlSelBensCustom1.SQL.Add('      LOCALIZACAO L,                                                                        ');
            sqlSelBensCustom1.SQL.Add('      CENTCUST    CC,                                                                       ');
            sqlSelBensCustom1.SQL.Add('      PESSOA      PR,                                                                       ');
            sqlSelBensCustom1.SQL.Add('      PESSOA      PF,                                                                       ');
            sqlSelBensCustom1.SQL.Add('      SITUACAO    S,                                                                        ');
            sqlSelBensCustom1.SQL.Add('      (SELECT /*+ RULE */ SCB1.IDBEM, SCB1.IDPESSOA, SCB1.DATASLDBEM,                       ');
            sqlSelBensCustom1.SQL.Add('              SCB1.VALORG,  SCB1.REAVVALORG,    SCB1.ULTREAVVALORG,                         ');
            sqlSelBensCustom1.SQL.Add('              SCB1.CMBEM,   SCB1.REAVCMBEM,     SCB1.ULTREAVCMBEM,                          ');
            sqlSelBensCustom1.SQL.Add('              SCD1.DEPLANC, SCD1.REAVDEPLANC,   SCD1.ULTREAVDEPLANC,                        ');
            sqlSelBensCustom1.SQL.Add('              SCD1.CMDEP,   SCD1.REAVCMDEP,     SCD1.ULTREAVCMDEP,                          ');
            sqlSelBensCustom1.SQL.Add('              SCB1.IDGRUPO, SCB1.IDLOCALIZACAO, SCB1.IDRESPONSAVEL, SCB1.UNIDNEGOC,         ');
            sqlSelBensCustom1.SQL.Add('              NVL(SCB1.IDCONJUNTO,B.IDCONJUNTO) AS IDCONJUNTO                               '); // Daniel - 28239
            sqlSelBensCustom1.SQL.Add('       FROM SALDOCONTABBEM SCB1, SLDCTBBEMXDEP SCD1, BEM B,                                 ');
            sqlSelBensCustom1.SQL.Add('            (SELECT IDBEM, MAX(DATASLDBEM) AS DATA                                          ');
            sqlSelBensCustom1.SQL.Add('             FROM SALDOCONTABBEM                                                            ');
            sqlSelBensCustom1.SQL.Add('             WHERE DATASLDBEM <= :DATASLD                                                   ');
            sqlSelBensCustom1.SQL.Add(slLinhas2.Text);
            sqlSelBensCustom1.SQL.Add('               AND MOECODIGO = :MOECODIGO                                                   ');
            sqlSelBensCustom1.SQL.Add('               AND IDPESSOA = :IDPESSOA                                                     ');
            sqlSelBensCustom1.SQL.Add('             GROUP BY IDBEM) DTAMAX                                                         ');
            sqlSelBensCustom1.SQL.Add('       WHERE SCB1.MOECODIGO = :MOECODIGO                                                    ');
            sqlSelBensCustom1.SQL.Add('         AND SCB1.IDPESSOA = :IDPESSOA                                                      ');
            sqlSelBensCustom1.SQL.Add('         AND SCD1.IDSLDCTBBEMXDEP = :IDTAXADEP                                              ');
            sqlSelBensCustom1.SQL.Add('         AND SCD1.MOECODIGO = :MOECODIGO                                                    ');
            sqlSelBensCustom1.SQL.Add('         AND SCD1.IDPESSOA = :IDPESSOA                                                      ');
            sqlSelBensCustom1.SQL.Add('         AND SCB1.IDBEM = B.IDBEM                                                           '); // Daniel - 28239
            sqlSelBensCustom1.SQL.Add('         AND SCB1.IDBEM = DTAMAX.IDBEM                                                      ');
            sqlSelBensCustom1.SQL.Add('         AND SCB1.DATASLDBEM = DTAMAX.DATA                                                  ');
            sqlSelBensCustom1.SQL.Add('         AND SCB1.IDBEM = SCD1.IDBEM                                                        ');
            sqlSelBensCustom1.SQL.Add('         AND SCB1.IDPESSOA = SCD1.IDPESSOA                                                  ');
            sqlSelBensCustom1.SQL.Add('         AND SCB1.DATASLDBEM = SCD1.DATASLDBEM) SB                                          ');
            sqlSelBensCustom1.SQL.Add(' WHERE B.DTAINCLUSAO <= :DATASLD                                                          ');
            sqlSelBensCustom1.SQL.Add('   AND G.FLGIMOVEL = 0                                                                      ');
            sqlSelBensCustom1.SQL.Add(slLinhas1.Text);
            sqlSelBensCustom1.SQL.Add('   AND B.IDPESSOA = :IDPESSOA                                                               ');
            sqlSelBensCustom1.SQL.Add('   AND SB.IDBEM = B.IDBEM                                                                   ');
            sqlSelBensCustom1.SQL.Add('   AND SB.IDPESSOA = B.IDPESSOA                                                             ');
            sqlSelBensCustom1.SQL.Add('   AND SB.IDGRUPO = G.IDGRUPO                                                               ');
            sqlSelBensCustom1.SQL.Add('   AND SB.IDLOCALIZACAO = L.IDLOCALIZACAO                                                   ');
            sqlSelBensCustom1.SQL.Add('   AND SB.IDPESSOA = L.IDPESSOA                                                             ');
            sqlSelBensCustom1.SQL.Add('   AND L.CODCENTROCUSTO = CC.CODCENTROCUSTO                                                 ');
            sqlSelBensCustom1.SQL.Add('   AND L.IDEMPRESA = CC.IDEMPRESA                                                           ');
            sqlSelBensCustom1.SQL.Add('   AND SB.IDRESPONSAVEL = PR.IDPESSOA                                                       ');
            sqlSelBensCustom1.SQL.Add('   AND SB.IDCONJUNTO = C.IDCONJUNTO                                                          ');
            sqlSelBensCustom1.SQL.Add('   AND SB.IDPESSOA = C.IDPESSOA                                                              ');
            sqlSelBensCustom1.SQL.Add('   AND B.IDCLASSEBEM = CB.IDCLASSEBEM                                                       ');
            sqlSelBensCustom1.SQL.Add('   AND B.IDSITUACAO = S.IDSITUACAO                                                          ');
            sqlSelBensCustom1.SQL.Add('   AND B.IDFORNSERV = PF.IDPESSOA(+)                                                        ');
            sqlSelBensCustom1.SQL.Add(' ORDER BY B.PLACA                                                                           ');
            //----------------------------------------------------------------------------
            sqlSelBensCustom1.Prepare;
            sqlSelBensCustom1.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
            sqlSelBensCustom1.ParamByName('DATASLD').AsDateTime := CmpRptCM.ParamValues[0].AsDateTime;
            sqlSelBensCustom1.ParamByName('MOECODIGO').AsInteger := iMoedaOficial;  // Real
            sqlSelBensCustom1.ParamByName('IDTAXADEP').AsInteger := 1;              // Brasil
            sqlSelBensCustom1.Open;
            //----------------------------------------------------------------------------
            while not cdsSelBensCustom1.EOF do
            begin
               cdsSelBensCustom.Append;
               cdsSelBensCustom.FieldByName('IDBEM').AsFloat            := cdsSelBensCustom1.FieldByName('IDBEM').AsFloat;
               cdsSelBensCustom.FieldByName('IDPESSOA').AsFloat         := cdsSelBensCustom1.FieldByName('IDPESSOA').AsFloat;
               cdsSelBensCustom.FieldByName('PLACA').AsFloat            := cdsSelBensCustom1.FieldByName('PLACA').AsFloat;
               cdsSelBensCustom.FieldByName('DESBEM').AsString          := cdsSelBensCustom1.FieldByName('DESBEM').AsString;
               cdsSelBensCustom.FieldByName('DATAULTDEP').AsDateTime    := cdsSelBensCustom1.FieldByName('DATAULTDEP').AsDateTime;
               cdsSelBensCustom.FieldByName('DATAINICIODEP').AsDateTime := cdsSelBensCustom1.FieldByName('DATAINICIODEP').AsDateTime;
               cdsSelBensCustom.FieldByName('NUMSERIE').AsString        := cdsSelBensCustom1.FieldByName('NUMSERIE').AsString;
               cdsSelBensCustom.FieldByName('REGISTRO').AsString        := cdsSelBensCustom1.FieldByName('REGISTRO').AsString;
               cdsSelBensCustom.FieldByName('CONTROLE').AsString        := cdsSelBensCustom1.FieldByName('CONTROLE').AsString;
               cdsSelBensCustom.FieldByName('TAXADEP').AsFloat          := cdsSelBensCustom1.FieldByName('TAXADEP').AsFloat;
               cdsSelBensCustom.FieldByName('DESCCCUSTO').AsString      := cdsSelBensCustom1.FieldByName('DESCCCUSTO').AsString;
               cdsSelBensCustom.FieldByName('DESCLOCAL').AsString       := cdsSelBensCustom1.FieldByName('DESCLOCAL').AsString;
               cdsSelBensCustom.FieldByName('NOMERESP').AsString        := cdsSelBensCustom1.FieldByName('NOMERESP').AsString;
               cdsSelBensCustom.FieldByName('DESCGRUPO').AsString       := cdsSelBensCustom1.FieldByName('DESCGRUPO').AsString;
               cdsSelBensCustom.FieldByName('DESCCONJUNTO').AsString    := cdsSelBensCustom1.FieldByName('DESCCONJUNTO').AsString;
               cdsSelBensCustom.FieldByName('DTAINCLUSAO').AsDateTime   := cdsSelBensCustom1.FieldByName('DTAINCLUSAO').AsDateTime;
               cdsSelBensCustom.FieldByName('VALHISTORICO').AsFloat     := cdsSelBensCustom1.FieldByName('VALHISTORICO').AsFloat;
               cdsSelBensCustom.FieldByName('NOMEFORN').AsString        := cdsSelBensCustom1.FieldByName('NOMEFORN').AsString;
               cdsSelBensCustom.FieldByName('IDOPCIONAL').AsString      := cdsSelBensCustom1.FieldByName('IDOPCIONAL').AsString;
               cdsSelBensCustom.FieldByName('DESCCLASSE').AsString      := cdsSelBensCustom1.FieldByName('DESCCLASSE').AsString;
               cdsSelBensCustom.FieldByName('DESCSITUACAO').AsString    := cdsSelBensCustom1.FieldByName('DESCSITUACAO').AsString;
               cdsSelBensCustom.FieldByName('IDNOTA').AsString          := cdsSelBensCustom1.FieldByName('IDNOTA').AsString;
               cdsSelBensCustom.FieldByName('COMPLNOTA').AsString       := cdsSelBensCustom1.FieldByName('COMPLNOTA').AsString;
               cdsSelBensCustom.FieldByName('VALORG0').AsFloat          := cdsSelBensCustom1.FieldByName('VALORG0').AsFloat;
               cdsSelBensCustom.FieldByName('CMBEM0').AsFloat           := cdsSelBensCustom1.FieldByName('CMBEM0').AsFloat;
               cdsSelBensCustom.FieldByName('DEPLANC0').AsFloat         := cdsSelBensCustom1.FieldByName('DEPLANC0').AsFloat;
               cdsSelBensCustom.FieldByName('CMDEP0').AsFloat           := cdsSelBensCustom1.FieldByName('CMDEP0').AsFloat;
               cdsSelBensCustom.FieldByName('VALCTB0').AsFloat          := cdsSelBensCustom1.FieldByName('VALCTB0').AsFloat;
               cdsSelBensCustom.Post;
               //-------------------------------------------------------------------------
               cdsSelBensCustom1.Next;
            end;
         end;
      finally
         slBens.Free;
         slLinhas1.Free;
         slLinhas2.Free;
      end;
      //----------------------------------------------------------------------------------
      if cdsSelBensCustom.IsEmpty then
         Raise Exception.Create('Não existem bens com os parâmetros fornecidos!');
      //----------------------------------------------------------------------------------
      cdsSelBensCustom.IndexFieldNames := 'PLACA';
      cdsSelBensCustom.First;
      //----------------------------------------------------------------------------------
      ppLabel121.Caption := CmpRptCM.ParamValues[1].AsString;
      lblTituloRelat.Caption := 'Relatório Customizado de Bens em ' + DateToStr(CmpRptCM.ParamValues[0].AsDateTime);
   except
      On E : Exception do
      begin
         CMDebugToFile('Relatório CADASTRO DE BENS CUSTOMIZÁVEL : ' + E.Message);
      end;
   end;
   Screen.Cursor := crDefault;
   Application.ProcessMessages;
end;

procedure TRptCAFCadBemCustom.sqlSelBensCustomFormartParam(sParamName, sOldValue: String; var sNewValue: String);
begin
   inherited;
   if AnsiUpperCase(sParamName) = 'SQLSELBENS' then
      sNewValue := Copy(sOldValue,1,Length(sOldValue));
end;

end.
