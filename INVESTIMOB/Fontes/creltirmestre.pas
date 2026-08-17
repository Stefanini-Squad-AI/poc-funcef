unit CRelTIRMestre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, TREdit, wwdblook, OleCtrls, vcf1, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls, MontaSelect, Db, Wwdatsrc, DBTables,
  Wwquery, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  AxCtrls, StdCtrls, wwdbdatetimepicker, CMDateTimePicker, FOkCancelarImob;

type
  TcfgRelTIRMestre = class(TFrmOkCancelarImob)
    qryLancamentos: TwwQuery;
    qryLancamentosTOT_PAGO: TFloatField;
    qryLancamentosTOT_RECEBIDO: TFloatField;
    qryOperacoes: TwwQuery;
    qryOperacoesTOT_DIA: TFloatField;
    qryDespesas: TwwQuery;
    qryDespesasTOT_DIA: TFloatField;
    dsBemXImovel: TwwDataSource;
    SpreadSheet: TF1Book;
    qryBemXImovel: TwwQuery;
    qryBemXImovelGrupoExtenso: TStringField;
    qryBemXImovelIDBEM: TFloatField;
    qryBemXImovelIDIMOVEL: TFloatField;
    qryBemXImovelIXBGRUPO: TStringField;
    qryBemXImovelDESBEM: TStringField;
    qryBemXImovelPLACA: TFloatField;
    btnExibir: TBitBtn;
    qryHistoricoCarteira: TwwQuery;
    qryTirEfetiva: TwwQuery;
    qryTirEfetivaTOT_RECEB: TFloatField;
    qryTirEfetivaTOT_PAG: TFloatField;
    qryTirPrevista: TwwQuery;
    qryTirPrevistaTOT_RECEB: TFloatField;
    qryTirPrevistaTOT_PAG: TFloatField;
    Panel2: TPanel;
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    btnBuscaImovel: TBitBtn;
    edtDataIni: TCMDateTimePicker;
    edtDataFim: TCMDateTimePicker;
    rdgLancamento: TRadioGroup;
    edtMestre: TEdit;
    pnlResultado: TPanel;
    Label11: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lblDatas: TLabel;
    Label13: TLabel;
    lblDias: TLabel;
    edtTIR: TRealEdit;
    edtTIRMes: TRealEdit;
    edtTIRAno: TRealEdit;
    DBgrdBemXImovel: TwwDBGrid;
    Label12: TLabel;
    ToolbarSep975: TToolbarSep97;

    procedure btnBuscaImovelClick(Sender: TObject);
    procedure edtDataIniExit(Sender: TObject);
    procedure qryBemXImovelCalcFields(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnExibirClick(Sender: TObject);


  private { Private declarations }
    iMestre : integer;

    function CalculaPrevisto(dDia: TDateTime): currency;
    function CalculaEfetivo(dDia: TDateTime): currency;

    function CalculaCustoContabil(dData: TDateTime): currency;

    function VerificaPreenchimento: boolean;


  public { Public declarations }

  end;



var
  cfgRelTIRMestre: TcfgRelTIRMestre;



implementation
{$R *.DFM}
uses
   uModulo, uSistema, uDiasInUteis, uAtivoFixo, uComunsImobiliario, uMensErro, Math,
   dLookImobiliario, uFuncoesImob, DMS, uCAF;



function TcfgRelTIRMestre.CalculaCustoContabil(dData: TDateTime): currency;
var
   iBem, iEmpresaProp   : integer;
   fTotalContabil       : currency;
   fTotalContabilImob   : extended;
begin
   fTotalContabil := 0;

   with qryBemXImovel do begin
      First;
      while not(EOF) do begin
         iEmpresaProp   := Sistema.idEmpresa;
         iBem           := FieldByName('IDBEM').asInteger;

         fTotalContabil := fTotalContabil + AtivoFixo.CalculaSaldoContabil(iEmpresaProp, iBem, dData, fTotalContabilImob);

         Next;
      end;
   end;

   Result := fTotalContabil;
end;



function TcfgRelTIRMestre.CalculaPrevisto(dDia: TDateTime): currency;
var
   fTotalDia : extended;
begin
   fTotalDia := 0;

   with qryTirPrevista do begin
      LimpaParametros(qryTirPrevista);
      ParamByName('EMPRESAPROP').asInteger   := Sistema.idEmpresa;
      ParamByName('MESTRE').asInteger        := iMestre;
      ParamByName('DATA').asDateTime         := dDia;
      Open;

      if not(isEmpty) then fTotalDia := FieldByName('TOT_RECEB').asFloat - FieldByName('TOT_PAG').asFloat;

   end;

   Result := fTotalDia;
end;



function TcfgRelTIRMestre.CalculaEfetivo(dDia: TDateTime): currency;
var
   fTotalDia : extended;
begin
   fTotalDia := 0;

   with qryTirEfetiva do begin
      LimpaParametros(qryTirEfetiva);
      ParamByName('EMPRESAPROP').asInteger   := Sistema.idEmpresa;
      ParamByName('MESTRE').asInteger        := iMestre;
      ParamByName('DATA').asDateTime         := dDia;
      Open;

      if not(isEmpty) then fTotalDia := FieldByName('TOT_RECEB').asFloat - FieldByName('TOT_PAG').asFloat;

   end;

   Result := fTotalDia;
end;



function TcfgRelTIRMestre.VerificaPreenchimento: boolean;
begin
	Result := False;
	try

      // Imóvel Mestre
		if edtMestre.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar o Imóvel Mestre!', btnBuscaImovel);

      // Data Inicial
		if length(trim(edtDataIni.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário preecher a Data Inicial!', edtDataIni);

      // Data Final
		if length(trim(edtDataFim.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário preecher a Data Final!', edtDataFim);

      // Data Final > Data Inicial
		if length(trim(edtDataFim.Text)) = 0 then
         raise EValidacao.CreateVal('A Data Final deve ser posterior à Data Inicial!', edtDataIni);

	except

      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;
   Result := True;
end;



procedure TcfgRelTIRMestre.btnBuscaImovelClick(Sender: TObject);
begin
   dtmMS.MS_ImovelMestre.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_ImovelMestre.RetornouValor then begin

      Screen.Cursor  := crHourGlass;

      iMestre        := StrToInt(dtmMS.MS_ImovelMestre.ValoresChave[0]);
      edtMestre.Text := dtmMS.MS_ImovelMestre.ValoresChave[1];

      with qryBemXImovel do begin
         LimpaParametros(qryBemXImovel);
         ParamByName('MESTRE').asInteger        := iMestre;
         ParamByName('EMPRESAPROP').asInteger   := Sistema.idEmpresa;
         Open;
      end;

      Screen.Cursor := crDefault;
   end;

   if btnBuscaImovel.CanFocus then btnBuscaImovel.SetFocus;
end;



procedure TcfgRelTIRMestre.edtDataIniExit(Sender: TObject);
begin
   inherited;

   if ( ( length(edtDataIni.Text) > 0 ) and ( length(edtDataFim.Text) > 0 ) ) then begin
      lblDatas.Caption  := edtDataIni.Text + '  a  ' + edtDataFim.Text;
   end else begin
      lblDatas.Caption  := '';
   end;

end;



procedure TcfgRelTIRMestre.qryBemXImovelCalcFields(DataSet: TDataSet);
begin
   inherited;
   qryBemXImovel.FieldByName('GrupoExtenso').asString := CAF.GrupoExtenso(qryBemXImovel.FieldByName('IXBGRUPO').asString);
end;



procedure TcfgRelTIRMestre.bbtnConfirmarClick(Sender: TObject);
var
   fCustoInicial, fCustoFinal : currency;
   fVlrDia, fMensalizado      : currency;
   fAnualizado                : currency;

   dDataIni, dDataFim, dDia   : TDateTime;
   i, j, iDias                : smallint;
   sFormula1, sFormula2       : string;
begin
   if VerificaPreenchimento then begin

      Screen.Cursor           := crHourGlass;
      btnExibir.Enabled       := False;
      bbtnConfirmar.Enabled   := False;
      bbtnSair.Enabled        := False;

      try

         SpreadSheet.ClearRange(-1, -1, -1, -1, F1ClearValues);

         dDataIni          := edtDataIni.Date;
         dDataFim          := edtDataFim.Date;

         // calcula o nº de dias entre as 2 datas
         j := DiasInUteis.IntervaloDias(dDataIni, dDataFim);

         iDias             := DiasInUteis.ExtraiDia(DiasInUteis.UltDiaMes(DiasInUteis.ExtraiAno(edtDataFim.Date), DiasInUteis.ExtraiMes(edtDataFim.Date)));

         lblDias.Caption   := IntToStr(j);
         Repaint;

         // primeiro totaliza os custos contábeis extremos
         fCustoInicial     := CalculaCustoContabil(dDataIni);
         Application.ProcessMessages;
         fCustoFinal       := CalculaCustoContabil(dDataFim);
         Application.ProcessMessages;

         // preenche o custo inicial na planilha
         SpreadSheet.TextRC[1, 1]   := FormatDateTime('dd/mm/yyyy', dDataIni);
         SpreadSheet.NumberRC[1, 2] := fCustoInicial * -1;

         // preenche as celulas na planilha
         for i := 1 to (j) do begin
            dDia     := dDataIni + i;

            Case rdgLancamento.ItemIndex of
               0: fVlrDia  := CalculaPrevisto(dDia);
               1: fVlrDia  := CalculaEfetivo(dDia);
            else
               fVlrDia  := 0;
            end;

            SpreadSheet.TextRC[(i+1), 1]   := FormatDateTime('dd/mm/yyyy', dDia);
            SpreadSheet.NumberRC[(i+1), 2] := fVlrDia;

            Application.ProcessMessages;
         end;

         // preenche o custo final
         SpreadSheet.NumberRC[(i), 2] := SpreadSheet.NumberRC[(i), 2] + fCustoFinal;

         sFormula1   :=   'IRR(' + 'B1:B' + IntToStr(i) + ';1%)';
         sFormula2   := '((IRR(' + 'B1:B' + IntToStr(i) + ';1%) + 1) ^ (' + IntToStr(i-1) + ') - 1 ) * 100';

         // preenche a fórmula
         SpreadSheet.FormulaRC[1,3]    := sFormula1;
         SpreadSheet.FormulaRC[2,3]    := sFormula2;

         SpreadSheet.Recalc;

         // calcula os valores mensalizado e anualizado
         try
            fMensalizado      := SpreadSheet.NumberRC[1,3] + 1;
            fMensalizado      := Power( fMensalizado, iDias );
            fMensalizado      := (fMensalizado - 1) * 100;
         except
            fMensalizado      := 0;
         end;

         try
            fAnualizado       := SpreadSheet.NumberRC[1,3] + 1;
            fAnualizado       := Power( fAnualizado, 365 );
            fAnualizado       := (fAnualizado - 1) * 100;
         except
            fAnualizado       := 0;
         end;

         try
            edtTIR.Value      := (round(SpreadSheet.NumberRC[2,3] * 100)) / 100;
         except
            edtTIR.Value      := 0;
         end;

         edtTIRMes.Value   := (round(fMensalizado * 100)) / 100;
         edtTIRAno.Value   := (round(fAnualizado * 100)) / 100;

         inherited;

      finally
         btnExibir.Enabled       := True;
         bbtnConfirmar.Enabled   := True;
         bbtnSair.Enabled        := True;
         Screen.Cursor           := crDefault;
      end;
      
   end;
end;



procedure TcfgRelTIRMestre.btnExibirClick(Sender: TObject);
begin
   inherited;

   SpreadSheet.Left        :=  21;
   SpreadSheet.Top         :=  21;
   SpreadSheet.Height      := 289;
   SpreadSheet.Width       := 713;

   SpreadSheet.Visible     := not(SpreadSheet.Visible);
end;



end.
