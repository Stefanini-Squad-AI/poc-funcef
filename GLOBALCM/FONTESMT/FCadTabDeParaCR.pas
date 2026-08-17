unit FCadTabDeParaCR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdblook, uCmSqlParams,
  uCtrlTabelaDeParaCR, uCtrlCampoDeParaCR;

type
   TfrmCadTabDeParaCR = class(TFrmCadastroMestreDetMT)
      Label1: TLabel;
      DBcboTabela: TwwDBLookupCombo;
      Label2: TLabel;
      Label3: TLabel;
      Label5: TLabel;
      cdsTabela: TCMClientDataSet;
      cdsCampo: TCMClientDataSet;
      cdsDet: TCMClientDataSet;
      DBcboEmpresa: TwwDBLookupCombo;
      DBcboData: TwwDBLookupCombo;
      DBcboCR: TwwDBLookupCombo;
      sqlCampo: TCMSqlParams;
      sqlTabela: TCMSqlParams;
      mestre: TCMSqlParams;
      detalhe: TCMSqlParams;

      procedure FormCreate(Sender: TObject);
      procedure CmeCadastroCancel(Sender: TObject);
      procedure DBcboTabelaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure CmeDetalheConfirma(Sender: TObject);
      procedure CmeCadastroDelete(Sender: TObject);
      procedure CmeCadastroFind(Sender: TObject);


   private  // Private declarations

      CtrlTabelaDeParaCR   : TCtrlTabelaDeParaCR;
      CtrlCampoDeParaCR    : TCtrlCampoDeParaCR;

   public   // Public declarations

      {}
   end;



var
  frmCadTabDeParaCR: TfrmCadTabDeParaCR;



implementation
{$R *.DFM}
uses
   uMensErro, uDatabase, DBaseDados, uAutorizacao, uSistema, uModulo;



procedure TfrmCadTabDeParaCR.FormCreate(Sender: TObject);
begin
   inherited;

   CtrlTabelaDeParaCR   := TCtrlTabelaDeParaCR.Create;
   CtrlCampoDeParaCR    := TCtrlCampoDeParaCR.Create;

   CtrlTabelaDeParaCR.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

   CtrlCampoDeParaCR.InitializeAs(CtrlTabelaDeParaCR);

   CtrlTabelaDeParaCR.cdsMestre  := Cds;
   CtrlTabelaDeParaCR.cdsDetalhe := CdsDet;

   Cds.Data          := CtrlTabelaDeParaCR.ListaTabelaDeParaCR(-1);
   sqlTabela.Open;
   CdsDet.Data       := CtrlCampoDeParaCR.ListaCampoDeParaCR(-1);
end;



procedure TfrmCadTabDeParaCR.CmeCadastroCancel(Sender: TObject);
begin
   inherited;

   Cds.Data    := CtrlTabelaDeParaCR.ListaTabelaDeParaCR(-1);
   cdsDet.Data := CtrlCampoDeParaCR.ListaCampoDeParaCR(-1);
end;



procedure TfrmCadTabDeParaCR.DBcboTabelaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   cdsCampo.Close;
   sqlCampo.Prepare;
   sqlCampo.ParamByName('PTABLE_NAME').AsString := DBcboTabela.LookupValue;
   sqlCampo.Open;
end;



procedure TfrmCadTabDeParaCR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   CtrlTabelaDeParaCR.Free;
   CtrlCampoDeParaCR.Free;

   inherited;
end;



procedure TfrmCadTabDeParaCR.CmeDetalheConfirma(Sender: TObject);
begin
   if CdsDet.State in [dsInsert, dsEdit] then cdsDet.FieldByName('NOMECAMPO').AsString := DBcboCR.Text;
   inherited;
end;



procedure TfrmCadTabDeParaCR.CmeCadastroDelete(Sender: TObject);
begin
   CdsDet.First;
   while not(CdsDet.EOF) do CdsDet.Delete;

   inherited;

   CdsDet.Data := CtrlCampoDeParaCR.ListaCampoDeParaCR(-1);
end;



procedure TfrmCadTabDeParaCR.CmeCadastroFind(Sender: TObject);
begin
   inherited;

   if MontaSelect.RetornouValor then
   begin
      Repaint;

      Cds.Data    := CtrlTabelaDeParaCR.ListaTabelaDeParaCR(StrToFloat(MontaSelect.ValoresChave[0]));

      DBcboTabela.LookupValue := Cds.FieldByName('NOMETABELA').AsString;
      DBcboTabela.CloseUp(True);

      CdsDet.Data := CtrlCampoDeParaCR.ListaCampoDeParaCR(StrToFloat(MontaSelect.ValoresChave[0]));
   end;

   Repaint;
end;



end.
