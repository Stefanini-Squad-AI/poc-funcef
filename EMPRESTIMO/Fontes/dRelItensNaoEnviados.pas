unit dRelItensNaoEnviados;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Alteracao   : qryItensNaoEnviados
SIG         : 131775                                 
Autor(a)    : Leandro
Data        : 02/08/2023
Alteração   : Alteração query obter campo ORIGEM
----------------------------------------------------------------------------------------------------
Rotina    : rptItensNaoEnviados
Data      : 15/02/207
Autor     : Alberto
Pendencia : 23526
Descrição : Alterado atributo NoDataBehaviors.ndBlankReport de false para true
---------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppModule, raCodMod;

type
   TdtmRelItensNaoEnviados = class(TdtmReports)
      pplItensNaoEnviados: TppBDEPipeline;
      dtsItensNaoEnviados: TwwDataSource;
      rptItensNaoEnviados: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppDetalhe: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppDBText1: TppDBText;
      ppLabel122: TppLabel;
      ppShape3: TppShape;
      ppLabel13: TppLabel;
      qryItensNaoEnviados: TwwQuery;
      ppDBText4: TppDBText;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppDBText2: TppDBText;
      ppDBText5: TppDBText;
      ppLabel11: TppLabel;
      ppDBText6: TppDBText;
      ppDBText9: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel12: TppLabel;
      ppDBText3: TppDBText;
      ppLabel6: TppLabel;
      qryItensNaoEnviadosIDCONTRATOEMPTMO: TFloatField;
      qryItensNaoEnviadosMATRICULA: TStringField;
      qryItensNaoEnviadosNOME: TStringField;
      qryItensNaoEnviadosTCEDESCRICAO: TStringField;
      qryItensNaoEnviadosCOMPETENCIA: TStringField;
      qryItensNaoEnviadosIDITEMEMPTMO: TFloatField;
      qryItensNaoEnviadosITEDESCRICAO: TStringField;
      qryItensNaoEnviadosHMEVLRPREVISTO: TFloatField;
      qryItensNaoEnviadosHMEANOCOMPETENCIA: TFloatField;
      qryItensNaoEnviadosHMEMESCOMPETENCIA: TFloatField;
      qryItensNaoEnviadosPARCELA: TFloatField;
      qryItensNaoEnviadosPARCELAS_RESTANTES: TFloatField;
      qryItensNaoEnviadosHMEFORMACOBRANCA: TStringField;
      qryItensNaoEnviadosFORMA_COBRANCA: TStringField;
      qryItensNaoEnviadosHMETIPOFOLHA: TStringField;
      qryItensNaoEnviadosTIPO_FOLHA: TStringField;
      ppDBText10: TppDBText;
      ppLine1: TppLine;
      ppLine3: TppLine;
      ppShape1: TppShape;
      qryItensNaoEnviadosEVENTO: TFloatField;
      qryItensNaoEnviadosDESC_EVENTO: TStringField;
      qryItensNaoEnviadosSITDESCRICAO: TStringField;
      ppLabel15: TppLabel;
      ppDBText12: TppDBText;

      procedure ppShape3Print(Sender: TObject);
      procedure ppLabel13Print(Sender: TObject);
      procedure ppLine1Print(Sender: TObject);


   private  //  declarations

      //    Cores:
      //    ColorA = $FFFFFF     branco, clWhite
      //    ColorC = $00C0FFFF   amarelo - pastel
      //    ColorD = $00C6F9CC   verde - pastel
      //    ColorE = $00F3E6CD   azul - pastel
      //    ColorF = $00A0A0A0
      //    ColorG = $00BEBEBE
      //    ColorH = $00D2D2D2
      //    ColorI = $00E3E3E3

      //             $00E8E8E8   cinza bem claro

   public   // Public declarations

      sMesCobranca      : String;
      bSeparador        : Boolean;
      CorLinha          : TColor;
      CorAtual          : TColor;
      bCorLinha         : Boolean;

      function MostraParam(Form: string): boolean; override;

   end;



var
  dtmRelItensNaoEnviados: TdtmRelItensNaoEnviados;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, uSistema, cRelItensNaoEnviados;




function TdtmRelItensNaoEnviados.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelitensnaoenviados') then begin
      frm := TcfgRelItensNaoEnviados.Create(Application);
   end else begin
      frm := nil;
   end;

   if frm = nil then begin
      Result := False;
      Exit;
   end;

   with frm do begin
      Result := (ShowModal = mrOk);
      Free;
   end;
end;



procedure TdtmRelItensNaoEnviados.ppShape3Print(Sender: TObject);
begin
   inherited;

   if bCorLinha then begin
      if CorAtual = clWhite then begin
         CorAtual := CorLinha;
      end else begin
         CorAtual := clWhite;
      end;
   end else begin
      CorAtual := clWhite;
   end;

   (Sender as TppShape).Brush.Color := CorAtual;
end;



procedure TdtmRelItensNaoEnviados.ppLabel13Print(Sender: TObject);
begin
   inherited;
   TppLabel(Sender).Caption := sMesCobranca;
end;



procedure TdtmRelItensNaoEnviados.ppLine1Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



end.
