unit FCadGestor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, StdCtrls, Db, ExtDlgs, Pessoa, Menus, MontaSelect, DBTables,
  Wwdatsrc, Wwquery, TB97, MAHlpBtn, Buttons, Grids, Wwdbigrd, Wwdbgrid,
  checklst, DBCtrls, ExtCtrls, TabControlDetalhe, DBaseDados,
  wwdblook, Mask, wwdbedit, UMensErro, TB97Ctls, TB97Tlbr, IvDictio,
  IvMulti, IvEMulti, CMDBLookupCombo, CmEventosCadastro, ImgList, ComCtrls,
  wwdbdatetimepicker, CMDateTimePicker, Wwdbspin, UOperacaoInvest, UDataBase,
  TREdit;

type
  TfrmCadGestor = class(TfrmPessoa)
    qryAux: TwwQuery;
    tbsSubConta: TTabSheet;
    qrySubConta: TwwQuery;
    qrySubContaNOMESUBCONTA: TStringField;
    qrySubContaCODSUBCONTA: TFloatField;
    QryBuscaStrSubConta: TwwQuery;
    QryBuscaStrSubContaNOMESUBCONTA: TStringField;
    QryBuscaStrSubContaCODSUBCONTA: TFloatField;
    QryInsSubConta: TwwQuery;
    Panel3: TPanel;
    lblSubContaD: TLabel;
    dblkSubContaD: TwwDBLookupCombo;
    dblkSubContaC: TwwDBLookupCombo;
    lblSubContaC: TLabel;

    Procedure CmeCadastroDelete(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Procedure CriaSubConta;    
  public
    { Public declarations }
  end;

var
  frmCadGestor: TfrmCadGestor;

implementation

uses UBibliotecaInvest;

{$R *.DFM}
procedure TfrmCadGestor.CmeCadastroDelete(Sender: TObject);
var
   PodeExcluir : boolean ;
   sSql        : String ;
begin
   try
      PodeExcluir := True;
      qryAux.Close;
      qryAux.SQL.Clear;
      sSql := 'SELECT FI.IDFUNDOINVEST, FI.IDGESTORCARTEIRA FROM FUNDOINVEST FI WHERE FI.IDGESTORCARTEIRA = '''+qrySubTipo.FieldByname('IdGestorCarteira').AsString + '''';
      qryAux.SQL.Add(sSQL);
      qryAux.Open;
      if not qryAux.IsEmpty  then
      begin
         PodeExcluir := False;
         MsgDlg('Gestor já tem Fundo Associado , Não pode ser Excluído',LerMensagem(2),mtError,[mbOk],0);
      end;
      qryAux.Close;
      qryAux.SQL.Clear;
      sSql := 'SELECT PI.IDPLANOINVEST, PI.IDGESTORCARTEIRA FROM PLANOINVEST PI WHERE PI.IDGESTORCARTEIRA = '''+qrySubTipo.FieldByname('IdGestorCarteira').AsString + '''';
      qryAux.SQL.Add(sSQL);
      qryAux.Open;
      if not qryAux.IsEmpty  then
      begin
         PodeExcluir := False;
         MsgDlg('Gestor já tem Plano Associado , Não pode ser Excluído',LerMensagem(2),mtError,[mbOk],0);
      end;
      qryAux.Close;
      qryAux.SQL.Clear;
      sSql := 'SELECT CI.IDCARTEIRAINVEST, CI.IDGESTORCARTEIRA FROM CARTEIRAINVEST CI WHERE CI.IDGESTORCARTEIRA = '''+qrySubTipo.FieldByname('IdGestorCarteira').AsString + '''';
      qryAux.SQL.Add(sSQL);
      qryAux.Open;
      if not qryAux.IsEmpty  then
      begin
         PodeExcluir := False;
         MsgDlg('Gestor já tem Carteira Associada , Não pode ser Excluído',LerMensagem(2),mtError,[mbOk],0);
      end;
      if PodeExcluir then
  inherited;
  qryAux.Close;
 except raise ;
 end;
end;

procedure TfrmCadGestor.CriaSubConta;
var
   iIdSubConta : integer;
begin
   if pRPI.FLGUSASUBCONTA = 'S' then
   begin
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;
      Try
         if (Trim(QrySubTipo.FieldByName('SUBCONTAD').AsString) = '') or
            (Trim(QrySubTipo.FieldByName('SUBCONTAC').AsString) = '') then
         begin
            // Verifica se a Sub-Conta já está cadastrada
            with QryBuscaStrSubConta do
            begin
               Close;
               ParamByName('NOMESUBCONTA').AsString := Qry.FieldByName('RAZAOSOCIAL').AsString;
               Open;
               if isEmpty then // Se nao existir, entao cadastra
               begin
                  with QryInsSubConta do
                  begin
                     Close;
                     iIdSubConta := LeUltRegistro(nil,'SUBCONTA');
                     ParamByName('CODSUBCONTA').AsInteger := iIdSubConta; // Gera Novo Id de Operacao
                     ParamByName('IDPESSOA').AsInteger    := 1;
                     ParamByName('NOMESUBCONTA').AsString := Qry.FieldByName('RAZAOSOCIAL').AsString;
                     ExecSQL;
                     Close;
                     qrySubTipo.FieldByName('SUBCONTAD').AsInteger := iIdSubConta;
                     qrySubTipo.FieldByName('SUBCONTAC').AsInteger := iIdSubConta;
                  end;
               end
               else
               begin
                  qrySubTipo.FieldByName('SUBCONTAD').AsInteger := QryBuscaStrSubConta.FieldByName('CODSUBCONTA').AsInteger;
                  qrySubTipo.FieldByName('SUBCONTAC').AsInteger := QryBuscaStrSubConta.FieldByName('CODSUBCONTA').AsInteger;
               end;
            end;
         end;
         dtmBaseDados.dbBaseDados.Commit;
      except
         on E: Exception do
         begin
            DtmBaseDados.dbBaseDados.Rollback;
            MsgDlg('Ocorreu problema ao incluir a Sub-Conta.'+
                   #13+E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
         end;
      end;
   end;
end;

procedure TfrmCadGestor.bbtnConfirmarClick(Sender: TObject);
begin
  If (Ds.DataSet.State  in [dsInsert, dsEdit]) then
  begin
     CriaSubConta;
  end;

  inherited;

end;

procedure TfrmCadGestor.FormShow(Sender: TObject);
begin
  inherited;
   qrySubConta.Close;
   qrySubConta.Open;
end;

end.
