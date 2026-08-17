unit FCadFaixaDatasMT;

{-------------------------------------------------------------------------------
Analista    : Alex Pereira
Data        : 22/03/04
Pendência   : 16239
Modificações: CmeCadastroBeforeConfirma
Descrição   : Garantir que não ocorram conflitos na vigência dos planos
-------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCtrlContab,uCtrlPlano, FCadastroMT, wwdbdatetimepicker,uCtrlPlanoData,
  CMDateTimePicker, StdCtrls, wwdblook, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCMTypes;

type
  TfrmCadFaixaDatasMT = class(TFrmCadastroMT)
    dblkPlano: TwwDBLookupCombo;
    Label1: TLabel;
    dteDataIni: TCMDateTimePicker;
    Label3: TLabel;
    dteDataFim: TCMDateTimePicker;
    Label2: TLabel;
    dblkPlanoAnt: TwwDBLookupCombo;
    Label4: TLabel;
    cdsPlanoContaAnt: TCMClientDataSet;
    cdsPlanoConta: TCMClientDataSet;
    cdsPlanoConflito: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
  private
    CtrlContab    : TCtrlContab;
    CtrlPlano     : TCtrlPlano;
    CtrlPlanoData : TCtrlPlanoData;

  public
    { Public declarations }
  end;

var
  frmCadFaixaDatasMT: TfrmCadFaixaDatasMT;

implementation

Uses uSistema, uMensErro, dBaseDados,uModulo;

{$R *.DFM}

procedure TfrmCadFaixaDatasMT.FormCreate(Sender: TObject);
begin
  inherited;
  // *** Instancia a classe geral Ctrlcontab ****
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                    Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

  //*** Instancia a classe de contas ***
  CtrlPlanoData  := TCtrlPlanoData.Create;
  CtrlPlanoData.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,False);
  CtrlPlanoData.CdsPlanoData  := Cds;
  Cds.Data  := CtrlPlanoData.ListPlanoData(-1);

  //*** Instancia a classe de contas ***
  CtrlPlano  := TCtrlPlano.Create;
  CtrlPlano.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  CdsPlanoConta.Data     := CtrlPlano.ListPlano(0);
  CdsPlanoContaAnt.Data  := CtrlPlano.ListPlano(0);

  MontaSelect.Filtro.Add('PLANODATA.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));

end;

procedure TfrmCadFaixaDatasMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
  CtrlPlano.free;
  CtrlPlanoData.free;
end;

procedure TfrmCadFaixaDatasMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
//  inherited;
  Cds.Data := CtrlPlanoData.ListPlanoData(Cds.FieldByName('IDPLANODATA').asInteger);

end;

procedure TfrmCadFaixaDatasMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlPlanoData.Gravar;

end;

procedure TfrmCadFaixaDatasMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlPlanoData.Gravar;
end;

procedure TfrmCadFaixaDatasMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlPlanoData.Gravar;
end;

procedure TfrmCadFaixaDatasMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlPlanoData.MessageInfo  <>  '' Then
     MsgDlg(CtrlPlanoData.MessageInfo, 'Erro', mtError, [mbOk], 0);

end;

procedure TfrmCadFaixaDatasMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin

     Cds.Data := CtrlPlanoData.ListPlanoData(StrToFloat(MontaSelect.ValoresChave[0]));

  end;

end;

procedure TfrmCadFaixaDatasMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  If Cds.State in [dsEdit, DsInsert] Then
  Begin

      if (dblkPlano.Text = '') then
      begin
         MsgDlg('Plano não selecionado.','Aviso',mtWarning,[mbOk],0);
         dblkPlano.SetFocus;
         Accept := False;
      end;

      if (Accept) and (dteDataIni.Text = '') then
      begin
         MsgDlg('Data Inicial de vigência do Plano não preenchida.','Aviso',mtWarning,[mbOk],0);
         dteDataIni.SetFocus;
         Accept := False;
      end;

      If (Accept) and (dteDataFim.Text = '') then
      Begin
         MsgDlg('Data Final de vigência do Plano não preenchida.','Aviso',mtWarning,[mbOk],0);
         dteDataIni.SetFocus;
         Accept := False;
      End;

      If (Accept) and (dblkPlano.Text = dblkPlanoAnt.Text) then
      Begin
         MsgDlg('O Plano Anterior não pode ser o mesmo que o Plano escolhido.','Aviso',mtWarning,[mbOk],0);
         dblkPlano.SetFocus;
         Accept := False;
      End;

      if (Accept) and (dteDataIni.Date > dteDataFim.Date) then begin
        MsgDlg('Data inicial maior que a final. ','Aviso',mtWarning,[mbOk],0);
        dteDataIni.SetFocus;
        Accept := False;
      end;
      if Accept then begin
        cdsPlanoConflito.Data := CtrlPlanoData.ListPlanoData (Cds.FieldByName('IDPLANODATA').AsFloat, TPDiferente, dteDataIni.Date);
        if not cdsPlanoConflito.IsEmpty then begin
          MsgDlg('A data inicial está em conflito com o plano: ' + cdsPlanoConflito.FieldByName('PLANO').AsString+'.','Aviso',mtWarning,[mbOk],0);
          dteDataIni.SetFocus;
          Accept := False;
        end;
      end;
      if Accept then begin
        cdsPlanoConflito.Data := CtrlPlanoData.ListPlanoData (Cds.FieldByName('IDPLANODATA').AsFloat, TPDiferente, dteDataFim.Date);
        if not cdsPlanoConflito.IsEmpty then begin
          MsgDlg('A data final está em conflito com o plano: ' + cdsPlanoConflito.FieldByName('PLANO').AsString+'.','Aviso',mtWarning,[mbOk],0);
          dteDataFim.SetFocus;
          Accept := False;
        end;
      end;

      //Completa o idpessoa
      cds.FieldByName('IDPESSOA').AsFloat := Sistema.idEmpresa;

  End;

end;

procedure TfrmCadFaixaDatasMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  if dblkPlano.canfocus then dblkPlano.SetFocus;

end;

end.
