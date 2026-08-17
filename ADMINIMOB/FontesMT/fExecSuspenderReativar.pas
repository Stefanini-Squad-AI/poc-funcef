{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27394
Responsável : Daniel Simões
Data        : 14/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fExecSuspenderReativar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, mImovelAtivo, mContrato, uCtrlContratoImovel,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmExecSuspenderReativar = class(TFrmOkCancelarImob)
    lblVigencia: TLabel;
    molContrato: TmolContrato;
    mmoEvento: TMemo;
    Label1: TLabel;
    edtDataLanc: TCMDateTimePicker;
    Label2: TLabel;
    procedure molContratobtnBuscaContratoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure molContratobtnLimpaContratoClick(Sender: TObject);
  private
    CtrlContratoImovel : TCtrlContratoImovel;
    function VerificaPreenchimento : boolean;

  public

  end;

var
  frmExecSuspenderReativar: TfrmExecSuspenderReativar;

implementation

uses
  dBaseDados, uMensErro, uSistema, uComunsImobiliario, uModuloImobiliario,
  uVerificaPreenchimento, dMS;

{$R *.DFM}

procedure TfrmExecSuspenderReativar.molContratobtnBuscaContratoClick(
  Sender: TObject);
begin
  inherited;
  molContrato.btnBuscaContratoClick(Sender);
  if dtmMS.MS_Contrato.RetornouValor then begin
    case molContrato.sFlgStatus[1] of
      'R' : begin
              lblVigencia.Caption := 'Rescindido';
              lblVigencia.Visible := True;
              lblVigencia.Font.Color := clRed;
              bbtnConfirmar.Enabled := False;
            end;
      'V' : begin
              lblVigencia.Caption := 'Vigente';
              lblVigencia.Visible := True;
              lblVigencia.Font.Color := clBlue;
              bbtnConfirmar.Caption := 'Suspender';
              bbtnConfirmar.Enabled := True;
            end;
      'E' : begin
              lblVigencia.Caption := 'Encerrado';
              lblVigencia.Visible := True;
              lblVigencia.Font.Color := clRed;
              bbtnConfirmar.Enabled := False;
            end;
      'S' : begin
              lblVigencia.Caption := 'Suspenso';
              lblVigencia.Visible := True;
              lblVigencia.Font.Color := clRed;
              bbtnConfirmar.Caption := 'Reativar';
              bbtnConfirmar.Enabled := True;
            end;
    else
      begin
        lblVigencia.Caption := '';
        lblVigencia.Visible := False;
      end;
    end; {Case}
  end; {IF}
end;

procedure TfrmExecSuspenderReativar.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlContratoImovel := TCtrlContratoImovel.Create( Sistema.IdEmpresa,
                                                    Sistema.IdModulo,
                                                    Sistema.IdUsuario,
                                                    Sistema.IdEspAcesso,
                                                    Sistema.UsaPlanoPatro );
                                                    
  CtrlContratoImovel.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                                ComunsImobiliario.MensErroMT);

  edtDatalanc.Date := Date;
end;

function TfrmExecSuspenderReativar.VerificaPreenchimento: boolean;
begin
   Result := False;

   try
      if (molContrato.edtContrato.Text = '') then
         raise EValidacao.CreateVal('É necessário indicar o Contrato!', molContrato.btnBuscaContrato);

      if (edtDataLanc.Text = '') then
         raise EValidacao.CreateVal('É necessário indicar uma data para o evento!', edtDataLanc);

      if (mmoEvento.Lines.Count = 0) then
         raise EValidacao.CreateVal('É necessário descrever o evento!', mmoEvento);

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

procedure TfrmExecSuspenderReativar.bbtnConfirmarClick(Sender: TObject);
var
  i : integer;
  sTexto, sFlg : string;
begin
  inherited;

  if VerificaPreenchimento then begin
      // Altera o status entre suspenso e vigente.
      if molContrato.sFlgStatus = 'S' then
        sFlg := 'V'
      else if molContrato.sFlgStatus = 'V' then
        sFlg := 'S';

      // Monta a string do memo para gravar no banco
      for i := 0 to mmoEvento.Lines.Count - 1 do
        sTexto := sTexto + #13 + mmoEvento.Lines[i];

      // Suspende ou Reativa o contrato de acordo com o flag passado
      if CtrlContratoImovel.SuspenderReativar(molContrato.iContrato, edtDataLanc.Date,
                                              sTexto, sFlg) then begin
        case sFlg[1] of
          'S' : begin
                  lblVigencia.Caption := 'Suspenso';
                  lblVigencia.Font.Color := clRed;
                  bbtnConfirmar.Caption := 'Reativar';
                end;
          'V' : begin
                  lblVigencia.Caption := 'Vigente';
                  lblVigencia.Font.Color := clBlue;
                  bbtnConfirmar.Caption := 'Suspender';
                end;
        end; {Case}

        MsgDlg('Processo Concluído', 'Informação', mtInformation, [mbok], 0);

        mmoEvento.Lines.Clear;
        molContrato.btnLimpaContratoClick( self );
        lblVigencia.Visible := False;
      end; {IF}
  end;
end;

procedure TfrmExecSuspenderReativar.molContratobtnLimpaContratoClick(Sender: TObject);
begin
  inherited;
  molContrato.btnLimpaContratoClick(Sender);

  mmoEvento.Clear;
  edtDataLanc.Clear;

  lblVigencia.Caption := '';
  lblVigencia.Visible := False;
  bbtnConfirmar.Caption := 'Suspender';

end;

end.
