unit fExecEncerraContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker,
  mContratoLoja, mImovel, uCtrlContratoLoja;

type
  TfrmExecEncerraContrato = class(TfrmOkCancelar)
    molContratoLoja1: TmolContratoLoja;
    GroupBox1: TGroupBox;
    meDescricao: TMemo;
    Label3: TLabel;
    cmdtFim: TCMDateTimePicker;
    Label1: TLabel;
    cmdtIni: TCMDateTimePicker;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure molContratoLoja1btnBuscaContratoClick(Sender: TObject);
    procedure molContratoLoja1btnLimpaContratoClick(Sender: TObject);
  private
    { Private declarations }
    CtrlContratoLoja : TCtrlContratoLoja;
    function VerificaPreenchimento : Boolean;
  public
    { Public declarations }
  end;

var
  frmExecEncerraContrato: TfrmExecEncerraContrato;

implementation

uses uMensErro, uComunsImobiliario, uVerificaPreenchimento, uSistema, dBaseDados;

{$R *.DFM}

{ TfrmExecEncerraContrato }

procedure TfrmExecEncerraContrato.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlContratoLoja := TCtrlContratoLoja.Create(Sistema.IDEmpresa,Sistema.IDModulo,Sistema.IDUsuario,Sistema.IDEspAcesso,Sistema.UsaPlanoPatro);
  CtrlContratoLoja.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                              ComunsImobiliario.MensErroMT);

  molContratoLoja1.iImovelFiltro := -1;
end;

procedure TfrmExecEncerraContrato.molContratoLoja1btnBuscaContratoClick(Sender: TObject);
begin
  inherited;
  molContratoLoja1.btnBuscaContratoClick(Sender);
  if molContratoLoja1.dInicio > 0 then cmdtIni.Date := molContratoLoja1.dInicio;
end;

procedure TfrmExecEncerraContrato.molContratoLoja1btnLimpaContratoClick(Sender: TObject);
begin
  inherited;
  molContratoLoja1.btnLimpaContratoClick(Sender);
  cmdtIni.Text := '';
end;


function TfrmExecEncerraContrato.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
     if molContratoLoja1.iContrato <= 0 then
        raise EValidacao.CreateVal('Selecione um Contrato', molContratoLoja1.btnBuscaContrato);
     if molContratoLoja1.sStatus = 'E' then
        raise EValidacao.CreateVal('O contrato selecionado já está encerrado', molContratoLoja1.btnBuscaContrato);
     if cmdtFim.Text = '' then
        raise EValidacao.CreateVal('Informe a data de Término', cmdtFim);
     if cmdtIni.Date > cmdtFim.Date then
        raise EValidacao.CreateVal('Data de Término Inválida', cmdtFim);
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


procedure TfrmExecEncerraContrato.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if VerificaPreenchimento then begin
    try
      CtrlContratoLoja.StartTransaction;
      // Encerra Contrato
      if CtrlContratoLoja.EncerraContrato(molContratoLoja1.iContrato, cmdtFim.Date,
                                          meDescricao.Text, Sistema.IdUsuario) then begin
        CtrlContratoLoja.Commit;
        MsgDlg('Encerramento efetuado com sucesso.','Informação',mtInformation,[mbOk],0);
        molContratoLoja1.btnLimpaContratoClick(Self);
        meDescricao.Clear;
        cmdtFim.Clear;
        cmdtIni.Clear; 
      end else begin
        CtrlContratoLoja.Rollback;
      end;
    except
      CtrlContratoLoja.Rollback;
    end;
  end;
end;


end.


