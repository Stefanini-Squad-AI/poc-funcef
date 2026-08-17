{---------------------------Alteração-------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit dRelItensAberto;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppDB, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
   ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
   ppDBPipe, ppDBBDE, ppStrtch, ppRichTx;

type
   TdtmRelItensAberto = class(TdtmReports)
      pplItensAberto: TppBDEPipeline;
      dtsItensAberto: TwwDataSource;
      qryItensAberto: TwwQuery;
      rptItensAberto: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppShape3: TppShape;
      ppLine4: TppLine;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel15: TppLabel;
      ppDBText11: TppDBText;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      ppLabel20: TppLabel;
      ppDBText2: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppLabel12: TppLabel;
      ppLabel26: TppLabel;
      ppLabel4: TppLabel;
      ppDBText7: TppDBText;
      ppDBText1: TppDBText;
      ppLabel106: TppLabel;
      ppLabel105: TppLabel;
      ppDBText15: TppDBText;
      ppLabel8: TppLabel;
      ppDBText6: TppDBText;
      ppDBText8: TppDBText;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppDBText10: TppDBText;
      ppDBText16: TppDBText;
      ppLabel21: TppLabel;
      ppDBText3: TppDBText;
      qryItensAbertoIDCONTRATOEMPTMO: TFloatField;
      qryItensAbertoMATRICULA: TStringField;
      qryItensAbertoINSCRICAONUMERO: TFloatField;
      qryItensAbertoNOME: TStringField;
      qryItensAbertoSITDESCRICAO: TStringField;
      qryItensAbertoHMEPARCELA: TFloatField;
      qryItensAbertoHMENUMPARCELAS: TFloatField;
      qryItensAbertoCOMPETENCIA: TStringField;
      qryItensAbertoCOBRANCA: TStringField;
      qryItensAbertoHMEVLRPREVISTO: TFloatField;
      qryItensAbertoHMEDATAPREVISTA: TDateTimeField;
      qryItensAbertoHMEDATAVENCTO: TDateTimeField;
      qryItensAbertoDESC_EVENTO: TStringField;
      qryItensAbertoITEDESCRICAO: TStringField;
      qryItensAbertoDESCSITCONTRATO: TStringField;
      ppDBText9: TppDBText;
      ppDBText12: TppDBText;
      ppShape1: TppShape;
      qryItensAbertoHMESEQCOBRANCA: TFloatField;
      ppDBText13: TppDBText;
      ppLabel11: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    memPatro: TppRichText;
    memPlano: TppRichText;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    lblTipoEmptmo: TppLabel;
    lblTipoContr: TppLabel;

      procedure ppLine4Print(Sender: TObject);
      procedure ppShape3Print(Sender: TObject);
      procedure ppLine3Print(Sender: TObject);
    procedure qryItensAbertoBeforeOpen(DataSet: TDataSet);


   private { Private declarations }

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

   public { Public declarations }

      bSeparador  : Boolean;
      CorLinha    : TColor;
      CorAtual    : TColor;
      bCorLinha   : Boolean;

      function MostraParam(Form: string): boolean; override;

   end;



var
  dtmRelItensAberto: TdtmRelItensAberto;



implementation
{$R *.DFM}
uses
   uFuncoesEmptmo, uSistema, cRelItensAberto;



function TdtmRelItensAberto.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelitensaberto') then begin
      frm := TcfgRelItensAberto.Create(Application);
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



procedure TdtmRelItensAberto.ppLine4Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelItensAberto.ppShape3Print(Sender: TObject);
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



procedure TdtmRelItensAberto.ppLine3Print(Sender: TObject);
begin
   inherited;
   CorAtual := clWhite;
end;



procedure TdtmRelItensAberto.qryItensAbertoBeforeOpen(DataSet: TDataSet);
begin
   inherited;
 //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
 //qryItensAberto.SQL.SaveToFile(Sistema.TempDir + 'EP-RelItensAberto.txt');
   qryItensAberto.SQL.SaveToFile(ftempregra + '\' + 'EP-RelItensAberto.txt');
   Application.ProcessMessages;
end;



end.
