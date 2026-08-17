{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior
Data        : 05/11/2010
Descrição   : Bloquear usuario que for mutuario do contrato com a variavel
'bBuscaMutuario'.
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fCadLancaSeguro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Grids,
  Wwdbigrd, Wwdbgrid, wwdbdatetimepicker, mContratoEmptmo;

type
  TfrmLancaDeposito = class(TFrmOkCancelarImob)
    molContratoEmptmo: TmolContratoEmptmo;
    Label1: TLabel;
    edtData: TwwDBDateTimePicker;
    wwDBGrid1: TwwDBGrid;
    qrySeguro: TwwQuery;
    dsSeguro: TDataSource;
    qryUpdate: TwwQuery;
    qrySeguroIDCONTRATOEMPTMO: TFloatField;
    qrySeguroNOME: TStringField;
    qrySeguroIDBENEFSEGURO: TFloatField;
    qrySeguroPERCINDENIZACAO: TFloatField;
    qrySeguroVLRREPASSE: TFloatField;
    qrySeguroIDINSCRICAOEMPTMO: TFloatField;

      procedure bbtnConfirmarClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);


   private  // Private declarations }
    sSqlAnt : String;

   public   // Public declarations

   end;



var
  frmLancaDeposito: TfrmLancaDeposito;



implementation
{$R *.DFM}
uses
   uMensErro, dMS, uFuncoesEmptmo;



procedure TfrmLancaDeposito.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if UFuncoesEmptmo.bBuscaMutuario then
      begin
         MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                           'O usuário é o próprio mutuário do '+
                           'contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
         Abort;
      end;


   if molContratoEmptmo.IDContrato = 0 then
   begin
      MsgDlg('Favor informar o Contrato!', 'Empréstimo', mtWarning,[mbOK],0);
      Exit;
   end;

   if length(trim(edtData.Text)) = 0 then
   begin
      MsgDlg('Favor informar a Data de Depósito!', 'Empréstimo', mtWarning,[mbOK],0);
      Exit;
   end;

   LimpaParametros(qryUpdate);
   qryUpdate.ParamByName('PDATAREPASSE').AsDateTime      := edtData.Date;
   qryUpdate.ParamByName('PIDINSCRICAOEMPTMO').AsFloat   := qrySeguroIDINSCRICAOEMPTMO.AsFloat;
   qryUpdate.ParamByName('PIDBENEFSEGURO').AsInteger     := qrySeguroIDBENEFSEGURO.AsInteger;
   qryUpdate.ExecSql;
end;



procedure TfrmLancaDeposito.FormCreate(Sender: TObject);
begin
   inherited;
   sSqlAnt := dtmMS.MS_ContratoEmptmo.Filtro.Text;
   dtmMS.MS_ContratoEmptmo.Filtro.Add('CON.FLGSITUACAO IN (''K'',''Q'')');
end;



procedure TfrmLancaDeposito.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dtmMS.MS_ContratoEmptmo.Filtro.Text := sSqlAnt;
   UFuncoesEmptmo.bBuscaMutuario := false;
   inherited;
end;



procedure TfrmLancaDeposito.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;

   molContratoEmptmo.btnBuscaContratoClick(Sender);

   LimpaParametros(qrySeguro);
   qrySeguro.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDCOntrato;
   qrySeguro.Open;
end;



end.
