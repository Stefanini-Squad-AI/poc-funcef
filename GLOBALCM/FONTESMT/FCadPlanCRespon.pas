unit FCadPlanCRespon;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
   CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
   uCtrlCadPlanCentRespon,
   wwdbdatetimepicker, CMDateTimePicker, Mask, wwdbedit, uCmSqlParams;


type
   TfrmCadPlanCRespon = class(TFrmCadastroMT)
      Label3: TLabel;
      Label2: TLabel;
      GroupBox1: TGroupBox;
      Label1: TLabel;
      DBedtDataFim: TCMDateTimePicker;
      Label4: TLabel;
      DBedtMascara: TwwDBEdit;
      DBedtDataIni: TCMDateTimePicker;
      DBedtDescricao: TwwDBEdit;
      sqlTeste: TCMSqlParams;

      procedure CmeCadastroInsert(Sender: TObject);
      procedure CmeCadastroEdit(Sender: TObject);
      procedure CmeCadastroFind(Sender: TObject);

      procedure FormCreate(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure CmeCadastroConfirma(Sender: TObject);
      procedure DBedtMascaraKeyPress(Sender: TObject; var Key: Char);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);


   private  // Private declarations

      CtrlCadPlanCentRespon : TCtrlCadPlanCentRespon;

      procedure Sel(IDPlano: Integer);
      function  VerificaPreenchimento: Boolean;


   public   // Public declarations

   end;



var
   frmCadPlanCRespon: TfrmCadPlanCRespon;



implementation
{$R *.DFM}
uses
   dBasedados, uSistema, uMensErro, uVerificaPreenchimento;




procedure TfrmCadPlanCRespon.Sel(IDPlano: Integer);
begin
   cds.Data := CtrlCadPlanCentRespon.Procurar(IDPlano);
end;



function TfrmCadPlanCRespon.VerificaPreenchimento: Boolean;
begin
	Result := False;

	try

      if cds.FieldByName('DESCPLANCRESPON').IsNull then
         raise EValidacao.CreateVal('É necessário indicar a Descrição!', DBedtDescricao);

      if cds.FieldByName('DATAINI').IsNull then
         raise EValidacao.CreateVal('É necessário indicar a Data Inicial de Vigência!', DBedtDataIni);

      if cds.FieldByName('DATAFIM').IsNull then
         raise EValidacao.CreateVal('É necessário indicar a Data Final de Vigência!', DBedtDataFim);

      if not(cds.FieldByName('DATAFIM').AsDateTime > cds.FieldByName('DATAINI').AsDateTime) then
         raise EValidacao.CreateVal('É necessário que a Data Final seja posterior à Data Inicial!', DBedtDataFim);

      if cds.FieldByName('MASCARA').IsNull then
         raise EValidacao.CreateVal('É necessário indicar a Máscara do Plano!', DBedtMascara);

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



procedure TfrmCadPlanCRespon.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   DBedtDescricao.setfocus;
end;



procedure TfrmCadPlanCRespon.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   DBedtDescricao.setfocus;
end;



procedure TfrmCadPlanCRespon.CmeCadastroFind(Sender: TObject);
begin
   inherited;

   if MontaSelect.RetornouValor then
   begin
      Repaint;
      Sel(StrToInt(MontaSelect.ValoresChave[0]));
   end;

   Repaint;
end;



procedure TfrmCadPlanCRespon.FormCreate(Sender: TObject);
begin
   inherited;

   CtrlCadPlanCentRespon := TCtrlCadPlanCentRespon.Create;

   CtrlCadPlanCentRespon.Initialize(DtmBaseDados.dbBaseDados,
                                  True,
                                  Sistema.ConnectionType,
                                  Sistema.ConnectionSide,
                                  Sistema.AppRemoteServer,
                                  True);

   CtrlCadPlanCentRespon.CdsPlanCentRespon := cds;
end;



procedure TfrmCadPlanCRespon.FormShow(Sender: TObject);
begin
   inherited;

   Sel(-1);
end;



procedure TfrmCadPlanCRespon.CmeCadastroConfirma(Sender: TObject);
  var
   EstadoAntes: TDatasetState;
begin
   if ds.DataSet.State in [dsInsert, dsEdit] then
   begin
      EstadoAntes := ds.State;

      ds.DataSet.Post;


   end;

end;



procedure TfrmCadPlanCRespon.DBedtMascaraKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;
   if (key = '.'{ivlm}) and (Copy((Sender as TwwDbEdit).Text, Length((Sender as TwwDbEdit).Text), 1) = '.'{ivlm}) then
   begin
      MessageBeep(0);
      ShowMessage(Translate('Caracter Inválido'));
      Repaint;
      key := #0;
   end
   else
   if (key <> '9'{ivlm}) and (key <> '.'{ivlm}) and (key <> '-'{ivlm}) and (key <> #8) then
   begin
      MessageBeep(0);
      ShowMessage(Translate('Caracter Inválido'));
      Repaint;
      key := #0;
   end
   else
   if (key <> '9'{ivlm}) and (Length((Sender as TwwDbEdit).Text) = 0) then
   begin
      MessageBeep(0);
      ShowMessage(Translate('Caracter Inválido'));
      Repaint;
      key := #0;
   end;
end;



procedure TfrmCadPlanCRespon.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
    if cds.State in [dsInsert,dsEdit] then
    begin
       Accept := VerificaPreenchimento;
   inherited;
end;
 end;
procedure TfrmCadPlanCRespon.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
   Accept := CtrlCadPlanCentRespon.grava;
end;

procedure TfrmCadPlanCRespon.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlCadPlanCentRespon.grava;
end;

procedure TfrmCadPlanCRespon.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlCadPlanCentRespon.grava;
end;

end.
