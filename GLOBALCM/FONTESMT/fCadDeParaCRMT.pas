unit fCadDeParaCRMT;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroMT, StdCtrls, wwdblook, MontaSelect, Db, DBClient,
   uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
   IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
   uCmSqlParams, uCtrlDeParaCR;

type
   TfrmCadDeParaCRMT = class(TFrmCadastroMT)
      Panel1: TPanel;
      Panel2: TPanel;
      Label3: TLabel;
      DBcboPlanCRFim: TwwDBLookupCombo;
      Panel4: TPanel;
      DBcboCRFim: TwwDBLookupCombo;
      Label1: TLabel;
      Label2: TLabel;
      DBcboPlanCRIni: TwwDBLookupCombo;
      Label4: TLabel;
      DBcboCRIni: TwwDBLookupCombo;
      Panel5: TPanel;
      cdsPlano: TCMClientDataSet;
      sqlPlano: TCMSqlParams;
      cdsCRIni: TCMClientDataSet;
      sqlCRIni: TCMSqlParams;
      cdsCRFim: TCMClientDataSet;
      sqlCRFim: TCMSqlParams;
      CMSqlParams1: TCMSqlParams;

      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroInsert(Sender: TObject);
      procedure CmeCadastroEdit(Sender: TObject);
      procedure CmeCadastroFind(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure CmeCadastroConfirma(Sender: TObject);
      procedure DBcboPlanCRIniCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboPlanCRFimCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);


   private  // Private declarations

      CtrlDeParaCR : TCtrlDeParaCR;

      procedure Sel(IDDeparaCR: Integer);
      function  VerificaPreenchimento: Boolean;

   public   // Public declarations

   end;



var
  frmCadDeParaCRMT: TfrmCadDeParaCRMT;



implementation
{$R *.DFM}
uses
   dBaseDados, uSistema, uMensErro, uVerificaPreenchimento, dGlobal;



procedure TfrmCadDeParaCRMT.Sel(IDDeparaCR: Integer);
begin
   cds.Data := CtrlDeParaCR.Procurar(IDDeparaCR, Sistema.IDEmpresa);

   if IDDeparaCR > 0 then
   begin

      cdsCRIni.Close;
      sqlCRIni.Prepare;
      sqlCRIni.ParamByName('PIDPESSOA').AsInteger        := Sistema.IdEmpresa;
      sqlCRIni.ParamByName('PIDPLANCRESPON').AsInteger   := StrToInt(DBcboPlanCRIni.LookupValue);
      sqlCRIni.Open;

      cdsCRFim.Close;
      sqlCRFim.Prepare;
      sqlCRFim.ParamByName('PIDPESSOA').AsInteger        := Sistema.IdEmpresa;
      sqlCRFim.ParamByName('PIDPLANCRESPON').AsInteger   := StrToInt(DBcboPlanCRFim.LookupValue);
      sqlCRFim.Open;

      DBcboCRIni.LookupValue := Cds.FieldByName('CODCRINI').AsString;
      DBcboCRFim.LookupValue := Cds.FieldByName('CODCRFIM').AsString;
   end;
end;



function TfrmCadDeParaCRMT.VerificaPreenchimento: Boolean;
begin
	Result := False;

	try

      if cds.FieldByName('IDPLANCRINI').IsNull then
         raise EValidacao.CreateVal('É necessário indicar o Plano de Centros de Responsabilidade de Origem!', DBcboPlanCRIni);

      if cds.FieldByName('CODCRINI').IsNull then
         raise EValidacao.CreateVal('É necessário indicar o Centro de Responsabilidade de Origem!', DBcboCRIni);

      if cds.FieldByName('IDPLANCRFIM').IsNull then
         raise EValidacao.CreateVal('É necessário indicar o Plano de Centros de Responsabilidade de Destino!', DBcboPlanCRFim);

      if cds.FieldByName('CODCRFIM').IsNull then
         raise EValidacao.CreateVal('É necessário indicar o Centro de Responsabilidade de Destino!', DBcboCRFim);

      if cds.FieldByName('CODCRINI').AsString = cds.FieldByName('CODCRFIM').AsString  then
         raise EValidacao.CreateVal('O Centro de Responsabilidade de Destino precisa ser diferente do de Origem!', DBcboCRFim);

   except

      on ev : EValidacao do
      begin
		   if ev.Show then MsgDlg(ev.message, 'Orçamento', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



procedure TfrmCadDeParaCRMT.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := VerificaPreenchimento;
end;



procedure TfrmCadDeParaCRMT.CmeCadastroInsert(Sender: TObject);
begin
   inherited;

   if DBcboPlanCRIni.CanFocus then DBcboPlanCRIni.SetFocus;
end;



procedure TfrmCadDeParaCRMT.CmeCadastroEdit(Sender: TObject);
begin
   inherited;

   if DBcboPlanCRIni.CanFocus then DBcboPlanCRIni.SetFocus;
end;



procedure TfrmCadDeParaCRMT.CmeCadastroFind(Sender: TObject);
begin
   inherited;

   if MontaSelect.RetornouValor then
   begin
      Repaint;
      Sel(StrToInt(MontaSelect.ValoresChave[0]));
   end;

   Repaint;
end;



procedure TfrmCadDeParaCRMT.FormCreate(Sender: TObject);
begin
   inherited;

   CtrlDeParaCR := TCtrlDeParaCR.Create;

   CtrlDeParaCR.Initialize(DtmBaseDados.dbBaseDados,
                           True,
                           Sistema.ConnectionType,
                           Sistema.ConnectionSide,
                           Sistema.AppRemoteServer,
                           True);

   CtrlDeParaCR.CdsDeParaCR := cds;

   MontaSelect.Filtro.Add('DCR.IDEMPRESAPROP = ' + IntToStr(Sistema.IDEmpresa));
end;



procedure TfrmCadDeParaCRMT.FormShow(Sender: TObject);
begin
   inherited;

   sqlPlano.Open;
   cdsPlano.First;

   DBcboPlanCRIni.LookupValue := cdsPlano.FieldByName('IDPLANCRESPON').AsString;
   DBcboPlanCRFim.LookupValue := cdsPlano.FieldByName('IDPLANCRESPON').AsString;

   cdsCRIni.Close;
   sqlCRIni.Prepare;
   sqlCRIni.ParamByName('PIDPESSOA').AsInteger        := Sistema.IdEmpresa;
   sqlCRIni.ParamByName('PIDPLANCRESPON').AsInteger   := StrToInt(DBcboPlanCRIni.LookupValue);
   sqlCRIni.Open;

   cdsCRFim.Close;
   sqlCRFim.Prepare;
   sqlCRFim.ParamByName('PIDPESSOA').AsInteger        := Sistema.IdEmpresa;
   sqlCRFim.ParamByName('PIDPLANCRESPON').AsInteger   := StrToInt(DBcboPlanCRFim.LookupValue);
   sqlCRFim.Open;

   Sel(-1);
end;



procedure TfrmCadDeParaCRMT.CmeCadastroConfirma(Sender: TObject);
begin
   Cds.FieldByName('IDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;

   CtrlDeParaCR.Grava;
   inherited;
end;



procedure TfrmCadDeParaCRMT.DBcboPlanCRIniCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   cdsCRIni.Close;
   sqlCRIni.Prepare;
   sqlCRIni.ParamByName('PIDPESSOA').AsInteger        := Sistema.IdEmpresa;
   sqlCRIni.ParamByName('PIDPLANCRESPON').AsInteger   := StrToInt(DBcboPlanCRIni.LookupValue);
   sqlCRIni.Open;
end;



procedure TfrmCadDeParaCRMT.DBcboPlanCRFimCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   cdsCRFim.Close;
   sqlCRFim.Prepare;
   sqlCRFim.ParamByName('PIDPESSOA').AsInteger        := Sistema.IdEmpresa;
   sqlCRFim.ParamByName('PIDPLANCRESPON').AsInteger   := StrToInt(DBcboPlanCRFim.LookupValue);
   sqlCRFim.Open;
end;



end.
