unit FCadTabelaDeParaCR;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
   CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
   Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdblook,
   uCtrlTabelaDeParaCR, uCtrlCampoDeParaCR, DBaseDados, uSistema, uMensErro;

type
   TfrmCadTabelaDeParaCR = class(TFrmCadastroMestreDetMT)
      Label1: TLabel;
      cboTabela: TwwDBLookupCombo;
      Label2: TLabel;
      cboCampoEmpresa: TComboBox;
      Label5: TLabel;
      cboCampoDet: TComboBox;
      cdsTabela: TCMClientDataSet;
      dsTabela: TDataSource;
      cdsCampo: TCMClientDataSet;
      dsCampo: TDataSource;
      Label3: TLabel;
      cboCampoData: TComboBox;
      cdsDet: TCMClientDataSet;
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure cboTabelaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure CmeCadastroFind(Sender: TObject);
      procedure sbtnAltDetClick(Sender: TObject);
      procedure CmeCadastroCancel(Sender: TObject);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure CmeDetalheConfirma(Sender: TObject);
      procedure CmeCadastroDelete(Sender: TObject);
      procedure CmeCadastroAfterConfirma(Sender: TObject);
      procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroInsert(Sender: TObject);
      procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
      procedure bbtnOkDetClick(Sender: TObject);

   private  // Private declarations

      CtrlTabelaDePara :TCtrlTabelaDeParaCR;
      CtrlCampoDePara  :TCtrlCampoDeParaCR;

      procedure MontaCombos;

   public   // Public declarations

   end;



var
  frmCadTabelaDeParaCR: TfrmCadTabelaDeParaCR;



implementation
{$R *.DFM}



procedure TfrmCadTabelaDeParaCR.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlTabelaDePara := TCtrlTabelaDeParaCR.Create;
   CtrlCampoDePara  := TCtrlCampoDeParaCR.Create;

   CtrlTabelaDePara.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

   CtrlCampoDePara.InitializeAs(CtrlTabelaDePara);

   CtrlTabelaDePara.cdsMestre      := Cds;
   CtrlTabelaDePara.cdsDetalhe     := CdsDet;
   CtrlCampoDePara.cdsCampoDePara  := CdsDet;

   Cds.Data         := CtrlTabelaDePara.ListaTabelaDePara(-1,ttpNome);
   CdsDet.Data      := CtrlCampoDePara.ListaCampoDePara(-1);
   cdsTabela.Data   := CtrlTabelaDePara.ListaTabelaCM;
end;




procedure TfrmCadTabelaDeParaCR.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   cboCampoEmpresa.Clear;
   cboCampoData.Clear;
   cboCampoDet.Clear;

   Cds.Data         := CtrlTabelaDePara.ListaTabelaDePara(-1,ttpNome);
   CdsDet.Data      := CtrlCampoDePara.ListaCampoDePara(-1);
end;




procedure TfrmCadTabelaDeParaCR.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  inherited;
  If Cds.State in [dsInsert, dsEdit] Then
  Begin
      //Faz a verificação do preenchimento dos campos
      if (cboTabela.Text = '') then begin
         MsgDlg('Nome da Tabela não preenchido.','Aviso',mtWarning,[mbOk],0);
         cboTabela.SetFocus;
         Accept := False;
         exit;
      end;

      Cds.FieldByName('NOMETABELA').asString       := cboTabela.text;
      cds.FieldByName('NOMECAMPOEMPRESA').AsString := cboCampoEmpresa.Text;
      cds.FieldByName('NOMECAMPODATA').AsString    := cboCampoData.Text;
  End;

end;




procedure TfrmCadTabelaDeParaCR.CmeDetalheConfirma(Sender: TObject);
begin
  If CdsDet.State in [dsInsert, dsEdit] Then
  Begin
     cdsDet.FieldByName('NOMECAMPO').asString := cboCampoDet.text;
  End;
  inherited;
end;



procedure TfrmCadTabelaDeParaCR.CmeCadastroDelete(Sender: TObject);
begin
   CdsDet.First;
   while Not CdsDet.Eof do
      CdsDet.Delete;

   inherited;
   cboCampoEmpresa.Clear;
   cboCampoData.Clear;
   cboCampoDet.Clear;
   CdsDet.Data := CtrlCampoDePara.ListaCampoDePara(-1);
end;



procedure TfrmCadTabelaDeParaCR.CmeCadastroAfterConfirma(Sender: TObject);
begin
   inherited;
   CtrlTabelaDePara.Gravar;
   Cds.Data := CtrlTabelaDePara.ListaTabelaDePara(Cds.FieldByName('IDTABELADEPARACR').asFloat,ttpCodigo);
   CdsDet.Data := CtrlCampoDePara.ListaCampoDePara(Cds.FieldByName('IDTABELADEPARACR').asFloat);
end;



procedure TfrmCadTabelaDeParaCR.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Cds.DisableControls;
  accept := CtrlTabelaDePara.Apagar;
  Cds.EnableControls;
end;



procedure TfrmCadTabelaDeParaCR.CmeCadastroInsert(Sender: TObject);
begin
   Cds.Data := CtrlTabelaDePara.ListaTabelaDePara(-1,ttpCodigo);
   cdsDet.Data := CtrlCampoDePara.ListaCampoDePara(-1);
   inherited;
   cboCampoEmpresa.Clear;
   cboCampoData.Clear;
   cboCampoDet.Clear;
   cboTabela.SetFocus;
end;



procedure TfrmCadTabelaDeParaCR.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Cds.DisableControls;
   accept := CtrlTabelaDePara.Gravar;
   Cds.EnableControls;
end;



procedure TfrmCadTabelaDeParaCR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   CtrlTabelaDePara.Free;
   CtrlCampoDePara.Free;
   inherited;
end;



procedure TfrmCadTabelaDeParaCR.cboTabelaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   MontaCombos;
end;



procedure TfrmCadTabelaDeParaCR.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
   begin
      Cds.Data    := CtrlTabelaDePara.ListaTabelaDePara(StrToInt(MontaSelect.ValoresChave[0]),ttpCodigo);
      CdsDet.Data := CtrlCampoDePara.ListaCampoDePara(StrToInt(MontaSelect.ValoresChave[0]));

      MontaCombos;
       
   end;
end;



procedure TfrmCadTabelaDeParaCR.sbtnAltDetClick(Sender: TObject);
begin
   inherited;
   cboCampoDet.Text := cdsDet.FieldByName('NOMECAMPO').AsString;
end;



procedure TfrmCadTabelaDeParaCR.bbtnOkDetClick(Sender: TObject);
begin
   inherited;
   bbtnVoltarDetClick(Self);
end;



procedure TfrmCadTabelaDeParaCR.MontaCombos;
var i : Integer;
begin
   cdsCampo.Data := CtrlTabelaDePara.ListaColunas(Trim(cboTabela.Text));
   cdsCampo.First;
   cboCampoEmpresa.Items.Clear;
   cboCampoData.Items.Clear;
   cboCampoDet.Items.Clear;

   while not cdsCampo.EOF do
   begin
      cboCampoEmpresa.Items.Add(cdsCampo.FieldByName('COLUMN_NAME').AsString);
      cboCampoDet.Items.Add(cdsCampo.FieldByName('COLUMN_NAME').AsString);

      if cdsCampo.FieldByName('DATA_TYPE').AsString = 'DATE' then
         cboCampoData.Items.Add(cdsCampo.FieldByName('COLUMN_NAME').AsString);

      cdsCampo.Next;
   end;

   for i := 0 to cboCampoEmpresa.Items.Count - 1 do
   begin
      cboCampoEmpresa.ItemIndex := i;
      if   Trim(cds.FieldByName('NOMECAMPOEMPRESA').AsString) = cboCampoEmpresa.Items[i] then Break
      else cboCampoEmpresa.ItemIndex := -1;
   end;

   for i := 0 to cboCampoData.Items.Count - 1 do
   begin
      cboCampoData.ItemIndex := i;
      if   Trim(cds.FieldByName('NOMECAMPODATA').AsString) = cboCampoData.Items[i] then Break
      else cboCampoData.ItemIndex := -1;
   end;

end;



end.

