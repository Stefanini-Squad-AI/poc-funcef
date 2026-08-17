unit FCadAcertaContabil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, StdCtrls, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, cmseldlg, wwDialog, wwidlg, ImgList, Db, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, DBCtrls, MAHlpBtn, Buttons, TB97Tlbr,
  TB97Ctls, TB97, ExtCtrls, DBTables, Wwquery, UOperacaoInvest, MontaSelect,
  wwdblook;

type
  TFrmCadAcertaContabil = class(TfrmCadastro)
    dbdDta: TCMDateTimePicker;
    Label1: TLabel;
    MontaSelect: TMontaSelect;
    qry: TwwQuery;
    qryVLRJUROS: TFloatField;
    qryVLRVARIACAO: TFloatField;
    qryIDINVESTIMENTO: TFloatField;
    qryIDCARTEIRAINVEST: TFloatField;
    qryIDLOTE: TStringField;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
     function IntegraContabil : Boolean;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadAcertaContabil: TFrmCadAcertaContabil;

implementation

uses DBaseDados, fAguarde, dOperComum, UmensErro, UDiasUteisInvest,
     UOperComum, UBibliotecaInvest, USistema;

{$R *.DFM}

procedure TFrmCadAcertaContabil.bbtnConfirmarClick(Sender: TObject);
begin
  Try
     If not dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.StartTransaction;

     If Not IntegraContabil Then
        Abort;

     If dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.Commit;

     MsgDlg('Processo concluído.','Mensagem do Sistema',
               mtInformation,[MbOk],0);
  Except
      MsgDlg('Não foi possível concluir a Integração.','Mensagem do Sistema',
               mtInformation,[MbOk],0);
      dtmBaseDados.dbBaseDados.Rollback;
  End;
end;

function TFrmCadAcertaContabil.IntegraContabil : Boolean;
Var
   QryLocal           : TwwQuery;
   dDtaAnterior       : TDateTime;
   wMensErro, wTipoRecDesBol, wNaturezaMovimento, wTipoPapel  : String;
   wPlano, wPlanilha, wDocumento, wMoedaReg, wMoeCodigo, wIdForCli, wTipoOperacao : Integer;
   wVariacao, wCotacao1, wCotacao2                 : Double;
   bCriaLancto        : Boolean;
begin
   wTipoRecDesBol := '';
   wPlano         := -1;
   wPlanilha      := -1;
   wDocumento     := -1;
   wVariacao      :=  0;
   wTipoOperacao  :=  0;
   wMoedaReg      :=  0;

   if qry.RecordCount > 0 then
   begin
      frmAguarde.Pos := 0;
      frmAguarde.Max := qry.RecordCount;
      frmAguarde.Mostra('Aguarde - Atualizando Contabilidade');
   end;

   Try
      while not qry.EOF do
      begin
         If (wVariacao) < 0 Then
             wNaturezaMovimento := 'P'
         Else
             wNaturezaMovimento := 'G';

         wIdForCli := -1;

         OperComum.LancaOperRFRV(
            Sistema.IdEmpresa, 79,2,
            qry.FieldByName('IDINVESTIMENTO').AsInteger,wTipoOperacao, -1,
            wIdForCli,qry.FieldByName('IDCARTEIRAINVEST').AsInteger,
            wMoedaReg, wTipoPapel,qry.FieldByName('IDLOTE').AsString, '','',
            '', wTipoRecDesBol, bCriaLancto, 0, wVariacao,
            dbdDta.Date, dbdDta.Date,wPlano, wPlanilha, wDocumento, wMensErro);

         if Trim(wMensErro) <> '' then
         begin
            MsgDlg('Ocorreu um erro na contabilisação da operação: '+
                   IntToStr(wTipoOperacao),
                   'Erro', mtError, [mbOk], 0);
            Abort;
         end;

         qry.Next;

         frmAguarde.Pos := frmAguarde.Pos + 1;

      End;

      Result := True;

   Except

      frmAguarde.Apaga;

      MsgDlg('Não foi possível excluir os lançamentos Contábeis.','Mensagem do Sistema',
              mtInformation,[MbOk],0);

      Result := false;
   End;

   frmAguarde.Apaga;

end;

end.
