{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão       : 5.10.18 em diante
Pendência    : 27573
Responsável  : Daniel Simões
Data         : 17/03/2008
Descrição    : Ajuste do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit cRelSaldoImovel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, StdCtrls, wwdbdatetimepicker, CMDateTimePicker,
  mImovelouMestre, CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, fcCombo, fcColorCombo;

type
  TcfgRelSaldoImovel = class(TfrmParamReports_Padrao)
    molImovelouMestre1: TmolImovelouMestre;
    GroupBox1: TGroupBox;
    cmdtRef: TCMDateTimePicker;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function VerificaPreenchimento : Boolean;
  public
    { Public declarations }
  end;

var
  cfgRelSaldoImovel: TcfgRelSaldoImovel;

implementation

uses uComunsImobiliario, uVerificaPreenchimento, uMensErro, uSistema, dBaseDados;

{$R *.DFM}

{ TcfgRelSaldoImovel }

procedure TcfgRelSaldoImovel.FormCreate(Sender: TObject);
begin
  inherited;
  cmDtRef.Date := Date();
end;



function TcfgRelSaldoImovel.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
     if cmDtRef.Text = '' then
        raise EValidacao.CreateVal('Informe a data de Referência',cmDtRef);
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

procedure TcfgRelSaldoImovel.bbtnConfirmarClick(Sender: TObject);
var CorLinha : TColor;
    iPosCor  : Integer;
    iImovel,iMestre : Integer;
begin
  inherited;
  if VerificaPreenchimento then begin
    if molImovelouMestre1.iMestre = -1 then begin
      iMestre := molImovelouMestre1.iImovel;
      iImovel := -1;
    end else begin
      iMestre := -1;
      iImovel := molImovelouMestre1.iImovel;
    end;

    cmp_Padrao.ParamByName('idMestre').AsInteger   := iMestre;
    cmp_Padrao.ParamByName('idImovel').AsInteger   := iImovel;
    cmp_Padrao.ParamByName('dDataBase').AsDateTime := cmdtRef.Date;

    // Carrega variáveis com os parametros de cores de linha e separadores
    iPosCor  := 0;
    CorLinha := cboCorLinha.SelectedColor;
    ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);
    cmp_Padrao.ParamByName('bSeparador').AsBoolean := chkLinhas.Checked;
    cmp_Padrao.ParamByName('bCorLinha').AsBoolean  := chkCorLinha.Checked;
    cmp_Padrao.ParamByName('iCorLinha').AsInteger  := iPosCor;

    if bbtnConfirmar.ModalResult <> mrOk then begin
       bbtnConfirmar.ModalResult := mrOk;
       bbtnConfirmar.Click;
    end;
  end;
end;


end.
