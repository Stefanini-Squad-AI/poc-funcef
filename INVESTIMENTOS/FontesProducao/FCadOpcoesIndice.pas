//*******************************************************************************
// Data     : 06/04/2004
// Origem   : CM
// Função   : Tela
// Linha(s) :
// Motivo   : Incluida qryCarteiraSPC
//*******************************************************************************

unit FCadOpcoesIndice;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSInv, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, fcLabel, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, TREdit, wwdbdatetimepicker, CMDateTimePicker, DBCtrls, ComCtrls,
  DBGrids, Mask, wwdblook;

type
  TfrmCadOpcoesIndice = class(TfrmCadastroCSInv)
    lblInvestimento: TLabel;
    lblDtVencto: TLabel;
    dbdVencimento: TCMDateTimePicker;
    dbrTipoExercicio: TDBRadioGroup;
    dbrTipoOpcao: TDBRadioGroup;
    dbrVlrExercicio: TDBRealEdit;
    lblPuExerc: TLabel;
    dbrePonto: TDBRealEdit;
    dblPonto: TLabel;
    dbrTipoCotacao: TDBRadioGroup;
    dbreStrikePut: TDBRealEdit;
    lblStrikePut: TLabel;
    qryOpcoes: TwwQuery;
    dsOpcoes: TwwDataSource;
    updOpcoes: TUpdateSQL;
    dbeNomeOpcao: TDBEdit;
    qryDESCINVESTIMENTO: TStringField;
    qryIDTIPOINVEST: TFloatField;
    qryFLGATIVO: TStringField;
    qrySTAOPCAO: TStringField;
    qryOpcoesIDOPCAO: TFloatField;
    qryOpcoesIDINVESTIMENTO: TFloatField;
    qryOpcoesDTAVENCTO: TDateTimeField;
    qryOpcoesVLRPRECOEX: TFloatField;
    qryOpcoesVLRSTRIKEPUT: TFloatField;
    qryOpcoesVLRPONTO: TFloatField;
    qryOpcoesSTATPAMERICANA: TStringField;
    qryOpcoesSTAOPCCOMPRA: TStringField;
    qryOpcoesTIPCOTVENC: TStringField;
    qryIDINVESTIMENTO: TFloatField;
    qryOpcoesIDTIPOOPCAO: TFloatField;
    dblCarteiraSPC: TwwDBLookupCombo;
    Label19: TLabel;
    qryCarteiraSPC: TwwQuery;
    qryCarteiraSPCDESCARTEIRASPC: TStringField;
    qryCarteiraSPCIDCARTEIRASPC: TFloatField;
    qryIDCARTEIRASPC: TFloatField;
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    bDadosValidos: Boolean;
    procedure Sel(iOpcao: Integer);
  public
    { Public declarations }
  end;

var
  frmCadOpcoesIndice: TfrmCadOpcoesIndice;

implementation

uses
   UmensErro, UDataBase, dBaseDados, UOperComum;

{$R *.DFM}

procedure TfrmCadOpcoesIndice.Sel(iOpcao: Integer);
begin
   OperComum.LimpaParametros(qry);
   qry.ParamByName('IDOPCAO').AsInteger := iOpcao;
   qry.Open;
   OperComum.LimpaParametros(qryOpcoes);
   qryOpcoes.ParamByName('IDOPCAO').AsInteger := iOpcao;
   qryOpcoes.Open;
end;

procedure TfrmCadOpcoesIndice.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  if dbeNomeOpcao.CanFocus then
     dbeNomeOpcao.SetFocus;
end;

procedure TfrmCadOpcoesIndice.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor  then
      Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadOpcoesIndice.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   try
      if Trim(dbeNomeOpcao.Text) = '' then
      begin
         if dbeNomeOpcao.CanFocus then
            dbeNomeOpcao.SetFocus;
         Raise Exception.Create('O Nome da Opção deve ser informado.');
      end;

      if Trim(dbdVencimento.Text) = '' then
      begin
         if dbdVencimento.CanFocus then
            dbdVencimento.SetFocus;
         Raise Exception.Create('O Vencimento da Opção deve ser informado.');
      end;

      if dbrVlrExercicio.Value = 0 then
      begin
         if dbrVlrExercicio.CanFocus then
            dbrVlrExercicio.SetFocus;
         Raise Exception.Create('O Preço de Exercício da Opção deve ser informado.');
      end;

      if dbreStrikePut.Value = 0 then
      begin
         if dbreStrikePut.CanFocus then
            dbreStrikePut.SetFocus;
         Raise Exception.Create('O Valor de Strike Put deve ser informado.');
      end;

      if dbrePonto.Value = 0 then
      begin
         if dbrePonto.CanFocus then
            dbrePonto.SetFocus;
         Raise Exception.Create('O Valor de Ponto deve ser informado.');
      end;

      Accept := True;
      bDadosValidos := True;
   except
      on E:Exception do
      begin
         Accept := False;
         bDadosValidos := False;
         MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning,[MbOk],0);
         Exit;
      end;
   end;
end;

procedure TfrmCadOpcoesIndice.bbtnConfirmarClick(Sender: TObject);
begin
   // Força uma saida do controle ativo para gravar as alterações
   SelectNext(ActiveControl,True,True);
   CmeCadastro.RepetirInsert := False;
   inherited;

   // Se não houve problemas na validação dos dados
   if bDadosValidos then
   begin
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;
      Try
         qry.ApplyUpdates;
         qry.CommitUpdates;
         qryOpcoes.ApplyUpdates;
         qryOpcoes.CommitUpdates;
         dtmBaseDados.dbBaseDados.Commit;
      except
         begin
            dtmBaseDados.dbBaseDados.Rollback;
            MsgDlg('Ocorreu problema ao incluir a Opção.','Mensagem do Sistema ',mtWarning,[mbOK],0);
         end;
      end;
   end;
end;

procedure TfrmCadOpcoesIndice.FormShow(Sender: TObject);
begin
  inherited;
  Sel(-1);
  qryCarteiraSPC.Open;
end;

procedure TfrmCadOpcoesIndice.CmeCadastroInsert(Sender: TObject);
var iInvestimento: Integer;
begin
   inherited;
   qryIDTIPOINVEST.AsInteger := 2;
   qryFLGATIVO.AsString := 'S';
   qrySTAOPCAO.AsString := 'S';

   qryOpcoes.Insert;
   qryOpcoesIDTIPOOPCAO.AsInteger := 1;
   qryOpcoesSTAOPCCOMPRA.AsString := 'S';
   qryOpcoesSTATPAMERICANA.AsString := 'S';
   qryOpcoesTIPCOTVENC.AsString := 'M';

   if ds.DataSet.State in [dsInsert] then
      qry.FieldByName('IDINVESTIMENTO').AsInteger := LeUltRegistro(nil,'INVESTIMENTO');

   if dsOpcoes.DataSet.State in [dsInsert] then
   begin
      qryOpcoes.FieldByName('IDOPCAO').AsInteger := LeUltRegistro(nil,'OPCOES');
      qryOpcoes.FieldByName('IDINVESTIMENTO').AsInteger := qry.FieldByName('IDINVESTIMENTO').AsInteger;
   end;

end;

procedure TfrmCadOpcoesIndice.sbtnApagarClick(Sender: TObject);
var iOpcao: Integer;
begin
   iOpcao := qryOpcoesIDOPCAO.AsInteger;
   try
      if (MsgDlg('Deseja realmente excluir esta Opção?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
      begin
         if not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;

         qryOpcoes.Delete;
         qryOpcoes.ApplyUpdates;
         qryOpcoes.CommitUpdates;

         qry.Delete;
         qry.ApplyUpdates;
         qry.CommitUpdates;

         dtmBaseDados.dbBaseDados.Commit;
         Sel(-1);
      end else
         // Posiciona no mesmo registro
         Sel(iOpcao);
   except
      begin
         dtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Ocorreu problema ao excluir a Opção.','Mensagem do Sistema ',mtWarning,[mbOK],0);
         // Posiciona no mesmo registro
         Sel(iOpcao);
      end;
   end;
   CmeCadastro.AtualizaBotoes(Self);
   sbtnApagar.Down := False;
end;

procedure TfrmCadOpcoesIndice.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   qryOpcoes.Cancel;
   qryOpcoes.CancelUpdates;
end;

procedure TfrmCadOpcoesIndice.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   qryOpcoes.Edit;
   if dbeNomeOpcao.CanFocus then
      dbeNomeOpcao.SetFocus;
end;

procedure TfrmCadOpcoesIndice.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   qryCarteiraSPC.Close;
end;

end.
