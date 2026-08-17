Unit FCadCenarioMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, StdCtrls, Mask, wwdbedit, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, uCtrlCadCenario, uCMTypes;

Type
  TfrmCadCenarioMT = class(TFrmCadastroMT)
    dbedNomeCenario: TwwDBEdit;
    Procedure FormCreate(Sender: TObject);
    Procedure sbtnInserirClick(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    Procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    Procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    Procedure CmeCadastroAfterConfirma(Sender: TObject);
    Procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    Procedure sbtnAlterarClick(Sender: TObject);
  Private
    { Private declarations }

    CtrlCadCenario : TCtrlCadCenario;

  Public
    { Public declarations }
  End;

Var
  frmCadCenarioMT: TfrmCadCenarioMT;

Implementation

Uses
  uSistema, uMensErro, dBaseDados;

{$R *.DFM}
//************************************************
Procedure TfrmCadCenarioMT.FormCreate(Sender: TObject);
Begin
  Inherited;

  CtrlCadCenario := TCtrlCadCenario.Create;
  CtrlCadCenario.Initialize( DtmBaseDados.dbBaseDados, True,
                             Sistema.ConnectionType,   Sistema.ConnectionSide,
                             Sistema.AppRemoteServer,  True, nil, nil, False );

  //Atribui os ClientDataSets local a ser persistido pelo objeto de negócios
  CtrlCadCenario.CdsCadCenario := Cds;
  //
  cds.Data := CtrlCadCenario.Procurar(-1);
End;
//************************************************
Procedure TfrmCadCenarioMT.sbtnInserirClick(Sender: TObject);
Begin
  Inherited;

  dbedNomeCenario.SetFocus;
End;
//************************************************
Procedure TfrmCadCenarioMT.sbtnAlterarClick(Sender: TObject);
Begin
  Inherited;

  dbedNomeCenario.SetFocus;
End;
//************************************************
Procedure TfrmCadCenarioMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
Begin
  Inherited;
  Accept := False;
  If ( Trim( dbedNomeCenario.Text ) = '' ) Then Begin

    MsgDlg('Obrigatório preencher a Descrição','Erro',mtError,[mbOk],0);
    dbedNomeCenario.SetFocus;
    exit;
  End;
  Accept := True;
End;
//************************************************
Procedure TfrmCadCenarioMT.CmeCadastroFind(Sender: TObject);
Begin
  Inherited;

  If MontaSelect.RetornouValor Then Begin

    Cds.Data := CtrlCadCenario.Procurar( StrtoFloat( MontaSelect.ValoresChave[ 0 ] ) );
  End;
End;
//************************************************
Procedure TfrmCadCenarioMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
Begin
  Inherited;

  Accept := CtrlCadCenario.AplicaOperacaoCadCenario;
End;
//************************************************
Procedure TfrmCadCenarioMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
Begin
  Inherited;

  Accept := CtrlCadCenario.AplicaOperacaoCadCenario;
End;
//************************************************
Procedure TfrmCadCenarioMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
Begin
  Inherited;

  Accept := CtrlCadCenario.AplicaOperacaoCadCenario;
End;
//************************************************
Procedure TfrmCadCenarioMT.CmeCadastroAfterConfirma(Sender: TObject);
Begin
  //Inherited;

  cds.Data := CtrlCadCenario.Procurar(cds.FieldByName('IDCENARIOORCAMEN').AsFloat);
End;
//************************************************
Procedure TfrmCadCenarioMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
Begin
  Inherited;

  If OrigemAbortConfirma <> OaBeforeConfirma Then Begin

     MsgDlg('Ocorreu o seguinte erro : '+ CtrlCadCenario.MessageInfo, 'Aviso', mtError,[mbOK],0);
  End;
End;
//************************************************
End.
