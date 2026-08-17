{===============================================================================
Analista : Marcus Oliveira
Pendência: 23848
Data: 13/11/2006
Descrição: Relatório sintético e pendentes dos processos RADG
===============================================================================}

unit rProcessoRad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, ppBands, ppCache,
  ppClass, ppComm, ppRelatv, ppProd, ppReport, ppCtrls, ppVar, ppPrnabl,
  ppDB, ppDBPipe, Db, DBClient, uCMClientDataSet, uCmSqlParams, uCtrlRadPlus,
  ppStrtch, ppMemo, uCtrlPadroes, uSistema, StdCtrls, FConsultaRAD, uCtrlRadTipoProc;

type
  TFrmRptProcessoRAD = class(TFrmCmReport)
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBPipeline1: TppDBPipeline;
    ppLblTitulo: TppLabel;
    ppLine4: TppLine;
    lblSistema: TppLabel;
    ppCalc5: TppSystemVariable;
    ppCalc6: TppSystemVariable;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    pplblSituacao: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLine1: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDbSituacao: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    cdsProc: TCMClientDataSet;
    dsProc: TDataSource;
    ppDBMemo1: TppDBMemo;
    pplblClassif: TppLabel;
    ppdbtxtClassif: TppDBText;
    shapeZebra: TppShape;
    cdsLogo: TCMClientDataSet;
    dsLogo: TDataSource;
    dbLogo: TppDBPipeline;
    ppDBImage3: TppDBImage;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure shapeZebraPrint(Sender: TObject);
  private
    CtrlRadTipoProc : TCtrlRadTipoProc;
    CtrlRadPlus: TCtrlRadPlus;
    frmConsultaRad : TfrmConsultaRad;
    FCdsTeste: TClientDataSet;
    procedure SetCdsTeste(const Value: TClientDataSet);

    { Private declarations }
  public
    { Public declarations }

  end;

var
  FrmRptProcessoRAD: TFrmRptProcessoRAD;

implementation


{$R *.DFM}



procedure TFrmRptProcessoRAD.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    CtrlRadPlus.free;
    frmConsultaRAD.free;
    CtrlRadTipoProc.free;
    
end;

procedure TFrmRptProcessoRAD.SetCdsTeste(const Value: TClientDataSet);
begin
  FCdsTeste := Value;
end;

procedure TFrmRptProcessoRAD.CrmRptCMBeforePrint(Sender: TObject);
var
iQtde, iQtdeOutros: integer;

begin
  inherited;
    //Logo
    CtrlRadTipoProc := TCtrlRadTipoProc.Create;
    CtrlRadTipoProc.InitializeAs( Padroes );
    cdsLogo.Data := CtrlRadTipoProc.ListaImagem ( Sistema.IdEmpresa ) ;


    CtrlRadPlus := TCtrlRadPlus.Create;
    CtrlRadPlus.InitializeAs(Padroes);
    cdsProc.Close;
    //Carrega o relatório: 'Processos Pendentes no RAD'
    if CmpRptCM.ParamValues[0].AsInteger = 0 then

       begin
          ppLblTitulo.Caption := 'Processos Pendentes no RAD';
          pplblSituacao.Visible := False;
          ppDbSituacao.Visible  := False;
          cdsProc.data := CtrlRadPlus.ConsultaProcessos(Sistema.IdUsuario, iQtde, iQtdeOutros,
                          CmpRptCM.ParamValues[1].AsBoolean, CmpRptCM.ParamValues[2].AsBoolean,
                          CmpRptCM.ParamValues[3].AsBoolean, CmpRptCM.ParamValues[4].AsBoolean);
     //Filtro
          case CmpRptCM.ParamValues[5].AsInteger of
            1 : cdsProc.IndexFieldNames := 'IDPROCESSO';
            2 : cdsProc.IndexFieldNames := 'CLASSIFICACAO';
            3 : cdsProc.IndexFieldNames := 'DATAINIPROCESSO';
          end;

       end

    //Carrega o relatório: 'Relatório Sintético de Processos RAD'
    else if CmpRptCM.ParamValues[0].AsInteger = 1 then
    begin
       ppLblTitulo.Caption := 'Relatório Sintético dos Processos RAD';
       ppdbtxtClassif.Visible := False;
       pplblClassif.Visible   := False;
       cdsProc.Data := oUltimoResultado;
    //Filtro
       case iOrdem of
         1 : cdsProc.IndexFieldNames := 'IDPROCESSO';
         2 : cdsProc.IndexFieldNames := 'SITUACAO';
         3 : cdsProc.IndexFieldNames := 'DATAINIPROCESSO';
       end;
    end;

end;

procedure TFrmRptProcessoRAD.shapeZebraPrint(Sender: TObject);
begin
  inherited;
  //Faz o Zebrado para ambos os Relatórios
  if (shapeZebra.Brush.Color = clwhite) and (cdsProc.RecNo > 1) then
     shapeZebra.Brush.Color := clSilver
     else
     shapeZebra.Brush.Color := clwhite;
end;

end.
