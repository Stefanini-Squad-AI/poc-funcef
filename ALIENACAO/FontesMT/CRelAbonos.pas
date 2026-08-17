{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão      : 5.10.18 em diante...
Pendência   : 27508
Responsável : Daniel Simões
Data        : 17/03/2008
Descrição   : Ajuste dos Help Contexts...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit CRelAbonos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, StdCtrls, wwdbdatetimepicker, CMDateTimePicker,
  mProposta, CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls,uCmSqlParams, Db, DBClient, uCMClientDataSet,
  wwdblook, uCtrlTipoImovel;

type
  TcfgRelAbonos = class(TfrmParamReports_Padrao)
    GroupBox1: TGroupBox;
    cmdtInicial: TCMDateTimePicker;
    cmdtFinal: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    bgSegmento: TGroupBox;
    DBcboTipoImovel: TwwDBLookupCombo;
    GroupBox2: TGroupBox;
    cboTipoAbono: TComboBox;
    CdsTipoImovel: TCMClientDataSet;
    CdsTipoImovelCODTIPIMOVEL: TStringField;
    CdsTipoImovelDESCTIPOIMOVEL: TStringField;
    molProposta1: TmolProposta;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure molProposta1btnBuscaPropClick(Sender: TObject);
  private
    { Private declarations }
    CtrlTipoImovel : TCtrlTipoImovel;
    function VerificaPreenchimento : boolean;
  public
    { Public declarations }
  end;

var
  cfgRelAbonos: TcfgRelAbonos;

implementation

uses uDiasUteis, uComunsImobiliario, uVerificaPreenchimento, uMensErro, uSistema, dBaseDados;

{$R *.DFM}

procedure TcfgRelAbonos.FormCreate(Sender: TObject);
begin
  inherited;

  // Inicializa os CtrlObjects
   CtrlTipoImovel := TCtrlTipoImovel.Create;
  CtrlTipoImovel.Initialize(dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);

  cdsTipoImovel.Data := CtrlTipoImovel.LookupTipoImovel;

end;


procedure TcfgRelAbonos.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlTipoImovel );
  inherited;
end;


procedure TcfgRelAbonos.bbtnConfirmarClick(Sender: TObject);
var
  sTipoAbono : String;
begin

  If VerificaPreenchimento then begin
    inherited;

    cmp_Padrao.ParamByName('iContrato').AsInteger := molProposta1.iProposta;

    if Trim(DBcboTipoImovel.Text) <> '' then
      cmp_Padrao.ParamByName('sSegmento').AsString := CdsTipoImovel.FieldByName('CODTIPIMOVEL').AsString
    else
      cmp_Padrao.ParamByName('sSegmento').AsString := '';

    cmp_Padrao.ParamByName('sDataIni').AsString := cmdtInicial.Text;
    cmp_Padrao.ParamByName('sDataFim').AsString := cmdtFinal.Text;

    case cboTipoAbono.ItemIndex of
      0 : sTipoAbono := 'C';
      1 : sTipoAbono := 'A';
      2 : sTipoAbono := 'T';
      3 : sTipoAbono := 'J';
      4 : sTipoAbono := 'M';
      5 : sTipoAbono := 'E';
      6 : sTipoAbono := 'R';
    end;

    cmp_Padrao.ParamByName('sTipoAbono').AsString := sTipoAbono;

    If bbtnConfirmar.ModalResult <> mrOk then
     begin
       bbtnConfirmar.ModalResult := mrOk;
       bbtnConfirmar.Click;
     end

  end;

end;


procedure TcfgRelAbonos.molProposta1btnBuscaPropClick(Sender: TObject);
begin
  inherited;
  molProposta1.btnBuscaPropClick(2,False,Sender);
end;


function TcfgRelAbonos.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
    If ( (trim(cmdtInicial.Text) = '') and  (trim(cmdtFinal.Text) <> '') ) then
     raise Evalidacao.createVal('A data Inicial não foi informada', cmdtInicial );

    If ( (trim(cmdtInicial.Text) <> '') and  (trim(cmdtFinal.Text) = '') ) then
     raise Evalidacao.createVal('A data Final não foi informada', cmdtFinal );

    If ( (trim(cmdtInicial.Text) <> '') and  (trim(cmdtFinal.Text) <> '') ) and
        (cmdtInicial.Date > cmdtFinal.Date) then
     raise Evalidacao.createVal('A data Inicial não pode ser maior que a data final do período', cmdtInicial );
  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.Message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;

end;


end.
