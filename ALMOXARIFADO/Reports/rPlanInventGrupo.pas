unit rPlanInventGrupo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppDB, ppDBPipe, ppDBBDE,
  Db, Wwdatsrc, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, DBClient, uCMClientDataSet,
  uCmSqlParams, MontaSelect;

type
  TrptPlanInventGrupo = class(TFrmCmReport)
    sqlPlanInventGrp: TCMSqlParams;
    cdsPlanInventGrp: TCMClientDataSet;
    rptPlanInventGrp: TppReport;
    ppHeaderBand8: TppHeaderBand;
    ppLabel35: TppLabel;
    LblEmpresa: TppLabel;
    rptPlanInventGrpLabel1: TppLabel;
    lbAlmox5: TppLabel;
    ppDetailBand8: TppDetailBand;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLine14: TppLine;
    ppDBText10: TppDBText;
    rptPlanInventGrpDBText3: TppDBText;
    ppFooterBand8: TppFooterBand;
    ppLine15: TppLine;
    lblSistema: TppLabel;
    ppCalc14: TppSystemVariable;
    ppCalc15: TppSystemVariable;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    rptPlanInventGrpLine1: TppLine;
    ppGroupFooterBand3: TppGroupFooterBand;
    rptPlanInventGrpGroup1: TppGroup;
    rptPlanInventGrpGroupHeaderBand1: TppGroupHeaderBand;
    ppLine16: TppLine;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLine17: TppLine;
    ppLabel43: TppLabel;
    rptPlanInventGrpDBText1: TppDBText;
    rptPlanInventGrpDBText2: TppDBText;
    rptPlanInventGrpLabel2: TppLabel;
    rptPlanInventGrpGroupFooterBand1: TppGroupFooterBand;
    dsPlanInventGrp: TwwDataSource;
    bdePlanInventGrp: TppBDEPipeline;
    MsPlanInventGrupo: TMontaSelect;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptPlanInventGrupo: TrptPlanInventGrupo;
  sNomeAlmox: String = '';

implementation

{$R *.DFM}

procedure TrptPlanInventGrupo.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  With sqlPlanInventGrp Do Begin
       Close;
       Sql.Text := 'SELECT I.IDINVENTARIO,   ' +
                   '       I.DATAINVENTARIO, ' +
                   '       D.CODARTIGO,      ' +
                   '       S.LOCALIZACAO,    ' +
                   '       G.DESCGRUPOPROD,  ' +
                   '       P.CODMEDCUSTO,    ' +
                   '       P.CODGRUPOPROD,   ' +
                   '       (P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR) AS DESCRICAO ' +
                   '  FROM INVENTAR I,  ' +
                   '       QTDECONT D,  ' +
                   '       GRUPPROD G,  ' +
                   '       PRODUTO P,   ' +
                   '       ARTIGO A,    ' +
                   '       SALDO S      ' +
                   ' WHERE (I.CONTAGEMENCERRADA = ''F'')' +
                   '   AND (S.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ')' +
                   '   AND (I.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ')' +
                   '   AND (I.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ')' +
                   '   AND (S.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ')';

       If CmpRptCM.ParamValues[ 3 ].AsBoolean Then
          Sql.Add('  AND (P.ITEMESTOCAVEL = ''S'')');

       If not CmpRptCM.ParamValues[ 1 ].IsNull Then
          Sql.Add(' AND I.IDINVENTARIO = ' + CmpRptCM.ParamValues[ 1 ].AsString )
       Else
          If not CmpRptCM.ParamValues[ 2 ].IsNull Then
             Sql.Add(' AND I.DATAINVENTARIO = TO_DATE(''' + CmpRptCM.ParamValues[ 2 ].AsString + ''',''DD/MM/YYYY'')');

       Sql.Add('   AND (I.IDINVENTARIO = D.IDINVENTARIO) ' +
               '   AND (A.CODARTIGO = D.CODARTIGO)       ' +
               '   AND (A.CODARTIGO = S.CODARTIGO(+))    ' +
               '   AND (P.CODGRUPOPROD = G.CODGRUPOPROD) ' +
               '   AND (P.CODPRODUTO =  A.CODPRODUTO)    ' );
       Sql.Add(' ORDER BY I.IDINVENTARIO, P.CODGRUPOPROD, DESCRICAO ');

       lbAlmox5.Text := sNomeAlmox;
       Open;
   end;
end;

procedure TrptPlanInventGrupo.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'Almoxarifado' ).LookupSettings.SQL.Text := 'SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX WHERE IDPESSOA = ' + FloatToStr( CrmRptCM.idEmpresa ) + ' ORDER BY 2';

  With CmpRptCM.ParamByName( 'NumInvent' ).MontaSelect.Filtro Do Begin
       Clear;
       Add( 'CONTAGEMENCERRADA = ''F''' );
       Add( 'IDPESSOA = ' + FloatToStr( CrmRptCM.idEmpresa ) );
  End;
end;

procedure TrptPlanInventGrupo.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
  Case Index of
       0: Begin
          sNomeAlmox := Sender.CtrlLookup.Text;

          If Sender.CtrlLookup.LookupValue = '' Then Begin
             If CmpRptCM.ParamByName( 'NumInvent' ).MontaSelect.Filtro.Count = 3 Then
                CmpRptCM.ParamByName( 'NumInvent' ).MontaSelect.Filtro.Delete( 2 );
          End Else
             If CmpRptCM.ParamByName( 'NumInvent' ).MontaSelect.Filtro.Count = 2 Then
                CmpRptCM.ParamByName( 'NumInvent' ).MontaSelect.Filtro.Add( 'CODALMOXARIFADO = ' + Sender.CtrlLookup.LookupValue )
             Else
                CmpRptCM.ParamByName( 'NumInvent' ).MontaSelect.Filtro[ 2 ] := 'CODALMOXARIFADO = ' + Sender.CtrlLookup.LookupValue;
       End;
  End;
end;

end.

