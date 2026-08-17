unit FConsContrib;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Spin, wwdblook, Grids, Wwdbigrd,
  Wwdbgrid, Db, Wwdatsrc, DBTables, Wwquery;

type
  TfrmConsContrib = class(TfrmSairAjuda)
    pnlInformacoes: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edTitular: TEdit;
    edMatricula: TEdit;
    edNumInscr: TEdit;
    edPlanoPrev: TEdit;
    edPatrocinadora: TEdit;
    pnlOpcoes: TPanel;
    StaticText2: TStaticText;
    grpMesRef: TGroupBox;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    qryHstContrib: TwwQuery;
    ds: TwwDataSource;
    dbgrdResultado: TwwDBGrid;
    Label21: TLabel;
    edTotEsperado: TEdit;
    Label22: TLabel;
    edTotRecebido: TEdit;
    edPlanAss: TEdit;
    montaSel: TMontaSelect;
    qryHstContribPAGADOR: TStringField;
    qryHstContribMES: TStringField;
    qryHstContribMESCOBRANCA: TStringField;
    qryHstContribVALORESPERADO: TFloatField;
    qryHstContribVALORRECEBIDO: TFloatField;
    qryHstContribDATA: TDateTimeField;
    qryHstContribSIT: TStringField;
    qryHstContribDATAPREVISAO: TDateTimeField;
    qryHstContribPLANASS: TStringField;
    qryHstContribPLANPREV: TStringField;
    qryHstContribNOME: TStringField;
    qryHstContribCONTRIB: TStringField;
    qryHstContribDESCRICAO: TStringField;
    qryHstContribDESCRICAO_1: TStringField;
    qryHstContribNOMEREGRA: TStringField;
    qryHstContribSITPLANOPREV: TStringField;
    bbtnProcurar: TBitBtn;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmbMesChange(Sender: TObject);
    procedure spnedAnoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    sIdPessoa,
    sIdPlanAss,
    sIdPlanoPrev,
    sIdPessJur: string;
    dTotEsperado,
    dTotRecebido: double;
    procedure AtualizaGrid;
  public
    { Public declarations }
  end;

var
  frmConsContrib: TfrmConsContrib;

implementation

uses UMensErro;
{$R *.DFM}

procedure TfrmConsContrib.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSel.Executar;

  if (MontaSel.RetornouValor) then
  begin
     edTitular.Text       := MontaSel.ValoresChave[0];
     edPlanAss.Text       := MontaSel.ValoresChave[1];
     edNumInscr.Text      := MontaSel.ValoresChave[2];
     edPatrocinadora.Text := MontaSel.ValoresChave[3];
     edPlanoPrev.Text     := MontaSel.ValoresChave[4];
     edMatricula.Text     := MontaSel.ValoresChave[5];
     sIdPessoa            := MontaSel.ValoresChave[6];
     sIdPlanAss           := MontaSel.ValoresChave[7];
     sIdPlanoPrev         := MontaSel.ValoresChave[8];
     sIdPessJur           := MontaSel.ValoresChave[9];
  end;
  AtualizaGrid;
end;

procedure TfrmConsContrib.FormActivate(Sender: TObject);
var wAno, wMes, wDia: word;
begin
  inherited;
  sIdPessoa := '-1';
  sIdPlanAss := '-1';
  sIdPlanoPrev := '-1';
  sIdPessJur := '-1';
  DecodeDate(Date, wAno, wMes, wDia);
  cmbMes.ItemIndex := wMes - 1;
  spnedAno.Value := wAno;
end;

procedure TfrmConsContrib.AtualizaGrid;
var
  i: integer;
  sMesRef,
  sAnoAux,
  sMesAux: string;
begin
  sAnoAux := spnedAno.Text;
  if cmbMes.ItemIndex <= 8 then
    sMesAux := '0'+IntToStr(cmbMes.ItemIndex+1)
  else
    sMesAux := IntToStr(cmbMes.ItemIndex+1);

  sMesRef := sAnoAux+'/'+sMesAux;

  if (sIdPessoa <> '-1') and (sIdPessJur <> '-1') and
     (sIdPlanoPrev <> '-1') and (sIdPlanAss <> '-1') then
  begin
    qryHstContrib.Close;
    dTotEsperado := 0;
    dTotRecebido := 0;
    with qryHstContrib do
    begin
       Close;
       ParamByName('IdTitular').Value := StrToInt(sIdPessoa);
       ParamByName('IdPessJur').Value := StrToInt(sIdPessJur);
       ParamByName('IdPlanoPrev').Value := StrToInt(sIdPlanoPrev);
       ParamByName('IdPlanAss').Value := StrToInt(sIdPlanAss);
       ParamByName('Mes').Value := sMesRef;
       Open;
       if isEmpty then
       begin
         Close;
         MsgDlg('Não existem contribuições para as opções selecionadas','Erro',mtError,[mbOk,mbHelp],0);
         edTotEsperado.Text := FloatToStrF(dTotEsperado,ffCurrency,13,2);
         edTotRecebido.Text := FloatToStrF(dTotRecebido,ffCurrency,13,2);
         exit;
       end
       else
       begin
         first;
         for i := 1 to RecordCount do
         begin
           dTotEsperado := dTotEsperado + FieldByName('ValorEsperado').AsFloat;
           dTotRecebido := dTotRecebido + FieldByName('ValorRecebido').AsFloat;
           next;
         end;
         first;
       end;
    end;
  end;
  edTotEsperado.Text := FloatToStrF(dTotEsperado, ffCurrency, 13, 2);
  edTotRecebido.Text := FloatToStrF(dTotRecebido, ffCurrency, 13, 2);
end;

procedure TfrmConsContrib.cmbMesChange(Sender: TObject);
begin
  inherited;
  AtualizaGrid;
end;

procedure TfrmConsContrib.spnedAnoChange(Sender: TObject);
begin
  inherited;
  AtualizaGrid;
end;

procedure TfrmConsContrib.FormShow(Sender: TObject);
begin
  inherited;
  bbtnProcurar.SetFocus;
end;

end.
