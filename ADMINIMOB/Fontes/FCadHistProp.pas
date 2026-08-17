unit FCadHistProp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroDetalhe, ExtCtrls, Mask, Db, StdCtrls, DBCtrls, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, Wwdatsrc, DBTables, Wwquery,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, Grids,
  Wwdbigrd, Wwdbgrid, TB97, ComCtrls, CmEventosCadastro,
  wwriched;

type
  TfrmCadHistProp = class(TfrmCadastroDetalhe)
    Label2: TLabel;
    Label1: TLabel;
    edtProposta: TEdit;
    btnBuscaPai: TBitBtn;
    edtDataProposta: TCMDateTimePicker;
    qryIDPROPOSTA: TFloatField;
    qryIDHISTPROPOSTA: TFloatField;
    qryIDRESPONSAVEL: TFloatField;
    qryHIPDATA: TDateTimeField;
    qryHIPCABECALHO: TStringField;
    qryPRODATA: TDateTimeField;
    qryNOME: TStringField;
    qryLookResponsavel: TwwQuery;
    qryLookResponsavelNOME: TStringField;
    qryLookResponsavelIDRESPONSAVEL: TFloatField;
    qryLookResponsavelRAZAOSOCIAL: TStringField;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBedtDataHistorico: TCMDateTimePicker;
    DBedtHistorico: TDBEdit;
    DBcboResponsavel: TwwDBLookupCombo;
    DBmemDescricao: TDBMemo;
    qryHIPDESCRICAO: TMemoField;
    Panel3: TPanel;

    // outros procedimentos
    procedure btnBuscaPaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);


    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private { Private declarations }
    iProposta: integer;


    function VerificaPreenchimento: boolean;

  public { Public declarations }

  end;



var
  frmCadHistProp: TfrmCadHistProp;



implementation
{$R *.DFM}
uses
   UComunsImobiliario, uVerificaPreenchimento, uMensErro, uDatabase, DBaseDados, dLookImobiliario, uFuncoesImob,
  DMS;



procedure TfrmCadHistProp.CmeCadastroFind(Sender: TObject);
begin
   dtmMS.MS_Proposta.Executar;
   Repaint;

   if dtmMS.MS_Proposta.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iProposta         := StrToInt(dtmMS.MS_Proposta.ValoresChave[0]);
      edtProposta.Text  := dtmMS.MS_Proposta.ValoresChave[2];

      with qry do begin
         LimpaParametros(qry);
         ParamByName('PIDPROPOSTA').asInteger := iProposta;
         Open;
      end;

      Screen.Cursor := crDefault;
   end;

   inherited;
end;



procedure TfrmCadHistProp.CmeCadastroInsert(Sender: TObject);
begin
   inherited;

   qryIDHISTPROPOSTA.asInteger   := LeUltRegistro(nil, 'HISTPROPNOVONEGOC');
   qryIDPROPOSTA.AsInteger       := iProposta;

   if DBedtDataHistorico.CanFocus then DBedtDataHistorico.SetFocus;
end;




procedure TfrmCadHistProp.CmeCadastroEdit(Sender: TObject);
begin
   inherited;

   qryIDPROPOSTA.AsInteger := iProposta;

   if DBedtDataHistorico.CanFocus then DBedtDataHistorico.SetFocus;
end;



function TfrmCadHistProp.VerificaPreenchimento: boolean;
begin
	Result := False;
	try

		// Imovel
      if qryIDPROPOSTA.isNULL then
         raise EValidacao.CreateVal('É necessário indicar a Proposta!', btnBuscaPai);

		// Outro Dado
      if qryHIPDATA.isNULL then
         raise EValidacao.CreateVal('É necessário indicar a Data do Histórico!', DBedtDataHistorico);

		// "Valor"
      if qryHIPCABECALHO.isNULL then
         raise EValidacao.CreateVal('É necessário indicar o Histórico!', DBedtHistorico);

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



procedure TfrmCadHistProp.btnBuscaPaiClick(Sender: TObject);
begin
   CmeCadastro.Find(Self);
end;



procedure TfrmCadHistProp.FormShow(Sender: TObject);
begin
   inherited;
   qryLookResponsavel.Open;
end;



procedure TfrmCadHistProp.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
   inherited;
   Accept := VerificaPreenchimento;
end;

end.
