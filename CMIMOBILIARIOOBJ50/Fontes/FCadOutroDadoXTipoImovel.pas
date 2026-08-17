unit FCadOutroDadoXTipoImovel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroDetalhe, Db, Wwdatsrc, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, Grids, Wwdbigrd,
  Wwdbgrid, TB97, ComCtrls, ExtCtrls, wwdblook, CmEventosCadastro;

type
  TfrmCadOutroDadoXTipoImovel = class(TfrmCadastroDetalhe)
    DBcboOutroDado: TwwDBLookupCombo;
    Label3: TLabel;
    DBcboTipoImovel: TwwDBLookupCombo;
    Label1: TLabel;
    Bevel1: TBevel;
    qryCODTIPIMOVEL: TStringField;
    qryIDOUTRODADO: TFloatField;
    qryODODESCRICAO: TStringField;

    procedure DBcboTipoImovelCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);


    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private { Private declarations }
   sTipoImovel: string;


    function VerificaPreenchimento: boolean;

  public { Public declarations }

  end;



var
  frmCadOutroDadoXTipoImovel: TfrmCadOutroDadoXTipoImovel;



implementation
{$R *.DFM}
uses
   uVerificaPreenchimento, uMensErro, dLookImobiliario, dImobiliario, uFuncoesImob;




procedure TfrmCadOutroDadoXTipoImovel.CmeCadastroFind(Sender: TObject);
begin
   sTipoImovel := DBcboTipoImovel.LookupValue;

   with qry do begin
      LimpaParametros(qry);
      ParamByName('PCODTIPIMOVEL').asString := sTipoImovel;
      Open;
   end;

   inherited;
end;



procedure TfrmCadOutroDadoXTipoImovel.CmeCadastroInsert(Sender: TObject);
begin
   inherited;

   qryCODTIPIMOVEL.AsString := sTipoImovel;

   if DBcboOutroDado.CanFocus then DBcboOutroDado.SetFocus;
end;




procedure TfrmCadOutroDadoXTipoImovel.CmeCadastroEdit(Sender: TObject);
begin
   inherited;

   qryCODTIPIMOVEL.AsString := sTipoImovel;

   if DBcboOutroDado.CanFocus then DBcboOutroDado.SetFocus;
end;




function TfrmCadOutroDadoXTipoImovel.VerificaPreenchimento: boolean;
begin
	Result := False;
	try

      if qryCODTIPIMOVEL.isNULL then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Imóvel!', DBcboTipoImovel);

      if qryIDOUTRODADO.isNULL then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Dado Complementar!', DBcboOutroDado);

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



procedure TfrmCadOutroDadoXTipoImovel.DBcboTipoImovelCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   CmeCadastro.Find(Self);
end;



procedure TfrmCadOutroDadoXTipoImovel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dtmLookImobiliario.qryLookTipoImovel.Close;
   dtmLookImobiliario.qryLookOutroDado.Close;

   inherited;
end;



procedure TfrmCadOutroDadoXTipoImovel.FormShow(Sender: TObject);
begin
   inherited;

   dtmLookImobiliario.qryLookTipoImovel.Open;
   dtmLookImobiliario.qryLookOutroDado.Open;
end;



procedure TfrmCadOutroDadoXTipoImovel.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := VerificaPreenchimento;
end;

end.
