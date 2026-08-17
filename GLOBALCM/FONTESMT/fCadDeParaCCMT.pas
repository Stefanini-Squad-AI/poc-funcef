unit fCadDeParaCCMT;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroMT, StdCtrls, wwdblook, MontaSelect, Db, DBClient,
   uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
   IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
   uCmSqlParams, uCtrlDeParaCC;

type
   TfrmCadDeParaCCMT = class(TFrmCadastroMT)
      Panel1: TPanel;
      Panel2: TPanel;
      Label3: TLabel;
      Panel4: TPanel;
      Label1: TLabel;
      Label2: TLabel;
      Label4: TLabel;
      Panel5: TPanel;
      CMSqlParams1: TCMSqlParams;
      DBcboPlanCCIni: TwwDBLookupCombo;
      DBcboCCIni: TwwDBLookupCombo;
      DBcboPlanCCFim: TwwDBLookupCombo;
      DBcboCCFim: TwwDBLookupCombo;
      sqlPlano: TCMSqlParams;
      cdsPlano: TCMClientDataSet;
      sqlCCIni: TCMSqlParams;
      cdsCCIni: TCMClientDataSet;
      sqlCCFim: TCMSqlParams;
      cdsCCFim: TCMClientDataSet;

      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroInsert(Sender: TObject);
      procedure CmeCadastroEdit(Sender: TObject);
      procedure CmeCadastroFind(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure CmeCadastroConfirma(Sender: TObject);
    procedure DBcboPlanCCIniCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DBcboPlanCCFimCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);


   private  // Private declarations

      CtrlDeParaCC : TCtrlDeParaCC;

      procedure Sel(IDDeparaCC: Integer);
      function  VerificaPreenchimento: Boolean;

   public   // Public declarations

   end;



var
  frmCadDeParaCCMT: TfrmCadDeParaCCMT;



implementation
{$R *.DFM}
uses
   dBaseDados, uSistema, uMensErro, uVerificaPreenchimento, dGlobal;



procedure TfrmCadDeParaCCMT.Sel(IDDeparaCC: Integer);
begin
   cds.Data := CtrlDeParaCC.Procurar(IDDeparaCC, Sistema.IDEmpresa);

   if IDDeparaCC > 0 then
   begin

      cdsCCIni.Close;
      sqlCCIni.Prepare;
      sqlCCIni.ParamByName('PIDEMPRESA').AsInteger       := Sistema.IdEmpresa;
      sqlCCIni.ParamByName('PIDPLANCENTCUST').AsInteger  := StrToInt(DBcboPlanCCIni.LookupValue);
      sqlCCIni.Open;

      cdsCCFim.Close;
      sqlCCFim.Prepare;
      sqlCCFim.ParamByName('PIDEMPRESA').AsInteger       := Sistema.IdEmpresa;
      sqlCCFim.ParamByName('PIDPLANCENTCUST').AsInteger  := StrToInt(DBcboPlanCCFim.LookupValue);
      sqlCCFim.Open;

      DBcboCCIni.LookupValue := Cds.FieldByName('CODCCINI').AsString;
      DBcboCCFim.LookupValue := Cds.FieldByName('CODCCFIM').AsString;
   end;
end;



function TfrmCadDeParaCCMT.VerificaPreenchimento: Boolean;
begin
	Result := False;

	try

      if cds.FieldByName('IDPLANCCINI').IsNull then
         raise EValidacao.CreateVal('É necessário indicar o Plano de Centros de Custo de Origem!', DBcboPlanCCIni);

      if cds.FieldByName('CODCCINI').IsNull then
         raise EValidacao.CreateVal('É necessário indicar o Centro de Custo de Origem!', DBcboCCIni);

      if cds.FieldByName('IDPLANCCFIM').IsNull then
         raise EValidacao.CreateVal('É necessário indicar o Plano de Centros de Custo de Destino!', DBcboPlanCCFim);

      if cds.FieldByName('CODCCFIM').IsNull then
         raise EValidacao.CreateVal('É necessário indicar o Centro de Custo de Destino!', DBcboCCFim);

      if cds.FieldByName('CODCCINI').AsString = cds.FieldByName('CODCCFIM').AsString  then
         raise EValidacao.CreateVal('O Centro de Custo de Destino precisa ser diferente do de Origem!', DBcboCCFim);

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



procedure TfrmCadDeParaCCMT.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := VerificaPreenchimento;
end;



procedure TfrmCadDeParaCCMT.CmeCadastroInsert(Sender: TObject);
begin
   inherited;

   if DBcboPlanCCIni.CanFocus then DBcboPlanCCIni.SetFocus;
end;



procedure TfrmCadDeParaCCMT.CmeCadastroEdit(Sender: TObject);
begin
   inherited;

   if DBcboPlanCCIni.CanFocus then DBcboPlanCCIni.SetFocus;
end;



procedure TfrmCadDeParaCCMT.CmeCadastroFind(Sender: TObject);
begin
   inherited;

   if MontaSelect.RetornouValor then
   begin
      Repaint;

      Sel(StrToInt(MontaSelect.ValoresChave[0]));
   end;

   Repaint;
end;



procedure TfrmCadDeParaCCMT.FormCreate(Sender: TObject);
begin
   inherited;

   CtrlDeParaCC := TCtrlDeParaCC.Create;

   CtrlDeParaCC.Initialize(DtmBaseDados.dbBaseDados,
                           True,
                           Sistema.ConnectionType,
                           Sistema.ConnectionSide,
                           Sistema.AppRemoteServer,
                           True);

   CtrlDeParaCC.CdsDeParaCC := cds;

   MontaSelect.Filtro.Add('DCC.IDEMPRESAPROP = ' + IntToStr(Sistema.IDEmpresa));
end;



procedure TfrmCadDeParaCCMT.FormShow(Sender: TObject);
begin
   inherited;

   sqlPlano.Open;
   cdsPlano.First;

   DBcboPlanCCIni.LookupValue := cdsPlano.FieldByName('IDPLANCENTCUST').AsString;
   DBcboPlanCCFim.LookupValue := cdsPlano.FieldByName('IDPLANCENTCUST').AsString;

   cdsCCIni.Close;
   sqlCCIni.Prepare;
   sqlCCIni.ParamByName('PIDEMPRESA').AsInteger       := Sistema.IdEmpresa;
   sqlCCIni.ParamByName('PIDPLANCENTCUST').AsInteger  := StrToInt(DBcboPlanCCIni.LookupValue);
   sqlCCIni.Open;

   cdsCCFim.Close;
   sqlCCFim.Prepare;
   sqlCCFim.ParamByName('PIDEMPRESA').AsInteger       := Sistema.IdEmpresa;
   sqlCCFim.ParamByName('PIDPLANCENTCUST').AsInteger  := StrToInt(DBcboPlanCCFim.LookupValue);
   sqlCCFim.Open;

   Sel(-1);
end;



procedure TfrmCadDeParaCCMT.CmeCadastroConfirma(Sender: TObject);
begin
   Cds.FieldByName('IDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;

   CtrlDeParaCC.Grava;
   inherited;
end;



procedure TfrmCadDeParaCCMT.DBcboPlanCCIniCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   cdsCCIni.Close;
   sqlCCIni.Prepare;
   sqlCCIni.ParamByName('PIDEMPRESA').AsInteger       := Sistema.IdEmpresa;
   sqlCCIni.ParamByName('PIDPLANCENTCUST').AsInteger  := StrToInt(DBcboPlanCCIni.LookupValue);
   sqlCCIni.Open;
end;



procedure TfrmCadDeParaCCMT.DBcboPlanCCFimCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   cdsCCFim.Close;
   sqlCCFim.Prepare;
   sqlCCFim.ParamByName('PIDEMPRESA').AsInteger       := Sistema.IdEmpresa;
   sqlCCFim.ParamByName('PIDPLANCENTCUST').AsInteger  := StrToInt(DBcboPlanCCFim.LookupValue);
   sqlCCFim.Open;
end;



end.
