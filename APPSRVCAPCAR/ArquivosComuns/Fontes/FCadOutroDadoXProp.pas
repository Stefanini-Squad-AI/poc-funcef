unit FCadOutroDadoXProp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroDetalhe, Db, Wwdatsrc, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, Grids, Wwdbigrd,
  Wwdbgrid, TB97, ComCtrls, ExtCtrls, Mask, DBCtrls, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro;

type
  TfrmCadOutroDadoXProp = class(TfrmCadastroDetalhe)
    edtProposta: TEdit;
    Label2: TLabel;
    btnBuscaPai: TBitBtn;
    Label1: TLabel;
    qryIDPROPOSTA: TFloatField;
    qryIDOUTRODADO: TFloatField;
    qryODPVALOR: TStringField;
    qryODODESCRICAO: TStringField;
    qryPRODATA: TDateTimeField;
    edtDataProposta: TCMDateTimePicker;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    DBcboOutroDado: TwwDBLookupCombo;
    DBedtValor: TDBEdit;

    procedure btnBuscaPaiClick(Sender: TObject);
    procedure DBcboOutroDadoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DBedtValorChange(Sender: TObject);


    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private { Private declarations }
    iProposta : integer;


    function VerificaPreenchimento: boolean;

  public { Public declarations }

  end;



var
  frmCadOutroDadoXProp: TfrmCadOutroDadoXProp;



implementation
{$R *.DFM}
uses
   uVerificaPreenchimento, uMensErro, dLookImobiliario, uFuncoesImob, DMS;



procedure TfrmCadOutroDadoXProp.CmeCadastroFind(Sender: TObject);
begin
   dtmMS.MS_Proposta.Executar;
   Repaint;

   if dtmMS.MS_Proposta.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iProposta         := StrToInt(dtmMS.MS_Proposta.ValoresChave[0]);
      edtProposta.Text  := dtmMS.MS_Proposta.ValoresChave[2];

      with dtmLookImobiliario.qryLookOutroDadoXTipoImo do begin
         LimpaParametros(dtmLookImobiliario.qryLookOutroDadoXTipoImo);
         ParamByName('PCODTIPIMOVEL').asString := dtmMS.MS_Proposta.ValoresChave[3];
         Open;
      end;

      with qry do begin
         LimpaParametros(qry);
         ParamByName('PIDPROPOSTA').asInteger := iProposta;
         Open;
      end;

      Screen.Cursor := crDefault;
   end;

   inherited;
end;



procedure TfrmCadOutroDadoXProp.CmeCadastroInsert(Sender: TObject);
begin
   inherited;

   qryIDPROPOSTA.AsInteger := iProposta;

   if DBcboOutroDado.CanFocus then DBcboOutroDado.SetFocus;
end;




procedure TfrmCadOutroDadoXProp.CmeCadastroEdit(Sender: TObject);
begin
   inherited;

   qryIDPROPOSTA.AsInteger := iProposta;

   if DBcboOutroDado.CanFocus then DBcboOutroDado.SetFocus;
end;



function TfrmCadOutroDadoXProp.VerificaPreenchimento: boolean;
begin
	Result := False;
	try

		// Imovel
      if qryIDPROPOSTA.isNULL then
         raise EValidacao.CreateVal('É necessário indicar a Proposta!', btnBuscaPai);

		// Outro Dado
      if qryIDOUTRODADO.isNULL then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Dado Complementar!', DBcboOutroDado);

		// "Valor"
      if qryODPVALOR.isNULL then
         raise EValidacao.CreateVal('É necessário indicar o "Valor"!', DBedtValor);

	except

      on ev : EValidacao do begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;
   Result := True;
end;



procedure TfrmCadOutroDadoXProp.btnBuscaPaiClick(Sender: TObject);
begin
   CmeCadastro.Find(Self);
end;



procedure TfrmCadOutroDadoXProp.DBcboOutroDadoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if qry.State in [dsInsert, dsEdit] then qryODODESCRICAO.asString := DBcboOutroDado.Text;
end;


procedure TfrmCadOutroDadoXProp.DBedtValorChange(Sender: TObject);
begin
   inherited;
   if qry.State in [dsInsert, dsEdit] then qryODPVALOR.asString := DBedtValor.Text;
end;



procedure TfrmCadOutroDadoXProp.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
   inherited;
   Accept := VerificaPreenchimento;
end;

end.
