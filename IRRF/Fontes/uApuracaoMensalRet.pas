unit uApuracaoMensalRet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, ComCtrls, Grids,
  Wwdbigrd, Wwdbgrid, TREdit;

type
  TfrmApuracaoMensalRET = class(TfrmOkCancelar)
    PageControl: TPageControl;
    tbsApuracaoSint: TTabSheet;
    tbsApuracaoAnalit: TTabSheet;
    qryApuracaoSint: TwwQuery;
    qryApuracaoAnalit: TwwQuery;
    qryApuracaoSintIDORIGEMIRLITIGIO: TFloatField;
    qryApuracaoSintRENDIMENTO: TFloatField;
    qryApuracaoSintVLRIRLITIGIO: TFloatField;
    qryApuracaoAnalitIDORIGEMIRLITIGIO: TFloatField;
    qryApuracaoAnalitDATAFATOGERADOR: TDateTimeField;
    qryApuracaoAnalitDESFATOGERADOR: TStringField;
    qryApuracaoAnalitRENDIMENTO: TFloatField;
    qryApuracaoAnalitVLRIRLITIGIO: TFloatField;
    qryApuracaoAnalitIDMODULO: TFloatField;
    qryApuracaoAnalitIDPLANOPREV: TFloatField;
    qryApuracaoAnalitNOMEPLANO: TStringField;
    qryApuracaoAnalitIDPATROCINADORA: TFloatField;
    qryApuracaoAnalitPATRO: TStringField;
    dsApuracao: TDataSource;
    dsApuracaoAnalit: TDataSource;
    wwDBGrid1: TwwDBGrid;
    qryApuracaoSintTIPO: TStringField;
    qryPatrocinadora: TwwQuery;
    chkInvestimento: TCheckBox;
    chkPatro: TCheckBox;
    edtTotalRendimento: TRealEdit;
    edtTotalIrApurado: TRealEdit;
    edtRendPatro: TRealEdit;
    edtIrPatro: TRealEdit;
    GroupBox1: TGroupBox;
    edtDataIni: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    edtDataFim: TDateTimePicker;
    btnProcessaApuracao: TSpeedButton;
    wwDBGrid2: TwwDBGrid;
    qryApuracao: TwwQuery;
    qryApuracaoTIPO: TStringField;
    qryApuracaoRENDIMENTO: TFloatField;
    qryApuracaoIDORIGEMIRLITIGIO: TFloatField;
    updApuracao: TUpdateSQL;
    Label3: TLabel;
    Label4: TLabel;
    qryHistCartInv: TwwQuery;
    DateTimeField1: TDateTimeField;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    StringField2: TStringField;
    FloatField6: TFloatField;
    StringField3: TStringField;
    qryPatrocinadoraCONTRIBUICAO: TFloatField;
    qryInsertIrLitigio: TwwQuery;
    qryUltTrimestre: TwwQuery;
    qryUltTrimestreDATAFATOGERADOR: TDateTimeField;
    qryInsertLancIRRF: TwwQuery;
    qryInsertLancxInforme: TwwQuery;
    Label6: TLabel;
    Label7: TLabel;
    qryInsertInforme: TwwQuery;
    procedure qryApuracaoSintAfterOpen(DataSet: TDataSet);
    procedure chkInvestimentoClick(Sender: TObject);
    procedure chkPatroClick(Sender: TObject);
    procedure PageControlChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure btnProcessaApuracaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    procedure LimpaParametros(const qry: TwwQuery);
    procedure GravaLancIRRF;
  public
    { Public declarations }
  end;

var
  frmApuracaoMensalRET: TfrmApuracaoMensalRET;

implementation

{$R *.DFM}

uses uDataBase, DBaseDados, uSistema, uDiasUteis;


procedure TfrmApuracaoMensalRET.LimpaParametros(const qry: TwwQuery);
var
   i: integer;
begin
   // fecha a query p/ evitar problemas
   qry.Close;

   // prepara a query se já não estiver preparada
   if not(qry.Prepared) then qry.Prepare;

   // zera os parâmetros
   for i := 0 to (qry.ParamCount - 1) do
   begin
      qry.Params[i].Bound := False;
      qry.Params[i].Clear;
      qry.Params[i].Bound := True;
   end;
end;



procedure TfrmApuracaoMensalRET.qryApuracaoSintAfterOpen(DataSet: TDataSet);
var
   fTotalRendimento  : Currency;
   fLimite           : Currency;
begin
   inherited;
   qryApuracao.Close;
   qryApuracao.Open;

   fTotalRendimento := 0;

   qryApuracao.DisableControls;
   while not qryApuracaoSint.Eof do begin

      qryApuracao.Insert;
      qryApuracaoTIPO.AsString               := qryApuracaoSintTIPO.AsString;
      qryApuracaoIDORIGEMIRLITIGIO.AsInteger := qryApuracaoSintIDORIGEMIRLITIGIO.AsInteger;

      if qryApuracaoSintIDORIGEMIRLITIGIO.IsNull then begin
         fTotalRendimento                    := fTotalRendimento + qryApuracaoSintRENDIMENTO.AsCurrency;
         qryApuracaoRENDIMENTO.AsCurrency    := qryApuracaoSintRENDIMENTO.AsCurrency;
      end else if qryApuracaoSintIDORIGEMIRLITIGIO.AsInteger > 0  then begin
         fTotalRendimento                    := fTotalRendimento + qryApuracaoSintRENDIMENTO.AsCurrency;
         qryApuracaoRENDIMENTO.AsCurrency    := qryApuracaoSintRENDIMENTO.AsCurrency;
      end else if qryApuracaoSintIDORIGEMIRLITIGIO.AsInteger = -1 then begin
         fTotalRendimento                    := fTotalRendimento + qryApuracaoSintRENDIMENTO.AsCurrency;
         qryApuracaoRENDIMENTO.AsCurrency    := qryApuracaoSintRENDIMENTO.AsCurrency;
      end else if qryApuracaoSintIDORIGEMIRLITIGIO.AsInteger = -2 then begin
         fTotalRendimento                    := fTotalRendimento + qryApuracaoSintRENDIMENTO.AsCurrency;
         qryApuracaoRENDIMENTO.AsCurrency    := qryApuracaoSintRENDIMENTO.AsCurrency;
      end;

      qryApuracao.Post;
      qryApuracaoSint.Next;
   end;

   fTotalRendimento := 0;

   qryApuracao.First;
   while not qryApuracao.Eof do begin
      fTotalRendimento := fTotalRendimento + qryApuracaoRENDIMENTO.AsCurrency;
      qryApuracao.Next;
   end;

   edtTotalRendimento.Value := fTotalRendimento;

   fLimite                  := qryPatrocinadoraCONTRIBUICAO.AsCurrency * 0.12;

   if   fTotalRendimento > 0 then edtTotalIrApurado.Value := fTotalRendimento * 0.20
   else                           edtTotalIrApurado.Value := 0;


   qryApuracao.First;
   qryApuracao.EnableControls;

   qryPatrocinadora.Close;
   qryPatrocinadora.Open;

   edtRendPatro.Value := qryPatrocinadoraCONTRIBUICAO.AsCurrency;
   edtIrPatro.Value   := qryPatrocinadoraCONTRIBUICAO.AsCurrency * 0.12;

   if    edtTotalIrApurado.Value < edtIrPatro.Value then chkInvestimento.Checked := True
   else                                                  chkPatro.Checked        := True;

end;



procedure TfrmApuracaoMensalRET.chkInvestimentoClick(Sender: TObject);
begin
  inherited;
   if chkInvestimento.Checked then chkPatro.Checked := False;
end;



procedure TfrmApuracaoMensalRET.chkPatroClick(Sender: TObject);
begin
  inherited;
   if chkPatro.Checked then chkInvestimento.Checked := False;
end;



procedure TfrmApuracaoMensalRET.PageControlChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   inherited;

   if PageControl.ActivePage = tbsApuracaoSint then begin
      if qryApuracaoIDORIGEMIRLITIGIO.AsInteger > 0 then begin
         dsApuracaoAnalit.DataSet := qryApuracaoAnalit;

         LimpaParametros(qryApuracaoAnalit);
         qryApuracaoAnalit.ParamByName('PDATAINI').AsDateTime := edtDataIni.Date;
         qryApuracaoAnalit.ParamByName('PDATAFIM').AsDateTime := edtDataFim.Date;

         qryApuracaoAnalit.ParamByName('PIDORIGEMIRLITIGIO').AsInteger := qryApuracaoIDORIGEMIRLITIGIO.AsInteger;
         qryApuracaoAnalit.Open;
      end else begin
         dsApuracaoAnalit.DataSet := qryHistCartInv;

         LimpaParametros(qryHistCartInv);
         qryHistCartInv.ParamByName('PDATAINI').AsDateTime := edtDataIni.Date;
         qryHistCartInv.ParamByName('PDATAFIM').AsDateTime := edtDataFim.Date;

         qryHistCartInv.ParamByName('PIDORIGEMIRLITIGIO').AsInteger := Abs(qryApuracaoIDORIGEMIRLITIGIO.AsInteger);
         qryHistCartInv.Open;
      end;
   end;

end;



procedure TfrmApuracaoMensalRET.btnProcessaApuracaoClick(Sender: TObject);
begin
   inherited;
   PageControl.ActivePageIndex := 0;
   LimpaParametros(qryApuracaoSint);
   qryApuracaoSint.ParamByName('PDATAINI').AsDateTime := edtDataIni.Date;
   qryApuracaoSint.ParamByName('PDATAFIM').AsDateTime := edtDataFim.Date;
   qryApuracaoSint.Open;
end;



procedure TfrmApuracaoMensalRET.FormShow(Sender: TObject);
var iAno, iMes : Word;
begin
   inherited;
   PageControl.ActivePageIndex := 0;

   qryUltTrimestre.Open;
   edtDataIni.Date             := qryUltTrimestreDATAFATOGERADOR.AsDateTime + 1;
   qryUltTrimestre.Close;

   iAno := DiasUteis.ExtraiAno(edtDataIni.Date + 80);
   iMes := DiasUteis.ExtraiMes(edtDataIni.Date + 80);
   
   edtDataFim.Date             := DiasUteis.UltDiaMes(iAno,iMes);;

end;



procedure TfrmApuracaoMensalRET.bbtnConfirmarClick(Sender: TObject);
begin

   if not dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.StartTransaction;

   try
      LimpaParametros(qryInsertIrLitigio);
      qryInsertIrLitigio.ParamByName('PIDIRLITIGIO').AsInteger := LeUltRegistro(nil,'IRLITIGIO');
      qryInsertIrLitigio.ParamByName('PDATAFATOGERADOR').AsDateTime := edtDataFim.Date;
      qryInsertIrLitigio.ParamByName('PDESFATOGERADOR').AsString    := 'RESULTADO TRIMESTRE';
      if chkInvestimento.Checked then
         qryInsertIrLitigio.ParamByName('PVLRIRLITIGIO').AsCurrency := edtTotalIrApurado.Value
      else
         qryInsertIrLitigio.ParamByName('PVLRIRLITIGIO').AsCurrency := edtIrPatro.Value;

      qryInsertIrLitigio.ParamByName('PIDPATROCINADORA').AsInteger  := 1537594;
      qryInsertIrLitigio.ParamByName('PIDPLANOPREV').AsInteger      := 1;
      qryInsertIrLitigio.ExecSql;

      if qryInsertIrLitigio.ParamByName('PVLRIRLITIGIO').AsCurrency > 0 then begin
         GravaLancIrrf;
      end;

      if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.Commit;

   except
      if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack;

   end;

   inherited;

   Close;

end;



procedure TfrmApuracaoMensalRET.GravaLancIRRF;
var
    iIdLancIrrf : Extended;
    iIdInforme  : Extended;
begin
    iIdLancIrrf := LeUltRegistro(nil,'LANCIRRF');
    iIdInforme  := LeUltRegistro(nil,'LANCXINFORME');

    LimpaParametros(qryInsertLancIRRF);
    with qryInsertLancIRRF do begin
         ParamByName('PIDLANCIRRF').AsFloat        := iIdLancIrrf;
         ParamByName('PDATALANCAMENTO').AsDate     := Trunc(edtDataFim.Date); // Sem TRUNC grava Data e Hora no Banco
         ParamByName('PIDPESSOA').AsInteger        := Sistema.IdEmpresa;
         ParamByName('PIDBENEFIRRF').AsInteger     := Sistema.IdEmpresa;
         if chkInvestimento.Checked then begin
            ParamByName('PVLRBASE').AsCurrency     := edtTotalRendimento.Value;
            ParamByName('PVLRIRRF').AsCurrency     := edtTotalIrApurado.Value;
         end else begin
            ParamByName('PVLRBASE').AsCurrency     := edtRendPatro.Value;
            ParamByName('PVLRIRRF').AsCurrency     := edtIrPatro.Value;
         end;

         ParamByName('PCODNATUREZA').AsString      := '8972';
         ParamByName('PFLGDARF').AsString          := 'N';
         ParamByName('PNUMDOCUMENTO').AsString     := '30277685000189'; // NumDocumento do PESSOA
         ParamByName('PPERCIRRF').AsFloat          := 20;
         ParamByName('PFLGFOLHA').AsString         := 'N';
         ParamByName('PIDPATRO').AsInteger         := Sistema.IdEmpresa;
         ParamByName('PIDPLANOPREV').AsInteger     := 1;
         ParamByName('PIDMODULO').AsInteger        := Sistema.IdModulo;
         ExecSql;
    end;

    LimpaParametros(qryInsertInforme);
    with qryInsertInforme do begin
         ParamByName('PIDINFORME').AsFloat    := iIdInforme;
         ParamByName('PNOMEINFORME').AsString := 'Entid Prev./Soc. Segur./FAPI optante pelo RET (MP 2222/2001)';
         ParamByName('PCODINFORME').AsInteger := 8972;
         ParamByName('PCODDIRF').AsInteger    := 3;
         ParamByName('PFLGIRRF').AsString     := 'N';
         ParamByName('PFLGBASE').AsString     := 'N';
         ParamByName('PFLGNATUREZA').AsString := 'P';
         ExecSql;
    end;

    LimpaParametros(qryInsertLancxInforme);
    with qryInsertLancxInforme do begin

         ParamByName('PIDINFORME').AsFloat  := iIdInforme;
         ParamByName('PIDLANCIRRF').AsFloat := iIdLancIrrf;

         if chkInvestimento.Checked then ParamByName('PVLRLANC').AsCurrency := edtTotalRendimento.Value
         else                            ParamByName('PVLRLANC').AsCurrency := edtRendPatro.Value;

         ExecSql;
    end;

end;



end.

