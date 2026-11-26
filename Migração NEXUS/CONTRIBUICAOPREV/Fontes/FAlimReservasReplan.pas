// *************************************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ********************************************
// *************************************************************************************************
//  Autor      : Ádler Souza
//  Pendência  : SOL 146714 KINTANA 1002749
//  Data       : 28/10/2010
//  Descrição  : Correção na alimentação dos parâmetros dos meses.
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     :
//  Pendência  : 19462
//  Data       : 13/06/2005
//  Descrição  : ALTEREI AS PROCEDURES E A TELA PARA EXECUTAR EM UM PERÍODO DE MESES
//------------------------------------------------------------------------------

unit FAlimReservasReplan;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Spin, Db, DBTables, MontaSelect ;

type
  TfrmAlimReservasReplan = class(TfrmOkCancelar)
    spedAnoCobIni: TSpinEdit;
    spedAnoCobFim: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    StrProcAlimenta: TStoredProc;
    MontaSelectPart: TMontaSelect;
    GroupBox2: TGroupBox;
    lblParticip: TLabel;
    Label3: TLabel;
    lblPatro: TLabel;
    lblMatricula: TLabel;
    edNome: TEdit;
    edPlano: TEdit;
    edPatro: TEdit;
    edMatricula: TEdit;
    bbtnProcurar: TBitBtn;
    btndesfazselec: TBitBtn;
    cmbMesCobIni: TComboBox;
    cmbMesCobFim: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure btndesfazselecClick(Sender: TObject);
  private
    { Private declarations }
  public
     function ClienteNumero(sNumero : string):string;  
    { Public declarations }
  end;


var
  frmAlimReservasReplan: TfrmAlimReservasReplan;


implementation


{$R *.DFM}

procedure TfrmAlimReservasReplan.FormShow(Sender: TObject);
var
  AYear, AMonth, ADay: Word;
begin
  inherited;
  DecodeDate(date, AYear, AMonth, ADay);

  spedAnoCobIni.Text := IntToStr(AYear);
  spedAnoCobFim.Text := IntToStr(AYear);

  cmbMesCobIni.ItemIndex := 0;
  cmbMesCobFim.ItemIndex := 0;  

end;

procedure TfrmAlimReservasReplan.bbtnConfirmarClick(Sender: TObject);
var sAnoMesCobrancaTela, sAnoMesCobrancaTelaFim : String;
begin
  inherited;


  sAnoMesCobrancaTela  := Trim(spedAnoCobIni.Text)+'/';
  if cmbMesCobIni.ItemIndex < 9   //Ádler Souza - SOL 146714 KINTANA 1002749
  then sAnoMesCobrancaTela := sAnoMesCobrancaTela+'0'+IntToStr(cmbMesCobIni.ItemIndex+1)
  else sAnoMesCobrancaTela := sAnoMesCobrancaTela+IntToStr(cmbMesCobIni.ItemIndex+1);
  StrProcAlimenta.ParamByName('pmesini').AsString :=   sAnoMesCobrancaTela ;


  sAnoMesCobrancaTela  := Trim(spedAnoCobFim.Text)+'/';
  if cmbMesCobFim.ItemIndex < 9   //Ádler Souza - SOL 146714 KINTANA 1002749
  then sAnoMesCobrancaTela := sAnoMesCobrancaTela+'0'+IntToStr(cmbMesCobFim.ItemIndex+1)
  else sAnoMesCobrancaTela := sAnoMesCobrancaTela+IntToStr(cmbMesCobFim.ItemIndex+1);
  StrProcAlimenta.ParamByName('pmesfim').AsString :=   sAnoMesCobrancaTela ;


  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '') then
     StrProcAlimenta.ParamByName('pidpessoa').AsFloat := StrToFloat(ClienteNumero(MontaSelectPart.ValoresChave[0]))
  else StrProcAlimenta.ParamByName('pidpessoa').AsFloat := 0;

  try
     StrProcAlimenta.ExecProc;
     showmessage('Alimentação bem sucedida.');
  except
     showmessage('Alimentação com erro!');
  end;

end;


function TfrmAlimReservasReplan.ClienteNumero(sNumero : string):string;
var i : integer;
    sResult,
    sCliente : string;
    bPrimPonto : boolean;
begin
   if Trim(sNumero)  = ''
   then begin
      Result := '0';
      exit;
   end;

   sCliente := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1
   do begin
     if sNumero[i] = '.'
     then begin
        if not bPrimPonto
        then begin
           sCliente := sCliente + DecimalSeparator;
           bPrimPonto := True;
        end
        else sCliente := sCliente;
     end
     else begin
        if sNumero[i] <> DecimalSeparator
        then sCliente := sCliente + sNumero[i]
        else begin
           if not bPrimPonto
           then begin
              sCliente := sCliente+DecimalSeparator;
              bPrimPonto := True;
           end
           else sCliente := sCliente;
        end;
     end;
   end;
   sResult := '';
   for i := length(sCliente) downto 1
   do begin
      sResult := sResult + sCliente[i];
   end;
   Result := sResult;
end;

procedure TfrmAlimReservasReplan.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
     edNome.Text      := MontaSelectPart.ValoresChave[2];
     edMatricula.Text := MontaSelectPart.ValoresChave[3];
     edPatro.Text     := MontaSelectPart.ValoresChave[4];
     edPlano.Text     := MontaSelectPart.ValoresChave[6];
  end;
end;

procedure TfrmAlimReservasReplan.btndesfazselecClick(Sender: TObject);
begin
  inherited;
  edNome.Text      := '';
  edMatricula.Text := '';
  edPatro.Text     := '';
  edPlano.Text     := '';
end;

end.
