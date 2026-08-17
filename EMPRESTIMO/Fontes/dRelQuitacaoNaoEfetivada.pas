{---------------------------Alteração-------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit dRelQuitacaoNaoEfetivada;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppMemo, ppStrtch, ppRichTx;

type
   TdtmRelQuitacaoNaoEfetivada = class(TdtmReports)
      pplQuitacaoNaoEfetivada: TppBDEPipeline;
      dsQuitacaoNaoEfetivada: TwwDataSource;
      rptQuitacaoNaoEfetivada: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppSummaryBand1: TppSummaryBand;
      rptContrato: TppShape;
      ppLine4: TppLine;
      ppDBText5: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppGroupFooterBand3: TppGroupFooterBand;
      qryQuitacaoNaoEfetivada: TwwQuery;
      ppDBText13: TppDBText;
      ppShape1: TppShape;
      ppLine1: TppLine;
      ppLabel5: TppLabel;
      ppDBText1: TppDBText;
      ppDBText4: TppDBText;
      ppLabel7: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
    ppLine3: TppLine;
    ppDBText6: TppDBText;
    ppLabel4: TppLabel;
    qryQuitacaoNaoEfetivadaTCEDESCRICAO: TStringField;
    qryQuitacaoNaoEfetivadaIDCONTRATOEMPTMO: TFloatField;
    qryQuitacaoNaoEfetivadaINSCRICAONUMERO: TFloatField;
    qryQuitacaoNaoEfetivadaMATRICULA: TStringField;
    qryQuitacaoNaoEfetivadaNOME: TStringField;
    qryQuitacaoNaoEfetivadaHMEPARCELA: TFloatField;
    qryQuitacaoNaoEfetivadaHMEDATAPREVISTA: TDateTimeField;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    memPatro: TppRichText;
    memPlano: TppRichText;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    lblTipoEmptmo: TppLabel;
    lblTipoContr: TppLabel;
    ppMemo2: TppMemo;
    ppMemo1: TppMemo;

      procedure rptContratoPrint(Sender: TObject);
    procedure ppLine3Print(Sender: TObject);
    procedure qryQuitacaoNaoEfetivadaBeforeOpen(DataSet: TDataSet);

   private  // Private declarations

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

      bSeparador  : Boolean;
      CorLinha    : TColor;
      CorAtual    : TColor;
      bCorLinha   : Boolean;

      function MostraParam(Form: string): boolean; override;

  end;



var
  dtmRelQuitacaoNaoEfetivada: TdtmRelQuitacaoNaoEfetivada;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, cRelQuitacaoNaoEfetivada, uSistema;


function TdtmRelQuitacaoNaoEfetivada.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   if (LowerCase(Form) = 'cfgrelquitacaonaoefetivada') then begin
      frm := TcfgRelQuitacaoNaoEfetivada.Create(Application);
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



procedure TdtmRelQuitacaoNaoEfetivada.rptContratoPrint(Sender: TObject);
begin
   inherited;

   if bCorLinha then
   begin
      if CorAtual = clWhite then
      begin
         CorAtual := CorLinha;
      end
      else
      begin
         CorAtual := clWhite;
      end;
   end
   else
   begin
      CorAtual := clWhite;
   end;

   (Sender as TppShape).Brush.Color := CorAtual;
end;



procedure TdtmRelQuitacaoNaoEfetivada.ppLine3Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelQuitacaoNaoEfetivada.qryQuitacaoNaoEfetivadaBeforeOpen(DataSet: TDataSet);
begin
   inherited;

   // Grava o SQL na pasta TEMP
   // Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
   // qryQuitacaoNaoEfetivada.SQL.SaveToFile(Sistema.TempDir + 'EP-RelQuitacaoNaoEfetivada.txt');
      qryQuitacaoNaoEfetivada.SQL.SaveToFile(ftempregra + '\' + 'EP-RelQuitacaoNaoEfetivada.txt');
   Application.ProcessMessages;
end;



end.


