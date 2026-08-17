unit fCadAtivos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCadastroGridMTCotas, MontaSelect, Db, DBClient, uCMClientDataSet, MAHlpBtn,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,StdCtrls,
  uSistema, Buttons, uCtrlAtivoCOta, uMensErro, dBAseDados, TB97Tlbr, TB97Ctls,
  TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, wwdblook, CMDBLookupCombo, Mask,
  wwdbedit, uCmTypes, uVerificaPreenchimento, uCtrlCarteiraSPC;


type
  TfrmCadAtivos = class(TFrmCadastroGridMTCotas)
    CdsCarteiraSPC: TCMClientDataSet;
    edDescricao: TwwDBEdit;
    cbCarteiraSPC: TCMDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);

    protected
    procedure FazerRefresh; override;


  private
    { Private declarations }
    CtrlAtivoCota : TCtrlAtivoCota;
    CtrlCarteiraSPC: TCtrlCarteiraSPC;
    procedure MensErroMt( sMsgInfo: string );
    function VerificaPreenchimento: boolean;

  public
    { Public declarations }
  end;

var
  frmCadAtivos: TfrmCadAtivos;

implementation

{$R *.DFM}

{ TfrmCadAtivos }

procedure TfrmCadAtivos.MensErroMt(sMsgInfo: string);
begin
  //forma a mensagem de erro
  MsgDlg(sMsgInfo, Sistema.NomeAplicativo, mtWarning,[mbOk],0);
end;



procedure TfrmCadAtivos.FormCreate(Sender: TObject);
begin
  //cria o CtrlObject AtivoCota
  CtrlAtivoCota  :=  TCtrlAtivoCota.Create;
  CtrlAtivoCota.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            MensErroMT);
  CtrlCarteiraSPC  :=  TCtrlCarteiraSPC.Create;
  CtrlCarteiraSPC.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                             Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                             MensErroMT);


  CtrlAtivoCota.cdsAtivoCota := cds;


  CdsCarteiraSPC.Data := CtrlCarteiraSPC.ListaCarteiraSPC;

  FazerRefresh;
  inherited;
end;



procedure TfrmCadAtivos.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlAtivoCota.GravarAtivoCota;
end;



function TfrmCadAtivos.VerificaPreenchimento: boolean;
var
iIdAtivoCota : integer;

begin
//Críticas
  Result := False;
  try
    if edDescricao.Text = '' then
      raise EValidacao.CreateVal('O campo ''DESCRIÇÃO'' não pode estar em branco', edDescricao)
    else if edDescricao.Text[1] = ' ' then
      raise EValidacao.createVal('O campo ''DESCRIÇÃO'' não pode estar com o primeiro caráctere nulo',edDescricao)
    else if cbCarteiraSPC.Text = '' then
      raise EValidacao.createVal('O campo ''CARTEIRA SPC'' não pode estar em branco',cbCarteiraSPC)
    else begin
      if CmeCadastro.Operacao = opInserir then iIdAtivoCota := -1
        else iIdAtivoCota := Cds.FieldByName('IDATIVOCOTA').AsInteger;
      if CtrlAtivoCota.VerificaAtivoCadastrado(edDescricao.Text,iIdAtivoCota) then
       raise EValidacao.createVal ('Já existe um ativo cadastrado com esta descrição',EdDescricao);
    end;
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




procedure TfrmCadAtivos.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := VerificaPreenchimento;
end;



procedure TfrmCadAtivos.FazerRefresh;
begin
  inherited;
  Cds.Data := CtrlAtivoCota.ListaAtivosManuais;
end;

procedure TfrmCadAtivos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlAtivoCota);
   FreeAndNil(CtrlCarteiraSPC);
end;

procedure TfrmCadAtivos.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlAtivoCota.GravarAtivoCota;
end;

end.
