unit FInformeDeParaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, uCmSqlParams, StdCtrls, wwdblook, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCtrlInformeDePara, uCtrlInforme, DBaseDados, uSistema, uMensErro;

type
  TFrmInformeDeParaMT = class(TFrmCadastroMT)
    lblSituacao: TLabel;
    dblkSituacao: TwwDBLookupCombo;
    lblInformeOrigem: TLabel;
    dblkInformeOrigem: TwwDBLookupCombo;
    Label3: TLabel;
    dblkInformeDestino: TwwDBLookupCombo;
    cdsSituacao: TCMClientDataSet;
    cdsInformeOrigem: TCMClientDataSet;
    cdsInformeDestino: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    cdsAux: TCMClientDataSet;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    CtrlInfDePara : TCtrlInformeDePara;
    CtrlInforme   : TCtrlInforme;
    procedure HabilitaComp(pbHabilita : Boolean);
    function JaTemEssaChave: Boolean;  
  public
    { Public declarations }
  end;

var
  FrmInformeDeParaMT: TFrmInformeDeParaMT;

implementation

{$R *.DFM}

procedure TFrmInformeDeParaMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
    cds.data := CtrlInfDePara.ListInformeDePara(StrToInt(MontaSelect.ValoresChave[0]),
                                                StrToInt(MontaSelect.ValoresChave[1]),
                                                StrToInt(MontaSelect.ValoresChave[2]),
                                                False);
                                                 
    CtrlInfDePara.CdsInformeDePara := cds;
  end;

end;

procedure TFrmInformeDeParaMT.FormCreate(Sender: TObject);
begin
  inherited;
  //Cria as classes a serem usadas
  CtrlInfDePara := TCtrlInformeDePara.Create;
  CtrlInfDePara.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                           Sistema.AppRemoteServer,True,nil,nil,False);

  cds.data := CtrlInfDePara.ListInformeDePara(0, 0, 0, True);

  CtrlInfDePara.CdsInformeDePara := cds;

  CtrlInforme := TCtrlInforme.Create;
  CtrlInforme.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                         Sistema.AppRemoteServer,True,nil,nil,False);

  cdsInformeOrigem.data  := CtrlInforme.ListInforme;
  cdsInformeDestino.data := CtrlInforme.ListInforme;
  cdsSituacao.data       := CtrlInfDePara.ListSituacao(0);

end;

procedure TFrmInformeDeParaMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  CtrlInfDePara.GravarInformeDePara;
end;

procedure TFrmInformeDeParaMT.bbtnConfirmarClick(Sender: TObject);
begin
  HabilitaComp( True );

  if ( dblkSituacao.Text = '' ) then
  begin
    MsgDlg('É obrigatório informar a situação.', 'Informação', mtInformation, [mbOk], 0);
    dblkSituacao.SetFocus;
    exit;
  end;

  if ( dblkInformeOrigem.Text = '' ) then
  begin
    MsgDlg('É obrigatório informar a linha de informe de origem.', 'Informação', mtInformation, [mbOk], 0);
    dblkInformeOrigem.SetFocus;
    exit;
  end;

  if ( dblkInformeDestino.Text = '' ) then
  begin
    MsgDlg('É obrigatório informar a linha de informe de destino.', 'Informação', mtInformation, [mbOk], 0);
    dblkInformeDestino.SetFocus;
    exit;
  end;

  if ( dblkInformeOrigem.LookupValue = dblkInformeDestino.LookupValue ) then
  begin
    MsgDlg('Não faz sentido cadastrar um registro com a linha de destino igual a linha de origem.', 'Informação', mtInformation, [mbOk], 0);
    dblkInformeDestino.SetFocus;
    exit;
  end;

  if ( ds.State = dsInsert ) and ( JaTemEssaChave ) then
  begin
    MsgDlg('Já existe registro cadastrado para essa situção com a mesma linha de origem.', 'Informação', mtInformation, [mbOk], 0);
    dblkSituacao.SetFocus;
    exit;
  end;

  cds.FieldByName('IDSITUACAO').AsInteger       := StrToInt( dblkSituacao.LookupValue );
  cds.FieldByName('IDINFORMEORIGEM').AsInteger  := StrToInt( dblkInformeOrigem.LookupValue );
  cds.FieldByName('IDINFORMEDESTINO').AsInteger := StrToInt( dblkInformeDestino.LookupValue );

  inherited;
end;

procedure TFrmInformeDeParaMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  CtrlInfDePara.GravarInformeDePara;
end;

procedure TFrmInformeDeParaMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  CtrlInfDePara.GravarInformeDePara;
end;

procedure TFrmInformeDeParaMT.HabilitaComp(pbHabilita: Boolean);
begin
  lblSituacao.Enabled       := pbHabilita;
  dblkSituacao.Enabled      := pbHabilita;
  lblInformeOrigem.Enabled  := pbHabilita;
  dblkInformeOrigem.Enabled := pbHabilita;
end;

procedure TFrmInformeDeParaMT.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  HabilitaComp(False);
end;

procedure TFrmInformeDeParaMT.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  HabilitaComp(True);
end;

procedure TFrmInformeDeParaMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  HabilitaComp(True);
end;

function TFrmInformeDeParaMT.JaTemEssaChave: Boolean;
begin
  cdsAux.Data := CtrlInfDePara.ListInformeDePara( cds.FieldByName('IDSITUACAO').AsInteger,
                                                  cds.FieldByName('IDINFORMEORIGEM').AsInteger,
                                                  0,
                                                  False );
  if not cdsAux.IsEmpty then
    Result := True
  else
    Result := False;
end;

procedure TFrmInformeDeParaMT.FormDestroy(Sender: TObject);
begin
  inherited;
  CtrlInfDePara.Free;
  CtrlInforme.Free;
end;

end.
