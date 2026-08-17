unit FConfPgJurosAmort;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, wwdblook, CMDBLookupCombo, Mask, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList;

type
  TfrmConfPgJurosAmort = class(TfrmCadastroCS)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    dblkInvestimento: TCMDBLookupCombo;
    Label2: TLabel;
    qryInvestimento: TwwQuery;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    GroupBox2: TGroupBox;
    qryJUROS: TFloatField;
    qryAMORTIZACAO: TFloatField;
    Label3: TLabel;
    Label4: TLabel;
    dbrJuros: TDBRealEdit;
    dbrAmortizacao: TDBRealEdit;
    dtDataMov: TCMDateTimePicker;
    procedure dblkInvestimentoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtDataMovExit(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
    procedure AtuQry(par1: string; par2: Integer);
  public
    { Public declarations }
    vlAmortAnt: double;
    vlJurosAnt: double;
  end;

var
  frmConfPgJurosAmort: TfrmConfPgJurosAmort;

implementation

{$R *.DFM}
procedure TfrmConfPgJurosAmort.AtuQry(par1: string; par2: Integer);
begin
   qry.Close;
   qry.Params[1].Value := 0;
   if (par1 <> '') and (par2 <> null) and (par2 > 0)  then begin
      qry.Params[0].Value := par1;
      qry.Params[1].Value := par2;
      dtDataMov.Text := par1;
      qryInvestimento.Locate('IDINVESTIMENTO',par2,[]);
      dblkInvestimento.Text := qryInvestimento.FieldByName('DESCINVESTIMENTO').AsString;
      end
   else begin
      dtDataMov.Text := '';
      dblkInvestimento.Text := '';
      qryInvestimento.First;
   end;
   qry.Open;

   if qry.FieldByName('JUROS').AsFloat <= 0 then
      dbrJuros.Enabled := false
   else dbrJuros.Enabled := true;

   if qry.FieldByName('AMORTIZACAO').AsFloat <= 0 then
      dbrAmortizacao.Enabled := false
   else dbrAmortizacao.Enabled := true;

   if (dbrAmortizacao.Enabled) or (dbrJuros.Enabled) then
      sbtnAlterar.Enabled := true
   else sbtnAlterar.Enabled := false;

end;

procedure TfrmConfPgJurosAmort.FormShow(Sender: TObject);
begin
  inherited;
  qryInvestimento.Open;
  dtDataMov.Text := DateToStr(Date);
  AtuQry('',-1);
end;

procedure TfrmConfPgJurosAmort.CmeCadastroFind(Sender: TObject);
var dataatu: TDateTime;
begin
  inherited;
  if MontaSelect.RetornouValor then begin
     AtuQry(MontaSelect.ValoresChave[0],StrToInt(MontaSelect.ValoresChave[1]));
  end;
end;


procedure TfrmConfPgJurosAmort.dblkInvestimentoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  AtuQry(dtDataMov.Text,StrToInt(dblkInvestimento.LookupValue));
end;

procedure TfrmConfPgJurosAmort.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   if dbrJuros.Enabled then
      dbrJuros.SetFocus
   else if dbrAmortizacao.Enabled then
      dbrAmortizacao.SetFocus;
end;


procedure TfrmConfPgJurosAmort.sbtnAlterarClick(Sender: TObject);
begin
  vlAmortAnt := dbrAmortizacao.Value;
  vlJurosAnt := dbrJuros.Value;
  inherited;
end;


procedure TfrmConfPgJurosAmort.dtDataMovExit(Sender: TObject);
begin
  inherited;
  AtuQry(dtDataMov.Text,StrToInt(dblkInvestimento.LookupValue));
end;

end.
