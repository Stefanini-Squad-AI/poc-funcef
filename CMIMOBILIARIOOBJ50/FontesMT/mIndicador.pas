unit mIndicador;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolIndicador = class(TFrame)
    btnLimpaIndicador: TBitBtn;
    Label5: TLabel;
    edtIndicador: TEdit;
    btnBuscaIndicador: TBitBtn;
    procedure btnBuscaIndicadorClick(Sender: TObject);
    procedure btnLimpaIndicadorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iIndicador : Integer;
    sIndicador : String;
    sTipoDado  : String;
    sTipoValor : String;
    sDscTipoDado    : String;
    sDscTipoValor   : String;
    sGrpApuracao    : String;
    sSubGrpApuracao : String;
    sPeriodicidade  : String;
    bContrato       : Boolean;
//---------- 24/03/2004 - Marcio Motta - Pendência: 16307 ------------------------------------------
    iIdGrpPadrao    : integer;
    iIdSubGrpPadrao : integer;
    sDscGrpPadrao   : String;
    sDscSubGrpPadrao: String;
//------- Fim Implementação/Alteração - Marcio Motta -----------------------------------------------
  end;

implementation

uses dMS;

{$R *.DFM}

procedure TmolIndicador.btnBuscaIndicadorClick(Sender: TObject);
begin
  sGrpApuracao    := '';
  sSubGrpApuracao := '';
  bContrato       := False;

  dtmMS.MS_Indicador.Executar;
  Repaint;
  if dtmMS.MS_Indicador.RetornouValor then begin
     iIndicador        := StrToInt(dtmMS.MS_Indicador.ValoresChave[0]);
     sIndicador        := dtmMS.MS_Indicador.ValoresChave[1];
     edtIndicador.Text := sIndicador;
     sTipoDado         := dtmMS.MS_Indicador.ValoresChave[2];
     sTipoValor        := dtmMS.MS_Indicador.ValoresChave[3];
     sGrpApuracao      := dtmMS.MS_Indicador.ValoresChave[4];
     sSubGrpApuracao   := dtmMS.MS_Indicador.ValoresChave[5];
//---------- 24/03/2004 - Marcio Motta - Pendência: 16307 ------------------------------------------
     if dtmMS.MS_Indicador.ValoresChave[8] <> '' then
       iIdGrpPadrao      := StrToInt(dtmMS.MS_Indicador.ValoresChave[8]);
     if dtmMS.MS_Indicador.ValoresChave[9] <> '' then
       iIdSubGrpPadrao   := StrToInt(dtmMS.MS_Indicador.ValoresChave[9]);
     sDscGrpPadrao     := dtmMS.MS_Indicador.ValoresChave[10];
     sDscSubGrpPadrao  := dtmMS.MS_Indicador.ValoresChave[11];
//------- Fim Implementação/Alteração - Marcio Motta -----------------------------------------------
     if sTipoDado = 'N' then sDscTipoDado := 'Numérico';
     if sTipoDado = 'C' then sDscTipoDado := 'Caracter';
     if sTipoDado = 'D' then sDscTipoDado := 'Data';

     if sTipoValor = 'R' then sDscTipoValor := 'Receita';
     if sTipoValor = 'D' then sDscTipoValor := 'Despesa';
     if sTipoValor = 'E' then sDscTipoValor := 'Desempenho';

     if dtmMS.MS_Indicador.ValoresChave[6] = 'S' then bContrato       := True;
     sPeriodicidade := dtmMS.MS_Indicador.ValoresChave[7];
  end;
  btnBuscaIndicador.SetFocus;
end;

procedure TmolIndicador.btnLimpaIndicadorClick(Sender: TObject);
begin
  iIndicador        := -1;
  sIndicador        := '';
  sTipoDado         := '';
  sTipoValor        := '';
  sDscTipoDado      := '';
  sDscTipoValor     := '';
  sGrpApuracao      := '';
  sSubGrpApuracao   := '';
  sPeriodicidade    := '';
  bContrato         := False;
  edtIndicador.Text := '';
//---------- 24/03/2004 - Marcio Motta - Pendência: 16307 ------------------------------------------
  iIdGrpPadrao      := -1;
  iIdSubGrpPadrao   := -1;
  sDscGrpPadrao     := '';
  sDscSubGrpPadrao  := '';
//------- Fim Implementação/Alteração - Marcio Motta -----------------------------------------------
end;

end.
