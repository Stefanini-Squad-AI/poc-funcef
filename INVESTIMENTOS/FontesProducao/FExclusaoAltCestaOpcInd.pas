//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_2
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data      : 06/03/2006
// Código    : AL_1
// Pendencia :
// SOL       :
// Desc.     : Implementação da trava de fechamento de renda variavel
//******************************************************************************

unit FExclusaoAltCestaOpcInd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSInv, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, fcLabel, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, wwdbdatetimepicker, CMDateTimePicker, wwdblook;

type
  TfrmExclusaoAltCestaOpcInd = class(TfrmCadastroCSInv)
    dblOpcao: TwwDBLookupCombo;
    lblCestaOpcInd: TLabel;
    qryINVEST: TStringField;
    qryIDORDEMOPCIND: TFloatField;
    qryIDINVESTOPC: TFloatField;
    qryDESCINVESTIMENTO: TStringField;
    qryIDBOLETA: TStringField;
    qryDATAVIGENCIA: TDateTimeField;
    qryIDCESTAOPCIND: TFloatField;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblOpcaoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Habilita;
    procedure Desabilita;
  public
    { Public declarations }
  end;

var
  frmExclusaoAltCestaOpcInd: TfrmExclusaoAltCestaOpcInd;
  sIdCesta, dDataVigencia : String;

implementation

uses DBaseDados, UBibliotecaInvest, UMensErro,UOperComum, dOpcoes, UOperacaoinvest,
     URendaVariavel,
     //AL_2
     uCtrlInvContab;

{$R *.DFM}

procedure TfrmExclusaoAltCestaOpcInd.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   dblOpcao.Text := '';
   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.RollBack;
   CmeCadastroAtualizaBotoes(Sender);
end;

procedure TfrmExclusaoAltCestaOpcInd.CmeCadastroAtualizaBotoes(
  Sender: TObject);
begin
  inherited;
   pnlFundo.Enabled    := True;
end;

procedure TfrmExclusaoAltCestaOpcInd.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
    CmeCadastroAtualizaBotoes(Sender);
    If dblOpcao.Text <> '' Then
       Habilita
    Else
       Desabilita;
end;

procedure TfrmExclusaoAltCestaOpcInd.Habilita;
begin
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;

procedure TfrmExclusaoAltCestaOpcInd.Desabilita;
begin
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
end;

procedure TfrmExclusaoAltCestaOpcInd.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
   begin
      if Qry.Locate('IDCESTAOPCIND;DATAVIGENCIA', VarArrayOf([MontaSelect.ValoresChave[0],MontaSelect.ValoresChave[1]]), []) then
      begin
         dblOpcao.Text := qry.FieldByName('INVEST').AsString;
         sIdCesta      := MontaSelect.ValoresChave[0];
         dDataVigencia := MontaSelect.ValoresChave[1];
      end
      else
         dblOpcao.Text := '';
   end
   else
      dblOpcao.Text := '';
end;

procedure TfrmExclusaoAltCestaOpcInd.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   // AL_1
   if RendaVariavel.VerEmAbertura then
      Exit;

   if not Qry.Locate('IDCESTAOPCIND;DATAVIGENCIA', VarArrayOf([sIdCesta,dDataVigencia]), []) then
   begin
       MsgDlg('Boleta inexistente.','Mensagem do Sistema', MtWarning,[MbOk],0);
       dblOpcao.Text := '';
       Exit;
   end
   else If (MsgDlg('Exclui Alteração desta Cesta ?','Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrYes)  Then
   begin
      Try
         //AL_2
         if not CtrlInvContab.TestaPeriodo(qry.FieldByName('DATAVIGENCIA').AsString, 2, 8) then
         begin
            MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema', MtWarning,[MbOk],0);
            Exit;
         end;
         // Abre a única transação deste processo
         if not(dtmBaseDados.dbBaseDados.InTransaction) then
            DtmBaseDados.dbBaseDados.StartTransaction;

         with DMOpcoes.qryAux do
         begin
            Close;
            SQL.Clear;
            SQL.Text := 'DELETE FROM CESTAOPCIND WHERE IDCESTAOPCIND = ' + IntToStr(qry.FieldByName('IDCESTAOPCIND').AsInteger)+
                        ' AND DATAVIGENCIA = TO_DATE(' + QuotedStr(qry.FieldByName('DATAVIGENCIA').AsString) +',''DD/MM/YYYY'')';
            ExecSQL;
            Close;
         end;

         DtmBaseDados.dbBaseDados.Commit;
         MsgDlg('Operação concluída com sucesso.','Mensagem do Sistema', mtConfirmation,[MbOk],0);
      except
         on E: Exception do
         begin
            DtmBaseDados.dbBaseDados.Rollback;
            MsgDlg('Ocorreu um problema na exclusão da Cesta.'+#13+ E.Message,'Mensagem do Sistema ',mtError,[mbOK],0);
         end;
      end;
   end;
   Qry.Close;
   Qry.Open;
   CmeCadastroAtualizaBotoes(Sender);
   dblOpcao.Text := '';
   Desabilita;
end;

procedure TfrmExclusaoAltCestaOpcInd.dblOpcaoChange(Sender: TObject);
begin
  inherited;
   If dblOpcao.Text <> '' Then
   begin
      Habilita;
      sIdCesta      := qry.FieldByName('IDCESTAOPCIND').AsString;
      dDataVigencia := qry.FieldByName('DATAVIGENCIA').AsString;
   end
   Else
      Desabilita;
end;

procedure TfrmExclusaoAltCestaOpcInd.FormShow(Sender: TObject);
begin
  inherited;
   Qry.Open;
end;

end.
