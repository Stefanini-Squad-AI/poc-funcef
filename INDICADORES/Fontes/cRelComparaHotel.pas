unit cRelComparaHotel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, fcCombo,
  fcColorCombo, Mask, wwdbedit, Wwdbspin, mHotel;

type
  TcfgRelComparaHotel = class(TfrmParamReports_Padrao)
    molHotel1: TmolHotel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cboMes: TComboBox;
    spnAno: TwwDBSpinEdit;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    function VerificaPreenchimento: Boolean;
  public
    { Public declarations }
  end;

var
  cfgRelComparaHotel: TcfgRelComparaHotel;

implementation

uses uDiasUteis, uComunsImobiliario, uVerificaPreenchimento, uMensErro, uSistema, dBaseDados, uModuloIndicadores;

{$R *.DFM}

procedure TcfgRelComparaHotel.FormCreate(Sender: TObject);
begin
  inherited;
  molHotel1.InicializaFrame;
  spnAno.Value       := DiasUteis.ExtraiAno(Date);
  cboMes.ItemIndex   := DiasUteis.ExtraiMes(Date) -1;
end;

procedure TcfgRelComparaHotel.FormDestroy(Sender: TObject);
begin
  molHotel1.DestroiFrame;
  inherited;
end;

function TcfgRelComparaHotel.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
     if molHotel1.cdsResult.IsEmpty then
        raise EValidacao.CreateVal('Selecione os Hotéis a serem comparados', molHotel1.chklbHotel);
     if molHotel1.cdsResult.RecordCount > 7 then
        raise EValidacao.CreateVal('Selecione no máximo 7 Hotéis a serem comparados', molHotel1.chklbHotel);
     if cboMes.ItemIndex = -1 then
        raise EValidacao.CreateVal('Informe o Mês de Referência',cboMes);
     if spnAno.Value <= 0 then
        raise EValidacao.CreateVal('Informe o Ano de Referência',spnAno);
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

procedure TcfgRelComparaHotel.bbtnConfirmarClick(Sender: TObject);
var CorLinha : TColor;
    iPosCor  : Integer;
begin
  inherited;
  molHotel1.BuscaResult;
  if VerificaPreenchimento then begin
    cmp_Padrao.ParamByName('iMes').AsInteger := cboMes.ItemIndex + 1;
    cmp_Padrao.ParamByName('iAno').AsFloat   := spnAno.Value;

    // Transfere os hotéis selecionados
    with molHotel1.CdsResult do begin
      First;
      while not Eof do begin
        cmp_Padrao.ParamValues[(molHotel1.CdsResult.RecNo + 4)].AsInteger := FieldByName('IDIMOVEL').AsInteger;
        cmp_Padrao.ParamValues[(molHotel1.CdsResult.RecNo + 11)].AsString := FieldByName('NOMCONTRATO').AsString;
        Next;
      end;
    end;

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
