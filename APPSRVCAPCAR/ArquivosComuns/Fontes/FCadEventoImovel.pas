unit FCadEventoImovel;

//	------------------------------------------------------------------------------------------------
//
//	   Cadastro de Indicadores por Imóvel
//
//	Autor             :  André Pontes
//	Data de Início	   :
//	Data de Término   :
//
//	Modificações	   :  29/05/2001  1) Cadastro praticamente refeito: molImovel, novos campos,
//                                     novo visual
//
// -------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroDetalhe, Db, Wwdatsrc, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, Grids, Wwdbigrd,
  Wwdbgrid, TB97, ComCtrls, ExtCtrls, MontaSelect, wwdblook, wwriched,
  Mask, DBCtrls, wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro,
  mImovel;

type
  TfrmCadEventoImovel = class(TfrmCadastroDetalhe)
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBedtDataHistorico: TCMDateTimePicker;
    DBedtHistorico: TDBEdit;
    qryIDEVENTOIMOVEL: TFloatField;
    qryIDIMOVEL: TFloatField;
    qryEVIDATA: TDateTimeField;
    qryEVICABECALHO: TStringField;
    DBmemDescricao: TDBMemo;
    qryEVIDESCRICAO: TMemoField;
    Panel3: TPanel;
    Bevel1: TBevel;
    DBedtUsuario: TDBEdit;
    Label1: TLabel;
    qryIDUSUARIO: TFloatField;
    qryNOMEUSUARIO: TStringField;
    qryNOME: TStringField;
    qryUSUARIO_EXTENSO: TStringField;
    Label6: TLabel;
    DBedtVlrAnterior: TDBEdit;
    DBedtVlrAjustado: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    DBedtPercent: TDBEdit;
    Bevel2: TBevel;
    qryEVIVLRANTERIOR: TFloatField;
    qryEVIVLRAJUSTADO: TFloatField;
    qryEVIPERCENT: TFloatField;
    qryFLGTIPOEVENTO: TStringField;
    molImovel1: TmolImovel;
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure molImovel1btnBuscaImovelClick(Sender: TObject);


  private { Private declarations }
    function VerificaPreenchimento: boolean;


  public { Public declarations }

  end;



var
  frmCadEventoImovel: TfrmCadEventoImovel;



implementation
{$R *.DFM}
uses
   uComunsImobiliario, uVerificaPreenchimento, uMensErro, uDatabase, DBaseDados, uFuncoesImob, dLookImobiliario, dMS,
   uSistema;




procedure TfrmCadEventoImovel.CmeCadastroFind(Sender: TObject);
begin
   Screen.Cursor        := crHourGlass;

   with qry do begin
      LimpaParametros(qry);
      Params[0].asInteger  := molImovel1.iImovel;
      Open;
   end;

   Screen.Cursor := crDefault;

   inherited;
end;



procedure TfrmCadEventoImovel.CmeCadastroInsert(Sender: TObject);
begin
   inherited;

   qryIDEVENTOIMOVEL.asInteger   := LeUltRegistro(nil, 'EVENTOIMOVEL');
   qryIDIMOVEL.AsInteger         := molImovel1.iImovel;
   qryFLGTIPOEVENTO.Clear;


   if DBedtDataHistorico.CanFocus then DBedtDataHistorico.SetFocus;
end;




procedure TfrmCadEventoImovel.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   if DBedtDataHistorico.CanFocus then DBedtDataHistorico.SetFocus;
end;



function TfrmCadEventoImovel.VerificaPreenchimento: boolean;
begin
	Result := False;
	try

		// Imovel
      if qryIDIMOVEL.isNULL then
         raise EValidacao.CreateVal('É necessário indicar o Imóvel!', molImovel1.btnBuscaImovel);

		// Outro Dado
      if qryEVIDATA.isNULL then
         raise EValidacao.CreateVal('É necessário indicar a Data do Histórico!', DBedtDataHistorico);

		// "Valor"
      if qryEVICABECALHO.isNULL then
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



procedure TfrmCadEventoImovel.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := VerificaPreenchimento;
end;



procedure TfrmCadEventoImovel.CmeCadastroConfirma(Sender: TObject);
begin
   if qry.State in dsEditModes then qryIDUSUARIO.AsInteger := Sistema.idUsuario;

   inherited;

   // fecha e abre a query para exibir o usuário e reordená-la
   CmeCadastroFind(self);
end;



procedure TfrmCadEventoImovel.molImovel1btnBuscaImovelClick(Sender: TObject);
begin
   inherited;
   molImovel1.btnBuscaImovelClick(Sender);

   CmeCadastroFind(self);
end;



end.
