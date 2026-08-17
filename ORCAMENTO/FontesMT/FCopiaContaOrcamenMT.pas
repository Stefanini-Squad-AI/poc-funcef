{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Julho/2002                             }
{                                                       }
{*******************************************************}
Unit FCopiaContaOrcamenMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ComCtrls, Db, DBTables, Wwquery, wwdblook, StdCtrls,
  fcLabel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  ExtCtrls, TREdit, wwdbdatetimepicker, CMDateTimePicker, Mask, MskEdDlg,
  uCtrlCopiaContaOrcamen, DBClient, uCMClientDataSet, uCMTypes, Wwdatsrc, Grids, DBGrids,
  uCmSqlParams;

Type
  TfrmCopiaContaOrcamenMT = class(TfrmOkCancelar)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    fcLabel3: TfcLabel;
    Panel4: TPanel;
    fcLabel1: TfcLabel;
    edtIniOri: TEdit;
    edtIniDes: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    dblkCCustoOri: TwwDBLookupCombo;
    lblCCustoDeb: TLabel;
    dblkCRespOri: TwwDBLookupCombo;
    Label3: TLabel;
    dblkAtivProjOri: TwwDBLookupCombo;
    Label4: TLabel;
    lblPlanoPrevOri: TLabel;
    lblPatroOri: TLabel;
    dblkCCustoDes: TwwDBLookupCombo;
    Label5: TLabel;
    dblkCRespDes: TwwDBLookupCombo;
    Label6: TLabel;
    dblkAtivProjDes: TwwDBLookupCombo;
    Label7: TLabel;
    lblPlanoPrevDes: TLabel;
    lblPatroDes: TLabel;
    pgrStatusConta: TProgressBar;
    pgrStatusComp: TProgressBar;
    Label10: TLabel;
    Label11: TLabel;
    cbIniciais: TCheckBox;
    reNumDigFix: TRealEdit;
    lblNumDigFix: TLabel;
    lblNomeOrigem: TLabel;
    lblNomeDestino: TLabel;
    edNomeOrigem: TEdit;
    edNomeDest: TEdit;
    edCCOri: TEdit;
    lblCCOri: TLabel;
    lblCCDest: TLabel;
    edCCDest: TEdit;
    cbTransfSaldo: TCheckBox;
    Label8: TLabel;
    edIniConta: TEdit;
    dblkPlanoPrevOri: TwwDBLookupCombo;
    dblkPatroOri: TwwDBLookupCombo;
    dblkPatroDes: TwwDBLookupCombo;
    dblkPlanoPrevDes: TwwDBLookupCombo;
    cbapartirdata: TCheckBox;
    dteData: TCMDateTimePicker;
    CdsCCustoOri: TCMClientDataSet;
    CdsPatroOri: TCMClientDataSet;
    CdsPlanoPrevOri: TCMClientDataSet;
    CdsAtivProjOri: TCMClientDataSet;
    CdsCRespOri: TCMClientDataSet;
    CdsCCustoDes: TCMClientDataSet;
    CdsCRespDes: TCMClientDataSet;
    CdsAtivProjDes: TCMClientDataSet;
    CdsPlanoPrevDes: TCMClientDataSet;
    CdsPatroDes: TCMClientDataSet;

    Procedure FormShow(Sender: TObject);
    Procedure FormClose(Sender: TObject; var Action: TCloseAction);

    Procedure bbtnConfirmarClick(Sender: TObject);
    Procedure cbIniciaisClick(Sender: TObject);
    Procedure cbapartirdataClick(Sender: TObject);
    Procedure cbTransfSaldoClick(Sender: TObject);
    Procedure FormCreate(Sender: TObject);

  Private
    { Private declarations }

    Mensagem              : TEdit;
    CtrlCopiaContaOrcamen : TCtrlCopiaContaOrcamen;

    Procedure InicializaBarra;
    Procedure MensagemChange(Sender: TObject);

  Public
    { Public declarations }
    scodigo, snomeori, snomedes,sCodDes : string;
    imodalResult : integer;
  End;

Var
  frmCopiaContaOrcamenMT: TfrmCopiaContaOrcamenMT;

Implementation

Uses
  USistema, UMensErro, UDatabase, DBaseDados, UFuncaoGeral, UModulo,
  FConfAltCont;

{$R *.DFM}
//************************************************
Procedure TfrmCopiaContaOrcamenMT.FormCreate(Sender: TObject);
Begin
  Inherited;

  Mensagem := TEdit.Create( Nil );
  Mensagem.OnChange := MensagemChange;

  CtrlCopiaContaOrcamen := TCtrlCopiaContaOrcamen.Create;
  CtrlCopiaContaOrcamen.Initialize( DtmBaseDados.dbBaseDados, True,
                                    Sistema.ConnectionType,   Sistema.ConnectionSide,
                                    Sistema.AppRemoteServer,  True, nil, nil, False );

  CtrlCopiaContaOrcamen.IdEmpresa := Sistema.IdEmpresa;
  CtrlCopiaContaOrcamen.Mensagem  := Mensagem;
  CtrlCopiaContaOrcamen.iPlanoOrc := Modulo.iPlanoOrc;

  CtrlCopiaContaOrcamen.CdsCCustoOri    := CdsCCustoOri;
  CtrlCopiaContaOrcamen.CdsPatroOri     := CdsPatroOri;
  CtrlCopiaContaOrcamen.CdsPlanoPrevOri := CdsPlanoPrevOri;
  CtrlCopiaContaOrcamen.CdsAtivProjOri  := CdsAtivProjOri;
  CtrlCopiaContaOrcamen.CdsCRespOri     := CdsCRespOri;

  CtrlCopiaContaOrcamen.CdsCCustoDes    := CdsCCustoDes;
  CtrlCopiaContaOrcamen.CdsPatroDes     := CdsPatroDes;
  CtrlCopiaContaOrcamen.CdsPlanoPrevDes := CdsPlanoPrevDes;
  CtrlCopiaContaOrcamen.CdsAtivProjDes  := CdsAtivProjDes;
  CtrlCopiaContaOrcamen.CdsCRespDes     := CdsCRespDes;

  InicializaBarra;

  CtrlCopiaContaOrcamen.AbreCds;
End;
//************************************************
Procedure TfrmCopiaContaOrcamenMT.FormShow(Sender: TObject);
Begin
  Inherited;

  If ( Not Sistema.UsaPlanoPatro ) Then Begin

    dblkPlanoPrevOri.enabled := false;
    dblkPlanoPrevDes.enabled := false;

    lblPlanoPrevOri.enabled := false;
    lblPlanoPrevDes.enabled := false;

    dblkPatroOri.enabled := false;
    dblkPatroDes.enabled := false;

    lblPatroOri.enabled := false;
    lblPatroDes.enabled := false;
  End;
End;
//************************************************
Procedure TfrmCopiaContaOrcamenMT.FormClose(Sender: TObject; var Action: TCloseAction);
Begin
  Inherited;

  Mensagem.Free;
  CtrlCopiaContaOrcamen.Free;
End;
//************************************************
Procedure TfrmCopiaContaOrcamenMT.bbtnConfirmarClick(Sender: TObject);
Var
  MensagemLocal : String;

Begin
  Inherited;

  Try
    MensagemLocal := '';

    CtrlCopiaContaOrcamen.TransfereContas( edtIniOri.text,
                                           edtIniDes.text,
                                           edIniConta.text,
                                           edNomeOrigem.text,
                                           edNomeDest.text,
                                           edCCOri.Text,
                                           edCCDest.Text,
                                           dteData.Text,
                                           cbIniciais.Checked,
                                           cbTransfSaldo.Checked,
                                           cbapartirdata.Checked,
                                           dblkCCustoDes.Text,
                                           dblkCCustoDes.LookUpValue,
                                           dblkAtivProjDes.Text,
                                           dblkAtivProjDes.LookUpValue,
                                           dblkPatroDes.Text,
                                           dblkPatroDes.LookupValue,
                                           dblkPlanoPrevDes.Text,
                                           dblkPlanoPrevDes.LookUpValue,
                                           dblkCrespOri.Text,
                                           dblkCrespOri.LookUpValue,
                                           dblkCrespDes.Text,
                                           dblkCrespDes.LookUpValue,
                                           dblkAtivProjOri.Text,
                                           dblkAtivProjOri.LookUpValue,
                                           dblkCCustoOri.Text,
                                           dblkCCustoOri.LookUpValue,
                                           dblkPlanoPrevOri.Text,
                                           dblkPlanoPrevOri.LookUpValue,
                                           dblkPatroOri.Text,
                                           dblkPatroOri.LookupValue,
                                           Trunc( reNumDigFix.Value ),
                                           MensagemLocal );
  Finally

    If ( MensagemLocal <> '' ) Then Begin

      MsgDlg( MensagemLocal, 'Aviso', mtWarning, [ mbOk ], 0 )
    End;
  End;
End;
//************************************************
Procedure TfrmCopiaContaOrcamenMT.cbIniciaisClick(Sender: TObject);
Begin
  Inherited;

  If ( Not cbIniciais.Checked ) Then Begin

    lblNumDigFix.Enabled := true;
    reNumDigFix.Enabled  := true;
    Label1.Caption       := 'Final da Conta de Origem';
    Label2.Caption       := 'Final da Conta de Destino';

  End Else Begin

    lblNumDigFix.Enabled := false;
    reNumDigFix.Enabled  := false;
    Label1.Caption       := 'Iniciais da Conta de Origem';
    Label2.Caption       := 'Iniciais da Conta de Destino';
    reNumDigFix.Value    := 0;
  End;

  Application.ProcessMessages;
End;
//************************************************
Procedure TfrmCopiaContaOrcamenMT.cbapartirdataClick(Sender: TObject);
Begin
  Inherited;

  If ( cbapartirdata.Checked ) Then Begin

    dteData.Enabled := true

  End Else Begin

    dteData.Enabled := false;
  End;
End;
//************************************************
Procedure TfrmCopiaContaOrcamenMT.cbTransfSaldoClick(Sender: TObject);
Begin
  Inherited;

  If ( cbTransfSaldo.Checked ) Then Begin

    cbapartirdata.Enabled := true;
  End Else Begin

    cbapartirdata.Enabled := false;
    cbapartirdata.Checked := false;
    cbapartirdataClick(Sender);
  End;
End;
//************************************************
Procedure TfrmCopiaContaOrcamenMT.InicializaBarra;
Begin

  CtrlCopiaContaOrcamen.pgrStatusConta := pgrStatusConta;
  CtrlCopiaContaOrcamen.pgrStatusComp  := pgrStatusComp;
End;
//************************************************
Procedure TfrmCopiaContaOrcamenMT.MensagemChange(Sender: TObject);
Begin
  Inherited;

  If ( Mensagem.Text <> '' ) Then Begin

    FrmConfAltCont := TFrmConfAltCont.create(self);

    FrmConfAltCont.label1.caption := CtrlCopiaContaOrcamen.scodigo;
    FrmConfAltCont.label2.caption := CtrlCopiaContaOrcamen.snomeori;
    FrmConfAltCont.label4.caption := CtrlCopiaContaOrcamen.scoddes;
    FrmConfAltCont.label3.caption := CtrlCopiaContaOrcamen.snomedes;

    FrmConfAltCont.showmodal;
    FrmConfAltCont.free;

    // imodalResult retornado
    //   imodalResult = 1 // Substituir SIM
    //   imodalResult = 2 // Não Substituir
    //   imodalResult = 3 // Substituir Todas
    //   imodalResult = 4 // Substituir Nenhuma
    CtrlCopiaContaOrcamen.imodalResult := imodalResult;
  End;
End;
//************************************************
End.
