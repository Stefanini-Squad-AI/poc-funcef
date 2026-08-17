unit FCadContaOrcamenXTipRecDes;

//	------------------------------------------------------------------------------------------------
//
//	   Cadastro de Contas Orçamentárias por por Tipo de Receita
//
//	Autor           :  Alex Pereira
//	Data de Início	:  04/01/2001
//	Data de Término :  04/01/2001
//
//	Modificações	:  16/02/2001 - trocado o nome do formulário/unit
//                                      anterior para o nome padrão já existente
//                 Alex    20/03/2001 - Conversão Delphi 5 c/ componente CMEventosCadastro
//
// -------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroDetalhe, Db, Wwdatsrc, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, Grids, Wwdbigrd,
  Wwdbgrid, TB97, ComCtrls, ExtCtrls, wwdblook, Mask, DBCtrls, MontaSelect,
  CmEventosCadastro;

type
  TfrmCadContaOrcamenXTipRecDes = class(TfrmCadastroDetalhe)
    dbLkpTipoRec: TwwDBLookupCombo;
    Label1: TLabel;
    qryIDTIPOCUSTORECIMO: TFloatField;
    qryIDPLANOORCAMEN: TFloatField;
    qryIDCONTAORCAMEN: TStringField;
    DBedtContaOrcam: TDBEdit;
    Label2: TLabel;
    btnBuscaContaOrcamen: TBitBtn;
    DBedtPlanoOrcam: TDBEdit;
    Label4: TLabel;
    qryNOMEPLANOORC: TStringField;
    qryNOMECONTAORCAMEN: TStringField;
    MSContaOrcam: TMontaSelect;
    qryCODCENTRORESPON: TStringField;
    qryLookTipoRecDes: TwwQuery;
    qryLookTipoRecDesDESCCUSTORECIMO: TStringField;
    qryLookTipoRecDesIDTIPOCUSTORECIMO: TFloatField;
    qryLookTipoRecDesRECCUSTO: TStringField;
    qryLookTipoRecDesCODTIPDOC: TFloatField;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBuscaContaOrcamenClick(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure dbLkpTipoRecChange(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroConfirma(Sender: TObject);

  private { Private declarations }
    iIdTipoCustoRecImo: integer;
    function VerificaPreenchimento: boolean;

  public { Public declarations }

  end;



var
  frmCadContaOrcamenXTipRecDes: TfrmCadContaOrcamenXTipRecDes;



implementation
{$R *.DFM}
uses
   uFuncoesImob, UComunsImobiliario, uVerificaPreenchimento, uMensErro;



procedure TfrmCadContaOrcamenXTipRecDes.CmeCadastroFind(Sender: TObject);
begin
   LimpaParametros(qry);
   qry.ParamByName('PIDTIPOCUSTORECIMO').AsInteger := iIdTipoCustoRecImo;
   qry.Open;

   if btnBuscaContaOrcamen.CanFocus then btnBuscaContaOrcamen.SetFocus;
   inherited;
end;



procedure TfrmCadContaOrcamenXTipRecDes.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   qryIDTIPOCUSTORECIMO.AsInteger := iIdTipoCustoRecImo;
   dbLkpTipoRec.Enabled := False;
end;



procedure TfrmCadContaOrcamenXTipRecDes.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   if btnBuscaContaOrcamen.CanFocus then btnBuscaContaOrcamen.SetFocus;
   dbLkpTipoRec.Enabled := False;
end;



procedure TfrmCadContaOrcamenXTipRecDes.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   dbLkpTipoRec.Enabled := true;
end;



function TfrmCadContaOrcamenXTipRecDes.VerificaPreenchimento;
begin
   Result := False;
   try

      if qryIDCONTAORCAMEN.isNULL then
         raise EValidacao.CreateVal('É necessário indicar a Conta Orçamentária!', btnBuscaContaOrcamen);

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



procedure TfrmCadContaOrcamenXTipRecDes.FormShow(Sender: TObject);
begin
   inherited;
   LimpaParametros(qryLookTipoRecDes);
   qryLookTipoRecDes.ParamByName('PRECCUSTO').AsString := 'C';
   qryLookTipoRecDes.Open;
   iIdTipoCustoRecImo := -1;
end;



procedure TfrmCadContaOrcamenXTipRecDes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qry.Close;
   qryLookTipoRecDes.Close;
end;



procedure TfrmCadContaOrcamenXTipRecDes.btnBuscaContaOrcamenClick(Sender: TObject);
begin
   inherited;
   MSContaOrcam.Executar;
   if MSContaOrcam.RetornouValor then begin
      qryIDPLANOORCAMEN.AsInteger  := StrToInt(MSContaOrcam.ValoresChave[0]);
      qryIDCONTAORCAMEN.AsString   := MSContaOrcam.ValoresChave[1];
      qryNOMEPLANOORC.AsString     := MSContaOrcam.ValoresChave[2];
      qryNOMECONTAORCAMEN.AsString := MSContaOrcam.ValoresChave[3];
      qryCODCENTRORESPON.AsString  := MSContaOrcam.ValoresChave[4];
   end;
end;



procedure TfrmCadContaOrcamenXTipRecDes.dbLkpTipoRecChange(Sender: TObject);
begin
   inherited;
   iIdTipoCustoRecImo := StrToInt(dbLkpTipoRec.LookupValue);
   CmeCadastro.Find(Self);
end;



procedure TfrmCadContaOrcamenXTipRecDes.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := VerificaPreenchimento;
end;



procedure TfrmCadContaOrcamenXTipRecDes.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
   dbLkpTipoRec.Enabled := true;
end;



end.
