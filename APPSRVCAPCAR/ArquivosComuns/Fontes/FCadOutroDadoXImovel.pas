unit FCadOutroDadoXImovel;

//	-------------------------------------------------------------------------------------------------
//
//	   Cadastro de Dados Complementares de Imóveis
//
//	Autor             :	André Pontes
//	Data de Início    :  21/03/2000
//	Data de Término   :
//
//	Modificações      :
//
// -------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroDetalhe, Db, Wwdatsrc, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, Grids, Wwdbigrd,
  Wwdbgrid, TB97, ComCtrls, ExtCtrls, MontaSelect, Mask, DBCtrls, wwdblook,
  CmEventosCadastro;

type
  TfrmCadOutroDadoXImovel = class(TfrmCadastroDetalhe)
    btnBuscaImovel: TBitBtn;
    edtNomeExtenso: TEdit;
    Label2: TLabel;
    qryIDIMOVEL: TFloatField;
    qryIDOUTRODADO: TFloatField;
    qryODIVALOR: TStringField;
    qryODODESCRICAO: TStringField;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    DBcboOutroDado: TwwDBLookupCombo;
    DBedtValor: TDBEdit;

    procedure btnBuscaImovelClick(Sender: TObject);
    procedure ForMontaSelecthow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBcboOutroDadoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DBedtValorChange(Sender: TObject);


    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private { Private declarations }
   iImovel : integer;


    function VerificaPreenchimento: boolean;

  public { Public declarations }

  end;



var
  frmCadOutroDadoXImovel: TfrmCadOutroDadoXImovel;



implementation
{$R *.DFM}
uses
   uVerificaPreenchimento, uMensErro, dLookImobiliario, uFuncoesImob, DMS;



procedure TfrmCadOutroDadoXImovel.CmeCadastroFind(Sender: TObject);
begin
   dtmMS.MS_Imovel.Executar;
   Repaint;

   if dtmMS.MS_Imovel.RetornouValor then begin
      // dtmMS.MS_Imovel.CamposChave
      //    [0] IM.IDIMOVEL
      //    [1] I.IDIMOVEL
      //    [2] IM.IMONOME
      //    [3] I.IMONOME
      //    [4] I.CODTIPIMOVEL
      //    [5] I.IDCARTEIRAINVEST

      Screen.Cursor := crHourGlass;

      iImovel              := StrToInt(dtmMS.MS_Imovel.ValoresChave[1]);
      edtNomeExtenso.Text  := dtmMS.MS_Imovel.ValoresChave[2] + ' - ' +
                              dtmMS.MS_Imovel.ValoresChave[3];

      with dtmLookImobiliario.qryLookOutroDadoXTipoImo do begin
         LimpaParametros(dtmLookImobiliario.qryLookOutroDadoXTipoImo);
         ParamByName('PCODTIPIMOVEL').asString  := dtmMS.MS_Imovel.ValoresChave[4];
         Open;
      end;

      with qry do begin
         LimpaParametros(qry);
         ParamByName('PIDIMOVEL').asInteger  := iImovel;
         Open;
      end;

      Screen.Cursor := crDefault;
   end;

   inherited;
end;



procedure TfrmCadOutroDadoXImovel.CmeCadastroInsert(Sender: TObject);
begin
   inherited;

   qryIDIMOVEL.AsInteger := iImovel;

   if DBcboOutroDado.CanFocus then DBcboOutroDado.SetFocus;
end;




procedure TfrmCadOutroDadoXImovel.CmeCadastroEdit(Sender: TObject);
begin
   inherited;

   qryIDIMOVEL.AsInteger := iImovel;

   if DBcboOutroDado.CanFocus then DBcboOutroDado.SetFocus;
end;




function TfrmCadOutroDadoXImovel.VerificaPreenchimento: boolean;
begin
	Result := False;
	try

		// Imovel
      if qryIDIMOVEL.isNULL then
         raise EValidacao.CreateVal('É necessário indicar o Imóvel!', btnBuscaImovel);

		// Outro Dado
      if qryIDOUTRODADO.isNULL then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Dado Complementar!', DBcboOutroDado);

		// "Valor"
      if qryODIVALOR.isNULL then
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



procedure TfrmCadOutroDadoXImovel.btnBuscaImovelClick(Sender: TObject);
begin
   CmeCadastro.Find(Self);
end;



procedure TfrmCadOutroDadoXImovel.ForMontaSelecthow(Sender: TObject);
begin
   inherited;
   if btnBuscaImovel.CanFocus then btnBuscaImovel.SetFocus;
end;



procedure TfrmCadOutroDadoXImovel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qry.Close;
   dtmLookImobiliario.qryLookOutroDadoXTipoImo.Close;

   inherited;
end;



procedure TfrmCadOutroDadoXImovel.DBcboOutroDadoCloseUp(Sender: TObject; lookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if qry.State in [dsInsert, dsEdit] then qryODODESCRICAO.asString := DBcboOutroDado.Text;
end;


procedure TfrmCadOutroDadoXImovel.DBedtValorChange(Sender: TObject);
begin
   inherited;
   if qry.State in [dsInsert, dsEdit] then qryODIVALOR.asString := DBedtValor.Text;
end;

procedure TfrmCadOutroDadoXImovel.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := VerificaPreenchimento;
end;

end.
