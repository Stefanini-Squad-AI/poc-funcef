unit RCustoFinanceiro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizard, IvDictio, IvMulti, IvEMulti, ComCtrls, StdCtrls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, mImovelouMestre, Mask,
  wwdbedit, Wwdbspin, mFornecedor, wwdblook, TREdit, Grids, Wwdbigrd,
  Wwdbgrid, wwdbdatetimepicker, CMDateTimePicker, fcButton, fcImgBtn,
  fcShapeBtn, AxCtrls, OleCtrls, vcf1, Db, DBTables, Wwquery;

type
  TfrmRelCustoFinanceiro = class(TfrmWizard)
    ntbPrincipal: TNotebook;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    edtDataIni: TCMDateTimePicker;
    molImovelouMestre1: TmolImovelouMestre;
    cboMoeda: TwwDBLookupCombo;
    spnCapitalizacao: TwwDBSpinEdit;
    Label4: TLabel;
    edtDataFim: TCMDateTimePicker;
    qryCustoFinanceiro: TwwQuery;
    fcShapeBtn1: TfcShapeBtn;
    btnCalculaSaldo: TBitBtn;
    Planilha: TF1Book;
    qryCustoFinanceiroANOMESBAIXA: TStringField;
    qryCustoFinanceiroTOT_LANC: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fcShapeBtn1Click(Sender: TObject);
    procedure btnCalculaSaldoClick(Sender: TObject);
  private
    procedure AbreQueries;
    procedure FechaQueries;
    procedure BuscaCustoContabil;
    procedure PreencheMes(const iMes, iAno, iLinha: integer);
    procedure AbreQryCustoFinanceiro(const iImovel: integer; const bMestre: boolean; const sImovel: string);
    procedure ProcessaQryCustoFinanceiro(const fFatorRateio: Extended);
    function VerificaPreenchimento: boolean;
    procedure InicializaPlanilha;
    procedure EscondeEspera;
    procedure MostraEspera(const sMensagem: string);
    function ProcessaIndices: integer;
    procedure FormataAnalitico(const iLinha: integer);
    procedure PreencheRodape(var iLinha: integer);
    procedure FormataSintetico(const iLinha: integer);
    procedure DemonstraDesmembramento(const iLinha: integer);
    procedure InicializaCustoFinanceiro;  // retorna a próxima linha
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCustoFinanceiro: TfrmRelCustoFinanceiro;

implementation

uses dLookImobiliario, uCAF, uDiasInUteis, uFuncoesImob, uComunsImobiliario, uVerificaPreenchimento, uMensErro,
  FEspera, dImobiliario, dCaf;

const
   iPrimeiraLinha = 3;

{$R *.DFM}

procedure TfrmRelCustoFinanceiro.AbreQueries;
begin
   dtmLookImobiliario.qryLookMoeda.Open;
end;

procedure TfrmRelCustoFinanceiro.FechaQueries;
begin
   dtmLookImobiliario.qryLookMoeda.Close;
end;

procedure TfrmRelCustoFinanceiro.FormCreate(Sender: TObject);
begin
   inherited;
   AbreQueries;
   ntbPrincipal.PageIndex := 0;
end;

procedure TfrmRelCustoFinanceiro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   FechaQueries;
end;

procedure TfrmRelCustoFinanceiro.InicializaPlanilha;
begin
   Planilha.ClearRange(-1, -1, -1, -1, F1ClearValues);
   Planilha.TableName      := molImovelouMestre1.edtImovel.Text;
   Planilha.SheetName[1]   := molImovelouMestre1.edtImovel.Text;

   Planilha.TextRC[1,1] := 'MÊS';
   Planilha.TextRC[1,2] := 'FLUXO NOM';
   Planilha.TextRC[1,3] := 'FLUXO ' + cboMoeda.Text;
   Planilha.TextRC[1,4] := 'FLUXO ' + cboMoeda.Text + ' + ' + inttostr(word(trunc(spnCapitalizacao.Value))) + '%';
   Planilha.TextRC[1,5] := 'RESID. ' + cboMoeda.Text;
   Planilha.TextRC[1,6] := 'RESID. ' + cboMoeda.Text + ' + ' + inttostr(word(trunc(spnCapitalizacao.Value))) + '%';
   Planilha.TextRC[1,7] := cboMoeda.Text;
end;

procedure TfrmRelCustoFinanceiro.BuscaCustoContabil;
var
   dUltimoDiaInicio: TDateTime;
   fSaldoContabil, fPercentDesmembra: Extended;
   iImovel: integer;
begin
   MostraEspera('Calculando custo contábil...');

   dUltimoDiaInicio := DiasInUteis.UltDiaMes(DiasInUteis.ExtraiAno(edtDataIni.Date), DiasInUteis.ExtraiMes(edtDataIni.Date));
   if molImovelouMestre1.iMestre = -1 then begin // temos um MESTRE
      fSaldoContabil := CAF.SaldoContabilImovel (-1, molImovelouMestre1.iImovel, dUltimoDiaInicio) * -1
   end else begin
      iImovel := molImovelouMestre1.iImovel;
      fPercentDesmembra := 1;  // se não possui desmembramento usar o fator de 100% do vlr do mesmo

      // se for um imóvel o mesmo pode ter sido desmembrado
      if not dtmCaf.qryDesmembramentos.IsEmpty then begin
         dtmCaf.qryDesmembramentos.Last;
         iImovel := dtmCaf.qryDesmembramentosIDIMOVELINI.AsInteger;
         fPercentDesmembra := dtmCaf.qryDesmembramentosPERC_ACUM.AsFloat;
      end;

      fSaldoContabil := CAF.SaldoContabilImovel (iImovel, -1, dUltimoDiaInicio) * -1;
      fSaldoContabil := fSaldoContabil * fPercentDesmembra;
   end;

   PreencheMes(DiasInUteis.ExtraiMes(edtDataIni.Date), DiasInUteis.ExtraiAno(edtDataIni.Date), 2);
   Planilha.NumberRC[2,2] := fSaldoContabil;

   EscondeEspera;
end;

procedure TfrmRelCustoFinanceiro.PreencheMes(const iMes, iAno, iLinha: integer);
var sMes: string;
begin
   if iAno < 10 then
      sMes := copy(MesExtenso (iMes), 1, 3) + '/0' + IntToStr(iAno)
   else
      sMes := copy(MesExtenso (iMes), 1, 3) + '/' + IntToStr(iAno);

   Planilha.TextRC [iLinha, 1] := sMes;
end;


procedure TfrmRelCustoFinanceiro.AbreQryCustoFinanceiro(const iImovel: integer; const bMestre: boolean; const sImovel: string);
var dDataIni: TDateTime;
begin
   MostraEspera('Selecionando receitas e despesas...'+#13+'Imóvel: '+sImovel);

   dDataIni := DiasInUteis.SomaMeses(edtDataIni.Date, 1);
   dDataIni := StrToDate('01/' + inttostr(DiasInUteis.ExtraiMes(dDataIni)) + '/' + inttostr(DiasInUteis.ExtraiAno(dDataIni)));
   LimpaParametros(qryCustoFinanceiro);
   qryCustoFinanceiro.ParamByName('PDATAINI').AsDateTime := dDataIni;
   qryCustoFinanceiro.ParamByName('PDATAFIM').AsDateTime := edtDataFim.DateTime;

   if bMestre then
      qryCustoFinanceiro.ParamByName('PIDIMOVELMESTRE').AsInteger := iImovel
   else
      qryCustoFinanceiro.ParamByName('PIDIMOVEL').AsInteger := iImovel;

   qryCustoFinanceiro.Open;
   EscondeEspera;
end;


procedure TfrmRelCustoFinanceiro.InicializaCustoFinanceiro;
var
   dDataAtu: TDateTime;
   iMesAtu, iAnoAtu, iLinha: integer;
begin
   iLinha := iPrimeiraLinha;
   dDataAtu := DiasInUteis.SomaMeses(edtDataIni.Date, 1);
   while dDataAtu <= edtDataFim.DateTime do begin
      iMesAtu := DiasInUteis.ExtraiMes (dDataAtu);
      iAnoAtu := StrToInt(FormatDateTime('yyyy',dDataAtu));
      PreencheMes(iMesAtu, iAnoAtu, iLinha);
      Planilha.NumberRC [iLinha, 2] := 0;
      inc (iLinha);
      dDataAtu := DiasInUteis.SomaMeses(dDataAtu, 1);
   end;
end;


procedure TfrmRelCustoFinanceiro.ProcessaQryCustoFinanceiro(const fFatorRateio: Extended);
var
   dDataAtu: TDateTime;
   iMesAtu, iAnoAtu, iMesQry, iAnoQry, iLinha: integer;
begin
   iLinha := iPrimeiraLinha;
   dDataAtu := DiasInUteis.SomaMeses(edtDataIni.Date, 1);
   qryCustoFinanceiro.First;


   while dDataAtu <= edtDataFim.DateTime do begin
      iMesAtu := DiasInUteis.ExtraiMes (dDataAtu);
      iAnoAtu := StrToInt(FormatDateTime('yyyy',dDataAtu));

      iMesQry := StrToIntDef(copy(qryCustoFinanceiroANOMESBAIXA.AsString,5,2), 0);
      iAnoQry := StrToIntDef(copy(qryCustoFinanceiroANOMESBAIXA.AsString,1,4), 0);

      if (iMesAtu = iMesQry) and (iAnoAtu = iAnoQry) then begin    // achei o mês no resultado
         Planilha.NumberRC [iLinha, 2] := Planilha.NumberRC [iLinha, 2] + (qryCustoFinanceiroTOT_LANC.AsFloat * fFatorRateio);
         qryCustoFinanceiro.Next;
      end;
      inc (iLinha);

      dDataAtu := DiasInUteis.SomaMeses(dDataAtu, 1);
   end;

end;


function TfrmRelCustoFinanceiro.ProcessaIndices: integer;  // retorna a próxima linha
var
   sAnoMesIni, sAnoMesFim, sAnoMesAtu, sExpressao: string;
   dDataAux: TDateTime;
   iLinha, i, iNumMeses: integer;
begin
   try
      sAnoMesIni := FormatDateTime('yyyymm', edtDataIni.Date);
      sAnoMesFim := FormatDateTime('yyyymm', DiasInUteis.SomaMeses(edtDataFim.Date,-1));
      sAnoMesAtu := sAnoMesIni;
      iLinha := 2;
      Planilha.NumberRC[iLinha, 7] := 0; // esta é a linha do custo contábil - o indice é 0
      Planilha.NumberRC[iLinha, 8] := 1; // esta é a linha do custo contábil - o acumulado começa com 1
      inc (iLinha);

      LimpaParametros(dtmImobiliario.qryCotacoesIntervalo);
      dtmImobiliario.qryCotacoesIntervalo.ParamByName('INDICE').AsInteger   := StrToInt(cboMoeda.LookupValue);
      dtmImobiliario.qryCotacoesIntervalo.ParamByName('ANOMESINI').AsString := sAnoMesIni;
      dtmImobiliario.qryCotacoesIntervalo.ParamByName('ANOMESFIM').AsString := sAnoMesFim;
      dtmImobiliario.qryCotacoesIntervalo.Open;

      while sAnoMesAtu <= sAnoMesFim do begin
         if sAnoMesAtu = dtmImobiliario.qryCotacoesIntervaloANOMES.AsString then begin
            Planilha.NumberRC[iLinha, 7] := dtmImobiliario.qryCotacoesIntervaloCOTVALOR.AsFloat; // cotação moeda
            dtmImobiliario.qryCotacoesIntervalo.Next;

            // se cair no if abaixo é porque eu tenho duas cotações da mesma moeda - erro
            if (not dtmImobiliario.qryCotacoesIntervalo.Eof) and (sAnoMesAtu = dtmImobiliario.qryCotacoesIntervaloANOMES.AsString) then begin
               MsgDlg('Na referênica: ' + dtmImobiliario.qryCotacoesIntervaloCOTMESREF.AsString + ' foi cadastrado mais de uma cotação para a modea!', 'Erro', mtError, [mbok], 0);
               exit;
            end;
         end else begin // não existe cotação para o mes especificado colocar 0
            Planilha.NumberRC[iLinha, 7] := 0;
         end;
         sExpressao := '+H'+IntToStr(iLinha - 1)+'*(1+(G'+IntToStr(iLinha)+'/100))';
         Planilha.FormulaRC[ilinha, 8] := sExpressao;  // acumulado da cotação

         inc(iLinha);
         // incrementa o sAnoMesAtu
         dDataAux := strtodate('01/' + copy(sAnoMesAtu, 5, 2) + '/' + copy(sAnoMesAtu, 1, 4));
         sAnoMesAtu := FormatDateTime('yyyymm', DiasInUteis.SomaMeses(dDataAux, 1));
      end;

      { inserir a fórmual do fluxo nominal pelo INPC == COLUNA C
        +B2+$H$51/H2
        2  = i
        51 = iLinha

        inserir a fórmual do fluxo nominal pelo INPC + 6% == COLUNA D
        +C2*M2  }
      for i:= 2 to iLinha-1 do begin
         // fUXO INPC
         sExpressao := '+B'+IntToStr(i)+'*$H$'+IntToStr(iLinha-1)+'/H'+IntToStr(i);
         Planilha.FormulaRC[i, 3] := sExpressao;  // fluxo INPC

         // FLUXO INPC + 6%
         sExpressao := '+C'+IntToStr(i)+'*K'+IntToStr(i);
         Planilha.FormulaRC[i, 4] := sExpressao;  // fluxo INPC
      end;

      // capitalizar os 6% a.a.
      Planilha.NumberRC [1, 11] := spnCapitalizacao.Value/100;  // K1 = 6%

      Planilha.FormulaRC[1, 10] := '+(1+K1)^(1/12)';        // J1 = 6% ref 1 mes
      Planilha.FormulaRC[1, 12] := '+J1^(J2)';              // L1 = 6% no período completo == K2 número meses

      // CALCULAR OS 6% PARA O MES VIGENTE
      // coluna J(10) com o numero de mees
      // coluna K(11) com o valor do 6% a.a. no mes
      iNumMeses := iLinha - 3;
      for i := 2 to iLinha-1 do begin
         Planilha.NumberRC [i, 10] := iNumMeses; // numero de meses
         Planilha.FormulaRC[i, 11] := '+$J$1^(J'+inttostr(i)+')';
         inc(iNumMeses, -1);
      end;


      // CALCULAR O RESIDUO INPC ==>> COLUNA E
      // CALCULAR O RESIDUO INPC + 6% ==>> COLUNA F
      // 1a. linha INPC = +B2
      Planilha.FormulaRC[2, 5] := '+B2';
      // 1a. linha INPC +6 = +E2
      Planilha.FormulaRC[2, 6] := '+E2';

      for i := iPrimeiraLinha to iLinha - 1 do begin
         // próximas linhas INPC : =E2*(G3/100+1)+B3
         sExpressao := '+E'+IntToStr(i-1)+'*(G'+IntToStr(I)+'/100+1)+B'+IntToStr(i);
         Planilha.FormulaRC[i, 5] := sExpressao;

         // próximas linhas INPC + 6: =F2*$J$1*(G3/100+1)+B3
         sExpressao := '+F'+IntToStr(i-1)+'*$J$1*(G'+IntToStr(I)+'/100+1)+B'+IntToStr(i);
         Planilha.FormulaRC[i, 6] := sExpressao;
      end;

   finally
      result := iLinha;
      dtmImobiliario.qryCotacoesIntervalo.Close;
   end;
end;

procedure TfrmRelCustoFinanceiro.FormataAnalitico(const iLinha: integer);
begin
   // cabeçalho
   Planilha.Selection := 'A1:F1';
   Planilha.SetAlignment(F1HAlignCenter,true,F1VAlignCenter,0);
   Planilha.SetFont('Arial',10,true,false,false,false,clBlack,false,false);

   // alinhamento a esquerda e tamanho da fonte
   Planilha.Selection := 'A2:K'+IntToStr(iLinha - 1);
   Planilha.SetAlignment(F1HAlignRight,true,F1VAlignCenter,0);
   Planilha.SetFont('Arial',10,false,false,false,false,clBlack,false,false);

   // BORDAS
   // CABEÇALHO ATÉ INPC
   Planilha.Selection := 'A1:F1';
   Planilha.SetBorder(1,1,1,1,1,-1,clBlack,clBlack,clBlack,clBlack,clBlack);

   // INPC
   Planilha.Selection := 'G1:H1';
   Planilha.SetBorder(1,-1,-1,-1,-1,-1,clBlack,clBlack,clBlack,clBlack,clBlack);
   Planilha.SetAlignment(F1HAlignRight,true,F1VAlignCenter,0);
   Planilha.SetFont('Arial',10,true,false,false,false,clBlack,false,false);

   // RESTANTE DA PLANILHA
   Planilha.Selection := 'A2:H'+IntToStr(iLinha - 1);
   Planilha.SetBorder(1,1,1,1,1,-1,clBlack,clBlack,clBlack,clBlack,clBlack);


   // formato do numero de fluxo nom a inpc
   Planilha.Selection := 'B2:G'+IntToStr(iLinha - 1);
   Planilha.NumberFormat := ('#.##0,00;[RED](#.##0,00)');

   // formato do número para o acumulado do INPC
   Planilha.Selection := 'H2:H'+IntToStr(iLinha - 1);
   Planilha.NumberFormat := ('#.##0,000000;[RED](#.##0,000000)');

   // QUANTO É 6% EM UM MES
   Planilha.Selection := 'J1:J1';
   Planilha.NumberFormat := ('#.##0,00000000;[RED](#.##0,00000000)');

   // PERCENTUAL DE CAPITALIZAÇÃO
   Planilha.Selection := 'K1:K1';
   Planilha.NumberFormat := ('#.##0%;[RED](#.##0%)');

   // QUANTO É 6% NO PERÍODO SELECIONADO
   Planilha.Selection := 'L1:L1';
   Planilha.NumberFormat := ('#.##0,00000000;[RED](#.##0,00000000)');

   // QUANTO É 6% NO MES EM QUESTÃO
   Planilha.Selection := 'K2:L'+IntToStr(iLinha - 1);
   Planilha.NumberFormat := ('#.##0,00000000;[RED](#.##0,00000000)');

end;

procedure TfrmRelCustoFinanceiro.PreencheRodape(var iLinha: integer);
var sExpressao: string;
begin
   Planilha.TextRC    [iLinha, 1] := 'Soma das Receitas =>';
   sExpressao := 'SUMIF(C2:C'+IntToStr(iLinha - 1)+';">0";C2:C'+IntToStr(iLinha - 1)+')';
   Planilha.FormulaRC [iLinha, 3] := sExpressao;
   sExpressao := 'SUMIF(D2:D'+IntToStr(iLinha - 1)+';">0";D2:D'+IntToStr(iLinha - 1)+')';
   Planilha.FormulaRC [iLinha, 4] := sExpressao;

   Inc(iLinha);
   Planilha.TextRC    [iLinha, 1] := 'Investimento Atualizado';
   sExpressao := 'SUMIF(C2:C'+IntToStr(iLinha - 2)+';"<0";C2:C'+IntToStr(iLinha - 2)+')';
   Planilha.FormulaRC [iLinha, 3] := sExpressao;
   sExpressao := 'SUMIF(D2:D'+IntToStr(iLinha - 2)+';"<0";D2:D'+IntToStr(iLinha - 2)+')';
   Planilha.FormulaRC [iLinha, 4] := sExpressao;

   Inc(iLinha);
   Planilha.TextRC    [iLinha, 1] := 'Valor Residual';
   sExpressao := '+C'+IntToStr(iLinha - 2)+'+C'+IntToStr(iLinha - 1);
   Planilha.FormulaRC [iLinha, 3] := sExpressao;
   sExpressao := '+D'+IntToStr(iLinha - 2)+'+D'+IntToStr(iLinha - 1);
   Planilha.FormulaRC [iLinha, 4] := sExpressao;

   Inc(iLinha);
   Planilha.TextRC    [iLinha, 1] := 'TAXAS';
   Planilha.TextRC    [iLinha, 3] := 'NO PERÍODO';
   Planilha.TextRC    [iLinha, 4] := 'NO ANO';

   Inc(iLinha);
   Planilha.TextRC    [iLinha, 1] := 'REAL';
   sExpressao := '((-C'+IntToStr(iLinha - 4)+'/C'+IntToStr(iLinha - 3)+')/J2+1)^(J2)-1';
   Planilha.FormulaRC [iLinha, 3] := sExpressao;
   sExpressao := '(1+C'+IntToStr(iLinha)+')^(12/J2)-1';
   Planilha.FormulaRC [iLinha, 4] := sExpressao;

   Inc(iLinha);
   Planilha.TextRC    [iLinha, 1] := cboMoeda.Text;
   sExpressao := '+H'+IntToStr(iLinha - 6)+'-1';;
   Planilha.FormulaRC [iLinha, 3] := sExpressao;
   sExpressao := '(1+C'+IntToStr(iLinha)+')^(12/J2)-1';
   Planilha.FormulaRC [iLinha, 4] := sExpressao;

   Inc(iLinha);
   Planilha.TextRC    [iLinha, 1] := 'EFETIVA';
   sExpressao := '(1+C'+IntToStr(iLinha - 2)+')*(1+C'+IntToStr(iLinha - 1)+')-1';
   Planilha.FormulaRC [iLinha, 3] := sExpressao;
   sExpressao := '(1+D'+IntToStr(iLinha - 2)+')*(1+D'+IntToStr(iLinha - 1)+')-1';
   Planilha.FormulaRC [iLinha, 4] := sExpressao;

   Inc(iLinha);
   Planilha.TextRC    [iLinha, 1] := 'DIFERENÇA P/ O ATUARIAL';
   sExpressao := '(1+C'+IntToStr(iLinha - 3)+')/L1-1';
   Planilha.FormulaRC [iLinha, 3] := sExpressao;
   sExpressao := '(1+D'+IntToStr(iLinha - 3)+')/(1+K1)-1';
   Planilha.FormulaRC [iLinha, 4] := sExpressao;

end;

procedure TfrmRelCustoFinanceiro.FormataSintetico(const iLinha: integer);
var
   i: integer;
   sFaixa: string;
begin
   // colula A
   for i:= 7 downto 0 do begin
      sFaixa := 'A'+inttostr(iLinha-i)+':B'+inttostr(iLinha-i);
      Planilha.Selection := sFaixa;
      Planilha.SetAlignment(F1HAlignLeft,false,F1VAlignCenter,0);
      Planilha.SetFont('Arial',10,true,false,false,false,clBlack,false,false);
      Planilha.SetBorder(1,-1,-1,-1,-1,-1,clBlack,clBlack,clBlack,clBlack,clBlack);
   end;

   // formatação dos totais
   sFaixa := 'C'+IntToStr(iLinha - 7)+':D'+IntToStr(iLinha - 5);
   Planilha.Selection := sFaixa;
   Planilha.SetAlignment(F1HAlignRight,true,F1VAlignCenter,0);
   Planilha.SetFont('Arial',10,true,false,false,false,clBlack,false,false);
   Planilha.NumberFormat := ('#.##0,00;[RED](#.##0,00)');
   Planilha.SetBorder(1,1,1,1,1,-1,clBlack,clBlack,clBlack,clBlack,clBlack);

   // CABEÇALHO TAXAS
   sFaixa := 'C'+IntToStr(iLinha - 4)+':D'+IntToStr(iLinha - 4);
   Planilha.Selection := sFaixa;
   Planilha.SetAlignment(F1HAlignCenter,true,F1VAlignCenter,0);
   Planilha.SetFont('Arial',10,true,false,false,false,clBlack,false,false);
   Planilha.SetBorder(1,1,1,1,1,-1,clBlack,clBlack,clBlack,clBlack,clBlack);

   // formatação das taxas
   sFaixa := 'C'+IntToStr(iLinha - 3)+':D'+IntToStr(iLinha);
   Planilha.Selection := sFaixa;
   Planilha.SetAlignment(F1HAlignCenter,true,F1VAlignCenter,0);
   Planilha.SetFont('Arial',10,true,false,false,false,clBlack,false,false);
   Planilha.NumberFormat := ('#.##0,00%;[RED](#.##0,00%)');
   Planilha.SetBorder(1,1,1,1,1,-1,clBlack,clBlack,clBlack,clBlack,clBlack);

end;


function TfrmRelCustoFinanceiro.VerificaPreenchimento: boolean;
begin
   Result := False;

   try

     if molImovelouMestre1.edtImovel.Text = '' then
        Raise EValidacao.CreateVal('É necessário indicar o Imóvel!', molImovelouMestre1.btnBuscaImovel);

     if Trim(edtDataIni.Text)= '' then
        Raise EValidacao.CreateVal('É necessário indicar a Data Inicial!', edtDataIni);

     if Trim(edtDataFim.Text)= '' then
        Raise EValidacao.CreateVal('É necessário indicar a Data Final!', edtDataFim);

     if Trim(cboMoeda.Text)= '' then
        Raise EValidacao.CreateVal('É necessário informar o Indicador de Reajuste!', cboMoeda);

   except

      On ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;

   Result := True;
end;


procedure TfrmRelCustoFinanceiro.MostraEspera(const sMensagem: string);
begin
   frmEspera.Config('Aguarde', sMensagem, False);
   frmEspera.Show;
   Application.ProcessMessages;
end;



procedure TfrmRelCustoFinanceiro.EscondeEspera;
begin
   frmEspera.Hide;
   frmEspera.Config('', '', False);
end;




procedure TfrmRelCustoFinanceiro.fcShapeBtn1Click(Sender: TObject);
begin
  inherited;
  ntbPrincipal.PageIndex := 0;
end;


procedure TfrmRelCustoFinanceiro.DemonstraDesmembramento(const iLinha: integer);
var
   iLinhaAux: integer;
   sFaixa: string;
begin
   if dtmCaf.qryDesmembramentos.IsEmpty then exit;
   dtmCaf.qryDesmembramentos.First;

   iLinhaAux := iLinha + 2;
   Planilha.TextRC [iLinhaAux, 1] := 'DATA';
   Planilha.TextRC [iLinhaAux, 2] := 'IMÓVEL ORIGEM';
   Planilha.TextRC [iLinhaAux, 5] := 'DESMEMBRADO';
   Planilha.TextRC [iLinhaAux, 6] := 'FATOR FLUXO';
   // SETAR NEGRIGO
   sFaixa := 'A'+inttostr(iLinhaAux)+':F'+inttostr(iLinhaAux);
   Planilha.Selection := sFaixa;
   Planilha.SetFont('Arial',10,true,false,false,false,clBlack,false,false);

   // SETAR ALINHAMENTO
   sFaixa := 'A'+inttostr(iLinhaAux)+':A'+inttostr(iLinhaAux);
   Planilha.Selection := sFaixa;
   Planilha.SetAlignment(F1HAlignCenter,true,F1VAlignCenter,0);
   sFaixa := 'E'+inttostr(iLinhaAux)+':F'+inttostr(iLinhaAux);
   Planilha.Selection := sFaixa;
   Planilha.SetAlignment(F1HAlignCenter,true,F1VAlignCenter,0);

   // SETAR BORDAS
   sFaixa := 'A'+inttostr(iLinhaAux)+':A'+inttostr(iLinhaAux);
   Planilha.Selection := sFaixa;
   Planilha.SetBorder(1,-1,-1,-1,-1,-1,clBlack,clBlack,clBlack,clBlack,clBlack);
   sFaixa := 'B'+inttostr(iLinhaAux)+':D'+inttostr(iLinhaAux);
   Planilha.Selection := sFaixa;
   Planilha.SetBorder(1,-1,-1,-1,-1,-1,clBlack,clBlack,clBlack,clBlack,clBlack);
   sFaixa := 'E'+inttostr(iLinhaAux)+':F'+inttostr(iLinhaAux);
   Planilha.Selection := sFaixa;
   Planilha.SetBorder(1,1,1,1,1,1,clBlack,clBlack,clBlack,clBlack,clBlack);


   while not dtmCaf.qryDesmembramentos.Eof do begin
      inc(iLinhaAux);

      // CONFIGURAÇÕES CÉLULA DATA (A)
      Planilha.TextRC [iLinhaAux, 1] := FormatDateTime('dd/mm/yyyy', dtmCaf.qryDesmembramentosDMRDATA.AsDateTime);
      sFaixa := 'A'+inttostr(iLinhaAux)+':A'+inttostr(iLinhaAux);
      Planilha.Selection := sFaixa;
      Planilha.SetBorder(1,-1,-1,-1,-1,-1,clBlack,clBlack,clBlack,clBlack,clBlack);
      Planilha.SetAlignment(F1HAlignCenter,true,F1VAlignCenter,0);

      // CONFIGURAÇÕES CÉLULA IMÓVEL (B:D)
      Planilha.TextRC [iLinhaAux, 2] := dtmCaf.qryDesmembramentosNOME_IMOVEL.AsString;
      sFaixa := 'B'+inttostr(iLinhaAux)+':D'+inttostr(iLinhaAux);
      Planilha.Selection := sFaixa;
      Planilha.SetBorder(1,-1,-1,-1,-1,-1,clBlack,clBlack,clBlack,clBlack,clBlack);

      // CONFIGURAÇÕES CÉLULA DESMEMBRADO (E)
      Planilha.NumberRC [iLinhaAux, 5] := dtmCaf.qryDesmembramentosDMRPERCENT.AsFloat/100;
      sFaixa := 'E'+inttostr(iLinhaAux)+':E'+inttostr(iLinhaAux);
      Planilha.Selection := sFaixa;
      Planilha.SetBorder(1,-1,-1,-1,-1,-1,clBlack,clBlack,clBlack,clBlack,clBlack);
      Planilha.NumberFormat := ('#.##0,00%;[RED](#.##0,00%)');

      // CONFIGURAÇÕES CÉLULA FATOR FLUXO (F)
      Planilha.NumberRC [iLinhaAux, 6] := dtmCaf.qryDesmembramentosPERC_ACUM.AsFloat;
      sFaixa := 'F'+inttostr(iLinhaAux)+':F'+inttostr(iLinhaAux);
      Planilha.Selection := sFaixa;
      Planilha.SetBorder(1,-1,-1,-1,-1,-1,clBlack,clBlack,clBlack,clBlack,clBlack);
      Planilha.NumberFormat := ('#.##0,000000;[RED](#.##0,000000)');

      dtmCaf.qryDesmembramentos.Next;
   end;

end;


procedure TfrmRelCustoFinanceiro.btnCalculaSaldoClick(Sender: TObject);
var iLinha: integer;
begin
   inherited;
   if VerificaPreenchimento then begin
      Planilha.Selection := 'A1';
      Planilha.ShowActiveCell;

      InicializaPlanilha;

      MostraEspera('Selecionando Desmembramentos...');
      CAF.MontaHistDesmembramento(molImovelouMestre1.iImovel);
      EscondeEspera;

      BuscaCustoContabil;
      InicializaCustoFinanceiro;

      // processa o custo financeiro para o primeiro imóvel
      AbreQryCustoFinanceiro(molImovelouMestre1.iImovel, molImovelouMestre1.iMestre = -1, molImovelouMestre1.sImovel);
      ProcessaQryCustoFinanceiro(1);

      // processa o custo financeiro para o historico dos imóveis desmembrados
      dtmCaf.qryDesmembramentos.First;
      while not dtmCaf.qryDesmembramentos.Eof do begin
         AbreQryCustoFinanceiro(dtmCaf.qryDesmembramentosIDIMOVELINI.AsInteger, false, dtmCaf.qryDesmembramentosNOME_IMOVEL.AsString);
         ProcessaQryCustoFinanceiro(dtmCaf.qryDesmembramentosPERC_ACUM.AsFloat);

         dtmCaf.qryDesmembramentos.Next;
      end;

      iLinha := ProcessaIndices;
      FormataAnalitico(iLinha);
      PreencheRodape(iLinha);
      FormataSintetico(iLinha);
      DemonstraDesmembramento(iLinha);
      Planilha.Selection := 'A'+IntToStr(iLinha+1);
      Planilha.ShowActiveCell;
   end;

end;

end.
