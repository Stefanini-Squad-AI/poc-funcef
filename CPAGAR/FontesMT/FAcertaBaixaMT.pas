{------------------------------------------------------------------------------
 Rotinas   : procure pelo número da pendência
 Data      : 27/04/2005
 Autor     : André Tavares
 Pendência : 19097
 Descrição : retirar os parâmetros FLGEXCLUIPLANIL e FLGEXCLUICONTAB
------------------------------------------------------------------------------}

unit FAcertaBaixaMT;


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ComCtrls, Db, DBTables, Wwquery, wwdbdatetimepicker,
  CMDateTimePicker, ExtCtrls, DBClient, uCMClientDataSet, uCmSqlParams, uCtrlAcertaBaixa,
  uCtrlParamIntegra;

type
  TfrmAcertaBaixaMT = class(TfrmOkCancelar)
    RichEdit1: TRichEdit;
    GroupBox1: TGroupBox;
    deDataFim: TCMDateTimePicker;
    deDataIni: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    prgBarAtuFluxo: TProgressBar;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    _AcertaBaixa : TCtrlAcertaBaixa;
  public
    { Public declarations }
  end;

var
  frmAcertaBaixaMT: TfrmAcertaBaixaMT;

implementation

{$R *.DFM}

uses uMensErro,uDataBase, DBaseDados, uSistema, uFuncaoGeral, uModulo;

procedure TfrmAcertaBaixaMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if deDataIni.Text = '' then
  begin
    MsgDlg('Informe a Data Inicial','Erro',mtError,[mbOk],0);
    Exit;
  end;
  if deDataFim.Text = '' then
  begin
    MsgDlg('Informe a Data Final','Erro',mtError,[mbOk],0);
    Exit;
  end;
  bbtnConfirmar.Enabled := False;
  if not _AcertaBaixa.GravaAcertoBaixa(Sistema.IDEmpresa, Sistema.IDUsuario, Sistema.IDModulo,
                                       ParamIntegra.Plano, Sistema.UsaPlanoPatro,
                                       true, deDataIni.Text, deDataFim.Text) then
    MsgDlg(_AcertaBaixa.MessageInfo,'Erro',mtError,[mbOk],0)
  else
    MsgDlg(_AcertaBaixa.MessageInfo,'Informação',mtInformation,[mbOk],0);
  bbtnConfirmar.Enabled := True;
end;

procedure TfrmAcertaBaixaMT.FormCreate(Sender: TObject);
begin
  inherited;
  _AcertaBaixa := TCtrlAcertaBaixa.Create;
  _AcertaBaixa.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

// Daniel Simões - 25/01/2006 - Início------------------------------------------
  if ParamIntegra.Recpag = 'P' then
  begin
    HelpContext           := 30075;
    bbtnAjuda.HelpContext := 30075;
  end;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------

end;

procedure TfrmAcertaBaixaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  _AcertaBaixa.Free;
end;

end.
