unit rCAFInvPat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppDB, uCmSqlParams, Db, uCMfileUtils,
  DBClient, uCMClientDataSet, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl,
  ppCache, ppProd, ppReport, Wwdatsrc, ppComm, ppRelatv, ppDBPipe, ppDBBDE;

type
  TrptCAFInPat = class(TFrmCmReport)
    ppInvPat: TppBDEPipeline;
    dsInvPat: TwwDataSource;
    rpInvPat: TppReport;
    ppHeaderBand17: TppHeaderBand;
    ppLabel40: TppLabel;
    LblEmpresa: TppLabel;
    ppDetailBand17: TppDetailBand;
    rpInvPatDBText4: TppDBText;
    rpInvPatDBText5: TppDBText;
    rpInvPatShape1: TppShape;
    rpInvPatShape2: TppShape;
    rpInvPatShape3: TppShape;
    rpInvPatLabel7: TppLabel;
    rpInvPatLabel8: TppLabel;
    rpInvPatLabel9: TppLabel;
    ppFooterBand17: TppFooterBand;
    ppLine36: TppLine;
    LBLSISTEMA: TppLabel;
    ppCalc33: TppSystemVariable;
    ppCalc34: TppSystemVariable;
    rpInvPatGroup1: TppGroup;
    rpInvPatGroupHeaderBand1: TppGroupHeaderBand;
    ppLine35: TppLine;
    rpInvPatLabel1: TppLabel;
    rpInvPatLabel2: TppLabel;
    rpInvPatDBText1: TppDBText;
    rpInvPatDBText2: TppDBText;
    rpInvPatLabel3: TppLabel;
    rpInvPatLabel4: TppLabel;
    rpInvPatLabel5: TppLabel;
    rpInvPatGroupFooterBand1: TppGroupFooterBand;
    rpInvPatGroup2: TppGroup;
    rpInvPatGroupHeaderBand2: TppGroupHeaderBand;
    rpInvPatLabel6: TppLabel;
    rpInvPatDBText3: TppDBText;
    rpInvPatGroupFooterBand2: TppGroupFooterBand;
    cdsInvPat: TCMClientDataSet;
    sqlInvPat: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptCAFInPat: TrptCAFInPat;

implementation

{$R *.DFM}

procedure TrptCAFInPat.CrmRptCMBeforePrint(Sender: TObject);
var
 sMensagem :string;
begin
  inherited;

   Try
       with sqlInvPat do
       begin
          //----------------------------------------------------------------------------------
          if (CmpRptCM.ParamByName('CONTROLE').AsString = 'Total') then
             SQL.Strings[11] := '   AND (B.CONTROLE = ' + #39 + 'T' + #39 + ')'
          else
          if (CmpRptCM.ParamByName('CONTROLE').AsString = 'Físico') then
             SQL.Strings[11] := '   AND (B.CONTROLE = ' + #39 + 'F' + #39 + ')'
          else
             SQL.Strings[11] := '';
          //----------------------------------------------------------------------------------
          if (CmpRptCM.ParamByName('GRUPO').AsInteger <> 0) then
             SQL.Strings[12] := '   AND (B.IDGRUPO = ' + inttostr(CmpRptCM.ParamByName('GRUPO').AsInteger) + ')'
          else
             SQL.Strings[12] := '';
          //----------------------------------------------------------------------------------
          if (CmpRptCM.ParamByName('CLASSE').AsInteger <> 0) then
             SQL.Strings[13] := '   AND (B.IDCLASSEBEM = ' + inttostr(CmpRptCM.ParamByName('CLASSE').AsInteger) + ')'
          else
             SQL.Strings[13] := '';
          //----------------------------------------------------------------------------------
          if (CmpRptCM.ParamByName('LOCALIZACAO').AsInteger <> 0) then
             SQL.Strings[14] := '   AND (C.IDLOCALIZACAO = ' + inttostr(CmpRptCM.ParamByName('LOCALIZACAO').AsInteger) + ')'
          else
             SQL.Strings[14] := '';
          //----------------------------------------------------------------------------------
          if (CmpRptCM.ParamByName('RESPONSAVEL').AsInteger <> 0) then
             SQL.Strings[15] := '   AND (C.IDRESPONSAVEL = ' + inttostr(CmpRptCM.ParamByName('RESPONSAVEL').AsInteger) + ')'
          else
             SQL.Strings[15] := '';
          //----------------------------------------------------------------------------------
          if (CmpRptCM.ParamByName('CONJUNTO').AsInteger <> 0) then
             SQL.Strings[16] := '   AND (B.IDCONJUNTO = ' + inttostr(CmpRptCM.ParamByName('CONJUNTO').AsInteger) + ')'
          else
             SQL.Strings[16] := '';
          //----------------------------------------------------------------------------------
          case CmpRptCM.ParamByName('ORDENACAO').AsInteger  of
             0: SQL.Strings[22] := ' ORDER BY L.NOME, CB.DESCRICAO, B.DESBEM';
             1: SQL.Strings[22] := ' ORDER BY L.NOME, CB.DESCRICAO, B.PLACA';
          else
             SQL.Strings[22] := ' ORDER BY L.NOME, CB.DESCRICAO, B.DESBEM';
          end;
       end;
       //-------------------------------------------------------------------------------------
       ppLabel40.Caption := 'Relação de Bens para Levantamento do Inventário Patrimonial';
       sMensagem := '';

       sqlInvPat.Prepare;
       sqlInvPat.ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
       sqlInvPat.Open;
       if cdsInvPat.IsEmpty then
          sMensagem := 'Não existem bens atendendo os paramêtros fornecidos!';

   Except
    On E:Exception Do
    Begin
       CMDebugToFile('Erro no Relatório de Relação de Bens para Inv. Patrimoniais:' + sMensagem + (#13+#10) + E.Message );
    End;
  End;


end;

end.
