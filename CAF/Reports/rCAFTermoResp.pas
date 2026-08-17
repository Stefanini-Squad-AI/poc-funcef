// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)   : Everson Cunha
// Data       : 21/12/2018
// SIG        : 48344
// Alteração  : Segregação do inventário dos bens
//De acordo com o MEG 075 de infraestrutura, subitem 5.1.10.1 - A COPAD realizará
//inventário anual dos Bens Patrimoniais, exceto os equipamentos de TI.
//Os equipamentos de TI serão inventariados pela GETIF.
//------------------------------------------------------------------------------
// Autor(a)   : Arnaldo V. Scarin
// Data       : 04/12/2009
// SOL        : 126066
// KTN        : 656022
// Alteração  : Criacao de Numeração Sequencial para o Termo de Responsabilidade
//------------------------------------------------------------------------------
// Autor(a)   : Ádler Teodoro de Souza
// Rotina     : BeforePrint
// Data       : 30/06/2009
// SOL        : 58194
// KTN        : 537571
// Alteração  : Implementação da quebra de página/relatório.
//------------------------------------------------------------------------------

unit rCAFTermoResp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FCmReport, uCmRptManager, TXComp, CmParamReport, ppBands,
  ppMemo, ppClass, ppVar, ppCtrls, ppStrtch, ppPrnabl, ppCache, ppProd,
  ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, DB, Wwdatsrc,
  DBTables, Wwquery, DBClient, uCMClientDataSet, uCmSqlParams,
  uCMfileUtils, uCtrlPadroes, IvDictio, IvMulti, MontaSelect, TXRB,
  ppParameter;

type
  TRptCAFTermoResp = class(TFrmCmReport)
    dsTermoResp: TwwDataSource;
    ppTermoResp: TppBDEPipeline;
    ppTermoppField1: TppField;
    ppTermoppField2: TppField;
    ppTermoppField3: TppField;
    ppTermoppField4: TppField;
    ppTermoppField5: TppField;
    ppTermoppField6: TppField;
    ppTermoppField7: TppField;
    rpTermoResp: TppReport;
    ppHeaderBand11: TppHeaderBand;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDetailBand11: TppDetailBand;
    rpTermoDBText4: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppDBMemo3: TppDBMemo;
    ppFooterBand11: TppFooterBand;
    ppLine22: TppLine;
    ppLabel79: TppLabel;
    ppCalc21: TppSystemVariable;
    ppCalc22: TppSystemVariable;
    rpTermoGroup1: TppGroup;
    rpTermoGroupHeaderBand1: TppGroupHeaderBand;
    rpTermoLabel1: TppLabel;
    rpTermoDBText1: TppDBText;
    rpTermoLabel2: TppLabel;
    rpTermoDBText3: TppDBText;
    rpTextodoTermo: TppMemo;
    rpTermoLine1: TppLine;
    rpTermoLine2: TppLine;
    rpTermoLabel4: TppLabel;
    rpTermoLabel5: TppLabel;
    ppLabel126: TppLabel;
    ppLabel127: TppLabel;
    rpTermoGroupFooterBand1: TppGroupFooterBand;
    rpTermoLine3: TppLine;
    rpTermoLabel3: TppLabel;
    rpTermoDBText2: TppDBText;
    rpTermoLabel6: TppLabel;
    rpTermoLine4: TppLine;
    rpTermoLabel7: TppLabel;
    rpTermoLine5: TppLine;
    sqlTermoResp: TCMSqlParams;
    cdsTermoResp: TCMClientDataSet;
    cdsParamCaf: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    MSBem: TMontaSelect;
    ppLblNumeroTermo: TppLabel;
    ppNumeroTermo: TppLabel;
    ppParameterList1: TppParameterList;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    function  CentroCustoTI(IdUsuario: Double): Boolean; //Everson Cunha - SIG48344
  public
    { Public declarations }
  end;

var
  RptCAFTermoResp: TRptCAFTermoResp;

implementation

{$R *.dfm}

Uses uSistema; //Everson Cunha - SIG48344

//Everson Cunha - SIG48344 - Início
//Identifica se o centro de custo do funcionário logado no sistema é responsável
//pelo inventário dos equipamentos de TI
function TRptCAFTermoResp.CentroCustoTI(IdUsuario: Double): Boolean;
var
  sSql : TwwQuery;
begin
  sSql := TwwQuery.Create(nil);
  sSql.DatabaseName := 'BaseDados';

  Result := False;

  try
    sSql.Close;
    sSql.sql.Clear;
    sSql.SQL.Add('SELECT 1                                                   ');
    sSql.SQL.Add('  FROM FUNCIONARIO F                                       ');
    sSql.SQL.Add('  JOIN CENTCUST C ON C.CODCENTROCUSTO = F.CODCENTROCUSTO   ');
    sSql.SQL.Add(' WHERE F.IDPESSOA = ' + FloatToStr( IdUsuario ) + '        ');
    sSql.SQL.Add('   AND C.FLGINVENTARIOTI = ''1''                           ');

    sSql.Open;

    if sSql.RecordCount = 1 then
      Result := True;

  finally
    sSql.Free;
  end;    
end;
//Everson Cunha - SIG 48344- Fim

procedure TRptCAFTermoResp.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   CmpRptCM.ParamValues[2].LookupSettings.SQL.Text := ' SELECT NOME, IDLOCALIZACAO ' +
                                                      ' FROM LOCALIZACAO ' +
                                                      ' WHERE IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      ' ORDER BY NOME ';
   CmpRptCM.ParamValues[4].LookupSettings.SQL.Text := ' SELECT DESCCONJUNTO, IDCONJUNTO '+
                                                      ' FROM CONJUNTO ' +
                                                      ' WHERE IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      ' ORDER BY DESCCONJUNTO ';
   MSBem.Filtro.Add('BEM.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa));
   MSBem.Filtro.Add('BEM.IDMODULO = ' + FloatToStr(CrmRptCM.IdModulo));
end;

procedure TRptCAFTermoResp.CrmRptCMBeforePrint(Sender: TObject);
Var
   iMoedaOficial : Integer;
begin
   inherited;
   try
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;

      // Alterado por Arnaldo V. Scarin em 04/12/2009
      // SOL: 126066 KTN : 656022
      // Criacao de Numeração Sequencial para o Termo de Responsabilidade
      ppNumeroTermo.Caption := Format('%.4d',[CmpRptCM.ParamValues[7].AsInteger])+
                               '/'+
                               FormatDateTime('yyyy',CmpRptCM.ParamValues[8].AsDateTime);

      cdsTermoResp.Close;
      //Ádler Souza - Início - SOL N° 58194 KINTANA N° 537571
      if CmpRptCM.ParamValues[6].AsBoolean = True then
        begin
          rpTermoResp.Groups[0].BreakName := 'PLACA';
          rpTermoResp.Groups[0].NewPage := True;
        end;
      //Ádler Souza - Fim - SOL N° 58194 KINTANA N° 537571

      //----------------------------------------------------------------------------------
      // Captura as Mascaras
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
      if CmpRptCM.ParamValues[2].AsInteger <> 0 then
      begin
         sqlTermoResp.SQL.Strings[38] := '  AND C.IDLOCALIZACAO = ' + inttostr(CmpRptCM.ParamValues[2].AsInteger);
      end else
      begin
         sqlTermoResp.SQL.Strings[38] := ' ';
      end;
      if CmpRptCM.ParamValues[3].AsInteger <> 0 then
      begin
         sqlTermoResp.SQL.Strings[39] := '  AND C.IDRESPONSAVEL = ' + inttostr(CmpRptCM.ParamValues[3].AsInteger);
      end else
      begin
         sqlTermoResp.SQL.Strings[39] := ' ';
      end;
      if CmpRptCM.ParamValues[4].AsInteger <> 0 then
      begin
         sqlTermoResp.SQL.Strings[40] := '  AND C.IDCONJUNTO = ' + inttostr(CmpRptCM.ParamValues[4].AsInteger);
      end else
      begin
         sqlTermoResp.SQL.Strings[40] := ' ';
      end;
      if CmpRptCM.ParamValues[5].AsString <> '' then
      begin
         sqlTermoResp.SQL.Strings[41] := '   AND B.IDBEM IN(' + CmpRptCM.ParamValues[5].AsString +')';
      end else
      begin
         sqlTermoResp.SQL.Strings[41] := ' ';
      end;

      //----------------------------------------------------------------------------------
      //Everson Luiz - SIG48344 - Início
      //case CmpRptCM.ParamValues[0].AsInteger  of
      //   0 : sqlTermoResp.SQL.Strings[52] := ' ORDER BY C.IDRESPONSAVEL, C.IDLOCALIZACAO, B.PLACA, B.DESBEM';
      //   1 : sqlTermoResp.SQL.Strings[52] := ' ORDER BY C.IDRESPONSAVEL, C.IDLOCALIZACAO, B.DESBEM, B.PLACA';
      //else
      //   sqlTermoResp.SQL.Strings[52] := ' ORDER BY C.IDRESPONSAVEL, C.IDLOCALIZACAO, B.PLACA, B.DESBEM';
      //end;

      case CmpRptCM.ParamValues[0].AsInteger  of
         0 : sqlTermoResp.SQL.Strings[54] := ' ORDER BY C.IDRESPONSAVEL, C.IDLOCALIZACAO, B.PLACA, B.DESBEM';
         1 : sqlTermoResp.SQL.Strings[54] := ' ORDER BY C.IDRESPONSAVEL, C.IDLOCALIZACAO, B.DESBEM, B.PLACA';
      else
         sqlTermoResp.SQL.Strings[54] := ' ORDER BY C.IDRESPONSAVEL, C.IDLOCALIZACAO, B.PLACA, B.DESBEM';
      end;
      //Everson Luiz - SIG48344 - Fim
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[1].AsInteger = 0 then
      begin
         ppLabel126.Visible := False;
         ppLabel127.Visible := False;
         ppdbText57.Visible := False;
         ppdbText58.Visible := False;
         ppDBMemo3.Width := 627;
      end else
      begin
         ppLabel126.Visible := True;
         ppLabel127.Visible := True;
         ppdbText57.Visible := True;
         ppdbText58.Visible := True;
         ppDBMemo3.Width := 421;
      end;

      //Everson Cunha - SIG48344 - Início
      sqlTermoResp.Prepare;
      if CentroCustoTI(Sistema.IdUsuario) then
      begin
        Application.MessageBox('Serão carregados apenas os Equipamentos de TI', 'CAF', 0);
//        MsgDlg('Serão carregados apenas os Equipamentos de TI', 'CAF', mtInformation, [mbOK], 0);
        sqlTermoResp.ParamByName('FLGINVENTARIOTI').AsString := '1';
      end
      else
      begin
        Application.MessageBox('Serão carregados todos os Bens, exceto os Equipamentos de TI', 'CAF', 0);
//        MsgDlg('Serão carregados todos os Bens, exceto os Equipamentos de TI', 'CAF', mtInformation, [mbOK], 0);
        sqlTermoResp.ParamByName('FLGINVENTARIOTI').AsString := '0';
      end;
      //Everson Cunha - SIG48344 - Fim

      //----------------------------------------------------------------------------------
//      sqlTermoResp.Prepare;  //Everson Cunha - SIG48344
      sqlTermoResp.ParamByName('DATASLD').AsDateTime  := date;
      sqlTermoResp.ParamByName('IDPESSOA').AsFloat    := CrmRptCM.IdEmpresa;
      sqlTermoResp.ParamByName('MOECODIGO').AsInteger := iMoedaOficial;
      sqlTermoResp.ParamByName('IDTAXADEP').AsInteger := 1;                    // Brasil
      sqlTermoResp.Open;
      Screen.Cursor := crDefault;
      //----------------------------------------------------------------------------------


      if cdsTermoResp.IsEmpty then
      begin
         if CmpRptCM.ParamValues[2].AsInteger <> 0 then
            Raise Exception.Create('Não há bens para essa Localização !')
         else
         if CmpRptCM.ParamValues[3].AsInteger <> 0 then
            Raise Exception.Create('Não há bens para esse Responsável !')
         else
            Raise Exception.Create('Não há bens com os Parâmetros selecionados !');
      end;
  except
     On E : Exception Do
     begin
        CMDebugToFile('TERMO DE RESPONSABILIDADE : ' + #13 + E.Message);
     end;
  end;
end;

end.
