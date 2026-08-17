unit rRequisicao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppCtrls,
  ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppProd, ppReport, Wwdatsrc,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, uCmRptManager, TXComp,
  CmParamReport;

type
  TRptRequisicao = class(TFrmCmReport)
    pplRequisicao: TppBDEPipeline;
    dsRequisicao: TwwDataSource;
    rpRequisicao: TppReport;
    ppHeaderBand1: TppHeaderBand;
    LblEmpresa: TppLabel;
    rpExtratoContaLabel10: TppLabel;
    lbData: TppLabel;
    ppLabel1: TppLabel;
    rpRequisicaoLabel13: TppLabel;
    LbTipo: TppLabel;
    ppDetailBand1: TppDetailBand;
    rpRequisicaoDBText4: TppDBText;
    rpRequisicaoDBText6: TppDBText;
    rpRequisicaoDBText8: TppDBText;
    rpRequisicaoDBText5: TppDBText;
    rpRequisicaoDBText9: TppDBText;
    rpRequisicaoDBText7: TppDBText;
    rpRequisicaoDBText12: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    LblSistema: TppLabel;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    rpRequisicaoGroup3: TppGroup;
    rpRequisicaoGroupHeaderBand3: TppGroupHeaderBand;
    rpRequisicaoLabel10: TppLabel;
    rpRequisicaoDBText10: TppDBText;
    rpRequisicaoGroupFooterBand3: TppGroupFooterBand;
    rpRequisicaoLabel12: TppLabel;
    rpRequisicaoLine3: TppLine;
    rpRequisicaoLine4: TppLine;
    rpRequisicaoDBCalc2: TppDBCalc;
    rpRequisicaoGroup1: TppGroup;
    rpRequisicaoGroupHeaderBand1: TppGroupHeaderBand;
    rpRequisicaoDBText1: TppDBText;
    rpRequisicaoLabel2: TppLabel;
    rpRequisicaoLine1: TppLine;
    rpRequisicaoLine2: TppLine;
    rpRequisicaoGroupFooterBand1: TppGroupFooterBand;
    rpRequisicaoGroup2: TppGroup;
    rpRequisicaoGroupHeaderBand2: TppGroupHeaderBand;
    rpRequisicaoLabel8: TppLabel;
    rpRequisicaoLabel1: TppLabel;
    rpRequisicaoLabel3: TppLabel;
    rpRequisicaoDBText3: TppDBText;
    rpRequisicaoLabel9: TppLabel;
    rpRequisicaoDBText2: TppDBText;
    rpRequisicaoLabel6: TppLabel;
    rpRequisicaoLabel5: TppLabel;
    rpRequisicaoLabel7: TppLabel;
    rpRequisicaoDBText11: TppDBText;
    rpRequisicaoLabel4: TppLabel;
    rpRequisicaoLabel14: TppLabel;
    rpRequisicaoGroupFooterBand2: TppGroupFooterBand;
    rpRequisicaoLabel11: TppLabel;
    rpRequisicaoDBCalc1: TppDBCalc;
    SqlParRequisicao: TCMSqlParams;
    CdsRequisicao: TCMClientDataSet;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure SqlParRequisicaoFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptRequisicao: TRptRequisicao;

implementation

Uses uSistema;

{$R *.DFM}

procedure TRptRequisicao.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'Almoxarifado' ).LookupSettings.SQL.Text := 'SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX WHERE IDPESSOA = ' + FloatToStr( CrmRptCM.idEmpresa ) + ' ORDER BY 2';
  CmpRptCM.ParamByName( 'Centro de Custo' ).LookupSettings.SQL.Text := 'SELECT CODCENTROCUSTO, NOME FROM CENTCUST WHERE IDEMPRESA = '+ FloatToStr( CrmRptCM.IdEmpresa ) + ' ORDER BY 2';
  CmpRptCM.ParamByName( 'DataInicial' ).TextDefault := DateToStr( Date );
  CmpRptCM.ParamByName( 'DataFinal' ).TextDefault   := DateToStr( Date );
end;

procedure TRptRequisicao.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  LbTipo.Caption := CmpRptCM.ParamByName( 'Ordenado por' ).RadioGroupSettings.Items[ CmpRptCM.ParamValues[ 6 ].AsInteger ];
  lbData.caption := 'De ' + CmpRptCM.ParamValues[ 0 ].AsString + ' a ' + CmpRptCM.ParamValues[ 1 ].AsString;

  With SqlParRequisicao Do Begin
       Prepare;

       If Not CmpRptCM.ParamValues[ 5 ].AsBoolean Then
          ParamByName( 'estoque' ).ClearLine;

       If Not CmpRptCM.ParamValues[ 4 ].IsNull Then Begin
          ParamByName( 'almox' ).ClearLine;
          ParamByName( 'ccusto' ).ClearLine;
          ParamByName( 'tipomov' ).ClearLine;
          ParamByName( 'dataini' ).ClearLine;
          ParamByName( 'datafim' ).ClearLine;
          ParamByName( 'numreq' ).AsString := Trim( CmpRptCM.ParamValues[ 5 ].AsString );
       End Else Begin
          ParamByName( 'numreq' ).ClearLine;

          If CmpRptCM.ParamValues[ 2 ].IsNull Then
             ParamByName( 'almox' ).ClearLine;

          If CmpRptCM.ParamValues[ 3 ].IsNull Then
             ParamByName( 'ccusto' ).ClearLine;

          ParamByName( 'dataini' ).AsDate := CmpRptCM.ParamValues[ 0 ].AsDateTime;
          ParamByName( 'datafim' ).AsDate := CmpRptCM.ParamValues[ 1 ].AsDateTime;

          If Not CmpRptCM.ParamValues[ 2 ].IsNull Then
             ParamByName( 'almox' ).AsInteger := CmpRptCM.ParamValues[ 2 ].AsInteger;

          If Not CmpRptCM.ParamValues[ 3 ].IsNull Then
             ParamByName( 'ccusto' ).AsString := CmpRptCM.ParamValues[ 3 ].AsString;
       End;

       If CmpRptCM.ParamValues[ 5 ].AsBoolean Then
          ParamByName( 'estoque' ).AsString := 'S';

       ParamByName( 'idempresa' ).AsFloat := CrmRptCM.IdEmpresa;
       Open;
    End;
end;

procedure TRptRequisicao.SqlParRequisicaoFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  If UpperCase( sParamName ) = 'TIPOMOV' Then Begin
     Case CmpRptCM.ParamValues[ 6 ].AsInteger Of
          0: sNewValue := '( M.CODTIPOMOV <> ''Z'' ) AND ( M.CODTIPOMOV <> ''A'' ) AND ( M.CODTIPOMOV <> ''K'' ) AND ( M.CODTIPOMOV <> ''B'' )';
          1: sNewValue := '( ( M.CODTIPOMOV = ''E'' ) OR ( M.CODTIPOMOV = ''P'' ) )';
          2: sNewValue := '( M.CODTIPOMOV = ''I'')';
          3: sNewValue := '( M.CODTIPOMOV IN ( ''F'', ''T'', ''G'', ''U'', ''R'', ''S'' ) )';
     End;
  End Else
    If UpperCase( sParamName ) = 'ORDEM' Then
       If CmpRptCM.ParamValues[ 7 ].AsInteger = 0 Then
          sNewValue := 'DESCRICAO'
       Else
          sNewValue := 'M.IDMOV';
end;

end.
