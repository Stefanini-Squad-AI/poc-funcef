unit fParamPesqSal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Spin,
  IvDictio, IvMulti, IvEMulti, ComCtrls, fSairAjuda;

type
  TfrmParamPesqSal = class(TfrmSairAjuda)
    qryPesq: TwwQuery;
    qryEntid: TwwQuery;
    GroupBox1: TGroupBox;
    dblcPesq: TwwDBLookupCombo;
    rgTipoTab: TRadioGroup;
    rgExcluir: TRadioGroup;
    dblcEntid: TwwDBLookupCombo;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rgTipoTabClick(Sender: TObject);
    procedure rgExcluirClick(Sender: TObject);
    procedure dblcEntidChange(Sender: TObject);
  private
    procedure HabilitarBtOk;
  end;

var
  frmParamPesqSal: TfrmParamPesqSal;

implementation

uses uSistema, uFuncoesUteisRH, dRelatoriosCes;

{$R *.DFM}

procedure TfrmParamPesqSal.FormCreate(Sender: TObject);
begin
  inherited;
  qryEntid.Prepare;
  qryPesq.Open;
  if not(qryPesq.FieldByName('NOMEPESQSALAR').IsNull) then
  begin
    dblcPesq.LookUpValue := qryPesq.FieldByName('NOMEPESQSALAR').asString;
    dblcPesq.UpDate;
  end;
end;

procedure TfrmParamPesqSal.dblcEntidChange(Sender: TObject);
begin
  HabilitarBtOk;
end;

procedure TfrmParamPesqSal.rgTipoTabClick(Sender: TObject);
begin
  rgExcluir.Visible := (rgTipoTab.ItemIndex = 0);
  dblcEntid.Visible := (rgTipoTab.ItemIndex = 0) and (rgExcluir.ItemIndex = 1);
end;

procedure TfrmParamPesqSal.rgExcluirClick(Sender: TObject);
begin
  dblcEntid.Visible := (rgExcluir.ItemIndex = 1);
  if (rgExcluir.ItemIndex = 1) then
  begin
    qryEntid.Close;
    qryEntid.ParamByName('PESQUISA').asInteger := qryPesq.FieldByName('IDPESQSALAR').asInteger;
    qryEntid.Open;
  end;
end;

procedure TfrmParamPesqSal.bbtnConfirmarClick(Sender: TObject);
var
  sIdEntid: string;
begin
  inherited;
  with (dtmRelatoriosCes) do
  begin
    if (rgTipoTab.ItemIndex = 0) then
      sTitulo := 'Tabulação de Pesquisa por Cargo'
    else
      sTitulo := 'Tabulação de Pesquisa por Empresa';

    // Monta Query Auxiliar
    qryPesqSal.Close;
    with (qryPesqSal.SQL) do
    begin
      Clear;
      Add('SELECT');
      Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
      Add('  TEN.IDEMPRESAPARTIC,');

      if (rgTipoTab.ItemIndex = 1) then
        Add('  PJ.NOME, C.TITULO AS DESCRICAO,')
      else
      begin
        if (qryEntid.Active) then
          sIdEntid := FloatToStr(qryEntid.FieldByName('IDPESSOA').asFloat)
        else
          sIdEntid := '0';

        Add('  C.TITULO AS NOME,');
        Add('  DECODE(' +IntToStr(rgExcluir.ItemIndex)+ ',0,'+
            'DECODE(TEN.IDEMPRESAPARTIC,' +IntToStr(Sistema.IdEmpresa)+ ',''* - '',''''),'+
            '1, DECODE(TEN.IDEMPRESAPARTIC,' +sIdEntid+
            ',''* - '',''''),'''') || PJ.NOME AS DESCRICAO,');
      end;
      
      Add('  AJU.FATOR, PJ.IDPESSOA,');
      Add('  (' +QuotedStr(Trim(qryPesq.FieldByName('NOMEPESQSALAR').asString))+ ') AS NOMEPESQSALAR,');
      Add('  (' +QuotedStr(Trim(qryPesq.FieldByName('DATAREFPESQ').asString))+ ') AS DATAREFPESQ,');
      Add('  TEN.MENOR, TEN.MENOR_R, TEN.MAIOR, TEN.MAIOR_R, TEN.MEDIA, TEN.MEDIA_R,');
      Add('  TEN.MODA, TEN.MODA_R, TEN.MEDIANA, TEN.MEDIANA_R, TEN.PRIMQUA, TEN.PRIMQUA_R,');
      Add('  TEN.TERCQUA, TEN.TERCQUA_R, TEN.FREQ');
      Add('FROM');
      Add('  PESSOA PJ, AJUSTPESQ AJU, CARGO C, TENDPESQSAL TEN');
      Add('WHERE');
      Add('  (TEN.IDPESQSALAR     = ' +qryPesq.FieldByName('IDPESQSALAR').asString+ ') AND');
      Add('  (TEN.IDCARGO         = C.IDCARGO) AND');
      Add('  (TEN.IDEMPRESAPARTIC = PJ.IDPESSOA) AND');
      Add('  (TEN.IDPESQSALAR     = AJU.IDPESQSALAR(+)) AND');
      Add('  (TEN.IDEMPRESAPARTIC = AJU.IDEMPRESAPARTIC(+))');
      Add('ORDER BY');
      Add('  NOME, DESCRICAO');
      SaveToFile('c:\qry.txt');
    end;
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamPesqSal.HabilitarBtOk;
begin
  bbtnConfirmar.Enabled := (dblcPesq.Text <> '');
end;

end.
