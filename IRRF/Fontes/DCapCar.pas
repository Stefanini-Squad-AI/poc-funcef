unit DCapCar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Wwdatsrc, Wwquery, MontaSelect, ppDB, ppPrnabl, ppClass,
  ppCtrls, ppBands, ppProd, ppReport, ppComm, ppCache, ppTxPipe;

type
  TDtmCapCar = class(TDataModule)
    qryAdtoPendente: TwwQuery;
    qryAdtoPendenteSTATUS: TStringField;
    qryAdtoPendenteRAZAOSOCIAL: TStringField;
    qryAdtoPendenteDOCUM: TStringField;
    qryAdtoPendenteVALRES: TFloatField;
    qryAdtoPendenteVLRBAIXA: TFloatField;
    qryAdtoPendenteDATALANCTO: TDateTimeField;
    qryAdtoPendenteDATAVENCTO: TDateTimeField;
    qryAdtoPendenteCODDOCUMENTO: TFloatField;
    dsAdtoPendente: TwwDataSource;
    updAdtoPendente: TUpdateSQL;
    qryPrevPendente: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    FloatField3: TFloatField;
    dsPrevPendente: TwwDataSource;
    updPrevPendente: TUpdateSQL;
    QryModeloAutPag: TwwQuery;
    QryModeloAutPagNUMFATURA: TFloatField;
    QryModeloAutPagCODDOCUMENTO: TFloatField;
    QryModeloAutPagNUMAPGR: TFloatField;
    QryModeloAutPagREFERENCIA: TStringField;
    QryModeloAutPagNODOCUMENTO: TFloatField;
    QryModeloAutPagCOMPLDOCUMENTO: TStringField;
    QryModeloAutPagDATAVENCTO: TDateTimeField;
    QryModeloAutPagNUMDOCUMENTO: TStringField;
    QryModeloAutPagVALOR: TFloatField;
    QryModeloAutPagVALOROUTRAMOEDA: TFloatField;
    QryModeloAutPagRAZAOSOCIAL: TStringField;
    QryModeloAutPagDESCRICAO: TStringField;
    QryModeloAutPagVALORRATEIO: TFloatField;
    QryModeloAutPagDESCTDR: TStringField;
    QryModeloAutPagNOMEAP: TStringField;
    QryModeloAutPagNOMECR: TStringField;
    QryModeloAutPagNOMECC: TStringField;
    QryModeloAutPagOBS: TMemoField;
    QryModeloAutPagNUMBANCO: TStringField;
    QryModeloAutPagNUMAGENCIA: TStringField;
    QryModeloAutPagCONTACORRENTE: TStringField;
    QryModeloAutPagFLGDOCBANCARIO: TStringField;
    QryModeloAutPagVLACRE: TFloatField;
    QryModeloAutPagVLDEC: TFloatField;
    QryModeloAutPagVLIMP: TFloatField;
    QryModeloAutPagVLLIQ: TFloatField;
    QryModeloAutPagTRGUSERINCLUSAO: TStringField;
    QryModeloAutPagNOMEUSUARIO: TStringField;
    QryModeloAutPagTRGDTINCLUSAO: TDateTimeField;
    QryModeloAutPagTOTVALORBRUTO: TFloatField;
    QryModeloAutPagTOTVALORDEDUCOES: TFloatField;
    QryModeloAutPagTOTVALORACRESCIMO: TFloatField;
    QryModeloAutPagTOTVALORIMPOSTO: TFloatField;
    QryModeloAutPagTOTVALORAPAGAR: TFloatField;
    QryModeloAutPagSUMVALORBRUTO: TFloatField;
    QryModeloAutPagSUMVALORDEDUCOES: TFloatField;
    QryModeloAutPagSUMVALORACRESCIMO: TFloatField;
    QryModeloAutPagSUMVALORIMPOSTO: TFloatField;
    QryModeloAutPagSUMVALORAPAGAR: TFloatField;
    QryModeloAutPagNUMIMOVEL: TStringField;
    QryModeloAutPagNOMEPATRO: TStringField;
    QryModeloAutPagDESCPLANO: TStringField;
    QryModeloAutPagDESCPROGRAMA: TStringField;
    QryModeloAutPagDATAEMISSAO: TDateTimeField;
    QryModeloAutPagDATAPROGRAMADA: TDateTimeField;
    Qrydemsintgest: TwwQuery;
    QrydemsintgestCODTIPRECDES: TStringField;
    QrydemsintgestDESCRICAO: TStringField;
    QrydemsintgestVALORATU: TFloatField;
    QrydemsintgestVALORANT: TFloatField;
    QrydemsintgestANASINT: TStringField;
    QryModeloAutPagIDFORCLI: TFloatField;
    QryModeloAutPagVALOLANCTOLIQ: TFloatField;
    QryModeloAutPagSUMVALOLANCTOLIQ: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
    function BuscaLInhaTrocaFiltro(iOrdemdoFiltro: Shortint; QryBusca: TwwQuery): Integer;
    procedure AddFiltro(iOrdemdoFiltro: Shortint; QryBusca: TwwQuery; sSql: string);
  end;
  
var
  DtmCapCar: TDtmCapCar;
  
implementation

{$R *.DFM}

uses uIntegraBack, uMensErro;

//Busca linha para adicioinar filtro dos relatórios:
// Demonstrativo de gestão
// Autorização de Pagamento
// Lançamento de Documentos
function TDtmCapCar.BuscaLInhaTrocaFiltro(iOrdemdoFiltro: Shortint; QryBusca: TwwQuery): Integer;
begin
  Result := QryBusca.Sql.IndexOf('-- #ADF' + IntToStr(iOrdemdoFiltro));
  if Result = -1 then
    MsgDlg('Erro ao filtrar relatório por Centro de Custo/Data na posição "' + IntToStr(iOrdemdoFiltro) + '".', 'Erro', mtError,[mbOK], 0);
end;

procedure TDtmCapCar.AddFiltro(iOrdemdoFiltro: Shortint; QryBusca: TwwQuery; sSql: string);
var
  iLinha :Integer;
Begin
  begin
    iLinha := BuscaLInhaTrocaFiltro(iOrdemdoFiltro, QryBusca);
    if iLinha > 0 then
      QryBusca.Sql.Insert(iLinha, sSql);
  end;
End;

end.

