unit FCadLinhasDemoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, TREdit, Mask,
  wwdbedit, IvDictio, IvMulti, IvEMulti, wwdblook, DBCtrls,
  CmEventosCadastro, ImgList, uCtrlDemonstrativo, uCtrlDemLinha,
  FCadastroMT, DBClient, uCMClientDataSet, uCMTypes;


type
  TfrmCadLinhasDemoMT = class(TFrmCadastroMT)
    Label4: TLabel;
    dblkDemo: TwwDBLookupCombo;
    dbrOrdem: TDBRealEdit;
    Label1: TLabel;
    dbeDescLinha: TwwDBEdit;
    Label2: TLabel;
    dbckLinhaMonetaria: TDBCheckBox;
    dbrgPassaTraco: TDBRadioGroup;
    dbrgNatureza: TDBRadioGroup;
    CdsDemonstrativo: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure dblkDemoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkDemoExit(Sender: TObject);
    procedure CdsAfterInsert(DataSet: TDataSet);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroCancel(Sender: TObject);
  private
    { Private declarations }
    iSalvaDemo : longint;

    CtrlDemonstrativo : TCtrlDemonstrativo;
    CtrlDemLinha      : TCtrlDemLinha;
    procedure FazCloseUp;
  public
    { Public declarations }
  end;

var
  frmCadLinhasDemoMT: TfrmCadLinhasDemoMT;

implementation

uses dBaseDados, uModulo, uSistema, uString, uMensErro;

{$R *.DFM}

procedure TfrmCadLinhasDemoMT.FormCreate(Sender: TObject);
begin
  inherited;
  // *** Instancia a classe principal ***
  CtrlDemLinha                := TCtrlDemLinha.Create;
  CtrlDemLinha.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                          Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CtrlDemLinha.CdsDemLinha := Cds;
  Cds.Data := CtrlDemLinha.ListDemLinha(-1);

  // *** Instancia a classe demonstrativos ***
  CtrlDemonstrativo := TCtrlDemonstrativo.Create;
  CtrlDemonstrativo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CdsDemonstrativo.Data := CtrlDemonstrativo.ListDemonstrativo(Sistema.IdEmpresa,0,True);
  MontaSelect.Filtro.Add('DEMONSTRATIVO.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));

end;


procedure TfrmCadLinhasDemoMT.FazCloseUp;
begin
   If dblkDemo.text <> '' Then
   Begin
      iSalvaDemo := StrToInt(dblkDemo.LookUpValue);
      If CtrlDemLinha.RetornaOdemLinha(iSalvaDemo) Then
         Cds.FieldByName('ORDEMLINHA').asFloat := CtrlDemLinha.ProximaOrdem + 1
      Else
         MsgDlg('O Numero de Ordem  não foi Gerado.','Erro',mtError,[mbOk],0);

   End;
end;


procedure TfrmCadLinhasDemoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlDemonstrativo.Free;
  CtrlDemLinha.Free;

end;

procedure TfrmCadLinhasDemoMT.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   Cds.FieldByName('FLGNATUREZA').asString  := 'D';
   Cds.FieldByName('FLGMONETARIA').asString := 'S';
   
   If iSalvaDemo <> 0 Then
   Begin
     If CtrlDemLinha.RetornaOdemLinha(iSalvaDemo) Then
        Cds.FieldByName('ORDEMLINHA').asFloat := CtrlDemLinha.ProximaOrdem + 1
     Else
        MsgDlg('O Numero de Ordem não foi Gerado.','Erro',mtError,[mbOk],0);

   End;
end;

procedure TfrmCadLinhasDemoMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
//  inherited;
  Cds.Data := CtrlDemLinha.ListDemLinha(Cds.FieldByName('IDLINHA').asFloat);

end;

procedure TfrmCadLinhasDemoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Cds.DisableControls;
  accept := CtrlDemLinha.Gravar;
  Cds.EnableControls;

end;

procedure TfrmCadLinhasDemoMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Cds.DisableControls;
  accept := CtrlDemLinha.Gravar;
  Cds.EnableControls;

end;

procedure TfrmCadLinhasDemoMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  If Cds.State in [dsInsert, dsEdit]  Then
  Begin
    //Faz a verificação do preenchimento dos campos
    If (dblkDemo.Text = '') Then
    Begin
       MsgDlg('Demonstrativo não selecionado.','Erro',mtError,[mbOk],0);
       dblkDemo.SetFocus;
       Accept := False;
    End;

    If (dbrOrdem.value = 0) Then
    Begin
       MsgDlg('Número de ordem da Linha não informado.','Erro',mtError,[mbOk],0);
       dbrOrdem.SetFocus;
       Accept := False;
    End;

    If (dbeDescLinha.Text = '') Then
    Begin
       MsgDlg('Descrição da Linha não informada.','Erro',mtError,[mbOk],0);
       dbeDescLinha.SetFocus;
       Accept := False;
    End;

  End;

end;

procedure TfrmCadLinhasDemoMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  If dblkDemo.CanFocus Then
     dblkDemo.SetFocus;

end;

procedure TfrmCadLinhasDemoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
     //Se houve busca, abre a query principal apenas com o registro buscado
     Cds.Data := CtrlDemLinha.ListDemLinha(StrToFloat(MontaSelect.ValoresChave[0]));
  End;

end;

procedure TfrmCadLinhasDemoMT.dblkDemoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  FazCloseUp;
end;

procedure TfrmCadLinhasDemoMT.dblkDemoExit(Sender: TObject);
begin
  inherited;
  FazCloseUp;

end;

procedure TfrmCadLinhasDemoMT.CdsAfterInsert(DataSet: TDataSet);
begin
  inherited;
  If iSalvaDemo <> 0 Then
     Cds.FieldByName('IDDEMONSTRATIVO').AsInteger := iSalvaDemo;

end;

procedure TfrmCadLinhasDemoMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Cds.DisableControls;
  accept := CtrlDemLinha.Gravar;
  Cds.EnableControls;

end;

procedure TfrmCadLinhasDemoMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlDemLinha.MessageInfo <> '' Then
     MsgDlg(CtrlDemLinha.MessageInfo,'Erro',mtError,[mbOK],0);

end;

procedure TfrmCadLinhasDemoMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Cds.Data := CtrlDemLinha.ListDemLinha(-1);

end;

end.
