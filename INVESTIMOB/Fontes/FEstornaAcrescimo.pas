unit FEstornaAcrescimo;

//	-------------------------------------------------------------------------------------------------
//
//    Everybody else is doing it
//    So why can't we ?
//
//                      The Cranberries
//
//	-------------------------------------------------------------------------------------------------
//	-------------------------------------------------------------------------------------------------
//
//	Acréscimo de Valor
//
//	Autor          :  André Pontes
//	Data de Início	:  17/01/2000
//	Data de Término:  18/01/2000
//
//	Modificações	:
//
//
// -------------------------------------------------------------------------------------------------



interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Mask, Grids, Wwdbigrd, Wwdbgrid, wwdbdatetimepicker,
  CMDateTimePicker, DBCtrls, CmEventosCadastro, ImgList;

type
  TfrmEstornaAcrescimo = class(TfrmCadastroCS)
    Panel1: TPanel;
    Panel2: TPanel;
    Label6: TLabel;
    Label15: TLabel;
    edtDataEstorno: TCMDateTimePicker;
    DBedtDataOper: TCMDateTimePicker;
    lblImovel: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBedtObsLaudo: TDBEdit;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label3: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    dbgrdDet: TwwDBGrid;
    Bevel1: TBevel;
    DBEdit3: TDBEdit;
    Label2: TLabel;
    qryOperXAcresc: TwwQuery;
    dsOperXAcresc: TwwDataSource;
    qryVLROPERACAOOM: TFloatField;
    qryVLROPERACAO: TFloatField;
    qryMOECODIGO: TFloatField;
    qryDATAVENCOPER: TDateTimeField;
    qryDATAOPERACAO: TDateTimeField;
    qryOBSERVACAO: TStringField;
    qryNOME_IMOVEL: TStringField;
    qryNOME_MESTRE: TStringField;
    qryDESCTIPOOPERACAO: TStringField;
    qryRAZAOSOCIAL: TStringField;
    qryNOME: TStringField;
    qryMOESIGLA: TStringField;
    Label5: TLabel;
    DBedtDataVenc: TCMDateTimePicker;
    qryOperXAcrescPLACA: TFloatField;
    qryOperXAcrescDESBEM: TStringField;
    qryOperXAcrescVALORG: TFloatField;
    qryOperXAcrescDATAACRESCIMO: TDateTimeField;
    qryOperXAcrescIDBEM: TFloatField;
    qryOperXAcrescIDMOVIMENTACAO: TFloatField;
    qryOperXAcrescIDACRESCIMO: TFloatField;

    // procedimentos definidos
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);

    function VerificaPreenchimento: boolean;

    // outros procedimentos
    procedure FormShow(Sender: TObject);



  private { Private declarations }
   iOperacao   : integer;
   dDataAcresc : TDateTime;

  public { Public declarations }

  end;



var
  frmEstornaAcrescimo: TfrmEstornaAcrescimo;



implementation
{$R *.DFM}
Uses
  USistema, UMensErro, UDatabase, DBaseDados, UModulo, uComunsImobiliario, uVerificaPreenchimento, uIntegraBack,
  UDocumento, uOperComum, uAtivoFixo, uFuncoesImob;



procedure TfrmEstornaAcrescimo.CmeCadastroFind(Sender: TObject);
begin
	inherited;

	// redesenha o form na volta do MontaSelect
	Repaint;

	// se houve busca, abre a query principal com apenas o registro buscado
	if MontaSelect.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iOperacao   := StrToInt(MontaSelect.ValoresChave[0]);

		with qry do begin
         LimpaParametros(qry);
         ParamByName('OPERACAO').asInteger  := iOperacao;
         Open;
      end;

      with qryOperXAcresc do begin
         LimpaParametros(qryOperXAcresc);
         ParamByName('OPERACAO').asInteger  := iOperacao;
         Open;
      end;

      Screen.Cursor := crDefault;
   end;
end;



procedure TfrmEstornaAcrescimo.CmeCadastroDelete(Sender: TObject);
var
   iBem, iAcrescimo  : integer;
   dDataEstorno      : TDateTime;
begin
   Screen.Cursor := crHourGlass;

   try

      try

         StartTransacao;

         dDataEstorno   := edtDataEstorno.Date;

         with qryOperXAcresc do begin
            First;
            while not EOF do begin
               iBem        := qryOperXAcrescIDBEM.asInteger;
               iAcrescimo  := qryOperXAcrescIDACRESCIMO.asInteger;

               // Executa o estorno no Ativo Fixo
               if AtivoFixo.EstornaAcrescimo(Sistema.idModulo, Sistema.idEmpresa,
               iBem, dDataAcresc, dDataEstorno, iAcrescimo, True) = -1 then Abort;

               Next;
            end;
         end;

         // Executa o estorno da Operacao
         OperComum.EstornaOper(iOperacao, Sistema.idEmpresa, Sistema.idModulo, Modulo.fVlrPrimeiraCota,
         dDataEstorno, True);

         CommitTransacao;

      except

         RollBackTransacao;
         Raise;
         Repaint;

      end;

   finally
      Screen.Cursor := crDefault;
   end;
end;



function TfrmEstornaAcrescimo.VerificaPreenchimento: boolean;
begin
	Result := False;

   // dados comuns ---------------------------------------------------------------------------------
	try

      if length(trim(edtDataEstorno.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data do Estorno!', edtDataEstorno);

   except

      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

	Result := True;
end;



procedure TfrmEstornaAcrescimo.FormShow(Sender: TObject);
begin
   inherited;

   // preenche a data do estorno com a data atual
   edtDataEstorno.Date  := Date;
end;



end.
