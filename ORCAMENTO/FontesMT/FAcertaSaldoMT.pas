// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : AcertaSaldoConfirmaClick
Data      : 19/09/2003
Autor     : André Pontes
Pendencia : 15033
---------------------------------------------------------------------------------------------------}
unit FAcertaSaldoMT;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, ComCtrls, MontaSelect,
   DBClient, uCMClientDataSet, uCmSqlParams, uCtrlSaldoorcado, uCMTypes;

type
   TfrmAcertaSaldoMT = class(TfrmSairAjuda)
      bbtnConfirma: TBitBtn;
      ToolbarSep971: TToolbarSep97;
      mmTela: TMemo;
      pbAguarde: TProgressBar;
      lblTipoSaldo: TLabel;
      lblCodigoConta: TLabel;
      edtCodigoConta: TEdit;
      bbtnBuscaConta: TBitBtn;
      MontaSelectConta: TMontaSelect;
      edtNomeConta: TEdit;

      procedure FormCreate(Sender: TObject);
      procedure FormActivate(Sender: TObject);
      procedure edtCodigoContaExit(Sender: TObject);
      procedure bbtnBuscaContaClick(Sender: TObject);
      procedure bbtnConfirmaClick(Sender: TObject);


   private  // Private declarations

      CtrlSaldoorcado: TCtrlSaldoorcado;


   public   // Public declarations

   end;



var
  frmAcertaSaldoMT: TfrmAcertaSaldoMT;



implementation
{$R *.DFM}
uses
   uSistema, uMensErro, uDataBase, dBaseDados, uCtrlOrcamento, uModulo;



procedure TfrmAcertaSaldoMT.FormCreate(Sender: TObject);
begin
   inherited;

   CtrlSaldoorcado := TCtrlSaldoorcado.Create;

   CtrlSaldoorcado.Initialize( DtmBaseDados.dbBaseDados, True,
                               Sistema.ConnectionType,   Sistema.ConnectionSide,
                               Sistema.AppRemoteServer,  True, nil, nil, False );

   CtrlSaldoorcado.pbAguarde := pbAguarde;
end;



procedure TfrmAcertaSaldoMT.FormActivate(Sender: TObject);
begin
   inherited;
   lblTipoSaldo.Caption := '';
end;



procedure TfrmAcertaSaldoMT.edtCodigoContaExit(Sender: TObject);
var
   sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo,
   sNomeGrupo, sUnid, sPPrev, sCCusto, sPatro: string;
begin
   inherited;
   if trim(edtCodigoConta.text) <> '' then
   begin
      if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc,
                                           edtCodigoConta.text,
                                           true,
                                           true,
                                           sNomeConta,
                                           sCodCentroRespon,
                                           sNomeCentroRespon,
                                           sCodGrupo,
                                           sNomeGrupo,
                                           sUnid,
                                           sPPrev,
                                           sCCusto,
                                           sPatro
                                          ) = 0 then
      begin
         edtNomeConta.text  := sNomeConta;
      end
      else
      begin
         edtCodigoConta.clear;
         edtNomeConta.clear;
         if edtCodigoConta.CanFocus then edtCodigoConta.SetFocus;
      end;
   end;
end;



procedure TfrmAcertaSaldoMT.bbtnBuscaContaClick(Sender: TObject);
var
   sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo, sNomeGrupo,
   sUnid, sPPrev, sCCusto, sPatro: string;
begin
   inherited;

   // Busca a Conta Orçamentária
   MontaSelectConta.Executar;
   Repaint;

   if MontaSelectConta.RetornouValor then
   begin
      if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc,
                                           MontaSelectConta.ValoresChave[1],
                                           true,
                                           false,
                                           sNomeConta,
                                           sCodCentroRespon,
                                           sNomeCentroRespon,
                                           sCodGrupo,
                                           sNomeGrupo,
                                           sUnid,
                                           sPPrev,
                                           sCCusto,
                                           sPatro
                                          ) = 0 then
      begin
         edtCodigoConta.text := MontaSelectConta.ValoresChave[1];
         edtNomeConta.text   := sNomeConta;
      end
      else
      begin
         edtCodigoConta.SetFocus;
      end;
   end;
end;



procedure TfrmAcertaSaldoMT.bbtnConfirmaClick(Sender: TObject);
begin
   inherited;

   if CtrlSaldoOrcado.AcertaSaldoConfirmaClick(Sistema.IdEmpresa,
                                               edtCodigoConta.Text,
                                               1, 1, 1 
                                              ) then
   begin
      MsgDlg('Acerto Efetuado com Sucesso!', 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
   end
   else
   begin
      MsgDlg('Acerto NÃO efetuado.', 'Erro', mtError, [mbOk], 0);
      Repaint;
   end;
end;




end.
